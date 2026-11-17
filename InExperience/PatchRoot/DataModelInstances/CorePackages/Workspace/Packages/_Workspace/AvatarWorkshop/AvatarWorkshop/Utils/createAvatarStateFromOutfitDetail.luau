local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local AssetTypeFromId = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeFromId

local function _(p1, p2)
	return if p1 then Color3.fromHex(p1) else p2
end

local _ = function(Vector)
	return if Vector then Vector3.new(Vector.X, Vector.Y, Vector.Z) else nil
end

local function applyDynamicHeadMeta(HumanoidDescription, p1)
	if p1.staticFacialAnimation ~= nil then
		HumanoidDescription.StaticFacialAnimation = p1.staticFacialAnimation
	end
	if p1.headShape == nil or p1.headShape == "Default" then return end
	for _, BodyPartDescription in HumanoidDescription:GetChildren() do
		if BodyPartDescription:IsA("BodyPartDescription") and BodyPartDescription.BodyPart == Enum.BodyPart.Head then
			BodyPartDescription.HeadShape = p1.headShape
		end
	end
end

return function(p2)
	-- upvalues: AssetTypeFromId (copy), HumanoidDescriptionAssetsModule (copy), applyDynamicHeadMeta (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local BodyColor3s = p2.bodyColor3s
	local HeadColor3 = BodyColor3s.headColor3
	local HeadColor = HumanoidDescription.HeadColor
	HumanoidDescription.HeadColor = if HeadColor3 then Color3.fromHex(HeadColor3) else HeadColor
	local TorsoColor3 = BodyColor3s.torsoColor3
	local TorsoColor = HumanoidDescription.TorsoColor
	HumanoidDescription.TorsoColor = if TorsoColor3 then Color3.fromHex(TorsoColor3) else TorsoColor
	local LeftArmColor3 = BodyColor3s.leftArmColor3
	local LeftArmColor = HumanoidDescription.LeftArmColor
	HumanoidDescription.LeftArmColor = if LeftArmColor3 then Color3.fromHex(LeftArmColor3) else LeftArmColor
	local RightArmColor3 = BodyColor3s.rightArmColor3
	local RightArmColor = HumanoidDescription.RightArmColor
	HumanoidDescription.RightArmColor = if RightArmColor3 then Color3.fromHex(RightArmColor3) else RightArmColor
	local LeftLegColor3 = BodyColor3s.leftLegColor3
	local LeftLegColor = HumanoidDescription.LeftLegColor
	HumanoidDescription.LeftLegColor = if LeftLegColor3 then Color3.fromHex(LeftLegColor3) else LeftLegColor
	local RightLegColor3 = BodyColor3s.rightLegColor3
	local RightLegColor = HumanoidDescription.RightLegColor
	HumanoidDescription.RightLegColor = if RightLegColor3 then Color3.fromHex(RightLegColor3) else RightLegColor
	local Scales = p2.scales
	HumanoidDescription.HeightScale = Scales.height or HumanoidDescription.HeightScale
	HumanoidDescription.WidthScale = Scales.width or HumanoidDescription.WidthScale
	HumanoidDescription.HeadScale = Scales.head or HumanoidDescription.HeadScale
	HumanoidDescription.DepthScale = Scales.depth or HumanoidDescription.DepthScale
	HumanoidDescription.ProportionScale = Scales.proportion or HumanoidDescription.ProportionScale
	HumanoidDescription.BodyTypeScale = Scales.bodyType or HumanoidDescription.BodyTypeScale
	local AccessoryInfos = {}
	local Id = nil
	
	for _, asset in p2.assets do
		local AssetTypeFromIdEntry = AssetTypeFromId[asset.assetType.id]
		
		if AssetTypeFromIdEntry ~= nil then
			if AssetTypeFromIdEntry == Enum.AvatarAssetType.Gear then
				Id = asset.id
			else
				local Meta = asset.meta
				local Order = if Meta then Meta.order else nil
				local AccessoryInfo = HumanoidDescriptionAssetsModule.createAccessoryInfo(asset.id, AssetTypeFromIdEntry, Order)
				
				if AccessoryInfo then
					if Meta then
						if AccessoryInfo.IsLayered then
							AccessoryInfo.Puffiness = Meta.puffiness
						end
						local Position = Meta.position
						AccessoryInfo.Position = if Position then Vector3.new(Position.X, Position.Y, Position.Z) else nil
						local Rotation = Meta.rotation
						AccessoryInfo.Rotation = if Rotation then Vector3.new(Rotation.X, Rotation.Y, Rotation.Z) else nil
						local Scale = Meta.scale
						AccessoryInfo.Scale = if Scale then Vector3.new(Scale.X, Scale.Y, Scale.Z) else nil
					end
					table.insert(AccessoryInfos, AccessoryInfo)
				elseif not HumanoidDescriptionAssetsModule.setPropertyAsset(HumanoidDescription, AssetTypeFromIdEntry, asset.id) then
					HumanoidDescriptionAssetsModule.addChildAsset(HumanoidDescription, AssetTypeFromIdEntry, asset.id, Order)
				elseif Meta and AssetTypeFromIdEntry == Enum.AvatarAssetType.DynamicHead then
					applyDynamicHeadMeta(HumanoidDescription, Meta)
				end
			end
		end
	end
	HumanoidDescription:SetAccessories(AccessoryInfos, true)
	
	return {
		humanoidDescription = HumanoidDescription,
		rigType = if p2.playerAvatarType == "R6" then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15,
		gearId = Id
	}
end