local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.LuaApp.Enum.NativePurchaseProductTypeEnum)

return require(Modules.Common.Action)(script.Name, function(NativeProductId, PurchaseStatus, ProductType)
	return {
		nativeProductId = NativeProductId,
		purchaseStatus = PurchaseStatus,
		productType = ProductType
	}
end)