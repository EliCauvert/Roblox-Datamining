local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GameTileDirectActionModule = require(GameTile.GameTileDirectAction)
local GameTileOverflowMenuModule = require(GameTile.GameTileOverflowMenu)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local IconName = require(Parent.Foundation).Enums.IconName
local UseLastInputFunction = ResponsiveModule.useLastInput

local function _(p1): number --[[ Line: 18 | Named "countAvailableActions" ]]
	-- upvalues: TileOverflowMenuItems (copy)
	local Count = 0
	
	for _, tileOverflowMenuItem in TileOverflowMenuItems do
		if p1[tileOverflowMenuItem] then
			Count += 1
		end
	end
	return Count
end

return function(p2) --[[ Line: 30 | Named "GameTileContextualActions" ]]
	-- upvalues: UseLastInputFunction (copy), TileOverflowMenuItems (copy), ResponsiveModule (copy), ReactModule (copy), GameTileDirectActionModule (copy), CryoModule (copy), IconName (copy), GameTileOverflowMenuModule (copy)
	local UseLastInputResult = UseLastInputFunction()
	local AvailableMenuItems = p2.availableMenuItems
	local Count = 0
	
	for _, tileOverflowMenuItem in TileOverflowMenuItems do
		if AvailableMenuItems[tileOverflowMenuItem] then
			Count += 1
		end
	end
	return if UseLastInputResult == ResponsiveModule.Input.Pointer and not p2.menuOpen and Count == 1 and p2.availableMenuItems[TileOverflowMenuItems.NotInterested] then ReactModule.createElement(GameTileDirectActionModule, CryoModule.Dictionary.join(p2, {
		actionId = TileOverflowMenuItems.NotInterested,
		iconOverride = { name = IconName.X }
	})) else ReactModule.createElement(GameTileOverflowMenuModule, p2)
end