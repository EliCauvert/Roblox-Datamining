local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local UseFeedFunction = require(Moments.Components.Feed.FeedContext).useFeed
local MomentOverlayInsetContextModule = require(Moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local MomentUnavailableViewModule = require(script.Parent.MomentUnavailableView)
local UseIsPagerItemActiveFunction = require(Moments.Components.VerticalPager).useIsPagerItemActive
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)
local UsePreferencesFunction = require(Parent.Foundation).Hooks.usePreferences

return function(Frame) --[[ Line: 32 | Named "MomentUnavailableItem" ]]
	-- upvalues: UseFeedFunction (copy), UsePreferencesFunction (copy), MomentOverlayInsetContextModule (copy), FFlagMomentsFeedAboveNavBarModule (copy), UseIsPagerItemActiveFunction (copy), ReactModule (copy), MomentUnavailableViewModule (copy)
	local UseFeedResult = UseFeedFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseMomentOverlayInsetResult = MomentOverlayInsetContextModule.useMomentOverlayInset()
	local UseIsPagerItemActiveResult = UseIsPagerItemActiveFunction()
	local ScrollToNextFunction = UseFeedResult.scrollToNext
	
	return ReactModule.createElement(MomentUnavailableViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		isModerated = Frame.isModerated,
		onNext = ReactModule.useCallback(function() --[[ Line: 41 ]]
			-- upvalues: ScrollToNextFunction (copy)
			if ScrollToNextFunction ~= nil then
				ScrollToNextFunction()
			end
		end, { ScrollToNextFunction }),
		animate = UseFeedResult.isActiveFeed and (UseFeedResult.isPlaybackActive and (UseIsPagerItemActiveResult and not ReducedMotion)),
		bottomInset = if FFlagMomentsFeedAboveNavBarModule then 0 else UseMomentOverlayInsetResult
	})
end