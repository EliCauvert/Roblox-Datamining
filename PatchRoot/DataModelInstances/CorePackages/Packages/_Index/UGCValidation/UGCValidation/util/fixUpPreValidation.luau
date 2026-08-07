-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule = require(parent.flags.getEngineFeatureEngineSplitHumanoidRigDescriptionInUpload)
local splitHumanoidRigDescriptionForUploadModule = require(parent.util.SplitHumanoidRigDescriptionForUpload)

return function(p0) --[[ line: 15 | named "fixUpPreValidation" ]]
	-- upvalues: getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule (ref), splitHumanoidRigDescriptionForUploadModule (ref)
	local var2 = p0:Clone()
	
	if getEngineFeatureEngineSplitHumanoidRigDescriptionInUploadModule() then
		splitHumanoidRigDescriptionForUploadModule.fixUploadInstance(var2)
	end
	var2 = var2:GetDescendants()
	table.insert(var2, var2)
	
	for i, v in var2 do
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
	return var2
end