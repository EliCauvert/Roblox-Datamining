local _ = require(script.Analytics.AnalyticsTypes)

return {
	["jest.config"] = script["jest.config"],
	Constants = require(script.Common.Constants),
	Enums = require(script.Common.Enums),
	Entry = require(script.Components.SocialCarouselEntry),
	Flags = require(script.Flags)
}