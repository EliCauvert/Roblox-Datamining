local cursorType = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.CursorType

return function(p0, p1)
	-- upvalues: cursorType (ref)
	return cursorType[string.gsub(tostring(p0), if p1 then "CursorKind%." else "CursorType%.", "")]
end