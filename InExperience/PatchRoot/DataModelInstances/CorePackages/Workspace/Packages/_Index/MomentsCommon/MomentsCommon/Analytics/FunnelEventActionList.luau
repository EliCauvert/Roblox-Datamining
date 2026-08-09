local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local eventNamesModule = require(momentsCommon.Analytics.EventNames)
local funnelEventNamesModule = require(momentsCommon.Analytics.FunnelEventNames)
local funnelTypes = funnelEventNamesModule.FunnelTypes
local creationFlowSteps = funnelEventNamesModule.CreationFlowSteps
local musicEnhancementSteps = funnelEventNamesModule.MusicEnhancementSteps
local trimEnhancementSteps = funnelEventNamesModule.TrimEnhancementSteps
local textOverlayEnhancementSteps = funnelEventNamesModule.TextOverlayEnhancementSteps

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
	[eventNamesModule.MomentsEditingFlowPublished] = {
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
	[eventNamesModule.MomentsEditingFlowExited] = {
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
			funnelType = funnelTypes.TrimEnhancement
		}
	}
}