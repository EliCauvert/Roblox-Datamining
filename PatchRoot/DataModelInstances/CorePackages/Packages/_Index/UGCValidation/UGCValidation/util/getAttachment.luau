-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "getAttachment" ]]
	local var0
	for i, v in pairs(p1) do
		var0 = p0:FindFirstChild(v)
		
		if var0 then
			return if var0:IsA("Attachment") then var0 else var0
		end
	end
	return nil
end