local function _(p1, p2)
	return p1:sub(p2, p2)
end

return function(p1)
	local cursorPosition = p1.CursorPosition
	
	if cursorPosition == -1 then
		return ""
	end
	local text = p1.Text
	local var1 = cursorPosition + p1.AbsoluteSize.X / (p1.TextSize * p1.LineHeight / 1.4)
	local minValue = math.min((string.find(text, "\n", cursorPosition) or 1e999) - 1, string.find(text, "[ \t\f\11]", cursorPosition) or 1e999, #text)
	local var2 = text:sub(cursorPosition, cursorPosition):match("\n")
	
	if var2 then
		local var3 = cursorPosition - 1
		var2 = text:sub(var3, var3):match("\n") or cursorPosition == 1
	end
	if var2 then
		minValue = cursorPosition - 1
	elseif var1 < minValue then
		minValue = cursorPosition
	end
	return utf8.char(utf8.codepoint(text, 1, minValue))
end