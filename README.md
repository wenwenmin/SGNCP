## Introduction
Sparse nonnegative CP decomposition is one of the most popular tools for tensor data representation.  However, most existing sparse NCP (nonnegative CP decomposition) methods promote the sparsity of the factor matrices by using a relaxation scheme of $\ell_{0}$-norm regularization, as the $\ell_{0}$-norm is nonconvex and nonsmooth. This prevents these sparse NCP methods from directly and explicitly controlling the sparsity of the factor matrices, reducing the feature extraction ability. 
To overcome this defect,  we propose a novel sparse and graph-regularized nonnegative CP decomposition with $\ell_{0}$-norm constraints ($\ell_{0}$-SGNCP) method, which directly employs the $\ell_{0}$-norm constraints to explicitly control the sparsity of the factor matrices in NCP.  Furthermore, $\ell_{0}$-SGNCP incorporates graph regularization to preserve the manifold structure of data. 
Although the nonconvex nature of NCP and the nonconvex and nonsmooth nature of the $\ell_{0}$-norm constraints make optimizing $\ell_{0}$-SGNCP an NP-hard problem, we propose an Alternating Proximal Gradient Linearized (APGL) algorithm to directly solve the original $\ell_{0}$-SGNCP instead of solving its relaxed version. 
We also establish the global convergence of our proposed algorithm and analyze the per-iteration complexity. Experimental results on six real-world image datasets show that our method outperforms some state-of-the-art methods for clustering.  

This package contains code for the $\ell_0$-SGNCP problem in the paper[<sup>1</sup>](#refer-id). 

## Matlab code
A toy example explains how to use the these function. For "L0SGNCP", before running it, first add the toolbox 'tensortoolbox'[<sup>2</sup>](#refer-id) (www.tensortoolbox.org) to the running path of matlab, and then run the function '[main_Run_me.m](L0SGNCP/main_Run_me.m)'. 


## Data
This code has built-in some data mentioned in our paper[<sup>1</sup>](#refer-id), and the rest of the data can be downloaded from the mentioned public website. 

## Reference
<div id="refer-id"></div>
[1] Sparse nonnegative CP decomposition with graph regularization and ℓ0-constraints for clustering. 

[2] Brett W. Bader and Tamara G. Kolda. 2006. Algorithm 862: MATLAB tensor classes for fast algorithm prototyping. ACM Trans. Math. Softw. 32, 4 (December 2006), 635–653. https://doi.org/10.1145/1186785.1186794

 
