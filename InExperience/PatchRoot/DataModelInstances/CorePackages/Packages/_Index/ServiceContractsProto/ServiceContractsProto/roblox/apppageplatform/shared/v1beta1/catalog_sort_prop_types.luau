local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local BackgroundLayerModule = require(script.Parent.background_layer)
local CatalogSortDataModule = require(script.Parent.catalog_sort_data)
local HydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local PropConditionModule = require(script.Parent.prop_condition)
local PropTypesModule = require(script.Parent.prop_types)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 689 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		content_type = if p1 == nil or p1.content_type == nil then nil else p1.content_type
	}, Module))
end

function Module:encode() --[[ Line: 695 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.content_type ~= nil then
		local EncodeResult = self.content_type:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 710 ]]
	-- upvalues: Module (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v36 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v36 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.content_type = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v36 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v36 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 753 ]]
	local t = {}
	
	if self.content_type ~= nil then
		t.contentType = self.content_type:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 763 ]]
	-- upvalues: Module (copy), PropTypesModule (copy)
	local NewModule = Module.new()
	
	if self.content_type ~= nil then
		NewModule.content_type = PropTypesModule.StringProp.jsonDecode(self.content_type)
	end
	if self.contentType ~= nil then
		NewModule.content_type = PropTypesModule.StringProp.jsonDecode(self.contentType)
	end
	return NewModule
end

Module.descriptor = {
	name = "ItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemFooter"
}
local config = { ItemFooter = Module }
TypeRegistryModule.default:register(config.ItemFooter)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 793 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module1))
end

function Module1:encode() --[[ Line: 799 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "array_map" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 827 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v61 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v61 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = {
					type = "conditional",
					value = config.ArrayOfItemFooterProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = {
					type = "array_map",
					value = config.ArrayOfItemFooterProp_ArrayMap.decode(Buffer4)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v61 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v61 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 889 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 907 ]]
	-- upvalues: Module1 (copy), config (copy)
	local NewModule = Module1.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ArrayOfItemFooterProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return NewModule
end

Module1.descriptor = {
	name = "ArrayOfItemFooterProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooterProp"
}
config.ArrayOfItemFooterProp = Module1
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 957 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module2))
end

function Module2:encode() --[[ Line: 966 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 992 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
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
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v86 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v86 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
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

function Module2:jsonEncode() --[[ Line: 1046 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 1064 ]]
	-- upvalues: Module2 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module2.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module2.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ArrayOfItemFooterProp_ConditionalOption = Module2
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp_ConditionalOption)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 1104 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module3))
end

function Module3:encode() --[[ Line: 1112 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 1131 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v105 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v105 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v105 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.options, config.ArrayOfItemFooterProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v105 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v105 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 1176 ]]
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 1192 ]]
	-- upvalues: Module3 (copy), config (copy)
	local NewModule = Module3.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ArrayOfItemFooterProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module3.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ArrayOfItemFooterProp_ConditionalOptions = Module3
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp_ConditionalOptions)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1223 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		array = if p1 == nil or p1.array == nil then {} else p1.array
	}, Module4))
end

function Module4:encode() --[[ Line: 1231 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.array ~= nil and #self.array > 0 then
		for _, value in self.array do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1248 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v124 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v124 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v124 = ProtoModule.readBuffer(Buf, v5)
				table.insert(NewModule.array, config.ItemFooter.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v124 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v124 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1291 ]]
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, value:jsonEncode())
		end
		t.array = Array
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1305 ]]
	-- upvalues: Module4 (copy), config (copy)
	local NewModule = Module4.new()
	
	if self.array ~= nil then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, config.ItemFooter.jsonDecode(value))
		end
		NewModule.array = Array
	end
	return NewModule
end

Module4.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayOfItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooter"
}
config.ArrayOfItemFooterProp_ArrayOfItemFooter = Module4
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp_ArrayOfItemFooter)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1336 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		item_hydration_specs = if p1 == nil or p1.item_hydration_specs == nil then {} else p1.item_hydration_specs,
		field_map = if p1 == nil or p1.field_map == nil then nil else p1.field_map
	}, Module5))
