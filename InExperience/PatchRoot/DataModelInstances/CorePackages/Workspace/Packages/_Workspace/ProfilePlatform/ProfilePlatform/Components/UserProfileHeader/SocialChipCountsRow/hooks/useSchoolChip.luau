local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local navigationModule = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useNavigation = navigationModule.useNavigation
local useLocalization = localizationModule.Hooks.useLocalization
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts

return function(p0) --[[ line: 24 | named "useSchoolChip" ]]
	-- upvalues: useNavigation (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), appPage (ref), contexts (ref)
	local var9 = useNavigation()
	local school = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).school
	local var10 = useLocalization({ classmates = textKeysModule.Classmates })
	local var11 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: school (ref), var10 (ref)
		return if if school then school.isSameSchool else nil then var10.classmates else nil
	end, { school, var10 })
	local var12 = reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: p0 (ref), eventNamesModule (copy), var9 (ref), appPage (copy), contexts (copy)
		p0.fireAnalyticsEvent(eventNamesModule.SchoolButton)
		var9.navigate(appPage.Schools, { extraProps = { source = contexts.PlayerProfile } })
	end, { p0, var9 })
	
	return reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: var11 (ref), var12 (ref)
		return if var11 == nil then nil else {
			layoutOrder = 0,
			isDisabled = false,
			text = var11,
			onActivated = var12
		}
	end, { var11, var12 })
end