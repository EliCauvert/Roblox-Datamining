local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local promptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local sharedFlagsModule = require(parent.SharedFlags)
local luaAppPromptsHomepageConfigName = game:DefineFastFlag("LuaAppPromptsHomepageConfigName", false)
local fFlagEdpGameLeavePromptsHandlerEnabled = sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local fFlagEdpOpenPromptsHandlerEnabled = sharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled
local t = {
	[promptsEntryPointModule.HomepageLaunch] = if luaAppPromptsHomepageConfigName or sharedFlagsModule.FFlagLuaAppEnableSduiHomePage then {
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
	} else nil,
	[promptsEntryPointModule.ExperienceDetailsPageOpen] = if fFlagEdpOpenPromptsHandlerEnabled then {
		surfaceKey = "ExperienceDetailsOpenPrompts",
		appPage = appPage.ExperienceDetail,
		configKey = "Prompts" .. promptsEntryPointModule.ExperienceDetailsPageOpen
	} else nil
}

return function(p1, p2)
	-- upvalues: t (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), fFlagEdpOpenPromptsHandlerEnabled (ref)
	local var1 = t[p1]
	assert(var1 ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	return if (fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled) and p2 ~= nil then {
		appPage = var1.appPage,
		surfaceKey = var1.surfaceKey,
		configKey = `{var1.configKey}-{p2}`
	} else var1
end