end

function Module5:encode() --[[ Line: 1348 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for _, itemHydrationSpec in self.item_hydration_specs do
			local EncodeResult = itemHydrationSpec:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.field_map ~= nil then
		local EncodeResult = self.field_map:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1382 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), config (copy), HydrationDataSpecModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v151 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v151 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v151 = ProtoModule.readBuffer(Buf, v6)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v151 = ProtoModule.readBuffer(Buf, v6)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfItemFooterProp_ArrayMap_LiteralItems.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v151 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v151 = ProtoModule.readBuffer(Buf, v6)
				NewModule.field_map = config.ItemFooter.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v151 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v151 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1444 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		elseif self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local ItemHydrationSpecs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(ItemHydrationSpecs, itemHydrationSpec:jsonEncode())
		end
		t.itemHydrationSpecs = ItemHydrationSpecs
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1470 ]]
	-- upvalues: Module5 (copy), config (copy), HydrationDataSpecModule (copy)
	local NewModule = Module5.new()
	
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfItemFooterProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.itemHydrationSpecs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec1 in self.itemHydrationSpecs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec1))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.field_map ~= nil then
		NewModule.field_map = config.ItemFooter.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		NewModule.field_map = config.ItemFooter.jsonDecode(self.fieldMap)
	end
	return NewModule
end

Module5.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
config.ArrayOfItemFooterProp_ArrayMap = Module5
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp_ArrayMap)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1537 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module6))
end

function Module6:encode() --[[ Line: 1545 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1564 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy), CatalogSortDataModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v174 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v174 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v174 = ProtoModule.readBuffer(Buf, v7)
				table.insert(NewModule.items, CatalogSortDataModule.CatalogSortCardItemFooter.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v174 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v174 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1612 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1628 ]]
	-- upvalues: Module6 (copy), CatalogSortDataModule (copy)
	local NewModule = Module6.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, CatalogSortDataModule.CatalogSortCardItemFooter.jsonDecode(item))
		end
		NewModule.items = Items
	end
	return NewModule
end

Module6.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
config.ArrayOfItemFooterProp_ArrayMap_LiteralItems = Module6
TypeRegistryModule.default:register(config.ArrayOfItemFooterProp_ArrayMap_LiteralItems)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1662 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		thumbnail_aspect_ratio = if p1 == nil or p1.thumbnail_aspect_ratio == nil then nil else p1.thumbnail_aspect_ratio,
		background_layers = if p1 == nil or p1.background_layers == nil then nil else p1.background_layers
	}, Module7))
end

function Module7:encode() --[[ Line: 1671 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.thumbnail_aspect_ratio ~= nil then
		local EncodeResult = self.thumbnail_aspect_ratio:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.background_layers ~= nil then
		local EncodeResult = self.background_layers:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1692 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), PropTypesModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v196 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v196 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v196 = ProtoModule.readBuffer(Buf, v8)
				NewModule.thumbnail_aspect_ratio = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v196 = ProtoModule.readBuffer(Buf, v8)
				NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v196 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v196 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1742 ]]
	local t = {}
	
	if self.thumbnail_aspect_ratio ~= nil then
		t.thumbnailAspectRatio = self.thumbnail_aspect_ratio:jsonEncode()
	end
	if self.background_layers ~= nil then
		t.backgroundLayers = self.background_layers:jsonEncode()
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1756 ]]
	-- upvalues: Module7 (copy), PropTypesModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module7.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		NewModule.thumbnail_aspect_ratio = PropTypesModule.StringProp.jsonDecode(self.thumbnail_aspect_ratio)
	end
	if self.thumbnailAspectRatio ~= nil then
		NewModule.thumbnail_aspect_ratio = PropTypesModule.StringProp.jsonDecode(self.thumbnailAspectRatio)
	end
	if self.background_layers ~= nil then
		NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return NewModule
