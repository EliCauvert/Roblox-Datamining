local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local config = { [require(Parent.types).ProductTypeEnum.VIPServer] = true }

return function(p1, p2, p3, p4)
	-- upvalues: FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), PromiseModule (copy), config (copy), Players (copy), PurchaseErrorModule (copy)
	return if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p4 then PromiseModule.resolve(false) elseif config[p3] then PromiseModule.resolve(false) else p1.getPlayerOwns(Players.LocalPlayer, p2, p3):catch(function(_)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end