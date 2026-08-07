-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

local useCursor = require(script.Parent.Parent.Parent.Parent.Foundation).Hooks.useCursor
local mapCursorTypeModule = require(script.Parent.Parent.Parent.App.SelectionCursor.mapCursorType)

return function(p0) --[[ line: 14 | named "useSelectionCursor" ]]
	-- upvalues: useCursor (ref), mapCursorTypeModule (ref)
	return useCursor(mapCursorTypeModule(p0, true))
end