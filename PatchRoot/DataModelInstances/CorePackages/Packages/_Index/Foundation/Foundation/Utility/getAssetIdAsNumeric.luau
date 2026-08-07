-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

return function(value) --[[ line: 3 | named "getAssetIdAsNumeric" ]]
	if typeof(value) == "number" then
		return value
	end
	local var0 = tonumber(value:match("(%d+)$"))
	
	return var0 or -1
end