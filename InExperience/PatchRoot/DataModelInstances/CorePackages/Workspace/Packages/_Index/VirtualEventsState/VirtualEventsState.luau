local _ = require(script.types)

return {
	RoduxKey = "VirtualEvents",
	installReducer = require(script.installReducer),
	enums = require(script.enums),
	network = require(script.network),
	ExperienceDetailsModel = require(script.Models.ExperienceDetailsModel),
	ExperienceMediaModel = require(script.Models.ExperienceMediaModel),
	["jest.config"] = script["jest.config"]
}