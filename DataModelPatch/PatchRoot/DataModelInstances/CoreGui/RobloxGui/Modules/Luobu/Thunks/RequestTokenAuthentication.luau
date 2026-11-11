local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local TokenAuthenticationPostRequestModule = require(Modules.Luobu.Http.Requests.TokenAuthenticationPostRequest)
local SetTokenAuthErrMessageKeyModule = require(Modules.Luobu.Actions.SetTokenAuthErrMessageKey)

return function(p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), TokenAuthenticationPostRequestModule (copy), PromiseModule (copy), SetTokenAuthErrMessageKeyModule (copy)
	ArgCheckModule.isType(p1, "table", "networkImpl")
	ArgCheckModule.isType(p3, "string", "authMethod")
	ArgCheckModule.isType(p4, "table", "body")
	
	return function(p5)
		-- upvalues: TokenAuthenticationPostRequestModule (upval), p1 (copy), p3 (copy), p4 (copy), PromiseModule (upval), SetTokenAuthErrMessageKeyModule (upval), p2 (copy)
		return TokenAuthenticationPostRequestModule(p1, p3, p4):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result.responseBody)
		end, function(p6)
			-- upvalues: p5 (copy), SetTokenAuthErrMessageKeyModule (upval), p2 (upval), PromiseModule (upval)
			p5:dispatch(SetTokenAuthErrMessageKeyModule("Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"))
			p2.Diag:reportCounter("TokenAuthenticationPostRequestFailure", 1)
			
			return PromiseModule.reject(p6)
		end)
	end
end