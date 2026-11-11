local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local MusicOverlayModule = require(MomentsCreation.Components.MusicOverlay)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames

return {
	kind = "music",
	presentation = "Overlay",
	zIndex = 2,
	step = require(MomentsCreation.Enums.CreationFlowState).Music,
	cta = {
		localizationKey = "Feature.Moments.Action.AddMusic",
		order = 2,
		icon = require(Parent.BuilderIcons).Icon.MusicNote,
		analyticsEvent = EventNames.EditingFlowMusicButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowMusicDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowMusicBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video, Enum.CaptureType.Screenshot },
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: ReactModule (copy), MusicOverlayModule (copy)
		return ReactModule.createElement(MusicOverlayModule, { controller = Controller })
	end,
	toEdits = function(Music)
		return { music = Music }
	end
}