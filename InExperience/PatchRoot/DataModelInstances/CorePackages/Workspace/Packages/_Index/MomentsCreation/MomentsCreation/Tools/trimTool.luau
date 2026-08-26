local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createEditSessionModule = require(momentsCreation.Stores.createEditSession)
local trimmingViewModule = require(momentsCreation.Components.TrimmingView)
local eventNames = momentsCommonModule.Analytics.EventNames

return {
	kind = "trim",
	presentation = "Step",
	zIndex = 1,
	step = creationFlowStateModule.Trimming,
	cta = {
		localizationKey = "Feature.Moments.Action.TrimVideo",
		order = 1,
		icon = builderIconsModule.Icon.ThreeBarsVerticalTrianglesHorizontal,
		analyticsEvent = eventNames.EditingFlowTrimButtonPressed,
		commitAnalyticsEvent = eventNames.EditingFlowTrimDoneButtonPressed,
		cancelAnalyticsEvent = eventNames.EditingFlowTrimBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: createEditSessionModule (ref)
		return createEditSessionModule()
	end,
	renderEditor = function(p1)
		-- upvalues: reactModule (ref), trimmingViewModule (ref)
		return reactModule.createElement(trimmingViewModule, { layoutOrder = 2, controller = p1 })
	end,
	toEdits = function(p1)
		return { trim = p1 }
	end
}