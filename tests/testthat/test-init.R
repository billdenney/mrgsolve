# Copyright (C) 2013 - 2019  Metrum Research Group, LLC
#
# This file is part of mrgsolve.
#
# mrgsolve is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# mrgsolve is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with mrgsolve.  If not, see <http://www.gnu.org/licenses/>.

library(testthat)
library(mrgsolve)
library(dplyr)
Sys.setenv(R_TESTS="")
options("mrgsolve_mread_quiet"=TRUE)

test_that("inits are constructed", {
  x <- init(A = 1, B = 2)  
  expect_is(x, "cmt_list")
  x <- init(list(A = 1, B = 2))
  expect_is(x, "cmt_list")
  x <- init(c(A = 1, B = 2))
  expect_is(x, "cmt_list")
  expect_error(init(A = c(1,2)))
  expect_error(init(A = "B"))
})

test_that("inits are shown", {
  mod <- mrgsolve:::house()
  x <- capture.output(init(mod))
  expect_match(x[2], "Model initial conditions")
})


