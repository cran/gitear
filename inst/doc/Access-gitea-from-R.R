## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(gitear)
library(dplyr)
library(jsonlite)

r <- readRDS(system.file("helper_data/response_example.RDS",
                              package = "gitear"))

content_an_organization <- fromJSON(system.file("helper_data/get_an_org.json",
                                                package = "gitear"))

content_issues <- fromJSON(system.file("helper_data/get_issues.json",
                                      package = "gitear"))

content_list_repos_org <- fromJSON(system.file("helper_data/get_repos_org.json",
                                               package = "gitear"))

content_list_users <- fromJSON(system.file("helper_data/get_users.json",
                                           package = "gitear"))

content_commits <- fromJSON(system.file("helper_data/get_commits.json",
                                        package = "gitear"))


## ---- echo = FALSE------------------------------------------------------------
mockery::stub(where = get_issues,
              what = "GET",
              how = r)

mockery::stub(where = get_issues,
              what = "fromJSON",
              how = content_issues)

## -----------------------------------------------------------------------------
# Credentials

api_token <- "gfdsgfd8ba18a866bsdfgsdfgs3a2dc9303453b0c92dcfb19"
url_ixpantia <- "https://prueba.com"

# Example function use:

issues <- get_issues(base_url = url_ixpantia,
                       api_key = api_token,
                       owner = "empresa",
                       repo = "repo_prueba")

glimpse(issues)

## -----------------------------------------------------------------------------
example_key <- Sys.getenv("example_key")
example_url <- Sys.getenv("example_url")

## ---- echo = FALSE------------------------------------------------------------
mockery::stub(where = get_an_organization,
              what = "GET",
              how = r)

mockery::stub(where = get_an_organization,
              what = "fromJSON",
              how = content_an_organization)

## -----------------------------------------------------------------------------
# Example function use

organizations <- get_an_organization(base_url = example_url,
                                     api_key = example_key,
                                     org = "empresa") 

glimpse(organizations)

## ---- echo = FALSE------------------------------------------------------------
mockery::stub(where = get_list_repos_org,
              what = "GET",
              how = r)

mockery::stub(where = get_list_repos_org,
              what = "fromJSON",
              how = content_list_repos_org)

## -----------------------------------------------------------------------------
# Example function use

repos <- get_list_repos_org(base_url = example_url, 
                            api_key = example_key, 
                            org = "empresa")

glimpse(repos)

## ---- echo = FALSE------------------------------------------------------------
mockery::stub(where = get_list_users,
              what = "GET",
              how = r)

mockery::stub(where = get_list_users,
              what = "fromJSON",
              how = content_list_users)

## -----------------------------------------------------------------------------
# Example function use

users <- get_list_users(base_url = example_url, 
                        api_key = example_key)

glimpse(users)

## ---- echo = FALSE------------------------------------------------------------
mockery::stub(where = get_commits,
              what = "GET",
              how = r)

mockery::stub(where = get_commits,
              what = "fromJSON",
              how = content_commits)

## -----------------------------------------------------------------------------
# Example function use

commits <- get_commits(base_url = example_url, 
                     api_key = example_key,
                     owner = "empresa",
                     repo = "repo_prueba")

head(commits)

