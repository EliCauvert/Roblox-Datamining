local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local textOverlayControlsModule = require(momentsCreation.Components.TextOverlay.TextOverlayControls)
local textOverlayLayerModule = require(momentsCreation.Components.TextOverlay.TextOverlayLayer)
local eventNames = momentsCommonModule.Analytics.EventNames

return {
	kind = "text",
	presentation = "Step",
	zIndex = 3,
	step = creationFlowStateModule.TextOverlay,
	cta = {
		localizationKey = "Feature.Moments.Action.AddText",
		order = 3,
		icon = builderIconsModule.Icon.TextUppercaseALowercaseA,
		analyticsEvent = eventNames.EditingFlowTextOverlayButtonPressed,
		commitAnalyticsEvent = eventNames.EditingFlowTextOverlayDoneButtonPressed,
		cancelAnalyticsEvent = eventNames.EditingFlowTextOverlayBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p0)
		-- upvalues: reactModule (ref), textOverlayControlsModule (ref)
		return reactModule.createElement(textOverlayControlsModule, { layoutOrder = 2, controller = p0 })
	end,
	renderPreviewLayer = function(p1, p2)
		-- upvalues: reactModule (ref), textOverlayLayerModule (ref)
		return reactModule.createElement(textOverlayLayerModule, { zIndex = 3, controller = p1, ctx = p2 })
	end,
	toEdits = function(p3)
		local var8 = p3 and p3[1]
		
		return if var8 == nil or var8.text == "" then {} else { textOverlays = p3 }
	end
}