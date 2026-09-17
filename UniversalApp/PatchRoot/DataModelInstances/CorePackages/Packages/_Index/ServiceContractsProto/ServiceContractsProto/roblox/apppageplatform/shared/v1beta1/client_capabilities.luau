local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local actionsModule = require(script.Parent.actions)
local capabilityModule = require(script.Parent.capability)
local uiComponentTypeModule = require(script.Parent.ui_component_type)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		enabled_capabilities = if p1 == nil or p1.enabled_capabilities == nil then {} else p1.enabled_capabilities,
		proto_version = if p1 == nil or p1.proto_version == nil then "" else p1.proto_version,
		platform = if p1 == nil or p1.platform == nil then assert(t.Platform.fromNumber(0), "Enum has no 0 default") else p1.platform,
		registered_ui_component_types = if p1 == nil or p1.registered_ui_component_types == nil then {} else p1.registered_ui_component_types,
		registered_action_types = if p1 == nil or p1.registered_action_types == nil then {} else p1.registered_action_types,
		runtime_flag_values = if p1 == nil or p1.runtime_flag_values == nil then {} else p1.runtime_flag_values
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), capabilityModule (ref), t (ref), uiComponentTypeModule (ref), actionsModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for i, v in self.enabled_capabilities do
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
			var2, var11 = protoModule.writeVarInt(var2, var3, capabilityModule.Capability.toNumber(v))
			buff = var2
			var1 = var3
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var13 = protoModule.writeString(var4, var5, self.proto_version)
		buff = var4
		var1 = var5
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var15 = protoModule.writeVarInt(var6, var7, t.Platform.toNumber(self.platform))
		buff = var6
		var1 = var7
	end
	if self.registered_ui_component_types ~= nil and #self.registered_ui_component_types > 0 then
		for i, v in self.registered_ui_component_types do
			local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
			var8, var17 = protoModule.writeVarInt(var8, var9, uiComponentTypeModule.UiComponentType.toNumber(v))
			buff = var8
			var1 = var9
		end
	end
	if self.registered_action_types ~= nil and #self.registered_action_types > 0 then
		for i, v in self.registered_action_types do
			local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
			var10, var19 = protoModule.writeVarInt(var10, var11, actionsModule.ActionType.toNumber(v))
			buff = var10
			var1 = var11
		end
	end
	if self.runtime_flag_values ~= nil and next(self.runtime_flag_values) ~= nil then
		for i, v in self.runtime_flag_values do
			local var12, var13 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var12, var21 = protoModule.writeString(var12, var13, i)
			var12, var21 = protoModule.writeTag(var12, var13, 2, protoModule.wireTypes.varint)
			var12, var21 = protoModule.writeVarInt(var12, var13, if v then 1 else 0)
			local var14 = var12
			local var15 = var13
			local var16, var17 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var16, var25 = protoModule.writeBuffer(var16, var17, var14, var15)
			buff = var16
			var1 = var17
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), capabilityModule (ref), t (ref), uiComponentTypeModule (ref), actionsModule (ref)
	local var18 = t_1.new()
	local var19 = 0
	while var19 < buffer.len(p1) do
		local _ = nil
		local var20 = nil
		local var21, var22, var23 = protoModule.readTag(p1, var19)
		local var24 = var21
		var20 = var22
		var19 = var23
		
		if var20 == protoModule.wireTypes.varint then
			if var24 == 1 then
				local _ = nil
				local var25, var26 = protoModule.readVarIntI32(p1, var19)
				local var27 = var25
				var19 = var26
				table.insert(var18.enabled_capabilities, capabilityModule.Capability.fromNumber(var27) or var27)
			elseif var24 == 3 then
				local _ = nil
				local var28, var29 = protoModule.readVarIntI32(p1, var19)
				local var30 = var28
				var19 = var29
				var18.platform = t.Platform.fromNumber(var30) or var30
			elseif var24 == 4 then
				local _ = nil
				local var31, var32 = protoModule.readVarIntI32(p1, var19)
				local var33 = var31
				var19 = var32
				table.insert(var18.registered_ui_component_types, uiComponentTypeModule.UiComponentType.fromNumber(var33) or var33)
			elseif var24 == 5 then
				local _ = nil
				local var34, var35 = protoModule.readVarIntI32(p1, var19)
				local var36 = var34
				var19 = var35
				table.insert(var18.registered_action_types, actionsModule.ActionType.fromNumber(var36) or var36)
			else
				local _ = nil
				local var37, var38 = protoModule.readVarInt(p1, var19)
				local _ = var37
				var19 = var38
			end
		end
		if var20 == protoModule.wireTypes.lengthDelimited then
			if var24 == 2 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var19)
				var19 = var40
				var18.proto_version = buffer.tostring(var39)
			elseif var24 == 7 then
				local _ = nil
				local var41, var42 = protoModule.readBuffer(p1, var19)
				var19 = var42
				var41 = t.ClientCapabilities_RuntimeFlagValuesEntry.decode(var41)
				var18.runtime_flag_values[var41.key or ""] = var41.value or false
			else
				local _ = nil
				local var43, var44 = protoModule.readVarInt(p1, var19)
				var19 = var44 + var43
			end
		elseif var20 == protoModule.wireTypes.i32 then
			local _ = nil
			local var45, var46 = protoModule.readFixed32(p1, var19)
			local _ = var45
			var19 = var46
		elseif var20 == protoModule.wireTypes.i64 then
			local _ = nil
			local var47, var48 = protoModule.readFixed64(p1, var19)
			local _ = var47
			var19 = var48
		else
			error("Unsupported wire type: " .. var29)
		end
	end
	return var18
