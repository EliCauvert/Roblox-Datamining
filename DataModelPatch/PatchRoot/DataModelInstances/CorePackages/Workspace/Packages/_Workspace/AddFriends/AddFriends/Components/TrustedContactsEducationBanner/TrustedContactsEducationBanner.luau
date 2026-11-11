local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FoundationModule = require(Parent.Foundation)
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local AddFriendsGenericBannerModule = require(AddFriends.Components.AddFriendsGenericBanner)
local EventNamesModule = require(AddFriends.Analytics.EventNames)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local UseShowTrustedContactsEducationBannerModule = require(script.Parent.useShowTrustedContactsEducationBanner)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FStringCanAccessTrustedContactsAmpNameSpace = SharedFlagsModule.FStringCanAccessTrustedContactsAmpNameSpace
local FStringIsVerified18PlusAmpFeature = SharedFlagsModule.FStringIsVerified18PlusAmpFeature

return function(p1)
	-- upvalues: UseFireAnalyticsEventModule (copy), UseNavigationFunction (copy), UseShowTrustedContactsEducationBannerModule (copy), ReactModule (copy), AccessResponseEnum (copy), AmpApiProvider (copy), FStringIsVerified18PlusAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), EventNamesModule (copy), AppPage (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), AddFriendsGenericBannerModule (copy), FoundationModule (copy)
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseShowTrustedContactsEducationBannerModuleResult, UseShowTrustedContactsEducationBannerModuleResult2, UseShowTrustedContactsEducationBannerModuleResult3 = UseShowTrustedContactsEducationBannerModule()
	local UseStateResult2 = nil
	local UseStateResult
	UseStateResult, UseStateResult2 = ReactModule.useState(AccessResponseEnum.Pending)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), FStringIsVerified18PlusAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), UseStateResult2 (ref)
		UseStateResult2(AmpApiProvider.upsellFeatureAccess(FStringIsVerified18PlusAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseNavigationResult (copy), AppPage (upval), UseShowTrustedContactsEducationBannerModuleResult2 (copy)
		UseFireAnalyticsEventModuleResult(EventNamesModule.TrustedContactsEducationalBannerClick)
		UseNavigationResult.push(AppPage.TrustedContactsEducationModal)
		UseShowTrustedContactsEducationBannerModuleResult2()
	end, {
		UseNavigationResult,
		UseShowTrustedContactsEducationBannerModuleResult2,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseShowTrustedContactsEducationBannerModuleResult2 (copy)
		UseFireAnalyticsEventModuleResult(EventNamesModule.TrustedContactsEducationalBannerClose)
		UseShowTrustedContactsEducationBannerModuleResult2()
	end, {
		UseShowTrustedContactsEducationBannerModuleResult2,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseShowTrustedContactsEducationBannerModuleResult3 (copy)
		UseFireAnalyticsEventModuleResult(EventNamesModule.TrustedContactsEducationalBannerImpression)
		UseShowTrustedContactsEducationBannerModuleResult3()
	end, {
		UseShowTrustedContactsEducationBannerModuleResult3,
		UseFireAnalyticsEventModuleResult
	})
	local FeatureFriendsTCEducationTitle = UseLocalizationFunction({
		title = "Feature.Friends.TCEducation.Title",
		learnMoreLink = "Feature.Friends.LinkText.LearnMore",
		bodyText = if FFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Banner.Text" else "Feature.Friends.TCEducation.Banner.Text",
		bodyText18Plus = if FFlagConnectionsToFriendsRename then "Feature.Friends.TFEducation.Modal.TextIntro.EighteenPlus" else "Feature.Friends.TCEducation.Modal.TextIntro.EighteenPlus"
	})
	
	return if UseShowTrustedContactsEducationBannerModuleResult then ReactModule.createElement(AddFriendsGenericBannerModule, {
		titleFont = "text-heading-small",
		textFont = "text-body-medium",
		layoutOrder = p1.layoutOrder,
		maxWidth = p1.maxWidth,
		onBannerMounted = UseResult2,
		isLoading = UseStateResult == AccessResponseEnum.Pending,
		bannerTitle = FeatureFriendsTCEducationTitle.title,
		bannerText = if UseStateResult == AccessResponseEnum.Granted then FeatureFriendsTCEducationTitle.bodyText18Plus else FeatureFriendsTCEducationTitle.bodyText,
		rightCornerButtonIcon = FoundationModule.Enums.IconName.X,
		rightCornerButtonActivated = UseResult1,
		bigBottomButton = {
			text = FeatureFriendsTCEducationTitle.learnMoreLink,
			onActivated = UseResult
		}
	}) else nil
end