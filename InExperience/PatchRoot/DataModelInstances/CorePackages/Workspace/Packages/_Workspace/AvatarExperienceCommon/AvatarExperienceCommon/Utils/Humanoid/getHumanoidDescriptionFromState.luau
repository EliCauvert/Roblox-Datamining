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
local FFlagAXOutfitPageRevamp = require(Parent.AvatarExperienceFlags).FFlagAXOutfitPageRevamp
local GetHumanoidDescriptionFromStateForOutfitTypeModule = require(AvatarExperienceCommon.Utils.Humanoid.getHumanoidDescriptionFromStateForOutfitType)

return function(p1)
	-- upvalues: FFlagAXOutfitPageRevamp (copy), GetHumanoidDescriptionFromStateForOutfitTypeModule (copy), ASSETTYPETOACCESSORYTYPE (copy), CreateHumanoidDescriptionAccessoryInfoModule (copy), ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP (copy), ASSETTYPENAMETOIDSTRING (copy), IsMakeupAssetTypeModule (copy), MutedErrorFunction (copy), SetMakeupDescriptionsModule (copy), HUMANOIDDESCRIPTIONSCALETONAME (copy), SetHumanoidDescriptionColorsFromBodyColor3sModule (copy)
	local HumanoidDescriptionFromStateForOutfitTypeModule = nil
	if FFlagAXOutfitPageRevamp then
		HumanoidDescriptionFromStateForOutfitTypeModule = GetHumanoidDescriptionFromStateForOutfitTypeModule(p1, nil)
	else
		HumanoidDescriptionFromStateForOutfitTypeModule = Instance.new("HumanoidDescription")
		local EquippedAssets = p1.AvatarEditor.Character.EquippedAssets
		local AvatarScales = p1.AvatarEditor.Character.AvatarScales
		
		if EquippedAssets then
			local List1 = {}
			
			for i, equippedAsset in EquippedAssets do
				local List2 = {}
				local ASSETTYPETOACCESSORYTYPEEntry = ASSETTYPETOACCESSORYTYPE[i]
				
				for i1, value in equippedAsset do
					if ASSETTYPETOACCESSORYTYPEEntry then
						table.insert(List1, CreateHumanoidDescriptionAccessoryInfoModule(i, i1, value))
					else
						table.insert(List2, i1)
					end
				end
				if ASSETTYPETOACCESSORYTYPEEntry == nil and #List2 > 0 then
					local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[i]
					local Joined = table.concat(List2, ",")
					
					if ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry then
						HumanoidDescriptionFromStateForOutfitTypeModule[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = Joined
					elseif i ~= ASSETTYPENAMETOIDSTRING.Gear and not IsMakeupAssetTypeModule(i) then
						MutedErrorFunction(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
					end
				end
			end
			HumanoidDescriptionFromStateForOutfitTypeModule:SetAccessories(List1, true)
			SetMakeupDescriptionsModule(HumanoidDescriptionFromStateForOutfitTypeModule, EquippedAssets)
		end
		if AvatarScales then
			for i2, avatarScale in AvatarScales do
				HumanoidDescriptionFromStateForOutfitTypeModule[HUMANOIDDESCRIPTIONSCALETONAME[i2]] = avatarScale
			end
		end
		SetHumanoidDescriptionColorsFromBodyColor3sModule(HumanoidDescriptionFromStateForOutfitTypeModule, p1.AvatarEditor.Character.BodyColor3s)
	end
	local Emotes = {}
	local List = {}
	
	for _, value1 in p1.AvatarEditor.EquippedEmotes.slotInfo do
		Emotes[tostring(value1.assetId)] = { (tonumber(value1.assetId)) }
		table.insert(List, { Slot = value1.position, Name = tostring(value1.assetId) })
	end
	HumanoidDescriptionFromStateForOutfitTypeModule:SetEmotes(Emotes)
	HumanoidDescriptionFromStateForOutfitTypeModule:SetEquippedEmotes(List)
	
	return HumanoidDescriptionFromStateForOutfitTypeModule
end