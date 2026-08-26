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

return function(p1, p2)
	-- upvalues: isValidAssetTypeForOutfitTypeModule (ref), constantsModule (ref), createHumanoidDescriptionAccessoryInfoModule (ref), fFlagParseHeadShapeFromAPIResponse (ref), fFlagHeadRefinementFacialAnimationToggle (ref), fFlagAXMakeupEquipping (ref), isMakeupAssetTypeModule (ref), mutedError (ref), setMakeupDescriptionsModule (ref), HUMANOID_DESCRIPTION_SCALE_TO_NAME (ref), setHumanoidDescriptionColorsFromBodyColor3sModule (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	local equippedAssets = p1.AvatarEditor.Character.EquippedAssets
	local avatarScales = p1.AvatarEditor.Character.AvatarScales
	local staticFacialAnimation = nil
	
	if equippedAssets then
		local i_1, var1
		local t = {}
		
		for i, v in equippedAssets do
			if isValidAssetTypeForOutfitTypeModule(i, p2) then
				local t_1 = {}
				local var2 = constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[i]
				
				for i_1, v_1 in v do
					if var2 then
						table.insert(t, createHumanoidDescriptionAccessoryInfoModule(i, i_1, v_1))
					else
						table.insert(t_1, i_1)
					end
				end
				if var2 == nil and #t_1 > 0 then
					local var3 = constantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
					local joined = table.concat(t_1, ",")
					
					if var3 then
						if fFlagParseHeadShapeFromAPIResponse and constantsModule.BODY_PART_NAME_TO_ENUM[var3] then
							local bodyPartDescription = Instance.new("BodyPartDescription")
							bodyPartDescription.AssetId = t_1[1]
							bodyPartDescription.Parent = humanoidDescription
							bodyPartDescription.BodyPart = constantsModule.BODY_PART_NAME_TO_ENUM[var3]
							
							if i == constantsModule.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead then
								i_1 = nil
								
								for i_2, v_2 in t_1 do
									var1 = v[v_2]
									
									if fFlagHeadRefinementFacialAnimationToggle and var1 and var1.staticFacialAnimation ~= nil then
										staticFacialAnimation = var1.staticFacialAnimation
									end
									if var1 and var1.headShape then
										i_1 = if var1.headShape == "Default" then nil else var1.headShape
										break
									end
								end
								if i_1 then
									bodyPartDescription.HeadShape = i_1
								end
							end
						else
							humanoidDescription[var3] = joined
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
	setHumanoidDescriptionColorsFromBodyColor3sModule(humanoidDescription, p1.AvatarEditor.Character.BodyColor3s)
	
	return humanoidDescription
end