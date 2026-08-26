local cursorType = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.CursorType

return function(p1, p2)
	-- upvalues: cursorType (ref)
	return cursorType[string.gsub(tostring(p1), if p2 then "CursorKind%." else "CursorType%.", "")]
end