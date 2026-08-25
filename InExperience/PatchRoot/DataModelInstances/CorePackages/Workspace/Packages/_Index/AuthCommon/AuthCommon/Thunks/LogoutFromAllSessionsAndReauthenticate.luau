local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local logoutFromAllSessionsAndReauthenticateRequestModule = require(authCommon.Http.Requests.LogoutFromAllSessionsAndReauthenticateRequest)

return function(p0)
	-- upvalues: logoutFromAllSessionsAndReauthenticateRequestModule (ref), promiseModule (ref)
	return logoutFromAllSessionsAndReauthenticateRequestModule(p0):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2.responseBody)
	end):catch(function(p1)
		-- upvalues: promiseModule (copy)
		return if p1.data then promiseModule.reject(p1.data.errorCode) elseif p1.StatusCode then promiseModule.reject({ p1.StatusCode }) else promiseModule.reject()
	end)
end