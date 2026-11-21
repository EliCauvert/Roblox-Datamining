local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("PioneerInviteFilter").Parent.Http).Url

return function(Callback, LinkId, LinkType)
	-- upvalues: HttpService (copy), Url (copy)
	return Callback(string.format("%ssharelinks/v1/resolve-link", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({ linkId = LinkId, linkType = LinkType })
	})
end