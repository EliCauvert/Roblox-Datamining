local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local mutedError = require(parent.Loggers).mutedError
local ASSET_TYPE_NAME_TO_ID_STRING = require(avatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING
local ASSET_TYPE_TO_ACCESSORY_TYPE = require(avatarExperienceCommon.Constants).ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = require(avatarExperienceCommon.Constants).ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local HUMANOID_DESCRIPTION_SCALE_TO_NAME = require(avatarExperienceCommon.Constants).HUMANOID_DESCRIPTION_SCALE_TO_NAME
local setHumanoidDescriptionColorsFromBodyColor3sModule = require(script.Parent.setHumanoidDescriptionColorsFromBodyColor3s)
local createHumanoidDescriptionAccessoryInfoModule = require(script.Parent.createHumanoidDescriptionAccessoryInfo)
local setMakeupDescriptionsModule = require(script.Parent.setMakeupDescriptions)
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local fFlagAXMakeupEquipping = require(parent.AvatarExperienceFlags).FFlagAXMakeupEquipping

return function(p0) --[[ line: 18 ]]
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (ref), createHumanoidDescriptionAccessoryInfoModule (ref), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), fFlagAXMakeupEquipping (ref), isMakeupAssetTypeModule (ref), mutedError (ref), setMakeupDescriptionsModule (ref), HUMANOID_DESCRIPTION_SCALE_TO_NAME (ref), setHumanoidDescriptionColorsFromBodyColor3sModule (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	local equippedAssets = p0.AvatarEditor.Character.EquippedAssets
	local avatarScales = p0.AvatarEditor.Character.AvatarScales
	
	if equippedAssets then
		local t = {}
		
		for i, v in equippedAssets do
			local t_1 = {}
			local var8 = ASSET_TYPE_TO_ACCESSORY_TYPE[i]
			
			for i_1, v_1 in v do
				if var8 then
					table.insert(t, createHumanoidDescriptionAccessoryInfoModule(i, i_1, v_1))
				else
					table.insert(t_1, i_1)
				end
			end
			if var8 == nil and #t_1 > 0 then
				local var9 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
				local joined = table.concat(t_1, ",")
				
				if var9 then
					humanoidDescription[var9] = joined
				elseif i ~= ASSET_TYPE_NAME_TO_ID_STRING.Gear and (not fFlagAXMakeupEquipping or not isMakeupAssetTypeModule(i)) then
					mutedError(string.format("assetTypeId: %s not recognized as member of humanoidDescription", tostring(i)))
				end
			end
		end
		humanoidDescription:SetAccessories(t, true)
		
		if fFlagAXMakeupEquipping then
			setMakeupDescriptionsModule(humanoidDescription, equippedAssets)
		end
	end
	if avatarScales then
		for i, v in avatarScales do
			humanoidDescription[HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = v
		end
	end
	setHumanoidDescriptionColorsFromBodyColor3sModule(humanoidDescription, p0.AvatarEditor.Character.BodyColor3s)
	local t = {}
	local t_1 = {}
	
	for i, v in p0.AvatarEditor.EquippedEmotes.slotInfo do
		t[tostring(v.assetId)] = { tonumber(v.assetId) }
		table.insert(t_1, { Slot = v.position, Name = tostring(v.assetId) })
	end
	humanoidDescription:SetEmotes(t)
	humanoidDescription:SetEquippedEmotes(t_1)
	
	return humanoidDescription
end