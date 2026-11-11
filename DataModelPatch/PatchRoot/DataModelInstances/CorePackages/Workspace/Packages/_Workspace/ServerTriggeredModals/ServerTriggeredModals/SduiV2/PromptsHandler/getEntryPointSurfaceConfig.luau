local AppPage = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.RobloxAppEnums).AppPage
local PromptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local config = {
	[PromptsEntryPointModule.HomepageLaunch] = if game:DefineFastFlag("LuaAppPromptsHomepageConfigName", false) then {
		surfaceKey = "Prompts",
		appPage = AppPage.Home,
		configKey = "Prompts" .. PromptsEntryPointModule.HomepageLaunch
	} else {
		appPage = AppPage.Home,
		surfaceKey = AppPage.Home,
		configKey = AppPage.Home
	},
	[PromptsEntryPointModule.SelfUserProfileOpen] = {
		configKey = "ProfileCompletion",
		appPage = AppPage.ProfilePlatform,
		surfaceKey = AppPage.ProfilePlatform
	},
	[PromptsEntryPointModule.ChartsLaunch] = {
		surfaceKey = "ChartsPrompts",
		appPage = AppPage.Games,
		configKey = "Prompts" .. PromptsEntryPointModule.ChartsLaunch
	}
}

return function(p1)
	-- upvalues: config (copy)
	local Entry = config[p1]
	assert(Entry ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	return Entry
end