local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local WithNavigationFunction = RoactNavigationModule.withNavigation
local LocaleProvider = require(CorePackages.Workspace.Packages.IAPExperience).Locale.LocaleProvider
local _ = require(script.Parent.RobuxPackage)
local BuyRobuxOverlayModule = require(script.Parent.BuyRobuxOverlay)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local BuyRobuxCounterModule = require(script.Parent.Enum.BuyRobuxCounter)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local Default = require(CorePackages.Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default
local GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy
local GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPageModule = require(Modules.LuaApp.Flags.GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPage)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

function ExtendResult.init(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), Default (copy)
	function p1.endPurchase()
		-- upvalues: p1 (copy)
		p1.props.dispatchClearNativePurchaseResult()
	end
	
	function p1.sendAnalyticEvent(p2, p3, p4)
		-- upvalues: p1 (copy)
		p1.props.analytics.EventStream:setRBXEventStream(p2, p3, p4)
	end
	
	function p1.sendCounter(RawValue)
		-- upvalues: p1 (copy)
		p1.props.analytics.Diag:reportCounter(RawValue, 1)
	end
	
	function p1.dispatchFetchIAPPurchaseWarning(p2, p3)
		-- upvalues: p1 (copy)
		return p1.props.dispatchFetchIAPPurchaseWarning(p1.props.networking, p2, p3, p1.props.isPremium)
	end
	
	function p1.dispatchPostAckPurchaseWarning(p2)
		-- upvalues: p1 (copy)
		return p1.props.dispatchPostAckPurchaseWarning(p1.props.networking, p2)
	end
	
	function p1.dispatchCheckUserPurchaseSettings()
		-- upvalues: p1 (copy)
		return p1.props.dispatchCheckUserPurchaseSettings(p1.props.networking)
	end
	
	function p1.onWillBlur()
		-- upvalues: FFlagEnableLeftNavOnConsole (upval), Default (upval)
		if not FFlagEnableLeftNavOnConsole then
			Default:isAvailable():andThen(function(Result)
				-- upvalues: Default (upval)
				if Result then
					Default:sendIAPEvent("BrowseProductEnd")
				end
			end)
			
			return
		end
	end
	
	function p1.onWillUnmount()
		-- upvalues: FFlagEnableLeftNavOnConsole (upval), Default (upval)
		if FFlagEnableLeftNavOnConsole then
			Default:isAvailable():andThen(function(Result)
				-- upvalues: Default (upval)
				if Result then
					Default:sendIAPEvent("BrowseProductEnd")
				end
			end)
			
			return
		end
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: RetrievalStatusModule (copy), Default (copy), GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPageModule (copy)
	local Props = p1.props
	
	if p1.props.iapProductsFetchingStatus == RetrievalStatusModule.NotStarted or p1.props.iapProductsFetchingStatus == RetrievalStatusModule.Failed then
		p1.props.dispatchFetchIAPProducts(p1.props.networking)
	end
	if p1.props.nativeProductsFetchingStatus == RetrievalStatusModule.NotStarted or p1.props.nativeProductsFetchingStatus == RetrievalStatusModule.Failed then
		p1.props.dispatchFetchNativeIAPProducts()
	end
	Default:isAvailable():andThen(function(Result)
		-- upvalues: Default (upval)
		if Result then
			Default:sendIAPEvent("BrowseProductStart")
		end
	end)
	
	if GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPageModule() then
		Props.dispatchFetchUserBalance(p1.props.networking, (tostring(p1.props.userId)))
	end
end

function ExtendResult.didUpdate(p1, p2)
	-- upvalues: RetrievalStatusModule (copy), BuyRobuxCounterModule (copy), Default (copy)
	local Props = p1.props
	
	if Props.iapProductsFetchingStatus ~= p2.iapProductsFetchingStatus and Props.iapProductsFetchingStatus == RetrievalStatusModule.Failed then
		p1.sendCounter(BuyRobuxCounterModule.toRawValue(BuyRobuxCounterModule.InvalidProducts))
	end
	if Props.iapProductsFetchingStatus == RetrievalStatusModule.Done and Props.nativeProductsFetchingStatus == RetrievalStatusModule.Done and #Props.robuxPackages == 0 then
		Default:isAvailable():andThen(function(Result)
			-- upvalues: Default (upval)
			if Result then
				Default:sendIAPEvent("ProductNotAvailable")
			end
		end)
		p1.props.dispatchNavigateBack()
	end
end

function ExtendResult.render(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), RoactModule (copy), RoactNavigationModule (copy), LocaleProvider (copy), LocalizationService (copy), BuyRobuxOverlayModule (copy)
	local Element = if FFlagEnableLeftNavOnConsole then nil else RoactModule.createElement(RoactNavigationModule.NavigationEvents, { onWillBlur = p1.onWillBlur })
	
	return RoactModule.createElement(LocaleProvider, { locale = LocalizationService.RobloxLocaleId }, {
		navigationEvents = if FFlagEnableLeftNavOnConsole then nil else Element,
		BuyRobuxOverlay = RoactModule.createElement(BuyRobuxOverlayModule, {
			eventPrefix = "",
			screenSize = p1.props.screenSize,
			networking = p1.props.networking,
			robuxBalance = p1.props.robuxBalance,
			robuxPackages = p1.props.robuxPackages,
			analyticId = p1.props.analyticId,
			iapPurchase = p1.props.iapPurchase,
			iapProductsFetchingStatus = p1.props.iapProductsFetchingStatus,
			nativeProductsFetchingStatus = p1.props.nativeProductsFetchingStatus,
			dispatchFetchIAPPurchaseWarning = p1.dispatchFetchIAPPurchaseWarning,
			dispatchPostAckPurchaseWarning = p1.dispatchPostAckPurchaseWarning,
			dispatchCentralOverlay = p1.props.dispatchCentralOverlay,
			dispatchCheckUserPurchaseSettings = p1.dispatchCheckUserPurchaseSettings,
			endPurchase = p1.endPurchase,
			promptRobux = p1.props.promptRobux,
			sendAnalyticEvent = p1.sendAnalyticEvent,
			sendCounter = p1.sendCounter,
			onPageClose = p1.props.dispatchNavigateBack
		})
	})
end

function ExtendResult.willUnmount(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy)
	if FFlagEnableLeftNavOnConsole then
		p1.onWillUnmount()
	end
end

local v1 = RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule)(ExtendResult)

if GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction() then
	v1 = RoactAppPolicy.connect(function(p1, _)
		return {
			enablePremiumUserFeatures = p1.getEnablePremiumUserFeatures()
		}
	end)(v1)
end
return (WithNavigationFunction((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule,
	linking = AppLinking
})(v1))))