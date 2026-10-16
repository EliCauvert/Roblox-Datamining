local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ReactModule = require(AvatarExperienceProfilePictureEditor.Parent.React)
local FetchInternalModule = require(AvatarExperienceProfilePictureEditor.Api.fetchInternal)
local GetEmoteRecommendationsModule = require(AvatarExperienceProfilePictureEditor.Shared.getEmoteRecommendations)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)

return function() --[[ Line: 16 | Named "useRecommendedEmotes" ]]
	-- upvalues: ReactModule (copy), GetEmoteRecommendationsModule (copy), FetchInternalModule (copy), EnumsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: GetEmoteRecommendationsModule (upval), FetchInternalModule (upval), EnumsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Flag = false
		FetchInternalModule(GetEmoteRecommendationsModule.getEmoteRecommendationsUrl(), EnumsModule.RequestMethods.GET):andThen(function(Result) --[[ Line: 26 ]]
			-- upvalues: Flag (ref), UseStateResult2 (upval), GetEmoteRecommendationsModule (upval), UseStateResult2_1 (upval)
			if not Flag then
				UseStateResult2(GetEmoteRecommendationsModule.parseEmoteRecommendationsResponse(Result.responseBody))
				UseStateResult2_1(false)
				
				return
			end
		end):catch(function() --[[ Line: 33 ]]
			-- upvalues: Flag (ref), UseStateResult2_2 (upval), UseStateResult2_1 (upval)
			if not Flag then
				UseStateResult2_2(true)
				UseStateResult2_1(false)
				
				return
			end
		end)
		
		return function() --[[ Line: 41 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return {
		recommendedEmotes = UseStateResult,
		isLoading = UseStateResult1,
		hasError = UseStateResult3
	}
end