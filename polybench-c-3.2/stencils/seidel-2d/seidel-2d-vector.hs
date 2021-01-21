import GHC.Prim
import Gauge.Main
import Data.Vector.Unboxed.Mutable as M
import Data.Vector.Unboxed  as V
import Control.Monad
import Data.Word
import System.Random.Stateful
import Data.Binary
import Data.Vector.Binary
import Data.Binary.Put
import qualified Data.ByteString.Lazy as B
import Data.Bits

type Vec = MVector GHC.Prim.RealWorld Double


-- static void init_array (int n,
-- 		 DATA_TYPE POLYBENCH_2D(A,N,N,n,n))
-- {
--   int i, j;
-- 
--   for (i = 0; i < n; i++)
--     for (j = 0; j < n; j++)
--       A[i][j] = ((DATA_TYPE) i*(j+2) + 2) / n;
-- }

int2double :: Int -> Double; int2double = fromIntegral;

ixval :: Size -> (Ix, Ix) -> Double
ixval n (i, j) = (int2double (i * (j + 2) + 2)) / (int2double n)


type Steps = Int;
type Size = Int;
type Ix = Int;

repeatN :: Int -> IO () -> IO ()
repeatN 0 f = return ()
repeatN n f = f >> repeatN (n-1) f

-- static void kernel_seidel_2d(int tsteps,
-- 		      int n,
-- 		      DATA_TYPE POLYBENCH_2D(A,N,N,n,n))
-- {
--   int t, i, j;
-- 
-- #pragma scop
--   for (t = 0; t <= _PB_TSTEPS - 1; t++)
--     for (i = 1; i<= _PB_N - 2; i++)
--       for (j = 1; j <= _PB_N - 2; j++)
-- 	A[i][j] = (A[i-1][j-1] + A[i-1][j] + A[i-1][j+1]
-- 		   + A[i][j-1] + A[i][j] + A[i][j+1]
-- 		   + A[i+1][j-1] + A[i+1][j] + A[i+1][j+1])/9.0;
-- #pragma endscop
-- 
-- }

ix2d :: Vec -> Size -> (Ix, Ix) -> IO Double
ix2d v n (i,j) = unsafeRead v (i*n+j)


stencil ::  Vec -> Size -> (Ix, Ix) -> IO () -- (Ix, Double)
stencil v n (i, j) = do
 vll <- ix2d v n (i-1, j-1)
 vlm <- ix2d v n (i-1, j)
 vlr <- ix2d v n (i-1, j+1)

 vml <- ix2d v n (i, j-1)
 vmm <- ix2d v n (i, j)
 vmr <- ix2d v n (i, j+1)

 vrl <- ix2d v n (i+1, j-1)
 vrm <- ix2d v n (i+1, j)
 vrr <- ix2d v n (i+1, j+1)
 unsafeWrite v (i*n+j) $ (vll+vlm+vlr+vml+vmm+vmr+vrl+vrm+vrr)/9.0

encodeVecToFile :: String -> Vec -> IO ()
encodeVecToFile f vs = do
  ws <- V.freeze vs
  B.writeFile f $ runPut $ (genericPutVectorWith (putInt32le . fromIntegral) putDoublele ws)

kernelj :: Size -> Ix -> Ix ->  Vec -> IO ()
kernelj n i j v
  | n - 1 == j = return ()
  | otherwise = do
    stencil v n (i, j)
    kernelj n i (j + 1) v


kerneli :: Size -> Int ->  Vec -> IO ()
kerneli n i v
  | n - 1 == i = return ()
  | otherwise = do
       kernelj n i 1 v
       kerneli n (i+1) v 
    

-- | can't write 2D matrix? this is literally just vectors.
kernel :: Steps -> Size -> Vec -> IO ()
kernel tsteps n v =
  repeatN tsteps (kerneli n 1 v)

--- | j runs faster than i as an index.
initarray :: Int -> IO Vec
initarray n = do
  v <- M.replicate (n*n) 0.0
  Control.Monad.forM_ [0..(n-1)] $ \i -> 
    Control.Monad.forM_ [0..(n-1)] $ \j -> 
        unsafeWrite v (i*n+j)  $ (int2double (i * (j + 2) + 2)) / (int2double n)
  return v
    -- V.fromList $ [ ixval n (i, j) | i <- [0..(n-1)], j <- [0..(n-1)]]

main :: IO ()
main = do
   let n = 4000
   let tsteps  = 100
   arr <- initarray n
   encodeVecToFile "in-hs-vector.bin" arr
   kernel tsteps n arr
   encodeVecToFile "out-hs-vector.bin" arr
