-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React)
local usePropertiesBaseModule = require(script.Parent.usePropertiesBase)

return function(p0, p1, ...) --[[ line: 19 | named "usePropertiesDeferred" ]]
	-- upvalues: usePropertiesBaseModule (ref)
	return usePropertiesBaseModule(p0, p1, true, ...)
end