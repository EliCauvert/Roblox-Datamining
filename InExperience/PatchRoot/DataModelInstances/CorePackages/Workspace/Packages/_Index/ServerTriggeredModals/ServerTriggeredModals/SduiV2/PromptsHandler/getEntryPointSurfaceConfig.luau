local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local promptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEdpGameLeavePromptsHandlerEnabled = sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local t = {
	[promptsEntryPointModule.HomepageLaunch] = if game:DefineFastFlag("LuaAppPromptsHomepageConfigName", false) or sharedFlagsModule.FFlagLuaAppEnableSduiHomePage then {
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
	},
	[promptsEntryPointModule.ExperienceDetailsPageSessionEnd] = if fFlagEdpGameLeavePromptsHandlerEnabled then {
		surfaceKey = "ExperienceDetailsPrompts",
		appPage = appPage.ExperienceDetail,
		configKey = "Prompts" .. promptsEntryPointModule.ExperienceDetailsPageSessionEnd
	} else nil
}

return function(p0, p1) --[[ line: 80 | named "getEntryPointSurfaceConfig" ]]
	-- upvalues: t (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref)
	local var3 = t[p0]
	assert(var3 ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	return if fFlagEdpGameLeavePromptsHandlerEnabled and p1 ~= nil then {
		appPage = var3.appPage,
		surfaceKey = var3.surfaceKey,
		configKey = `{var3.configKey}-{p1}`
	} else var3
end