local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local EventNamesModule = require(MomentsCommon.Analytics.EventNames)
local FunnelEventNamesModule = require(MomentsCommon.Analytics.FunnelEventNames)
local GetFFlagMomentsCreationSaveDraftModule = require(MomentsCommon.Flags.GetFFlagMomentsCreationSaveDraft)
local FunnelTypes = FunnelEventNamesModule.FunnelTypes
local CreationFlowSteps = FunnelEventNamesModule.CreationFlowSteps
local MusicEnhancementSteps = FunnelEventNamesModule.MusicEnhancementSteps
local TrimEnhancementSteps = FunnelEventNamesModule.TrimEnhancementSteps
local TextOverlayEnhancementSteps = FunnelEventNamesModule.TextOverlayEnhancementSteps
local StickerOverlayEnhancementSteps = FunnelEventNamesModule.StickerOverlayEnhancementSteps
local VoiceEnhancementSteps = FunnelEventNamesModule.VoiceEnhancementSteps
local DraftRecoverySteps = FunnelEventNamesModule.DraftRecoverySteps

return {
	[EventNamesModule.EditingFlowGalleryItemSelected] = {
		{
			funnelType = FunnelTypes.CreationFlow,
			stepKey = CreationFlowSteps.GalleryItemSelected
		}
	},
	[EventNamesModule.MomentsEditingFlowContinueToEditButtonPressed] = {
		{
			funnelType = FunnelTypes.CreationFlow,
			stepKey = CreationFlowSteps.GalleryItemSelectedContinuePressed
		}
	},
	[EventNamesModule.MomentsEditingFlowContinueToDescriptionButtonPressed] = {
		{
			funnelType = FunnelTypes.CreationFlow,
			stepKey = CreationFlowSteps.EditingScreenContinuePressed
		}
	},
	[EventNamesModule.MomentsEditingFlowPublished] = if GetFFlagMomentsCreationSaveDraftModule() then {
		{
			endSession = true,
			funnelType = FunnelTypes.CreationFlow,
			stepKey = CreationFlowSteps.Published
		},
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = FunnelTypes.DraftRecovery,
			stepKey = DraftRecoverySteps.DraftPublished
		}
	} else {
		{
			endSession = true,
			funnelType = FunnelTypes.CreationFlow,
			stepKey = CreationFlowSteps.Published
		}
	},
	[EventNamesModule.EditingFlowMusicButtonPressed] = {
		{
			funnelType = FunnelTypes.MusicEnhancement,
			stepKey = MusicEnhancementSteps.MusicButtonPressed
		}
	},
	[EventNamesModule.EditingFlowMusicSelected] = {
		{
			funnelType = FunnelTypes.MusicEnhancement,
			stepKey = MusicEnhancementSteps.MusicSelected
		}
	},
	[EventNamesModule.EditingFlowMusicDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.MusicEnhancement,
			stepKey = MusicEnhancementSteps.MusicApplied
		}
	},
	[EventNamesModule.EditingFlowMusicBackButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.MusicEnhancement
		}
	},
	[EventNamesModule.EditingFlowTextOverlayButtonPressed] = {
		{
			funnelType = FunnelTypes.TextOverlayEnhancement,
			stepKey = TextOverlayEnhancementSteps.TextOverlayButtonPressed
		}
	},
	[EventNamesModule.EditingFlowTextOverlayDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.TextOverlayEnhancement,
			stepKey = TextOverlayEnhancementSteps.TextOverlayCompleted
		}
	},
	[EventNamesModule.EditingFlowTextOverlayBackButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.TextOverlayEnhancement
		}
	},
	[EventNamesModule.EditingFlowStickerOverlayButtonPressed] = {
		{
			funnelType = FunnelTypes.StickerOverlayEnhancement,
			stepKey = StickerOverlayEnhancementSteps.StickerOverlayButtonPressed
		}
	},
	[EventNamesModule.EditingFlowStickerSelected] = {
		{
			funnelType = FunnelTypes.StickerOverlayEnhancement,
			stepKey = StickerOverlayEnhancementSteps.StickerOverlaySelected
		}
	},
	[EventNamesModule.EditingFlowStickerOverlayDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.StickerOverlayEnhancement,
			stepKey = StickerOverlayEnhancementSteps.StickerOverlayCompleted
		}
	},
	[EventNamesModule.EditingFlowStickerOverlayBackButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.StickerOverlayEnhancement
		}
	},
	[EventNamesModule.EditingFlowTrimButtonPressed] = {
		{
			funnelType = FunnelTypes.TrimEnhancement,
			stepKey = TrimEnhancementSteps.TrimButtonPressed
		}
	},
	[EventNamesModule.EditingFlowTrimDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.TrimEnhancement,
			stepKey = TrimEnhancementSteps.TrimCompleted
		}
	},
	[EventNamesModule.EditingFlowTrimBackButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.TrimEnhancement
		}
	},
	[EventNamesModule.EditingFlowVoiceButtonPressed] = {
		{
			funnelType = FunnelTypes.VoiceEnhancement,
			stepKey = VoiceEnhancementSteps.VoiceButtonPressed
		}
	},
	[EventNamesModule.EditingFlowVoiceTextEntered] = {
		{
			funnelType = FunnelTypes.VoiceEnhancement,
			stepKey = VoiceEnhancementSteps.VoiceTextEntered
		}
	},
	[EventNamesModule.EditingFlowVoiceGeneratePressed] = {
		{
			funnelType = FunnelTypes.VoiceEnhancement,
			stepKey = VoiceEnhancementSteps.VoiceGeneratePressed
		}
	},
	[EventNamesModule.EditingFlowVoiceGenerateSucceeded] = {
		{
			funnelType = FunnelTypes.VoiceEnhancement,
			stepKey = VoiceEnhancementSteps.VoiceGenerateSucceeded
		}
	},
	[EventNamesModule.EditingFlowVoiceDoneButtonPressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.VoiceEnhancement,
			stepKey = VoiceEnhancementSteps.VoiceApplied
		}
	},
	[EventNamesModule.EditingFlowVoiceDeleteChangePressed] = {
		{
			endSession = true,
			funnelType = FunnelTypes.VoiceEnhancement
		}
	},
	[EventNamesModule.MomentsEditingFlowExited] = if GetFFlagMomentsCreationSaveDraftModule() then {
		{ endSession = true, funnelType = FunnelTypes.CreationFlow },
		{
			endSession = true,
			funnelType = FunnelTypes.MusicEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.TextOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.StickerOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.TrimEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.VoiceEnhancement
		},
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = FunnelTypes.DraftRecovery
		}
	} else {
		{ endSession = true, funnelType = FunnelTypes.CreationFlow },
		{
			endSession = true,
			funnelType = FunnelTypes.MusicEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.TextOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.StickerOverlayEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.TrimEnhancement
		},
		{
			endSession = true,
			funnelType = FunnelTypes.VoiceEnhancement
		}
	},
	[EventNamesModule.DraftRestoreSucceededEvent] = {
		{
			funnelType = FunnelTypes.DraftRecovery,
			stepKey = DraftRecoverySteps.DraftRestored
		}
	},
	[EventNamesModule.MomentsReturnToGallery] = if GetFFlagMomentsCreationSaveDraftModule() then {
		{
			endSession = true,
			onlyIfSessionOpen = true,
			funnelType = FunnelTypes.DraftRecovery
		}
	} else {}
}