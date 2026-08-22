local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p0) --[[ line: 21 | named "getPostFeedItemId" ]]
	if p0 == nil then
		return nil
	end
	local recommendationMetadata = p0.recommendationMetadata
	local var0 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
	
	return if var0 == nil or var0 == "" then nil elseif p0.momentId == var0 then var0 else nil
end