end

Module7.descriptor = {
	name = "CardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyle"
}
config.CardStyle = Module7
TypeRegistryModule.default:register(config.CardStyle)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1800 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module8))
end

function Module8:encode() --[[ Line: 1806 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf) --[[ Line: 1830 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v219 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v219 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v219 = ProtoModule.readBuffer(Buf, v9)
				NewModule.kind = {
					type = "literal",
					value = config.CardStyle.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v219 = ProtoModule.readBuffer(Buf, v9)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v219 = ProtoModule.readBuffer(Buf, v9)
				NewModule.kind = {
					type = "conditional",
					value = config.CardStyleProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v219 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v219 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1884 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1900 ]]
	-- upvalues: Module8 (copy), config (copy)
	local NewModule = Module8.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.CardStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module8.descriptor = {
	name = "CardStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyleProp"
}
config.CardStyleProp = Module8
TypeRegistryModule.default:register(config.CardStyleProp)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1) --[[ Line: 1939 ]]
	-- upvalues: Module9 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module9))
end

function Module9:encode() --[[ Line: 1948 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf) --[[ Line: 1974 ]]
	-- upvalues: Module9 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v243 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v243 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v243 = ProtoModule.readBuffer(Buf, v10)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v243 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = {
					type = "literal",
					value = config.CardStyle.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v243 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v243 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v243 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode() --[[ Line: 2027 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module9:jsonDecode() --[[ Line: 2045 ]]
	-- upvalues: Module9 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module9.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module9.descriptor = {
	name = "CardStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.CardStyleProp_ConditionalOption = Module9
TypeRegistryModule.default:register(config.CardStyleProp_ConditionalOption)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1) --[[ Line: 2082 ]]
	-- upvalues: Module10 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module10))
end

function Module10:encode() --[[ Line: 2090 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf) --[[ Line: 2107 ]]
	-- upvalues: Module10 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v262 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v262 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v262 = ProtoModule.readBuffer(Buf, v11)
				table.insert(NewModule.options, config.CardStyleProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v262 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v262 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode() --[[ Line: 2150 ]]
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module10:jsonDecode() --[[ Line: 2164 ]]
	-- upvalues: Module10 (copy), config (copy)
	local NewModule = Module10.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.CardStyleProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module10.descriptor = {
	name = "CardStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.CardStyleProp_ConditionalOptions = Module10
TypeRegistryModule.default:register(config.CardStyleProp_ConditionalOptions)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1) --[[ Line: 2195 ]]
	-- upvalues: Module11 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then nil else p1.id,
		type = if p1 == nil or p1.type == nil then nil else p1.type
	}, Module11))
end

function Module11:encode() --[[ Line: 2202 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil then
		local EncodeResult = self.id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.type ~= nil then
		local EncodeResult = self.type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf) --[[ Line: 2223 ]]
	-- upvalues: Module11 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v284 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v284 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v284 = ProtoModule.readBuffer(Buf, v12)
				NewModule.id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v284 = ProtoModule.readBuffer(Buf, v12)
				NewModule.type = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v284 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v284 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode() --[[ Line: 2271 ]]
	local t = {}
	
	if self.id ~= nil then
		t.id = self.id:jsonEncode()
	end
	if self.type ~= nil then
		t.type = self.type:jsonEncode()
	end
	return t
end

function Module11:jsonDecode() --[[ Line: 2285 ]]
	-- upvalues: Module11 (copy), PropTypesModule (copy)
	local NewModule = Module11.new()
	
	if self.id ~= nil then
		NewModule.id = PropTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.type ~= nil then
		NewModule.type = PropTypesModule.StringProp.jsonDecode(self.type)
	end
	return NewModule
end

Module11.descriptor = {
	name = "CatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContent"
}
config.CatalogSortContent = Module11
TypeRegistryModule.default:register(config.CatalogSortContent)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1) --[[ Line: 2313 ]]
	-- upvalues: Module12 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module12))
end

