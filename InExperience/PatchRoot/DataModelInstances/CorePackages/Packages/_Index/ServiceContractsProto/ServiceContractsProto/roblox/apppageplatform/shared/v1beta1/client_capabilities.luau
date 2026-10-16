local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local ActionsModule = require(script.Parent.actions)
local CapabilityModule = require(script.Parent.capability)
local UiComponentTypeModule = require(script.Parent.ui_component_type)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 89 ]]
	-- upvalues: t (copy), Module (copy)
	return (setmetatable({
		enabled_capabilities = if p1 == nil or p1.enabled_capabilities == nil then {} else p1.enabled_capabilities,
		proto_version = if p1 == nil or p1.proto_version == nil then "" else p1.proto_version,
		platform = if p1 == nil or p1.platform == nil then assert(t.Platform.fromNumber(0), "Enum has no 0 default") else p1.platform,
		registered_ui_component_types = if p1 == nil or p1.registered_ui_component_types == nil then {} else p1.registered_ui_component_types,
		registered_action_types = if p1 == nil or p1.registered_action_types == nil then {} else p1.registered_action_types,
		runtime_flag_values = if p1 == nil or p1.runtime_flag_values == nil then {} else p1.runtime_flag_values
	}, Module))
end

function Module:encode() --[[ Line: 110 ]]
	-- upvalues: ProtoModule (copy), CapabilityModule (copy), t (copy), UiComponentTypeModule (copy), ActionsModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for _, enabledCapability in self.enabled_capabilities do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, CapabilityModule.Capability.toNumber(enabledCapability))
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.proto_version)
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, t.Platform.toNumber(self.platform))
	end
	if self.registered_ui_component_types ~= nil and #self.registered_ui_component_types > 0 then
		for _, registeredUiComponentType in self.registered_ui_component_types do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, UiComponentTypeModule.UiComponentType.toNumber(registeredUiComponentType))
		end
	end
	if self.registered_action_types ~= nil and #self.registered_action_types > 0 then
		for _, registeredActionType in self.registered_action_types do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, ActionsModule.ActionType.toNumber(registeredActionType))
		end
	end
	if self.runtime_flag_values ~= nil and next(self.runtime_flag_values) ~= nil then
		for i, runtimeFlagValue in self.runtime_flag_values do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.varint)
			local WriteVarIntResult, WriteVarIntResult2 = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, if runtimeFlagValue then 1 else 0)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteVarIntResult, WriteVarIntResult2)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 178 ]]
	-- upvalues: Module (copy), ProtoModule (copy), CapabilityModule (copy), t (copy), UiComponentTypeModule (copy), ActionsModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v31 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v31 = ProtoModule.readVarIntI32(Buf, v1)
				table.insert(NewModule.enabled_capabilities, CapabilityModule.Capability.fromNumber(VarIntI32) or VarIntI32)
			elseif Tag == 3 then
				local VarIntI32_1
				VarIntI32_1, v31 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.platform = t.Platform.fromNumber(VarIntI32_1) or VarIntI32_1
			elseif Tag == 4 then
				local VarIntI32_2
				VarIntI32_2, v31 = ProtoModule.readVarIntI32(Buf, v1)
				table.insert(NewModule.registered_ui_component_types, UiComponentTypeModule.UiComponentType.fromNumber(VarIntI32_2) or VarIntI32_2)
			elseif Tag == 5 then
				local VarIntI32_3
				VarIntI32_3, v31 = ProtoModule.readVarIntI32(Buf, v1)
				table.insert(NewModule.registered_action_types, ActionsModule.ActionType.fromNumber(VarIntI32_3) or VarIntI32_3)
			else
				local _
				_, v31 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v31 = ProtoModule.readBuffer(Buf, v1)
				NewModule.proto_version = buffer.tostring(Buffer1)
			elseif Tag == 7 then
				local Buffer2
				Buffer2, v31 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.ClientCapabilities_RuntimeFlagValuesEntry.decode(Buffer2)
				NewModule.runtime_flag_values[DecodeResult.key or ""] = DecodeResult.value or false
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v31 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v31 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 266 ]]
	-- upvalues: CapabilityModule (copy), t (copy), UiComponentTypeModule (copy), ActionsModule (copy)
	local t1 = {}
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		local EnabledCapabilities = {}
		
		for _, enabledCapability in self.enabled_capabilities do
			table.insert(EnabledCapabilities, if typeof(enabledCapability) == "number" then enabledCapability else CapabilityModule.Capability.toNumber(enabledCapability))
		end
		t1.enabledCapabilities = EnabledCapabilities
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		t1.protoVersion = self.proto_version
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		t1.platform = if typeof(self.platform) == "number" then self.platform else t.Platform.toNumber(self.platform)
	end
	if self.registered_ui_component_types ~= nil and #self.registered_ui_component_types > 0 then
		local RegisteredUiComponentTypes = {}
		
		for _, registeredUiComponentType in self.registered_ui_component_types do
			table.insert(RegisteredUiComponentTypes, if typeof(registeredUiComponentType) == "number" then registeredUiComponentType else UiComponentTypeModule.UiComponentType.toNumber(registeredUiComponentType))
		end
		t1.registeredUiComponentTypes = RegisteredUiComponentTypes
	end
	if self.registered_action_types ~= nil and #self.registered_action_types > 0 then
		local RegisteredActionTypes = {}
		
		for _, registeredActionType in self.registered_action_types do
			table.insert(RegisteredActionTypes, if typeof(registeredActionType) == "number" then registeredActionType else ActionsModule.ActionType.toNumber(registeredActionType))
		end
		t1.registeredActionTypes = RegisteredActionTypes
	end
	if self.runtime_flag_values ~= nil and next(self.runtime_flag_values) ~= nil then
		local RuntimeFlagValues = {}
		
		for i, runtimeFlagValue in self.runtime_flag_values do
			RuntimeFlagValues[i] = runtimeFlagValue
		end
		t1.runtimeFlagValues = RuntimeFlagValues
	end
	return t1
