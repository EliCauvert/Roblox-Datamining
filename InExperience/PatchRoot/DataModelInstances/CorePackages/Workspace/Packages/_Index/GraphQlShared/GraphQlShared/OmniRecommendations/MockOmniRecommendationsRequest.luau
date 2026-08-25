local promiseModule = require(script:FindFirstAncestor("GraphQlShared").Parent.Promise)

return {
	SuccessfulRequest = function(p0)
		-- upvalues: promiseModule (ref)
		return function(_, _, _, _, _)
			-- upvalues: p0 (ref), promiseModule (copy)
			return promiseModule.resolve({
				responseCode = 200,
				responseTimeMs = 480,
				isJSONValid = true,
				p0,
				responseBody = p0
			})
		end
	end
}