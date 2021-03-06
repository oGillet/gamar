% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as_experiment.R
\name{as_experiment}
\alias{as_experiment}
\title{Converting a data frame into an experiment}
\usage{
as_experiment(df, parameters = NULL, obsrates = NULL, tmax = "tmax",
  seed = "seed", experiment, model, dic = NULL)
}
\arguments{
\item{df}{A data frame containing values of paramters, periods of observation,
durations of simulation and seeds for an experiment.}

\item{parameters}{Names or indexes of columns of \code{df} corresponding to
values of parameters of the model specified in the
\code{model} \code{GAML} file. If unspecified, all the
columns with a name starting with "p_" will be considered.}

\item{obsrates}{Names or indexes of columns of \code{df} corresponding to
periods of observation for variables of the model specified
in the \code{model} \code{GAML} file. If unspecified, all
the columns with a name starting with "r_" will be considered.}

\item{tmax}{Name or index of the column of \code{df} that corresponds to the
durations of the simulations. If not specified, the column named
\code{tmax} will be considered.}

\item{seed}{Name or index of the column of \code{df} that corresponds to the
seeds of the simulations. If not specified, the column named
\code{seed} will be considered.}

\item{experiment}{The name of an experiment of the \code{GAML} file
\code{model}.}

\item{model}{The path to a \code{GAML} file.}

\item{dic}{A named vector of character strings. The values and the names of
this vector should be consistent with the names of
\code{parameters}, \code{obsrates} as well as the variables and
parameters defined in the \code{model} \code{GAML} file. See
Details for more information.}
}
\value{
An object of class \code{experiment}.
}
\description{
Converts a data frame into an experiment, using the columns of the data
frame to populate values of parameters, periods of observation, duration of
simulation and seeds of an object of class experiment.
}
\examples{
# A first example:
sir1 <- load_experiment("sir",
                        system.file("models", "sir.gaml", package = "gamar"))
df <- as.data.frame(repl(sir1, 5))
exp_name <- name(sir1)
gaml_file <- attr(sir1, "model")$path
as_experiment(df, experiment = exp_name, model = gaml_file)
# Alternative uses:
as_experiment(df, 1:5, 6:8, 9, 10, exp_name, gaml_file)
as_experiment(df, c("p_S0", "p_I0", "p_R0", "p_beta", "p_gamma"),
              c("r_S", "r_I", "r_R"), "tmax", "seed", exp_name, gaml_file)
# Or a mixture of character and numeric indexes:
as_experiment(df, 1:5, c("r_S", "r_I", "r_R"), "tmax", "seed", exp_name,
              gaml_file)
# And even using default parameters specification:
as_experiment(df, obsrates = c("r_S", "r_I", "r_R"),
              experiment = exp_name, model = gaml_file)

}
