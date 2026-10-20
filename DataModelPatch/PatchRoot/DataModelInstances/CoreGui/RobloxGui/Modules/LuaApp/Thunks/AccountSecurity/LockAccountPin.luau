local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PostLockAccountPinModule = require(Modules.LuaApp.Http.Requests.PostLockAccountPin)
local PromiseModule = require(Modules.LuaApp.Promise)
local _Enum = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError).Enum

return function(p1)
	-- upvalues: PostLockAccountPinModule (copy), PromiseModule (copy), _Enum (copy), HttpService (copy)
	return function(_)
		-- upvalues: PostLockAccountPinModule (upval), p1 (copy), PromiseModule (upval), _Enum (upval), HttpService (upval)
		return PostLockAccountPinModule(p1):andThen(function(Result)
			return Result.responseBody
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval), _Enum (upval), HttpService (upval)
			return if Err.Body then PromiseModule.reject(_Enum.fromRawValue(HttpService:JSONDecode(Err.Body).errors[1].code) or _Enum.Default) else PromiseModule.reject(_Enum.Default)
		end)
	end
end