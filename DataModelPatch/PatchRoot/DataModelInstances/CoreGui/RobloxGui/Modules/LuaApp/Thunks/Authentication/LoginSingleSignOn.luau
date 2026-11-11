local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local LoginRequestsModule = require(Modules.LuaApp.Http.Requests.LoginRequests)
local LoginResultModule = require(Modules.LuaApp.Models.Authentication.LoginResult)
local LoginErrorCodeSSOModule = require(Modules.LuaApp.Enum.LoginErrorCodeSSO)
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local LoggerModule = require(Modules.LuaApp.Components.Authentication.Logger)

return function(p1)
	-- upvalues: PerformFetch (copy), LoginRequestsModule (copy), LoginResultModule (copy), PromiseModule (copy), LoggerModule (copy), LoginErrorCodeSSOModule (copy), HttpService (copy)
	return PerformFetch.Single(script.Name, function(_)
		-- upvalues: LoginRequestsModule (upval), p1 (copy), LoginResultModule (upval), PromiseModule (upval), LoggerModule (upval), LoginErrorCodeSSOModule (upval), HttpService (upval)
		return LoginRequestsModule.singleSignOnLogin(p1):andThen(function(Entry)
			-- upvalues: LoginResultModule (upval), PromiseModule (upval), LoggerModule (upval), LoginErrorCodeSSOModule (upval)
			if not Entry or not Entry[1] then
				LoggerModule:warning(string.format("Single sign on result error: %s", (tostring(Entry))))
				
				return PromiseModule.reject({ errorCode = LoginErrorCodeSSOModule.AuthError })
			end
			local Success, Result = pcall(function()
				-- upvalues: LoginResultModule (upval), Entry (copy)
				return LoginResultModule.fromJsonData(Entry[1])
			end)
			
			if Success then
				return PromiseModule.resolve(Result)
			else
				LoggerModule:warning(string.format("Single sign on loginResult error: %s", (tostring(Result))))
				
				return PromiseModule.reject({ errorCode = LoginErrorCodeSSOModule.AuthError })
			end
		end, function(p2)
			-- upvalues: LoggerModule (upval), HttpService (upval), LoginErrorCodeSSOModule (upval), PromiseModule (upval)
			LoggerModule:warning(string.format("Single sign on login error: %s", (tostring(p2))))
			
			if p2 and p2.Body then
				local Data = HttpService:JSONDecode(p2.Body)
				
				return PromiseModule.reject({
					errorCode = if Data.errors[1] then Data.errors[1].code else LoginErrorCodeSSOModule.AuthError,
					userFacingMessage = if Data.errors[1] then Data.errors[1].userFacingMessage else nil
				})
			else
				return PromiseModule.reject(p2)
			end
		end)
	end)
end