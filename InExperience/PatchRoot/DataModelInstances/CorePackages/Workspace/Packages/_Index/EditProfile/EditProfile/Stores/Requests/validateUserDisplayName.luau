local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local EnumsModule = require(EditProfile.Common.Enums)
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 15 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1, Input) --[[ Line: 20 | Named "validateUserDisplayName" ]]
	-- upvalues: Url (copy), HttpService (copy), ConfigResult (copy), EnumsModule (copy), PromiseModule (copy)
	return ConfigResult(string.format("%s?displayName=%s", string.format("%s/users/%s/display-names/validate", Url.USERS_URL, p1), HttpService:UrlEncode(Input)), EnumsModule.RequestMethods.GET):andThen(function(Result) --[[ Line: 25 ]]
		return Result.responseBody or {}
	end):catch(function(Err) --[[ Line: 28 ]]
		-- upvalues: HttpService (upval), PromiseModule (upval)
		if not Err then
			return PromiseModule.reject(Err)
		end
		local config = { statusCode = Err.StatusCode, errors = {} }
		
		if Err.Body then
			local Success, Result = pcall(function() --[[ Line: 35 ]]
				-- upvalues: HttpService (upval), Err (copy)
				return HttpService:JSONDecode(Err.Body)
			end)
			
			if Success and Result and Result.errors then
				config.errors = Result.errors
			end
		end
		return PromiseModule.reject(config)
	end)
end