local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local getFFlagMomentsTextGenTonePickerModule = require(momentsCreation.Flags.GetFFlagMomentsTextGenTonePicker)

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
	isAvailable = function(p0) --[[ line: 26 ]]
		return p0.canGenerateText == true
	end,
	apply = function(p1) --[[ line: 29 ]]
		-- upvalues: getFFlagMomentsTextGenTonePickerModule (ref), dialogTypeModule (ref)
		local var5 = if getFFlagMomentsTextGenTonePickerModule() then game:GetEngineFeature("CaptureServiceMomentTextTone") or game:GetService("RunService"):IsStudio() else getFFlagMomentsTextGenTonePickerModule()
		
		if var5 then
			p1.showModal({
				modalType = dialogTypeModule.GenerateTextOptions,
				modalProps = {
					showTone = var5,
					onSelect = function(p2) --[[ line: 44 ]]
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