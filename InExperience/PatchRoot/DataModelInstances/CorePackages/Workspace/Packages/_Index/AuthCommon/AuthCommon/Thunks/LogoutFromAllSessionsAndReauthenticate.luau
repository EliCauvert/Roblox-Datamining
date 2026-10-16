local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local LogoutFromAllSessionsAndReauthenticateRequestModule = require(AuthCommon.Http.Requests.LogoutFromAllSessionsAndReauthenticateRequest)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: LogoutFromAllSessionsAndReauthenticateRequestModule (copy), PromiseModule (copy)
	return LogoutFromAllSessionsAndReauthenticateRequestModule(p1):andThen(function(Result) --[[ Line: 12 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result.responseBody)
	end):catch(function(Err) --[[ Line: 14 ]]
		-- upvalues: PromiseModule (upval)
		return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
	end)
end