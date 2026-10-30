local ExperienceService = game:GetService("ExperienceService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local FeedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local _ = require(script.Parent.VideoPlaybackDetectionMethod)
local FFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(Parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local FFlagLuaAppSearchResultsPageGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local FFlagLuaAppSuppressVideoDetectorDuringScroll = require(Parent.SharedFlags).FFlagLuaAppSuppressVideoDetectorDuringScroll
local FFlagLuaAppVideoAutoplayFeedElection = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local UseIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(Parent.RobloxAppNavigation).useIsRouteOnScreen else nil

return function(p1, Enabled, p2, p3, p4)
	-- upvalues: FFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), FFlagEnableOnScreenAPIIntegration (copy), UseIsRouteOnScreen (copy), UseNavigationFocusFunction (copy), FFlagLuaAppSuppressVideoDetectorDuringScroll (copy), ResponsiveModule (copy), ReactModule (copy), FFlagLuaAppSearchResultsPageGameTileVideo (copy), FeedVideoPlaybackContextModule (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), AppLifecycleObserverService (copy), VideoEndReason (copy), ExperienceService (copy)
	local UseIsRouteOnScreenResult = if FFlagLuaAppGateVideoPlaybackOnNavigationFocus then if FFlagEnableOnScreenAPIIntegration then UseIsRouteOnScreen() else UseNavigationFocusFunction() else nil
	local IsUsePreferredInputResultMatch = if FFlagLuaAppSuppressVideoDetectorDuringScroll then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Touch else nil
	local Enabled1 = nil
	local Callback = nil
	
	if FFlagLuaAppSuppressVideoDetectorDuringScroll then
		Enabled1, Callback = ReactModule.useState(false)
	end
	local IsEnabled: boolean = FFlagLuaAppSearchResultsPageGameTileVideo and Enabled == true or FFlagLuaAppGateVideoPlaybackOnNavigationFocus and not UseIsRouteOnScreenResult
	local IsEnabled1: boolean = FFlagLuaAppSuppressVideoDetectorDuringScroll and Enabled1 == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FeedVideoPlaybackContextModule (upval), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), p1 (copy), FFlagLuaAppVideoAutoplayFeedElection (upval), p2 (copy), p3 (copy), p4 (copy)
		return FeedVideoPlaybackContextModule.new(if FFlagLuaAppOneByTwoHoverIdleAutoplay then nil else p1, if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if FFlagLuaAppVideoAutoplayFeedElection then p3 else nil, if FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil)
	end, {
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else p1,
		if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil,
		if FFlagLuaAppVideoAutoplayFeedElection then p3 else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsEnabled (copy), FFlagLuaAppSuppressVideoDetectorDuringScroll (upval), IsEnabled1 (copy), UseMemoResult (copy), FeedVideoPlaybackContextModule (upval)
		return if IsEnabled or FFlagLuaAppSuppressVideoDetectorDuringScroll and IsEnabled1 then setmetatable({
			videoPlaybackCoordinator = UseMemoResult.videoPlaybackCoordinator,
			viewportVideoAutoplayController = UseMemoResult.viewportVideoAutoplayController,
			disablePlayback = not FFlagLuaAppSuppressVideoDetectorDuringScroll or IsEnabled or nil,
			disableDetectors = if FFlagLuaAppSuppressVideoDetectorDuringScroll and IsEnabled1 then true else nil
		}, FeedVideoPlaybackContextModule) else UseMemoResult
	end, {
		UseMemoResult,
		IsEnabled,
		if FFlagLuaAppSuppressVideoDetectorDuringScroll then IsEnabled1 else nil
	})
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and FFlagLuaAppGateVideoPlaybackOnNavigationFocus then
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), UseIsRouteOnScreenResult (copy)
			local ViewportVideoAutoplayController = UseMemoResult.viewportVideoAutoplayController
			
			if UseIsRouteOnScreenResult and ViewportVideoAutoplayController and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() then
				ViewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end
		end, {
			UseMemoResult.viewportVideoAutoplayController,
			UseIsRouteOnScreenResult
		})
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy), FFlagLuaAppSuppressVideoDetectorDuringScroll (upval), IsUsePreferredInputResultMatch (copy), Callback (ref)
		if UseMemoResult1.viewportVideoAutoplayController then
			if FFlagLuaAppSuppressVideoDetectorDuringScroll then
				UseMemoResult1.viewportVideoAutoplayController:setSuppressDetectorsDuringScroll(IsUsePreferredInputResultMatch == true)
			end
			UseMemoResult1.viewportVideoAutoplayController:onScrollStart()
		end
		if FFlagLuaAppSuppressVideoDetectorDuringScroll and IsUsePreferredInputResultMatch and Callback then
			Callback(true)
		end
	end, {
		UseMemoResult1.viewportVideoAutoplayController,
		if FFlagLuaAppSuppressVideoDetectorDuringScroll then IsUsePreferredInputResultMatch else nil
	})
	local UseResult1 = ReactModule.useCallback(function(p5)
		-- upvalues: FFlagLuaAppSuppressVideoDetectorDuringScroll (upval), Callback (ref), UseMemoResult1 (copy)
		if FFlagLuaAppSuppressVideoDetectorDuringScroll and Callback then
			Callback(false)
		end
		if UseMemoResult1.viewportVideoAutoplayController then
			UseMemoResult1.viewportVideoAutoplayController:onScrollSettled("Y", p5, nil)
		end
	end, { UseMemoResult1.viewportVideoAutoplayController })
	
	if FFlagLuaAppSuppressVideoDetectorDuringScroll then
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult1 (copy), IsUsePreferredInputResultMatch (copy), AppLifecycleObserverService (upval), VideoEndReason (upval), ExperienceService (upval)
			local ViewportVideoAutoplayController = UseMemoResult1.viewportVideoAutoplayController
			
			if not ViewportVideoAutoplayController or not IsUsePreferredInputResultMatch then return end
			local OnHideConnection = AppLifecycleObserverService.OnHide:Connect(function()
				-- upvalues: ViewportVideoAutoplayController (copy), VideoEndReason (upval)
				ViewportVideoAutoplayController:reset(VideoEndReason.AppBackgrounded)
			end)
			local RegisterForExperienceJoinResult = ExperienceService:RegisterForExperienceJoin(function()
				-- upvalues: ViewportVideoAutoplayController (copy), VideoEndReason (upval)
				ViewportVideoAutoplayController:reset(VideoEndReason.ExperienceLaunched)
			end)
			
			return function()
				-- upvalues: OnHideConnection (copy), RegisterForExperienceJoinResult (copy)
				OnHideConnection:Disconnect()
				RegisterForExperienceJoinResult:Disconnect()
			end
		end, {
			UseMemoResult1.viewportVideoAutoplayController,
			IsUsePreferredInputResultMatch
		})
	end
	return UseMemoResult1, UseResult, UseResult1
end