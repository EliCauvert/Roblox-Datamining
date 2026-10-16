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
		qRCodePage = function() --[[ Line: 131 ]] end,
		previousView = function() --[[ Line: 132 ]] end,
		itemDetails = function() --[[ Line: 133 ]] end,
		itemOrBundleDetails = if FFlagProfilePlatformEnableStore then function() --[[ Line: 134 ]] end else nil,
		preparePurchaseItem = function() --[[ Line: 135 ]] end,
		shopForMoreEmotes = function() --[[ Line: 136 ]] end,
		promptR15Upgrade = function() --[[ Line: 137 ]] end,
		catalogSearch = if FFlagProfilePlatformEnableStore then function() --[[ Line: 138 ]] end else nil,
		inspectAvatar = if FFlagAddIEMProfilePage then function() --[[ Line: 139 ]] end else nil,
		editEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function() --[[ Line: 140 ]] end else nil,
		switchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then function() --[[ Line: 141 ]] end else nil,
		editBackground = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then function() --[[ Line: 144 ]] end else nil,
		editAvatar = function() --[[ Line: 146 ]] end,
		editUsername = function() --[[ Line: 147 ]] end,
		openLeaveRobloxAlertUIBlox = if FFlagAddSocialLinksToCommunityProfile then function() --[[ Line: 148 ]] end else nil,
		closeLeaveRobloxAlert = if FFlagAddSocialLinksToCommunityProfile then function() --[[ Line: 149 ]] end else nil,
		navigateToTransfer = if FFlagProfilePlatformEnableCurrencyTransfer then function() --[[ Line: 150 ]] end else nil
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