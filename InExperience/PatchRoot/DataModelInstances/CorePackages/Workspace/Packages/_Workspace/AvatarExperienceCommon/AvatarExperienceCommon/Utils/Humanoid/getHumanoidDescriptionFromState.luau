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
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMakeupEquipping = avatarExperienceFlagsModule.FFlagAXMakeupEquipping
local fFlagAXOutfitPageRevamp = avatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local getHumanoidDescriptionFromStateForOutfitTypeModule = require(avatarExperienceCommon.Utils.Humanoid.getHumanoidDescriptionFromStateForOutfitType)

return function(p1)
	-- upvalues: fFlagAXOutfitPageRevamp (ref), getHumanoidDescriptionFromStateForOutfitTypeModule (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), createHumanoidDescriptionAccessoryInfoModule (ref), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), fFlagAXMakeupEquipping (ref), isMakeupAssetTypeModule (ref), mutedError (ref), setMakeupDescriptionsModule (ref), HUMANOID_DESCRIPTION_SCALE_TO_NAME (ref), setHumanoidDescriptionColorsFromBodyColor3sModule (ref)
	local var1
	local _ = nil
	
	if fFlagAXOutfitPageRevamp then
		var1 = getHumanoidDescriptionFromStateForOutfitTypeModule(p1, nil)
	else
		var1 = Instance.new("HumanoidDescription")
		local equippedAssets = p1.AvatarEditor.Character.EquippedAssets
		local avatarScales = p1.AvatarEditor.Character.AvatarScales
		
		if equippedAssets then
			local t = {}
			
			for i, v in equippedAssets do
				local t_1 = {}
				local var2 = ASSET_TYPE_TO_ACCESSORY_TYPE[i]
				
				for i_1, v_1 in v do
					if var2 then
						table.insert(t, createHumanoidDescriptionAccessoryInfoModule(i, i_1, v_1))
					else
						table.insert(t_1, i_1)
					end
				end
				if var2 == nil and #t_1 > 0 then
					local var3 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[i]
					local joined = table.concat(t_1, ",")
					
					if var3 then
						var1[var3] = joined
					elseif i ~= ASSET_TYPE_NAME_TO_ID_STRING.Gear and (not fFlagAXMakeupEquipping or not isMakeupAssetTypeModule(i)) then
						mutedError(string.format("assetTypeId: %s not recognized as member of humanoidDescription", tostring(i)))
					end
				end
			end
			var1:SetAccessories(t, true)
			
			if fFlagAXMakeupEquipping then
				setMakeupDescriptionsModule(var1, equippedAssets)
			end
		end
		if avatarScales then
			for i, v in avatarScales do
				var1[HUMANOID_DESCRIPTION_SCALE_TO_NAME[i]] = v
			end
		end
		setHumanoidDescriptionColorsFromBodyColor3sModule(var1, p1.AvatarEditor.Character.BodyColor3s)
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p1.AvatarEditor.EquippedEmotes.slotInfo do
		t[tostring(v.assetId)] = { tonumber(v.assetId) }
		table.insert(t_1, { Slot = v.position, Name = tostring(v.assetId) })
	end
	var1:SetEmotes(t)
	var1:SetEquippedEmotes(t_1)
	
	return var1
end