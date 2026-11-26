return {
	registerFoundationComponents = require(script.System.registerFoundationComponents),
	SduiIcon = require(script.Components.SduiIcon),
	SduiSkeleton = if require(script.Parent.SharedFlags).FFlagMigrateSduiSkeleton then nil else require(script.Components.SduiSkeleton),
	["jest.config"] = script["jest.config"]
}