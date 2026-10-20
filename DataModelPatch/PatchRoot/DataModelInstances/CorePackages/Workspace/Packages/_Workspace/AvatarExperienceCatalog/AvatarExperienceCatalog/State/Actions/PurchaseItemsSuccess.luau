local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local _ = require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)
local FFlagAXMISSaveWearFix = require(Parent.AvatarExperienceFlags).FFlagAXMISSaveWearFix

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: FFlagAXMISSaveWearFix (copy)
	return {
		equippableAssets = p1.equippableAssets,
		items = p1.items,
		replaceAllEquippedAssets = p1.replaceAllEquippedAssets,
		shouldClearEquippedMakeup = p1.shouldClearEquippedMakeup,
		bodyColor3s = p1.bodyColor3s,
		bodyScales = p1.bodyScales,
		bodyPartColorRangeIds = p1.bodyPartColorRangeIds,
		makeupAssetsOnHumanoid = if FFlagAXMISSaveWearFix then p1.makeupAssetsOnHumanoid else nil
	}
end)