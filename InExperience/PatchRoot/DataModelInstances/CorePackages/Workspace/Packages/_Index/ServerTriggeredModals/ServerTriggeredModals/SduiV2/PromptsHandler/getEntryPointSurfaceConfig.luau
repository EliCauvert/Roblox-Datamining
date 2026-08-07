local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local promptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local fFlagEdpGameLeavePromptsHandlerEnabled = require(parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled
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
	},
	[promptsEntryPointModule.ExperienceDetailsPageSessionEnd] = if fFlagEdpGameLeavePromptsHandlerEnabled then {
		surfaceKey = "ExperienceDetailsPrompts",
		appPage = appPage.ExperienceDetail,
		configKey = "Prompts" .. promptsEntryPointModule.ExperienceDetailsPageSessionEnd
	} else nil
}

return function(p0, p1) --[[ line: 78 | named "getEntryPointSurfaceConfig" ]]
	-- upvalues: t (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref)
	local var2 = t[p0]
	assert(var2 ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	return if fFlagEdpGameLeavePromptsHandlerEnabled and p1 ~= nil then {
		appPage = var2.appPage,
		surfaceKey = var2.surfaceKey,
		configKey = `{var2.configKey}-{p1}`
	} else var2
end