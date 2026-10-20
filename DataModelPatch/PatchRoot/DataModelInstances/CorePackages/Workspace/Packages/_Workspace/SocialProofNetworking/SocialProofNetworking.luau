local CreateGetConnectionsByEntityIdModule = require(script.networkRequests.createGetConnectionsByEntityId)

return {
	config = function(p1)
		-- upvalues: CreateGetConnectionsByEntityIdModule (copy)
		return {
			GetConnectionsByEntityId = CreateGetConnectionsByEntityIdModule(p1)
		}
	end,
	Types = require(script.types),
	["jest.config"] = script["jest.config"]
}