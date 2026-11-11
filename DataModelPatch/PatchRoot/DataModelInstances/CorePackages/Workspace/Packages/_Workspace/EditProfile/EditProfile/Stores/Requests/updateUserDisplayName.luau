local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local EnumsModule = require(EditProfile.Common.Enums)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1, NewDisplayName)
	-- upvalues: Url (copy), ConfigResult (copy), EnumsModule (copy), HttpService (copy), PromiseModule (copy)
	return ConfigResult(string.format("%s/users/%s/display-names", Url.USERS_URL, p1), EnumsModule.RequestMethods.PATCH, {
		postBody = HttpService:JSONEncode({ newDisplayName = NewDisplayName })
	}):andThen(function(Result)
		-- upvalues: NewDisplayName (copy)
		return Result.responseBody and Result.responseBody.displayName or NewDisplayName
	end):catch(function(Err)
		-- upvalues: HttpService (upval), PromiseModule (upval)
		if not Err then
			return PromiseModule.reject(Err)
		end
		local config = { statusCode = Err.StatusCode, errors = {} }
		
		if Err.Body then
			local Success, Result = pcall(function()
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