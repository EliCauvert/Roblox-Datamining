local PromiseModule = require(script:FindFirstAncestor("GraphQlShared").Parent.Promise)

return {
	SuccessfulRequest = function(ResponseBody) --[[ Line: 5 ]]
		-- upvalues: PromiseModule (copy)
		return function(_, _, _, _, _) --[[ Line: 6 ]]
			-- upvalues: ResponseBody (copy), PromiseModule (upval)
			return PromiseModule.resolve({
				responseCode = 200,
				responseTimeMs = 480,
				isJSONValid = true,
				ResponseBody,
				responseBody = ResponseBody
			})
		end
	end
}