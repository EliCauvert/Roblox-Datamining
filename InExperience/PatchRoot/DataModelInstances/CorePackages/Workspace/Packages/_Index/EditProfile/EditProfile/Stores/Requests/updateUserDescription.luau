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

return function(Description) --[[ Line: 20 | Named "updateUserDescription" ]]
	-- upvalues: Url (copy), ConfigResult (copy), EnumsModule (copy), HttpService (copy), PromiseModule (copy)
	return ConfigResult(string.format("%s/description", Url.USERS_URL), EnumsModule.RequestMethods.POST, {
		postBody = HttpService:JSONEncode({ description = Description })
	}):andThen(function(Result) --[[ Line: 28 ]]
		-- upvalues: Description (copy)
		return Result.responseBody and Result.responseBody.description or Description
	end):catch(function(Err) --[[ Line: 31 ]]
		-- upvalues: HttpService (upval), PromiseModule (upval)
		if not Err then
			return PromiseModule.reject(Err)
		end
		local config = { statusCode = Err.StatusCode, errors = {} }
		
		if Err.Body then
			local Success, Result = pcall(function() --[[ Line: 38 ]]
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