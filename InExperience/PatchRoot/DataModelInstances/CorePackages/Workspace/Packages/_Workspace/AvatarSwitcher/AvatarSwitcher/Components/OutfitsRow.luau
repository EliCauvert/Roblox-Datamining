local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local outfitTileModule = require(avatarSwitcher.Components.OutfitTile)
local _ = require(avatarSwitcher.types)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), outfitTileModule (ref), foundationModule (ref)
	local t = {}
	
	for i, v in p0.outfits do
		t["Outfit" .. (v.id or i)] = reactModule.createElement(outfitTileModule, {
			outfitInfo = v,
			disabled = p0.disabled,
			LayoutOrder = i,
			gridPosition = { row = p0.rowNumber, column = i }
		})
	end
	for i_1 = #p0.outfits + 1, p0.desiredItemsCount do
		t["Filler" .. i_1] = reactModule.createElement(foundationModule.View, { tag = "size-full-0", LayoutOrder = i_1 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y gap-medium flex-x-fill padding-bottom-large"
	}, t)
end)