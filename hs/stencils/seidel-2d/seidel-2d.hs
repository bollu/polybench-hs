import Data.Vector.Unboxed as V

initarray :: int -> vector double
initarray i = undefined

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

type Steps = Int;
type Size = Int;
type Ix = Int;

ix2d :: Vector Double ->  Size -> (Ix, Ix) -> Double
ix2d v sj (i, j) = v `V.unsafeIndex` (i*sj+j)

repeatN :: Int -> (Vector Double -> Vector Double) -> Vector Double -> Vector Double
repeatN 0 f v = v
repeatN n f v = repeatN (n-1) f (f v)

stencil ::  Vector Double -> Size -> (Ix, Ix) -> (Ix, Double)
stencil v n (i, j) = 
  let val = (ix2d v n (i-1, j-1) +
           ix2d v n (i-1, j) +
           ix2d v n (i-1, j+1) +
           ix2d v n (i, j-1) +
           ix2d v n (i, j) +
           ix2d v n (i, j+1) + 
           ix2d v n (i+1, j-1) + 
           ix2d v n (i+1, j) + 
           ix2d v n (i+1, j+1)) / 9.0
 in (i*n+j, val)

iterspace :: Size -> Vector (Int, Int)
iterspace n = V.fromList $ do 
  i <- [0..(n-1)]
  j <- [0..(n-1)]
  return (i, j)

-- | can't write 2D matrix? this is literally just vectors.
kernel_seidel_2d :: Steps -> Size -> Vector Double -> Vector Double
kernel_seidel_2d tsteps n v =
  let ixs = iterspace n
      upds = V.map (stencil v n) ixs 
  in repeatN tsteps (\v -> V.update v upds) v