local createGetAssetDetailsModule = require(script.networkRequests.createGetAssetDetails)

return {
	config = function(p0)
		-- upvalues: createGetAssetDetailsModule (ref)
		return { GetAssetDetails = createGetAssetDetailsModule(p0) }
	end,
	["jest.config"] = script["jest.config"]
}