-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "isMeshPartAccessory" ]]
	if p0:IsA("Accessory") then
		local handle = p0:FindFirstChild("Handle")
		
		return handle and handle:IsA("MeshPart")
	end
end