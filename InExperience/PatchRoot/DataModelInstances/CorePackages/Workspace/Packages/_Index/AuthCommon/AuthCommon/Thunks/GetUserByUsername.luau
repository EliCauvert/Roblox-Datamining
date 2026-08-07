local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local postGetUserByUsernameModule = require(authCommon.Http.Requests.PostGetUserByUsername)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: postGetUserByUsernameModule (ref), promiseModule (ref)
	return function() --[[ line: 8 ]]
		-- upvalues: postGetUserByUsernameModule (copy), p0 (ref), p1 (ref), promiseModule (copy)
		return postGetUserByUsernameModule(p0, p1):andThen(function(p2) --[[ line: 9 ]]
			-- upvalues: promiseModule (copy)
			if not p2 or not p2.responseBody then
				return promiseModule.reject()
			end
			local data = p2.responseBody.data
			
			return if data == nil or #data == 0 then promiseModule.reject() else promiseModule.resolve(data[1])
		end)
	end
end