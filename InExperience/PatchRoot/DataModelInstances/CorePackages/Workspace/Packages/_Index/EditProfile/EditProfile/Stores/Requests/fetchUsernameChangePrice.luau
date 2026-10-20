local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local EnumsModule = require(EditProfile.Common.Enums)
local Url = require(Parent.Http).Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(_)
	-- upvalues: Url (copy), ConfigResult (copy), EnumsModule (copy)
	return ConfigResult(string.format("%sv1/username/change/price", Url.AUTH_URL), EnumsModule.RequestMethods.GET):andThen(function(Result)
		local ResponseBody = Result.responseBody
		
		return {
			priceInRobux = ResponseBody.priceInRobux,
			isFreeUsernameChange = ResponseBody.isFreeUsernameChange == true
		}
	end)
end