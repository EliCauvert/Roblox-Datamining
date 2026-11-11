local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local AdjustmentSliderTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local AccessoryAdjustmentUtils = {
	sliderInfoToVector3s = function(p1)
		-- upvalues: AdjustmentSliderTypeModule (copy)
		return Vector3.new(p1[AdjustmentSliderTypeModule.PositionX], p1[AdjustmentSliderTypeModule.PositionY], p1[AdjustmentSliderTypeModule.PositionZ]), Vector3.new(p1[AdjustmentSliderTypeModule.RotationX], p1[AdjustmentSliderTypeModule.RotationY], p1[AdjustmentSliderTypeModule.RotationZ]), (Vector3.new(p1[AdjustmentSliderTypeModule.Scale], p1[AdjustmentSliderTypeModule.Scale], p1[AdjustmentSliderTypeModule.Scale]))
	end,
	vector3sToSliderInfo = function(Position, Rotation, Scale)
		-- upvalues: AdjustmentSliderTypeModule (copy)
		return {
			[AdjustmentSliderTypeModule.PositionX] = Position.X,
			[AdjustmentSliderTypeModule.PositionY] = Position.Y,
			[AdjustmentSliderTypeModule.PositionZ] = Position.Z,
			[AdjustmentSliderTypeModule.RotationX] = Rotation.X,
			[AdjustmentSliderTypeModule.RotationY] = Rotation.Y,
			[AdjustmentSliderTypeModule.RotationZ] = Rotation.Z,
			[AdjustmentSliderTypeModule.Scale] = Scale.X
		}
	end
}

function AccessoryAdjustmentUtils.getEquippedSliderValues(List, p1)
	-- upvalues: AccessoryAdjustmentUtils (copy)
	for _, value in List do
		for i, value1 in value do
			if i == p1 then
				return AccessoryAdjustmentUtils.vector3sToSliderInfo(if value1.position then value1.position else Vector3.new(), if value1.rotation then value1.rotation else Vector3.new(), if value1.scale then value1.scale else vector.create(1, 1, 1))
			end
		end
	end
	return nil
end

function AccessoryAdjustmentUtils.getTryOnAdjustments(Bundle)
	-- upvalues: AccessoryAdjustmentUtils (copy)
	return AccessoryAdjustmentUtils.vector3sToSliderInfo(if Bundle.position then Bundle.position else Vector3.new(), if Bundle.rotation then Bundle.rotation else Vector3.new(), if Bundle.scale then Bundle.scale else vector.create(1, 1, 1))
end

function AccessoryAdjustmentUtils.getTryOnSliderValues(List, ItemId)
	-- upvalues: AccessoryAdjustmentUtils (copy), ConstantsModule (copy)
	for _, value in List do
		if value.itemType == "Asset" and value.itemId == ItemId then
			return AccessoryAdjustmentUtils.getTryOnAdjustments(value)
		end
		if value.itemType == "Bundle" then
			for _, value1 in List do
				if value1.bundleInfo and value1.bundleInfo[ItemId] then
					return AccessoryAdjustmentUtils.getTryOnAdjustments(value1.bundleInfo[ItemId])
				end
			end
		end
	end
	return ConstantsModule.DefaultSliderValues
end

local function _(p2): boolean
	return p2.position and p2.position ~= Vector3.new() or (p2.rotation and p2.rotation ~= Vector3.new() or (if p2.scale then p2.scale ~= vector.create(1, 1, 1) else false))
end

function AccessoryAdjustmentUtils.checkTryOnHasAdjustments(List, ItemId): boolean
	for _, value in List do
		if value.itemType == "Asset" and value.itemId == ItemId then
			return value.position and value.position ~= Vector3.new() or (value.rotation and value.rotation ~= Vector3.new() or (if value.scale then value.scale ~= vector.create(1, 1, 1) else false))
		end
		if value.itemType == "Bundle" then
			for _, value1 in List do
				if value1.bundleInfo and value1.bundleInfo[ItemId] then
					local Bundle = value1.bundleInfo[ItemId]
					
					return Bundle.position and Bundle.position ~= Vector3.new() or (Bundle.rotation and Bundle.rotation ~= Vector3.new() or (if Bundle.scale then Bundle.scale ~= vector.create(1, 1, 1) else false))
				end
			end
		end
	end
	return false
end

function AccessoryAdjustmentUtils.getSliderValuesWithDefault(p2, p3, p4)
	-- upvalues: AccessoryAdjustmentUtils (copy), ConstantsModule (copy)
	return AccessoryAdjustmentUtils.getEquippedSliderValues(p2, p4) or (AccessoryAdjustmentUtils.getTryOnSliderValues(p3, p4) or ConstantsModule.DefaultSliderValues)
end

function AccessoryAdjustmentUtils.checkSliderValuesChanged(p2, List): boolean
	-- upvalues: UtilsModule (copy)
	local Flag = false
	
	for i, value in List do
		if not UtilsModule.fuzzyEq(p2[i], value) then
			Flag = true
		end
	end
	return Flag
end

function AccessoryAdjustmentUtils.getAdjustableAccessories(Humanoid: Humanoid, List)
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy)
	local Accessories = Humanoid:GetAccessories(true)
	local List1 = {}
	local t = {}
	
	for _, value in List do
		t[tostring(value)] = true
	end
	for _, accessory in Accessories do
		if t[ConstantsModule1.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]] and not accessory.IsLayered then
			local SelectedAccessoryDescription = UtilsModule.getSelectedAccessoryDescription(Humanoid, accessory.AssetId)
			
			if SelectedAccessoryDescription then
				local Success, Result = pcall(function()
					-- upvalues: SelectedAccessoryDescription (copy)
					return SelectedAccessoryDescription:GetAppliedInstance()
				end)
				
				if Success then
					local Handle = Result:FindFirstChild("Handle")
					
					if Handle and Handle:IsA("MeshPart") and Handle.HasSkinnedMesh then
						continue
					end
				end
			end
			table.insert(List1, (tostring(accessory.AssetId)))
		end
	end
	return List1
end

return AccessoryAdjustmentUtils