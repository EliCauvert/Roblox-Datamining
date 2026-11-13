local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local GetFFlagMomentsTextGenTonePickerModule = require(MomentsCreation.Flags.GetFFlagMomentsTextGenTonePicker)
local GetFFlagMomentsGenerateTextInTextOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration

return {
	kind = "generateText",
	presentation = "InstantAction",
	cta = {
		localizationKey = "Feature.Moments.Action.GenerateText",
		icon = BuilderIconsModule.Icon.TagSparkle,
		analyticsEvent = MomentsCommonModule.Analytics.EventNames.EditingFlowGenerateTextButtonPressed,
		order = if GetFFlagEnableMomentTextGenerationFunction() then 5 else 4
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	isAvailable = function(p1): boolean
		-- upvalues: GetFFlagMomentsGenerateTextInTextOverlayModule (copy)
		return not GetFFlagMomentsGenerateTextInTextOverlayModule() and p1.canGenerateText == true
	end,
	apply = function(p1)
		-- upvalues: GetFFlagMomentsTextGenTonePickerModule (copy), DialogTypeModule (copy)
		local IsStudio = game:GetService("RunService"):IsStudio()
		local CaptureServiceMomentTextToneEngineFeature = GetFFlagMomentsTextGenTonePickerModule() and (game:GetEngineFeature("CaptureServiceMomentTextTone") or IsStudio)
		
		if CaptureServiceMomentTextToneEngineFeature then
			p1.showModal({
				modalType = DialogTypeModule.GenerateTextOptions,
				modalProps = {
					showTone = CaptureServiceMomentTextToneEngineFeature,
					onSelect = function(p2)
						-- upvalues: p1 (copy)
						p1.dismissModal()
						p1.generateText(p2)
					end,
					onCancel = p1.dismissModal
				}
			})
			
			return
		else
			p1.generateText()
		end
	end
}