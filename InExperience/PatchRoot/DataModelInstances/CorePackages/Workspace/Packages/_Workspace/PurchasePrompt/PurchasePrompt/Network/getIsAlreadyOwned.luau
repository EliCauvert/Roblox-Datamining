local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow

return function(p0, p1, p2, p3)
	-- upvalues: fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), promiseModule (ref), playersService (ref), purchaseErrorModule (ref)
	return if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p3 then promiseModule.resolve(false) else p0.getPlayerOwns(playersService.LocalPlayer, p1, p2):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end