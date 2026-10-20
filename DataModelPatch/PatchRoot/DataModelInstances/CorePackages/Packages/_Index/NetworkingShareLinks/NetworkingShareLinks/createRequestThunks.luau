local _ = require(script.Parent.networkingShareLinkTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateGenerateLinkModule = require(NetworkRequests.createGenerateLink)
local CreateGetOrGenerateLinkModule = require(NetworkRequests.createGetOrGenerateLink)
local CreateResolveLinkFromLinkIdModule = require(NetworkRequests.createResolveLinkFromLinkId)

return function(p1)
	-- upvalues: CreateResolveLinkFromLinkIdModule (copy), CreateGenerateLinkModule (copy), CreateGetOrGenerateLinkModule (copy)
	return {
		ResolveLinkFromLinkId = CreateResolveLinkFromLinkIdModule(p1),
		GenerateLink = CreateGenerateLinkModule(p1),
		GetOrGenerateLink = CreateGetOrGenerateLinkModule(p1)
	}
end