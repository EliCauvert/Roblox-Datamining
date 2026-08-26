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

return function(p1)
	-- upvalues: useNavigation (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), appPage (ref), contexts (ref)
	local var1 = useNavigation()
	local school = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader).school
	local var2 = useLocalization({ classmates = textKeysModule.Classmates })
	local var3 = reactModule.useMemo(function()
		-- upvalues: school (ref), var2 (ref)
		return if if school then school.isSameSchool else nil then var2.classmates else nil
	end, { school, var2 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), eventNamesModule (copy), var1 (ref), appPage (copy), contexts (copy)
		p1.fireAnalyticsEvent(eventNamesModule.SchoolButton)
		var1.navigate(appPage.Schools, { extraProps = { source = contexts.PlayerProfile } })
	end, { p1, var1 })
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		return if var3 == nil then nil else {
			layoutOrder = 0,
			isDisabled = false,
			text = var3,
			onActivated = var4
		}
	end, { var3, var4 })
end