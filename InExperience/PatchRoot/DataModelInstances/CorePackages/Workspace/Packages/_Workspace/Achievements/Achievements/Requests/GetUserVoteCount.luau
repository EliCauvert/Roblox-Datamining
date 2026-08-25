local url = require(script:FindFirstAncestor("Achievements").Parent.Http).Url

return function(p0)
	-- upvalues: url (ref)
	return p0(string.format("%svoting-api/user/get-vote-count?targetType=Place", url.APIS_URL), "GET")
end