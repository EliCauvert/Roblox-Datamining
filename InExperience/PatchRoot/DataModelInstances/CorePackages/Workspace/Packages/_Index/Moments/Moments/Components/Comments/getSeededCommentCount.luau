local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p1) --[[ Line: 7 | Named "getSeededCommentCount" ]]
	return if p1 == nil then nil else p1.count
end