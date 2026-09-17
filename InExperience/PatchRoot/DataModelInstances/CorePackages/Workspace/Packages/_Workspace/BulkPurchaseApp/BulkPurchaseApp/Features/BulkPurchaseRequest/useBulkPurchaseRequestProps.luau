local marketplaceService = game:GetService("MarketplaceService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local isErrorReasonContainsEconomicRestrictions = require(parent.IAPExperience).Utility.isErrorReasonContainsEconomicRestrictions
local mutedError = require(parent.Loggers).mutedError
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local getRobloxSubscriptionProducts = robloxSubscriptionPurchaseAppModule.Network.getRobloxSubscriptionProducts
local robloxSubscriptionSignals = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals
local robloxSubscriptionFlowCompleteReason = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local purchasePromptModule = require(parent.PurchasePrompt)
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local selectOrderRequestModule = require(bulkPurchaseApp.Store.Selectors.selectOrderRequest)
local selectItemDataModule = require(bulkPurchaseApp.Store.Selectors.selectItemData)
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local bulkPurchaseDisablePurchaseModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseDisablePurchase)
local bulkPurchaseSucceededModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local itemStatusToErrorCodeMapModule = require(bulkPurchaseApp.Enums.ItemStatusToErrorCodeMap)
local paymentPlatformEnumModule = require(bulkPurchaseApp.Enums.PaymentPlatformEnum)
local getPaymentPlatformModule = require(bulkPurchaseApp.Utils.getPaymentPlatform)
local getRobuxStoreUrlModule = require(bulkPurchaseApp.Utils.getRobuxStoreUrl)
local getGuiObjectIsObscuredModule = require(bulkPurchaseApp.Utils.getGuiObjectIsObscured)
local fFlagFixVP8143Module = require(bulkPurchaseApp.Flags.FFlagFixVP8143)
local getItemResultsFromResponseModule = require(script.Parent.Utils.getItemResultsFromResponse)
local getCommonItemStatusModule = require(script.Parent.Utils.getCommonItemStatus)
local handleEconomicRestrictionErrorModule = require(script.Parent.Utils.handleEconomicRestrictionError)
local selectBulkPurchaseRequestStateModule = require(script.Parent.Utils.selectBulkPurchaseRequestState)
local selectOptionsModule = require(script.Parent.Utils.selectOptions)
local fixBuyRobuxForAndroid = game:DefineFastFlag("FixBuyRobuxForAndroid", false)
local fixBulkPurchaseStarterGuiRename = game:DefineFastFlag("FixBulkPurchaseStarterGuiRename", false)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local _ = require(script.Parent.BulkPurchaseRequest)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectBulkPurchaseRequestStateModule (ref), selectPurchaseResultsModule (ref), selectOrderRequestModule (ref), selectOptionsModule (ref), selectItemDataModule (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref), reactModule (ref), robloxSubscriptionSignals (ref), signalsReactModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref), bulkPurchaseDisablePurchaseModule (ref), isErrorReasonContainsEconomicRestrictions (ref), handleEconomicRestrictionErrorModule (ref), getItemResultsFromResponseModule (ref), getCommonItemStatusModule (ref), bulkPurchaseSucceededModule (ref), bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), itemStatusToErrorCodeMapModule (ref), errorCodeEnumModule (ref), getPaymentPlatformModule (ref), paymentPlatformEnumModule (ref), fixBuyRobuxForAndroid (ref), httpService (ref), getRobuxStoreUrlModule (ref), browserService (ref), useAppPolicy (ref), getRobloxSubscriptionProducts (ref), mutedError (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), surfaceName (ref), surfaceContext (ref), purchasePromptModule (ref), fFlagFixVP8143Module (ref), runService (ref), getGuiObjectIsObscuredModule (ref), fixBulkPurchaseStarterGuiRename (ref), starterGuiService (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectBulkPurchaseRequestStateModule)
	local var3 = useSelector(selectPurchaseResultsModule)
	local var4 = useSelector(selectOrderRequestModule)
	local var5 = useSelector(selectOptionsModule)
	local var6 = useSelector(selectItemDataModule)
	local totalCost = var2.totalCost
	local balance = var2.balance
	local var7 = nil
	
	if fFlagAXAddPlusUpsellToBulkPurchaseModule then
		var7 = var4 and var4.batchPurchaseAuthToken
	end
	local var8 = nil
	local var9 = nil
	
	if fFlagAXAddPlusUpsellToBulkPurchaseModule then
		local var10, var11 = reactModule.useState({})
		var8 = var10
		var9 = var11
	end
	local var12 = if fFlagAXAddPlusUpsellToBulkPurchaseModule then signalsReactModule.useSignalState(robloxSubscriptionSignals.get().getHasRobloxSubscription) else nil
	
	local var13 = function()
		-- upvalues: marketplaceService (copy), var3 (ref), var1 (ref), bulkPurchaseEndedModule (copy)
		marketplaceService:signalPromptBulkPurchaseFinished(2, var3)
		var1(bulkPurchaseEndedModule())
	end
	
	local var14 = function()
		-- upvalues: fFlagAXAddPlusUpsellToBulkPurchaseModule (copy), var1 (ref), bulkPurchaseDisablePurchaseModule (copy), marketplaceService (copy), var4 (ref), var5 (ref), isErrorReasonContainsEconomicRestrictions (copy), handleEconomicRestrictionErrorModule (copy), getItemResultsFromResponseModule (copy), var6 (ref), getCommonItemStatusModule (copy), bulkPurchaseSucceededModule (copy), bulkPurchasePromptStateEnumModule (copy), bulkPurchaseFailedModule (copy), itemStatusToErrorCodeMapModule (copy), errorCodeEnumModule (copy)
		if fFlagAXAddPlusUpsellToBulkPurchaseModule then
			var1(bulkPurchaseDisablePurchaseModule())
		end
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), var4 (copy), var5 (copy)
			return marketplaceService:PerformBulkPurchase(var4, var5)
		end)
		
		if ok and status then
			if status.message and isErrorReasonContainsEconomicRestrictions(status.message) then
				handleEconomicRestrictionErrorModule(status.message, var1)
				
				return
			end
			local var15 = getItemResultsFromResponseModule(status, var6)
			local var16 = getCommonItemStatusModule(var15)
			
			if not var16 then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.PartialSuccess, var15))
				
				return
			elseif var16 == Enum.MarketplaceItemPurchaseStatus.Success then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.Success, var15))
				
				return
			end
			var1(bulkPurchaseFailedModule(itemStatusToErrorCodeMapModule[var16]))
			
			return
		elseif string.find(status, "403") then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		end
		var1(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
	
	local var15 = function()
		-- upvalues: getPaymentPlatformModule (copy), paymentPlatformEnumModule (copy), fixBuyRobuxForAndroid (copy), httpService (copy), getRobuxStoreUrlModule (copy), browserService (copy), var1 (ref), bulkPurchaseEndedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local var16 = getPaymentPlatformModule()
		
		if var16 ~= paymentPlatformEnumModule.Desktop and var16 ~= paymentPlatformEnumModule.Mobile then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.InsufficientRobux))
			
			return
		elseif fixBuyRobuxForAndroid then
			browserService:SendCommand(httpService:JSONEncode({ command = "open", url = getRobuxStoreUrlModule() }))
		else
			browserService:OpenBrowserWindow(getRobuxStoreUrlModule())
		end
		var1(bulkPurchaseEndedModule())
	end
	
	local var16 = nil
	local blackbirdUpsellBannerProductInfo = nil
	local var17 = nil
	
	if fFlagAXAddPlusUpsellToBulkPurchaseModule then
		local var18 = useAppPolicy(function(p1)
			return p1.getDisableBlackbirdEntrypoints()
		end)
		reactModule.useEffect(function()
			-- upvalues: getRobloxSubscriptionProducts (copy), var9 (write), mutedError (copy)
			getRobloxSubscriptionProducts():andThen(function(p1)
				-- upvalues: var9 (copy)
				var9(p1)
			end):catch(function(p1)
				-- upvalues: mutedError (copy)
				mutedError("BulkPurchasePrompt", "Failed to fetch Roblox subscription products: " .. tostring(p1))
			end)
		end, {})
		var16 = reactModule.useMemo(function()
			-- upvalues: var12 (write), var18 (ref), var2 (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy)
			if var12 then
				return false
			elseif var18 then
				return false
			end
			for i, v in var2.items do
				if fIntBlackbirdUpsellMinPriceForDiscountInclusive <= v.cost and v.cost <= fIntBlackbirdUpsellMaxPriceForDiscountInclusive then
					return true
				end
			end
			return false
		end, { var18, var12, var2.items })
		var17 = reactModule.useCallback(function()
			-- upvalues: robloxSubscriptionPurchaseAppModule (copy), robloxSubscriptionFlowCompleteReason (copy), var7 (write), var1 (ref), bulkPurchaseDisablePurchaseModule (copy), marketplaceService (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy), surfaceName (copy), surfaceContext (copy)
			robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = false }, {
				onFlowComplete = function(p1)
					-- upvalues: robloxSubscriptionFlowCompleteReason (copy), var7 (copy), var1 (copy), bulkPurchaseDisablePurchaseModule (copy), marketplaceService (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
					if p1 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded and var7 then
						var1(bulkPurchaseDisablePurchaseModule())
						
						if not pcall(function()
							-- upvalues: marketplaceService (copy), var7 (copy)
							marketplaceService:RefreshBulkPurchase(var7)
						end) then
							var1(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
						end
					end
				end
			}, nil, surfaceName.BulkPurchasePrompt, surfaceContext.InGame, nil, nil)
		end, { var1, var7 })
		blackbirdUpsellBannerProductInfo = purchasePromptModule.Utils.getBlackbirdUpsellBannerProductInfo(var8)
	end
	local var19 = nil
	local var20 = nil
	local _ = nil
	
	if fFlagFixVP8143Module then
		var19 = reactModule.useRef(nil)
		local var21, var22 = reactModule.useState(true)
		var20 = var21
		local var23 = var22
		reactModule.useEffect(function()
			-- upvalues: runService (copy), var19 (write), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var23 (write)
			local heartbeatConnection = runService.Heartbeat:Connect(function()
				-- upvalues: var19 (copy), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var23 (copy)
				if var19.current and typeof(var19.current) == "Instance" and var19.current:IsA("GuiObject") then
					var23(getGuiObjectIsObscuredModule(var19.current) or (if fixBulkPurchaseStarterGuiRename then starterGuiService:GetCore("DevConsoleVisible") else game.StarterGui:GetCore("DevConsoleVisible")))
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end, {})
	end
	local var24
	local t = {
		currentBalance = var2.balance,
		items = var2.items,
		ownedItems = var2.ownedItems,
		unpurchasableItems = var2.unpurchasableItems,
		onClose = var13,
		onAccept = if balance < totalCost then var15 else var14,
		totalCost = var2.totalCost
	}
	
	if fFlagFixVP8143Module then
		var24 = var20
		
		if not var24 then
			var24 = if #var2.items ~= 0 then fFlagAXAddPlusUpsellToBulkPurchaseModule and var2.disablePurchase == true else true
		end
		t.isDisabled = var24
		t.purchaseButtonRef = if fFlagFixVP8143Module then var19 else nil
		t.discountInformation = var2.discountInformation
		t.shouldShowBlackbirdUpsellBanner = if fFlagAXAddPlusUpsellToBulkPurchaseModule then var16 else nil
		t.blackbirdUpsellBannerProductInfo = if fFlagAXAddPlusUpsellToBulkPurchaseModule then blackbirdUpsellBannerProductInfo else nil
		t.onBlackbirdUpsellActivated = if fFlagAXAddPlusUpsellToBulkPurchaseModule then var17 else nil
		
		return t
	end
end