local UGCValidationService = game:GetService("UGCValidationService")
local t = { MeshId = true, CageMeshId = true, ReferenceMeshId = true }
local t_1 = {
	TextureId = true,
	MetalnessMap = true,
	NormalMap = true,
	RoughnessMap = true
}

return function(p0) --[[ line: 15 | named "preloadEditablesFromRootInstance" ]]
	-- upvalues: t (ref), UGCValidationService (ref), t_1 (ref)
	local t_2 = {}
	local t_3 = {}
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	
	for i, v in descendants do
		if v:IsA("BinaryStringValue") and t[v.Name] then
			t_2[v.Parent[v.Name]] = UGCValidationService:CreateEditableMeshFromBinaryStringRobloxOnly(v)
		elseif v:IsA("BinaryStringValue") and t_1[v.Name] then
			t_3[v.Parent[v.Name]] = UGCValidationService:CreateEditableImageFromBinaryStringRobloxOnly(v)
		end
	end
	return t_2, t_3
end