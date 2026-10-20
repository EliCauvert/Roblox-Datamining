local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local GetUsersAuthenticatedModule = require(Modules.LuaApp.Http.Requests.GetUsersAuthenticated)
local GetLocalUserFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser

return function(p1)
	-- upvalues: GetUsersAuthenticatedModule (copy), UserModule (copy), GetLocalUserFunction (copy), PromiseModule (copy), Logging (copy)
	return function(p2)
		-- upvalues: GetUsersAuthenticatedModule (upval), p1 (copy), UserModule (upval), GetLocalUserFunction (upval), PromiseModule (upval), Logging (upval)
		local State = p2:getState()
		local User = State.Users[State.LocalUserId]
		local IsLocalUserUnder13 = State.IsLocalUserUnder13
		local CountryCode = State.CountryCode
		
		return GetUsersAuthenticatedModule(p1):andThen(function(Result)
			-- upvalues: UserModule (upval), User (copy), IsLocalUserUnder13 (copy), CountryCode (copy), p2 (copy), GetLocalUserFunction (upval), PromiseModule (upval)
			local NewUser = UserModule.new(User.id, Result.responseBody.name, User.membership.Value, IsLocalUserUnder13, CountryCode, Result.responseBody.displayName)
			NewUser:setToLocalPlayer()
			NewUser:setToLocalStorage()
			p2:dispatch(GetLocalUserFunction())
			
			return PromiseModule.resolve()
		end, function(p3)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("Failed to update local user info")
			
			return PromiseModule.reject(p3)
		end)
	end
end