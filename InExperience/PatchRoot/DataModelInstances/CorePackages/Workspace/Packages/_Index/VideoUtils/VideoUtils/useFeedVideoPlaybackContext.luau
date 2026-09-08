local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection

return function(p1, _, p2, p3)
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var1 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not (if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then useNavigationFocus() else nil)
	local var2 = reactModule.useMemo(function()
		-- upvalues: feedVideoPlaybackContextModule (copy), p1 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p2 (ref), p3 (ref)
		return feedVideoPlaybackContextModule.new(p1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil)
	end, {
		p1,
		if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil,
		if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil
	})
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), feedVideoPlaybackContextModule (copy)
		return if var1 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var2.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var2.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var2
	end, { var2, var1 })
	
	return var3, reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.viewportVideoAutoplayController then
			var3.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var3.viewportVideoAutoplayController }), reactModule.useCallback(function(p4)
		-- upvalues: var3 (ref)
		if var3.viewportVideoAutoplayController then
			var3.viewportVideoAutoplayController:onScrollSettled("Y", p4, nil)
		end
	end, { var3.viewportVideoAutoplayController })
end