local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.Types.PurchaseItemsTypes)

return function(p1)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function(): boolean
		-- upvalues: HttpService (upval), p1 (copy)
		return string.find(HttpService:JSONDecode(p1.Body).message or "", "InsufficientTotalBalance") ~= nil
	end)
	
	return if Success then Result else false
end