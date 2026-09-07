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
local isErrorReasonContainsEconomicRestrictions = require(parent.IAPExperience).Utility.isErrorReasonContainsEconomicRestrictions
local getRobloxSubscriptionProducts = require(parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local selectOrderRequestModule = require(bulkPurchaseApp.Store.Selectors.selectOrderRequest)
local selectItemDataModule = require(bulkPurchaseApp.Store.Selectors.selectItemData)
local selectIsRefreshingModule = require(bulkPurchaseApp.Store.Selectors.selectIsRefreshing)
local refreshBulkPurchaseQuoteModule = require(bulkPurchaseApp.Store.Thunks.RefreshBulkPurchaseQuote)
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local bulkPurchaseSucceededModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local itemStatusToErrorCodeMapModule = require(bulkPurchaseApp.Enums.ItemStatusToErrorCodeMap)
local paymentPlatformEnumModule = require(bulkPurchaseApp.Enums.PaymentPlatformEnum)
local getPaymentPlatformModule = require(bulkPurchaseApp.Utils.getPaymentPlatform)
local getRobuxStoreUrlModule = require(bulkPurchaseApp.Utils.getRobuxStoreUrl)
local getGuiObjectIsObscuredModule = require(bulkPurchaseApp.Utils.getGuiObjectIsObscured)
local fFlagFixVP8143Module = require(bulkPurchaseApp.Flags.FFlagFixVP8143)
local fFlagBulkPurchaseRobloxPlusUpsellModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseRobloxPlusUpsell)
local getRobloxPlusUpsellBannerProductInfoModule = require(bulkPurchaseApp.Utils.getRobloxPlusUpsellBannerProductInfo)
local shouldShowBulkPurchaseRobloxPlusUpsellModule = require(bulkPurchaseApp.Utils.shouldShowBulkPurchaseRobloxPlusUpsell)
local startBulkPurchaseRobloxPlusUpsellModule = require(bulkPurchaseApp.Utils.startBulkPurchaseRobloxPlusUpsell)
local _ = require(bulkPurchaseApp.MarketplaceServiceTypes)
local getItemResultsFromResponseModule = require(script.Parent.Utils.getItemResultsFromResponse)
local getCommonItemStatusModule = require(script.Parent.Utils.getCommonItemStatus)
local handleEconomicRestrictionErrorModule = require(script.Parent.Utils.handleEconomicRestrictionError)
local selectBulkPurchaseRequestStateModule = require(script.Parent.Utils.selectBulkPurchaseRequestState)
local selectOptionsModule = require(script.Parent.Utils.selectOptions)
local fixBuyRobuxForAndroid = game:DefineFastFlag("FixBuyRobuxForAndroid", false)
local fixBulkPurchaseStarterGuiRename = game:DefineFastFlag("FixBulkPurchaseStarterGuiRename", false)
local _ = require(script.Parent.BulkPurchaseRequest)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectBulkPurchaseRequestStateModule (ref), selectPurchaseResultsModule (ref), selectOrderRequestModule (ref), selectOptionsModule (ref), selectItemDataModule (ref), selectIsRefreshingModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref), isErrorReasonContainsEconomicRestrictions (ref), handleEconomicRestrictionErrorModule (ref), getItemResultsFromResponseModule (ref), getCommonItemStatusModule (ref), bulkPurchaseSucceededModule (ref), bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), itemStatusToErrorCodeMapModule (ref), errorCodeEnumModule (ref), getPaymentPlatformModule (ref), paymentPlatformEnumModule (ref), fixBuyRobuxForAndroid (ref), httpService (ref), getRobuxStoreUrlModule (ref), browserService (ref), fFlagFixVP8143Module (ref), reactModule (ref), runService (ref), getGuiObjectIsObscuredModule (ref), fixBulkPurchaseStarterGuiRename (ref), starterGuiService (ref), fFlagBulkPurchaseRobloxPlusUpsellModule (ref), getRobloxSubscriptionProducts (ref), startBulkPurchaseRobloxPlusUpsellModule (ref), refreshBulkPurchaseQuoteModule (ref), marketplaceService (ref), getRobloxPlusUpsellBannerProductInfoModule (ref), shouldShowBulkPurchaseRobloxPlusUpsellModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectBulkPurchaseRequestStateModule)
	local var3 = useSelector(selectPurchaseResultsModule)
	local var4 = useSelector(selectOrderRequestModule)
	local var5 = useSelector(selectOptionsModule)
	local var6 = useSelector(selectItemDataModule)
	local var7 = useSelector(selectIsRefreshingModule)
	local totalCost = var2.totalCost
	local balance = var2.balance
	
	local var8 = function()
		-- upvalues: marketplaceService (copy), var3 (ref), var1 (ref), bulkPurchaseEndedModule (copy)
		marketplaceService:signalPromptBulkPurchaseFinished(2, var3)
		var1(bulkPurchaseEndedModule())
	end
	
	local var9 = function()
		-- upvalues: marketplaceService (copy), var4 (ref), var5 (ref), isErrorReasonContainsEconomicRestrictions (copy), handleEconomicRestrictionErrorModule (copy), var1 (ref), getItemResultsFromResponseModule (copy), var6 (ref), getCommonItemStatusModule (copy), bulkPurchaseSucceededModule (copy), bulkPurchasePromptStateEnumModule (copy), bulkPurchaseFailedModule (copy), itemStatusToErrorCodeMapModule (copy), errorCodeEnumModule (copy)
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), var4 (copy), var5 (copy)
			return marketplaceService:PerformBulkPurchase(var4, var5)
		end)
		
		if ok and status then
			if status.message and isErrorReasonContainsEconomicRestrictions(status.message) then
				handleEconomicRestrictionErrorModule(status.message, var1)
				
				return
			end
			local var10 = getItemResultsFromResponseModule(status, var6)
			local var11 = getCommonItemStatusModule(var10)
			
			if not var11 then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.PartialSuccess, var10))
				
				return
			elseif var11 == Enum.MarketplaceItemPurchaseStatus.Success then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.Success, var10))
				
				return
			end
			var1(bulkPurchaseFailedModule(itemStatusToErrorCodeMapModule[var11]))
			
			return
		elseif string.find(status, "403") then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		end
		var1(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
	
	local var10 = function()
		-- upvalues: getPaymentPlatformModule (copy), paymentPlatformEnumModule (copy), fixBuyRobuxForAndroid (copy), httpService (copy), getRobuxStoreUrlModule (copy), browserService (copy), var1 (ref), bulkPurchaseEndedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local var11 = getPaymentPlatformModule()
		
		if var11 ~= paymentPlatformEnumModule.Desktop and var11 ~= paymentPlatformEnumModule.Mobile then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.InsufficientRobux))
			
			return
		elseif fixBuyRobuxForAndroid then
			browserService:SendCommand(httpService:JSONEncode({ command = "open", url = getRobuxStoreUrlModule() }))
		else
			browserService:OpenBrowserWindow(getRobuxStoreUrlModule())
		end
		var1(bulkPurchaseEndedModule())
	end
	
	local var11 = nil
	local var12 = nil
	local _ = nil
	
	if fFlagFixVP8143Module then
		var11 = reactModule.useRef(nil)
		local var13, var14 = reactModule.useState(true)
		var12 = var13
		local var15 = var14
		reactModule.useEffect(function()
			-- upvalues: runService (copy), var11 (write), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var15 (write)
			local heartbeatConnection = runService.Heartbeat:Connect(function()
				-- upvalues: var11 (copy), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var15 (copy)
				if var11.current and typeof(var11.current) == "Instance" and var11.current:IsA("GuiObject") then
					var15(getGuiObjectIsObscuredModule(var11.current) or (if fixBulkPurchaseStarterGuiRename then starterGuiService:GetCore("DevConsoleVisible") else game.StarterGui:GetCore("DevConsoleVisible")))
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end, {})
	end
	local _ = nil
	local _ = nil
	local var16 = nil
	local var17 = nil
	
	if fFlagBulkPurchaseRobloxPlusUpsellModule then
		local var18, var19 = reactModule.useState(nil)
		local var20 = var18
		local var21 = var19
		reactModule.useEffect(function()
			-- upvalues: getRobloxSubscriptionProducts (copy), var21 (write)
			getRobloxSubscriptionProducts():andThen(function(p1)
				-- upvalues: var21 (copy)
				var21(p1)
			end):catch(function()
				-- upvalues: var21 (copy)
				var21({})
			end)
		end, {})
		
		var16 = function()
			-- upvalues: startBulkPurchaseRobloxPlusUpsellModule (copy), getRobloxSubscriptionProducts (copy), var21 (write), var4 (ref), var1 (ref), refreshBulkPurchaseQuoteModule (copy), marketplaceService (copy)
			startBulkPurchaseRobloxPlusUpsellModule({
				onPurchaseSucceeded = function()
					-- upvalues: getRobloxSubscriptionProducts (copy), var21 (copy), var4 (copy), var1 (copy), refreshBulkPurchaseQuoteModule (copy), marketplaceService (copy)
					getRobloxSubscriptionProducts():andThen(function(p1)
						-- upvalues: var21 (copy)
						var21(p1)
					end):catch(function()
						-- upvalues: var21 (copy)
						var21({})
					end)
					
					if var4 then
						var1(refreshBulkPurchaseQuoteModule(marketplaceService, var4.batchPurchaseAuthToken))
					end
				end
			})
		end
		
		local var22 = if var20 then getRobloxPlusUpsellBannerProductInfoModule(var20) else nil
		
		if var22 and shouldShowBulkPurchaseRobloxPlusUpsellModule(var2.items, var2.discountInformation, true) then
			var17 = var22
		end
	end
	return {
		currentBalance = var2.balance,
		items = var2.items,
		ownedItems = var2.ownedItems,
		unpurchasableItems = var2.unpurchasableItems,
		onClose = var8,
		onAccept = if balance < totalCost then var10 else var9,
		totalCost = var2.totalCost,
		isDisabled = if fFlagBulkPurchaseRobloxPlusUpsellModule and var7 then true elseif fFlagFixVP8143Module then var12 else #var2.items == 0,
		purchaseButtonRef = if fFlagFixVP8143Module then var11 else nil,
		discountInformation = var2.discountInformation,
		robloxPlusUpsellBannerProductInfo = if fFlagBulkPurchaseRobloxPlusUpsellModule then var17 else nil,
		onRobloxPlusUpsellActivated = if fFlagBulkPurchaseRobloxPlusUpsellModule then var16 else nil
	}
end