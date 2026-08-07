local httpService = game:GetService("HttpService")
local _ = require(script.Parent.Parent.Types.PurchaseItemsTypes)

return function(p0) --[[ line: 8 | named "getIsInsufficientRobuxError" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 9 ]]
		-- upvalues: httpService (copy), p0 (ref)
		return string.find(httpService:JSONDecode(p0.Body).message or "", "InsufficientTotalBalance") ~= nil
	end)
	
	return if ok then status else false
end