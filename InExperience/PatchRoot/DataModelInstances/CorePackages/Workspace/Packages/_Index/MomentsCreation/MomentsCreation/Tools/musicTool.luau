local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local musicOverlayModule = require(momentsCreation.Components.MusicOverlay)
local musicPickerV2ContainerModule = require(momentsCreation.Components.MusicPickerV2Container)
local fFlagMomentsCreationMusicPickerV2Module = require(momentsCreation.Flags.FFlagMomentsCreationMusicPickerV2)
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
	createSession = function()
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p1)
		-- upvalues: fFlagMomentsCreationMusicPickerV2Module (ref), reactModule (ref), musicPickerV2ContainerModule (ref), musicOverlayModule (ref)
		return if fFlagMomentsCreationMusicPickerV2Module then reactModule.createElement(musicPickerV2ContainerModule, { controller = p1 }) else reactModule.createElement(musicOverlayModule, { controller = p1 })
	end,
	toEdits = function(p1)
		return { music = p1 }
	end
}