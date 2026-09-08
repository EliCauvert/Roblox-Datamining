local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(parent.CurrencyTransfers)
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagAddSocialLinksToCommunityProfile = require(parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)

return reactModule.createContext({
	profileId = "TEST_ID",
	profilePlatformId = if require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption then "TEST_PLATFORM_ID" else nil,
	profileType = enumsModule.ProfileTypes.User,
	navigateTo = {
		qRCodePage = function() end,
		previousView = function() end,
		itemDetails = function() end,
		itemOrBundleDetails = if fFlagProfilePlatformEnableStore then function() end else nil,
		preparePurchaseItem = function() end,
		shopForMoreEmotes = function() end,
		promptR15Upgrade = function() end,
		catalogSearch = if fFlagProfilePlatformEnableStore then function() end else nil,
		inspectAvatar = if require(parent.SharedFlags).FFlagAddIEMProfilePage then function() end else nil,
		editEmotes = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function() end else nil,
		switchAvatar = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function() end else nil,
		editBackground = if fFlagProfilePlatformEnableEditAppearanceMenuModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then function() end else nil,
		editAvatar = function() end,
		editUsername = function() end,
		openLeaveRobloxAlertUIBlox = if fFlagAddSocialLinksToCommunityProfile then function() end else nil,
		closeLeaveRobloxAlert = if fFlagAddSocialLinksToCommunityProfile then function() end else nil,
		navigateToTransfer = if require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer then function() end else nil
	},
	externalAnalytics = { catalogAnalytics = {} },
	sourceInfo = {
		isRecommendation = false,
		source = "TEST_SOURCE",
		contextualInfoType = "TEST_CONTEXTUAL_INFO_TYPE",
		friendshipOriginSourceType = "TEST_FRIENDSHIP_ORIGIN_SOURCE_TYPE",
		contextualOverride = {}
	}
})