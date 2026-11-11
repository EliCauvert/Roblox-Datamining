local ArgCheckModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck)
local PurchaseProductModule = {
	new = function()
		return {}
	end
}

function PurchaseProductModule.fromJsonData(p1)
	-- upvalues: PurchaseProductModule (copy), ArgCheckModule (copy)
	local NewPurchaseProduct = PurchaseProductModule.new()
	ArgCheckModule.isType(p1, "table", "PurchaseProduct.fromJsonData's jsonData")
	ArgCheckModule.isType(p1.purchased, "boolean", "PurchaseProduct.fromJsonData's jsonData.purchased")
	ArgCheckModule.isType(p1.productId, "number", "PurchaseProduct.fromJsonData's jsonData.productId")
	ArgCheckModule.isTypeOrNil(p1.title, "string", "PurchaseProduct.fromJsonData's jsonData.title")
	ArgCheckModule.isTypeOrNil(p1.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId")
	ArgCheckModule.isTypeOrNil(p1.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice")
	ArgCheckModule.isTypeOrNil(p1.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode")
	
	if type(p1) == "table" then
		NewPurchaseProduct.purchased = p1.purchased == true
		NewPurchaseProduct.productId = tonumber(p1.productId)
		NewPurchaseProduct.title = p1.title
		NewPurchaseProduct.showDivId = p1.showDivId
		NewPurchaseProduct.shortfallPrice = p1.shortfallPrice
		NewPurchaseProduct.statusCode = p1.statusCode
	end
	return NewPurchaseProduct
end

return PurchaseProductModule