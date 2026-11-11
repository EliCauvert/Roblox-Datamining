local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Modules.LuaApp.Promise)
local HttpErrorModule = require(Modules.LuaApp.Http.HttpError)
local HttpResponseModule = require(Modules.LuaApp.Http.HttpResponse)

return function(Callback)
	-- upvalues: HttpService (copy), PromiseModule (copy), HttpErrorModule (copy), HttpResponseModule (copy)
	return function(p1, p2, p3)
		-- upvalues: Callback (copy), HttpService (upval), PromiseModule (upval), HttpErrorModule (upval), HttpResponseModule (upval)
		return (Callback(p1, p2, p3):andThen(function(Result)
			-- upvalues: HttpService (upval), PromiseModule (upval), HttpErrorModule (upval), p1 (copy), HttpResponseModule (upval)
			local Success, Result1 = pcall(HttpService.JSONDecode, HttpService, Result.responseBody)
			
			return if Success then HttpResponseModule.new(Result.requestUrl, Result1, Result.responseTimeMs, Result.responseCode) else PromiseModule.reject(HttpErrorModule.new(p1, HttpErrorModule.Kind.InvalidJson, (string.format("Cannot parse : %s", Result.responseBody or "nil"))))
		end))
	end
end