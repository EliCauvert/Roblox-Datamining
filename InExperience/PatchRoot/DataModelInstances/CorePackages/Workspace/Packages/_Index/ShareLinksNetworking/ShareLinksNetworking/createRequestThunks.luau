local _ = require(script.Parent.networkingShareLinkTypes)
local networkRequests = script.Parent.networkRequests
local createGenerateLinkModule = require(networkRequests.createGenerateLink)
local createGetOrGenerateLinkModule = require(networkRequests.createGetOrGenerateLink)
local createResolveLinkFromLinkIdModule = require(networkRequests.createResolveLinkFromLinkId)
local createResolveLinkFromLinkIdV2Module = require(networkRequests.createResolveLinkFromLinkIdV2)
local createGetMetadataModule = require(networkRequests.createGetMetadata)

return function(p1)
	-- upvalues: createGenerateLinkModule (ref), createGetOrGenerateLinkModule (ref), createResolveLinkFromLinkIdModule (ref), createResolveLinkFromLinkIdV2Module (ref), createGetMetadataModule (ref)
	return {
		GenerateLink = createGenerateLinkModule(p1),
		GetOrGenerateLink = createGetOrGenerateLinkModule(p1),
		ResolveLinkFromLinkId = createResolveLinkFromLinkIdModule(p1),
		ResolveLinkFromLinkIdV2 = createResolveLinkFromLinkIdV2Module(p1),
		GetMetadata = createGetMetadataModule(p1)
	}
end