local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local _ = require(script.Parent.VideoPlaybackDetectionMethod)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagEnableOnScreenAPIIntegration = require(parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local var1 = if fFlagEnableOnScreenAPIIntegration then require(parent.RobloxAppNavigation).useIsRouteOnScreen else nil

return function(p1, _, p2, p3, p4)
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), fFlagEnableOnScreenAPIIntegration (ref), var1 (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var2 = if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then if fFlagEnableOnScreenAPIIntegration then var1() else useNavigationFocus() else nil
	local var3 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not var2
	local var4 = reactModule.useMemo(function()
		-- upvalues: feedVideoPlaybackContextModule (copy), fFlagLuaAppOneByTwoHoverIdleAutoplay (copy), p1 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p2 (ref), p3 (ref), p4 (ref)
		return feedVideoPlaybackContextModule.new(if fFlagLuaAppOneByTwoHoverIdleAutoplay then nil else p1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil, if fFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil)
	end, {
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else p1,
		if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil,
		if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil
	})
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref), feedVideoPlaybackContextModule (copy)
		return if var3 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var4.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var4.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var4
	end, { var4, var3 })
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var2 (ref)
			local viewportVideoAutoplayController = var4.viewportVideoAutoplayController
			
			if var2 and viewportVideoAutoplayController and viewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() then
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end
		end, { var4.viewportVideoAutoplayController, var2 })
	end
	return var5, reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		if var5.viewportVideoAutoplayController then
			var5.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var5.viewportVideoAutoplayController }), reactModule.useCallback(function(p5)
		-- upvalues: var5 (ref)
		if var5.viewportVideoAutoplayController then
			var5.viewportVideoAutoplayController:onScrollSettled("Y", p5, nil)
		end
	end, { var5.viewportVideoAutoplayController })
end