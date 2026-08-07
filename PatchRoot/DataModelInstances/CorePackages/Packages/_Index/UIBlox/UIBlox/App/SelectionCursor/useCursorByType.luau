-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local useCursor = require(parent.Foundation).Hooks.useCursor
local _ = require(parent.React)
local mapCursorTypeModule = require(script.Parent.mapCursorType)

return function(p0) --[[ line: 8 | named "useCursorByType" ]]
	-- upvalues: useCursor (ref), mapCursorTypeModule (ref)
	return useCursor(mapCursorTypeModule(p0))
end