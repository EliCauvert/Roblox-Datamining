local Parent = script:FindFirstAncestor("VideoUtils").Parent
local ReactModule = require(Parent.React)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local FeedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local _ = require(script.Parent.VideoPlaybackDetectionMethod)
local FFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(Parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local FFlagLuaAppSearchResultsPageGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local FFlagLuaAppVideoAutoplayFeedElection = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local UseIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(Parent.RobloxAppNavigation).useIsRouteOnScreen else nil

return function(p1, Enabled, p2, p3, p4) --[[ Line: 24 | Named "useFeedVideoPlaybackContext" ]]
	-- upvalues: FFlagLuaAppGateVideoPlaybackOnNavigationFocus (copy), FFlagEnableOnScreenAPIIntegration (copy), UseIsRouteOnScreen (copy), UseNavigationFocusFunction (copy), FFlagLuaAppSearchResultsPageGameTileVideo (copy), ReactModule (copy), FeedVideoPlaybackContextModule (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppVideoAutoplayFeedElection (copy)
	local UseIsRouteOnScreenResult = if FFlagLuaAppGateVideoPlaybackOnNavigationFocus then if FFlagEnableOnScreenAPIIntegration then UseIsRouteOnScreen() else UseNavigationFocusFunction() else nil
	local IsEnabled: boolean = FFlagLuaAppSearchResultsPageGameTileVideo and Enabled == true or FFlagLuaAppGateVideoPlaybackOnNavigationFocus and not UseIsRouteOnScreenResult
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 38 ]]
		-- upvalues: FeedVideoPlaybackContextModule (upval), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), p1 (copy), FFlagLuaAppVideoAutoplayFeedElection (upval), p2 (copy), p3 (copy), p4 (copy)
		return FeedVideoPlaybackContextModule.new(if FFlagLuaAppOneByTwoHoverIdleAutoplay then nil else p1, if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if FFlagLuaAppVideoAutoplayFeedElection then p3 else nil, if FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil)
	end, {
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else p1,
		if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil,
		if FFlagLuaAppVideoAutoplayFeedElection then p3 else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: IsEnabled (copy), UseMemoResult (copy), FeedVideoPlaybackContextModule (upval)
		return if IsEnabled then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = UseMemoResult.videoPlaybackCoordinator,
			viewportVideoAutoplayController = UseMemoResult.viewportVideoAutoplayController
		}, FeedVideoPlaybackContextModule) else UseMemoResult
	end, { UseMemoResult, IsEnabled })
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and FFlagLuaAppGateVideoPlaybackOnNavigationFocus then
		ReactModule.useEffect(function() --[[ Line: 73 ]]
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
	return UseMemoResult1, ReactModule.useCallback(function() --[[ Line: 81 ]]
		-- upvalues: UseMemoResult1 (copy)
		if UseMemoResult1.viewportVideoAutoplayController then
			UseMemoResult1.viewportVideoAutoplayController:onScrollStart()
		end
	end, { UseMemoResult1.viewportVideoAutoplayController }), (ReactModule.useCallback(function(p5) --[[ Line: 87 ]]
		-- upvalues: UseMemoResult1 (copy)
		if UseMemoResult1.viewportVideoAutoplayController then
			UseMemoResult1.viewportVideoAutoplayController:onScrollSettled("Y", p5, nil)
		end
	end, { UseMemoResult1.viewportVideoAutoplayController }))
end