local parent = script:FindFirstAncestor("ProfilePlatform").Parent

return require(parent.SharedFlags).FFlagAXEnableProfileTab and (require(parent.SharedFlags).FFlagAppIaScopedScrollAway and (require(parent.SharedFlags).FFlagEnableBottomNavOnMarketplace and game:DefineFastFlag("ProfilePlatformMeTabScrollAway", false)))