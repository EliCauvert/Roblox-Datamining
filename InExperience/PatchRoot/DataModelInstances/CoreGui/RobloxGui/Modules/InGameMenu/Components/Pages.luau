local images = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local list = {
	{
		navigationDepth = 1,
		parentPage = nil,
		key = constantsModule.InitalPageKey,
		component = script.InitalPage
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = constantsModule.MainPagePageKey,
		component = script.Parent.MainPage
	},
	{
		key = "Players",
		title = "CoreScripts.InGameMenu.PageTitle.Players",
		navigationDepth = 2,
		icon = images["icons/controls/players"],
		component = script.PlayersPage,
		parentPage = constantsModule.MainPagePageKey
	},
	{
		key = "InviteFriends",
		title = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
		navigationDepth = 2,
		icon = images["icons/actions/friends/friendInvite"],
		component = script.Parent.InviteFriendsPage,
		parentPage = constantsModule.MainPagePageKey
	},
	{
		key = "GameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		navigationDepth = 2,
		icon = images["icons/common/settings"],
		component = script.Parent.GameSettingsPage.BasicPage,
		parentPage = constantsModule.MainPagePageKey
	},
	{
		key = "Report",
		title = "CoreScripts.InGameMenu.PageTitle.Report",
		navigationDepth = 2,
		icon = images["icons/actions/feedback"],
		component = script.Parent.ReportPage,
		parentPage = constantsModule.MainPagePageKey
	},
	{
		key = "Controls",
		title = "CoreScripts.InGameMenu.PageTitle.Controls",
		isModal = true,
		navigationDepth = 2,
		icon = images["icons/controls/controls"],
		component = script.Parent.ControlsPage,
		parentPage = constantsModule.MainPagePageKey
	},
	{
		key = "AdvancedGameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		isSecondaryPage = true,
		navigationDepth = 3,
		parentPage = "GameSettings",
		icon = images["icons/menu/settings_large"],
		component = script.Parent.GameSettingsPage.AdvancedPage
	},
	{
		key = "VRGameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings",
		isSecondaryPage = true,
		navigationDepth = 3,
		parentPage = "GameSettings",
		icon = images["icons/menu/settings_large"],
		component = script.Parent.GameSettingsPage.VRComfortSettingsPage
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = constantsModule.LeaveToAppPromptPageKey,
		component = script.Dialog.LeaveToAppPrompt
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = constantsModule.LeaveGamePromptPageKey,
		component = script.Dialog.LeaveGamePrompt
	}
}
local t = {}

for i, v in ipairs(list) do
	v.index = i
	assert(t[v.key] == nil, ("page key %s is duplicated"):format(v.key))
	t[v.key] = v
end
return { pagesByIndex = list, pagesByKey = t }