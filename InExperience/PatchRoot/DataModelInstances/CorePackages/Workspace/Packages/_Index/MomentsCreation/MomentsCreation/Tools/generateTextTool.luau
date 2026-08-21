local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return {
	kind = "generateText",
	presentation = "InstantAction",
	cta = {
		localizationKey = "Feature.Moments.Action.GenerateText",
		icon = builderIconsModule.Icon.TagSparkle,
		analyticsEvent = momentsCommonModule.Analytics.EventNames.EditingFlowGenerateTextButtonPressed,
		order = if momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration() then 5 else 4
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	isAvailable = function(p0) --[[ line: 24 ]]
		return p0.canGenerateText == true
	end,
	apply = function(p1) --[[ line: 27 ]]
		p1.generateText()
	end
}