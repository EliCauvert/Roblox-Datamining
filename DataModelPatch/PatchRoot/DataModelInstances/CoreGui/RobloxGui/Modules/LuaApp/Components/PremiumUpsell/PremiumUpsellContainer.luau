local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local LocaleProvider = require(CorePackages.Workspace.Packages.IAPExperience).Locale.LocaleProvider
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local PremiumUpsellOverlayModule = require(script.Parent.PremiumUpsellOverlay)
local PremiumUpsellTriggerContextModule = require(script.Parent.Enum.PremiumUpsellTriggerContext)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: PremiumUpsellTriggerContextModule (copy)
	function p1.closeCentralOverlay()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.promptPremium()
		-- upvalues: p1 (copy)
		p1.endPurchase()
		p1.props.promptPremium()
	end
	
	function p1.cancelPurchase()
		-- upvalues: p1 (copy)
		p1.endPurchase()
		
		if p1.props.onCancel then
			p1.props.onCancel()
		end
	end
	
	function p1.endPurchase()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
		
		if p1.props.onOverlayClosed then
			p1.props.onOverlayClosed()
		end
	end
	
	function p1.sendAnalyticEvent(p2, p3, p4)
		-- upvalues: p1 (copy)
		p1.props.analytics.EventStream:setRBXEventStream(p2, p3, p4)
	end
	
	function p1.sendCounter(Text)
		-- upvalues: p1 (copy), PremiumUpsellTriggerContextModule (upval)
		local Diag = p1.props.analytics.Diag
		local RawValue = PremiumUpsellTriggerContextModule.toRawValue(p1.props.triggerContext)
		Diag:reportCounter(Text, 1)
		Diag:reportCounter(RawValue .. Text, 1)
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: RetrievalStatusModule (copy)
	if p1.props.iapProductsFetchingStatus == RetrievalStatusModule.NotStarted or p1.props.iapProductsFetchingStatus == RetrievalStatusModule.Failed then
		p1.props.dispatchFetchIAPProducts(p1.props.networking)
	end
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), LocaleProvider (copy), LocalizationService (copy), PremiumUpsellOverlayModule (copy), PremiumUpsellTriggerContextModule (copy)
	return RoactModule.createElement(LocaleProvider, { locale = LocalizationService.RobloxLocaleId }, {
		PremiumUpsellOverlay = RoactModule.createElement(PremiumUpsellOverlayModule, {
			screenSize = p1.props.screenSize,
			currencySymbol = if p1.props.subscriptionProduct then p1.props.subscriptionProduct.currencySymbol else nil,
			robuxPrice = if p1.props.subscriptionProduct then p1.props.subscriptionProduct.price else nil,
			robuxAmount = if p1.props.subscriptionProduct then p1.props.subscriptionProduct.robuxAmount else nil,
			iapProductsFetchingStatus = p1.props.iapProductsFetchingStatus,
			promptPremium = p1.promptPremium,
			cancelPurchase = p1.cancelPurchase,
			endPurchase = p1.endPurchase,
			sendAnalyticEvent = p1.sendAnalyticEvent,
			sendCounter = p1.sendCounter,
			eventPrefix = PremiumUpsellTriggerContextModule.toRawValue(p1.props.triggerContext),
			dispatchCentralOverlay = p1.props.dispatchCentralOverlay
		})
	})
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule
})((RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule)(ExtendResult))))))))