local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PostChangePasswordModule = require(Modules.LuaApp.Http.Requests.PostChangePassword)
local PromiseModule = require(Modules.LuaApp.Promise)
local _Enum = require(Modules.LuaApp.Enum.AccountSecurity.PasswordError).Enum

return function(p1, p2, p3)
	-- upvalues: PostChangePasswordModule (copy), PromiseModule (copy), _Enum (copy), HttpService (copy)
	return function(_)
		-- upvalues: PostChangePasswordModule (upval), p1 (copy), p2 (copy), p3 (copy), PromiseModule (upval), _Enum (upval), HttpService (upval)
		return PostChangePasswordModule(p1, p2, p3):andThen(function(Result)
			return Result.responseBody
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval), _Enum (upval), HttpService (upval)
			return if Err.Body then PromiseModule.reject(_Enum.fromRawValue(HttpService:JSONDecode(Err.Body).errors[1].code) or _Enum.Default) else PromiseModule.reject(_Enum.Default)
		end)
	end
end