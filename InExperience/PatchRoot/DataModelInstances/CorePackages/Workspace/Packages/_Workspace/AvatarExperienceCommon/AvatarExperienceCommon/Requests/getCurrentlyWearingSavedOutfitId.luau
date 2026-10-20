local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)

return function(Network)
	-- upvalues: HttpModule (copy), HttpClientModule (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "avatar-experience.get-currently-wearing-saved-outfit",
		legacy = true,
		url = `{HttpModule.Url.AVATAR_URL}v1/avatar/currently-wearing-saved-outfit`,
		network = Network,
		decode = function(p1)
			local SavedOutfitId = p1.savedOutfitId
			
			return if SavedOutfitId == nil then nil else tostring(SavedOutfitId)
		end
	}))
end