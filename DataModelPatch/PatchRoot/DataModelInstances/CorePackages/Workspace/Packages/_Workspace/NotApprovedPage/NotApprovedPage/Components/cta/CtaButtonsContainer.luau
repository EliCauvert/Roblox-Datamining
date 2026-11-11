local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UsePageAnalyticsFunction = require(NotApprovedPage.Contexts.PageAnalyticsContext).usePageAnalytics
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return ReactModule.memo(function(p1)
	-- upvalues: UsePageNavigationFunction (copy), UsePageAnalyticsFunction (copy), UseDispatchFunction (copy), ReactModule (copy), View (copy)
	local UsePageNavigationResult = UsePageNavigationFunction()
	local UsePageAnalyticsResult = UsePageAnalyticsFunction()
	local UseDispatchResult = UseDispatchFunction()
	local CurrentCtaComponent = UsePageNavigationResult.CurrentCtaComponent
	
	return if CurrentCtaComponent then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-medium padding-x-xxlarge padding-bottom-xxlarge padding-top-medium"
	}, ReactModule.createElement(CurrentCtaComponent, {
		key = UsePageNavigationResult.currentPageName,
		moderationDetail = p1.moderationDetail,
		dispatch = UseDispatchResult,
		LogoutThunk = p1.LogoutThunk,
		goToNextPage = UsePageNavigationResult.goToNextPage,
		sendPageEvent = UsePageAnalyticsResult.sendPageEvent,
		hasNavigatedForward = UsePageNavigationResult.hasNavigatedForward
	})) else nil
end)