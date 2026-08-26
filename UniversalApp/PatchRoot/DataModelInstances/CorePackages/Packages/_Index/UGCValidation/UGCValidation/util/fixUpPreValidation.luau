local parent = script.Parent.Parent
local getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule = require(parent.flags.getEngineFeatureEngineSplitHumanoidRigDescriptionInUpload)
local splitHumanoidRigDescriptionForUploadModule = require(parent.util.SplitHumanoidRigDescriptionForUpload)

return function(p1)
	-- upvalues: getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule (ref), splitHumanoidRigDescriptionForUploadModule (ref)
	local var1 = p1:Clone()
	
	if getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() then
		splitHumanoidRigDescriptionForUploadModule.fixUploadInstance(var1)
	end
	var1 = var1:GetDescendants()
	table.insert(var1, var1)
	
	for i, v in var1 do
		if v.Parent == nil or not v:IsA("Motor6D") and v.Name ~= "OriginalSize" and v.Name ~= "OriginalPosition" and (not v:IsA("Weld") or v.Name ~= "AccessoryWeld") and (not getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() or not v:IsA("Constraint") and not v:isA("NoCollisionConstraint")) then
			if v:IsA("BasePart") then
				v.Velocity = Vector3.new(0, 0, 0)
				v.RotVelocity = Vector3.new(0, 0, 0)
			end
			if v:IsA("MeshPart") and not (if v.Parent then v.Parent:IsA("Accessory") else false) and (v.TextureID == "" and not v:FindFirstChildWhichIsA("SurfaceAppearance")) then
				Instance.new("SurfaceAppearance").Parent = v
			end
		else
			v:Destroy()
		end
	end
	return var1
end