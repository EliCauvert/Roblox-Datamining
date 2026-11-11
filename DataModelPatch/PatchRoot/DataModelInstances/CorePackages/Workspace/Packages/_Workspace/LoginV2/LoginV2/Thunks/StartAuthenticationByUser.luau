local LoginV2 = script:FindFirstAncestor("LoginV2")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(LoginV2.Parent.Promise)
local PostStartAuthenticationByUserModule = require(LoginV2.Requests.PostStartAuthenticationByUser)
local _ = require(LoginV2.Common.LoginV2RequestTypes)

return function(p1, p2)
	-- upvalues: PostStartAuthenticationByUserModule (copy), PromiseModule (copy), HttpService (copy)
	return function()
		-- upvalues: PostStartAuthenticationByUserModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), HttpService (upval)
		return PostStartAuthenticationByUserModule(p1, p2):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return if Result and Result.responseBody then Result.responseBody else PromiseModule.reject()
		end, function(p3)
			-- upvalues: HttpService (upval), PromiseModule (upval)
			return PromiseModule.reject({
				errorCode = if p3.Body then HttpService:JSONDecode(p3.Body).errors[1].code else 0
			})
		end)
	end
end