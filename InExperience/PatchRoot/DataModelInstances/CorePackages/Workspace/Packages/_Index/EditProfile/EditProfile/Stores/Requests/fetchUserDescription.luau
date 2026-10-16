local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.DataHydration)
local EnumsModule = require(EditProfile.Common.Enums)
local Url = require(Parent.Http).Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 16 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1) --[[ Line: 21 | Named "fetchUserDescription" ]]
	-- upvalues: Url (copy), ConfigResult (copy), EnumsModule (copy)
	return ConfigResult(string.format("%s/users/%s", Url.USERS_URL, p1), EnumsModule.RequestMethods.GET):andThen(function(Result) --[[ Line: 25 ]]
		return Result.responseBody.description or ""
	end):catch(function(Err) --[[ Line: 28 ]]
		error(Err)
	end)
end