end

function Module:jsonDecode() --[[ Line: 334 ]]
	-- upvalues: Module (copy), CapabilityModule (copy), t (copy), UiComponentTypeModule (copy), ActionsModule (copy)
	local NewModule = Module.new()
	
	if self.enabled_capabilities ~= nil then
		local Enabled_capabilities = {}
		
		for _, enabledCapability in self.enabled_capabilities do
			table.insert(Enabled_capabilities, (if typeof(enabledCapability) == "number" then CapabilityModule.Capability.fromNumber(enabledCapability) else CapabilityModule.Capability.fromName(enabledCapability)) or enabledCapability)
		end
		NewModule.enabled_capabilities = Enabled_capabilities
	end
	if self.enabledCapabilities ~= nil then
		local Enabled_capabilities = {}
		
		for _, enabledCapability1 in self.enabledCapabilities do
			table.insert(Enabled_capabilities, (if typeof(enabledCapability1) == "number" then CapabilityModule.Capability.fromNumber(enabledCapability1) else CapabilityModule.Capability.fromName(enabledCapability1)) or enabledCapability1)
		end
		NewModule.enabled_capabilities = Enabled_capabilities
	end
	if self.proto_version ~= nil then
		NewModule.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		NewModule.proto_version = self.protoVersion
	end
	if self.platform ~= nil then
		NewModule.platform = (if typeof(self.platform) == "number" then t.Platform.fromNumber(self.platform) else t.Platform.fromName(self.platform)) or self.platform
	end
	if self.registered_ui_component_types ~= nil then
		local Registered_ui_component_types = {}
		
		for _, registeredUiComponentType in self.registered_ui_component_types do
			table.insert(Registered_ui_component_types, (if typeof(registeredUiComponentType) == "number" then UiComponentTypeModule.UiComponentType.fromNumber(registeredUiComponentType) else UiComponentTypeModule.UiComponentType.fromName(registeredUiComponentType)) or registeredUiComponentType)
		end
		NewModule.registered_ui_component_types = Registered_ui_component_types
	end
	if self.registeredUiComponentTypes ~= nil then
		local Registered_ui_component_types = {}
		
		for _, registeredUiComponentType1 in self.registeredUiComponentTypes do
			table.insert(Registered_ui_component_types, (if typeof(registeredUiComponentType1) == "number" then UiComponentTypeModule.UiComponentType.fromNumber(registeredUiComponentType1) else UiComponentTypeModule.UiComponentType.fromName(registeredUiComponentType1)) or registeredUiComponentType1)
		end
		NewModule.registered_ui_component_types = Registered_ui_component_types
	end
	if self.registered_action_types ~= nil then
		local Registered_action_types1 = {}
		
		for _, registeredActionType1 in self.registered_action_types do
			table.insert(Registered_action_types1, (if typeof(registeredActionType1) == "number" then ActionsModule.ActionType.fromNumber(registeredActionType1) else ActionsModule.ActionType.fromName(registeredActionType1)) or registeredActionType1)
		end
		NewModule.registered_action_types = Registered_action_types1
	end
	if self.registeredActionTypes ~= nil then
		local Registered_action_types = {}
		
		for _, registeredActionType in self.registeredActionTypes do
			table.insert(Registered_action_types, (if typeof(registeredActionType) == "number" then ActionsModule.ActionType.fromNumber(registeredActionType) else ActionsModule.ActionType.fromName(registeredActionType)) or registeredActionType)
		end
		NewModule.registered_action_types = Registered_action_types
	end
	if self.runtime_flag_values ~= nil then
		local Runtime_flag_values = {}
		
		for i, runtimeFlagValue in self.runtime_flag_values do
			Runtime_flag_values[i] = runtimeFlagValue
		end
		NewModule.runtime_flag_values = Runtime_flag_values
	end
	if self.runtimeFlagValues ~= nil then
		local Runtime_flag_values = {}
		
		for i1, runtimeFlagValue1 in self.runtimeFlagValues do
			Runtime_flag_values[i1] = runtimeFlagValue1
		end
		NewModule.runtime_flag_values = Runtime_flag_values
	end
	return NewModule
