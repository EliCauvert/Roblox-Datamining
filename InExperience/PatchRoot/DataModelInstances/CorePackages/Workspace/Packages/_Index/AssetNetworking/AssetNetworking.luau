local createGetAssetDetailsModule = require(script.networkRequests.createGetAssetDetails)

return {
	config = function(p1)
		-- upvalues: createGetAssetDetailsModule (ref)
		return { GetAssetDetails = createGetAssetDetailsModule(p1) }
	end,
	["jest.config"] = script["jest.config"]
}