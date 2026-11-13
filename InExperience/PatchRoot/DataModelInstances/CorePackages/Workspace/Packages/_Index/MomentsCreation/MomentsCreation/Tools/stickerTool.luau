local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local StickerOverlayControlsModule = require(MomentsCreation.Components.StickerOverlay.StickerOverlayControls)
local StickerOverlayLayerModule = require(MomentsCreation.Components.StickerOverlay.StickerOverlayLayer)
local EventNames = MomentsCommonModule.Analytics.EventNames

return {
	kind = "sticker",
	presentation = "Step",
	zIndex = 3,
	step = CreationFlowStateModule.StickerOverlay,
	cta = {
		localizationKey = "Feature.Moments.Action.AddSticker",
		order = 4,
		icon = BuilderIconsModule.Icon.SquareFaceEmoji,
		analyticsEvent = EventNames.EditingFlowStickerOverlayButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowStickerOverlayDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowStickerOverlayBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: ReactModule (copy), StickerOverlayControlsModule (copy)
		return ReactModule.createElement(StickerOverlayControlsModule, { layoutOrder = 2, controller = Controller })
	end,
	renderPreviewLayer = function(Controller, Ctx)
		-- upvalues: ReactModule (copy), StickerOverlayLayerModule (copy)
		return ReactModule.createElement(StickerOverlayLayerModule, { zIndex = 3, controller = Controller, ctx = Ctx })
	end,
	toEdits = function(Entry)
		local Entry1 = Entry and Entry[1]
		
		return if Entry1 == nil or Entry1.stickerURI == nil or Entry1.stickerURI == "" then {} else { stickerOverlays = Entry }
	end
}