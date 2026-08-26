local _ = require(script.Parent.networkingShareLinkTypes)
local networkRequests = script.Parent.networkRequests
local createGenerateLinkModule = require(networkRequests.createGenerateLink)
local createGetOrGenerateLinkModule = require(networkRequests.createGetOrGenerateLink)
local createResolveLinkFromLinkIdModule = require(networkRequests.createResolveLinkFromLinkId)

return function(p1)
	-- upvalues: createResolveLinkFromLinkIdModule (ref), createGenerateLinkModule (ref), createGetOrGenerateLinkModule (ref)
	return {
		ResolveLinkFromLinkId = createResolveLinkFromLinkIdModule(p1),
		GenerateLink = createGenerateLinkModule(p1),
		GetOrGenerateLink = createGetOrGenerateLinkModule(p1)
	}
end