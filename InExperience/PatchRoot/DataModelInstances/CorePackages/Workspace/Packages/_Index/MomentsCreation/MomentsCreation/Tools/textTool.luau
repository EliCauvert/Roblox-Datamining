local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local MomentTypeModule = require(MomentsCreation.Enums.MomentType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local TextOverlayControlsModule = require(MomentsCreation.Components.TextOverlay.TextOverlayControls)
local TextOverlayLayerModule = require(MomentsCreation.Components.TextOverlay.TextOverlayLayer)
local FFlagMomentsCreateAvatarPosts = require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames

return {
	kind = "text",
	presentation = "Step",
	zIndex = 3,
	step = require(MomentsCreation.Enums.CreationFlowState).TextOverlay,
	cta = {
		localizationKey = "Feature.Moments.Action.AddText",
		order = 3,
		icon = require(Parent.BuilderIcons).Icon.TextUppercaseALowercaseA,
		analyticsEvent = EventNames.EditingFlowTextOverlayButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowTextOverlayDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowTextOverlayBackButtonPressed
	},
	supportedCaptureTypes = if require(MomentsCreation.Flags.FFlagMomentsTextOverlayOnPhotos) then { Enum.CaptureType.Video, Enum.CaptureType.Screenshot } else { Enum.CaptureType.Video },
	supportedMomentTypes = if FFlagMomentsCreateAvatarPosts then { MomentTypeModule.Avatar } else nil,
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: ReactModule (copy), TextOverlayControlsModule (copy)
		return ReactModule.createElement(TextOverlayControlsModule, { layoutOrder = 2, controller = Controller })
	end,
	renderPreviewLayer = function(Controller, Ctx)
		-- upvalues: ReactModule (copy), TextOverlayLayerModule (copy)
		return ReactModule.createElement(TextOverlayLayerModule, { zIndex = 3, controller = Controller, ctx = Ctx })
	end,
	toEdits = function(Entry)
		local Entry1 = Entry and Entry[1]
		
		return if Entry1 == nil or Entry1.text == "" then {} else { textOverlays = Entry }
	end
}