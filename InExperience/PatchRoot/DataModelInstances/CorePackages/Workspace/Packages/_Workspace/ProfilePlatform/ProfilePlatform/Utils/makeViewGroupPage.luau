local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.NavigationRodux)
local ResponsiveModule = require(Parent.Responsive)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagEnableGroupOverviewPane = require(Parent.SharedFlags).FFlagEnableGroupOverviewPane
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources

return function(GroupId, OnClose)
	-- upvalues: ResponsiveModule (copy), FFlagEnableGroupOverviewPane (copy), AppPage (copy), Sources (copy), UrlBuilder (copy), TextKeysModule (copy)
	local IsPreferredInputTypeMatch = ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false) == ResponsiveModule.Input.Directional
	
	return if FFlagEnableGroupOverviewPane and not IsPreferredInputTypeMatch then {
		name = AppPage.Groups,
		extraProps = { groupId = GroupId, source = Sources.ProfilePlatform }
	} else {
		name = AppPage.GenericWebPage,
		detail = UrlBuilder.user.group({ groupId = GroupId }),
		extraProps = { titleKey = TextKeysModule.Community, onClose = OnClose }
	}
end