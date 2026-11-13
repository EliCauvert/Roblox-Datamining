local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local TrimmingViewModule = require(MomentsCreation.Components.TrimmingView)
local EventNames = MomentsCommonModule.Analytics.EventNames

return {
	kind = "trim",
	presentation = "Step",
	zIndex = 1,
	step = CreationFlowStateModule.Trimming,
	cta = {
		localizationKey = "Feature.Moments.Action.TrimVideo",
		order = 1,
		icon = BuilderIconsModule.Icon.ThreeBarsVerticalTrianglesHorizontal,
		analyticsEvent = EventNames.EditingFlowTrimButtonPressed,
		commitAnalyticsEvent = EventNames.EditingFlowTrimDoneButtonPressed,
		cancelAnalyticsEvent = EventNames.EditingFlowTrimBackButtonPressed
	},
	supportedCaptureTypes = { Enum.CaptureType.Video },
	createSession = function()
		-- upvalues: CreateEditSessionModule (copy)
		return CreateEditSessionModule()
	end,
	renderEditor = function(Controller)
		-- upvalues: ReactModule (copy), TrimmingViewModule (copy)
		return ReactModule.createElement(TrimmingViewModule, { layoutOrder = 2, controller = Controller })
	end,
	toEdits = function(Trim)
		return { trim = Trim }
	end
}