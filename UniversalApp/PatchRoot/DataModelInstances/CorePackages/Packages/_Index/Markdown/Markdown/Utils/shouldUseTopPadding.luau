local _ = require(script:FindFirstAncestor("Markdown").Types)

return function(p1): boolean
	return p1.offset ~= 0
end