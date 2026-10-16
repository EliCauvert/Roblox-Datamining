local CursorType = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.CursorType

return function(p1, p2) --[[ Line: 5 | Named "mapCursorType" ]]
	-- upvalues: CursorType (copy)
	return CursorType[string.gsub(tostring(p1), if p2 then "CursorKind%." else "CursorType%.", "")]
end