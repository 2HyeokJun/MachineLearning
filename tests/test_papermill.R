context("papermill")

test_that("papermill exists", {
	expect_error({
		library(jsonlite)

		results <- system("papermill /input/tests/data/notebook.ipynb -",
			intern = TRUE)
		json <- fromJSON(results, simplifyVector = FALSE)
		expect_equal(json$cells[[1]]$outputs[[1]]$text[[1]], "[1] 999\n")
    }, NA) # expect no error to be thrown
})
