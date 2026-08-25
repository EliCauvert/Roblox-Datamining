local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local roduxModule = require(parent.Rodux)
local gamesModule = require(profilePlatform.Rodux.Games)
local itemDetailsModule = require(profilePlatform.Rodux.ItemDetails)
local bundleDetailsModule = require(profilePlatform.Rodux.BundleDetails)
local assetDetailsModule = require(profilePlatform.Rodux.AssetDetails)
local assetDataModule = require(profilePlatform.Rodux.AssetData)
local myRoduxNetworkingModule = require(profilePlatform.Networking.myRoduxNetworking)
local presenceModule = require(profilePlatform.Rodux.Presence)
local profilePlatformFixPresenceReducer = game:DefineFastFlag("ProfilePlatformFixPresenceReducer", false)
local var10 = if profilePlatformFixPresenceReducer then require(profilePlatform.Rodux.PresenceReducer) else nil
local profilesModule = require(profilePlatform.Rodux.Profiles)
local fFlagAddVideoToCommunityProfile = require(parent.SharedFlags).FFlagAddVideoToCommunityProfile
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)

return function()
	-- upvalues: roduxModule (ref), gamesModule (ref), itemDetailsModule (ref), bundleDetailsModule (ref), assetDetailsModule (ref), fFlagAddVideoToCommunityProfile (ref), assetDataModule (ref), myRoduxNetworkingModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), profilePlatformFixPresenceReducer (ref), var10 (ref), presenceModule (ref), profilesModule (ref)
	return roduxModule.combineReducers({
		Games = gamesModule.installReducer(),
		ItemAssets = itemDetailsModule,
		BundleDetails = bundleDetailsModule,
		AssetDetails = assetDetailsModule,
		AssetData = if fFlagAddVideoToCommunityProfile then assetDataModule else nil,
		NetworkStatus = myRoduxNetworkingModule.installReducer(),
		Presence = if fFlagProfilePlatformPresenceStoreMigrationModule then nil elseif profilePlatformFixPresenceReducer then var10 else presenceModule.installReducer(),
		Profiles = profilesModule
	})
end