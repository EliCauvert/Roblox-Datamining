local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local config = {
	badgeCount = 0,
	page = AppPageModule.Home,
	icon = { on = "icons/menu/home_on", off = "icons/menu/home_off" },
	actionType = Enum.AppShellActionType.TapHomePageTab
}
local config1 = {
	badgeCount = 0,
	page = AppPageModule.AvatarExperienceRoot,
	iconComponent = require(Modules.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon),
	actionType = Enum.AppShellActionType.TapAvatarTab
}
local config2 = {
	badgeCount = 0,
	page = AppPageModule.Chat,
	icon = { on = "icons/menu/chat_on", off = "icons/menu/chat_off" },
	actionType = Enum.AppShellActionType.TapChatTab
}
local config3 = {
	actionType = nil,
	badgeCount = 0,
	page = AppPageModule.More,
	icon = { on = "icons/menu/more_on", off = "icons/menu/more_off" }
}
local list = {
	config,
	{
		badgeCount = 0,
		page = AppPageModule.Games,
		icon = { on = "icons/menu/games_on", off = "icons/menu/games_off" },
		actionType = Enum.AppShellActionType.TapGamePageTab
	},
	config1,
	config2,
	config3
}
local list1 = {
	config,
	{
		actionType = nil,
		badgeCount = 0,
		page = AppPageModule.Games,
		icon = { on = "icons/menu/search_on", off = "icons/menu/search" }
	},
	config1,
	config2,
	config3
}
local list2 = { config, config1, config2, config3 }

return function(p1)
	-- upvalues: list (copy), list1 (copy), list2 (copy)
	assert(typeof(p1) == "number", "variant must be a number")
	local list3 = list
	
	if p1 == 0 then
		list3 = list
	elseif p1 == 1 then
		list3 = list1
	elseif p1 == 2 then
		list3 = list2
	else
		warn("Invalid variant requested for bottom bar, returning control")
	end
	local t = {}
	
	for i, value in ipairs(list3) do
		t[value.page] = i
	end
	return list3, t
end