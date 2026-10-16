local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local tutilsModule = require(parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXBackgroundsPersistence = avatarExperienceFlagsModule.FFlagAXBackgroundsPersistence
local AXFixEmptyDictionaryKeysForSaveDict2 = avatarExperienceFlagsModule.FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXFixEmptyDictionaryKeysForSaveDict2", false)

local function filterEmptyDicts(p1)
	local cloned = table.clone(p1)
	
	for i, v in cloned do
		if type(v) == "table" and next(v) == nil then
			cloned[i] = nil
		end
	end
	return cloned
end

local function _(p2, p3)
	-- upvalues: filterEmptyDicts (ref), tutilsModule (ref)
	return tutilsModule.deepEqual(filterEmptyDicts(p2), filterEmptyDicts(p3))
end

return function(p2, p3)
	-- upvalues: fFlagAXBackgroundsPersistence (ref), AXFixEmptyDictionaryKeysForSaveDict2 (ref), filterEmptyDicts (ref), tutilsModule (ref)
	local var1
	local equipped = p2.equipped
	local equipped_1 = p3.equipped
	
	if fFlagAXBackgroundsPersistence then
		var1 = equipped.BackgroundAssetId ~= equipped_1.BackgroundAssetId
		var1 = nil
	else
		var1 = nil
	end
	return if AXFixEmptyDictionaryKeysForSaveDict2 then {
		BodyColors = not tutilsModule.deepEqual(filterEmptyDicts(equipped.BodyColor3s), filterEmptyDicts(equipped_1.BodyColor3s)),
		AvatarType = equipped.AvatarType ~= equipped_1.AvatarType,
		Scales = not tutilsModule.deepEqual(filterEmptyDicts(equipped.AvatarScales), filterEmptyDicts(equipped_1.AvatarScales)),
		Assets = equipped.EquippedAssets and not tutilsModule.deepEqual(filterEmptyDicts(equipped.EquippedAssets), filterEmptyDicts(equipped_1.EquippedAssets)),
		Emotes = not tutilsModule.deepEqual(filterEmptyDicts(equipped.EquippedEmotes.slotInfo), filterEmptyDicts(equipped_1.EquippedEmotes.slotInfo)),
		Background = var1
	} else {
		BodyColors = not tutilsModule.deepEqual(equipped.BodyColor3s, equipped_1.BodyColor3s),
		AvatarType = equipped.AvatarType ~= equipped_1.AvatarType,
		Scales = not tutilsModule.deepEqual(equipped.AvatarScales, equipped_1.AvatarScales),
		Assets = equipped.EquippedAssets and not tutilsModule.deepEqual(equipped.EquippedAssets, equipped_1.EquippedAssets),
		Emotes = not tutilsModule.deepEqual(equipped.EquippedEmotes.slotInfo, equipped_1.EquippedEmotes.slotInfo),
		Background = var1
	}
end