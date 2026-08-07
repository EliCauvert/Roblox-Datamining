local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local musicOverlayModule = require(momentsCreation.Components.MusicOverlay)
local eventNames = momentsCommonModule.Analytics.EventNames

return {
	kind = "music",
	presentation = "Overlay",
	zIndex = 2,
	step = creationFlowStateModule.Music,
	cta = {
		localizationKey = "Feature.Moments.Action.AddMusic",
		order = 2,
		icon = builderIconsModule.Icon.MusicNote,
		analyticsEvent = eventNames.EditingFlowMusicButtonPressed,
		commitAnalyticsEvent = eventNames.EditingFlowMusicDoneButtonPressed,
		cancelAnalyticsEvent = eventNames.EditingFlowMusicBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video, Enum.CaptureType.Screenshot },
	createSession = function() --[[ line: 39 ]]
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p0) --[[ line: 42 ]]
		-- upvalues: reactModule (ref), musicOverlayModule (ref)
		return reactModule.createElement(musicOverlayModule, { controller = p0 })
	end,
	toEdits = function(p1) --[[ line: 45 ]]
		return { music = p1 }
	end
}