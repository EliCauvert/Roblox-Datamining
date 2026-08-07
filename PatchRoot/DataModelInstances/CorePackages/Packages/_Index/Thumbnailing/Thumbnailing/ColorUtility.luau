-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:28 2026 Pacific Standard Time.

return {
	Color3FromString = function(p0) --[[ line: 4 ]]
		local var0, var1, var2 = unpack(p0:split("/"))
		
		return Color3.fromRGB(tonumber(var0), tonumber(var1), tonumber(var2))
	end
}