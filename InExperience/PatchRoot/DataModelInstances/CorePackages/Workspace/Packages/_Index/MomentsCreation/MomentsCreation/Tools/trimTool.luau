local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local TrimmingViewModule = require(MomentsCreation.Components.TrimmingView)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames

return {
	kind = "trim",
	presentation = "Step",
	zIndex = 1,
	step = require(MomentsCreation.Enums.CreationFlowState).Trimming,
	cta = {
		localizationKey = "Feature.Moments.Action.TrimVideo",
		order = 1,
		icon = require(Parent.BuilderIcons).Icon.ThreeBarsVerticalTrianglesHorizontal,
		analyticsEvent = EventNames.EditingFlowTrimButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowTrimDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowTrimBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function() --[[ Line: 39 ]]
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller) --[[ Line: 42 ]]
		-- upvalues: ReactModule (copy), TrimmingViewModule (copy)
		return ReactModule.createElement(TrimmingViewModule, { layoutOrder = 2, controller = Controller })
	end,
	toEdits = function(Trim) --[[ Line: 49 ]]
		return { trim = Trim }
	end
}