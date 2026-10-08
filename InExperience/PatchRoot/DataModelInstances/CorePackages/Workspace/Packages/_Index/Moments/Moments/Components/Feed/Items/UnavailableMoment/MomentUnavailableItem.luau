local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useFeed = require(moments.Components.Feed.FeedContext).useFeed
local momentOverlayInsetContextModule = require(moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local momentUnavailableViewModule = require(script.Parent.MomentUnavailableView)
local useIsPagerItemActive = require(moments.Components.VerticalPager).useIsPagerItemActive
local fFlagMomentsFeedAboveNavBarModule = require(moments.Flags.FFlagMomentsFeedAboveNavBar)
local usePreferences = foundationModule.Hooks.usePreferences

return function(p1)
	-- upvalues: useFeed (ref), usePreferences (ref), momentOverlayInsetContextModule (ref), fFlagMomentsFeedAboveNavBarModule (ref), useIsPagerItemActive (ref), reactModule (ref), momentUnavailableViewModule (ref)
	local var1 = useFeed()
	local scrollToNext = var1.scrollToNext
	
	return reactModule.createElement(momentUnavailableViewModule, {
		LayoutOrder = p1.LayoutOrder,
		isModerated = p1.isModerated,
		onNext = reactModule.useCallback(function()
			-- upvalues: scrollToNext (ref)
			if scrollToNext ~= nil then
				scrollToNext()
			end
		end, { scrollToNext }),
		animate = var1.isActiveFeed and (var1.isPlaybackActive and (useIsPagerItemActive() and not usePreferences().reducedMotion)),
		bottomInset = if fFlagMomentsFeedAboveNavBarModule then 0 else momentOverlayInsetContextModule.useMomentOverlayInset()
	})
end