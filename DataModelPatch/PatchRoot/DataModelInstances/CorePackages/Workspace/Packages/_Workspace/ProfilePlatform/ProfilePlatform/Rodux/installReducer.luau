local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local RoduxModule = require(Parent.Rodux)
local GamesModule = require(ProfilePlatform.Rodux.Games)
local ItemDetailsModule = require(ProfilePlatform.Rodux.ItemDetails)
local BundleDetailsModule = require(ProfilePlatform.Rodux.BundleDetails)
local AssetDetailsModule = require(ProfilePlatform.Rodux.AssetDetails)
local AssetDataModule = require(ProfilePlatform.Rodux.AssetData)
local MyRoduxNetworkingModule = require(ProfilePlatform.Networking.myRoduxNetworking)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local ProfilePlatformFixPresenceReducer = game:DefineFastFlag("ProfilePlatformFixPresenceReducer", false)
local PresenceReducerModule = if ProfilePlatformFixPresenceReducer then require(ProfilePlatform.Rodux.PresenceReducer) else nil
local ProfilesModule = require(ProfilePlatform.Rodux.Profiles)
local FFlagAddVideoToCommunityProfile = require(Parent.SharedFlags).FFlagAddVideoToCommunityProfile

return function()
	-- upvalues: RoduxModule (copy), GamesModule (copy), ItemDetailsModule (copy), BundleDetailsModule (copy), AssetDetailsModule (copy), FFlagAddVideoToCommunityProfile (copy), AssetDataModule (copy), MyRoduxNetworkingModule (copy), ProfilePlatformFixPresenceReducer (copy), PresenceReducerModule (copy), PresenceModule (copy), ProfilesModule (copy)
	return RoduxModule.combineReducers({
		Games = GamesModule.installReducer(),
		ItemAssets = ItemDetailsModule,
		BundleDetails = BundleDetailsModule,
		AssetDetails = AssetDetailsModule,
		AssetData = if FFlagAddVideoToCommunityProfile then AssetDataModule else nil,
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		Presence = if ProfilePlatformFixPresenceReducer then PresenceReducerModule else PresenceModule.installReducer(),
		Profiles = ProfilesModule
	})
end