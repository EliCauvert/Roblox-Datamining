local _ = require(script.Parent.PlainTextTypes)

return {
	fromText = function(p1)
		return {
			kind = "text",
			wasRewritten = false,
			fallbackText = p1,
			displayText = { text = p1 }
		}
	end
}