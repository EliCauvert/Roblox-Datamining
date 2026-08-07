-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:22 2026 Pacific Standard Time.

local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local tutils = dependenciesModule.tutils
local llama = dependenciesModule.llama

return function(p0) --[[ line: 7 ]]
	-- upvalues: llama (ref), tutils (ref)
	if llama.isEmpty(p0) then
		return "{}"
	end
	local replaced, _ = string.gsub(" args: " .. tutils.toString(p0), "%s+", " ")
	
	return replaced
end