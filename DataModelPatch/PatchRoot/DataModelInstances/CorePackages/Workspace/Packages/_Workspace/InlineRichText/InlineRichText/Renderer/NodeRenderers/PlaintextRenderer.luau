local _ = require(script:FindFirstAncestor("InlineRichText").Types)

return function(p1, _)
	return { { text = p1.text, engineTags = {} } }
end