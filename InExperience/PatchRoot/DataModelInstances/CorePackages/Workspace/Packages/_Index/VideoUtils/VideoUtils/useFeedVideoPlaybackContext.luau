local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local fFlagLuaAppGateVideoPlaybackOnNavigationFocus = require(parent.SharedFlags).FFlagLuaAppGateVideoPlaybackOnNavigationFocus
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo

return function(p1, _)
	-- upvalues: fFlagLuaAppGateVideoPlaybackOnNavigationFocus (ref), useNavigationFocus (ref), fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref)
	local var1 = if fFlagLuaAppSearchResultsPageGameTileVideo then true else fFlagLuaAppGateVideoPlaybackOnNavigationFocus and not (if fFlagLuaAppGateVideoPlaybackOnNavigationFocus then useNavigationFocus() else nil)
	local var2 = reactModule.useMemo(function()
		-- upvalues: feedVideoPlaybackContextModule (copy), p1 (ref)
		return feedVideoPlaybackContextModule.new(p1)
	end, { p1 })
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
	end, { var3.viewportVideoAutoplayController }), reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		if var3.viewportVideoAutoplayController then
			var3.viewportVideoAutoplayController:onScrollSettled("Y", p2, nil)
		end
	end, { var3.viewportVideoAutoplayController })
end