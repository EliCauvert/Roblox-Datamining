local function _(Text: string, p1): string
	return Text:sub(p1, p1)
end

return function(Frame): string
	local CursorPosition: number = Frame.CursorPosition
	
	if CursorPosition == -1 then
		return ""
	end
	local Text: string = Frame.Text
	local NewCursorPosition = CursorPosition + Frame.AbsoluteSize.X / (Frame.TextSize * Frame.LineHeight / 1.4)
	local Smallest = math.min((string.find(Text, "\n", CursorPosition) or 1e999) - 1, string.find(Text, "[ \t\f\11]", CursorPosition) or 1e999, #Text)
	local v1 = Text:sub(CursorPosition, CursorPosition):match("\n")
	
	if v1 then
		local CursorPositionDelta = CursorPosition - 1
		v1 = Text:sub(CursorPositionDelta, CursorPositionDelta):match("\n") or CursorPosition == 1
	end
	if v1 then
		Smallest = CursorPosition - 1
	elseif NewCursorPosition < Smallest then
		Smallest = CursorPosition
	end
	return utf8.char(utf8.codepoint(Text, 1, Smallest))
end