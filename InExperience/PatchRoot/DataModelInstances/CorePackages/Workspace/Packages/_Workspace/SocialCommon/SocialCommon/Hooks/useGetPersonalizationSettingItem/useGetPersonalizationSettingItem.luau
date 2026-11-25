local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local SocialPersonalizationSurfaceKeysModule = require(SocialCommon.Enums.SocialPersonalizationSurfaceKeys)
local Gear = require(Parent.Foundation).Enums.IconName.Gear
local config = {
	[SocialPersonalizationSurfaceKeysModule.Friends_AddFriends_PeopleYouMayKnow] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsFriendsAddFriendsPeopleYouMayKnow()
	end,
	[SocialPersonalizationSurfaceKeysModule.Friends_AddFriends_Search] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsFriendsAddFriendsSearch()
	end,
	[SocialPersonalizationSurfaceKeysModule.Search_Omnisearch_People] = function(p1)
		return p1.getShowInContextPersonalizedRecommendationsSearchOmnisearchPeople()
	end
}

return function(p1)
	-- upvalues: UseAppPolicyFunction (copy), config (copy), UseLocalizationFunction (copy), ReactModule (copy), Gear (copy)
	local SurfaceKey = p1.surfaceKey
	local OpenPersonalizationSettingsFunction = p1.openPersonalizationSettings
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		-- upvalues: config (upval), SurfaceKey (copy)
		if p2.getShowInContextPersonalizedRecommendationsSettings() then
			local Entry = config[SurfaceKey]
			
			return if Entry then Entry(p2) else false
		else
			return false
		end
	end)
	local PersonalizationSettingsLabel = UseLocalizationFunction({
		personalizationSettingsLabel = "Feature.AccountSettings.Heading.Tab.PersonalizedRecommendations"
	}).personalizationSettingsLabel
	
	return ReactModule.useMemo(function()
		-- upvalues: UseAppPolicyResult (copy), Gear (upval), PersonalizationSettingsLabel (copy), OpenPersonalizationSettingsFunction (copy), SurfaceKey (copy)
		return if UseAppPolicyResult then {
			id = "personalizationSettings",
			icon = Gear,
			text = PersonalizationSettingsLabel,
			onActivated = function()
				-- upvalues: OpenPersonalizationSettingsFunction (upval), SurfaceKey (upval)
				OpenPersonalizationSettingsFunction(SurfaceKey)
			end
		} else nil
	end, {
		UseAppPolicyResult,
		PersonalizationSettingsLabel,
		SurfaceKey,
		OpenPersonalizationSettingsFunction
	})
end