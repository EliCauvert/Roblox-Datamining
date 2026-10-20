local _ = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.PremiumFeaturesApi.IAPProduct)
local _ = require(game:GetService("CorePackages").Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default

function calculateMoreAmount(List)
	if List == nil or #List == 0 then
		return {}
	end
	local v1 = nil
	
	for _, value in List do
		if v1 == nil or value.robuxAmount < v1.robuxAmount then
			v1 = value
		end
	end
	for _, value1 in List do
		local RobuxAmountDelta = value1.robuxAmount - v1.robuxAmount * (value1.price / v1.price)
		
		if RobuxAmountDelta > 0 then
			value1.robuxMoreAmount = math.floor((RobuxAmountDelta + 50) / 100) * 100
		end
	end
	return List
end

return {
	formatIapProducts = function(List)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				productId = value.productId,
				price = value.price,
				packageId = value.mobileProductId,
				robuxAmount = value.robuxAmount,
				currencyAmountStr = value.currencySymbol .. tostring(value.price)
			})
		end
		return calculateMoreAmount(List1)
	end,
	formatNativeRobuxProducts = function(List)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				productId = value.productId,
				price = value.price,
				packageId = value.nativeProductId,
				robuxAmount = value.robuxAmount,
				currencyAmountStr = value.displayPrice
			})
		end
		return calculateMoreAmount(List1)
	end
}