-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:21 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 7 ]]
	local var0 = 0
	
	for i, v in pairs(p0:GetChildren()) do
		if not p1 or v:IsA(p1) then
			var0 += 1
		end
	end
	return var0
end