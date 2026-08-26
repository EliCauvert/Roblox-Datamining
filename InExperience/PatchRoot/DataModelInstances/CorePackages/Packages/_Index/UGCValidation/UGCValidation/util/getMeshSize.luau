local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(script.Parent.Parent.util.Types)

return function(p1)
	-- upvalues: UGCValidationService (ref)
	local editableMeshEditableMeshVerts = UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	local var1 = 1e999
	local var2 = -1e999
	local var3 = 1e999
	local var4 = -1e999
	local var5 = 1e999
	local var6 = -1e999
	
	for i = 1, #editableMeshEditableMeshVerts do
		local var7 = editableMeshEditableMeshVerts[i]
		var1 = math.min(var1, var7.X)
		var3 = math.min(var3, var7.Y)
		var5 = math.min(var5, var7.Z)
		var2 = math.max(var2, var7.X)
		var4 = math.max(var4, var7.Y)
		var6 = math.max(var6, var7.Z)
	end
	return Vector3.new(var2 - var1, var4 - var3, var6 - var5)
end