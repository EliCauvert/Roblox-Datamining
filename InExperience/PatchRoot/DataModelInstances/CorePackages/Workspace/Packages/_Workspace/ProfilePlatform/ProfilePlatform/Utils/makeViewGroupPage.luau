local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.NavigationRodux)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagEnableGroupDetailPane = require(Parent.SharedFlags).FFlagEnableGroupDetailPane
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources

return function(GroupId, OnClose)
	-- upvalues: FFlagEnableGroupDetailPane (copy), AppPage (copy), Sources (copy), UrlBuilder (copy), TextKeysModule (copy)
	return if FFlagEnableGroupDetailPane then {
		name = AppPage.Groups,
		extraProps = { groupId = GroupId, source = Sources.ProfilePlatform }
	} else {
		name = AppPage.GenericWebPage,
		detail = UrlBuilder.user.group({ groupId = GroupId }),
		extraProps = { titleKey = TextKeysModule.Community, onClose = OnClose }
	}
end