local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("UserLib").Parent.Http).Url

return function(p1, p2)
	-- upvalues: httpService (ref), url (ref)
	local t = {}
	
	for i, v in pairs(p2) do
		local var1 = tonumber(v)
		
		if var1 then
			table.insert(t, var1)
		end
	end
	return p1(string.format("%s/presence/users", url.PRESENCE_URL), "POST", { postBody = httpService:JSONEncode({ userIds = t }) })
end