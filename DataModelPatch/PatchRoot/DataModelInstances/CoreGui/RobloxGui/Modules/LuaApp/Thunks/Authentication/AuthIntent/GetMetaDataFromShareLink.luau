local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetShareLinkMetaDataModule = require(Modules.LuaApp.Http.Requests.GetShareLinkMetaData)
local HttpService = game:GetService("HttpService")

return function(p1, p2, p3)
	-- upvalues: GetShareLinkMetaDataModule (copy), HttpService (copy), PromiseModule (copy)
	return GetShareLinkMetaDataModule(p1, p2, p3):andThen(function(Result)
		-- upvalues: HttpService (upval), PromiseModule (upval)
		return if Result and Result.responseBody and Result.responseBody.data then PromiseModule.resolve((HttpService:JSONDecode(Result.responseBody.data))) else PromiseModule.reject()
	end, function(p4)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject({ p4.StatusCode })
	end)
end