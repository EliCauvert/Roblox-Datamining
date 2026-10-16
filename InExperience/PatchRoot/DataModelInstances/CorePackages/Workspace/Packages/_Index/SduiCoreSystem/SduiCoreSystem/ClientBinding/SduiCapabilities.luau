local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SduiCapabilityFlagsModule = require(SduiCoreSystem.ClientBinding.SduiCapabilityFlags)
local ResolveRuntimeFlagValuesModule = require(SduiCoreSystem.ClientBinding.resolveRuntimeFlagValues)

local function resolveNamesToNumbers(List) --[[ Line: 32 ]]
	-- upvalues: Parent (copy)
	if #List == 0 then
		return {}
	end
	local Capability = require(Parent.ServiceContractsProto).apppageplatform.shared.capability.Capability
	local List1 = {}
	
	for _, value in List do
		local FromNameResult = Capability.fromName(value)
		
		if FromNameResult == nil then
			warn(`SduiCapabilities: unknown capability name {value}`)
		else
			table.insert(List1, Capability.toNumber(FromNameResult))
		end
	end
	return List1
end

local SduiCapabilitiesModule = {
	isEnabled = function(p1): boolean --[[ Line: 18 ]]
		-- upvalues: SduiCapabilityFlagsModule (copy)
		return SduiCapabilityFlagsModule[p1] == true
	end,
	getEnabledCapabilities = function() --[[ Line: 22 ]]
		-- upvalues: SduiCapabilityFlagsModule (copy)
		local List = {}
		
		for i, value in SduiCapabilityFlagsModule do
			if value then
				table.insert(List, i)
			end
		end
		return List
	end,
	createQueryValue = function(EnabledCapabilities): string? --[[ Line: 52 ]]
		-- upvalues: resolveNamesToNumbers (copy)
		local ResolveNamesToNumbersResult = resolveNamesToNumbers(EnabledCapabilities)
		
		if #ResolveNamesToNumbersResult == 0 then
			return nil
		end
		table.sort(ResolveNamesToNumbersResult)
		local Buffer = table.create(#ResolveNamesToNumbersResult)
		
		for _, value in ResolveNamesToNumbersResult do
			table.insert(Buffer, (tostring(value)))
		end
		return table.concat(Buffer, ",")
	end
}

function SduiCapabilitiesModule.addToQueryParams(p1, List) --[[ Line: 72 ]]
	-- upvalues: SduiCapabilitiesModule (copy)
	local List1 = {}
	
	for _, value in List do
		if SduiCapabilitiesModule.isEnabled(value) then
			table.insert(List1, value)
		end
	end
	local QueryValue = SduiCapabilitiesModule.createQueryValue(List1)
	
	if QueryValue ~= nil then
		p1.enabledCapabilities = QueryValue
	end
end

function SduiCapabilitiesModule.getEnabledCapabilityNumbers(EnabledCapabilities) --[[ Line: 88 ]]
	-- upvalues: SduiCapabilitiesModule (copy), resolveNamesToNumbers (copy)
	local List = {}
	
	for _, enabledCapability in EnabledCapabilities do
		if SduiCapabilitiesModule.isEnabled(enabledCapability) then
			table.insert(List, enabledCapability)
		end
	end
	local ResolveNamesToNumbersResult = resolveNamesToNumbers(List)
	table.sort(ResolveNamesToNumbersResult)
	
	return ResolveNamesToNumbersResult
end

function SduiCapabilitiesModule.getEnabledCapabilityNumbersWithoutExtendedMarker() --[[ Line: 102 ]]
	-- upvalues: SduiCapabilitiesModule (copy)
	local List = {}
	
	for _, value in SduiCapabilitiesModule.getEnabledCapabilities() do
		if value ~= "CAPABILITY_SUPPORTS_EXTENDED_CLIENT_CAPABILITIES" then
			table.insert(List, value)
		end
	end
	return SduiCapabilitiesModule.getEnabledCapabilityNumbers(List)
end

function SduiCapabilitiesModule.addAllToQueryParams(p2) --[[ Line: 112 ]]
	-- upvalues: SduiCapabilitiesModule (copy)
	local QueryValue = SduiCapabilitiesModule.createQueryValue(SduiCapabilitiesModule.getEnabledCapabilities())
	
	if QueryValue ~= nil then
		p2.enabledCapabilities = QueryValue
	end
end

local function resolveRuntimeSupportNumbers(RegisteredActionTypes, ActionType, p2) --[[ Line: 125 ]]
	-- upvalues: SduiCoreSystem (copy)
	local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
	local List = {}
	
	for _, registeredActionType in RegisteredActionTypes do
		local MapLuaEnumFormatToProtoResult = ProtoVariableMapperModule.mapLuaEnumFormatToProto(registeredActionType, p2, ActionType)
		local NoMapLuaEnumFormatToProtoResult = MapLuaEnumFormatToProtoResult == nil
		local Number = nil
		
		if not NoMapLuaEnumFormatToProtoResult then
			Number = ActionType.toNumber(MapLuaEnumFormatToProtoResult)
			NoMapLuaEnumFormatToProtoResult = Number == 0
		end
		if not NoMapLuaEnumFormatToProtoResult then
			table.insert(List, Number)
		end
	end
	table.sort(List)
	
	return List
end

local Flag = false

local function _() --[[ Line: 143 | Named "getRuntimeFlagValues" ]]
	-- upvalues: ResolveRuntimeFlagValuesModule (copy), Flag (ref)
	local ResolveRuntimeFlagValuesModuleResult, ResolveRuntimeFlagValuesModuleResult2, ResolveRuntimeFlagValuesModuleResult3 = ResolveRuntimeFlagValuesModule(function(p3) --[[ Line: 144 ]]
		return pcall(game.GetFastFlag, game, p3)
	end)
	
	if not Flag and ResolveRuntimeFlagValuesModuleResult2 + ResolveRuntimeFlagValuesModuleResult3 > 0 then
		Flag = true
		warn(`SduiCapabilities: ignored {ResolveRuntimeFlagValuesModuleResult2} invalid runtime flag names and {ResolveRuntimeFlagValuesModuleResult3} unreadable flags`)
	end
	return ResolveRuntimeFlagValuesModuleResult
end

local function getRuntimeSupportFields() --[[ Line: 157 ]]
	-- upvalues: Parent (copy), resolveRuntimeSupportNumbers (copy), SduiCoreSystem (copy), ResolveRuntimeFlagValuesModule (copy), Flag (ref)
	local Shared = require(Parent.ServiceContractsProto).apppageplatform.shared
	local config = {
		registered_ui_component_types = resolveRuntimeSupportNumbers(require(SduiCoreSystem.getSduiComponentRegistry)().getRegisteredComponentTypes(), Shared.ui_component_type.UiComponentType, "UI_COMPONENT_TYPE_"),
		registered_action_types = resolveRuntimeSupportNumbers(require(SduiCoreSystem.getSduiActionHandlerRegistry)().getRegisteredActionTypes(), Shared.actions.ActionType, "ACTION_TYPE_")
	}
	local ResolveRuntimeFlagValuesModuleResult, ResolveRuntimeFlagValuesModuleResult2, ResolveRuntimeFlagValuesModuleResult3 = ResolveRuntimeFlagValuesModule(function(p3) --[[ Line: 144 ]]
		return pcall(game.GetFastFlag, game, p3)
	end)
	
	if not Flag and ResolveRuntimeFlagValuesModuleResult2 + ResolveRuntimeFlagValuesModuleResult3 > 0 then
		Flag = true
		warn(`SduiCapabilities: ignored {ResolveRuntimeFlagValuesModuleResult2} invalid runtime flag names and {ResolveRuntimeFlagValuesModuleResult3} unreadable flags`)
	end
	config.runtime_flag_values = ResolveRuntimeFlagValuesModuleResult
	
	return config
end

function SduiCapabilitiesModule.buildClientCapabilities() --[[ Line: 174 ]]
	-- upvalues: Parent (copy), SduiCapabilitiesModule (copy), getRuntimeSupportFields (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local ClientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local config = {
		enabled_capabilities = SduiCapabilitiesModule.getEnabledCapabilityNumbers(SduiCapabilitiesModule.getEnabledCapabilities()),
		platform = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.Platform.toNumber("PLATFORM_APP")
	}
	
	for i, value in getRuntimeSupportFields() do
		config[i] = value
	end
	return ClientCapabilities.new(config)
end

return SduiCapabilitiesModule