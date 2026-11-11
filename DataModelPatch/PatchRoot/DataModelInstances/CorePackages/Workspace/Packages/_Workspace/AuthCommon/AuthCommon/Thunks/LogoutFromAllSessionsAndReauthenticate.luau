local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local LogoutFromAllSessionsAndReauthenticateRequestModule = require(AuthCommon.Http.Requests.LogoutFromAllSessionsAndReauthenticateRequest)

return function(p1)
	-- upvalues: LogoutFromAllSessionsAndReauthenticateRequestModule (copy), PromiseModule (copy)
	return LogoutFromAllSessionsAndReauthenticateRequestModule(p1):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result.responseBody)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return if Err.data then PromiseModule.reject(Err.data.errorCode) elseif Err.StatusCode then PromiseModule.reject({ Err.StatusCode }) else PromiseModule.reject()
	end)
end