function Module12:encode() --[[ Line: 2321 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "array_map" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf) --[[ Line: 2349 ]]
	-- upvalues: Module12 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v310 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v310 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = {
					type = "conditional",
					value = config.ArrayOfCatalogSortContentProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = {
					type = "array_map",
					value = config.ArrayOfCatalogSortContentProp_ArrayMap.decode(Buffer4)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v310 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v310 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode() --[[ Line: 2414 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module12:jsonDecode() --[[ Line: 2432 ]]
	-- upvalues: Module12 (copy), config (copy)
	local NewModule = Module12.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ArrayOfCatalogSortContentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return NewModule
end

Module12.descriptor = {
	name = "ArrayOfCatalogSortContentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContentProp"
}
config.ArrayOfCatalogSortContentProp = Module12
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1) --[[ Line: 2488 ]]
	-- upvalues: Module13 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module13))
end

function Module13:encode() --[[ Line: 2497 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf) --[[ Line: 2525 ]]
	-- upvalues: Module13 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v335 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v335 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v335 = ProtoModule.readBuffer(Buf, v14)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v335 = ProtoModule.readBuffer(Buf, v14)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v335 = ProtoModule.readBuffer(Buf, v14)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v335 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v335 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode() --[[ Line: 2583 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module13:jsonDecode() --[[ Line: 2603 ]]
	-- upvalues: Module13 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module13.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module13.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ArrayOfCatalogSortContentProp_ConditionalOption = Module13
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp_ConditionalOption)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1) --[[ Line: 2647 ]]
	-- upvalues: Module14 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module14))
end

function Module14:encode() --[[ Line: 2658 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf) --[[ Line: 2677 ]]
	-- upvalues: Module14 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v354 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v354 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v354 = ProtoModule.readBuffer(Buf, v15)
				table.insert(NewModule.options, config.ArrayOfCatalogSortContentProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v354 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v354 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode() --[[ Line: 2722 ]]
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module14:jsonDecode() --[[ Line: 2738 ]]
	-- upvalues: Module14 (copy), config (copy)
	local NewModule = Module14.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ArrayOfCatalogSortContentProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module14.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ArrayOfCatalogSortContentProp_ConditionalOptions = Module14
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp_ConditionalOptions)
local Module15 = {}
Module15.__index = Module15

function Module15.new(p1) --[[ Line: 2771 ]]
	-- upvalues: Module15 (copy)
	return (setmetatable({
		array = if p1 == nil or p1.array == nil then {} else p1.array
	}, Module15))
end

function Module15:encode() --[[ Line: 2782 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.array ~= nil and #self.array > 0 then
		for _, value in self.array do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module15.decode(Buf) --[[ Line: 2801 ]]
	-- upvalues: Module15 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v373 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v373 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v373 = ProtoModule.readBuffer(Buf, v16)
				table.insert(NewModule.array, config.CatalogSortContent.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v373 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v373 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode() --[[ Line: 2846 ]]
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, value:jsonEncode())
		end
		t.array = Array
	end
	return t
end

function Module15:jsonDecode() --[[ Line: 2862 ]]
	-- upvalues: Module15 (copy), config (copy)
	local NewModule = Module15.new()
	
	if self.array ~= nil then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, config.CatalogSortContent.jsonDecode(value))
		end
		NewModule.array = Array
	end
	return NewModule
end

Module15.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContent"
}
config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = Module15
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1) --[[ Line: 2894 ]]
	-- upvalues: Module16 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		item_hydration_specs = if p1 == nil or p1.item_hydration_specs == nil then {} else p1.item_hydration_specs,
		field_map = if p1 == nil or p1.field_map == nil then nil else p1.field_map
	}, Module16))
end

