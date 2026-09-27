local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(parent.NavigationRodux)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagEnableGroupDetailPane = require(parent.SharedFlags).FFlagEnableGroupDetailPane
local sources = socialLuaAnalyticsModule.Analytics.Enums.Sources

return function(p1, p2)
	-- upvalues: fFlagEnableGroupDetailPane (ref), appPage (ref), sources (ref), urlBuilder (ref), textKeysModule (ref)
	return if fFlagEnableGroupDetailPane then {
		name = appPage.Groups,
		extraProps = { groupId = p1, source = sources.ProfilePlatform }
	} else {
		name = appPage.GenericWebPage,
		detail = urlBuilder.user.group({ groupId = p1 }),
		extraProps = { titleKey = textKeysModule.Community, onClose = p2 }
	}
end