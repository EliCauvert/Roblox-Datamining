local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local fetchInternalModule = require(avatarExperienceProfilePictureEditor.Api.fetchInternal)
local getEmoteRecommendationsModule = require(avatarExperienceProfilePictureEditor.Shared.getEmoteRecommendations)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)

return function() --[[ line: 16 | named "useRecommendedEmotes" ]]
	-- upvalues: reactModule (ref), getEmoteRecommendationsModule (ref), fetchInternalModule (ref), enumsModule (ref)
	local var5, var6 = reactModule.useState({})
	local var7, var8 = reactModule.useState(true)
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: getEmoteRecommendationsModule (copy), fetchInternalModule (copy), enumsModule (copy), var6 (ref), var8 (ref), var10 (ref)
		local var11 = false
		fetchInternalModule(getEmoteRecommendationsModule.getEmoteRecommendationsUrl(), enumsModule.RequestMethods.GET):andThen(function(p0) --[[ line: 26 ]]
			-- upvalues: var11 (write), var6 (copy), getEmoteRecommendationsModule (copy), var8 (copy)
			if var11 then
				return
			end
			var6(getEmoteRecommendationsModule.parseEmoteRecommendationsResponse(p0.responseBody))
			var8(false)
		end):catch(function() --[[ line: 33 ]]
			-- upvalues: var11 (write), var10 (copy), var8 (copy)
			if var11 then
				return
			end
			var10(true)
			var8(false)
		end)
		
		return function() --[[ line: 41 ]]
			-- upvalues: var11 (write)
			var11 = true
		end
	end, {})
	
	return {
		recommendedEmotes = var5,
		isLoading = var7,
		hasError = var9
	}
end