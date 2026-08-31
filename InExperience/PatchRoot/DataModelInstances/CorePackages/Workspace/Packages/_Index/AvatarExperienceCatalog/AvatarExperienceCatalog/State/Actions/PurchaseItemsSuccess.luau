local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local roduxModule = require(parent.Rodux)
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local fFlagAXMISSaveWearFix = require(parent.AvatarExperienceFlags).FFlagAXMISSaveWearFix

return roduxModule.makeActionCreator(script.Name, function(p1)
	-- upvalues: fFlagAXMISSaveWearFix (ref)
	return {
		equippableAssets = p1.equippableAssets,
		items = p1.items,
		replaceAllEquippedAssets = p1.replaceAllEquippedAssets,
		shouldClearEquippedMakeup = p1.shouldClearEquippedMakeup,
		bodyColor3s = p1.bodyColor3s,
		bodyScales = p1.bodyScales,
		bodyPartColorRangeIds = p1.bodyPartColorRangeIds,
		makeupAssetsOnHumanoid = if fFlagAXMISSaveWearFix then p1.makeupAssetsOnHumanoid else nil
	}
end)