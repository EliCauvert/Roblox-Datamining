local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Parent.MomentsTypes)
local _ = require(Moments.Components.Feed.FeedTypes)

return function(p1)
	if p1 == nil then
		return nil
	else
		local FeedItemId = p1.feedItemId
		
		return if FeedItemId == nil or FeedItemId == "" then nil else { itemId = FeedItemId, tracingId = p1.tracingId }
	end
end