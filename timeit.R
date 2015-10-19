timeit <- function(f, ..., reps=100){
  ptm <- proc.time()
  for(i in 1:reps){
    f(...)
  }
  proc.time()-ptm
}