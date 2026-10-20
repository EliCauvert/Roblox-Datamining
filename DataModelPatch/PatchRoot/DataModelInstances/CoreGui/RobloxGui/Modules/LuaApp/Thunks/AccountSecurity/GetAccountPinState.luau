local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetAccountPinStateModule = require(Modules.LuaApp.Http.Requests.GetAccountPinState)
local _Enum = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError).Enum

return function(p1)
	-- upvalues: GetAccountPinStateModule (copy), PromiseModule (copy), _Enum (copy), HttpService (copy)
	return function(_)
		-- upvalues: GetAccountPinStateModule (upval), p1 (copy), PromiseModule (upval), _Enum (upval), HttpService (upval)
		return GetAccountPinStateModule(p1):andThen(function(Result)
			return Result.responseBody
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval), _Enum (upval), HttpService (upval)
			return if Err.Body then PromiseModule.reject(_Enum.fromRawValue(HttpService:JSONDecode(Err.Body).errors[1].code) or _Enum.Default) else PromiseModule.reject(_Enum.Default)
		end)
	end
end