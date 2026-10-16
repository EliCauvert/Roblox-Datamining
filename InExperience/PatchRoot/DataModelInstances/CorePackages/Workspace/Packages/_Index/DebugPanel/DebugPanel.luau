local AnalyticsFeedNoopShimModule = require(script.AnalyticsFeedNoopShim)

local function NoopComponent() --[[ Line: 23 ]]
	return nil
end

local function v2() --[[ Line: 27 ]] end

local function noopRegisterSection(_) --[[ Line: 28 ]]
	-- upvalues: v2 (copy)
	return v2
end

local function noopRegisterSections(_) --[[ Line: 31 ]]
	-- upvalues: v2 (copy)
	return v2
end

local function noopGetRootSignal() --[[ Line: 36 ]]
	return {
		title = "root",
		leafId = nil,
		component = nil,
		order = 0,
		defaultCollapsed = nil,
		children = {}
	}
end

if _G.ENVIRONMENT == "PRODUCTION" or script:FindFirstChild("DevOnly") == nil then
	return {
		["jest.config"] = script["jest.config"],
		DebugPanel = NoopComponent,
		registerSection = noopRegisterSection,
		registerSections = noopRegisterSections,
		getRootSignal = noopGetRootSignal,
		DebugPanelWindow = NoopComponent,
		DebugPanelSection = NoopComponent,
		AnalyticsFeed = AnalyticsFeedNoopShimModule
	}
else
	local DevOnly = script.DevOnly
	local DebugPanelSectionRegistryModule = require(DevOnly.DebugPanelSectionRegistry)
	
	return {
		["jest.config"] = script["jest.config"],
		DebugPanel = require(DevOnly.DebugPanel),
		registerSection = DebugPanelSectionRegistryModule.registerSection,
		registerSections = DebugPanelSectionRegistryModule.registerSections,
		getRootSignal = DebugPanelSectionRegistryModule.getRootSignal,
		DebugPanelWindow = require(DevOnly.DebugPanelWindow),
		DebugPanelSection = require(DevOnly.DebugPanelSection),
		AnalyticsFeed = require(DevOnly.AnalyticsFeed)
	}
end