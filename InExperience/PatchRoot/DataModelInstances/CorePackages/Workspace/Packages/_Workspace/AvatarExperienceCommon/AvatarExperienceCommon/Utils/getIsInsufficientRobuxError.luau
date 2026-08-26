local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.Types.PurchaseItemsTypes)

return function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return string.find(httpService:JSONDecode(p1.Body).message or "", "InsufficientTotalBalance") ~= nil
	end)
	
	return if ok then status else false
end