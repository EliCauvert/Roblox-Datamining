local parent = script.Parent.Parent
local getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule = require(parent.flags.getEngineFeatureEngineSplitHumanoidRigDescriptionInUpload)
local getFFlagUGCValidationStripAccessoryHandleAttributesModule = require(parent.flags.getFFlagUGCValidationStripAccessoryHandleAttributes)
local splitHumanoidRigDescriptionForUploadModule = require(parent.util.SplitHumanoidRigDescriptionForUpload)

return function(p1)
	-- upvalues: getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule (ref), splitHumanoidRigDescriptionForUploadModule (ref), getFFlagUGCValidationStripAccessoryHandleAttributesModule (ref)
	local var1 = p1:Clone()
	
	if getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() then
		splitHumanoidRigDescriptionForUploadModule.fixUploadInstance(var1)
	end
	var1 = var1:GetDescendants()
	table.insert(var1, var1)
	
	for i, v in var1 do
		if v.Parent ~= nil and (v:IsA("Motor6D") or v.Name == "OriginalSize" or v.Name == "OriginalPosition" or v:IsA("Weld") and v.Name == "AccessoryWeld" or getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() and (v:IsA("Constraint") or v:isA("NoCollisionConstraint"))) then
			v:Destroy()
			continue
		end
		if v:IsA("BasePart") then
			v.Velocity = Vector3.new(0, 0, 0)
			v.RotVelocity = Vector3.new(0, 0, 0)
		end
		local var2 = if v.Parent then v.Parent:IsA("Accessory") else false
		
		if v:IsA("MeshPart") and not var2 and (v.TextureID == "" and not v:FindFirstChildWhichIsA("SurfaceAppearance")) then
			Instance.new("SurfaceAppearance").Parent = v
		end
		if getFFlagUGCValidationStripAccessoryHandleAttributesModule() and (v:IsA("MeshPart") or v:IsA("Part")) and (v.Name == "Handle" and var2) then
			for i_1 in v:GetAttributes() do
				v:SetAttribute(i_1, nil)
			end
		end
	end
	return var1
end