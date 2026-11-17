local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local MomentOverlayInsetContextModule = require(Moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local MomentUnavailableViewModule = require(script.Parent.MomentUnavailableView)
local UseIsPagerItemActiveFunction = require(Moments.Components.VerticalPager).useIsPagerItemActive
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)
local FFlagMomentsHideNavBarOnScrollModule = require(Moments.Flags.FFlagMomentsHideNavBarOnScroll)
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences

return function(Frame)
	-- upvalues: UseFeedFunction (copy), UsePreferencesFunction (copy), MomentOverlayInsetContextModule (copy), FFlagMomentsHideNavBarOnScrollModule (copy), FFlagMomentsFeedAboveNavBarModule (copy), UseIsPagerItemActiveFunction (copy), ReactModule (copy), MomentUnavailableViewModule (copy)
	local UseFeedResult = UseFeedFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseMomentOverlayInsetResult = MomentOverlayInsetContextModule.useMomentOverlayInset()
	local UseMomentOverlayInsetRatioResult = if FFlagMomentsHideNavBarOnScrollModule then MomentOverlayInsetContextModule.useMomentOverlayInsetRatio() else nil
	local UseMomentOverlayInsetResult1 = if UseMomentOverlayInsetRatioResult == nil and FFlagMomentsFeedAboveNavBarModule then 0 else UseMomentOverlayInsetResult
	local UseIsPagerItemActiveResult = UseIsPagerItemActiveFunction()
	local ScrollToNextFunction = UseFeedResult.scrollToNext
	
	return ReactModule.createElement(MomentUnavailableViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		isModerated = Frame.isModerated,
		onNext = ReactModule.useCallback(function()
			-- upvalues: ScrollToNextFunction (copy)
			if ScrollToNextFunction ~= nil then
				ScrollToNextFunction()
			end
		end, { ScrollToNextFunction }),
		animate = UseFeedResult.isActiveFeed and (UseFeedResult.isPlaybackActive and (UseIsPagerItemActiveResult and not ReducedMotion)),
		bottomInset = UseMomentOverlayInsetResult1,
		bottomInsetRatio = UseMomentOverlayInsetRatioResult
	})
end