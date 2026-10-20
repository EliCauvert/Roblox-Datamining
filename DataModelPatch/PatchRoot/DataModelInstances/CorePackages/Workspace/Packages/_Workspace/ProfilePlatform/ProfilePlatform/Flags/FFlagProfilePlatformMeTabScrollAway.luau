local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local FFlagEnableBottomNavOnMarketplace = require(Parent.SharedFlags).FFlagEnableBottomNavOnMarketplace
local FFlagAppIaScopedScrollAway = require(Parent.SharedFlags).FFlagAppIaScopedScrollAway

return require(Parent.SharedFlags).FFlagAXEnableProfileTab and (FFlagAppIaScopedScrollAway and (FFlagEnableBottomNavOnMarketplace and game:DefineFastFlag("ProfilePlatformMeTabScrollAway", false)))