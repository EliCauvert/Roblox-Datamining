local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local fetchInternalModule = require(avatarExperienceProfilePictureEditor.Api.fetchInternal)
local getEmoteRecommendationsModule = require(avatarExperienceProfilePictureEditor.Shared.getEmoteRecommendations)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)

return function()
	-- upvalues: reactModule (ref), getEmoteRecommendationsModule (ref), fetchInternalModule (ref), enumsModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState(true)
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: getEmoteRecommendationsModule (copy), fetchInternalModule (copy), enumsModule (copy), var2 (ref), var4 (ref), var6 (ref)
		local var7 = false
		fetchInternalModule(getEmoteRecommendationsModule.getEmoteRecommendationsUrl(), enumsModule.RequestMethods.GET):andThen(function(p1)
			-- upvalues: var7 (write), var2 (copy), getEmoteRecommendationsModule (copy), var4 (copy)
			if var7 then
				return
			end
			var2(getEmoteRecommendationsModule.parseEmoteRecommendationsResponse(p1.responseBody))
			var4(false)
		end):catch(function()
			-- upvalues: var7 (write), var6 (copy), var4 (copy)
			if var7 then
				return
			end
			var6(true)
			var4(false)
		end)
		
		return function()
			-- upvalues: var7 (write)
			var7 = true
		end
	end, {})
	
	return {
		recommendedEmotes = var1,
		isLoading = var3,
		hasError = var5
	}
end