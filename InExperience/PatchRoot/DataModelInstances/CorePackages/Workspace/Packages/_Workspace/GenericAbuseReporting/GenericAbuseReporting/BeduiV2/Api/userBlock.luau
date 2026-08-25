local url = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Http).Url

return {
	blockUser = function(p0, p1)
		-- upvalues: url (ref)
		return p0(`{url.APIS_URL}user-blocking-api/v1/users/{p1}/block-user`, "POST")
	end,
	unblockUser = function(p2, p3)
		-- upvalues: url (ref)
		return p2(`{url.APIS_URL}user-blocking-api/v1/users/{p3}/unblock-user`, "POST")
	end,
	isBlockedUser = function(p4, p5)
		-- upvalues: url (ref)
		return p4(`{url.APIS_URL}user-blocking-api/v1/users/{p5}/is-blocked`, "GET")
	end
}