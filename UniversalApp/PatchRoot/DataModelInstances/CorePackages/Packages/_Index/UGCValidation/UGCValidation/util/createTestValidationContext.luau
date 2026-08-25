local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(script.Parent.Parent.util.Types)

return function(p0, p1)
	-- upvalues: UGCValidationService (ref)
	local t = {
		isServer = true,
		validateMeshPartAccessories = false,
		assetTypeEnum = p0
	}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1 do
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("BinaryStringValue") then
				if v_1.Name == "MeshId" or v_1.Name == "CageMeshId" or v_1.Name == "ReferenceMeshId" then
					if not t_1[v_1.Parent] then
						t_1[v_1.Parent] = {}
					end
					t_1[v_1.Parent][v_1.Name] = {
						created = true,
						instance = UGCValidationService:CreateEditableMeshFromBinaryStringRobloxOnly(v_1)
					}
				elseif not t_2[v_1.Parent] then
					t_2[v_1.Parent] = {}
				end
				t_2[v_1.Parent][v_1.Name] = {
					created = true,
					instance = UGCValidationService:CreateEditableImageFromBinaryStringRobloxOnly(v_1)
				}
			end
		end
	end
	t.editableMeshes = t_1
	t.editableImages = t_2
	
	return t
end