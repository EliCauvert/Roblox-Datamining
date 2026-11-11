local CreateGetAssetDetailsModule = require(script.networkRequests.createGetAssetDetails)

return {
	config = function(p1)
		-- upvalues: CreateGetAssetDetailsModule (copy)
		return { GetAssetDetails = CreateGetAssetDetailsModule(p1) }
	end,
	["jest.config"] = script["jest.config"]
}