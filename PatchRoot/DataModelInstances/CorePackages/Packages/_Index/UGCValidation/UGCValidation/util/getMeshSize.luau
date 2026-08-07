-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(script.Parent.Parent.util.Types)

return function(p0) --[[ line: 7 | named "getMeshSize" ]]
	-- upvalues: UGCValidationService (ref)
	local editableMeshEditableMeshVerts = UGCValidationService:GetEditableMeshVerts(p0.editableMesh)
	local var2 = 1e999
	local var3 = -1e999
	local var4 = 1e999
	local var5 = -1e999
	local var6 = 1e999
	local var7 = -1e999
	
	for i = 1, #editableMeshEditableMeshVerts do
		local var8 = editableMeshEditableMeshVerts[i]
		var2 = math.min(var2, var8.X)
		var4 = math.min(var4, var8.Y)
		var6 = math.min(var6, var8.Z)
		var3 = math.max(var3, var8.X)
		var5 = math.max(var5, var8.Y)
		var7 = math.max(var7, var8.Z)
	end
	return Vector3.new(var3 - var2, var5 - var4, var7 - var6)
end