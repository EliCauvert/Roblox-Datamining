local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Parent.MomentsTypes)
local _ = require(moments.Components.Feed.FeedTypes)

return function(p1)
	if p1 == nil then
		return nil
	end
	local feedItemId = p1.feedItemId
	
	return if feedItemId == nil or feedItemId == "" then nil else { itemId = feedItemId, tracingId = p1.tracingId }
end