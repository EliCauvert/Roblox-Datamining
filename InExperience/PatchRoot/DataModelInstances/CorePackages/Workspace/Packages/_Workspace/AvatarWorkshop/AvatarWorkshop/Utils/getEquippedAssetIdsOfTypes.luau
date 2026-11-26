local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local AssetTypeToAccessoryType = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeToAccessoryType
local GetPropertyAssetFunction = require(script.Parent.HumanoidDescriptionAssets).getPropertyAsset

local function getEquippedEmoteIds(HumanoidDescription)
	local Emotes = HumanoidDescription:GetEmotes()
	local EquippedEmotes = HumanoidDescription:GetEquippedEmotes()
	table.sort(EquippedEmotes, function(A, B): boolean
		return A.Slot < B.Slot
	end)
	local List = {}
	
	for _, equippedEmote in EquippedEmotes do
		local Emote = Emotes[equippedEmote.Name]
		
		if Emote then
			for _, value in Emote do
				table.insert(List, value)
			end
		end
	end
	return List
end

return function(p1, List)
	-- upvalues: AssetTypeToAccessoryType (copy), getEquippedEmoteIds (copy), GetPropertyAssetFunction (copy)
	local HumanoidDescription = p1.humanoidDescription
	local List1 = {}
	local t = {}
	
	for _, value in List do
		local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[value]
		
		if AssetTypeToAccessoryTypeEntry then
			t[AssetTypeToAccessoryTypeEntry] = true
		end
	end
	if next(t) ~= nil then
		for _, accessory in HumanoidDescription:GetAccessories(true) do
			if t[accessory.AccessoryType] then
				table.insert(List1, (tostring(accessory.AssetId)))
			end
		end
	end
	for _, AvatarAssetType in List do
		if AvatarAssetType ~= Enum.AvatarAssetType.Gear then
			if AvatarAssetType ~= Enum.AvatarAssetType.EmoteAnimation then
				local PropertyAsset = GetPropertyAssetFunction(HumanoidDescription, AvatarAssetType)
				
				if PropertyAsset and PropertyAsset ~= 0 and not table.find(List1, (tostring(PropertyAsset))) then
					table.insert(List1, (tostring(PropertyAsset)))
					continue
				end
				continue
			end
			for _, value1 in getEquippedEmoteIds(HumanoidDescription) do
				table.insert(List1, (tostring(value1)))
			end
		elseif p1.gearId then
			table.insert(List1, (tostring(p1.gearId)))
		end
	end
	return List1
end