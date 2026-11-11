local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.MomentsCommon)
local _ = require(Moments.Components.Feed.FeedTypes)
local ToMediaItemModule = require(script.Parent.toMediaItem)

return function(p1, GetPlaybackActive)
	-- upvalues: ToMediaItemModule (copy)
	return {
		getActiveIndex = p1.getCurrentIndex,
		getItems = function(p2)
			-- upvalues: p1 (copy), ToMediaItemModule (upval)
			local List = {}
			
			for _, value in p1.getItems(p2) do
				local MediaItemModule = ToMediaItemModule(value)
				
				if MediaItemModule ~= nil then
					table.insert(List, MediaItemModule)
				end
			end
			return List
		end,
		getPlaybackActive = GetPlaybackActive
	}
end