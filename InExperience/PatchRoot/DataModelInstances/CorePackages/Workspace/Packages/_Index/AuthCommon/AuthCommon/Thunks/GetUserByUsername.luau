local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local postGetUserByUsernameModule = require(authCommon.Http.Requests.PostGetUserByUsername)

return function(p1, p2)
	-- upvalues: postGetUserByUsernameModule (ref), promiseModule (ref)
	return function()
		-- upvalues: postGetUserByUsernameModule (copy), p1 (ref), p2 (ref), promiseModule (copy)
		return postGetUserByUsernameModule(p1, p2):andThen(function(p3)
			-- upvalues: promiseModule (copy)
			if not p3 or not p3.responseBody then
				return promiseModule.reject()
			end
			local data = p3.responseBody.data
			
			return if data == nil or #data == 0 then promiseModule.reject() else promiseModule.resolve(data[1])
		end)
	end
end