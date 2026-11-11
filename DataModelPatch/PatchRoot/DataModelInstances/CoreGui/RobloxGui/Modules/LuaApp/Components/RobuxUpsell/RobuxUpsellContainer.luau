local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local LocaleProvider = require(CorePackages.Workspace.Packages.IAPExperience).Locale.LocaleProvider
local RobuxUpsellOverlayModule = require(script.Parent.RobuxUpsellOverlay)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local RobuxUpsellTriggerContextModule = require(script.Parent.Enum.RobuxUpsellTriggerContext)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local GetFFlagUADesktopPurchaseWarningsModule = require(Modules.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings)
local GetFFlagGuardTermOfUseByIsLinkAllowedModule = require(Modules.LuaApp.Flags.GetFFlagGuardTermOfUseByIsLinkAllowed)
local GetUpsellSuggestionsFunction = require(CorePackages.Workspace.Packages.IAPExperience).Api.PaymentsGateway.GetUpsellSuggestions
local PaymentPlatformUtilsModule = require(Modules.LuaApp.Thunks.Economy.Util.PaymentPlatformUtils)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local FFlagEnableUpsellSuggestionsAnalyticsId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId
local UpsellSuggestionsAPIMaxPackages = require(CorePackages.Workspace.Packages.SharedFlags).UpsellSuggestionsAPIMaxPackages

function ExtendResult.init(p1)
	-- upvalues: HttpService (copy), RobuxUpsellTriggerContextModule (copy), PaymentPlatformModule (copy), GetPaymentPlatformModule (copy), UrlBuilderModule (copy)
	p1.state = { analyticId = HttpService:GenerateGUID(false) }
	
	function p1.openSecuritySettings()
		-- upvalues: p1 (copy)
		p1.endPurchase()
		p1.props.openSecuritySettings()
	end
	
	function p1.openBuyRobux()
		-- upvalues: p1 (copy)
		p1.endPurchase()
		p1.props.openBuyRobux()
	end
	
	function p1.endPurchase()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
		p1.props.endPurchase()
		
		if p1.props.onOverlayClosed then
			p1.props.onOverlayClosed()
		end
	end
	
	function p1.sendAnalyticEvent(p2, p3, p4)
		-- upvalues: p1 (copy)
		p1.props.analytics.EventStream:setRBXEventStream(p2, p3, p4)
	end
	
	function p1.sendCounter(Text)
		-- upvalues: p1 (copy), RobuxUpsellTriggerContextModule (upval), PaymentPlatformModule (upval), GetPaymentPlatformModule (upval)
		local Diag = p1.props.analytics.Diag
		local RawValue = RobuxUpsellTriggerContextModule.toRawValue(p1.props.triggerContext)
		Diag:reportCounter(Text, 1)
		Diag:reportCounter(RawValue .. Text, 1)
		local RawValue1 = PaymentPlatformModule.toRawValue(GetPaymentPlatformModule())
		Diag:reportCounter(Text .. RawValue1, 1)
		Diag:reportCounter(RawValue .. Text .. RawValue1, 1)
	end
	
	function p1.handleOpenTermsOfUseOpen()
		-- upvalues: p1 (copy), UrlBuilderModule (upval)
		if p1.props.disableWebViewSupport == true then
			p1.props.linking:openURL(UrlBuilderModule.static.about.terms())
			
			return
		else
			p1.props.openTermsOfUse()
		end
	end
end

