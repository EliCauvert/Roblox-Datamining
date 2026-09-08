local _script = script
local parent = _script.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local runService = game:GetService("RunService")
local sharedFlagsModule = require(parent.SharedFlags)
local roact = purchasePromptDepsModule.Roact
local rodux = purchasePromptDepsModule.Rodux
local coreGuiService = game:GetService("CoreGui")
local purchasePromptAppModule = require(script.Components.PurchasePromptApp)
local reducerModule = require(_script.Reducers.Reducer)
local ABTestModule = require(_script.Services.ABTest)
local networkModule = require(_script.Services.Network)
local analyticsModule = require(_script.Services.Analytics)
local platformInterfaceModule = require(_script.Services.PlatformInterface)
local externalSettingsModule = require(_script.Services.ExternalSettings)
local publicBindablesModule = require(_script.Services.PublicBindables)
local thunkModule = require(_script.Thunk)
local initiateAvatarCreationFeePurchaseModule = require(_script.Thunks.initiateAvatarCreationFeePurchase)
local unifiedPurchasePromptModule = require(_script.Components.UnifiedPurchasePrompt)
local dispatchPurchaseForProductPayloadModule = require(_script.Utils.dispatchPurchaseForProductPayload)
local setProductPayloadModule = require(_script.Actions.SetProductPayload)
local setPurchaseAnalyticsMetadataModule = require(_script.Actions.SetPurchaseAnalyticsMetadata)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(_script.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptCartPricingEnabledModule = require(_script.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagPassShopPurchaseSurfaceToBuyModal = sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal
local fFlagSkipBuyDelayForExperienceShopModule = require(_script.Flags.FFlagSkipBuyDelayForExperienceShop)
local _ = require(_script.types)
local fFlagPurchasePromptSubtitleForTimedOptions = require(_script.Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local purchasePromptElevateDisplayOrder = game:DefineFastFlag("PurchasePromptElevateDisplayOrder", false)
local windowStateModule = require(_script.Enums.WindowState)
local promptStateModule = require(_script.Enums.PromptState)
local publishAssetAnalyticsModule = require(_script.Utils.PublishAssetAnalytics)
local var1 = nil
local var2 = nil
local var3 = nil
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")

local function createStore()
	-- upvalues: ABTestModule (ref), networkModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), var3 (write), analyticsModule (ref), platformInterfaceModule (ref), externalSettingsModule (ref), publicBindablesModule (ref), bindableEvent (ref), var2 (write), rodux (ref), reducerModule (ref), thunkModule (ref), windowStateModule (ref), promptStateModule (ref), bindableEvent_1 (ref), purchasePromptLiteModule (ref)
	local var4 = ABTestModule.new()
	local var5 = networkModule.new()
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var3 = var5
	end
	var2 = rodux.Store.new(reducerModule, {}, {
		thunkModule.middleware({
			[ABTestModule] = var4,
			[networkModule] = if fFlagPurchasePromptCartPricingEnabledModule then var3 else var5,
			[analyticsModule] = analyticsModule.new(),
			[platformInterfaceModule] = platformInterfaceModule.new(),
			[externalSettingsModule] = externalSettingsModule.new(),
			[publicBindablesModule] = publicBindablesModule.new({ windowStateChangedBindable = bindableEvent })
		})
	})
	var2.changed:connect(function(p1, p2)
		-- upvalues: bindableEvent (copy), windowStateModule (copy), promptStateModule (copy), bindableEvent_1 (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), purchasePromptLiteModule (copy)
		if p2.windowState ~= p1.windowState then
			bindableEvent:Fire({
				isShown = p1.windowState == windowStateModule.Shown,
				hasCompletedPurchase = p1.hasCompletedPurchase
			})
		end
		if p2.promptState ~= p1.promptState and p1.promptState == promptStateModule.None then
			bindableEvent_1:Fire()
		end
		if fFlagPurchasePromptCartPricingEnabledModule and not p2.hasCompletedPurchase and p1.hasCompletedPurchase then
			purchasePromptLiteModule.Events.firePurchaseCompleted()
		end
	end)
end

return {
	mountPurchasePrompt = function()
		-- upvalues: runService (ref), var1 (write), createStore (ref), purchasePromptElevateDisplayOrder (ref), roact (ref), purchasePromptAppModule (ref), var2 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var3 (write), coreGuiService (ref)
		if runService:IsStudio() and runService:IsEdit() or var1 then
			return nil
		end
		createStore()
		local t = { AutoLocalize = false, IgnoreGuiInset = true }
		
		if purchasePromptElevateDisplayOrder then
			t.DisplayOrder = 10
		end
		var1 = roact.mount(roact.createElement("ScreenGui", t, {
			roact.createElement(purchasePromptAppModule, {
				store = var2,
				network = if fFlagPurchasePromptCartPricingEnabledModule then var3 else nil
			})
		}), coreGuiService, "PurchasePromptApp")
		
		return var1
	end,
	initiateAvatarCreationFeePurchase = function(p1, p2, p3, p4)
		-- upvalues: var2 (write), initiateAvatarCreationFeePurchaseModule (ref)
		if not var2 then
			error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted")
		end
		var2:dispatch(initiateAvatarCreationFeePurchaseModule(p1, p2, p3, p4))
	end,
	initiatePurchaseForProductPayload = function(p1, p2)
		-- upvalues: var2 (write), fFlagEnablePurchasePayloadInExperienceShop (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), setProductPayloadModule (ref), fFlagPassShopPurchaseSurfaceToBuyModal (ref), setPurchaseAnalyticsMetadataModule (ref), dispatchPurchaseForProductPayloadModule (ref)
		if not var2 then
			warn("initiatePurchaseForProductPayload called before mountPurchasePrompt; ignoring.")
			
			return
		elseif fFlagEnablePurchasePayloadInExperienceShop or fFlagSkipBuyDelayForExperienceShopModule then
			var2:dispatch(setProductPayloadModule(p1))
		end
		if fFlagPassShopPurchaseSurfaceToBuyModal and p2 then
			var2:dispatch(setPurchaseAnalyticsMetadataModule({
				surface = p2.surface,
				productUniverseId = p2.productUniverseId
			}))
		end
		dispatchPurchaseForProductPayloadModule(function(p3)
			-- upvalues: var2 (copy)
			var2:dispatch(p3)
		end, p1, nil, false)
	end,
	windowStateChangedEvent = bindableEvent.Event,
	promptStateSetToNoneEvent = bindableEvent_1.Event,
	Utils = if fFlagAXMISWithBlackbird then {
		getBlackbirdUpsellBannerProductInfo = require(_script.Utils.getBlackbirdUpsellBannerProductInfo)
	} else {},
	PublishAssetAnalytics = publishAssetAnalyticsModule,
	UnifiedPurchasePromptContainer = function(p1)
		-- upvalues: createStore (ref), roact (ref), unifiedPurchasePromptModule (ref), var2 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var3 (write), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
		createStore()
		
		return roact.createElement(unifiedPurchasePromptModule, {
			store = var2,
			network = if fFlagPurchasePromptCartPricingEnabledModule then var3 else nil,
			productPayload = p1.productPayload,
			purchaseCallbacks = p1.purchaseCallbacks,
			postPurchaseActions = p1.postPurchaseActions,
			purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
			purchaseOptions = if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p1.purchaseOptions else nil,
			subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p1.subtitleView else nil
		})
	end,
	launchRobuxPackagePurchase = if fFlagEnableRobuxInExperienceShop then require(_script.launchRobuxPackagePurchase) else nil,
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"]
}