-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:07 2026 Pacific Standard Time.

local var0 = newproxy(true)

getmetatable(var0).__tostring = function() --[[ line: 10 ]]
	return "UsageGraphSentinel"
end

return {
	UsageGraphKey = var0,
	getUsageGraph = function(p0) --[[ line: 14 ]]
		-- upvalues: var0 (ref)
		return table.clone(p0[var0])
	end
}