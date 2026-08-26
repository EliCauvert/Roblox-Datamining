local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getUserByIdRequestModule = require(authCommon.Http.Requests.GetUserByIdRequest)

return function(p1, p2)
	-- upvalues: getUserByIdRequestModule (ref), promiseModule (ref)
	return getUserByIdRequestModule(p1, p2):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		if not p3 or not p3.responseBody then
			return promiseModule.reject()
		end
		local responseBody = p3.responseBody
		
		return if responseBody == nil then promiseModule.reject() else promiseModule.resolve(responseBody)
	end)
end