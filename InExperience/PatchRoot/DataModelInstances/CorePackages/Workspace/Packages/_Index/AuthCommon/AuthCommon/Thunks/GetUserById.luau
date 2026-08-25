local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getUserByIdRequestModule = require(authCommon.Http.Requests.GetUserByIdRequest)

return function(p0, p1)
	-- upvalues: getUserByIdRequestModule (ref), promiseModule (ref)
	return getUserByIdRequestModule(p0, p1):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		if not p2 or not p2.responseBody then
			return promiseModule.reject()
		end
		local responseBody = p2.responseBody
		
		return if responseBody == nil then promiseModule.reject() else promiseModule.resolve(responseBody)
	end)
end