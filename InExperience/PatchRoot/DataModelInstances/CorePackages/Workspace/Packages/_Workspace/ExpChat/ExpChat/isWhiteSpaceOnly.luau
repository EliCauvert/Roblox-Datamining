local textLabel = Instance.new("TextLabel")
textLabel.RichText = true

local function _(p0)
	-- upvalues: textLabel (ref)
	textLabel.Text = p0
	
	return textLabel.ContentText
end

return function(p1)
	-- upvalues: textLabel (ref)
	textLabel.Text = p1
	
	return string.find(textLabel.ContentText, "%S") == nil
end