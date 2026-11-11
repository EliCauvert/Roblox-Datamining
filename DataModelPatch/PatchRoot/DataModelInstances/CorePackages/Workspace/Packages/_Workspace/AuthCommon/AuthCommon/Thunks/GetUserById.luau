local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local GetUserByIdRequestModule = require(AuthCommon.Http.Requests.GetUserByIdRequest)

return function(p1, p2)
	-- upvalues: GetUserByIdRequestModule (copy), PromiseModule (copy)
	return GetUserByIdRequestModule(p1, p2):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		if Result and Result.responseBody then
			local ResponseBody = Result.responseBody
			
			return if ResponseBody == nil then PromiseModule.reject() else PromiseModule.resolve(ResponseBody)
		else
			return PromiseModule.reject()
		end
	end)
end