local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)

return function(p1)
	return p1.Stroke.Thicker
end