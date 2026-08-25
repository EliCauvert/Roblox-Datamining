local _ = require(script:FindFirstAncestor("InlineRichText").Types)

return function(p0, _)
	return { { text = p0.text, engineTags = {} } }
end