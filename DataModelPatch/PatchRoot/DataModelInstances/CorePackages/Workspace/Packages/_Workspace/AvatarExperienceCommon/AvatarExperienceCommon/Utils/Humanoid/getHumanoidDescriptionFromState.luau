local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local ASSETTYPENAMETOIDSTRING = require(AvatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING
local ASSETTYPETOACCESSORYTYPE = require(AvatarExperienceCommon.Constants).ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP = require(AvatarExperienceCommon.Constants).ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local HUMANOIDDESCRIPTIONSCALETONAME = require(AvatarExperienceCommon.Constants).HUMANOID_DESCRIPTION_SCALE_TO_NAME
local SetHumanoidDescriptionColorsFromBodyColor3sModule = require(script.Parent.setHumanoidDescriptionColorsFromBodyColor3s)
local CreateHumanoidDescriptionAccessoryInfoModule = require(script.Parent.createHumanoidDescriptionAccessoryInfo)
local SetMakeupDescriptionsModule = require(script.Parent.setMakeupDescriptions)
local IsMakeupAssetTypeModule = require(AvatarExperienceCommon.Utils.isMakeupAssetType)
local FFlagAXMakeupEquipping = require(Parent.AvatarExperienceFlags).FFlagAXMakeupEquipping

return function(p1)
	-- upvalues: ASSETTYPETOACCESSORYTYPE (copy), CreateHumanoidDescriptionAccessoryInfoModule (copy), ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP (copy), ASSETTYPENAMETOIDSTRING (copy), FFlagAXMakeupEquipping (copy), IsMakeupAssetTypeModule (copy), MutedErrorFunction (copy), SetMakeupDescriptionsModule (copy), HUMANOIDDESCRIPTIONSCALETONAME (copy), SetHumanoidDescriptionColorsFromBodyColor3sModule (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local EquippedAssets = p1.AvatarEditor.Character.EquippedAssets
	local AvatarScales = p1.AvatarEditor.Character.AvatarScales
	
	if EquippedAssets then
		local List = {}
		
		for i, equippedAsset in EquippedAssets do
			local List1 = {}
			local ASSETTYPETOACCESSORYTYPEEntry = ASSETTYPETOACCESSORYTYPE[i]
			
			for i1, value in equippedAsset do
				if ASSETTYPETOACCESSORYTYPEEntry then
					table.insert(List, CreateHumanoidDescriptionAccessoryInfoModule(i, i1, value))
				else
					table.insert(List1, i1)
				end
			end
			if ASSETTYPETOACCESSORYTYPEEntry == nil and #List1 > 0 then
				local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[i]
				local Joined = table.concat(List1, ",")
				
				if ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry then
					HumanoidDescription[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = Joined
				elseif i ~= ASSETTYPENAMETOIDSTRING.Gear and (not FFlagAXMakeupEquipping or not IsMakeupAssetTypeModule(i)) then
					MutedErrorFunction(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
				end
			end
		end
		HumanoidDescription:SetAccessories(List, true)
		
		if FFlagAXMakeupEquipping then
			SetMakeupDescriptionsModule(HumanoidDescription, EquippedAssets)
		end
	end
	if AvatarScales then
		for i2, avatarScale in AvatarScales do
			HumanoidDescription[HUMANOIDDESCRIPTIONSCALETONAME[i2]] = avatarScale
		end
	end
	SetHumanoidDescriptionColorsFromBodyColor3sModule(HumanoidDescription, p1.AvatarEditor.Character.BodyColor3s)
	local Emotes = {}
	local List = {}
	
	for _, value1 in p1.AvatarEditor.EquippedEmotes.slotInfo do
		Emotes[tostring(value1.assetId)] = { (tonumber(value1.assetId)) }
		table.insert(List, { Slot = value1.position, Name = tostring(value1.assetId) })
	end
	HumanoidDescription:SetEmotes(Emotes)
	HumanoidDescription:SetEquippedEmotes(List)
	
	return HumanoidDescription
end