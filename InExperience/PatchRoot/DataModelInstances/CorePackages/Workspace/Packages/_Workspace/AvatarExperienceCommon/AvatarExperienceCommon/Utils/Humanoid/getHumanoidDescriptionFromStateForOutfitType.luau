local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local HUMANOIDDESCRIPTIONSCALETONAME = require(AvatarExperienceCommon.Constants).HUMANOID_DESCRIPTION_SCALE_TO_NAME
local SetHumanoidDescriptionColorsFromBodyColor3sModule = require(script.Parent.setHumanoidDescriptionColorsFromBodyColor3s)
local SetMakeupDescriptionsModule = require(script.Parent.setMakeupDescriptions)
local CreateHumanoidDescriptionAccessoryInfoModule = require(script.Parent.createHumanoidDescriptionAccessoryInfo)
local IsMakeupAssetTypeModule = require(AvatarExperienceCommon.Utils.isMakeupAssetType)
local IsValidAssetTypeForOutfitTypeModule = require(AvatarExperienceCommon.Utils.isValidAssetTypeForOutfitType)
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local _ = require(AvatarExperienceCommon.Types.CategoryTypes.CategoryTypes)

return function(p1, p2) --[[ Line: 21 ]]
	-- upvalues: IsValidAssetTypeForOutfitTypeModule (copy), ConstantsModule (copy), CreateHumanoidDescriptionAccessoryInfoModule (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), IsMakeupAssetTypeModule (copy), MutedErrorFunction (copy), SetMakeupDescriptionsModule (copy), HUMANOIDDESCRIPTIONSCALETONAME (copy), SetHumanoidDescriptionColorsFromBodyColor3sModule (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local EquippedAssets = p1.AvatarEditor.Character.EquippedAssets
	local AvatarScales = p1.AvatarEditor.Character.AvatarScales
	local StaticFacialAnimation = nil
	
	if EquippedAssets then
		local List = {}
		local EquippedAssetEntry = nil
		local HeadShape = nil
		
		for i, equippedAsset in EquippedAssets do
			if IsValidAssetTypeForOutfitTypeModule(i, p2) then
				local List1 = {}
				local ASSETTYPETOACCESSORYTYPEEntry = ConstantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[i]
				
				for i1, value in equippedAsset do
					if ASSETTYPETOACCESSORYTYPEEntry then
						table.insert(List, CreateHumanoidDescriptionAccessoryInfoModule(i, i1, value))
					else
						table.insert(List1, i1)
					end
				end
				if ASSETTYPETOACCESSORYTYPEEntry == nil and #List1 > 0 then
					local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ConstantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
					local Joined = table.concat(List1, ",")
					
					if ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry then
						if FFlagParseHeadShapeFromAPIResponse and ConstantsModule.BODY_PART_NAME_TO_ENUM[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] then
							local BodyPartDescription = Instance.new("BodyPartDescription")
							BodyPartDescription.AssetId = List1[1]
							BodyPartDescription.Parent = HumanoidDescription
							BodyPartDescription.BodyPart = ConstantsModule.BODY_PART_NAME_TO_ENUM[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry]
							
							if i == ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead then
								HeadShape = nil
								
								for _, value1 in List1 do
									EquippedAssetEntry = equippedAsset[value1]
									
									if FFlagHeadRefinementFacialAnimationToggle and EquippedAssetEntry and EquippedAssetEntry.staticFacialAnimation ~= nil then
										StaticFacialAnimation = EquippedAssetEntry.staticFacialAnimation
									end
									if EquippedAssetEntry and EquippedAssetEntry.headShape then
										HeadShape = if EquippedAssetEntry.headShape == "Default" then nil else EquippedAssetEntry.headShape
										break
									end
								end
								if HeadShape then
									BodyPartDescription.HeadShape = HeadShape
								end
							end
						else
							HumanoidDescription[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = Joined
						end
					elseif i ~= ConstantsModule.ASSET_TYPE_NAME_TO_ID_STRING.Gear and not IsMakeupAssetTypeModule(i) then
						MutedErrorFunction(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
					end
				end
			end
		end
		HumanoidDescription:SetAccessories(List, true)
		SetMakeupDescriptionsModule(HumanoidDescription, EquippedAssets)
		
		if FFlagHeadRefinementFacialAnimationToggle and StaticFacialAnimation ~= nil then
			HumanoidDescription[ConstantsModule.STATIC_FACIAL_ANIMATION] = StaticFacialAnimation
		end
	end
	if AvatarScales then
		for i2, avatarScale in AvatarScales do
			HumanoidDescription[HUMANOIDDESCRIPTIONSCALETONAME[i2]] = avatarScale
		end
	end
	SetHumanoidDescriptionColorsFromBodyColor3sModule(HumanoidDescription, p1.AvatarEditor.Character.BodyColor3s)
	
	return HumanoidDescription
end