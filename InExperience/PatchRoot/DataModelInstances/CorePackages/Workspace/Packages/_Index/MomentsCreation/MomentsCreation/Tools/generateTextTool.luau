local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(momentsCreation.Types.CreationFlowTypes)

return {
	kind = "generateText",
	presentation = "InstantAction",
	cta = {
		localizationKey = "Feature.Moments.Action.GenerateText",
		order = 4,
		icon = require(parent.BuilderIcons).Icon.TagSparkle,
		analyticsEvent = require(parent.MomentsCommon).Analytics.EventNames.EditingFlowGenerateTextButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	isAvailable = function(p0) --[[ line: 22 ]]
		return p0.canGenerateText == true
	end,
	apply = function(p1) --[[ line: 25 ]]
		p1.generateText()
	end
}