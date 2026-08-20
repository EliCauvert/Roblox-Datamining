local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local roduxModule = require(parent.Rodux)
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local fFlagAXMISSaveWearFix = require(parent.AvatarExperienceFlags).FFlagAXMISSaveWearFix

return roduxModule.makeActionCreator(script.Name, function(p0) --[[ line: 56 ]]
	-- upvalues: fFlagAXMISSaveWearFix (ref)
	return {
		equippableAssets = p0.equippableAssets,
		items = p0.items,
		replaceAllEquippedAssets = p0.replaceAllEquippedAssets,
		shouldClearEquippedMakeup = p0.shouldClearEquippedMakeup,
		bodyColor3s = p0.bodyColor3s,
		bodyScales = p0.bodyScales,
		bodyPartColorRangeIds = p0.bodyPartColorRangeIds,
		makeupAssetsOnHumanoid = if fFlagAXMISSaveWearFix then p0.makeupAssetsOnHumanoid else nil
	}
end)