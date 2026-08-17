local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local eventNamesModule = require(momentsCommon.Analytics.EventNames)
local funnelEventNamesModule = require(momentsCommon.Analytics.FunnelEventNames)
local getFFlagMomentsCreationSaveDraftModule = require(momentsCommon.Flags.GetFFlagMomentsCreationSaveDraft)
local funnelTypes = funnelEventNamesModule.FunnelTypes
local creationFlowSteps = funnelEventNamesModule.CreationFlowSteps
local musicEnhancementSteps = funnelEventNamesModule.MusicEnhancementSteps
local trimEnhancementSteps = funnelEventNamesModule.TrimEnhancementSteps
local textOverlayEnhancementSteps = funnelEventNamesModule.TextOverlayEnhancementSteps
local stickerOverlayEnhancementSteps = funnelEventNamesModule.StickerOverlayEnhancementSteps
local draftRecoverySteps = funnelEventNamesModule.DraftRecoverySteps

return {
	[eventNamesModule.EditingFlowGalleryItemSelected] = {
		{
			funnelType = funnelTypes.CreationFlow,
			stepKey = creationFlowSteps.GalleryItemSelected
		}
	},
	[eventNamesModule.MomentsEditingFlowContinueToEditButtonPressed] = {
		{
			funnelType = funnelTypes.CreationFlow,
			stepKey = creationFlowSteps.GalleryItemSelectedContinuePressed
		}
	},
	[eventNamesModule.MomentsEditingFlowContinueToDescriptionButtonPressed] = {
		{
			funnelType = funnelTypes.CreationFlow,
			stepKey = creationFlowSteps.EditingScreenContinuePressed
		}
	},
	[eventNamesModule.MomentsEditingFlowPublished] = if getFFlagMomentsCreationSaveDraftModule() then {
		{
			endSession = true,
			funnelType = funnelTypes.CreationFlow,
			stepKey = creationFlowSteps.Published
		},
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = funnelTypes.DraftRecovery,
			stepKey = draftRecoverySteps.DraftPublished
		}
	} else {
		{
			endSession = true,
			funnelType = funnelTypes.CreationFlow,
			stepKey = creationFlowSteps.Published
		}
	},
	[eventNamesModule.EditingFlowMusicButtonPressed] = {
		{
			funnelType = funnelTypes.MusicEnhancement,
			stepKey = musicEnhancementSteps.MusicButtonPressed
		}
	},
	[eventNamesModule.EditingFlowMusicSelected] = {
		{
			funnelType = funnelTypes.MusicEnhancement,
			stepKey = musicEnhancementSteps.MusicSelected
		}
	},
	[eventNamesModule.EditingFlowMusicDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.MusicEnhancement,
			stepKey = musicEnhancementSteps.MusicApplied
		}
	},
	[eventNamesModule.EditingFlowMusicBackButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.MusicEnhancement
		}
	},
	[eventNamesModule.EditingFlowTextOverlayButtonPressed] = {
		{
			funnelType = funnelTypes.TextOverlayEnhancement,
			stepKey = textOverlayEnhancementSteps.TextOverlayButtonPressed
		}
	},
	[eventNamesModule.EditingFlowTextOverlayDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.TextOverlayEnhancement,
			stepKey = textOverlayEnhancementSteps.TextOverlayCompleted
		}
	},
	[eventNamesModule.EditingFlowTextOverlayBackButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.TextOverlayEnhancement
		}
	},
	[eventNamesModule.EditingFlowStickerOverlayButtonPressed] = {
		{
			funnelType = funnelTypes.StickerOverlayEnhancement,
			stepKey = stickerOverlayEnhancementSteps.StickerOverlayButtonPressed
		}
	},
	[eventNamesModule.EditingFlowStickerSelected] = {
		{
			funnelType = funnelTypes.StickerOverlayEnhancement,
			stepKey = stickerOverlayEnhancementSteps.StickerOverlaySelected
		}
	},
	[eventNamesModule.EditingFlowStickerOverlayDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.StickerOverlayEnhancement,
			stepKey = stickerOverlayEnhancementSteps.StickerOverlayCompleted
		}
	},
	[eventNamesModule.EditingFlowStickerOverlayBackButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.StickerOverlayEnhancement
		}
	},
	[eventNamesModule.EditingFlowTrimButtonPressed] = {
		{
			funnelType = funnelTypes.TrimEnhancement,
			stepKey = trimEnhancementSteps.TrimButtonPressed
		}
	},
	[eventNamesModule.EditingFlowTrimDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.TrimEnhancement,
			stepKey = trimEnhancementSteps.TrimCompleted
		}
	},
	[eventNamesModule.EditingFlowTrimBackButtonPressed] = {
		{
			endSession = true,
			funnelType = funnelTypes.TrimEnhancement
		}
	},
	[eventNamesModule.MomentsEditingFlowExited] = if getFFlagMomentsCreationSaveDraftModule() then {
		{ endSession = true, funnelType = funnelTypes.CreationFlow },
		{
			endSession = true,
			funnelType = funnelTypes.MusicEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.TextOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.StickerOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.TrimEnhancement
		},
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = funnelTypes.DraftRecovery
		}
	} else {
		{ endSession = true, funnelType = funnelTypes.CreationFlow },
		{
			endSession = true,
			funnelType = funnelTypes.MusicEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.TextOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.StickerOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = funnelTypes.TrimEnhancement
		}
	},
	[eventNamesModule.DraftRestoreSucceededEvent] = {
		{
			funnelType = funnelTypes.DraftRecovery,
			stepKey = draftRecoverySteps.DraftRestored
		}
	},
	[eventNamesModule.MomentsReturnToGallery] = if getFFlagMomentsCreationSaveDraftModule() then {
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = funnelTypes.DraftRecovery
		}
	} else {}
}