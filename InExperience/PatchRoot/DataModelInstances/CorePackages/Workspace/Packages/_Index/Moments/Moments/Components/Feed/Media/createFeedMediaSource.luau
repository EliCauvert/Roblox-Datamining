local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local toMediaItemModule = require(script.Parent.toMediaItem)

return function(p0, p1) --[[ line: 31 | named "createFeedMediaSource" ]]
	-- upvalues: toMediaItemModule (ref)
	return {
		getActiveIndex = p0.getCurrentIndex,
		getItems = function(p2) --[[ line: 43 ]]
			-- upvalues: p0 (ref), toMediaItemModule (copy)
			local t = {}
			
			for i, v in p0.getItems(p2) do
				local var3 = toMediaItemModule(v)
				
				if var3 ~= nil then
					table.insert(t, var3)
				end
			end
			return t
		end,
		getPlaybackActive = p1
	}
end