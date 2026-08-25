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

local function _(p0)
	-- upvalues: tileOverflowMenuItems (ref)
	local var7 = 0
	
	for i, v in tileOverflowMenuItems do
		if p0[v] then
			var7 += 1
		end
	end
	return var7
end

return function(p1)
	-- upvalues: useLastInput (ref), tileOverflowMenuItems (ref), responsiveModule (ref), reactModule (ref), gameTileDirectActionModule (ref), cryoModule (ref), iconName (ref), gameTileOverflowMenuModule (ref)
	local var8 = useLastInput()
	local availableMenuItems = p1.availableMenuItems
	local var9 = 0
	
	for i, v in tileOverflowMenuItems do
		if availableMenuItems[v] then
			var9 += 1
		end
	end
	return if var8 == responsiveModule.Input.Pointer and not p1.menuOpen and (var9 == 1 and p1.availableMenuItems[tileOverflowMenuItems.NotInterested]) then reactModule.createElement(gameTileDirectActionModule, cryoModule.Dictionary.join(p1, {
		actionId = tileOverflowMenuItems.NotInterested,
		iconOverride = { name = iconName.X }
	})) else reactModule.createElement(gameTileOverflowMenuModule, p1)
end