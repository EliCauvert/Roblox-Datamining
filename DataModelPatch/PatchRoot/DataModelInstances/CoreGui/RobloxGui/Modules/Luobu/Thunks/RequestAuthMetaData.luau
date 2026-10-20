local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local AuthGetMetaDataRequestModule = require(Modules.Luobu.Http.Requests.AuthGetMetaDataRequest)
local SetTokenAuthErrMessageKeyModule = require(Modules.Luobu.Actions.SetTokenAuthErrMessageKey)

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), AuthGetMetaDataRequestModule (copy), PromiseModule (copy), SetTokenAuthErrMessageKeyModule (copy)
	ArgCheckModule.isType(p1, "table", "networkImpl")
	ArgCheckModule.isType(p3, "string", "authMethod")
	
	return function(p4)
		-- upvalues: AuthGetMetaDataRequestModule (upval), p1 (copy), p3 (copy), PromiseModule (upval), SetTokenAuthErrMessageKeyModule (upval), p2 (copy)
		return AuthGetMetaDataRequestModule(p1, p3):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result.responseBody)
		end, function(p5)
			-- upvalues: p4 (copy), SetTokenAuthErrMessageKeyModule (upval), p2 (upval), PromiseModule (upval)
			p4:dispatch(SetTokenAuthErrMessageKeyModule("Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"))
			p2.Diag:reportCounter("RequestAuthMetaDataFailure", 1)
			
			return PromiseModule.reject(p5)
		end)
	end
end