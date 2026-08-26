local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local toMediaItemModule = require(script.Parent.toMediaItem)

return function(p1, p2, p3)
	-- upvalues: toMediaItemModule (ref)
	return {
		getActiveIndex = p1.getCurrentIndex,
		getItems = function(p4)
			-- upvalues: p1 (ref), toMediaItemModule (copy)
			local t = {}
			
			for i, v in p1.getItems(p4) do
				local var1 = toMediaItemModule(v)
				
				if var1 ~= nil then
					table.insert(t, var1)
				end
			end
			return t
		end,
		getPlaybackActive = p2,
		getCanAutoPlay = p3
	}
end