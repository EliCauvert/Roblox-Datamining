local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local getFFlagMomentsTextGenTonePickerModule = require(momentsCreation.Flags.GetFFlagMomentsTextGenTonePicker)
local getFFlagMomentsGenerateTextInTextOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsGenerateTextInTextOverlay)

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
	isAvailable = function(p1)
		-- upvalues: getFFlagMomentsGenerateTextInTextOverlayModule (ref)
		return if getFFlagMomentsGenerateTextInTextOverlayModule() then false else p1.canGenerateText == true
	end,
	apply = function(p1)
		-- upvalues: getFFlagMomentsTextGenTonePickerModule (ref), dialogTypeModule (ref)
		local var1 = if getFFlagMomentsTextGenTonePickerModule() then game:GetEngineFeature("CaptureServiceMomentTextTone") or game:GetService("RunService"):IsStudio() else getFFlagMomentsTextGenTonePickerModule()
		
		if var1 then
			p1.showModal({
				modalType = dialogTypeModule.GenerateTextOptions,
				modalProps = {
					showTone = var1,
					onSelect = function(p2)
						-- upvalues: p1 (ref)
						p1.dismissModal()
						p1.generateText(p2)
					end,
					onCancel = p1.dismissModal
				}
			})
			
			return
		end
		p1.generateText()
	end
}