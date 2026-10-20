local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), EventNamesModule (copy), AppPage (copy), Contexts (copy)
	local UseNavigationResult = UseNavigationFunction()
	local School = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader).school
	local UseLocalizationResult = UseLocalizationFunction({ classmates = TextKeysModule.Classmates })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: School (copy), UseLocalizationResult (copy)
		return if if School then School.isSameSchool else nil then UseLocalizationResult.classmates else nil
	end, { School, UseLocalizationResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), EventNamesModule (upval), UseNavigationResult (copy), AppPage (upval), Contexts (upval)
		p1.fireAnalyticsEvent(EventNamesModule.SchoolButton)
		UseNavigationResult.navigate(AppPage.Schools, { extraProps = { source = Contexts.PlayerProfile } })
	end, { p1, UseNavigationResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseResult (copy)
		return if UseMemoResult == nil then nil else {
			layoutOrder = 0,
			isDisabled = false,
			text = UseMemoResult,
			onActivated = UseResult
		}
	end, { UseMemoResult, UseResult })
end