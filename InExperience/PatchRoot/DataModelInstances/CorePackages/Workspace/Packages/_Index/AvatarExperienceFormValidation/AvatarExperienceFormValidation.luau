return {
	["jest.config"] = script["jest.config"],
	buildFormValidator = require(script.buildFormValidator),
	Validators = {
		String = {
			isNotWhitespace = require(script.Validators.String.isNotWhitespace),
			buildIsShorterThanOrEqualTo = require(script.Validators.String.buildIsShorterThanOrEqualTo)
		},
		isNotNull = require(script.Validators.isNotNull)
	},
	FormValidationErrorEnum = require(script.FormValidationErrorEnum)
}