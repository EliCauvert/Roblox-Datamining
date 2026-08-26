local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local stickerOverlayControlsModule = require(momentsCreation.Components.StickerOverlay.StickerOverlayControls)
local stickerOverlayLayerModule = require(momentsCreation.Components.StickerOverlay.StickerOverlayLayer)
local eventNames = momentsCommonModule.Analytics.EventNames

return {
	kind = "sticker",
	presentation = "Step",
	zIndex = 3,
	step = creationFlowStateModule.StickerOverlay,
	cta = {
		localizationKey = "Feature.Moments.Action.AddSticker",
		order = 4,
		icon = builderIconsModule.Icon.SquareFaceEmoji,
		analyticsEvent = eventNames.EditingFlowStickerOverlayButtonPressed,
		commitAnalyticsEvent = eventNames.EditingFlowStickerOverlayDoneButtonPressed,
		cancelAnalyticsEvent = eventNames.EditingFlowStickerOverlayBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p1)
		-- upvalues: reactModule (ref), stickerOverlayControlsModule (ref)
		return reactModule.createElement(stickerOverlayControlsModule, { layoutOrder = 2, controller = p1 })
	end,
	renderPreviewLayer = function(p1, p2)
		-- upvalues: reactModule (ref), stickerOverlayLayerModule (ref)
		return reactModule.createElement(stickerOverlayLayerModule, { zIndex = 3, controller = p1, ctx = p2 })
	end,
	toEdits = function(p1)
		local var1 = p1 and p1[1]
		
		return if var1 == nil or var1.stickerURI == nil or var1.stickerURI == "" then {} else { stickerOverlays = p1 }
	end
}