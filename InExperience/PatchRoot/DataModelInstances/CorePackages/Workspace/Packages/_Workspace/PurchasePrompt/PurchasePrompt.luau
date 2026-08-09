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
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(_script.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptCartPricingEnabledModule = require(_script.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local _ = require(_script.types)
local fFlagEnableUnifiedProductPurchaseFlow = require(_script.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagPurchasePromptSubtitleForTimedOptions = require(_script.Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local purchasePromptElevateDisplayOrder = game:DefineFastFlag("PurchasePromptElevateDisplayOrder", false)
local windowStateModule = require(_script.Enums.WindowState)
local promptStateModule = require(_script.Enums.PromptState)
local publishAssetAnalyticsModule = require(_script.Utils.PublishAssetAnalytics)
local var24 = nil
local var25 = nil
local var26 = nil
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")

local function createStore() --[[ line: 58 ]]
	-- upvalues: ABTestModule (ref), networkModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), var26 (write), analyticsModule (ref), platformInterfaceModule (ref), externalSettingsModule (ref), publicBindablesModule (ref), bindableEvent (ref), var25 (write), rodux (ref), reducerModule (ref), thunkModule (ref), windowStateModule (ref), promptStateModule (ref), bindableEvent_1 (ref), purchasePromptLiteModule (ref)
	local var30 = ABTestModule.new()
	local var31 = networkModule.new()
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var26 = var31
	end
	var25 = rodux.Store.new(reducerModule, {}, {
		thunkModule.middleware({
			[ABTestModule] = var30,
			[networkModule] = if fFlagPurchasePromptCartPricingEnabledModule then var26 else var31,
			[analyticsModule] = analyticsModule.new(),
			[platformInterfaceModule] = platformInterfaceModule.new(),
			[externalSettingsModule] = externalSettingsModule.new(),
			[publicBindablesModule] = publicBindablesModule.new({ windowStateChangedBindable = bindableEvent })
		})
	})
	var25.changed:connect(function(p0, p1) --[[ line: 84 ]]
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
	mountPurchasePrompt = function() --[[ line: 114 ]]
		-- upvalues: runService (ref), var24 (write), createStore (ref), purchasePromptElevateDisplayOrder (ref), roact (ref), purchasePromptAppModule (ref), var25 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var26 (write), coreGuiService (ref)
		if runService:IsStudio() and runService:IsEdit() or var24 then
			return nil
		end
		createStore()
		local t = { AutoLocalize = false, IgnoreGuiInset = true }
		
		if purchasePromptElevateDisplayOrder then
			t.DisplayOrder = 10
		end
		var24 = roact.mount(roact.createElement("ScreenGui", t, {
			roact.createElement(purchasePromptAppModule, {
				store = var25,
				network = if fFlagPurchasePromptCartPricingEnabledModule then var26 else nil
			})
		}), coreGuiService, "PurchasePromptApp")
		
		return var24
	end,
	initiateAvatarCreationFeePurchase = function(p2, p3, p4, p5) --[[ line: 148 ]]
		-- upvalues: var25 (write), initiateAvatarCreationFeePurchaseModule (ref)
		if not var25 then
			error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted")
		end
		var25:dispatch(initiateAvatarCreationFeePurchaseModule(p2, p3, p4, p5))
	end,
	initiatePurchaseForProductPayload = function(p6) --[[ line: 175 ]]
		-- upvalues: var25 (write), fFlagEnablePurchasePayloadInExperienceShop (ref), setProductPayloadModule (ref), dispatchPurchaseForProductPayloadModule (ref)
		if not var25 then
			warn("initiatePurchaseForProductPayload called before mountPurchasePrompt; ignoring.")
			
			return
		elseif fFlagEnablePurchasePayloadInExperienceShop then
			var25:dispatch(setProductPayloadModule(p6))
		end
		dispatchPurchaseForProductPayloadModule(function(p7) --[[ line: 191 ]]
			-- upvalues: var25 (copy)
			var25:dispatch(p7)
		end, p6, nil, false)
	end,
	windowStateChangedEvent = bindableEvent.Event,
	promptStateSetToNoneEvent = bindableEvent_1.Event,
	Utils = if fFlagAXMISWithBlackbird then {
		getBlackbirdUpsellBannerProductInfo = require(_script.Utils.getBlackbirdUpsellBannerProductInfo)
	} else {},
	PublishAssetAnalytics = publishAssetAnalyticsModule,
	UnifiedPurchasePromptContainer = if fFlagEnableUnifiedProductPurchaseFlow then function(p8) --[[ line: 208 | named "UnifiedPurchasePromptContainer" ]]
		-- upvalues: createStore (ref), roact (ref), unifiedPurchasePromptModule (ref), var25 (write), fFlagPurchasePromptCartPricingEnabledModule (ref), var26 (write), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
		createStore()
		
		return roact.createElement(unifiedPurchasePromptModule, {
			store = var25,
			network = if fFlagPurchasePromptCartPricingEnabledModule then var26 else nil,
			productPayload = p8.productPayload,
			purchaseCallbacks = p8.purchaseCallbacks,
			postPurchaseActions = p8.postPurchaseActions,
			purchaseAnalyticsMetadata = p8.purchaseAnalyticsMetadata,
			purchaseOptions = if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p8.purchaseOptions else nil,
			subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p8.subtitleView else nil
		})
	end else nil,
	launchRobuxPackagePurchase = if fFlagEnableRobuxInExperienceShop then require(_script.launchRobuxPackagePurchase) else nil,
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"]
}