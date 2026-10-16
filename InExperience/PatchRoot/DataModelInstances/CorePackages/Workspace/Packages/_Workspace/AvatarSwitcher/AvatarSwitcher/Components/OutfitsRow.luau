local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local OutfitTileModule = require(AvatarSwitcher.Components.OutfitTile)
local _ = require(AvatarSwitcher.types)

return ReactModule.memo(function(p1) --[[ Line: 22 | Named "OutfitsRow" ]]
	-- upvalues: ReactModule (copy), OutfitTileModule (copy), FoundationModule (copy)
	local Elements = {}
	
	for Column, outfit in p1.outfits do
		Elements["Outfit" .. (outfit.id or Column)] = ReactModule.createElement(OutfitTileModule, {
			outfitInfo = outfit,
			disabled = p1.disabled,
			LayoutOrder = Column,
			gridPosition = { row = p1.rowNumber, column = Column }
		})
	end
	for i = #p1.outfits + 1, p1.desiredItemsCount do
		Elements["Filler" .. i] = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0", LayoutOrder = i })
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-0 auto-y gap-medium flex-x-fill padding-bottom-large"
	}, Elements)
end)