end

function t_1:jsonEncode()
	-- upvalues: capabilityModule (ref), t (ref), uiComponentTypeModule (ref), actionsModule (ref)
	local t_1 = {}
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		local t_2 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_2, if typeof(v) == "number" then v else capabilityModule.Capability.toNumber(v))
		end
		t_1.enabledCapabilities = t_2
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		t_1.protoVersion = self.proto_version
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		t_1.platform = if typeof(self.platform) == "number" then self.platform else t.Platform.toNumber(self.platform)
	end
	if self.registered_ui_component_types ~= nil and #self.registered_ui_component_types > 0 then
		local t_2 = {}
		
		for i, v in self.registered_ui_component_types do
			table.insert(t_2, if typeof(v) == "number" then v else uiComponentTypeModule.UiComponentType.toNumber(v))
		end
		t_1.registeredUiComponentTypes = t_2
	end
	if self.registered_action_types ~= nil and #self.registered_action_types > 0 then
		local t_2 = {}
		
		for i, v in self.registered_action_types do
			table.insert(t_2, if typeof(v) == "number" then v else actionsModule.ActionType.toNumber(v))
		end
		t_1.registeredActionTypes = t_2
	end
	if self.runtime_flag_values ~= nil and next(self.runtime_flag_values) ~= nil then
		local t_2 = {}
		
		for i, v in self.runtime_flag_values do
			t_2[i] = v
		end
		t_1.runtimeFlagValues = t_2
	end
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), capabilityModule (ref), t (ref), uiComponentTypeModule (ref), actionsModule (ref)
	local var49 = t_1.new()
	
	if self.enabled_capabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var49.enabled_capabilities = t_2
	end
	if self.enabledCapabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabledCapabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var49.enabled_capabilities = t_2
	end
	if self.proto_version ~= nil then
		var49.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		var49.proto_version = self.protoVersion
	end
	if self.platform ~= nil then
		var49.platform = if typeof(self.platform) == "number" then t.Platform.fromNumber(self.platform) or self.platform else t.Platform.fromName(self.platform) or self.platform
	end
	if self.registered_ui_component_types ~= nil then
		local t_2 = {}
		
		for i, v in self.registered_ui_component_types do
			table.insert(t_2, if typeof(v) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(v) or v else uiComponentTypeModule.UiComponentType.fromName(v) or v)
		end
		var49.registered_ui_component_types = t_2
	end
	if self.registeredUiComponentTypes ~= nil then
		local t_2 = {}
		
		for i, v in self.registeredUiComponentTypes do
			table.insert(t_2, if typeof(v) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(v) or v else uiComponentTypeModule.UiComponentType.fromName(v) or v)
		end
		var49.registered_ui_component_types = t_2
	end
	if self.registered_action_types ~= nil then
		local t_2 = {}
		
		for i, v in self.registered_action_types do
			table.insert(t_2, if typeof(v) == "number" then actionsModule.ActionType.fromNumber(v) or v else actionsModule.ActionType.fromName(v) or v)
		end
		var49.registered_action_types = t_2
	end
	if self.registeredActionTypes ~= nil then
		local t_2 = {}
		
		for i, v in self.registeredActionTypes do
			table.insert(t_2, if typeof(v) == "number" then actionsModule.ActionType.fromNumber(v) or v else actionsModule.ActionType.fromName(v) or v)
		end
		var49.registered_action_types = t_2
	end
	if self.runtime_flag_values ~= nil then
		local t_2 = {}
		
		for i, v in self.runtime_flag_values do
			t_2[i] = v
		end
		var49.runtime_flag_values = t_2
	end
	if self.runtimeFlagValues ~= nil then
		local t_2 = {}
		
		for i, v in self.runtimeFlagValues do
			t_2[i] = v
		end
		var49.runtime_flag_values = t_2
	end
	return var49
