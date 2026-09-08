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
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local selectOrderRequestModule = require(bulkPurchaseApp.Store.Selectors.selectOrderRequest)
local selectItemDataModule = require(bulkPurchaseApp.Store.Selectors.selectItemData)
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
local getItemResultsFromResponseModule = require(script.Parent.Utils.getItemResultsFromResponse)
local getCommonItemStatusModule = require(script.Parent.Utils.getCommonItemStatus)
local handleEconomicRestrictionErrorModule = require(script.Parent.Utils.handleEconomicRestrictionError)
local selectBulkPurchaseRequestStateModule = require(script.Parent.Utils.selectBulkPurchaseRequestState)
local selectOptionsModule = require(script.Parent.Utils.selectOptions)
local fixBuyRobuxForAndroid = game:DefineFastFlag("FixBuyRobuxForAndroid", false)
local fixBulkPurchaseStarterGuiRename = game:DefineFastFlag("FixBulkPurchaseStarterGuiRename", false)
local _ = require(script.Parent.BulkPurchaseRequest)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectBulkPurchaseRequestStateModule (ref), selectPurchaseResultsModule (ref), selectOrderRequestModule (ref), selectOptionsModule (ref), selectItemDataModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref), isErrorReasonContainsEconomicRestrictions (ref), handleEconomicRestrictionErrorModule (ref), getItemResultsFromResponseModule (ref), getCommonItemStatusModule (ref), bulkPurchaseSucceededModule (ref), bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), itemStatusToErrorCodeMapModule (ref), errorCodeEnumModule (ref), getPaymentPlatformModule (ref), paymentPlatformEnumModule (ref), fixBuyRobuxForAndroid (ref), httpService (ref), getRobuxStoreUrlModule (ref), browserService (ref), fFlagFixVP8143Module (ref), reactModule (ref), runService (ref), getGuiObjectIsObscuredModule (ref), fixBulkPurchaseStarterGuiRename (ref), starterGuiService (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectBulkPurchaseRequestStateModule)
	local var3 = useSelector(selectPurchaseResultsModule)
	local var4 = useSelector(selectOrderRequestModule)
	local var5 = useSelector(selectOptionsModule)
	local var6 = useSelector(selectItemDataModule)
	local totalCost = var2.totalCost
	local balance = var2.balance
	
	local var7 = function()
		-- upvalues: marketplaceService (copy), var3 (ref), var1 (ref), bulkPurchaseEndedModule (copy)
		marketplaceService:signalPromptBulkPurchaseFinished(2, var3)
		var1(bulkPurchaseEndedModule())
	end
	
	local var8 = function()
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
			local var9 = getItemResultsFromResponseModule(status, var6)
			local var10 = getCommonItemStatusModule(var9)
			
			if not var10 then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.PartialSuccess, var9))
				
				return
			elseif var10 == Enum.MarketplaceItemPurchaseStatus.Success then
				var1(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.Success, var9))
				
				return
			end
			var1(bulkPurchaseFailedModule(itemStatusToErrorCodeMapModule[var10]))
			
			return
		elseif string.find(status, "403") then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		end
		var1(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
	
	local var9 = function()
		-- upvalues: getPaymentPlatformModule (copy), paymentPlatformEnumModule (copy), fixBuyRobuxForAndroid (copy), httpService (copy), getRobuxStoreUrlModule (copy), browserService (copy), var1 (ref), bulkPurchaseEndedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local var10 = getPaymentPlatformModule()
		
		if var10 ~= paymentPlatformEnumModule.Desktop and var10 ~= paymentPlatformEnumModule.Mobile then
			var1(bulkPurchaseFailedModule(errorCodeEnumModule.InsufficientRobux))
			
			return
		elseif fixBuyRobuxForAndroid then
			browserService:SendCommand(httpService:JSONEncode({ command = "open", url = getRobuxStoreUrlModule() }))
		else
			browserService:OpenBrowserWindow(getRobuxStoreUrlModule())
		end
		var1(bulkPurchaseEndedModule())
	end
	
	local var10 = nil
	local var11 = nil
	local _ = nil
	
	if fFlagFixVP8143Module then
		var10 = reactModule.useRef(nil)
		local var12, var13 = reactModule.useState(true)
		var11 = var12
		local var14 = var13
		reactModule.useEffect(function()
			-- upvalues: runService (copy), var10 (write), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var14 (write)
			local heartbeatConnection = runService.Heartbeat:Connect(function()
				-- upvalues: var10 (copy), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var14 (copy)
				if var10.current and typeof(var10.current) == "Instance" and var10.current:IsA("GuiObject") then
					var14(getGuiObjectIsObscuredModule(var10.current) or (if fixBulkPurchaseStarterGuiRename then starterGuiService:GetCore("DevConsoleVisible") else game.StarterGui:GetCore("DevConsoleVisible")))
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end, {})
	end
	return {
		currentBalance = var2.balance,
		items = var2.items,
		ownedItems = var2.ownedItems,
		unpurchasableItems = var2.unpurchasableItems,
		onClose = var7,
		onAccept = if balance < totalCost then var9 else var8,
		totalCost = var2.totalCost,
		isDisabled = if fFlagFixVP8143Module then var11 else #var2.items == 0,
		purchaseButtonRef = if fFlagFixVP8143Module then var10 else nil,
		discountInformation = var2.discountInformation
	}
end