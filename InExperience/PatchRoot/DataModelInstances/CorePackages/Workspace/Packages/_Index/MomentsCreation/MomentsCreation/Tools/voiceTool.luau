local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local voiceEditorModule = require(momentsCreation.Components.Voice.VoiceEditor)
local voicePreviewLayerModule = require(momentsCreation.Components.Voice.VoicePreviewLayer)

return {
	kind = "voice",
	presentation = "Step",
	zIndex = 4,
	step = creationFlowStateModule.Voice,
	cta = {
		localizationKey = "Feature.Moments.Action.AddVoice",
		order = 4,
		icon = builderIconsModule.Icon.FiveVerticalLinesWave
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function() --[[ line: 29 ]]
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p0) --[[ line: 32 ]]
		-- upvalues: reactModule (ref), voiceEditorModule (ref)
		return reactModule.createElement(voiceEditorModule, { layoutOrder = 2, controller = p0 })
	end,
	renderPreviewLayer = function(p1, p2) --[[ line: 35 ]]
		-- upvalues: reactModule (ref), voicePreviewLayerModule (ref)
		return reactModule.createElement(voicePreviewLayerModule, { zIndex = 4, controller = p1, ctx = p2 })
	end,
	toEdits = function(p3) --[[ line: 38 ]]
		return if p3 == nil or p3.text == "" then {} else { tts = p3 }
	end
}