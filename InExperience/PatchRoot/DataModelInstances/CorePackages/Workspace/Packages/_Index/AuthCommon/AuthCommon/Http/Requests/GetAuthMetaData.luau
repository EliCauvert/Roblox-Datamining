local Url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(Callback) --[[ Line: 16 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%sv2/metadata", Url.AUTH_URL), "GET")
end