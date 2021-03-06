% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-repositories.R
\name{get_repositories}
\alias{get_repositories}
\title{Returns repositories of a gitea service}
\usage{
get_repositories(base_url, api_key)
}
\arguments{
\item{base_url}{The base URL for your gitea server (no trailing '/')}

\item{api_key}{The user's API token key for the gitea service}
}
\description{
Returns the repositories of the Gitea application
}
\examples{
\dontrun{
get_repositories(base_url = "https://example.gitea.service.com",
                 api_key = "ccaf5c9a22e854856d0c5b1b96c81e851bafb288")
}
}
