local _ = require(script:FindFirstAncestor("Moments").Parent.MomentsTypes)

return function(p1)
	return if p1 == nil then nil else p1.count
end