local Parent = script:FindFirstAncestor("FriendsActivityFeed").Parent
local ReactModule = require(Parent.React)
local ActivityTile = require(Parent.ActivityTile).ActivityTile
local UseBadgeAwardedTileViewModelModule = require(script.Parent.useBadgeAwardedTileViewModel)

return function(p1)
	-- upvalues: UseBadgeAwardedTileViewModelModule (copy), ReactModule (copy), ActivityTile (copy)
	return ReactModule.createElement(ActivityTile, (UseBadgeAwardedTileViewModelModule(p1)))
end