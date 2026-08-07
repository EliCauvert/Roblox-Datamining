local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local mutedError = require(parent.Loggers).mutedError
local HUMANOID_DESCRIPTION_SCALE_TO_NAME = require(avatarExperienceCommon.Constants).HUMANOID_DESCRIPTION_SCALE_TO_NAME
local setHumanoidDescriptionColorsFromBodyColor3sModule = require(script.Parent.setHumanoidDescriptionColorsFromBodyColor3s)
local setMakeupDescriptionsModule = require(script.Parent.setMakeupDescriptions)
local createHumanoidDescriptionAccessoryInfoModule = require(script.Parent.createHumanoidDescriptionAccessoryInfo)
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local isValidAssetTypeForOutfitTypeModule = require(avatarExperienceCommon.Utils.isValidAssetTypeForOutfitType)
local constantsModule = require(avatarExperienceCommon.Constants)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMakeupEquipping = avatarExperienceFlagsModule.FFlagAXMakeupEquipping
local fFlagParseHeadShapeFromAPIResponse = avatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local fFlagHeadRefinementFacialAnimationToggle = avatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)

return function(p0, p1) --[[ line: 22 ]]
	-- upvalues: isValidAssetTypeForOutfitTypeModule (ref), constantsModule (ref), createHumanoidDescriptionAccessoryInfoModule (ref), fFlagParseHeadShapeFromAPIResponse (ref), fFlagHeadRefinementFacialAnimationToggle (ref), fFlagAXMakeupEquipping (ref), isMakeupAssetTypeModule (ref), mutedError (ref), setMakeupDescriptionsModule (ref), HUMANOID_DESCRIPTION_SCALE_TO_NAME (ref), setHumanoidDescriptionColorsFromBodyColor3sModule (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	local equippedAssets = p0.AvatarEditor.Character.EquippedAssets
	local avatarScales = p0.AvatarEditor.Character.AvatarScales
	local staticFacialAnimation = nil
	
	if equippedAssets then
		local i_1, var15
		local t = {}
		
		for i, v in equippedAssets do
			if isValidAssetTypeForOutfitTypeModule(i, p1) then
				local t_1 = {}
				local var11 = constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[i]
				
				for i_1, v_1 in v do
					if var11 then
						table.insert(t, createHumanoidDescriptionAccessoryInfoModule(i, i_1, v_1))
					else
						table.insert(t_1, i_1)
					end
				end
				if var11 == nil and #t_1 > 0 then
					local var12 = constantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
					local joined = table.concat(t_1, ",")
					
					if var12 then
						if fFlagParseHeadShapeFromAPIResponse and constantsModule.BODY_PART_NAME_TO_ENUM[var12] then
							local bodyPartDescription = Instance.new("BodyPartDescription")
							bodyPartDescription.AssetId = t_1[1]
							bodyPartDescription.Parent = humanoidDescription
							bodyPartDescription.BodyPart = constantsModule.BODY_PART_NAME_TO_ENUM[var12]
							
							if i == constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead then
								i_1 = nil
								
								for i_2, v_2 in t_1 do
									var15 = v[v_2]
									
									if fFlagHeadRefinementFacialAnimationToggle and var15 and var15.staticFacialAnimation ~= nil then
										staticFacialAnimation = var15.staticFacialAnimation
									end
									if var15 and var15.headShape then
										i_1 = if var15.headShape == "Default" then nil else var15.headShape
										break
									end
								end
								if i_1 then
									bodyPartDescription.HeadShape = i_1
								end
							end
						else
							humanoidDescription[var12] = joined
						end
					elseif i ~= constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.Gear and (not fFlagAXMakeupEquipping or not isMakeupAssetTypeModule(i)) then
						mutedError(string.format("assetTypeId: %s not recognized as member of humanoidDescription", tostring(i)))
					end
				end
			end
		end
		humanoidDescription:SetAccessories(t, true)
		
		if fFlagAXMakeupEquipping then
			setMakeupDescriptionsModule(humanoidDescription, equippedAssets)
		end
		if fFlagHeadRefinementFacialAnimationToggle and staticFacialAnimation ~= nil then
			humanoidDescription[constantsModule.STATIC_FACIAL_ANIMATION] = staticFacialAnimation
		end
	end
	if avatarScales then
		for i_1, i in avatarScales do
			humanoidDescription[HUMANOID_DESCRIPTION_SCALE_TO_NAME[i_1]] = i
		end
	end
	setHumanoidDescriptionColorsFromBodyColor3sModule(humanoidDescription, p0.AvatarEditor.Character.BodyColor3s)
	
	return humanoidDescription
end