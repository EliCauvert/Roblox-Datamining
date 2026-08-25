local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)

return httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end,
	maxRetryCount = game:DefineFastInt("ProfileCTAHttpRetryCount", 3)
})