end

Module.descriptor = {
	name = "ClientCapabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
}
t.ClientCapabilities = Module
TypeRegistryModule.default:register(t.ClientCapabilities)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 480 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = p1 ~= nil and p1.value ~= nil and p1.value
	}, Module1))
end

function Module1:encode() --[[ Line: 489 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.value then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 510 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v67 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v67 = ProtoModule.readVarInt(Buf, v2)
				NewModule.value = VarInt ~= 0
			else
				local _
				_, v67 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v67 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v67 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v67 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 560 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 576 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module1.descriptor = {
	name = "ClientCapabilities_RuntimeFlagValuesEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.RuntimeFlagValuesEntry"
}
t.ClientCapabilities_RuntimeFlagValuesEntry = Module1
TypeRegistryModule.default:register(t.ClientCapabilities_RuntimeFlagValuesEntry)
t.Platform = {
	fromNumber = function(p1) --[[ Line: 603 ]]
		return if p1 == 0 then "PLATFORM_INVALID" elseif p1 == 1 then "PLATFORM_WEB" elseif p1 == 2 then "PLATFORM_APP" else nil
	end,
	toNumber = function(p1) --[[ Line: 615 ]]
		return if p1 == "PLATFORM_INVALID" then 0 elseif p1 == "PLATFORM_WEB" then 1 elseif p1 == "PLATFORM_APP" then 2 else p1
	end,
	fromName = function(p1) --[[ Line: 627 ]]
		return if p1 == "PLATFORM_INVALID" then "PLATFORM_INVALID" elseif p1 == "PLATFORM_WEB" then "PLATFORM_WEB" elseif p1 == "PLATFORM_APP" then "PLATFORM_APP" else nil
	end
}

return {
	ClientCapabilities = t.ClientCapabilities,
	Platform = t.Platform
}