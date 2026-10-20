local Label = Instance.new("TextLabel")
Label.RichText = true

local function _(Text)
	-- upvalues: Label (copy)
	Label.Text = Text
	
	return Label.ContentText
end

return function(Text): boolean
	-- upvalues: Label (copy)
	Label.Text = Text
	
	return string.find(Label.ContentText, "%S") == nil
end