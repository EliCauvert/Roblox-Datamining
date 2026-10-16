local Url = require(script:FindFirstAncestor("Achievements").Parent.Http).Url

return function(Callback) --[[ Line: 18 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%svoting-api/user/get-vote-count?targetType=Place", Url.APIS_URL), "GET")
end