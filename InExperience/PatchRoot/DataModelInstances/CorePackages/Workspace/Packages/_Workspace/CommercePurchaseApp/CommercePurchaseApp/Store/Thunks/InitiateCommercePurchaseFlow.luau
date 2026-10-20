local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local CommerceService = game:GetService("CommerceService")
local CommercePurchaseFailedModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseFailed)
local CommercePurchaseStartedModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseStarted)
local CommercePurchaseCheckoutModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseCheckout)
local CommercePurchaseEndedModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseEnded)
local ErrorCodeEnumModule = require(CommercePurchaseApp.Enums.ErrorCodeEnum)
local FFlagAddCommerceErrorsModule = require(CommercePurchaseApp.Flags.FFlagAddCommerceErrors)
local ToastRoduxModule = require(CommercePurchaseApp.Parent.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage

local function convertErrorMessageToErrorCode(p1)
	-- upvalues: FFlagAddCommerceErrorsModule (copy), ErrorCodeEnumModule (copy)
	return if FFlagAddCommerceErrorsModule then if p1 == "DeviceTypeNotAllowed" or p1 == "PurchasePlatformNotSupported" then ErrorCodeEnumModule.DeviceNotSupported elseif p1 == "UniverseNotAllowed" or p1 == "ProductContentModerated" or p1 == "ProductNotFound" then ErrorCodeEnumModule.NotPurchasable elseif p1 == "UserNotAllowed" or p1 == "AccountCountryNotSupported" or p1 == "UserAgeNotAllowed" then ErrorCodeEnumModule.AccountNotSupported else ErrorCodeEnumModule.Generic elseif p1 == "NotPurchasable" then ErrorCodeEnumModule.NotPurchasable else ErrorCodeEnumModule.Generic
end

local function handleError(p1, p2, ToastTitle)
	-- upvalues: convertErrorMessageToErrorCode (copy), ErrorCodeEnumModule (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), CommercePurchaseEndedModule (copy), CommercePurchaseFailedModule (copy)
	local ConvertErrorMessageToErrorCodeResult = convertErrorMessageToErrorCode(p1)
	
	if ConvertErrorMessageToErrorCodeResult == ErrorCodeEnumModule.Generic then
		p2:dispatch(SetCurrentToastMessageFunction({
			toastType = ToastType.NetworkingError,
			toastTitle = ToastTitle
		}))
		p2:dispatch(CommercePurchaseEndedModule())
		
		return
	else
		p2:dispatch(CommercePurchaseFailedModule(ConvertErrorMessageToErrorCodeResult))
	end
end

return function(CommerceProductId, ToastTitle)
	-- upvalues: CommercePurchaseStartedModule (copy), CommerceService (copy), CommercePurchaseCheckoutModule (copy), handleError (copy)
	return function(p1)
		-- upvalues: CommercePurchaseStartedModule (upval), CommerceProductId (copy), CommerceService (upval), CommercePurchaseCheckoutModule (upval), handleError (upval), ToastTitle (copy)
		p1:dispatch(CommercePurchaseStartedModule(CommerceProductId))
		local Success, Result = pcall(function()
			-- upvalues: CommerceService (upval), CommerceProductId (upval)
			return CommerceService:PrepareCommerceProductPurchase(CommerceProductId)
		end)
		
		if Success then
			p1:dispatch(CommercePurchaseCheckoutModule(Result.CheckoutSessionId))
			
			return
		else
			handleError(Result, p1, ToastTitle)
		end
	end
end