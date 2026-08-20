local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo

return function(p0, _) --[[ line: 16 | named "useFeedVideoPlaybackContext" ]]
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref)
	local var2 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not (if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then useNavigationFocus() else nil)
	local var3 = reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: feedVideoPlaybackContextModule (copy), p0 (ref)
		return feedVideoPlaybackContextModule.new(p0)
	end, { p0 })
	local var4 = reactModule.useMemo(function() --[[ line: 29 ]]
		-- upvalues: var2 (ref), var3 (ref), feedVideoPlaybackContextModule (copy)
		return if var2 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var3.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var3.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var3
	end, { var3, var2 })
	
	return var4, reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var4.viewportVideoAutoplayController }), reactModule.useCallback(function(p1) --[[ line: 53 ]]
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollSettled("Y", p1, nil)
		end
	end, { var4.viewportVideoAutoplayController })
end