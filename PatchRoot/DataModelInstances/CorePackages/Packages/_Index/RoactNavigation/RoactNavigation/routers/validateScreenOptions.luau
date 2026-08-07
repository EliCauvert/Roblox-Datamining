-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local invariantModule = require(script.Parent.Parent.utils.invariant)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: invariantModule (ref)
	invariantModule(type(p0.title) ~= "function", "title cannot be defined as a function in navigation options for screen '%s'", p1.routeName)
end