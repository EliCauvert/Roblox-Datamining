local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GenericNativePageWrapperModule = require(Modules.LuaApp.Components.GenericNativePageWrapper)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)
local WebViewWindowModule = require(Modules.LuaApp.Enum.WebViewWindow)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local NativePurchaseCompleteModule = require(Modules.LuaApp.Thunks.NativePurchaseComplete)
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
local FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module = require(Modules.LuaApp.Flags.FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2)
local NativePurchaseRobuxPageWrapperAnalyticsModule = require(Modules.LuaApp.Components.EventReceivers.Analytics.NativePurchaseRobuxPageWrapperAnalytics)
local NativePurchaseRobuxPageWrapperAnalytics = NativePurchaseRobuxPageWrapperAnalyticsModule.NativePurchaseRobuxPageWrapperAnalytics
local TimingData = NativePurchaseRobuxPageWrapperAnalyticsModule.TimingData
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local NativePurchaseRobuxPageWrapper = RoactModule.PureComponent:extend("NativePurchaseRobuxPageWrapper")
local GetFFlagEnableUnifiedStaticWebViewsModule = require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews)
local GetFFlagCleanUpNativePurchaseRobuxTitleModule = require(Modules.LuaApp.Flags.GetFFlagCleanUpNativePurchaseRobuxTitle)
local NativePurchaseRobuxPageWrapperEnableTelemetry = game:DefineFastFlag("NativePurchaseRobuxPageWrapperEnableTelemetry", false)
local GetFFlagWebViewServiceHasBackButtonVisibilityModule = require(Modules.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility)
local PurchasingPerformanceModule = require(CorePackages.Workspace.Packages.PurchasingPerformance)
local BuyRobuxPageTTIManager = PurchasingPerformanceModule.BuyRobuxPageTTIManager
local FFlagEnableBuyRobuxPageTTI = PurchasingPerformanceModule.Flags.FFlagEnableBuyRobuxPageTTI
local GetFFlagWebViewHasHideHeaderModule = require(Modules.LuaApp.Flags.GetFFlagWebViewHasHideHeader)
NativePurchaseRobuxPageWrapper.defaultProps = {
	economyGetBalance = require(Modules.LuaApp.Http.Requests.EconomyAPI.GetRobuxBalance),
	memStorageService = game:GetService("MemStorageService")
}

function NativePurchaseRobuxPageWrapper.init(p1)
	-- upvalues: FFlagEnableBuyRobuxPageTTI (copy), BuyRobuxPageTTIManager (copy), NativePurchaseRobuxPageWrapperEnableTelemetry (copy), HttpService (copy), TimingData (copy), NativePurchaseRobuxPageWrapperAnalytics (copy), TelemetryService (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), MemStorageKeysModule (copy), NumberLocalization (copy)
	p1.webViewUrl = if FFlagEnableBuyRobuxPageTTI and p1.props.url ~= nil and BuyRobuxPageTTIManager.getTtiStartMs() ~= nil then BuyRobuxPageTTIManager.appendTtiStartMsToUrl(p1.props.url) else nil
	
	if NativePurchaseRobuxPageWrapperEnableTelemetry then
		p1.timingData = TimingData.new(HttpService:GenerateGUID(false), (tick()))
		p1.analytics = NativePurchaseRobuxPageWrapperAnalytics.new(TelemetryService)
		p1.analytics:onInit(p1.timingData)
	end
	if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then
		p1.onClose = GetSubscriptionPurchaseCloseCallbackFunction()
	end
	p1.state = { localizedTitle = "--" }
	
	function p1.getRobuxBalance()
		-- upvalues: NativePurchaseRobuxPageWrapperEnableTelemetry (upval), p1 (copy), MemStorageKeysModule (upval), NumberLocalization (upval)
		local CurrentTime: number? = nil
		
		if NativePurchaseRobuxPageWrapperEnableTelemetry and p1.timingData then
			CurrentTime = tick()
			p1.timingData.get_robux_balance_start = CurrentTime
			p1.analytics:onApiCall(p1.timingData, "getRobuxBalance")
		end
		p1.props.economyGetBalance(p1.props.networking):andThen(function(Result)
			-- upvalues: NativePurchaseRobuxPageWrapperEnableTelemetry (upval), p1 (upval), CurrentTime (ref), MemStorageKeysModule (upval), NumberLocalization (upval)
			local Robux = Result and Result.responseBody.robux or "--"
			
			if NativePurchaseRobuxPageWrapperEnableTelemetry and p1.timingData and CurrentTime then
				p1.timingData:setApiTiming(CurrentTime, (tick()))
				p1.analytics:onApiResponse(p1.timingData, "getRobuxBalance", (tostring(Robux)))
			end
			p1.props.memStorageService:SetItem(MemStorageKeysModule.RobuxBalance, Robux)
			p1:setState({
				localizedTitle = p1.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", NumberLocalization.localize(Robux, p1.props.localization:GetLocale()) or "--")
			})
		end)
	end
