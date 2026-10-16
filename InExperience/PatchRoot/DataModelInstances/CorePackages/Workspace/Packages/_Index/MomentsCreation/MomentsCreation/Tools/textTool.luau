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
	renderEditor = function(p1)
		-- upvalues: reactModule (ref), textOverlayControlsModule (ref)
		return reactModule.createElement(textOverlayControlsModule, { layoutOrder = 2, controller = p1 })
	end,
	renderPreviewLayer = function(p1, p2)
		-- upvalues: reactModule (ref), textOverlayLayerModule (ref)
		return reactModule.createElement(textOverlayLayerModule, { zIndex = 3, controller = p1, ctx = p2 })
	end,
	toEdits = function(p1)
		local var1 = p1 and p1[1]
		
		return if var1 == nil or var1.text == "" then {} else { textOverlays = p1 }
	end
}