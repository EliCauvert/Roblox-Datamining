local MarketplaceService = game:GetService("MarketplaceService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local IsErrorReasonContainsEconomicRestrictionsFunction = require(Parent.IAPExperience).Utility.isErrorReasonContainsEconomicRestrictions
local SelectPurchaseResultsModule = require(BulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local SelectOrderRequestModule = require(BulkPurchaseApp.Store.Selectors.selectOrderRequest)
local SelectItemDataModule = require(BulkPurchaseApp.Store.Selectors.selectItemData)
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local BulkPurchaseSucceededModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local ItemStatusToErrorCodeMapModule = require(BulkPurchaseApp.Enums.ItemStatusToErrorCodeMap)
local PaymentPlatformEnumModule = require(BulkPurchaseApp.Enums.PaymentPlatformEnum)
local GetPaymentPlatformModule = require(BulkPurchaseApp.Utils.getPaymentPlatform)
local GetRobuxStoreUrlModule = require(BulkPurchaseApp.Utils.getRobuxStoreUrl)
local GetGuiObjectIsObscuredModule = require(BulkPurchaseApp.Utils.getGuiObjectIsObscured)
local FFlagFixVP8143Module = require(BulkPurchaseApp.Flags.FFlagFixVP8143)
local GetItemResultsFromResponseModule = require(script.Parent.Utils.getItemResultsFromResponse)
local GetCommonItemStatusModule = require(script.Parent.Utils.getCommonItemStatus)
local HandleEconomicRestrictionErrorModule = require(script.Parent.Utils.handleEconomicRestrictionError)
local SelectBulkPurchaseRequestStateModule = require(script.Parent.Utils.selectBulkPurchaseRequestState)
local SelectOptionsModule = require(script.Parent.Utils.selectOptions)
local FixBuyRobuxForAndroid = game:DefineFastFlag("FixBuyRobuxForAndroid", false)
local _ = require(script.Parent.BulkPurchaseRequest)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectBulkPurchaseRequestStateModule (copy), SelectPurchaseResultsModule (copy), SelectOrderRequestModule (copy), SelectOptionsModule (copy), SelectItemDataModule (copy), MarketplaceService (copy), BulkPurchaseEndedModule (copy), IsErrorReasonContainsEconomicRestrictionsFunction (copy), HandleEconomicRestrictionErrorModule (copy), GetItemResultsFromResponseModule (copy), GetCommonItemStatusModule (copy), BulkPurchaseSucceededModule (copy), BulkPurchasePromptStateEnumModule (copy), BulkPurchaseFailedModule (copy), ItemStatusToErrorCodeMapModule (copy), ErrorCodeEnumModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformEnumModule (copy), FixBuyRobuxForAndroid (copy), HttpService (copy), GetRobuxStoreUrlModule (copy), BrowserService (copy), FFlagFixVP8143Module (copy), ReactModule (copy), RunService (copy), GetGuiObjectIsObscuredModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectBulkPurchaseRequestStateModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectPurchaseResultsModule)
	local UseSelectorResult2 = UseSelectorFunction(SelectOrderRequestModule)
	local UseSelectorResult3 = UseSelectorFunction(SelectOptionsModule)
	local UseSelectorResult4 = UseSelectorFunction(SelectItemDataModule)
	local TotalCost = UseSelectorResult.totalCost
	local Balance = UseSelectorResult.balance
	
	local function OnClose()
		-- upvalues: MarketplaceService (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), BulkPurchaseEndedModule (upval)
		MarketplaceService:signalPromptBulkPurchaseFinished(2, UseSelectorResult1)
		UseDispatchResult(BulkPurchaseEndedModule())
	end
	
	local function v37()
		-- upvalues: MarketplaceService (upval), UseSelectorResult2 (copy), UseSelectorResult3 (copy), IsErrorReasonContainsEconomicRestrictionsFunction (upval), HandleEconomicRestrictionErrorModule (upval), UseDispatchResult (copy), GetItemResultsFromResponseModule (upval), UseSelectorResult4 (copy), GetCommonItemStatusModule (upval), BulkPurchaseSucceededModule (upval), BulkPurchasePromptStateEnumModule (upval), BulkPurchaseFailedModule (upval), ItemStatusToErrorCodeMapModule (upval), ErrorCodeEnumModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (upval), UseSelectorResult2 (upval), UseSelectorResult3 (upval)
			return MarketplaceService:PerformBulkPurchase(UseSelectorResult2, UseSelectorResult3)
		end)
		
		if Success and Result then
			if Result.message and IsErrorReasonContainsEconomicRestrictionsFunction(Result.message) then
				HandleEconomicRestrictionErrorModule(Result.message, UseDispatchResult)
				
				return
			end
			local ItemResultsFromResponseModule = GetItemResultsFromResponseModule(Result, UseSelectorResult4)
			local CommonItemStatusModule = GetCommonItemStatusModule(ItemResultsFromResponseModule)
			
			if not CommonItemStatusModule then
				UseDispatchResult(BulkPurchaseSucceededModule(BulkPurchasePromptStateEnumModule.PartialSuccess, ItemResultsFromResponseModule))
				
				return
			end
			if CommonItemStatusModule == Enum.MarketplaceItemPurchaseStatus.Success then
				UseDispatchResult(BulkPurchaseSucceededModule(BulkPurchasePromptStateEnumModule.Success, ItemResultsFromResponseModule))
				
				return
			else
				UseDispatchResult(BulkPurchaseFailedModule(ItemStatusToErrorCodeMapModule[CommonItemStatusModule]))
				
				return
			end
		elseif string.find(Result, "403") then
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		else
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.Generic))
		end
	end
	
	local function v38()
		-- upvalues: GetPaymentPlatformModule (upval), PaymentPlatformEnumModule (upval), FixBuyRobuxForAndroid (upval), HttpService (upval), GetRobuxStoreUrlModule (upval), BrowserService (upval), UseDispatchResult (copy), BulkPurchaseEndedModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
		local PaymentPlatformModule = GetPaymentPlatformModule()
		
		if PaymentPlatformModule ~= PaymentPlatformEnumModule.Desktop and PaymentPlatformModule ~= PaymentPlatformEnumModule.Mobile then
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.InsufficientRobux))
			
			return
		end
		if FixBuyRobuxForAndroid then
			BrowserService:SendCommand((HttpService:JSONEncode({ command = "open", url = GetRobuxStoreUrlModule() })))
		else
			BrowserService:OpenBrowserWindow(GetRobuxStoreUrlModule())
		end
		UseDispatchResult(BulkPurchaseEndedModule())
	end
	
	local UseRefResult = nil
	local v1 = nil
	local UseStateResult2 = nil
	
	if FFlagFixVP8143Module then
		UseRefResult = ReactModule.useRef(nil)
		v1, UseStateResult2 = ReactModule.useState(true)
		ReactModule.useEffect(function()
			-- upvalues: RunService (upval), UseRefResult (ref), GetGuiObjectIsObscuredModule (upval), UseStateResult2 (ref)
			local HeartbeatConnection = RunService.Heartbeat:Connect(function()
				-- upvalues: UseRefResult (upval), GetGuiObjectIsObscuredModule (upval), UseStateResult2 (upval)
				if UseRefResult.current and typeof(UseRefResult.current) == "Instance" and UseRefResult.current:IsA("GuiObject") then
					local DevConsoleVisibleCore = game.StarterGui:GetCore("DevConsoleVisible")
					UseStateResult2(GetGuiObjectIsObscuredModule(UseRefResult.current) or DevConsoleVisibleCore)
				end
			end)
			
			return function()
				-- upvalues: HeartbeatConnection (copy)
				HeartbeatConnection:Disconnect()
			end
		end, {})
	end
	return {
		currentBalance = UseSelectorResult.balance,
		items = UseSelectorResult.items,
		ownedItems = UseSelectorResult.ownedItems,
		unpurchasableItems = UseSelectorResult.unpurchasableItems,
		onClose = OnClose,
		onAccept = if Balance < TotalCost then v38 else v37,
		totalCost = UseSelectorResult.totalCost,
		isDisabled = FFlagFixVP8143Module and v1 or #UseSelectorResult.items == 0,
		purchaseButtonRef = if FFlagFixVP8143Module then UseRefResult else nil,
		discountInformation = UseSelectorResult.discountInformation
	}
end