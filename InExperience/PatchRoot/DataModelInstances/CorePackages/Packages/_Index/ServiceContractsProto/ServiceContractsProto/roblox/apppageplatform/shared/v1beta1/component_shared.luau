local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local HydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local UiComponentTypeModule = require(script.Parent.ui_component_type)
local AnalyticsDataModule = require(script.Parent.analytics_data)
local PropTypesModule = require(script.Parent.prop_types)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		hidden = if p1 == nil or p1.hidden == nil then nil else p1.hidden,
		label = if p1 == nil or p1.label == nil then nil else p1.label
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.hidden ~= nil then
		local EncodeResult = self.hidden:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.label ~= nil then
		local EncodeResult = self.label:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v19 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.hidden = PropTypesModule.BoolProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.label = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v19 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v19 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.hidden ~= nil then
		t.hidden = self.hidden:jsonEncode()
	end
	if self.label ~= nil then
		t.label = self.label:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), PropTypesModule (copy)
	local NewModule = Module.new()
	
	if self.hidden ~= nil then
		NewModule.hidden = PropTypesModule.BoolProp.jsonDecode(self.hidden)
	end
	if self.label ~= nil then
		NewModule.label = PropTypesModule.StringProp.jsonDecode(self.label)
	end
	return NewModule
end

Module.descriptor = {
	name = "AccessibilityProps",
	fullName = "roblox.apppageplatform.shared.v1beta1.AccessibilityProps"
}
local config = { AccessibilityProps = Module }
TypeRegistryModule.default:register(config.AccessibilityProps)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: UiComponentTypeModule (copy), Module1 (copy)
	return (setmetatable({
		component_type = if p1 == nil or p1.component_type == nil then assert(UiComponentTypeModule.UiComponentType.fromNumber(0), "Enum has no 0 default") else p1.component_type,
		data = if p1 == nil or p1.data == nil then {} else p1.data,
		analytics_data = if p1 == nil or p1.analytics_data == nil then {} else p1.analytics_data,
		is_component_filtered = if p1 == nil or p1.is_component_filtered == nil then nil else p1.is_component_filtered,
		accessibility = if p1 == nil or p1.accessibility == nil then nil else p1.accessibility
	}, Module1))
end

function Module1:encode()
	-- upvalues: UiComponentTypeModule (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= UiComponentTypeModule.UiComponentType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, UiComponentTypeModule.UiComponentType.toNumber(self.component_type))
	end
	if self.data ~= nil and #self.data > 0 then
		for _, entry in self.data do
			local EncodeResult = entry:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		for i, value in self.analytics_data do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.is_component_filtered ~= nil then
		local EncodeResult = self.is_component_filtered:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.accessibility ~= nil then
		local EncodeResult = self.accessibility:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), UiComponentTypeModule (copy), HydrationDataSpecModule (copy), config (copy), AnalyticsDataModule (copy), PropTypesModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v56 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v56 = ProtoModule.readVarIntI32(Buf, v2)
				NewModule.component_type = UiComponentTypeModule.UiComponentType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v56 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v56 = ProtoModule.readBuffer(Buf, v2)
				table.insert(NewModule.data, HydrationDataSpecModule.HydrationDataSpec.decode(Buffer1))
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v56 = ProtoModule.readBuffer(Buf, v2)
				local DecodeResult = config.ComponentShared_AnalyticsDataEntry.decode(Buffer2)
				local NewResult = AnalyticsDataModule.AnalyticsDataField.new()
				NewModule.analytics_data[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.is_component_filtered = PropTypesModule.BoolProp.decode(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.accessibility = config.AccessibilityProps.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v56 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v56 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	-- upvalues: UiComponentTypeModule (copy)
	local t = {}
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= UiComponentTypeModule.UiComponentType.fromNumber(0)) then
		t.componentType = if typeof(self.component_type) == "number" then self.component_type else UiComponentTypeModule.UiComponentType.toNumber(self.component_type)
	end
	if self.data ~= nil and #self.data > 0 then
		local Data = {}
		
		for _, entry in self.data do
			table.insert(Data, entry:jsonEncode())
		end
		t.data = Data
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		local AnalyticsData = {}
		
		for i, value in self.analytics_data do
			AnalyticsData[i] = value:jsonEncode()
		end
		t.analyticsData = AnalyticsData
	end
	if self.is_component_filtered ~= nil then
		t.isComponentFiltered = self.is_component_filtered:jsonEncode()
	end
	if self.accessibility ~= nil then
		t.accessibility = self.accessibility:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), UiComponentTypeModule (copy), HydrationDataSpecModule (copy), AnalyticsDataModule (copy), PropTypesModule (copy), config (copy)
	local NewModule = Module1.new()
	
	if self.component_type ~= nil then
		NewModule.component_type = (if typeof(self.component_type) == "number" then UiComponentTypeModule.UiComponentType.fromNumber(self.component_type) else UiComponentTypeModule.UiComponentType.fromName(self.component_type)) or self.component_type
	end
	if self.componentType ~= nil then
		NewModule.component_type = (if typeof(self.componentType) == "number" then UiComponentTypeModule.UiComponentType.fromNumber(self.componentType) else UiComponentTypeModule.UiComponentType.fromName(self.componentType)) or self.componentType
	end
	if self.data ~= nil then
		local Data = {}
		
		for _, entry in self.data do
			table.insert(Data, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(entry))
		end
		NewModule.data = Data
	end
	if self.analytics_data ~= nil then
		local Analytics_data = {}
		
		for i, value in self.analytics_data do
			Analytics_data[i] = AnalyticsDataModule.AnalyticsDataField.jsonDecode(value)
		end
		NewModule.analytics_data = Analytics_data
	end
	if self.analyticsData ~= nil then
		local Analytics_data = {}
		
		for i1, value1 in self.analyticsData do
			Analytics_data[i1] = AnalyticsDataModule.AnalyticsDataField.jsonDecode(value1)
		end
		NewModule.analytics_data = Analytics_data
	end
	if self.is_component_filtered ~= nil then
		NewModule.is_component_filtered = PropTypesModule.BoolProp.jsonDecode(self.is_component_filtered)
	end
	if self.isComponentFiltered ~= nil then
		NewModule.is_component_filtered = PropTypesModule.BoolProp.jsonDecode(self.isComponentFiltered)
	end
	if self.accessibility ~= nil then
		NewModule.accessibility = config.AccessibilityProps.jsonDecode(self.accessibility)
	end
	return NewModule
end

Module1.descriptor = {
	name = "ComponentShared",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComponentShared"
}
config.ComponentShared = Module1
TypeRegistryModule.default:register(config.ComponentShared)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), AnalyticsDataModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v86 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v86 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v86 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v86 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = AnalyticsDataModule.AnalyticsDataField.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v86 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v86 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), AnalyticsDataModule (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = AnalyticsDataModule.AnalyticsDataField.jsonDecode(self.value)
	end
	return NewModule
end

Module2.descriptor = {
	name = "ComponentShared_AnalyticsDataEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataEntry"
}
config.ComponentShared_AnalyticsDataEntry = Module2
TypeRegistryModule.default:register(config.ComponentShared_AnalyticsDataEntry)

return {
	AccessibilityProps = config.AccessibilityProps,
	ComponentShared = config.ComponentShared
}