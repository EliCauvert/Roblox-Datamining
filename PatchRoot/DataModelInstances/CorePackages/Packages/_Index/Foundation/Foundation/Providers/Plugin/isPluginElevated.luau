-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

return function(p0) --[[ line: 5 | named "isPluginElevated" ]]
	return pcall(function() --[[ line: 6 ]]
		-- upvalues: p0 (ref)
		return p0:GetPluginComponent("Panels")
	end)
end