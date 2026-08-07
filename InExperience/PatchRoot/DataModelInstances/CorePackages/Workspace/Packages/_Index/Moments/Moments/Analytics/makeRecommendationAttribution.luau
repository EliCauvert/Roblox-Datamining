local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Parent.MomentsTypes)
local _ = require(moments.Components.Feed.FeedTypes)

return function(p0) --[[ line: 28 | named "makeRecommendationAttribution" ]]
	if p0 == nil then
		return nil
	end
	local feedItemId = p0.feedItemId
	
	return if feedItemId == nil or feedItemId == "" then nil else { itemId = feedItemId, tracingId = p0.tracingId }
end