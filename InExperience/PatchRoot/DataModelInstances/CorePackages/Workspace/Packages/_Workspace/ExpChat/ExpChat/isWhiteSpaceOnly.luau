local textLabel = Instance.new("TextLabel")
textLabel.RichText = true

local function _(p0) --[[ line: 5 | named "getContentText" ]]
	-- upvalues: textLabel (ref)
	textLabel.Text = p0
	
	return textLabel.ContentText
end

return function(p1) --[[ line: 10 | named "isWhitespaceOnly" ]]
	-- upvalues: textLabel (ref)
	textLabel.Text = p1
	
	return string.find(textLabel.ContentText, "%S") == nil
end