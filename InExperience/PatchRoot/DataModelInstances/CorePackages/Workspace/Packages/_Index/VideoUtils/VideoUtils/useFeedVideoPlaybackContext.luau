local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local feedVideoPlaybackContextModule = require(script.Parent.FeedVideoPlaybackContext)
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo

return function(p0, p1) --[[ line: 13 | named "useFeedVideoPlaybackContext" ]]
	-- upvalues: fFlagLuaAppSearchResultsPageGameTileVideo (ref), reactModule (ref), feedVideoPlaybackContextModule (ref)
	local var2 = fFlagLuaAppSearchResultsPageGameTileVideo and p1 == true
	local var3 = reactModule.useMemo(function() --[[ line: 19 ]]
		-- upvalues: feedVideoPlaybackContextModule (copy), p0 (ref)
		return feedVideoPlaybackContextModule.new(p0)
	end, { p0 })
	local var4 = reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: var2 (ref), var3 (ref), feedVideoPlaybackContextModule (copy)
		return if var2 then setmetatable({
			disablePlayback = true,
			videoPlaybackCoordinator = var3.videoPlaybackCoordinator,
			viewportVideoAutoplayController = var3.viewportVideoAutoplayController
		}, feedVideoPlaybackContextModule) else var3
	end, { var3, var2 })
	
	return var4, reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollStart()
		end
	end, { var4.viewportVideoAutoplayController }), reactModule.useCallback(function(p2) --[[ line: 48 ]]
		-- upvalues: var4 (ref)
		if var4.viewportVideoAutoplayController then
			var4.viewportVideoAutoplayController:onScrollSettled("Y", p2, nil)
		end
	end, { var4.viewportVideoAutoplayController })
end