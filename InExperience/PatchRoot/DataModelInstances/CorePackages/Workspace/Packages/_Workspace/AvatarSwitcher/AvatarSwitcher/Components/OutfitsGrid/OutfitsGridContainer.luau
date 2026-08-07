local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local reactModule = require(avatarSwitcher.Parent.React)
local outfitsGridModule = require(avatarSwitcher.Components.OutfitsGrid.OutfitsGrid)
local useOutfitsGridPropsModule = require(avatarSwitcher.Components.OutfitsGrid.useOutfitsGridProps)

return function() --[[ line: 14 | named "OutfitsGridContainer" ]]
	-- upvalues: useOutfitsGridPropsModule (ref), reactModule (ref), outfitsGridModule (ref)
	return reactModule.createElement(outfitsGridModule, useOutfitsGridPropsModule())
end