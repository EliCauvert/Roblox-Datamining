local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local enumsModule = require(editProfile.Common.Enums)
local url = httpModule.Url
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(_)
	-- upvalues: url (ref), var1 (ref), enumsModule (ref)
	return var1(string.format("%sv1/username/change/price", url.AUTH_URL), enumsModule.RequestMethods.GET):andThen(function(p1)
		local responseBody = p1.responseBody
		
		return {
			priceInRobux = responseBody.priceInRobux,
			isFreeUsernameChange = responseBody.isFreeUsernameChange == true
		}
	end)
end