local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection

return function(p0, _, p1, p2)
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var2 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not (if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then useNavigationFocus() else nil)
	local var3 = reactModule.useMemo(function()
		-- upvalues: feedVideoPlaybackContextModule (copy), p0 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p1 (ref), p2 (ref)
		return feedVideoPlaybackContextModule.new(p0, if fFlagLuaAppVideoAutoplayFeedElection then p1 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil)
	end, {
		p0,
		if fFlagLuaAppVideoAutoplayFeedElection then p1 else nil,
		if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), feedVideoPlaybackContextModule (copy)
		return if var2 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var3.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var3.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var3
	end, { var3, var2 })
	
	return var4, reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var4.viewportVideoAutoplayController }), reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollSettled("Y", p3, nil)
		end
	end, { var4.viewportVideoAutoplayController })
end