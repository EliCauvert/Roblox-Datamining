local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ClearNativePurchaseResultModule = require(Modules.LuaApp.Actions.ClearNativePurchaseResult)
local _ = require(Modules.LuaApp.Enum.NativePurchaseProductTypeEnum)
local SetNativePurchaseResultModule = require(Modules.LuaApp.Actions.SetNativePurchaseResult)

return function(p1, p2)
	-- upvalues: SetNativePurchaseResultModule (copy), ClearNativePurchaseResultModule (copy)
	local T = if p1 == nil then {} else p1
	
	return if p2.type == SetNativePurchaseResultModule.name then {
		nativeProductId = p2.nativeProductId,
		purchaseStatus = p2.purchaseStatus,
		productType = p2.productType
	} elseif p2.type == ClearNativePurchaseResultModule.name then {} else T
end