local url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return {
	blockUser = function(p1, p2)
		-- upvalues: url (ref)
		return p1(`{url.APIS_URL}user-blocking-api/v1/users/{p2}/block-user`, "POST")
	end,
	unblockUser = function(p1, p2)
		-- upvalues: url (ref)
		return p1(`{url.APIS_URL}user-blocking-api/v1/users/{p2}/unblock-user`, "POST")
	end,
	isBlockedUser = function(p1, p2)
		-- upvalues: url (ref)
		return p1(`{url.APIS_URL}user-blocking-api/v1/users/{p2}/is-blocked`, "GET")
	end
}