local analyticsFeedNoopShimModule = require(script.AnalyticsFeedNoopShim)

local function NoopComponent() --[[ line: 23 ]]
	return nil
end

local var2 = function() --[[ line: 27 ]] end

local function noopRegisterSection(_) --[[ line: 28 ]]
	-- upvalues: var2 (ref)
	return var2
end

local function noopRegisterSections(_) --[[ line: 31 ]]
	-- upvalues: var2 (ref)
	return var2
end

local function noopGetRootSignal() --[[ line: 36 ]]
	return {
		title = "root",
		leafId = nil,
		component = nil,
		order = 0,
		defaultCollapsed = nil,
		children = {}
	}
end

if _G.IS_PRODUCTION or script:FindFirstChild("DevOnly") == nil then
	return {
		["jest.config"] = script["jest.config"],
		DebugPanel = NoopComponent,
		registerSection = noopRegisterSection,
		registerSections = noopRegisterSections,
		getRootSignal = noopGetRootSignal,
		DebugPanelWindow = NoopComponent,
		DebugPanelSection = NoopComponent,
		AnalyticsFeed = analyticsFeedNoopShimModule
	}
end
local devOnly = script.DevOnly
local debugPanelSectionRegistryModule = require(devOnly.DebugPanelSectionRegistry)

return {
	["jest.config"] = script["jest.config"],
	DebugPanel = require(devOnly.DebugPanel),
	registerSection = debugPanelSectionRegistryModule.registerSection,
	registerSections = debugPanelSectionRegistryModule.registerSections,
	getRootSignal = debugPanelSectionRegistryModule.getRootSignal,
	DebugPanelWindow = require(devOnly.DebugPanelWindow),
	DebugPanelSection = require(devOnly.DebugPanelSection),
	AnalyticsFeed = require(devOnly.AnalyticsFeed)
}