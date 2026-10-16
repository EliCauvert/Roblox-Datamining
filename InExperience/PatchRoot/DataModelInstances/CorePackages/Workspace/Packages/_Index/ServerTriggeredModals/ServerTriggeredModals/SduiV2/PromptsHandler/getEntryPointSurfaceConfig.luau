local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local PromptsEntryPointModule = require(script.Parent.Parent.PromptsEntryPoint)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEdpGameLeavePromptsHandlerEnabled = SharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = SharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled
local FFlagLuaAppEnableSduiHomePage = SharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local config = {
	[PromptsEntryPointModule.HomepageLaunch] = if game:DefineFastFlag("LuaAppPromptsHomepageConfigName", false) or FFlagLuaAppEnableSduiHomePage then {
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
	},
	[PromptsEntryPointModule.ExperienceDetailsPageSessionEnd] = if FFlagEdpGameLeavePromptsHandlerEnabled then {
		surfaceKey = "ExperienceDetailsPrompts",
		appPage = AppPage.ExperienceDetail,
		configKey = "Prompts" .. PromptsEntryPointModule.ExperienceDetailsPageSessionEnd
	} else nil,
	[PromptsEntryPointModule.ExperienceDetailsPageOpen] = if FFlagEdpOpenPromptsHandlerEnabled then {
		surfaceKey = "ExperienceDetailsOpenPrompts",
		appPage = AppPage.ExperienceDetail,
		configKey = "Prompts" .. PromptsEntryPointModule.ExperienceDetailsPageOpen
	} else nil
}

return function(p1, p2) --[[ Line: 88 | Named "getEntryPointSurfaceConfig" ]]
	-- upvalues: config (copy), FFlagEdpGameLeavePromptsHandlerEnabled (copy), FFlagEdpOpenPromptsHandlerEnabled (copy)
	local Entry = config[p1]
	assert(Entry ~= nil, `PromptsHandler: missing surface config for entry point "{p0}"`)
	
	if (FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled) and p2 ~= nil then
		return {
			appPage = Entry.appPage,
			surfaceKey = Entry.surfaceKey,
			configKey = `{Entry.configKey}-{p2}`
		}
	else
		return Entry
	end
end