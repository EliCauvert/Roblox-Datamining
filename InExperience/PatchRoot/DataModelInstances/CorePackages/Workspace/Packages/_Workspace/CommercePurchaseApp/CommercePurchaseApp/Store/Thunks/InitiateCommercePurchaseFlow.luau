local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local commerceService = game:GetService("CommerceService")
local commercePurchaseFailedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseFailed)
local commercePurchaseStartedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseStarted)
local commercePurchaseCheckoutModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseCheckout)
local commercePurchaseEndedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseEnded)
local errorCodeEnumModule = require(commercePurchaseApp.Enums.ErrorCodeEnum)
local fFlagAddCommerceErrorsModule = require(commercePurchaseApp.Flags.FFlagAddCommerceErrors)
local toastRoduxModule = require(commercePurchaseApp.Parent.ToastRodux)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage

local function convertErrorMessageToErrorCode(p1)
	-- upvalues: fFlagAddCommerceErrorsModule (ref), errorCodeEnumModule (ref)
	return if fFlagAddCommerceErrorsModule then if p1 == "DeviceTypeNotAllowed" or p1 == "PurchasePlatformNotSupported" then errorCodeEnumModule.DeviceNotSupported elseif p1 == "UniverseNotAllowed" or p1 == "ProductContentModerated" or p1 == "ProductNotFound" then errorCodeEnumModule.NotPurchasable elseif p1 == "UserNotAllowed" or p1 == "AccountCountryNotSupported" or p1 == "UserAgeNotAllowed" then errorCodeEnumModule.AccountNotSupported else errorCodeEnumModule.Generic elseif p1 == "NotPurchasable" then errorCodeEnumModule.NotPurchasable else errorCodeEnumModule.Generic
end

local function handleError(p1, p2, p3)
	-- upvalues: convertErrorMessageToErrorCode (ref), errorCodeEnumModule (ref), setCurrentToastMessage (ref), toastType (ref), commercePurchaseEndedModule (ref), commercePurchaseFailedModule (ref)
	local var1 = convertErrorMessageToErrorCode(p1)
	
	if var1 == errorCodeEnumModule.Generic then
		p2:dispatch(setCurrentToastMessage({ toastType = toastType.NetworkingError, toastTitle = p3 }))
		p2:dispatch(commercePurchaseEndedModule())
		
		return
	end
	p2:dispatch(commercePurchaseFailedModule(var1))
end

return function(p1, p2)
	-- upvalues: commercePurchaseStartedModule (ref), commerceService (ref), commercePurchaseCheckoutModule (ref), handleError (ref)
	return function(p3)
		-- upvalues: commercePurchaseStartedModule (copy), p1 (ref), commerceService (copy), commercePurchaseCheckoutModule (copy), handleError (copy), p2 (ref)
		p3:dispatch(commercePurchaseStartedModule(p1))
		local ok, status = pcall(function()
			-- upvalues: commerceService (copy), p1 (copy)
			return commerceService:PrepareCommerceProductPurchase(p1)
		end)
		
		if ok then
			p3:dispatch(commercePurchaseCheckoutModule(status.CheckoutSessionId))
			
			return
		end
		handleError(status, p3, p2)
	end
end