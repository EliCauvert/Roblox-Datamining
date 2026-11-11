local Parent = script:FindFirstAncestor("FriendsActivityFeed").Parent
local ReactModule = require(Parent.React)
local ActivityTile = require(Parent.ActivityTile).ActivityTile
local UseExperienceJoinTileViewModelModule = require(script.Parent.useExperienceJoinTileViewModel)

return function(p1)
	-- upvalues: UseExperienceJoinTileViewModelModule (copy), ReactModule (copy), ActivityTile (copy)
	return ReactModule.createElement(ActivityTile, (UseExperienceJoinTileViewModelModule(p1)))
end