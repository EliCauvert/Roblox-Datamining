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
local fFlagEnableUnifiedProductPurchaseFlow = require(_script.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagPurchasePromptSubtitleForTimedOptions = require(_script.Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local purchasePromptElevateDisplayOrder = game:DefineFastFlag("PurchasePromptElevateDisplayOrder", false)
local windowStateModule = require(_script.Enums.WindowState)
local promptStateModule = require(_script.Enums.PromptState)
local publishAssetAnalyticsModule = require(_script.Utils.PublishAssetAnalytics)
local var26 = nil
local var27 = nil
local var28 = nil
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")

local function createStore() --[[ line: 61 ]]
	-- upvalues: ABTestModule (ref), networkModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), var28 (write), analyticsModule (ref), platformInterfaceModule (ref), externalSettingsModule (ref), publicBindablesModule (ref), bindableEvent (ref), var27 (write), rodux (ref), reducerModule (ref), thunkModule (ref), windowStateModule (ref), promptStateModule (ref), bindableEvent_1 (ref), purchasePromptLiteModule (ref)
	local var32 = ABTestModule.new()
	local var33 = networkModule.new()
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var28 = var33
	end
	var27 = rodux.Store.new(reducerModule, {}, {
		thunkModule.middleware({
			[ABTestModule] = var32,
			[networkModule] = if fFlagPurchasePromptCartPricingEnabledModule then var28 else var33,
			[analyticsModule] = analyticsModule.new(),
			[platformInterfaceModule] = platformInterfaceModule.new(),
			[externalSettingsModule] = externalSettingsModule.new(),
			[publicBindablesModule] = publicBindablesModule.new({ windowStateChangedBindable = bindableEvent })
		})
	})
	var27.changed:connect(function(p0, p1) --[[ line: 87 ]]
		-- upvalues: bindableEvent (copy), windowStateModule (copy), promptStateModule (copy), bindableEvent_1 (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), purchasePromptLiteModule (copy)
		if p1.windowState ~= p0.windowState then
			bindableEvent:Fire({
				isShown = p0.windowState == windowStateModule.Shown,
				hasCompletedPurchase = p0.hasCompletedPurchase
			})
		end
		if p1.promptState ~= p0.promptState and p0.promptState == promptStateModule.None then
			bindableEvent_1:Fire()
		end
		if fFlagPurchasePromptCartPricingEnabledModule and not p1.hasCompletedPurchase and p0.hasCompletedPurchase then
			purchasePromptLiteModule.Events.firePurchaseCompleted()
		end
	end)
end

return {
	mountPurchasePrompt = function() --[[ line: 117 ]]
		-- upvalues: runService (ref), var26 (write), createStore (ref), purchasePromptElevateDisplayOrder (ref), roact (ref), purchasePromptAppModule (ref), var27 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var28 (write), coreGuiService (ref)
		if runService:IsStudio() and runService:IsEdit() or var26 then
			return nil
		end
		createStore()
		local t = { AutoLocalize = false, IgnoreGuiInset = true }
		
		if purchasePromptElevateDisplayOrder then
			t.DisplayOrder = 10
		end
		var26 = roact.mount(roact.createElement("ScreenGui", t, {
			roact.createElement(purchasePromptAppModule, {
				store = var27,
				network = if fFlagPurchasePromptCartPricingEnabledModule then var28 else nil
			})
		}), coreGuiService, "PurchasePromptApp")
		
		return var26
	end,
	initiateAvatarCreationFeePurchase = function(p2, p3, p4, p5) --[[ line: 151 ]]
		-- upvalues: var27 (write), initiateAvatarCreationFeePurchaseModule (ref)
		if not var27 then
			error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted")
		end
		var27:dispatch(initiateAvatarCreationFeePurchaseModule(p2, p3, p4, p5))
	end,
	initiatePurchaseForProductPayload = function(p6, p7) --[[ line: 178 ]]
		-- upvalues: var27 (write), fFlagEnablePurchasePayloadInExperienceShop (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), setProductPayloadModule (ref), fFlagPassShopPurchaseSurfaceToBuyModal (ref), setPurchaseAnalyticsMetadataModule (ref), dispatchPurchaseForProductPayloadModule (ref)
		if not var27 then
			warn("initiatePurchaseForProductPayload called before mountPurchasePrompt; ignoring.")
			
			return
		elseif fFlagEnablePurchasePayloadInExperienceShop or fFlagSkipBuyDelayForExperienceShopModule then
			var27:dispatch(setProductPayloadModule(p6))
		end
		if fFlagPassShopPurchaseSurfaceToBuyModal and p7 then
			var27:dispatch(setPurchaseAnalyticsMetadataModule({
				surface = p7.surface,
				productUniverseId = p7.productUniverseId
			}))
		end
		dispatchPurchaseForProductPayloadModule(function(p8) --[[ line: 204 ]]
			-- upvalues: var27 (copy)
			var27:dispatch(p8)
		end, p6, nil, false)
	end,
	windowStateChangedEvent = bindableEvent.Event,
	promptStateSetToNoneEvent = bindableEvent_1.Event,
	Utils = if fFlagAXMISWithBlackbird then {
		getBlackbirdUpsellBannerProductInfo = require(_script.Utils.getBlackbirdUpsellBannerProductInfo)
	} else {},
	PublishAssetAnalytics = publishAssetAnalyticsModule,
	UnifiedPurchasePromptContainer = if fFlagEnableUnifiedProductPurchaseFlow then function(p9) --[[ line: 222 | named "UnifiedPurchasePromptContainer" ]]
		-- upvalues: createStore (ref), roact (ref), unifiedPurchasePromptModule (ref), var27 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var28 (write), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
		createStore()
		
		return roact.createElement(unifiedPurchasePromptModule, {
			store = var27,
			network = if fFlagPurchasePromptCartPricingEnabledModule then var28 else nil,
			productPayload = p9.productPayload,
			purchaseCallbacks = p9.purchaseCallbacks,
			postPurchaseActions = p9.postPurchaseActions,
			purchaseAnalyticsMetadata = p9.purchaseAnalyticsMetadata,
			purchaseOptions = if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p9.purchaseOptions else nil,
			subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p9.subtitleView else nil
		})
	end else nil,
	launchRobuxPackagePurchase = if fFlagEnableRobuxInExperienceShop then require(_script.launchRobuxPackagePurchase) else nil,
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"]
}