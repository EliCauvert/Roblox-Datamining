local Images = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local PagesByIndex = {
	{
		navigationDepth = 1,
		parentPage = nil,
		key = ConstantsModule.InitalPageKey,
		component = script.InitalPage
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = ConstantsModule.MainPagePageKey,
		component = script.Parent.MainPage
	},
	{
		key = "Players",
		title = "CoreScripts.InGameMenu.PageTitle.Players",
		navigationDepth = 2,
		icon = Images["icons/controls/players"],
		component = script.PlayersPage,
		parentPage = ConstantsModule.MainPagePageKey
	},
	{
		key = "InviteFriends",
		title = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
		navigationDepth = 2,
		icon = Images["icons/actions/friends/friendInvite"],
		component = script.Parent.InviteFriendsPage,
		parentPage = ConstantsModule.MainPagePageKey
	},
	{
		key = "GameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		navigationDepth = 2,
		icon = Images["icons/common/settings"],
		component = script.Parent.GameSettingsPage.BasicPage,
		parentPage = ConstantsModule.MainPagePageKey
	},
	{
		key = "Report",
		title = "CoreScripts.InGameMenu.PageTitle.Report",
		navigationDepth = 2,
		icon = Images["icons/actions/feedback"],
		component = script.Parent.ReportPage,
		parentPage = ConstantsModule.MainPagePageKey
	},
	{
		key = "Controls",
		title = "CoreScripts.InGameMenu.PageTitle.Controls",
		isModal = true,
		navigationDepth = 2,
		icon = Images["icons/controls/controls"],
		component = script.Parent.ControlsPage,
		parentPage = ConstantsModule.MainPagePageKey
	},
	{
		key = "AdvancedGameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		isSecondaryPage = true,
		navigationDepth = 3,
		parentPage = "GameSettings",
		icon = Images["icons/menu/settings_large"],
		component = script.Parent.GameSettingsPage.AdvancedPage
	},
	{
		key = "VRGameSettings",
		title = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings",
		isSecondaryPage = true,
		navigationDepth = 3,
		parentPage = "GameSettings",
		icon = Images["icons/menu/settings_large"],
		component = script.Parent.GameSettingsPage.VRComfortSettingsPage
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = ConstantsModule.LeaveToAppPromptPageKey,
		component = script.Dialog.LeaveToAppPrompt
	},
	{
		navigationDepth = 1,
		parentPage = nil,
		key = ConstantsModule.LeaveGamePromptPageKey,
		component = script.Dialog.LeaveGamePrompt
	}
}
local PagesByKey = {}

for Index, value in ipairs(PagesByIndex) do
	value.index = Index
	assert(PagesByKey[value.key] == nil, ("page key %s is duplicated"):format(value.key))
	PagesByKey[value.key] = value
end
return { pagesByIndex = PagesByIndex, pagesByKey = PagesByKey }