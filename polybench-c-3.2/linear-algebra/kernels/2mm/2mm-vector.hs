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


int2double :: Int -> Double; int2double = fromIntegral;

ixval :: Size -> (Ix, Ix) -> Double
ixval n (i, j) = (int2double (i * (j + 2) + 2)) / (int2double n)


type Steps = Int;
type Size = Int;
type Ix = Int;

repeatN :: Int -> IO () -> IO ()
repeatN 0 f = return ()
repeatN n f = f >> repeatN (n-1) f


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

initarray :: (Int, Int, Int, Int) -> IO (Double, Double, Vec, Vec, Vec, Vec)
initarray (ni, nj, nk, nl) = do
  let alpha = 32412
  let beta = 2123
  a <- M.replicate (ni*nk) 0.0
  b <- M.replicate (nk*nj) 0.0
  c <- M.replicate (nl*nj) 0.0
  d <- M.replicate (ni*nl) 0.0

  Control.Monad.forM_ [0..(ni-1)] $ \i -> 
    Control.Monad.forM_ [0..(nk-1)] $ \j -> 
        unsafeWrite a (i*nk+j)  $ (int2double (i * j) / (int2double ni))

  Control.Monad.forM_ [0..(nk-1)] $ \i -> 
    Control.Monad.forM_ [0..(nj-1)] $ \j -> 
        unsafeWrite b (i*nj+j)  $ (int2double (i * (j+1)) / (int2double nj))

  Control.Monad.forM_ [0..(nl-1)] $ \i -> 
    Control.Monad.forM_ [0..(nj-1)] $ \j -> 
        unsafeWrite c (i*nj+j)  $ (int2double (i * (j+3)) / (int2double nl))

  Control.Monad.forM_ [0..(ni-1)] $ \i -> 
    Control.Monad.forM_ [0..(nl-1)] $ \j -> 
        unsafeWrite d (i*nj+j)  $ (int2double (i * (j+2)) / (int2double nk))

  return (alpha, beta, a, b, c, d)
    -- V.fromList $ [ ixval n (i, j) | i <- [0..(n-1)], j <- [0..(n-1)]]

main :: IO ()
main = do
   let (ni, nj, nk, nl) =  (1024, 1024, 1024, 1024)
   (alpha, beta, a, b, c, d) <- initarray (ni, nj, nk, nl)
   encodeVecToFile "a-in-hs-vector.bin" a
   encodeVecToFile "b-in-hs-vector.bin" b
   encodeVecToFile "c-in-hs-vector.bin" c
   encodeVecToFile "d-in-hs-vector.bin" d
   -- kernel tsteps n arr
   -- encodeVecToFile "out-hs-vector.bin" arr
