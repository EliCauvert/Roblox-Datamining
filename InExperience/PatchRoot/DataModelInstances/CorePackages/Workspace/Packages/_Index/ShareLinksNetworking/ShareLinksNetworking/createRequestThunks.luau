local _ = require(script.Parent.networkingShareLinkTypes)
local networkRequests = script.Parent.networkRequests
local createGenerateLinkModule = require(networkRequests.createGenerateLink)
local createGetOrGenerateLinkModule = require(networkRequests.createGetOrGenerateLink)
local createResolveLinkFromLinkIdModule = require(networkRequests.createResolveLinkFromLinkId)
local createResolveLinkFromLinkIdV2Module = require(networkRequests.createResolveLinkFromLinkIdV2)
local createGetMetadataModule = require(networkRequests.createGetMetadata)

return function(p0) --[[ line: 10 ]]
	-- upvalues: createGenerateLinkModule (ref), createGetOrGenerateLinkModule (ref), createResolveLinkFromLinkIdModule (ref), createResolveLinkFromLinkIdV2Module (ref), createGetMetadataModule (ref)
	return {
		GenerateLink = createGenerateLinkModule(p0),
		GetOrGenerateLink = createGetOrGenerateLinkModule(p0),
		ResolveLinkFromLinkId = createResolveLinkFromLinkIdModule(p0),
		ResolveLinkFromLinkIdV2 = createResolveLinkFromLinkIdV2Module(p0),
		GetMetadata = createGetMetadataModule(p0)
	}
end