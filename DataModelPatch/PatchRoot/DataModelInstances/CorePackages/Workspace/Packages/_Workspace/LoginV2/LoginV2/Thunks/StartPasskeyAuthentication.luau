local LoginV2 = script:FindFirstAncestor("LoginV2")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(LoginV2.Parent.Promise)
local PostStartPasskeyAuthenticationModule = require(LoginV2.Requests.PostStartPasskeyAuthentication)

return function(p1)
	-- upvalues: PostStartPasskeyAuthenticationModule (copy), PromiseModule (copy), HttpService (copy)
	return function()
		-- upvalues: PostStartPasskeyAuthenticationModule (upval), p1 (copy), PromiseModule (upval), HttpService (upval)
		return PostStartPasskeyAuthenticationModule(p1):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return if Result and Result.responseBody then Result.responseBody else PromiseModule.reject()
		end, function(p2)
			-- upvalues: HttpService (upval), PromiseModule (upval)
			return PromiseModule.reject({
				errorCode = if p2.Body then HttpService:JSONDecode(p2.Body).errors[1].code else 0
			})
		end)
	end
end