function Module16:encode() --[[ Line: 2906 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for _, itemHydrationSpec in self.item_hydration_specs do
			local EncodeResult = itemHydrationSpec:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.field_map ~= nil then
		local EncodeResult = self.field_map:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf) --[[ Line: 2940 ]]
	-- upvalues: Module16 (copy), ProtoModule (copy), config (copy), HydrationDataSpecModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v400 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v400 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v400 = ProtoModule.readBuffer(Buf, v17)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v400 = ProtoModule.readBuffer(Buf, v17)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v400 = ProtoModule.readBuffer(Buf, v17)
				table.insert(NewModule.item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v400 = ProtoModule.readBuffer(Buf, v17)
				NewModule.field_map = config.CatalogSortContent.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v400 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v400 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode() --[[ Line: 3004 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		elseif self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local ItemHydrationSpecs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(ItemHydrationSpecs, itemHydrationSpec:jsonEncode())
		end
		t.itemHydrationSpecs = ItemHydrationSpecs
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function Module16:jsonDecode() --[[ Line: 3030 ]]
	-- upvalues: Module16 (copy), config (copy), HydrationDataSpecModule (copy)
	local NewModule = Module16.new()
	
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.itemHydrationSpecs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec1 in self.itemHydrationSpecs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec1))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.field_map ~= nil then
		NewModule.field_map = config.CatalogSortContent.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		NewModule.field_map = config.CatalogSortContent.jsonDecode(self.fieldMap)
	end
	return NewModule
end

Module16.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
config.ArrayOfCatalogSortContentProp_ArrayMap = Module16
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp_ArrayMap)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1) --[[ Line: 3100 ]]
	-- upvalues: Module17 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module17))
end

