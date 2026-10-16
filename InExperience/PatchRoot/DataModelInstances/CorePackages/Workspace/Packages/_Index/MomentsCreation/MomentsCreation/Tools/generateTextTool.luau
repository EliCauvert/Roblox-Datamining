local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local GetFFlagMomentsTextGenTonePickerModule = require(MomentsCreation.Flags.GetFFlagMomentsTextGenTonePicker)
local GetFFlagMomentsGenerateTextInTextOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)

return {
	kind = "generateText",
	presentation = "InstantAction",
	cta = {
		localizationKey = "Feature.Moments.Action.GenerateText",
		icon = require(Parent.BuilderIcons).Icon.TagSparkle,
		analyticsEvent = MomentsCommonModule.Analytics.EventNames.EditingFlowGenerateTextButtonPressed,
		order = if MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration() then 5 else 4
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	isAvailable = function(p1): boolean --[[ Line: 27 ]]
		-- upvalues: GetFFlagMomentsGenerateTextInTextOverlayModule (copy)
		return not GetFFlagMomentsGenerateTextInTextOverlayModule() and p1.canGenerateText == true
	end,
	apply = function(p1) --[[ Line: 35 ]]
		-- upvalues: GetFFlagMomentsTextGenTonePickerModule (copy), DialogTypeModule (copy)
		local IsStudio = game:GetService("RunService"):IsStudio()
		local CaptureServiceMomentTextToneEngineFeature = GetFFlagMomentsTextGenTonePickerModule() and (game:GetEngineFeature("CaptureServiceMomentTextTone") or IsStudio)
		
		if CaptureServiceMomentTextToneEngineFeature then
			p1.showModal({
				modalType = DialogTypeModule.GenerateTextOptions,
				modalProps = {
					showTone = CaptureServiceMomentTextToneEngineFeature,
					onSelect = function(p2) --[[ Line: 50 ]]
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