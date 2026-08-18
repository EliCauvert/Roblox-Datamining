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
		qRCodePage = function() --[[ line: 129 ]] end,
		previousView = function() --[[ line: 130 ]] end,
		itemDetails = function() --[[ line: 131 ]] end,
		itemOrBundleDetails = if fFlagProfilePlatformEnableStore then function() --[[ line: 132 ]] end else nil,
		preparePurchaseItem = function() --[[ line: 133 ]] end,
		shopForMoreEmotes = function() --[[ line: 134 ]] end,
		catalogSearch = if fFlagProfilePlatformEnableStore then function() --[[ line: 135 ]] end else nil,
		inspectAvatar = if require(parent.SharedFlags).FFlagAddIEMProfilePage then function() --[[ line: 136 ]] end else nil,
		editEmotes = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function() --[[ line: 137 ]] end else nil,
		switchAvatar = if fFlagProfilePlatformEnableEditAppearanceMenuModule then function() --[[ line: 138 ]] end else nil,
		editBackground = if fFlagProfilePlatformEnableEditAppearanceMenuModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then function() --[[ line: 141 ]] end else nil,
		editAvatar = function() --[[ line: 143 ]] end,
		editUsername = function() --[[ line: 144 ]] end,
		openLeaveRobloxAlertUIBlox = if fFlagAddSocialLinksToCommunityProfile then function() --[[ line: 145 ]] end else nil,
		closeLeaveRobloxAlert = if fFlagAddSocialLinksToCommunityProfile then function() --[[ line: 146 ]] end else nil,
		navigateToTransfer = if require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer then function() --[[ line: 147 ]] end else nil
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