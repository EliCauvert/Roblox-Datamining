local TextService = game:GetService("TextService")
local TextModule = { PADDING = Vector2.new(2, 2) }

function TextModule.GetTextBounds(String1, p1, FontSize, Vector)
	-- upvalues: TextService (copy), TextModule (copy)
	return TextService:GetTextSize(String1, FontSize, p1, Vector) + TextModule.PADDING
end

function TextModule.GetTextWidth(p1, p2, p3)
	-- upvalues: TextModule (copy)
	return TextModule.GetTextBounds(p1, p2, p3, Vector2.new(10000, 10000)).X
end

function TextModule.GetTextHeight(p1, p2, p3, X)
	-- upvalues: TextModule (copy)
	return TextModule.GetTextBounds(p1, p2, p3, Vector2.new(X, 10000)).Y
end

function TextModule.Truncate(Text: string, p1, TextSize, X, p2): string
	-- upvalues: TextModule (copy)
	local P13 = p2 or ""
	
	if X >= TextModule.GetTextWidth(Text, p1, TextSize) then
		return Text
	end
	local v1 = ""
	
	for _, value in utf8.graphemes(Text) do
		local Text1 = string.sub(Text, 1, value) .. P13
		
		if X < TextModule.GetTextWidth(Text1, p1, TextSize) then
			return v1
		end
		v1 = Text1
	end
	return ""
end

function TextModule.TruncateTextLabel(Frame, p3)
	-- upvalues: TextModule (copy)
	Frame.Text = TextModule.Truncate(Frame.Text, Frame.Font, Frame.TextSize, Frame.AbsoluteSize.X, p3)
end

function TextModule.Trim(Text: string): string
	if type(Text) ~= "string" then
		error(string.format("Text.Trim called on non-string type %s.", (type(Text))), 2)
	end
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

function TextModule.RightTrim(Text: string): string
	if type(Text) ~= "string" then
		error(string.format("Text.RightTrim called on non-string type %s.", (type(Text))), 2)
	end
	return (Text:gsub("%s+$", ""))
end

function TextModule.LeftTrim(Text: string): string
	if type(Text) ~= "string" then
		error(string.format("Text.LeftTrim called on non-string type %s.", (type(Text))), 2)
	end
	return (Text:gsub("^%s+", ""))
end

function TextModule.SpaceNormalize(Text: string)
	if type(Text) ~= "string" then
		error(string.format("Text.SpaceNormalize called on non-string type %s.", (type(Text))), 2)
	end
	return (Text:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""))
end

function TextModule.Split(Text: string, Pattern: string)
	if type(Text) == "string" then
		if type(Pattern) == "string" then
			if Pattern == "" then
				error("Text.Split called with an empty pattern.", 2)
			end
		else
			error(string.format("Text.Split called with a pattern that is non-string type %s.", (type(Pattern))), 2)
		end
	else
		error(string.format("Text.Split called on non-string type %s.", (type(Text))), 2)
	end
	local List = {}
	local StartIndex = 1
	while true do
		local StartIndex1, EndIndex = string.find(Text, Pattern, StartIndex, true)
		if not StartIndex1 or not EndIndex then break end
		table.insert(List, (string.sub(Text, StartIndex, StartIndex1 - 1)))
		StartIndex = EndIndex + 1
	end
	table.insert(List, (string.sub(Text, StartIndex, (string.len(Text)))))
	
	return List
end

return TextModule