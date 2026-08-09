local marketplaceService = game:GetService("MarketplaceService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
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
local _ = require(script.Parent.BulkPurchaseRequest)

return function() --[[ line: 41 | named "useBulkPurchaseRequestProps" ]]
	-- upvalues: useDispatch (ref), useSelector (ref), selectBulkPurchaseRequestStateModule (ref), selectPurchaseResultsModule (ref), selectOrderRequestModule (ref), selectOptionsModule (ref), selectItemDataModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref), isErrorReasonContainsEconomicRestrictions (ref), handleEconomicRestrictionErrorModule (ref), getItemResultsFromResponseModule (ref), getCommonItemStatusModule (ref), bulkPurchaseSucceededModule (ref), bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), itemStatusToErrorCodeMapModule (ref), errorCodeEnumModule (ref), getPaymentPlatformModule (ref), paymentPlatformEnumModule (ref), fixBuyRobuxForAndroid (ref), httpService (ref), getRobuxStoreUrlModule (ref), browserService (ref), fFlagFixVP8143Module (ref), reactModule (ref), runService (ref), getGuiObjectIsObscuredModule (ref)
	local var26 = useDispatch()
	local var27 = useSelector(selectBulkPurchaseRequestStateModule)
	local var28 = useSelector(selectPurchaseResultsModule)
	local var29 = useSelector(selectOrderRequestModule)
	local var30 = useSelector(selectOptionsModule)
	local var31 = useSelector(selectItemDataModule)
	local totalCost = var27.totalCost
	local balance = var27.balance
	
	local var32 = function() --[[ line: 51 ]]
		-- upvalues: marketplaceService (copy), var28 (ref), var26 (ref), bulkPurchaseEndedModule (copy)
		marketplaceService:signalPromptBulkPurchaseFinished(2, var28)
		var26(bulkPurchaseEndedModule())
	end
	
	local var33 = function() --[[ line: 58 ]]
		-- upvalues: marketplaceService (copy), var29 (ref), var30 (ref), isErrorReasonContainsEconomicRestrictions (copy), handleEconomicRestrictionErrorModule (copy), var26 (ref), getItemResultsFromResponseModule (copy), var31 (ref), getCommonItemStatusModule (copy), bulkPurchaseSucceededModule (copy), bulkPurchasePromptStateEnumModule (copy), bulkPurchaseFailedModule (copy), itemStatusToErrorCodeMapModule (copy), errorCodeEnumModule (copy)
		local ok, status = pcall(function() --[[ line: 59 ]]
			-- upvalues: marketplaceService (copy), var29 (copy), var30 (copy)
			return marketplaceService:PerformBulkPurchase(var29, var30)
		end)
		
		if ok and status then
			if status.message and isErrorReasonContainsEconomicRestrictions(status.message) then
				handleEconomicRestrictionErrorModule(status.message, var26)
				
				return
			end
			local var40 = getItemResultsFromResponseModule(status, var31)
			local var41 = getCommonItemStatusModule(var40)
			
			if not var41 then
				var26(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.PartialSuccess, var40))
				
				return
			elseif var41 == Enum.MarketplaceItemPurchaseStatus.Success then
				var26(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.Success, var40))
				
				return
			end
			var26(bulkPurchaseFailedModule(itemStatusToErrorCodeMapModule[var41]))
			
			return
		elseif string.find(status, "403") then
			var26(bulkPurchaseFailedModule(errorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		end
		var26(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
	
	local var34 = function() --[[ line: 96 ]]
		-- upvalues: getPaymentPlatformModule (copy), paymentPlatformEnumModule (copy), fixBuyRobuxForAndroid (copy), httpService (copy), getRobuxStoreUrlModule (copy), browserService (copy), var26 (ref), bulkPurchaseEndedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local var42 = getPaymentPlatformModule()
		
		if var42 ~= paymentPlatformEnumModule.Desktop and var42 ~= paymentPlatformEnumModule.Mobile then
			var26(bulkPurchaseFailedModule(errorCodeEnumModule.InsufficientRobux))
			
			return
		elseif fixBuyRobuxForAndroid then
			browserService:SendCommand(httpService:JSONEncode({ command = "open", url = getRobuxStoreUrlModule() }))
		else
			browserService:OpenBrowserWindow(getRobuxStoreUrlModule())
		end
		var26(bulkPurchaseEndedModule())
	end
	
	local var35 = nil
	local var36 = nil
	local _ = nil
	
	if fFlagFixVP8143Module then
		var35 = reactModule.useRef(nil)
		local var37, var38 = reactModule.useState(true)
		var36 = var37
		local var39 = var38
		reactModule.useEffect(function() --[[ line: 127 ]]
			-- upvalues: runService (copy), var35 (write), getGuiObjectIsObscuredModule (copy), var39 (write)
			local heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 128 ]]
				-- upvalues: var35 (copy), getGuiObjectIsObscuredModule (copy), var39 (copy)
				if var35.current and typeof(var35.current) == "Instance" and var35.current:IsA("GuiObject") then
					var39(getGuiObjectIsObscuredModule(var35.current) or game.StarterGui:GetCore("DevConsoleVisible"))
				end
			end)
			
			return function() --[[ line: 139 ]]
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end, {})
	end
	return {
		currentBalance = var27.balance,
		items = var27.items,
		ownedItems = var27.ownedItems,
		unpurchasableItems = var27.unpurchasableItems,
		onClose = var32,
		onAccept = if balance < totalCost then var34 else var33,
		totalCost = var27.totalCost,
		isDisabled = if fFlagFixVP8143Module then var36 else #var27.items == 0,
		purchaseButtonRef = if fFlagFixVP8143Module then var35 else nil,
		discountInformation = var27.discountInformation
	}
end