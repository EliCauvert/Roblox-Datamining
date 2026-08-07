-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

local cursorType = require(script.Parent.Parent.Parent.Parent.Foundation).Enums.CursorType

return function(p0, p1) --[[ line: 5 | named "mapCursorType" ]]
	-- upvalues: cursorType (ref)
	return cursorType[string.gsub(tostring(p0), if p1 then "CursorKind%." else "CursorType%.", "")]
end