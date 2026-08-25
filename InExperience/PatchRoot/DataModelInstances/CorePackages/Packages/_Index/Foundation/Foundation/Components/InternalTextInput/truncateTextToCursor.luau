local function _(p0, p1)
	return p0:sub(p1, p1)
end

return function(p2)
	local cursorPosition = p2.CursorPosition
	
	if cursorPosition == -1 then
		return ""
	end
	local text = p2.Text
	local var0 = cursorPosition + p2.AbsoluteSize.X / (p2.TextSize * p2.LineHeight / 1.4)
	local minValue = math.min((string.find(text, "\n", cursorPosition) or 1e999) - 1, string.find(text, "[ \t\f\11]", cursorPosition) or 1e999, #text)
	local var2 = text:sub(cursorPosition, cursorPosition):match("\n")
	
	if var2 then
		local var3 = cursorPosition - 1
		var2 = text:sub(var3, var3):match("\n") or cursorPosition == 1
	end
	if var2 then
		minValue = cursorPosition - 1
	elseif var0 < minValue then
		minValue = cursorPosition
	end
	return utf8.char(utf8.codepoint(text, 1, minValue))
end