local appPage = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.RobloxAppEnums).AppPage
local promptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local t = {
	[promptsEntryPointModule.HomepageLaunch] = if game:DefineFastFlag("LuaAppPromptsHomepageConfigName", false) then {
		surfaceKey = "Prompts",
		appPage = appPage.Home,
		configKey = "Prompts" .. promptsEntryPointModule.HomepageLaunch
	} else {
		appPage = appPage.Home,
		surfaceKey = appPage.Home,
		configKey = appPage.Home
	},
	[promptsEntryPointModule.SelfUserProfileOpen] = {
		configKey = "ProfileCompletion",
		appPage = appPage.ProfilePlatform,
		surfaceKey = appPage.ProfilePlatform
	},
	[promptsEntryPointModule.ChartsLaunch] = {
		surfaceKey = "ChartsPrompts",
		appPage = appPage.Games,
		configKey = "Prompts" .. promptsEntryPointModule.ChartsLaunch
	}
}

return function(p0) --[[ line: 70 | named "getEntryPointSurfaceConfig" ]]
	-- upvalues: t (ref)
	local var2 = t[p0]
	assert(var2 ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	return var2
end