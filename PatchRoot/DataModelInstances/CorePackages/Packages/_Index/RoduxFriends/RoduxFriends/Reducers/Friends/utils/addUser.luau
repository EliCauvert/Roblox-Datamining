-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: llamaModule (ref)
	return if p0 then if llamaModule.List.find(p0, p1) then p0 else llamaModule.List.join(p0, { p1 }) else { p1 }
end