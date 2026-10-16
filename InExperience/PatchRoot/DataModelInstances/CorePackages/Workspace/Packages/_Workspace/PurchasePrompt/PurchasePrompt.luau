local v1 = script
local Parent = v1.Parent
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local RunService = game:GetService("RunService")
local SharedFlagsModule = require(Parent.SharedFlags)
local Roact = PurchasePromptDepsModule.Roact
local Rodux = PurchasePromptDepsModule.Rodux
local CoreGui = game:GetService("CoreGui")
local PurchasePromptAppModule = require(script.Components.PurchasePromptApp)
local ReducerModule = require(v1.Reducers.Reducer)
local ABTestModule = require(v1.Services.ABTest)
local NetworkModule = require(v1.Services.Network)
local AnalyticsModule = require(v1.Services.Analytics)
local PlatformInterfaceModule = require(v1.Services.PlatformInterface)
local ExternalSettingsModule = require(v1.Services.ExternalSettings)
local PublicBindablesModule = require(v1.Services.PublicBindables)
local ThunkModule = require(v1.Thunk)
local InitiateAvatarCreationFeePurchaseModule = require(v1.Thunks.initiateAvatarCreationFeePurchase)
local UnifiedPurchasePromptModule = require(v1.Components.UnifiedPurchasePrompt)
local DispatchPurchaseForProductPayloadModule = require(v1.Utils.dispatchPurchaseForProductPayload)
local SetProductPayloadModule = require(v1.Actions.SetProductPayload)
local SetPurchaseAnalyticsMetadataModule = require(v1.Actions.SetPurchaseAnalyticsMetadata)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(v1.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagPurchasePromptCartPricingEnabledModule = require(v1.Flags.FFlagPurchasePromptCartPricingEnabled)
local FFlagEnablePurchasePayloadInExperienceShop = SharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local FFlagPassShopPurchaseSurfaceToBuyModal = SharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local FFlagSkipBuyDelayForExperienceShopModule = require(v1.Flags.FFlagSkipBuyDelayForExperienceShop)
local _ = require(v1.types)
local FFlagPurchasePromptSubtitleForTimedOptions = require(v1.Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local FFlagEnableRobuxInExperienceShop = SharedFlagsModule.FFlagEnableRobuxInExperienceShop
local PurchasePromptElevateDisplayOrder = game:DefineFastFlag("PurchasePromptElevateDisplayOrder", false)
local WindowStateModule = require(v1.Enums.WindowState)
local PromptStateModule = require(v1.Enums.PromptState)
local PurchasePromptApp = nil
local NewResult = nil
local v2 = nil
local BindableEvent = Instance.new("BindableEvent")
local BindableEvent1 = Instance.new("BindableEvent")

local function createStore() --[[ Line: 59 ]]
	-- upvalues: ABTestModule (copy), NetworkModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), v2 (ref), AnalyticsModule (copy), PlatformInterfaceModule (copy), ExternalSettingsModule (copy), PublicBindablesModule (copy), BindableEvent (copy), NewResult (ref), Rodux (copy), ReducerModule (copy), ThunkModule (copy), WindowStateModule (copy), PromptStateModule (copy), BindableEvent1 (copy), PurchasePromptLiteModule (copy)
	local NewABTest = ABTestModule.new()
	local NewNetwork = NetworkModule.new()
	
	if FFlagPurchasePromptCartPricingEnabledModule then
		v2 = NewNetwork
	end
	NewResult = Rodux.Store.new(ReducerModule, {}, {
		ThunkModule.middleware({
			[ABTestModule] = NewABTest,
			[NetworkModule] = if FFlagPurchasePromptCartPricingEnabledModule then v2 else NewNetwork,
			[AnalyticsModule] = AnalyticsModule.new(),
			[PlatformInterfaceModule] = PlatformInterfaceModule.new(),
			[ExternalSettingsModule] = ExternalSettingsModule.new(),
			[PublicBindablesModule] = PublicBindablesModule.new({ windowStateChangedBindable = BindableEvent })
		})
	})
	NewResult.changed:connect(function(Value, p1) --[[ Line: 85 ]]
		-- upvalues: BindableEvent (upval), WindowStateModule (upval), PromptStateModule (upval), BindableEvent1 (upval), FFlagPurchasePromptCartPricingEnabledModule (upval), PurchasePromptLiteModule (upval)
		if p1.windowState ~= Value.windowState then
			BindableEvent:Fire({
				isShown = Value.windowState == WindowStateModule.Shown,
				hasCompletedPurchase = Value.hasCompletedPurchase
			})
		end
		if p1.promptState ~= Value.promptState and Value.promptState == PromptStateModule.None then
			BindableEvent1:Fire()
		end
		if FFlagPurchasePromptCartPricingEnabledModule and not p1.hasCompletedPurchase and Value.hasCompletedPurchase then
			PurchasePromptLiteModule.Events.firePurchaseCompleted()
		end
	end)
end

return {
	mountPurchasePrompt = function() --[[ Line: 115 ]]
		-- upvalues: RunService (copy), PurchasePromptApp (ref), createStore (copy), PurchasePromptElevateDisplayOrder (copy), Roact (copy), PurchasePromptAppModule (copy), NewResult (ref), FFlagPurchasePromptCartPricingEnabledModule (copy), v2 (ref), CoreGui (copy)
		if RunService:IsStudio() and RunService:IsEdit() or PurchasePromptApp then
			return nil
		end
		createStore()
		local ScreenGui = { AutoLocalize = false, IgnoreGuiInset = true }
		
		if PurchasePromptElevateDisplayOrder then
			ScreenGui.DisplayOrder = 10
		end
		PurchasePromptApp = Roact.mount(Roact.createElement("ScreenGui", ScreenGui, {
			Roact.createElement(PurchasePromptAppModule, {
				store = NewResult,
				network = if FFlagPurchasePromptCartPricingEnabledModule then v2 else nil
			})
		}), CoreGui, "PurchasePromptApp")
		
		return PurchasePromptApp
	end,
	initiateAvatarCreationFeePurchase = function(p1, p2, p3, p4) --[[ Line: 149 ]]
		-- upvalues: NewResult (ref), InitiateAvatarCreationFeePurchaseModule (copy)
		if not NewResult then
			error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted")
		end
		NewResult:dispatch(InitiateAvatarCreationFeePurchaseModule(p1, p2, p3, p4))
	end,
	initiatePurchaseForProductPayload = function(p1, p2) --[[ Line: 176 ]]
		-- upvalues: NewResult (ref), FFlagEnablePurchasePayloadInExperienceShop (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), SetProductPayloadModule (copy), FFlagPassShopPurchaseSurfaceToBuyModal (copy), SetPurchaseAnalyticsMetadataModule (copy), DispatchPurchaseForProductPayloadModule (copy)
		if not NewResult then
			warn("initiatePurchaseForProductPayload called before mountPurchasePrompt; ignoring.")
			
			return
		end
		if FFlagEnablePurchasePayloadInExperienceShop or FFlagSkipBuyDelayForExperienceShopModule then
			NewResult:dispatch(SetProductPayloadModule(p1))
		end
		if FFlagPassShopPurchaseSurfaceToBuyModal and p2 then
			NewResult:dispatch(SetPurchaseAnalyticsMetadataModule({
				surface = p2.surface,
				productUniverseId = p2.productUniverseId
			}))
		end
		DispatchPurchaseForProductPayloadModule(function(p3) --[[ Line: 202 ]]
			-- upvalues: NewResult (upval)
			NewResult:dispatch(p3)
		end, p1, nil, false)
	end,
	windowStateChangedEvent = BindableEvent.Event,
	promptStateSetToNoneEvent = BindableEvent1.Event,
	Utils = if SharedFlagsModule.FFlagAXMISWithBlackbird then {
		getBlackbirdUpsellBannerProductInfo = require(v1.Utils.getBlackbirdUpsellBannerProductInfo)
	} else {},
	PublishAssetAnalytics = require(v1.Utils.PublishAssetAnalytics),
	UnifiedPurchasePromptContainer = function(p1) --[[ Line: 221 ]]
		-- upvalues: createStore (copy), Roact (copy), UnifiedPurchasePromptModule (copy), NewResult (ref), FFlagPurchasePromptCartPricingEnabledModule (copy), v2 (ref), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy)
		createStore()
		
		return Roact.createElement(UnifiedPurchasePromptModule, {
			store = NewResult,
			network = if FFlagPurchasePromptCartPricingEnabledModule then v2 else nil,
			productPayload = p1.productPayload,
			purchaseCallbacks = p1.purchaseCallbacks,
			postPurchaseActions = p1.postPurchaseActions,
			purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
			purchaseOptions = if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p1.purchaseOptions else nil,
			subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p1.subtitleView else nil
		})
	end,
	launchRobuxPackagePurchase = if FFlagEnableRobuxInExperienceShop then require(v1.launchRobuxPackagePurchase) else nil,
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"]
}