% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph-xxx2yyy.R
\name{graph-xxx2yyy}
\alias{M2adjList}
\alias{M2dagList}
\alias{M2graphNEL}
\alias{M2igraph}
\alias{M2ugList}
\alias{MAT2dgCMatrix}
\alias{MAT2matrix}
\alias{adjList2M}
\alias{adjList2adjMAT}
\alias{as.adjMAT}
\alias{dagList2M}
\alias{dagList2graphNEL}
\alias{dagList2tfM}
\alias{glist2adjMAT}
\alias{graph-xxx2yyy}
\alias{graphNEL2M}
\alias{graphNEL2MAT}
\alias{graphNEL2adjMAT}
\alias{graphNEL2dgCMatrix}
\alias{graphNEL2ftM}
\alias{graphNEL2igraph}
\alias{graphNEL2matrix}
\alias{graphNEL2tfM}
\alias{ug2dag}
\alias{ugList2M}
\alias{ugList2graphNEL}
\alias{vpaL2tfM}
\alias{vpaList2adjMAT}
\title{Graph, matrix and generating class coercions}
\usage{
graphNEL2M(gn, result = "matrix")

graphNEL2MAT(gn, limit = 100)

graphNEL2ftM(gn)

graphNEL2tfM(gn)

graphNEL2igraph(gn)

M2igraph(amat)

M2graphNEL(amat)

M2adjList(amat)

M2ugList(amat)

M2dagList(amat)

ugList2graphNEL(glist, vn = NULL)

ugList2M(glist, vn = NULL, result = "matrix")

dagList2graphNEL(glist, vn = NULL)

dagList2M(glist, vn = NULL, result = "matrix")

adjList2M(alist, result = "matrix")

dagList2tfM(glist)

as.adjMAT(gn, result = "matrix")

ug2dag(gn)

MAT2matrix(mat)

MAT2dgCMatrix(mat)
}
\arguments{
\item{gn}{A graphNEL object}

\item{result}{Either \code{"matrix"} or \code{"dgCMatrix"} (for a
sparse matrix representation)}

\item{limit}{If number of nodes is larger than \code{limit}, the
result will be a sparse dgCMatrix; otherwise a dense matrix.}

\item{amat}{Adjacency matrix}

\item{glist}{A list of generators where a generator is a character
vector. If interpreted as generators of an undirected graph, a
generator is a complete set of vertices in the graph. If
interpreted as generators of a dag, a generator (v1,...,vn)
means that there will be arrows from v2,...,vn to v1.}

\item{vn}{The names of the vertices in the graphs. These will be
the row and column names of the matrix}

\item{alist}{An adjacency list.}

\item{mat}{Either a dense matrix or a sparse dgCMatrix.}
}
\value{
An adjacency matrix (or \code{NULL} if \code{glist} has
    length 0)
}
\description{
Graph and matrix coercions where speed is an issue.
}
\examples{

glist <- list(1:3, 2:4, 4:5)
am1 <- ugList2M( glist )
am2 <- dagList2M( glist )
if (interactive()){
  plot(as(am1, "graphNEL"))
  plot(as(am2, "graphNEL"))
}


## Sparse and dense adjacency matrices converted to igraph
g1 <- ug(~a:b + b:c + c:d, result="matrix")
g2 <- ug(~a:b + b:c + c:d, result="dgCMatrix")
plot( M2igraph( g1 ) )
plot( M2igraph( g2 ) )

## Sparse and dense adjacency matrices converted to graphNEL
g1 <- ug(~a:b + b:c + c:d, result="matrix")
g2 <- ug(~a:b + b:c + c:d, result="dgCMatrix")
M2graphNEL( g1 )
M2graphNEL( g2 )

## Sparse and dense adjacency matrices converted to adjacency list 
g1 <- ug(~a:b + b:c + c:d, result="matrix")
g2 <- ug(~a:b + b:c + c:d, result="dgCMatrix")
M2adjList( g1 )
## M2adjList( g2 ) FAILS for sparse matrix

## Sparse and dense adjacency matrices converted to cliques
g1 <- ug(~a:b + b:c + c:d, result="matrix")
g2 <- ug(~a:b + b:c + c:d, result="dgCMatrix")
M2ugList( g1 )
M2ugList( g2 ) 

## Sparse and dense adjacency matrices converted to cliques
g1 <- ug(~a:b + b:c + c:d, result="matrix")
g2 <- ug(~a:b + b:c + c:d, result="dgCMatrix")
M2dagList( g1 )
## M2dagList( g2 ) ## Fails for sparse matrix

g1 <- dag(~a:b + b:c + c:d, result="matrix")
g2 <- dag(~a:b + b:c + c:d, result="dgCMatrix")
M2dagList( g1 )
## M2dagList( g2 ) ## FIXME Fails for sparse matrix

}
\author{
Søren Højsgaard, \email{sorenh@math.aau.dk}
}
\seealso{
\code{\link{ug}}, \code{\link{dag}}
}
\keyword{utilities}

