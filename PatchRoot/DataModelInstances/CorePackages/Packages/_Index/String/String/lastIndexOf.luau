-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 16 | named "lastIndexOf" ]]
	local var0 = string.len(p0)
	local var1 = if p2 and p2 < 1 then 1 else p2 or var0
	
	if p2 and var0 < p2 then
		var1 = var0
	end
	if p1 == "" then
		return var1
	end
	local var4
	local _ = nil
	local var2 = nil
	local var3 = 0
	repeat
		var4 = var2
		local matchIndex, matchIndex_1 = string.find(p0, p1, var3 + 1, true)
		var2 = matchIndex
		var3 = matchIndex_1
	until var2 == nil or var1 < var2
	return if var4 == nil then -1 else var4
end