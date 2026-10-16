local Label = Instance.new("TextLabel")
Label.RichText = true

local function _(Text) --[[ Line: 5 | Named "getContentText" ]]
	-- upvalues: Label (copy)
	Label.Text = Text
	
	return Label.ContentText
end

return function(Text): boolean --[[ Line: 10 | Named "isWhitespaceOnly" ]]
	-- upvalues: Label (copy)
	Label.Text = Text
	
	return string.find(Label.ContentText, "%S") == nil
end