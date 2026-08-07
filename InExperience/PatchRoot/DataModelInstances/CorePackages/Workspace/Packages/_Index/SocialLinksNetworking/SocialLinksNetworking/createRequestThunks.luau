local networkRequests = script.Parent.networkRequests
local createGetSocialLinksModule = require(networkRequests.createGetSocialLinks)
local createGetSelfSocialLinksModule = require(networkRequests.createGetSelfSocialLinks)
local createSetSocialLinksModule = require(networkRequests.createSetSocialLinks)

return function(p0) --[[ line: 7 ]]
	-- upvalues: createGetSocialLinksModule (ref), createGetSelfSocialLinksModule (ref), createSetSocialLinksModule (ref)
	return {
		GetSocialLinks = createGetSocialLinksModule(p0),
		GetSelfSocialLinks = createGetSelfSocialLinksModule(p0),
		SetSocialLinks = createSetSocialLinksModule(p0)
	}
end