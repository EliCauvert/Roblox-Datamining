local Parent = script.Parent.Parent
local GetEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule = require(Parent.flags.getEngineFeatureEngineSplitHumanoidRigDescriptionInUpload)
local SplitHumanoidRigDescriptionForUploadModule = require(Parent.util.SplitHumanoidRigDescriptionForUpload)

return function(Object)
	-- upvalues: GetEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule (copy), SplitHumanoidRigDescriptionForUploadModule (copy)
	local ObjectClone = Object:Clone()
	
	if GetEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() then
		SplitHumanoidRigDescriptionForUploadModule.fixUploadInstance(ObjectClone)
	end
	local Descendants = ObjectClone:GetDescendants()
	table.insert(Descendants, ObjectClone)
	
	for _, descendant in Descendants do
		if descendant.Parent ~= nil and (descendant:IsA("Motor6D") or descendant.Name == "OriginalSize" or descendant.Name == "OriginalPosition" or descendant:IsA("Weld") and descendant.Name == "AccessoryWeld" or GetEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() and (descendant:IsA("Constraint") or descendant:isA("NoCollisionConstraint"))) then
			descendant:Destroy()
			continue
		end
		if descendant:IsA("BasePart") then
			descendant.Velocity = vector.create(0, 0, 0)
			descendant.RotVelocity = vector.create(0, 0, 0)
		end
		local IsAccessory = if descendant.Parent then descendant.Parent:IsA("Accessory") else false
		
		if descendant:IsA("MeshPart") and not IsAccessory and descendant.TextureID == "" and not descendant:FindFirstChildWhichIsA("SurfaceAppearance") then
			Instance.new("SurfaceAppearance").Parent = descendant
		end
	end
	return ObjectClone
end