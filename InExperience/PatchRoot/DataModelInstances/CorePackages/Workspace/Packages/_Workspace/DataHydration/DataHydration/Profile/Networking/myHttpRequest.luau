local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)

return httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("ProfileCTAHttpRetryCount", 3)
})