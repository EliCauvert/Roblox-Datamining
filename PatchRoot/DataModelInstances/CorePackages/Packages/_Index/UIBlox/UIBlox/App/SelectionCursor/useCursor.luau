-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.React)
local useCursor = require(parent.Foundation).Hooks.useCursor

return function(p0, p1, p2) --[[ line: 7 | named "useCursor" ]]
	-- upvalues: useCursor (ref)
	return useCursor({ radius = p0, offset = p1, borderWidth = p2 })
end