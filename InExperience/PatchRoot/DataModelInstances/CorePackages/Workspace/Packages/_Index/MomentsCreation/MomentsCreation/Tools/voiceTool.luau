local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local VoiceEditorModule = require(MomentsCreation.Components.Voice.VoiceEditor)
local VoicePreviewLayerModule = require(MomentsCreation.Components.Voice.VoicePreviewLayer)

return {
	kind = "voice",
	presentation = "Step",
	zIndex = 4,
	step = require(MomentsCreation.Enums.CreationFlowState).Voice,
	cta = {
		localizationKey = "Feature.Moments.Action.AddVoice",
		order = 4,
		commitRequiresEdit = true,
		icon = require(Parent.BuilderIcons).Icon.FiveVerticalLinesWave,
		analyticsEvent = EventNames.EditingFlowVoiceButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowVoiceDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowVoiceDeleteChangePressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: ReactModule (copy), VoiceEditorModule (copy)
		return ReactModule.createElement(VoiceEditorModule, { layoutOrder = 2, controller = Controller })
	end,
	renderPreviewLayer = function(Controller, Ctx)
		-- upvalues: ReactModule (copy), VoicePreviewLayerModule (copy)
		return ReactModule.createElement(VoicePreviewLayerModule, { zIndex = 4, controller = Controller, ctx = Ctx })
	end,
	toEdits = function(Tts)
		return if Tts == nil or Tts.text == "" then {} else { tts = Tts }
	end
}