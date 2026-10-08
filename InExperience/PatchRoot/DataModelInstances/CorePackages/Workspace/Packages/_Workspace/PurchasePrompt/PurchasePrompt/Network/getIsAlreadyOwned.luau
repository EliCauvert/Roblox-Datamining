local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local t = { [require(parent.types).ProductTypeEnum.VIPServer] = true }

return function(p1, p2, p3, p4)
	-- upvalues: fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), promiseModule (ref), t (ref), playersService (ref), purchaseErrorModule (ref)
	return if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p4 then promiseModule.resolve(false) elseif t[p3] then promiseModule.resolve(false) else p1.getPlayerOwns(playersService.LocalPlayer, p2, p3):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end