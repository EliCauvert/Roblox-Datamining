local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("UserLib").Parent.Http).Url

return function(p0, p1)
	-- upvalues: httpService (ref), url (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		local var2 = tonumber(v)
		
		if var2 then
			table.insert(t, var2)
		end
	end
	return p0(string.format("%s/presence/users", url.PRESENCE_URL), "POST", { postBody = httpService:JSONEncode({ userIds = t }) })
end