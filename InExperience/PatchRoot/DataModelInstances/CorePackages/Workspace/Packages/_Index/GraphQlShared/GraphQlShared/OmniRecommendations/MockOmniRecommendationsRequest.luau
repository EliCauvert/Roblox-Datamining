local promiseModule = require(script:FindFirstAncestor("GraphQlShared").Parent.Promise)

return {
	SuccessfulRequest = function(p1)
		-- upvalues: promiseModule (ref)
		return function(_, _, _, _, _)
			-- upvalues: p1 (ref), promiseModule (copy)
			return promiseModule.resolve({
				responseCode = 200,
				responseTimeMs = 480,
				isJSONValid = true,
				p1,
				responseBody = p1
			})
		end
	end
}