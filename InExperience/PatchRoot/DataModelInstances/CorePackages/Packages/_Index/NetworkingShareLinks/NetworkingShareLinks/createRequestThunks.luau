local _ = require(script.Parent.networkingShareLinkTypes)
local networkRequests = script.Parent.networkRequests
local createGenerateLinkModule = require(networkRequests.createGenerateLink)
local createGetOrGenerateLinkModule = require(networkRequests.createGetOrGenerateLink)
local createResolveLinkFromLinkIdModule = require(networkRequests.createResolveLinkFromLinkId)

return function(p0) --[[ line: 9 ]]
	-- upvalues: createResolveLinkFromLinkIdModule (ref), createGenerateLinkModule (ref), createGetOrGenerateLinkModule (ref)
	return {
		ResolveLinkFromLinkId = createResolveLinkFromLinkIdModule(p0),
		GenerateLink = createGenerateLinkModule(p0),
		GetOrGenerateLink = createGetOrGenerateLinkModule(p0)
	}
end