local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local HttpModule = require(Parent.Http)
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.DataHydration)
local EnumsModule = require(EditProfile.Common.Enums)
local HttpService = game:GetService("HttpService")
local FFlagEditProfileUseProfilePlatformBioModule = require(EditProfile.Flags.FFlagEditProfileUseProfilePlatformBio)
local Url = HttpModule.Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

return function(ProfileId)
	-- upvalues: FFlagEditProfileUseProfilePlatformBioModule (copy), ConfigResult (copy), Url (copy), EnumsModule (copy), HttpService (copy)
	return if FFlagEditProfileUseProfilePlatformBioModule then ConfigResult(Url.APIS_URL .. "profile-platform-api/v1/profiles/get", EnumsModule.RequestMethods.POST, {
		postBody = HttpService:JSONEncode({
			profileType = "User",
			includeComponentOrdering = false,
			profileId = ProfileId,
			components = { { component = "About" } }
		})
	}):andThen(function(Result)
		local Components = Result.responseBody.components
		local About = Components and Components.About
		
		return About and About.description or ""
	end) else ConfigResult(string.format("%s/users/%s", Url.USERS_URL, ProfileId), EnumsModule.RequestMethods.GET):andThen(function(Result)
		return Result.responseBody.description or ""
	end):catch(function(Err)
		error(Err)
	end)
end