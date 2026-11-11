local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PostUnlockAccountPinModule = require(Modules.LuaApp.Http.Requests.PostUnlockAccountPin)
local PromiseModule = require(Modules.LuaApp.Promise)
local _Enum = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError).Enum

return function(p1, p2)
	-- upvalues: PostUnlockAccountPinModule (copy), PromiseModule (copy), _Enum (copy), HttpService (copy)
	return function(_)
		-- upvalues: PostUnlockAccountPinModule (upval), p1 (copy), p2 (copy), PromiseModule (upval), _Enum (upval), HttpService (upval)
		return PostUnlockAccountPinModule(p1, p2):andThen(function(Result)
			return Result.responseBody
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval), _Enum (upval), HttpService (upval)
			return if Err.Body then PromiseModule.reject(_Enum.fromRawValue(HttpService:JSONDecode(Err.Body).errors[1].code) or _Enum.Default) else PromiseModule.reject(_Enum.Default)
		end)
	end
end