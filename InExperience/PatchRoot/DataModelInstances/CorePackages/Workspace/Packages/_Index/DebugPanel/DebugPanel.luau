local AnalyticsFeedNoopShimModule = require(script.AnalyticsFeedNoopShim)

local function NoopComponent()
	return nil
end

local function v2() end

local function noopRegisterSection(_)
	-- upvalues: v2 (copy)
	return v2
end

local function noopRegisterSections(_)
	-- upvalues: v2 (copy)
	return v2
end

local function noopGetRootSignal()
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