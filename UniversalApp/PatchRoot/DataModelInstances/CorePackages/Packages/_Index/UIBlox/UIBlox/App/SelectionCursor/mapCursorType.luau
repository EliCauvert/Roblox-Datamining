local cursorType = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.CursorType

return function(p0, p1) --[[ line: 5 | named "mapCursorType" ]]
	-- upvalues: cursorType (ref)
	return cursorType[string.gsub(tostring(p0), if p1 then "CursorKind%." else "CursorType%.", "")]
end