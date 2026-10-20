local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local EventNames = require(AddFriends.Analytics).EventNames
local FFlagAddFriendsBannersNewUIIXP = require(Parent.SharedFlags).FFlagAddFriendsBannersNewUI_IXP
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UseAppPolicyFunction (copy), ReactModule (copy), EventNames (copy), AppPage (copy), Contexts (copy), UseLocalizationFunction (copy), FFlagAddFriendsBannersNewUIIXP (copy)
	local Component = p1.component
	local ComponentUIProps = p1.componentUIProps
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getEnableProfileQrCode()
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy), AppPage (upval), Contexts (upval)
		FireAnalyticsEventFunction(EventNames.QRCodeBtnClick)
		p1.navigateToLuaAppPages[AppPage.ProfileQRCodePage]({ source = Contexts.AddFriends })
	end, { p1.navigateToLuaAppPages, FireAnalyticsEventFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.QRCodeBtnImpression)
	end, { FireAnalyticsEventFunction })
	local UseLocalizationResult = UseLocalizationFunction({
		qrCodeBannerTitle = if FFlagAddFriendsBannersNewUIIXP then nil else "Feature.AddFriends.Title.ShareQRCode",
		qrCodeBannerText = if FFlagAddFriendsBannersNewUIIXP then nil else "Feature.AddFriends.Label.ShareQRCodeAddConnection",
		qrCodeTitle = if FFlagAddFriendsBannersNewUIIXP then "Feature.AddFriends.Label.MyQRTile" else nil
	})
	
	return if UseAppPolicyResult then ReactModule.createElement(Component, {
		icon = "icons/graphic/scanqr_large",
		title = if FFlagAddFriendsBannersNewUIIXP then UseLocalizationResult.qrCodeTitle else UseLocalizationResult.qrCodeBannerTitle,
		text = if FFlagAddFriendsBannersNewUIIXP then nil else UseLocalizationResult.qrCodeBannerText,
		onActivated = UseResult,
		onMounted = UseResult1,
		componentUIProps = ComponentUIProps
	}) else nil
end