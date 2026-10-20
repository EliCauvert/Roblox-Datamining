local Parent = script:FindFirstAncestor("FriendsActivityFeed").Parent
local ReactModule = require(Parent.React)
local ActivityTile = require(Parent.ActivityTile).ActivityTile
local UseAvatarChangeTileViewModelModule = require(script.Parent.useAvatarChangeTileViewModel)

return function(p1)
	-- upvalues: UseAvatarChangeTileViewModelModule (copy), ReactModule (copy), ActivityTile (copy)
	return ReactModule.createElement(ActivityTile, (UseAvatarChangeTileViewModelModule(p1)))
end