local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.DataHydration)
local enumsModule = require(editProfile.Common.Enums)
local url = httpModule.Url
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(p1)
	-- upvalues: url (ref), var1 (ref), enumsModule (ref)
	return var1(string.format("%s/users/%s", url.USERS_URL, p1), enumsModule.RequestMethods.GET):andThen(function(p2)
		return p2.responseBody.description or ""
	end):catch(function(p2)
		error(p2)
	end)
end