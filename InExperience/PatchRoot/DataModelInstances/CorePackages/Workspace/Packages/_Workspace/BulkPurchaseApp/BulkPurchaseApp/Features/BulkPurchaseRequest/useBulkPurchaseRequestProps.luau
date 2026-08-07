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

return function() --[[ line: 43 | named "useBulkPurchaseRequestProps" ]]
	-- upvalues: useDispatch (ref), useSelector (ref), selectBulkPurchaseRequestStateModule (ref), selectPurchaseResultsModule (ref), selectOrderRequestModule (ref), selectOptionsModule (ref), selectItemDataModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref), isErrorReasonContainsEconomicRestrictions (ref), handleEconomicRestrictionErrorModule (ref), getItemResultsFromResponseModule (ref), getCommonItemStatusModule (ref), bulkPurchaseSucceededModule (ref), bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), itemStatusToErrorCodeMapModule (ref), errorCodeEnumModule (ref), getPaymentPlatformModule (ref), paymentPlatformEnumModule (ref), fixBuyRobuxForAndroid (ref), httpService (ref), getRobuxStoreUrlModule (ref), browserService (ref), fFlagFixVP8143Module (ref), reactModule (ref), runService (ref), getGuiObjectIsObscuredModule (ref), fixBulkPurchaseStarterGuiRename (ref), starterGuiService (ref)
	local var28 = useDispatch()
	local var29 = useSelector(selectBulkPurchaseRequestStateModule)
	local var30 = useSelector(selectPurchaseResultsModule)
	local var31 = useSelector(selectOrderRequestModule)
	local var32 = useSelector(selectOptionsModule)
	local var33 = useSelector(selectItemDataModule)
	local totalCost = var29.totalCost
	local balance = var29.balance
	
	local var34 = function() --[[ line: 53 ]]
		-- upvalues: marketplaceService (copy), var30 (ref), var28 (ref), bulkPurchaseEndedModule (copy)
		marketplaceService:signalPromptBulkPurchaseFinished(2, var30)
		var28(bulkPurchaseEndedModule())
	end
	
	local var35 = function() --[[ line: 60 ]]
		-- upvalues: marketplaceService (copy), var31 (ref), var32 (ref), isErrorReasonContainsEconomicRestrictions (copy), handleEconomicRestrictionErrorModule (copy), var28 (ref), getItemResultsFromResponseModule (copy), var33 (ref), getCommonItemStatusModule (copy), bulkPurchaseSucceededModule (copy), bulkPurchasePromptStateEnumModule (copy), bulkPurchaseFailedModule (copy), itemStatusToErrorCodeMapModule (copy), errorCodeEnumModule (copy)
		local ok, status = pcall(function() --[[ line: 61 ]]
			-- upvalues: marketplaceService (copy), var31 (copy), var32 (copy)
			return marketplaceService:PerformBulkPurchase(var31, var32)
		end)
		
		if ok and status then
			if status.message and isErrorReasonContainsEconomicRestrictions(status.message) then
				handleEconomicRestrictionErrorModule(status.message, var28)
				
				return
			end
			local var42 = getItemResultsFromResponseModule(status, var33)
			local var43 = getCommonItemStatusModule(var42)
			
			if not var43 then
				var28(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.PartialSuccess, var42))
				
				return
			elseif var43 == Enum.MarketplaceItemPurchaseStatus.Success then
				var28(bulkPurchaseSucceededModule(bulkPurchasePromptStateEnumModule.Success, var42))
				
				return
			end
			var28(bulkPurchaseFailedModule(itemStatusToErrorCodeMapModule[var43]))
			
			return
		elseif string.find(status, "403") then
			var28(bulkPurchaseFailedModule(errorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		end
		var28(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
	
	local var36 = function() --[[ line: 98 ]]
		-- upvalues: getPaymentPlatformModule (copy), paymentPlatformEnumModule (copy), fixBuyRobuxForAndroid (copy), httpService (copy), getRobuxStoreUrlModule (copy), browserService (copy), var28 (ref), bulkPurchaseEndedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local var44 = getPaymentPlatformModule()
		
		if var44 ~= paymentPlatformEnumModule.Desktop and var44 ~= paymentPlatformEnumModule.Mobile then
			var28(bulkPurchaseFailedModule(errorCodeEnumModule.InsufficientRobux))
			
			return
		elseif fixBuyRobuxForAndroid then
			browserService:SendCommand(httpService:JSONEncode({ command = "open", url = getRobuxStoreUrlModule() }))
		else
			browserService:OpenBrowserWindow(getRobuxStoreUrlModule())
		end
		var28(bulkPurchaseEndedModule())
	end
	
	local var37 = nil
	local var38 = nil
	local _ = nil
	
	if fFlagFixVP8143Module then
		var37 = reactModule.useRef(nil)
		local var39, var40 = reactModule.useState(true)
		var38 = var39
		local var41 = var40
		reactModule.useEffect(function() --[[ line: 129 ]]
			-- upvalues: runService (copy), var37 (write), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var41 (write)
			local heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 130 ]]
				-- upvalues: var37 (copy), getGuiObjectIsObscuredModule (copy), fixBulkPurchaseStarterGuiRename (copy), starterGuiService (copy), var41 (copy)
				if var37.current and typeof(var37.current) == "Instance" and var37.current:IsA("GuiObject") then
					var41(getGuiObjectIsObscuredModule(var37.current) or (if fixBulkPurchaseStarterGuiRename then starterGuiService:GetCore("DevConsoleVisible") else game.StarterGui:GetCore("DevConsoleVisible")))
				end
			end)
			
			return function() --[[ line: 143 ]]
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end, {})
	end
	return {
		currentBalance = var29.balance,
		items = var29.items,
		ownedItems = var29.ownedItems,
		unpurchasableItems = var29.unpurchasableItems,
		onClose = var34,
		onAccept = if balance < totalCost then var36 else var35,
		totalCost = var29.totalCost,
		isDisabled = if fFlagFixVP8143Module then var38 else #var29.items == 0,
		purchaseButtonRef = if fFlagFixVP8143Module then var37 else nil,
		discountInformation = var29.discountInformation
	}
end