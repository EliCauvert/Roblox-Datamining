local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local PostGetUserByUsernameModule = require(AuthCommon.Http.Requests.PostGetUserByUsername)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: PostGetUserByUsernameModule (copy), PromiseModule (copy)
	return function() --[[ Line: 8 ]]
		-- upvalues: PostGetUserByUsernameModule (upval), p1 (copy), p2 (copy), PromiseModule (upval)
		return PostGetUserByUsernameModule(p1, p2):andThen(function(Result) --[[ Line: 9 ]]
			-- upvalues: PromiseModule (upval)
			if Result and Result.responseBody then
				local Data = Result.responseBody.data
				
				return if Data == nil or #Data == 0 then PromiseModule.reject() else PromiseModule.resolve(Data[1])
			else
				return PromiseModule.reject()
			end
		end)
	end
end