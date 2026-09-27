local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)

return function(p1)
	-- upvalues: httpModule (ref), httpClientModule (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "GET",
		analyticsKey = "avatar-experience.get-currently-wearing-saved-outfit",
		legacy = true,
		url = `{httpModule.Url.AVATAR_URL}v1/avatar/currently-wearing-saved-outfit`,
		network = p1,
		decode = function(p2)
			local savedOutfitId = p2.savedOutfitId
			
			return if savedOutfitId == nil then nil else tostring(savedOutfitId)
		end
	}))
end