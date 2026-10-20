local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UsePostInsightsCoachmarkViewModelModule = require(script.Parent.usePostInsightsCoachmarkViewModel)

return function(p1)
	-- upvalues: UsePostInsightsCoachmarkViewModelModule (copy), Parent (copy), ReactModule (copy), FoundationModule (copy)
	local UsePostInsightsCoachmarkViewModelModuleResult = UsePostInsightsCoachmarkViewModelModule(p1)
	
	return if UsePostInsightsCoachmarkViewModelModuleResult.shouldMount then ReactModule.createElement(require(Parent.MomentsCommon.PersistentCoachmark), {
		title = UsePostInsightsCoachmarkViewModelModuleResult.title,
		text = UsePostInsightsCoachmarkViewModelModuleResult.text,
		impressionCache = UsePostInsightsCoachmarkViewModelModuleResult.impressionCache,
		maxImpressions = UsePostInsightsCoachmarkViewModelModuleResult.maxImpressions,
		autoDismissSeconds = UsePostInsightsCoachmarkViewModelModuleResult.autoDismissSeconds,
		isSessionHandled = UsePostInsightsCoachmarkViewModelModuleResult.isSessionHandled,
		onSessionHandled = UsePostInsightsCoachmarkViewModelModuleResult.onSessionHandled,
		onImpression = UsePostInsightsCoachmarkViewModelModuleResult.onImpression,
		onDismissed = UsePostInsightsCoachmarkViewModelModuleResult.onDismissed,
		hidden = UsePostInsightsCoachmarkViewModelModuleResult.hidden,
		side = FoundationModule.Enums.PopoverSide.Left,
		align = FoundationModule.Enums.PopoverAlign.Center
	}, p1.children) else p1.children
end