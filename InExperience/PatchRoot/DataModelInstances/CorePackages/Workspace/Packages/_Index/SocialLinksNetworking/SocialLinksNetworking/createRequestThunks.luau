local networkRequests = script.Parent.networkRequests
local createGetSocialLinksModule = require(networkRequests.createGetSocialLinks)
local createGetSelfSocialLinksModule = require(networkRequests.createGetSelfSocialLinks)
local createSetSocialLinksModule = require(networkRequests.createSetSocialLinks)

return function(p1)
	-- upvalues: createGetSocialLinksModule (ref), createGetSelfSocialLinksModule (ref), createSetSocialLinksModule (ref)
	return {
		GetSocialLinks = createGetSocialLinksModule(p1),
		GetSelfSocialLinks = createGetSelfSocialLinksModule(p1),
		SetSocialLinks = createSetSocialLinksModule(p1)
	}
end