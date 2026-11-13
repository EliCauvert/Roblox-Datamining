local _ = require("../vendor/compose/core")
local ThemesModule = require("./themes")
local _ = require("./types")
local SelectionModule = require("./selection")
local ContextConfigModule = require("./context_config")
local ContextConstructModule = require("./context_construct")
local ContextMetricsModule = require("./context_metrics")
local ContextObserveModule = require("./context_observe")
local ContextEnvironmentModule = require("./context_environment")
local ContextContentModule = require("./context_content")
local ContextNativeModule = require("./context_native")
local ContextActionsModule = require("./context_actions")
local InputReadModule = require("./input_read")
local SourceReadModule = require("./source_read")

return function(Compose, Runtime, p1)
	-- upvalues: ContextConfigModule (copy), ThemesModule (copy), ContextConstructModule (copy), InputReadModule (copy), SourceReadModule (copy), ContextMetricsModule (copy), ContextObserveModule (copy), ContextEnvironmentModule (copy), ContextContentModule (copy), ContextNativeModule (copy), ContextActionsModule (copy), SelectionModule (copy)
	local ContextConfigModuleResult, ContextConfigModuleResult2, ContextConfigModuleResult3 = ContextConfigModule(Compose, Runtime, p1)
	local Theme = ContextConfigModuleResult.theme
	local Constructors = Runtime.constructors
	local ThemesModuleResult = ThemesModule(Compose)
	local config = {
		runtime = Runtime,
		Host = Constructors,
		Compose = Compose,
		types = ContextConfigModuleResult2,
		config = ContextConfigModuleResult,
		metrics = {
			textSize = 16,
			controlHeight = 36,
			gap = 8,
			cornerRadius = 8
		},
		overlayHosts = setmetatable({}, { __mode = "k" })
	}
	Runtime:watch(function()
		-- upvalues: config (copy), Compose (copy)
		config.lifetime = assert(Compose.currentOwner())
	end)
	local ContextConstructModuleResult: (any) -> () = ContextConstructModule(config)
	config.read = InputReadModule(Compose.isValue)
	config.readSource = SourceReadModule
	
	local function live(Callback)
		-- upvalues: Compose (copy)
		return Compose.isValue(Callback) or type(Callback) == "function"
	end
	
	local ContextMetricsModuleResult = ContextMetricsModule(config, ContextConfigModuleResult, ThemesModuleResult)
	local ContextObserveModuleResult = ContextObserveModule(config, ContextConfigModuleResult, ContextConfigModuleResult3)
	ContextEnvironmentModule(config, ContextConfigModuleResult, ThemesModuleResult, ContextObserveModuleResult.preview, ContextMetricsModuleResult.metricAt, ContextMetricsModuleResult.setDistance)
	ContextContentModule(config, ContextConfigModuleResult, ContextConfigModuleResult3, ThemesModuleResult, live)
	ContextNativeModule(config, ContextConfigModuleResult, ContextConfigModuleResult3, ThemesModuleResult, ContextObserveModuleResult.observeStyled, Theme)
	ContextActionsModule(config, ContextConfigModuleResult)
	local SelectionModuleResult = SelectionModule(config)
	local SpaceActivates = SelectionModuleResult.spaceActivates
	config.responder = SelectionModuleResult.responder
	config.spaceActivates = SpaceActivates
	ContextConstructModuleResult(SelectionModuleResult.track)
	
	return config
end