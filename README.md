# Scientific computation
Assignments for Scientific Computation course.
## Exercise 2 (Block Compressed Row Storage (BCRS))
* Function sp_mx2bcrs

  Given an integer (block size) nb and a square sparse matrix A, it returns the BCRS representation.
* Function spmv_bcrs

  This function computes the update: y <- y + Ax.
## Exercise 3 (Tensors)
* tensor_paths.m

  This function takes as inputs an adjacency matrix A and an integer k which is the maximum length of a path, from node i to node j and it returns a tensor G, where  G(:, :, n=1:k) = A^n.
* get_nodes_path.m

  It takes as input the tensor G and 2 nodes (integers) i, j. Using the above tensor, it calculates with operations defined in the MTT, the number of paths of length up   to k between the nodes i, j.
* get_all_paths.m

  It takes as input the tensor G. Using the above tensor, it calculates with operations defined in the MTT, the number of paths of length up to k between all the nodes i, j.
  
**Note: For this exercise [Tensor Toolbox for Matlab (MTT)](https://gitlab.com/tensors/tensor_toolbox) is required.**
## Exercise 4 (Matrix Stats)

  Ιt creates statistics related to bandedness rank and other elements of interest to many matrices. The function P = band_stats (mxid, p)
  works as follows:
  
  - If mxid is an integer, then it selects the matrix with number equals to mxid from the SuiteSparse collection.
  
  - If mxid is a string then it selects the matrix with that name from the same collection.
  
  - If a matrix corresponding to this name or number, doesn't exist, then it returns an error. 
  
  - If mxid is an array, then it uses this matrix.
  
  After that, it forms the bandwidth matrix from k = 1, 3, ..., 2p - 1 formed by the selected matrix, let A^(k), and for each k, the number of non-zero items is returned containing the sub-matrix in relation to A, i.e. rnnz = nnz (A ^ (k)) / nnz (A), as well as the relative error rerr = ∥A - A ^ (k) ∥ / ∥A∥ as to Frobenius norm. The function returns the values rnnz, rerr in array P.
 
## Exercise 5 (Iterative methods)
5.1 **Special matrices (exercise 5_1.m)**
1. The linear system Ax = b with the commands

   `n = 500; A = spdiags ([1: n]’, [0], n, n); xsol = ones (n, 1); b = A * xsol` is given.

    Then, we solve the system with tol = 1e-6 and maximum number of iterations 4 * n, initial guess for the solution vector x, a vector of zeros and the pcg method. Also, we plot the process of convergence (or not) in a diagram, the number of iterations as to
  the norm-2 of the relative residual. In the final step, we find the norm-2 error for each matrix and we calculate the total number of matrix-vector multiplications till convergence for each matrix (if it converges).

2. The same experiment was repeated for the following problem:
`n = 500; A = spdiags ([linspace (1,2, n / 2)’; linspace (1000,1001, n / 2)’], [0], n, n); xsol = ones (n, 1); b = A * xsol`.

5.2 **Random matrices (exercise 5_2.m)**

The questions are the same as before, but we are expanding the type of matrices and solution methods. In particular, the linear system with the commands `n = 500; A = randn (n); xsol = rand (n, 1); b = A * x` is given. Then, we solve the system Ax = b with tol = 1e-6 and maximum number of iterations 4 * n, using the following methods, without preconditioning and with initial guess for the solution vector x, a vector of zeros. 
1. pcg on normal equations.
2. gmres (m) (where m = 100 is the restart.)
3. gmres (n)

Moreover, the process of convergence (or not) is plotted in a diagram (the number of iterations in relation to norm-2 of the relative residual) as well as the norm-2 of the error in the last step. Also, we calculate the total number of matrix-vector multiplications as to the convergence of each method (if it converges).
