local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local gameTileDirectActionModule = require(gameTile.GameTileDirectAction)
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local tileOverflowMenuItems = require(gameTile.GameTileConstants).TileOverflowMenuItems
local iconName = foundationModule.Enums.IconName
local useLastInput = responsiveModule.useLastInput

local function _(p1)
	-- upvalues: tileOverflowMenuItems (ref)
	local var1 = 0
	
	for i, v in tileOverflowMenuItems do
		if p1[v] then
			var1 += 1
		end
	end
	return var1
end

return function(p2)
	-- upvalues: useLastInput (ref), tileOverflowMenuItems (ref), responsiveModule (ref), reactModule (ref), gameTileDirectActionModule (ref), cryoModule (ref), iconName (ref), gameTileOverflowMenuModule (ref)
	local var2 = useLastInput()
	local availableMenuItems = p2.availableMenuItems
	local var3 = 0
	
	for i, v in tileOverflowMenuItems do
		if availableMenuItems[v] then
			var3 += 1
		end
	end
	return if var2 == responsiveModule.Input.Pointer and not p2.menuOpen and (var3 == 1 and p2.availableMenuItems[tileOverflowMenuItems.NotInterested]) then reactModule.createElement(gameTileDirectActionModule, cryoModule.Dictionary.join(p2, {
		actionId = tileOverflowMenuItems.NotInterested,
		iconOverride = { name = iconName.X }
	})) else reactModule.createElement(gameTileOverflowMenuModule, p2)
end