function Module17:encode() --[[ Line: 3111 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf) --[[ Line: 3130 ]]
	-- upvalues: Module17 (copy), ProtoModule (copy), CatalogSortDataModule (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v423 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v423 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v423 = ProtoModule.readBuffer(Buf, v18)
				table.insert(NewModule.items, CatalogSortDataModule.CatalogSortContentData.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v423 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v423 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode() --[[ Line: 3178 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	return t
end

function Module17:jsonDecode() --[[ Line: 3194 ]]
	-- upvalues: Module17 (copy), CatalogSortDataModule (copy)
	local NewModule = Module17.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, CatalogSortDataModule.CatalogSortContentData.jsonDecode(item))
		end
		NewModule.items = Items
	end
	return NewModule
end

Module17.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
config.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems = Module17
TypeRegistryModule.default:register(config.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1) --[[ Line: 3229 ]]
	-- upvalues: Module18 (copy)
	return (setmetatable({
		background_layers = if p1 == nil or p1.background_layers == nil then nil else p1.background_layers
	}, Module18))
end

function Module18:encode() --[[ Line: 3235 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.background_layers ~= nil then
		local EncodeResult = self.background_layers:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf) --[[ Line: 3250 ]]
	-- upvalues: Module18 (copy), ProtoModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v442 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v442 = ProtoModule.readVarInt(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v442 = ProtoModule.readBuffer(Buf, v19)
				NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v442 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v442 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode() --[[ Line: 3294 ]]
	local t = {}
	
	if self.background_layers ~= nil then
		t.backgroundLayers = self.background_layers:jsonEncode()
	end
	return t
end

function Module18:jsonDecode() --[[ Line: 3304 ]]
	-- upvalues: Module18 (copy), BackgroundLayerModule (copy)
	local NewModule = Module18.new()
	
	if self.background_layers ~= nil then
		NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		NewModule.background_layers = BackgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return NewModule
end

Module18.descriptor = {
	name = "WidgetStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyle"
}
config.WidgetStyle = Module18
TypeRegistryModule.default:register(config.WidgetStyle)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1) --[[ Line: 3338 ]]
	-- upvalues: Module19 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module19))
end

function Module19:encode() --[[ Line: 3344 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf) --[[ Line: 3368 ]]
	-- upvalues: Module19 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v464 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v464 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v464 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = {
					type = "literal",
					value = config.WidgetStyle.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v464 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v464 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = {
					type = "conditional",
					value = config.WidgetStyleProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v464 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v464 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode() --[[ Line: 3422 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module19:jsonDecode() --[[ Line: 3438 ]]
	-- upvalues: Module19 (copy), config (copy)
	local NewModule = Module19.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.WidgetStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module19.descriptor = {
	name = "WidgetStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleProp"
}
config.WidgetStyleProp = Module19
TypeRegistryModule.default:register(config.WidgetStyleProp)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1) --[[ Line: 3477 ]]
	-- upvalues: Module20 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module20))
end

function Module20:encode() --[[ Line: 3486 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf) --[[ Line: 3512 ]]
	-- upvalues: Module20 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v488 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v488 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v488 = ProtoModule.readBuffer(Buf, v21)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v488 = ProtoModule.readBuffer(Buf, v21)
				NewModule.kind = {
					type = "literal",
					value = config.WidgetStyle.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v488 = ProtoModule.readBuffer(Buf, v21)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v488 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v488 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode() --[[ Line: 3565 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module20:jsonDecode() --[[ Line: 3583 ]]
	-- upvalues: Module20 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module20.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module20.descriptor = {
	name = "WidgetStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.WidgetStyleProp_ConditionalOption = Module20
TypeRegistryModule.default:register(config.WidgetStyleProp_ConditionalOption)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1) --[[ Line: 3622 ]]
	-- upvalues: Module21 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module21))
end

function Module21:encode() --[[ Line: 3630 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf) --[[ Line: 3647 ]]
	-- upvalues: Module21 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v507 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v507 = ProtoModule.readVarInt(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v507 = ProtoModule.readBuffer(Buf, v22)
				table.insert(NewModule.options, config.WidgetStyleProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v507 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v507 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode() --[[ Line: 3690 ]]
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module21:jsonDecode() --[[ Line: 3704 ]]
	-- upvalues: Module21 (copy), config (copy)
	local NewModule = Module21.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.WidgetStyleProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module21.descriptor = {
	name = "WidgetStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.WidgetStyleProp_ConditionalOptions = Module21
TypeRegistryModule.default:register(config.WidgetStyleProp_ConditionalOptions)

return {
	ItemFooter = config.ItemFooter,
	ArrayOfItemFooterProp = config.ArrayOfItemFooterProp,
	ArrayOfItemFooterProp_ConditionalOption = config.ArrayOfItemFooterProp_ConditionalOption,
	ArrayOfItemFooterProp_ConditionalOptions = config.ArrayOfItemFooterProp_ConditionalOptions,
	ArrayOfItemFooterProp_ArrayOfItemFooter = config.ArrayOfItemFooterProp_ArrayOfItemFooter,
	ArrayOfItemFooterProp_ArrayMap = config.ArrayOfItemFooterProp_ArrayMap,
	ArrayOfItemFooterProp_ArrayMap_LiteralItems = config.ArrayOfItemFooterProp_ArrayMap_LiteralItems,
	CardStyle = config.CardStyle,
	CardStyleProp = config.CardStyleProp,
	CardStyleProp_ConditionalOption = config.CardStyleProp_ConditionalOption,
	CardStyleProp_ConditionalOptions = config.CardStyleProp_ConditionalOptions,
	CatalogSortContent = config.CatalogSortContent,
	ArrayOfCatalogSortContentProp = config.ArrayOfCatalogSortContentProp,
	ArrayOfCatalogSortContentProp_ConditionalOption = config.ArrayOfCatalogSortContentProp_ConditionalOption,
	ArrayOfCatalogSortContentProp_ConditionalOptions = config.ArrayOfCatalogSortContentProp_ConditionalOptions,
	ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = config.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent,
	ArrayOfCatalogSortContentProp_ArrayMap = config.ArrayOfCatalogSortContentProp_ArrayMap,
	ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems = config.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems,
	WidgetStyle = config.WidgetStyle,
	WidgetStyleProp = config.WidgetStyleProp,
	WidgetStyleProp_ConditionalOption = config.WidgetStyleProp_ConditionalOption,
	WidgetStyleProp_ConditionalOptions = config.WidgetStyleProp_ConditionalOptions
}