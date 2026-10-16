local _ = require(script.Parent.networkingShareLinkTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateGenerateLinkModule = require(NetworkRequests.createGenerateLink)
local CreateGetOrGenerateLinkModule = require(NetworkRequests.createGetOrGenerateLink)
local CreateResolveLinkFromLinkIdModule = require(NetworkRequests.createResolveLinkFromLinkId)
local CreateResolveLinkFromLinkIdV2Module = require(NetworkRequests.createResolveLinkFromLinkIdV2)
local CreateGetMetadataModule = require(NetworkRequests.createGetMetadata)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: CreateGenerateLinkModule (copy), CreateGetOrGenerateLinkModule (copy), CreateResolveLinkFromLinkIdModule (copy), CreateResolveLinkFromLinkIdV2Module (copy), CreateGetMetadataModule (copy)
	return {
		GenerateLink = CreateGenerateLinkModule(p1),
		GetOrGenerateLink = CreateGetOrGenerateLinkModule(p1),
		ResolveLinkFromLinkId = CreateResolveLinkFromLinkIdModule(p1),
		ResolveLinkFromLinkIdV2 = CreateResolveLinkFromLinkIdV2Module(p1),
		GetMetadata = CreateGetMetadataModule(p1)
	}
end