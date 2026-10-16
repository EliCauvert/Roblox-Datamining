local Url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return {
	blockUser = function(Callback, p1) --[[ Line: 8 ]]
		-- upvalues: Url (copy)
		return Callback(`{Url.APIS_URL}user-blocking-api/v1/users/{p1}/block-user`, "POST")
	end,
	unblockUser = function(Callback, p1) --[[ Line: 13 ]]
		-- upvalues: Url (copy)
		return Callback(`{Url.APIS_URL}user-blocking-api/v1/users/{p1}/unblock-user`, "POST")
	end,
	isBlockedUser = function(Callback, p1) --[[ Line: 18 ]]
		-- upvalues: Url (copy)
		return Callback(`{Url.APIS_URL}user-blocking-api/v1/users/{p1}/is-blocked`, "GET")
	end
}