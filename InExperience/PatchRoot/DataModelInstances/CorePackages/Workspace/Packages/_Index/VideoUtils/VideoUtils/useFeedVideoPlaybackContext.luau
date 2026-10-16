local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local _ = require(script.Parent.VideoPlaybackDetectionMethod)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay

return function(p1, _, p2, p3, p4)
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var1 = if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then useNavigationFocus() else nil
	local var2 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not var1
	local var3 = reactModule.useMemo(function()
		-- upvalues: feedVideoPlaybackContextModule (copy), fFlagLuaAppOneByTwoHoverIdleAutoplay (copy), p1 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p2 (ref), p3 (ref), p4 (ref)
		return feedVideoPlaybackContextModule.new(if fFlagLuaAppOneByTwoHoverIdleAutoplay then nil else p1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil, if fFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil)
	end, {
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else p1,
		if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil,
		if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), feedVideoPlaybackContextModule (copy)
		return if var2 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var3.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var3.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var3
	end, { var3, var2 })
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and fFlagLuaAppGateVideoPlaybackOnNavigationFocus then
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), var1 (ref)
			local viewportVideoAutoplayController = var3.viewportVideoAutoplayController
			
			if var1 and viewportVideoAutoplayController and viewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() then
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end
		end, { var3.viewportVideoAutoplayController, var1 })
	end
	return var4, reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var4.viewportVideoAutoplayController }), reactModule.useCallback(function(p5)
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollSettled("Y", p5, nil)
		end
	end, { var4.viewportVideoAutoplayController })
end