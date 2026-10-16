local _ = require(script:FindFirstAncestor("InlineRichText").Types)

return function(p1, _) --[[ Line: 5 ]]
	return { { text = p1.text, engineTags = {} } }
end