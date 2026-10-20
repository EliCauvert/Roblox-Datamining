local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(Parent.CurrencyTransfers)
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagAddSocialLinksToCommunityProfile = require(Parent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return require(Parent.React).createContext({
	profileId = "TEST_ID",
	profilePlatformId = if require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption then "TEST_PLATFORM_ID" else nil,
	profileType = require(ProfilePlatform.Common.Enums).ProfileTypes.User,
	navigateTo = {
		qRCodePage = function() end,
		previousView = function() end,
		itemDetails = function() end,
		itemOrBundleDetails = if FFlagProfilePlatformEnableStore then function() end else nil,
		preparePurchaseItem = function() end,
		shopForMoreEmotes = function() end,
		promptR15Upgrade = function() end,
		catalogSearch = if FFlagProfilePlatformEnableStore then function() end else nil,
		inspectAvatar = if FFlagAddIEMProfilePage then function() end else nil,
		editEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function() end else nil,
		switchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function() end else nil,
		editBackground = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then function() end else nil,
		editAvatar = function() end,
		editUsername = function() end,
		openLeaveRobloxAlertUIBlox = if FFlagAddSocialLinksToCommunityProfile then function() end else nil,
		closeLeaveRobloxAlert = if FFlagAddSocialLinksToCommunityProfile then function() end else nil,
		navigateToTransfer = if FFlagProfilePlatformEnableCurrencyTransfer then function() end else nil
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