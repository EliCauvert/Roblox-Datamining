local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local AssetTypeFromId = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeFromId
local EnableFacsDisableOverride2EngineFeature = game:GetEngineFeature("EnableFacsDisableOverride2")

local function _(Vector)
	return if Vector then Vector3.new(Vector.X, Vector.Y, Vector.Z) else nil
end

local _ = function(p1, p2)
	-- upvalues: EnableFacsDisableOverride2EngineFeature (copy), HumanoidDescriptionAssetsModule (copy)
	if EnableFacsDisableOverride2EngineFeature then
		p1.StaticFacialAnimation = (if p2 then p2.staticFacialAnimation else nil) == true
	end
	local HeadShape = if p2 then p2.headShape else nil
	local HeadPartDescription = HumanoidDescriptionAssetsModule.getHeadPartDescription(p1)
	
	if HeadPartDescription then
		HeadPartDescription.HeadShape = if HeadShape == nil or HeadShape == "Default" then "" else HeadShape
	end
end

return function(HumanoidDescription, p1)
	-- upvalues: HumanoidDescriptionAssetsModule (copy), AssetTypeFromId (copy), EnableFacsDisableOverride2EngineFeature (copy)
	local Accessories = HumanoidDescriptionAssetsModule.getAccessories(HumanoidDescription)
	local Id = nil
	
	for _, asset in p1.assets do
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
						local Position = Meta.position
						AccessoryInfo.Position = if Position then Vector3.new(Position.X, Position.Y, Position.Z) else nil
						local Rotation = Meta.rotation
						AccessoryInfo.Rotation = if Rotation then Vector3.new(Rotation.X, Rotation.Y, Rotation.Z) else nil
						local Scale = Meta.scale
						AccessoryInfo.Scale = if Scale then Vector3.new(Scale.X, Scale.Y, Scale.Z) else nil
					end
					table.insert(Accessories, AccessoryInfo)
				elseif HumanoidDescriptionAssetsModule.setPropertyAsset(HumanoidDescription, AssetTypeFromIdEntry, asset.id) then
					if AssetTypeFromIdEntry == Enum.AvatarAssetType.Head or AssetTypeFromIdEntry == Enum.AvatarAssetType.DynamicHead then
						if EnableFacsDisableOverride2EngineFeature then
							HumanoidDescription.StaticFacialAnimation = (if Meta then Meta.staticFacialAnimation else nil) == true
						end
						local HeadShape = if Meta then Meta.headShape else nil
						local HeadPartDescription = HumanoidDescriptionAssetsModule.getHeadPartDescription(HumanoidDescription)
						
						if HeadPartDescription then
							HeadPartDescription.HeadShape = if HeadShape == nil or HeadShape == "Default" then "" else HeadShape
						end
					end
				else
					HumanoidDescriptionAssetsModule.addChildAsset(HumanoidDescription, AssetTypeFromIdEntry, asset.id, Order)
				end
			end
		end
	end
	HumanoidDescription:SetAccessories(Accessories, true)
	
	return Id
end