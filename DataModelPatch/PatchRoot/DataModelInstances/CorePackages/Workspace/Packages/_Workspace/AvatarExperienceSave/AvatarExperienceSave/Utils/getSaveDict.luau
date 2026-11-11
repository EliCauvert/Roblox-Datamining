local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local TutilsModule = require(Parent.tutils)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXBackgroundsPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsPersistence
local AXFixEmptyDictionaryKeysForSaveDict2 = AvatarExperienceFlagsModule.FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXFixEmptyDictionaryKeysForSaveDict2", false)

local function filterEmptyDicts(Tbl)
	local Copy = table.clone(Tbl)
	
	for i, value in Copy do
		if type(value) == "table" and next(value) == nil then
			Copy[i] = nil
		end
	end
	return Copy
end

local function _(p1, p2)
	-- upvalues: filterEmptyDicts (copy), TutilsModule (copy)
	return TutilsModule.deepEqual(filterEmptyDicts(p1), (filterEmptyDicts(p2)))
end

return function(p1, p2)
	-- upvalues: FFlagAXBackgroundsPersistence (copy), AXFixEmptyDictionaryKeysForSaveDict2 (copy), filterEmptyDicts (copy), TutilsModule (copy)
	local Equipped = p1.equipped
	local Equipped1 = p2.equipped
	local IsNotBackgroundAssetIdMatch = if FFlagAXBackgroundsPersistence then Equipped.BackgroundAssetId ~= Equipped1.BackgroundAssetId else nil
	
	return if AXFixEmptyDictionaryKeysForSaveDict2 then {
		BodyColors = not TutilsModule.deepEqual(filterEmptyDicts(Equipped.BodyColor3s), (filterEmptyDicts(Equipped1.BodyColor3s))),
		AvatarType = Equipped.AvatarType ~= Equipped1.AvatarType,
		Scales = not TutilsModule.deepEqual(filterEmptyDicts(Equipped.AvatarScales), (filterEmptyDicts(Equipped1.AvatarScales))),
		Assets = Equipped.EquippedAssets and not TutilsModule.deepEqual(filterEmptyDicts(Equipped.EquippedAssets), (filterEmptyDicts(Equipped1.EquippedAssets))),
		Emotes = not TutilsModule.deepEqual(filterEmptyDicts(Equipped.EquippedEmotes.slotInfo), (filterEmptyDicts(Equipped1.EquippedEmotes.slotInfo))),
		Background = IsNotBackgroundAssetIdMatch
	} else {
		BodyColors = not TutilsModule.deepEqual(Equipped.BodyColor3s, Equipped1.BodyColor3s),
		AvatarType = Equipped.AvatarType ~= Equipped1.AvatarType,
		Scales = not TutilsModule.deepEqual(Equipped.AvatarScales, Equipped1.AvatarScales),
		Assets = Equipped.EquippedAssets and not TutilsModule.deepEqual(Equipped.EquippedAssets, Equipped1.EquippedAssets),
		Emotes = not TutilsModule.deepEqual(Equipped.EquippedEmotes.slotInfo, Equipped1.EquippedEmotes.slotInfo),
		Background = IsNotBackgroundAssetIdMatch
	}
end