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

local function convertErrorMessageToErrorCode(p0) --[[ line: 16 ]]
	-- upvalues: fFlagAddCommerceErrorsModule (ref), errorCodeEnumModule (ref)
	return if fFlagAddCommerceErrorsModule then if p0 == "DeviceTypeNotAllowed" or p0 == "PurchasePlatformNotSupported" then errorCodeEnumModule.DeviceNotSupported elseif p0 == "UniverseNotAllowed" or p0 == "ProductContentModerated" or p0 == "ProductNotFound" then errorCodeEnumModule.NotPurchasable elseif p0 == "UserNotAllowed" or p0 == "AccountCountryNotSupported" or p0 == "UserAgeNotAllowed" then errorCodeEnumModule.AccountNotSupported else errorCodeEnumModule.Generic elseif p0 == "NotPurchasable" then errorCodeEnumModule.NotPurchasable else errorCodeEnumModule.Generic
end

local function handleError(p1, p2, p3) --[[ line: 44 ]]
	-- upvalues: convertErrorMessageToErrorCode (ref), errorCodeEnumModule (ref), setCurrentToastMessage (ref), toastType (ref), commercePurchaseEndedModule (ref), commercePurchaseFailedModule (ref)
	local var11 = convertErrorMessageToErrorCode(p1)
	
	if var11 == errorCodeEnumModule.Generic then
		p2:dispatch(setCurrentToastMessage({ toastType = toastType.NetworkingError, toastTitle = p3 }))
		p2:dispatch(commercePurchaseEndedModule())
		
		return
	end
	p2:dispatch(commercePurchaseFailedModule(var11))
end

return function(p4, p5) --[[ line: 58 | named "InitiateCommercePurchaseFlow" ]]
	-- upvalues: commercePurchaseStartedModule (ref), commerceService (ref), commercePurchaseCheckoutModule (ref), handleError (ref)
	return function(p6) --[[ line: 59 ]]
		-- upvalues: commercePurchaseStartedModule (copy), p4 (ref), commerceService (copy), commercePurchaseCheckoutModule (copy), handleError (copy), p5 (ref)
		p6:dispatch(commercePurchaseStartedModule(p4))
		local ok, status = pcall(function() --[[ line: 61 ]]
			-- upvalues: commerceService (copy), p4 (copy)
			return commerceService:PrepareCommerceProductPurchase(p4)
		end)
		
		if ok then
			p6:dispatch(commercePurchaseCheckoutModule(status.CheckoutSessionId))
			
			return
		end
		handleError(status, p6, p5)
	end
end