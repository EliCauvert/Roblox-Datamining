local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p1)
	if p1 == nil then
		return nil
	end
	local recommendationMetadata = p1.recommendationMetadata
	local var1 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
	
	return if var1 == nil or var1 == "" then nil elseif p1.momentId == var1 then var1 else nil
end