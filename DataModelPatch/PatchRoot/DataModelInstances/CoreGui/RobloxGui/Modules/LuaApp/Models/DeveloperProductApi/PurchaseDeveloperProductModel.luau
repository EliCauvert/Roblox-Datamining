local ArgCheckModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck)
local PurchaseDeveloperProductModelModule = {
	new = function()
		return {
			price = 0,
			productId = 0,
			purchased = false,
			receipt = "",
			success = false,
			transactionStatus = ""
		}
	end
}

function PurchaseDeveloperProductModelModule.fromJsonData(p1)
	-- upvalues: PurchaseDeveloperProductModelModule (copy), ArgCheckModule (copy)
	local NewPurchaseDeveloperProductModel = PurchaseDeveloperProductModelModule.new()
	ArgCheckModule.isType(p1, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData")
	ArgCheckModule.isType(p1.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price")
	ArgCheckModule.isType(p1.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId")
	ArgCheckModule.isType(p1.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased")
	ArgCheckModule.isTypeOrNil(p1.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt")
	ArgCheckModule.isTypeOrNil(p1.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success")
	ArgCheckModule.isTypeOrNil(p1.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus")
	
	if type(p1) == "table" then
		NewPurchaseDeveloperProductModel.price = p1.price
		NewPurchaseDeveloperProductModel.productId = p1.productId
		NewPurchaseDeveloperProductModel.purchased = p1.purchased == true
		NewPurchaseDeveloperProductModel.receipt = p1.receipt
		NewPurchaseDeveloperProductModel.success = p1.success == true
		NewPurchaseDeveloperProductModel.transactionStatus = p1.transactionStatus
	end
	return NewPurchaseDeveloperProductModel
end

return PurchaseDeveloperProductModelModule