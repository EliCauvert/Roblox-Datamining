local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local ReactModule = require(AvatarSwitcher.Parent.React)
local OutfitsGridModule = require(AvatarSwitcher.Components.OutfitsGrid.OutfitsGrid)
local UseOutfitsGridPropsModule = require(AvatarSwitcher.Components.OutfitsGrid.useOutfitsGridProps)

return function()
	-- upvalues: UseOutfitsGridPropsModule (copy), ReactModule (copy), OutfitsGridModule (copy)
	return ReactModule.createElement(OutfitsGridModule, (UseOutfitsGridPropsModule()))
end