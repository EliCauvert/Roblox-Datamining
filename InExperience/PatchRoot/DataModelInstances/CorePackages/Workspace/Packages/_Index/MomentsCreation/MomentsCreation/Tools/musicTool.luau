local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local MomentTypeModule = require(MomentsCreation.Enums.MomentType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local MusicOverlayModule = require(MomentsCreation.Components.MusicOverlay)
local MusicPickerV2ContainerModule = require(MomentsCreation.Components.MusicPickerV2Container)
local FFlagMomentsCreationMusicPickerV2Module = require(MomentsCreation.Flags.FFlagMomentsCreationMusicPickerV2)
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
	supportedMomentTypes = if require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts then { MomentTypeModule.Avatar } else nil,
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: FFlagMomentsCreationMusicPickerV2Module (copy), ReactModule (copy), MusicPickerV2ContainerModule (copy), MusicOverlayModule (copy)
		return if FFlagMomentsCreationMusicPickerV2Module then ReactModule.createElement(MusicPickerV2ContainerModule, { controller = Controller }) else ReactModule.createElement(MusicOverlayModule, { controller = Controller })
	end,
	toEdits = function(Music)
		return { music = Music }
	end
}