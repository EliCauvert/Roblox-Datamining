local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local logoutFromAllSessionsAndReauthenticateRequestModule = require(authCommon.Http.Requests.LogoutFromAllSessionsAndReauthenticateRequest)

return function(p1)
	-- upvalues: logoutFromAllSessionsAndReauthenticateRequestModule (ref), promiseModule (ref)
	return logoutFromAllSessionsAndReauthenticateRequestModule(p1):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2.responseBody)
	end):catch(function(p2)
		-- upvalues: promiseModule (copy)
		return if p2.data then promiseModule.reject(p2.data.errorCode) elseif p2.StatusCode then promiseModule.reject({ p2.StatusCode }) else promiseModule.reject()
	end)
end