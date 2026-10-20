local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local RoduxModule = require(ProfilePlatform.Parent.Rodux)
local GamesModule = require(ProfilePlatform.Rodux.Games)
local ItemDetailsModule = require(ProfilePlatform.Rodux.ItemDetails)
local BundleDetailsModule = require(ProfilePlatform.Rodux.BundleDetails)
local AssetDetailsModule = require(ProfilePlatform.Rodux.AssetDetails)
local MyRoduxNetworkingModule = require(ProfilePlatform.Networking.myRoduxNetworking)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local ProfilePlatformFixPresenceReducer = game:DefineFastFlag("ProfilePlatformFixPresenceReducer", false)
local PresenceReducerModule = if ProfilePlatformFixPresenceReducer then require(ProfilePlatform.Rodux.PresenceReducer) else nil
local ProfilesModule = require(ProfilePlatform.Rodux.Profiles)
local FFlagProfilePlatformPresenceStoreMigrationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)

return function()
	-- upvalues: RoduxModule (copy), GamesModule (copy), ItemDetailsModule (copy), BundleDetailsModule (copy), AssetDetailsModule (copy), MyRoduxNetworkingModule (copy), FFlagProfilePlatformPresenceStoreMigrationModule (copy), ProfilePlatformFixPresenceReducer (copy), PresenceReducerModule (copy), PresenceModule (copy), ProfilesModule (copy)
	return RoduxModule.combineReducers({
		Games = GamesModule.installReducer(),
		ItemAssets = ItemDetailsModule,
		BundleDetails = BundleDetailsModule,
		AssetDetails = AssetDetailsModule,
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		Presence = if FFlagProfilePlatformPresenceStoreMigrationModule then nil elseif ProfilePlatformFixPresenceReducer then PresenceReducerModule else PresenceModule.installReducer(),
		Profiles = ProfilesModule
	})
end