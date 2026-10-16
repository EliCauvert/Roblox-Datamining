local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p1) --[[ Line: 12 | Named "makeCommentCountFields" ]]
	return if p1 == nil or p1.count == nil then {} else { totalCommentCount = tostring(p1.count) }
end