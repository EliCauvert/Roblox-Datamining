local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseOutfitSelectionGridItemPropsModule = require(script.Parent.useOutfitSelectionGridItemProps)
local OutfitSelectionGridItemModule = require(script.Parent.OutfitSelectionGridItem)

return function(p1)
	-- upvalues: UseOutfitSelectionGridItemPropsModule (copy), ReactModule (copy), OutfitSelectionGridItemModule (copy)
	return ReactModule.createElement(OutfitSelectionGridItemModule, (UseOutfitSelectionGridItemPropsModule(p1)))
end