function ExtendResult:isLinkAllowed(): boolean
	-- upvalues: UserInputService (copy)
	local Platform = UserInputService:GetPlatform()
	
	return Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.Linux)
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), LocaleProvider (copy), LocalizationService (copy), RobuxUpsellOverlayModule (copy), PaymentPlatformUtilsModule (copy), GetPaymentPlatformModule (copy), GetUpsellSuggestionsFunction (copy), UpsellSuggestionsAPIMaxPackages (copy), FFlagEnableUpsellSuggestionsAnalyticsId (copy), GetFFlagUADesktopPurchaseWarningsModule (copy), GetFFlagGuardTermOfUseByIsLinkAllowedModule (copy), RobuxUpsellTriggerContextModule (copy)
	return RoactModule.createElement(LocaleProvider, { locale = LocalizationService.RobloxLocaleId }, {
		RobuxUpsellOverlay = RoactModule.createElement(RobuxUpsellOverlayModule, {
			screenSize = p1.props.screenSize,
			networking = p1.props.networking,
			userId = p1.props.userId,
			fetchUpsellSuggestions = function()
				-- upvalues: PaymentPlatformUtilsModule (upval), GetPaymentPlatformModule (upval), GetUpsellSuggestionsFunction (upval), p1 (copy), UpsellSuggestionsAPIMaxPackages (upval), FFlagEnableUpsellSuggestionsAnalyticsId (upval)
				return GetUpsellSuggestionsFunction(PaymentPlatformUtilsModule.paymentPlatformToUpsellPlatform(GetPaymentPlatformModule()), p1.props.userRobux, p1.props.priceInRobux, UpsellSuggestionsAPIMaxPackages, p1.props.itemProductId, p1.props.itemName, game.GameId, FFlagEnableUpsellSuggestionsAnalyticsId and p1.state.analyticId or nil)
			end,
			dispatchFetchRobuxProduct = function()
				-- upvalues: p1 (copy)
				return p1.props.dispatchFetchRobuxProduct(p1.props.networking, p1.props.userRobux, p1.props.priceInRobux, p1.props.itemProductId, p1.props.itemName, game.GameId)
			end,
			dispatchFetchIAPPurchaseWarning = function(p2, p3)
				-- upvalues: GetFFlagUADesktopPurchaseWarningsModule (upval), p1 (copy)
				return if GetFFlagUADesktopPurchaseWarningsModule() then p1.props.dispatchFetchIAPPurchaseWarning(p1.props.networking, p2, p3, p1.props.isPremium) else p1.props.dispatchFetchIAPPurchaseWarning(p1.props.networking, p2)
			end,
			dispatchPostAckPurchaseWarning = function(p2)
				-- upvalues: p1 (copy)
				return p1.props.dispatchPostAckPurchaseWarning(p1.props.networking, p2)
			end,
			dispatchCheckUserPurchaseSettings = function()
				-- upvalues: p1 (copy)
				return p1.props.dispatchCheckUserPurchaseSettings(p1.props.networking)
			end,
			dispatchCentralOverlay = p1.props.dispatchCentralOverlay,
			iapPurchase = p1.props.iapPurchase,
			itemProductId = p1.props.itemProductId,
			itemIcon = p1.props.itemIcon,
			itemName = p1.props.itemName,
			beforeRobuxBalance = p1.props.userRobux,
			priceInRobux = p1.props.priceInRobux,
			endPurchase = p1.endPurchase,
			promptRobux = p1.props.promptRobux,
			openTermsOfUse = if GetFFlagGuardTermOfUseByIsLinkAllowedModule() then p1:isLinkAllowed() and p1.handleOpenTermsOfUseOpen or nil else p1.handleOpenTermsOfUseOpen,
			openSecuritySettings = p1.openSecuritySettings,
			openBuyRobux = p1.openBuyRobux,
			renderChallenge = p1.props.renderChallenge,
			purchaseItem = p1.props.purchaseItem,
			equipItem = p1.props.equipItem,
			openSettingsPage = p1.props.openSettingsPage,
			sendAnalyticEvent = p1.sendAnalyticEvent,
			sendCounter = p1.sendCounter,
			eventPrefix = RobuxUpsellTriggerContextModule.toRawValue(p1.props.triggerContext),
			analyticId = p1.state.analyticId
		})
	})
end

return (WithNavigationFunction((WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	linking = AppLinking
})((RoactAppPolicy.connect(function(p1, _)
	return {
		disableWebViewSupport = not p1.getWebViewSupport(),
		enablePremiumUserFeatures = p1.getEnablePremiumUserFeatures()
	}
end)((RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule)(ExtendResult))))))))))))