end

t_1.descriptor = {
	name = "ClientCapabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
}
t.ClientCapabilities = t_1
typeRegistryModule.default:register(t.ClientCapabilities)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then false else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var50 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var51, var52 = protoModule.writeTag(buff, var50, 1, protoModule.wireTypes.lengthDelimited)
		var51, var75 = protoModule.writeString(var51, var52, self.key)
		buff = var51
		var50 = var52
	end
	if self.value then
		local var53, var54 = protoModule.writeTag(buff, var50, 2, protoModule.wireTypes.varint)
		var53, var77 = protoModule.writeVarInt(var53, var54, if self.value then 1 else 0)
		buff = var53
		var50 = var54
	end
	local buff_1 = buffer.create(var50)
	buffer.copy(buff_1, 0, buff, 0, var50)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var50 = t_2.new()
	local var51 = 0
	while var51 < buffer.len(p2) do
		local _ = nil
		local var52 = nil
		local var53, var54, var55 = protoModule.readTag(p2, var51)
		local var56 = var53
		var52 = var54
		var51 = var55
		
		if var52 == protoModule.wireTypes.varint then
			if var56 == 2 then
				local _ = nil
				local var57, var58 = protoModule.readVarInt(p2, var51)
				var51 = var58
				var50.value = var57 ~= 0
			else
				local _ = nil
				local var59, var60 = protoModule.readVarInt(p2, var51)
				local _ = var59
				var51 = var60
			end
		end
		if var52 == protoModule.wireTypes.lengthDelimited then
			if var56 == 1 then
				local _ = nil
				local var61, var62 = protoModule.readBuffer(p2, var51)
				var51 = var62
				var50.key = buffer.tostring(var61)
			else
				local _ = nil
				local var63, var64 = protoModule.readVarInt(p2, var51)
				var51 = var64 + var63
			end
		elseif var52 == protoModule.wireTypes.i32 then
			local _ = nil
			local var65, var66 = protoModule.readFixed32(p2, var51)
			local _ = var65
			var51 = var66
		elseif var52 == protoModule.wireTypes.i64 then
			local _ = nil
			local var67, var68 = protoModule.readFixed64(p2, var51)
			local _ = var67
			var51 = var68
		else
			error("Unsupported wire type: " .. var81)
		end
	end
	return var50
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var69 = t_2.new()
	
	if self.key ~= nil then
		var69.key = self.key
	end
	if self.value ~= nil then
		var69.value = self.value
	end
	return var69
end

t_2.descriptor = {
	name = "ClientCapabilities_RuntimeFlagValuesEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.RuntimeFlagValuesEntry"
}
t.ClientCapabilities_RuntimeFlagValuesEntry = t_2
typeRegistryModule.default:register(t.ClientCapabilities_RuntimeFlagValuesEntry)
t.Platform = {
	fromNumber = function(p3)
		return if p3 == 0 then "PLATFORM_INVALID" elseif p3 == 1 then "PLATFORM_WEB" elseif p3 == 2 then "PLATFORM_APP" else nil
	end,
	toNumber = function(p3)
		return if p3 == "PLATFORM_INVALID" then 0 elseif p3 == "PLATFORM_WEB" then 1 elseif p3 == "PLATFORM_APP" then 2 else p3
	end,
	fromName = function(p3)
		return if p3 == "PLATFORM_INVALID" then "PLATFORM_INVALID" elseif p3 == "PLATFORM_WEB" then "PLATFORM_WEB" elseif p3 == "PLATFORM_APP" then "PLATFORM_APP" else nil
	end
}

return {
	ClientCapabilities = t.ClientCapabilities,
	Platform = t.Platform
}