local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.DataHydration)
local enumsModule = require(editProfile.Common.Enums)
local url = httpModule.Url
local var4 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})

return function(p3)
	-- upvalues: url (ref), var4 (ref), enumsModule (ref)
	return var4(string.format("%s/users/%s", url.USERS_URL, p3), enumsModule.RequestMethods.GET):andThen(function(p5)
		return p5.responseBody.description or ""
	end):catch(function(p4)
		error(p4)
	end)
end