local function NoopComponent()
	return nil
end

local function v1() end

local function noopRegisterSection(_)
	-- upvalues: v1 (copy)
	return v1
end

local function noopRegisterSections(_)
	-- upvalues: v1 (copy)
	return v1
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

if script:FindFirstChild("DevOnly") == nil then
	return {
		["jest.config"] = script:FindFirstChild("jest.config"),
		DebugPanel = NoopComponent,
		registerSection = noopRegisterSection,
		registerSections = noopRegisterSections,
		getRootSignal = noopGetRootSignal,
		DebugPanelWindow = NoopComponent,
		DebugPanelSection = NoopComponent
	}
else
	local DevOnly = script.DevOnly
	local DebugPanelSectionRegistryModule = require(DevOnly.DebugPanelSectionRegistry)
	
	return {
		["jest.config"] = script:FindFirstChild("jest.config"),
		DebugPanel = require(DevOnly.DebugPanel),
		registerSection = DebugPanelSectionRegistryModule.registerSection,
		registerSections = DebugPanelSectionRegistryModule.registerSections,
		getRootSignal = DebugPanelSectionRegistryModule.getRootSignal,
		DebugPanelWindow = require(DevOnly.DebugPanelWindow),
		DebugPanelSection = require(DevOnly.DebugPanelSection)
	}
end