local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local EventNamesModule = require(MomentsCommon.Analytics.EventNames)
local FunnelEventNamesModule = require(MomentsCommon.Analytics.FunnelEventNames)
local FunnelTypes = FunnelEventNamesModule.FunnelTypes
local CreationFlowSteps = FunnelEventNamesModule.CreationFlowSteps
local MusicEnhancementSteps = FunnelEventNamesModule.MusicEnhancementSteps
local TrimEnhancementSteps = FunnelEventNamesModule.TrimEnhancementSteps
local TextOverlayEnhancementSteps = FunnelEventNamesModule.TextOverlayEnhancementSteps

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
	[EventNamesModule.MomentsEditingFlowPublished] = {
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
	[EventNamesModule.MomentsEditingFlowExited] = {
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
			funnelType = FunnelTypes.TrimEnhancement
		}
	}
}