end

function NativePurchaseRobuxPageWrapper.didMount(p1)
	-- upvalues: FFlagEnableBuyRobuxPageTTI (copy), BuyRobuxPageTTIManager (copy), NativePurchaseRobuxPageWrapperEnableTelemetry (copy), GetFFlagCleanUpNativePurchaseRobuxTitleModule (copy), MemStorageKeysModule (copy), NumberLocalization (copy)
	if FFlagEnableBuyRobuxPageTTI and BuyRobuxPageTTIManager.getTtiStartMs() ~= nil then
		if not p1.didFirePrimaryDataStartedUA then
			p1.didFirePrimaryDataStartedUA = true
			BuyRobuxPageTTIManager.L2.primaryDataStartedUA()
			BuyRobuxPageTTIManager.simulateWebPayload()
		end
		BuyRobuxPageTTIManager.L2.surfaceMountedUA()
	end
	if NativePurchaseRobuxPageWrapperEnableTelemetry and p1.timingData then
		p1.timingData:setMountTime((tick()))
		
		if p1.analytics then
			p1.analytics:onMount(p1.timingData)
		end
	end
	if GetFFlagCleanUpNativePurchaseRobuxTitleModule() then
		p1.getRobuxBalance()
		p1.connection = p1.props.memStorageService:bind(MemStorageKeysModule.RefreshRobuxBalance, p1.getRobuxBalance)
		
		return
	end
	local CurrentTime = tick()
	
	if NativePurchaseRobuxPageWrapperEnableTelemetry then
		p1.timingData.get_robux_balance_start = CurrentTime
		p1.analytics:onApiCall(p1.timingData, "getRobuxBalance")
	end
	p1.props.economyGetBalance(p1.props.networking):andThen(function(Result)
		-- upvalues: CurrentTime (copy), NativePurchaseRobuxPageWrapperEnableTelemetry (upval), p1 (copy), MemStorageKeysModule (upval), NumberLocalization (upval)
		local CurrentTime1 = tick()
		local Robux = Result and Result.responseBody.robux or "--"
		local CurrentTimeDelta = CurrentTime1 - CurrentTime
		
		if NativePurchaseRobuxPageWrapperEnableTelemetry then
			p1.timingData.get_robux_balance_response = CurrentTime1
			p1.timingData.api_latency_ms = CurrentTimeDelta * 1000
			p1.analytics:onApiResponse(p1.timingData, "getRobuxBalance", (tostring(Robux)))
		end
		p1.props.memStorageService:SetItem(MemStorageKeysModule.RobuxBalance, Robux)
		p1.props.memStorageService:SetItem(MemStorageKeysModule.RobuxBalanceLocalized, (p1.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", NumberLocalization.localize(Robux, p1.props.localization:GetLocale()) or "--")))
	end)
	p1.connection = p1.props.memStorageService:bind(MemStorageKeysModule.RefreshRobuxBalance, function(_)
		-- upvalues: p1 (copy), MemStorageKeysModule (upval), NumberLocalization (upval)
		p1.props.economyGetBalance(p1.props.networking):andThen(function(Result)
			-- upvalues: p1 (upval), MemStorageKeysModule (upval), NumberLocalization (upval)
			local Robux = Result and Result.responseBody.robux or "--"
			p1.props.memStorageService:SetItem(MemStorageKeysModule.RobuxBalance, Robux)
			p1.props.memStorageService:SetItem(MemStorageKeysModule.RobuxBalanceLocalized, (p1.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", NumberLocalization.localize(Robux, p1.props.localization:GetLocale()) or "--")))
		end)
	end)
end

function NativePurchaseRobuxPageWrapper.willUnmount(p1)
	if p1.connection ~= nil then
		p1.connection:Disconnect()
		p1.connection = nil
	end
	if p1.props.nativeProductId then
		p1.props.onNativePurchaseAttempt(p1.props.networking, p1.props.nativeProductId)
	end
end

function NativePurchaseRobuxPageWrapper.render(p1)
	-- upvalues: FFlagEnableBuyRobuxPageTTI (copy), BuyRobuxPageTTIManager (copy), NativePurchaseRobuxPageWrapperEnableTelemetry (copy), GetFFlagEnableUnifiedStaticWebViewsModule (copy), GetFFlagCleanUpNativePurchaseRobuxTitleModule (copy), FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module (copy), RoactModule (copy), AppWebViewModule (copy), WebViewWindowModule (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (copy), GetFFlagWebViewHasHideHeaderModule (copy), GenericNativePageWrapperModule (copy), NotificationTypeModule (copy)
	local CurrentTime = tick()
	
	if FFlagEnableBuyRobuxPageTTI and BuyRobuxPageTTIManager.getTtiStartMs() ~= nil and not p1.didFireRenderStartedUA then
		p1.didFireRenderStartedUA = true
		BuyRobuxPageTTIManager.L2.renderStartedUA()
	end
	if NativePurchaseRobuxPageWrapperEnableTelemetry and p1.timingData then
		p1.timingData:setRenderTime(CurrentTime)
		p1.analytics:onRender(p1.timingData)
	end
	local IsVisible = p1.props.isVisible
	local DisplayOrder = p1.props.DisplayOrder
	local WebViewUrl = if FFlagEnableBuyRobuxPageTTI and p1.webViewUrl ~= nil then p1.webViewUrl else p1.props.url
	local TransitionAnimation = p1.props.transitionAnimation
	
	if GetFFlagEnableUnifiedStaticWebViewsModule() then
		return if GetFFlagCleanUpNativePurchaseRobuxTitleModule() then (function()
			-- upvalues: FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module (upval), CurrentTime (copy), NativePurchaseRobuxPageWrapperEnableTelemetry (upval), p1 (copy), RoactModule (upval), AppWebViewModule (upval), WebViewUrl (copy), WebViewWindowModule (upval), TransitionAnimation (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (upval), GetFFlagWebViewHasHideHeaderModule (upval), IsVisible (copy), DisplayOrder (copy)
			local CurrentTime1 = if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module then CurrentTime else tick()
			
			if NativePurchaseRobuxPageWrapperEnableTelemetry and p1.timingData then
				p1.timingData:setWebViewLoadTime(CurrentTime1)
				p1.analytics:onWebViewLoad(p1.timingData, CurrentTime)
			end
			return RoactModule.createElement(AppWebViewModule, {
				url = WebViewUrl,
				title = p1.state.localizedTitle,
				windowType = WebViewWindowModule.Dialog,
				transitionAnimation = TransitionAnimation,
				hasBackButton = not GetFFlagWebViewServiceHasBackButtonVisibilityModule() and nil,
				windowCloseCallback = p1.onClose,
				hideHeader = if GetFFlagWebViewHasHideHeaderModule() then true else nil,
				overlayProps = { isVisible = IsVisible, DisplayOrder = DisplayOrder }
			})
		end)() else (function()
			-- upvalues: FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module (upval), p1 (copy), CurrentTime (copy), RoactModule (upval), AppWebViewModule (upval), WebViewUrl (copy), WebViewWindowModule (upval), TransitionAnimation (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (upval), GetFFlagWebViewHasHideHeaderModule (upval), IsVisible (copy), DisplayOrder (copy)
			if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module and p1.timingData then
				p1.timingData:setWebViewLoadTime(CurrentTime)
				p1.analytics:onWebViewLoad(p1.timingData, CurrentTime)
			end
			return RoactModule.createElement(AppWebViewModule, {
				titleKey = "Feature.BuyRobux.Heading.Banner",
				url = WebViewUrl,
				windowType = WebViewWindowModule.Dialog,
				transitionAnimation = TransitionAnimation,
				hasBackButton = not GetFFlagWebViewServiceHasBackButtonVisibilityModule() and nil,
				windowCloseCallback = p1.onClose,
				hideHeader = if GetFFlagWebViewHasHideHeaderModule() then true else nil,
				overlayProps = { isVisible = IsVisible, DisplayOrder = DisplayOrder }
			})
		end)()
	end
	if FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2Module and p1.timingData then
		p1.timingData:setWebViewLoadTime(CurrentTime)
		p1.analytics:onWebViewLoad(p1.timingData, CurrentTime)
	end
	return RoactModule.createElement(GenericNativePageWrapperModule, {
		titleTextLocalizationKey = "Feature.BuyRobux.Heading.Banner",
		isVisible = IsVisible,
		DisplayOrder = DisplayOrder,
		notificationType = NotificationTypeModule.PURCHASE_ROBUX,
		transitionAnimation = TransitionAnimation,
		onClose = p1.onClose
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return { nativeProductId = p1.NativePurchase.nativeProductId }
end, function(Callback)
	-- upvalues: NativePurchaseCompleteModule (copy), NativePurchaseStatusModule (copy)
	return {
		onNativePurchaseAttempt = function(p1, p2)
			-- upvalues: Callback (copy), NativePurchaseCompleteModule (upval), NativePurchaseStatusModule (upval)
			Callback(NativePurchaseCompleteModule(p1, p2, NativePurchaseStatusModule.Polling))
		end
	}
end)((RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = RoactNetworkingModule
})(NativePurchaseRobuxPageWrapper))))