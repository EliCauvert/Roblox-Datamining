local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local sduiCapabilityFlagsModule = require(sduiCoreSystem.ClientBinding.SduiCapabilityFlags)
local resolveRuntimeFlagValuesModule = require(sduiCoreSystem.ClientBinding.resolveRuntimeFlagValues)
local t = {
	isEnabled = function(p1)
		-- upvalues: sduiCapabilityFlagsModule (ref)
		return sduiCapabilityFlagsModule[p1] == true
	end,
	getEnabledCapabilities = function()
		-- upvalues: sduiCapabilityFlagsModule (ref)
		local t = {}
		
		for i, v in sduiCapabilityFlagsModule do
			if v then
				table.insert(t, i)
			end
		end
		return t
	end
}

local function resolveNamesToNumbers(p1)
	-- upvalues: parent (ref)
	if #p1 == 0 then
		return {}
	end
	local capability = require(parent.ServiceContractsProto).apppageplatform.shared.capability.Capability
	local t = {}
	
	for i, v in p1 do
		local var1 = capability.fromName(v)
		
		if var1 == nil then
			warn(`SduiCapabilities: unknown capability name {v}`)
		else
			table.insert(t, capability.toNumber(var1))
		end
	end
	return t
end

function t.createQueryValue(p2)
	-- upvalues: resolveNamesToNumbers (ref)
	local var2 = resolveNamesToNumbers(p2)
	
	if #var2 == 0 then
		return nil
	end
	table.sort(var2)
	local list = table.create(#var2)
	
	for i, v in var2 do
		table.insert(list, tostring(v))
	end
	return table.concat(list, ",")
end

function t.addToQueryParams(p3, p4)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p4 do
		if t.isEnabled(v) then
			table.insert(t_1, v)
		end
	end
	local var3 = t.createQueryValue(t_1)
	
	if var3 ~= nil then
		p3.enabledCapabilities = var3
	end
end

function t.getEnabledCapabilityNumbers(p5)
	-- upvalues: t (ref), resolveNamesToNumbers (ref)
	local t_1 = {}
	
	for i, v in p5 do
		if t.isEnabled(v) then
			table.insert(t_1, v)
		end
	end
	local var4 = resolveNamesToNumbers(t_1)
	table.sort(var4)
	
	return var4
end

function t.getEnabledCapabilityNumbersWithoutExtendedMarker()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in t.getEnabledCapabilities() do
		if v ~= "CAPABILITY_SUPPORTS_EXTENDED_CLIENT_CAPABILITIES" then
			table.insert(t_1, v)
		end
	end
	return t.getEnabledCapabilityNumbers(t_1)
end

function t.addAllToQueryParams(p6)
	-- upvalues: t (ref)
	local var5 = t.createQueryValue(t.getEnabledCapabilities())
	
	if var5 ~= nil then
		p6.enabledCapabilities = var5
	end
end

local function resolveRuntimeSupportNumbers(p6, p7, p8)
	-- upvalues: sduiCoreSystem (ref)
	local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
	local t = {}
	
	for i, v in p6 do
		local var5 = protoVariableMapperModule.mapLuaEnumFormatToProto(v, p8, p7)
		
		if var5 ~= nil then
			local var6 = p7.toNumber(var5)
			
			if var6 ~= 0 then
				table.insert(t, var6)
			end
		end
	end
	table.sort(t)
	
	return t
end

local var7 = false

local function _()
	-- upvalues: resolveRuntimeFlagValuesModule (ref), var7 (write)
	local var8, var9, var10 = resolveRuntimeFlagValuesModule(function(p9)
		return pcall(game.GetFastFlag, game, p9)
	end)
	
	if not var7 and var9 + var10 > 0 then
		var7 = true
		warn(`SduiCapabilities: ignored {var9} invalid runtime flag names and {var10} unreadable flags`)
	end
	return var8
end

local function getRuntimeSupportFields()
	-- upvalues: parent (ref), resolveRuntimeSupportNumbers (ref), sduiCoreSystem (ref), resolveRuntimeFlagValuesModule (ref), var7 (write)
	local shared = require(parent.ServiceContractsProto).apppageplatform.shared
	local t = {
		registered_ui_component_types = resolveRuntimeSupportNumbers(require(sduiCoreSystem.getSduiComponentRegistry)().getRegisteredComponentTypes(), shared.ui_component_type.UiComponentType, "UI_COMPONENT_TYPE_"),
		registered_action_types = resolveRuntimeSupportNumbers(require(sduiCoreSystem.getSduiActionHandlerRegistry)().getRegisteredActionTypes(), shared.actions.ActionType, "ACTION_TYPE_")
	}
	local var8, var9, var10 = resolveRuntimeFlagValuesModule(function(p9)
		return pcall(game.GetFastFlag, game, p9)
	end)
	
	if not var7 and var9 + var10 > 0 then
		var7 = true
		warn(`SduiCapabilities: ignored {var9} invalid runtime flag names and {var10} unreadable flags`)
	end
	t.runtime_flag_values = var8
	
	return t
end

function t.buildClientCapabilities()
	-- upvalues: parent (ref), t (ref), getRuntimeSupportFields (ref)
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local t_1 = {
		enabled_capabilities = t.getEnabledCapabilityNumbers(t.getEnabledCapabilities()),
		platform = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.Platform.toNumber("PLATFORM_APP")
	}
	
	for i, v in getRuntimeSupportFields() do
		t_1[i] = v
	end
	return clientCapabilities.new(t_1)
end

return t