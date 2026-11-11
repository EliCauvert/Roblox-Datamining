local HeadShapeModule = require(script.Parent.HeadShape)
local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AXReplaceDefaultHeadAssetId = game:DefineFastFlag("AXReplaceDefaultHeadAssetId", false)
local FFlagAXAddFacesToHeadList = AvatarExperienceFlagsModule.FFlagAXAddFacesToHeadList
local FFlagAXFixTryOnHeadShapeThumbnail = AvatarExperienceFlagsModule.FFlagAXFixTryOnHeadShapeThumbnail
local _ = require(Parent.AvatarExperienceSlotBasedEditor)
local HeadShapePropertiesModule = {
	[HeadShapeModule.Default] = {
		name = HeadShapeModule.Default,
		assetId = if AXReplaceDefaultHeadAssetId then 2432102561 else 7430070993,
		image = if AXReplaceDefaultHeadAssetId then "rbxthumb://type=Asset&w=150&h=150&id=2432102561" else "rbxthumb://type=Asset&w=150&h=150&id=7430070993"
	},
	[HeadShapeModule.ManHead] = {
		assetId = 86498048,
		image = "rbxthumb://type=Asset&w=150&h=150&id=86498048",
		name = HeadShapeModule.ManHead
	},
	[HeadShapeModule.WomanHead] = {
		assetId = 86498113,
		image = "rbxthumb://type=Asset&w=150&h=150&id=86498113",
		name = HeadShapeModule.WomanHead
	},
	[HeadShapeModule.Cheeks] = {
		assetId = 746767604,
		image = "rbxthumb://type=Asset&w=150&h=150&id=746767604",
		name = HeadShapeModule.Cheeks
	},
	[HeadShapeModule.Narrow] = {
		assetId = 746774687,
		image = "rbxthumb://type=Asset&w=150&h=150&id=746774687",
		name = HeadShapeModule.Narrow
	},
	[HeadShapeModule.StrongJaw] = {
		assetId = 616399508,
		image = "rbxthumb://type=Asset&w=150&h=150&id=616399508",
		name = HeadShapeModule.StrongJaw
	},
	[HeadShapeModule.Paragon] = {
		assetId = 616398268,
		image = "rbxthumb://type=Asset&w=150&h=150&id=616398268",
		name = HeadShapeModule.Paragon
	},
	[HeadShapeModule.Chiseled] = {
		assetId = 616387160,
		image = "rbxthumb://type=Asset&w=150&h=150&id=616387160",
		name = HeadShapeModule.Chiseled
	},
	[HeadShapeModule.Roundy] = {
		assetId = 6340213,
		image = "rbxthumb://type=Asset&w=150&h=150&id=6340213",
		name = HeadShapeModule.Roundy
	},
	[HeadShapeModule.Blockhead] = {
		assetId = 6340101,
		image = "rbxthumb://type=Asset&w=150&h=150&id=6340101",
		name = HeadShapeModule.Blockhead
	},
	[HeadShapeModule.Trim] = {
		assetId = 6340227,
		image = "rbxthumb://type=Asset&w=150&h=150&id=6340227",
		name = HeadShapeModule.Trim
	}
}

if AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration then
	function HeadShapePropertiesModule.fromInventory(p1, p2, p3)
		-- upvalues: HeadShapePropertiesModule (copy), HeadShapeModule (copy), FFlagAXAddFacesToHeadList (copy), FFlagAXFixTryOnHeadShapeThumbnail (copy)
		local t = {}
		
		if HeadShapePropertiesModule[HeadShapeModule.Default] then
			t[HeadShapeModule.Default] = HeadShapePropertiesModule[HeadShapeModule.Default]
			
			if FFlagAXAddFacesToHeadList and p2 then
				t[HeadShapeModule.Default].image = `rbxthumb://type=Asset&id={p2}&w=150&h=150`
			end
			if FFlagAXFixTryOnHeadShapeThumbnail and p3 then
				t[HeadShapeModule.Default].image = `rbxthumb://type=Asset&id={p3}&w=150&h=150`
			end
		end
		if p1 and p1.avatarInventoryItems then
			for _, avatarInventoryItem in p1.avatarInventoryItems do
				if avatarInventoryItem.headShape then
					t[avatarInventoryItem.headShape] = {
						name = avatarInventoryItem.headShape,
						assetId = avatarInventoryItem.itemId,
						image = if FFlagAXAddFacesToHeadList and p2 then if FFlagAXFixTryOnHeadShapeThumbnail and p3 then `rbxthumb://type=Asset&id={p3}&headshape={avatarInventoryItem.headShape}&w=150&h=150` else `rbxthumb://type=Asset&id={p2}&headshape={avatarInventoryItem.headShape}&w=150&h=150` elseif FFlagAXFixTryOnHeadShapeThumbnail and p3 then `rbxthumb://type=Asset&id={p3}&headshape={avatarInventoryItem.headShape}&w=150&h=150` else "rbxasset://headshapes/" .. avatarInventoryItem.headShape .. ".png"
					}
				end
			end
		end
		return t
	end
end
return HeadShapePropertiesModule