local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("UserLib").Parent.Http).Url

return function(Callback, List)
	-- upvalues: HttpService (copy), Url (copy)
	local UserIds = {}
	
	for _, value in pairs(List) do
		local Number: number? = tonumber(value)
		
		if Number then
			table.insert(UserIds, Number)
		end
	end
	return Callback(string.format("%s/presence/users", Url.PRESENCE_URL), "POST", { postBody = HttpService:JSONEncode({ userIds = UserIds }) })
end