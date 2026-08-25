local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local catalogSortDataModule = require(script.Parent.catalog_sort_data)
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local propConditionModule = require(script.Parent.prop_condition)
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		content_type = if p0 == nil or p0.content_type == nil then nil else p0.content_type
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var31 = 0
	
	if self.content_type ~= nil then
		local var32 = self.content_type:encode()
		local var33, var34 = protoModule.writeTag(buff, var31, 1, protoModule.wireTypes.lengthDelimited)
		var33, var34 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
		buff = var33
		var31 = var34
	end
	local buff_1 = buffer.create(var31)
	buffer.copy(buff_1, 0, buff, 0, var31)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), propTypesModule (ref)
	local var36 = t_1.new()
	local var37 = 0
	while var37 < buffer.len(p1) do
		local _ = nil
		local var38 = nil
		local var39, var40, var41 = protoModule.readTag(p1, var37)
		local var42 = var39
		var38 = var40
		var37 = var41
		
		if var38 == protoModule.wireTypes.varint then
			local _ = nil
			local var43, var44 = protoModule.readVarInt(p1, var37)
			local _ = var43
			var37 = var44
			continue
		end
		if var38 == protoModule.wireTypes.lengthDelimited then
			if var42 == 1 then
				local _ = nil
				local var45, var46 = protoModule.readBuffer(p1, var37)
				var37 = var46
				var36.content_type = propTypesModule.StringProp.decode(var45)
			else
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p1, var37)
				var37 = var48 + var47
			end
		elseif var38 == protoModule.wireTypes.i32 then
			local _ = nil
			local var49, var50 = protoModule.readFixed32(p1, var37)
			local _ = var49
			var37 = var50
		elseif var38 == protoModule.wireTypes.i64 then
			local _ = nil
			local var51, var52 = protoModule.readFixed64(p1, var37)
			local _ = var51
			var37 = var52
		else
			error("Unsupported wire type: " .. var38)
		end
	end
	return var36
end

function t_1:jsonEncode()
	local t = {}
	
	if self.content_type ~= nil then
		t.contentType = self.content_type:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), propTypesModule (ref)
	local var54 = t_1.new()
	
	if self.content_type ~= nil then
		var54.content_type = propTypesModule.StringProp.jsonDecode(self.content_type)
	end
	if self.contentType ~= nil then
		var54.content_type = propTypesModule.StringProp.jsonDecode(self.contentType)
	end
	return var54
end

t_1.descriptor = {
	name = "ItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemFooter"
}
t.ItemFooter = t_1
typeRegistryModule.default:register(t.ItemFooter)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var56 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var57 = self.kind.value:encode()
			local var58, var59 = protoModule.writeTag(buff, var56, 1, protoModule.wireTypes.lengthDelimited)
			var58, var59 = protoModule.writeBuffer(var58, var59, var57, buffer.len(var57))
			buff = var58
			var56 = var59
		elseif self.kind.type == "binding_path" then
			local var60, var61 = protoModule.writeTag(buff, var56, 2, protoModule.wireTypes.lengthDelimited)
			var60, var61 = protoModule.writeString(var60, var61, self.kind.value)
			buff = var60
			var56 = var61
		elseif self.kind.type == "conditional" then
			local var62 = self.kind.value:encode()
			local var63, var64 = protoModule.writeTag(buff, var56, 3, protoModule.wireTypes.lengthDelimited)
			var63, var64 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
			buff = var63
			var56 = var64
		elseif self.kind.type == "array_map" then
			local var65 = self.kind.value:encode()
			local var66, var67 = protoModule.writeTag(buff, var56, 4, protoModule.wireTypes.lengthDelimited)
			var66, var67 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
			buff = var66
			var56 = var67
		end
	end
	local buff_1 = buffer.create(var56)
	buffer.copy(buff_1, 0, buff, 0, var56)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var69 = t_2.new()
	local var70 = 0
	while var70 < buffer.len(p3) do
		local _ = nil
		local var71 = nil
		local var72, var73, var74 = protoModule.readTag(p3, var70)
		local var75 = var72
		var71 = var73
		var70 = var74
		
		if var71 == protoModule.wireTypes.varint then
			local _ = nil
			local var76, var77 = protoModule.readVarInt(p3, var70)
			local _ = var76
			var70 = var77
			continue
		end
		if var71 == protoModule.wireTypes.lengthDelimited then
			if var75 == 1 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var70)
				var70 = var79
				var69.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(var78)
				}
			elseif var75 == 2 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var70)
				var70 = var81
				var69.kind = { type = "binding_path", value = buffer.tostring(var80) }
			elseif var75 == 3 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var70)
				var70 = var83
				var69.kind = {
					type = "conditional",
					value = t.ArrayOfItemFooterProp_ConditionalOptions.decode(var82)
				}
			elseif var75 == 4 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var70)
				var70 = var85
				var69.kind = {
					type = "array_map",
					value = t.ArrayOfItemFooterProp_ArrayMap.decode(var84)
				}
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p3, var70)
				var70 = var87 + var86
			end
		elseif var71 == protoModule.wireTypes.i32 then
			local _ = nil
			local var88, var89 = protoModule.readFixed32(p3, var70)
			local _ = var88
			var70 = var89
		elseif var71 == protoModule.wireTypes.i64 then
			local _ = nil
			local var90, var91 = protoModule.readFixed64(p3, var70)
			local _ = var90
			var70 = var91
		else
			error("Unsupported wire type: " .. var71)
		end
	end
	return var69
end

function t_2:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var93 = t_2.new()
	
	if self.literal ~= nil then
		var93.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var93.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var93.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var93.kind = {
			type = "conditional",
			value = t.ArrayOfItemFooterProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var93.kind = {
			type = "array_map",
			value = t.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var93.kind = {
			type = "array_map",
			value = t.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var93
end

t_2.descriptor = {
	name = "ArrayOfItemFooterProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooterProp"
}
t.ArrayOfItemFooterProp = t_2
typeRegistryModule.default:register(t.ArrayOfItemFooterProp)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		condition = if p4 == nil or p4.condition == nil then nil else p4.condition,
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var95 = 0
	
	if self.condition ~= nil then
		local var96 = self.condition:encode()
		local var97, var98 = protoModule.writeTag(buff, var95, 1, protoModule.wireTypes.lengthDelimited)
		var97, var98 = protoModule.writeBuffer(var97, var98, var96, buffer.len(var96))
		buff = var97
		var95 = var98
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var99 = self.kind.value:encode()
			local var100, var101 = protoModule.writeTag(buff, var95, 2, protoModule.wireTypes.lengthDelimited)
			var100, var101 = protoModule.writeBuffer(var100, var101, var99, buffer.len(var99))
			buff = var100
			var95 = var101
		elseif self.kind.type == "binding_path" then
			local var102, var103 = protoModule.writeTag(buff, var95, 3, protoModule.wireTypes.lengthDelimited)
			var102, var103 = protoModule.writeString(var102, var103, self.kind.value)
			buff = var102
			var95 = var103
		end
	end
	local buff_1 = buffer.create(var95)
	buffer.copy(buff_1, 0, buff, 0, var95)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var105 = t_3.new()
	local var106 = 0
	while var106 < buffer.len(p5) do
		local _ = nil
		local var107 = nil
		local var108, var109, var110 = protoModule.readTag(p5, var106)
		local var111 = var108
		var107 = var109
		var106 = var110
		
		if var107 == protoModule.wireTypes.varint then
			local _ = nil
			local var112, var113 = protoModule.readVarInt(p5, var106)
			local _ = var112
			var106 = var113
			continue
		end
		if var107 == protoModule.wireTypes.lengthDelimited then
			if var111 == 1 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p5, var106)
				var106 = var115
				var105.condition = propConditionModule.PropCondition.decode(var114)
			elseif var111 == 2 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p5, var106)
				var106 = var117
				var105.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(var116)
				}
			elseif var111 == 3 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p5, var106)
				var106 = var119
				var105.kind = { type = "binding_path", value = buffer.tostring(var118) }
			else
				local _ = nil
				local var120, var121 = protoModule.readVarInt(p5, var106)
				var106 = var121 + var120
			end
		elseif var107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var122, var123 = protoModule.readFixed32(p5, var106)
			local _ = var122
			var106 = var123
		elseif var107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var124, var125 = protoModule.readFixed64(p5, var106)
			local _ = var124
			var106 = var125
		else
			error("Unsupported wire type: " .. var107)
		end
	end
	return var105
end

function t_3:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), propConditionModule (ref), t (ref)
	local var127 = t_3.new()
	
	if self.condition ~= nil then
		var127.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var127.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var127.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var127.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var127
end

t_3.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfItemFooterProp_ConditionalOption = t_3
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ConditionalOption)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		options = if p6 == nil or p6.options == nil then {} else p6.options
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var129 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var130 = v:encode()
			local var131, var132 = protoModule.writeTag(buff, var129, 1, protoModule.wireTypes.lengthDelimited)
			var131, var132 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var129 = var132
		end
	end
	local buff_1 = buffer.create(var129)
	buffer.copy(buff_1, 0, buff, 0, var129)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var134 = t_4.new()
	local var135 = 0
	while var135 < buffer.len(p7) do
		local _ = nil
		local var136 = nil
		local var137, var138, var139 = protoModule.readTag(p7, var135)
		local var140 = var137
		var136 = var138
		var135 = var139
		
		if var136 == protoModule.wireTypes.varint then
			local _ = nil
			local var141, var142 = protoModule.readVarInt(p7, var135)
			local _ = var141
			var135 = var142
			continue
		end
		if var136 == protoModule.wireTypes.lengthDelimited then
			if var140 == 1 then
				local _ = nil
				local var143, var144 = protoModule.readBuffer(p7, var135)
				var135 = var144
				table.insert(var134.options, t.ArrayOfItemFooterProp_ConditionalOption.decode(var143))
			else
				local _ = nil
				local var145, var146 = protoModule.readVarInt(p7, var135)
				var135 = var146 + var145
			end
		elseif var136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var147, var148 = protoModule.readFixed32(p7, var135)
			local _ = var147
			var135 = var148
		elseif var136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var149, var150 = protoModule.readFixed64(p7, var135)
			local _ = var149
			var135 = var150
		else
			error("Unsupported wire type: " .. var136)
		end
	end
	return var134
end

function t_4:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var153 = t_4.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfItemFooterProp_ConditionalOption.jsonDecode(v))
		end
		var153.options = t_1
	end
	return var153
end

t_4.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfItemFooterProp_ConditionalOptions = t_4
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ConditionalOptions)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		array = if p8 == nil or p8.array == nil then {} else p8.array
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var156 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var157 = v:encode()
			local var158, var159 = protoModule.writeTag(buff, var156, 1, protoModule.wireTypes.lengthDelimited)
			var158, var159 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var156 = var159
		end
	end
	local buff_1 = buffer.create(var156)
	buffer.copy(buff_1, 0, buff, 0, var156)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var161 = t_5.new()
	local var162 = 0
	while var162 < buffer.len(p9) do
		local _ = nil
		local var163 = nil
		local var164, var165, var166 = protoModule.readTag(p9, var162)
		local var167 = var164
		var163 = var165
		var162 = var166
		
		if var163 == protoModule.wireTypes.varint then
			local _ = nil
			local var168, var169 = protoModule.readVarInt(p9, var162)
			local _ = var168
			var162 = var169
			continue
		end
		if var163 == protoModule.wireTypes.lengthDelimited then
			if var167 == 1 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p9, var162)
				var162 = var171
				table.insert(var161.array, t.ItemFooter.decode(var170))
			else
				local _ = nil
				local var172, var173 = protoModule.readVarInt(p9, var162)
				var162 = var173 + var172
			end
		elseif var163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var174, var175 = protoModule.readFixed32(p9, var162)
			local _ = var174
			var162 = var175
		elseif var163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var176, var177 = protoModule.readFixed64(p9, var162)
			local _ = var176
			var162 = var177
		else
			error("Unsupported wire type: " .. var163)
		end
	end
	return var161
end

function t_5:jsonEncode()
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, v:jsonEncode())
		end
		t.array = t_1
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var180 = t_5.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.ItemFooter.jsonDecode(v))
		end
		var180.array = t_1
	end
	return var180
end

t_5.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayOfItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooter"
}
t.ArrayOfItemFooterProp_ArrayOfItemFooter = t_5
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayOfItemFooter)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind,
		item_hydration_specs = if p10 == nil or p10.item_hydration_specs == nil then {} else p10.item_hydration_specs,
		field_map = if p10 == nil or p10.field_map == nil then nil else p10.field_map
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var183 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var184, var185 = protoModule.writeTag(buff, var183, 1, protoModule.wireTypes.lengthDelimited)
			var184, var185 = protoModule.writeString(var184, var185, self.kind.value)
			buff = var184
			var183 = var185
		elseif self.kind.type == "literal" then
			local var186 = self.kind.value:encode()
			local var187, var188 = protoModule.writeTag(buff, var183, 2, protoModule.wireTypes.lengthDelimited)
			var187, var188 = protoModule.writeBuffer(var187, var188, var186, buffer.len(var186))
			buff = var187
			var183 = var188
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var189 = v:encode()
			local var190, var191 = protoModule.writeTag(buff, var183, 3, protoModule.wireTypes.lengthDelimited)
			var190, var191 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
			buff = var190
			var183 = var191
		end
	end
	if self.field_map ~= nil then
		local var192 = self.field_map:encode()
		local var193, var194 = protoModule.writeTag(buff, var183, 4, protoModule.wireTypes.lengthDelimited)
		var193, var194 = protoModule.writeBuffer(var193, var194, var192, buffer.len(var192))
		buff = var193
		var183 = var194
	end
	local buff_1 = buffer.create(var183)
	buffer.copy(buff_1, 0, buff, 0, var183)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref), hydrationDataSpecModule (ref)
	local var196 = t_6.new()
	local var197 = 0
	while var197 < buffer.len(p11) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p11, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p11, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p11, var197)
				var197 = var206
				var196.kind = { type = "binding_path", value = buffer.tostring(var205) }
			elseif var202 == 2 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p11, var197)
				var197 = var208
				var196.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayMap_LiteralItems.decode(var207)
				}
			elseif var202 == 3 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p11, var197)
				var197 = var210
				table.insert(var196.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var209))
			elseif var202 == 4 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p11, var197)
				var197 = var212
				var196.field_map = t.ItemFooter.decode(var211)
			else
				local _ = nil
				local var213, var214 = protoModule.readVarInt(p11, var197)
				var197 = var214 + var213
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var215, var216 = protoModule.readFixed32(p11, var197)
			local _ = var215
			var197 = var216
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var217, var218 = protoModule.readFixed64(p11, var197)
			local _ = var217
			var197 = var218
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var196
end

function t_6:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		elseif self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, v:jsonEncode())
		end
		t.itemHydrationSpecs = t_1
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref), hydrationDataSpecModule (ref)
	local var221 = t_6.new()
	
	if self.binding_path ~= nil then
		var221.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var221.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var221.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var221.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var221.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var221.field_map = t.ItemFooter.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var221.field_map = t.ItemFooter.jsonDecode(self.fieldMap)
	end
	return var221
end

t_6.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfItemFooterProp_ArrayMap = t_6
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayMap)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12)
	-- upvalues: t_7 (ref)
	return setmetatable({
		items = if p12 == nil or p12.items == nil then {} else p12.items
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var225 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var226 = v:encode()
			local var227, var228 = protoModule.writeTag(buff, var225, 1, protoModule.wireTypes.lengthDelimited)
			var227, var228 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var225 = var228
		end
	end
	local buff_1 = buffer.create(var225)
	buffer.copy(buff_1, 0, buff, 0, var225)
	
	return buff_1
end

function t_7.decode(p13)
	-- upvalues: t_7 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var230 = t_7.new()
	local var231 = 0
	while var231 < buffer.len(p13) do
		local _ = nil
		local var232 = nil
		local var233, var234, var235 = protoModule.readTag(p13, var231)
		local var236 = var233
		var232 = var234
		var231 = var235
		
		if var232 == protoModule.wireTypes.varint then
			local _ = nil
			local var237, var238 = protoModule.readVarInt(p13, var231)
			local _ = var237
			var231 = var238
			continue
		end
		if var232 == protoModule.wireTypes.lengthDelimited then
			if var236 == 1 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p13, var231)
				var231 = var240
				table.insert(var230.items, catalogSortDataModule.CatalogSortCardItemFooter.decode(var239))
			else
				local _ = nil
				local var241, var242 = protoModule.readVarInt(p13, var231)
				var231 = var242 + var241
			end
		elseif var232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var243, var244 = protoModule.readFixed32(p13, var231)
			local _ = var243
			var231 = var244
		elseif var232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var245, var246 = protoModule.readFixed64(p13, var231)
			local _ = var245
			var231 = var246
		else
			error("Unsupported wire type: " .. var232)
		end
	end
	return var230
end

function t_7:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), catalogSortDataModule (ref)
	local var249 = t_7.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, catalogSortDataModule.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var249.items = t
	end
	return var249
end

t_7.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
t.ArrayOfItemFooterProp_ArrayMap_LiteralItems = t_7
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayMap_LiteralItems)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14)
	-- upvalues: t_8 (ref)
	return setmetatable({
		thumbnail_aspect_ratio = if p14 == nil or p14.thumbnail_aspect_ratio == nil then nil else p14.thumbnail_aspect_ratio,
		background_layers = if p14 == nil or p14.background_layers == nil then nil else p14.background_layers
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var252 = 0
	
	if self.thumbnail_aspect_ratio ~= nil then
		local var253 = self.thumbnail_aspect_ratio:encode()
		local var254, var255 = protoModule.writeTag(buff, var252, 1, protoModule.wireTypes.lengthDelimited)
		var254, var255 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
		buff = var254
		var252 = var255
	end
	if self.background_layers ~= nil then
		local var256 = self.background_layers:encode()
		local var257, var258 = protoModule.writeTag(buff, var252, 2, protoModule.wireTypes.lengthDelimited)
		var257, var258 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
		buff = var257
		var252 = var258
	end
	local buff_1 = buffer.create(var252)
	buffer.copy(buff_1, 0, buff, 0, var252)
	
	return buff_1
end

function t_8.decode(p15)
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref), backgroundLayerModule (ref)
	local var260 = t_8.new()
	local var261 = 0
	while var261 < buffer.len(p15) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p15, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p15, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p15, var261)
				var261 = var270
				var260.thumbnail_aspect_ratio = propTypesModule.StringProp.decode(var269)
			elseif var266 == 2 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p15, var261)
				var261 = var272
				var260.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.decode(var271)
			else
				local _ = nil
				local var273, var274 = protoModule.readVarInt(p15, var261)
				var261 = var274 + var273
			end
		elseif var262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var275, var276 = protoModule.readFixed32(p15, var261)
			local _ = var275
			var261 = var276
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var277, var278 = protoModule.readFixed64(p15, var261)
			local _ = var277
			var261 = var278
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var260
end

function t_8:jsonEncode()
	local t = {}
	
	if self.thumbnail_aspect_ratio ~= nil then
		t.thumbnailAspectRatio = self.thumbnail_aspect_ratio:jsonEncode()
	end
	if self.background_layers ~= nil then
		t.backgroundLayers = self.background_layers:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), propTypesModule (ref), backgroundLayerModule (ref)
	local var280 = t_8.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		var280.thumbnail_aspect_ratio = propTypesModule.StringProp.jsonDecode(self.thumbnail_aspect_ratio)
	end
	if self.thumbnailAspectRatio ~= nil then
		var280.thumbnail_aspect_ratio = propTypesModule.StringProp.jsonDecode(self.thumbnailAspectRatio)
	end
	if self.background_layers ~= nil then
		var280.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		var280.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return var280
end

t_8.descriptor = {
	name = "CardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyle"
}
t.CardStyle = t_8
typeRegistryModule.default:register(t.CardStyle)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16)
	-- upvalues: t_9 (ref)
	return setmetatable({
		kind = if p16 == nil or p16.kind == nil then nil else p16.kind
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var282 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var282, 1, protoModule.wireTypes.lengthDelimited)
			var284, var285 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var282 = var285
		elseif self.kind.type == "binding_path" then
			local var286, var287 = protoModule.writeTag(buff, var282, 2, protoModule.wireTypes.lengthDelimited)
			var286, var287 = protoModule.writeString(var286, var287, self.kind.value)
			buff = var286
			var282 = var287
		elseif self.kind.type == "conditional" then
			local var288 = self.kind.value:encode()
			local var289, var290 = protoModule.writeTag(buff, var282, 3, protoModule.wireTypes.lengthDelimited)
			var289, var290 = protoModule.writeBuffer(var289, var290, var288, buffer.len(var288))
			buff = var289
			var282 = var290
		end
	end
	local buff_1 = buffer.create(var282)
	buffer.copy(buff_1, 0, buff, 0, var282)
	
	return buff_1
end

function t_9.decode(p17)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var292 = t_9.new()
	local var293 = 0
	while var293 < buffer.len(p17) do
		local _ = nil
		local var294 = nil
		local var295, var296, var297 = protoModule.readTag(p17, var293)
		local var298 = var295
		var294 = var296
		var293 = var297
		
		if var294 == protoModule.wireTypes.varint then
			local _ = nil
			local var299, var300 = protoModule.readVarInt(p17, var293)
			local _ = var299
			var293 = var300
			continue
		end
		if var294 == protoModule.wireTypes.lengthDelimited then
			if var298 == 1 then
				local _ = nil
				local var301, var302 = protoModule.readBuffer(p17, var293)
				var293 = var302
				var292.kind = { type = "literal", value = t.CardStyle.decode(var301) }
			elseif var298 == 2 then
				local _ = nil
				local var303, var304 = protoModule.readBuffer(p17, var293)
				var293 = var304
				var292.kind = { type = "binding_path", value = buffer.tostring(var303) }
			elseif var298 == 3 then
				local _ = nil
				local var305, var306 = protoModule.readBuffer(p17, var293)
				var293 = var306
				var292.kind = {
					type = "conditional",
					value = t.CardStyleProp_ConditionalOptions.decode(var305)
				}
			else
				local _ = nil
				local var307, var308 = protoModule.readVarInt(p17, var293)
				var293 = var308 + var307
			end
		elseif var294 == protoModule.wireTypes.i32 then
			local _ = nil
			local var309, var310 = protoModule.readFixed32(p17, var293)
			local _ = var309
			var293 = var310
		elseif var294 == protoModule.wireTypes.i64 then
			local _ = nil
			local var311, var312 = protoModule.readFixed64(p17, var293)
			local _ = var311
			var293 = var312
		else
			error("Unsupported wire type: " .. var294)
		end
	end
	return var292
end

function t_9:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var314 = t_9.new()
	
	if self.literal ~= nil then
		var314.kind = {
			type = "literal",
			value = t.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var314.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var314.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var314.kind = {
			type = "conditional",
			value = t.CardStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var314
end

t_9.descriptor = {
	name = "CardStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyleProp"
}
t.CardStyleProp = t_9
typeRegistryModule.default:register(t.CardStyleProp)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18)
	-- upvalues: t_10 (ref)
	return setmetatable({
		condition = if p18 == nil or p18.condition == nil then nil else p18.condition,
		kind = if p18 == nil or p18.kind == nil then nil else p18.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var316 = 0
	
	if self.condition ~= nil then
		local var317 = self.condition:encode()
		local var318, var319 = protoModule.writeTag(buff, var316, 1, protoModule.wireTypes.lengthDelimited)
		var318, var319 = protoModule.writeBuffer(var318, var319, var317, buffer.len(var317))
		buff = var318
		var316 = var319
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var320 = self.kind.value:encode()
			local var321, var322 = protoModule.writeTag(buff, var316, 2, protoModule.wireTypes.lengthDelimited)
			var321, var322 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
			buff = var321
			var316 = var322
		elseif self.kind.type == "binding_path" then
			local var323, var324 = protoModule.writeTag(buff, var316, 3, protoModule.wireTypes.lengthDelimited)
			var323, var324 = protoModule.writeString(var323, var324, self.kind.value)
			buff = var323
			var316 = var324
		end
	end
	local buff_1 = buffer.create(var316)
	buffer.copy(buff_1, 0, buff, 0, var316)
	
	return buff_1
end

function t_10.decode(p19)
	-- upvalues: t_10 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var326 = t_10.new()
	local var327 = 0
	while var327 < buffer.len(p19) do
		local _ = nil
		local var328 = nil
		local var329, var330, var331 = protoModule.readTag(p19, var327)
		local var332 = var329
		var328 = var330
		var327 = var331
		
		if var328 == protoModule.wireTypes.varint then
			local _ = nil
			local var333, var334 = protoModule.readVarInt(p19, var327)
			local _ = var333
			var327 = var334
			continue
		end
		if var328 == protoModule.wireTypes.lengthDelimited then
			if var332 == 1 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p19, var327)
				var327 = var336
				var326.condition = propConditionModule.PropCondition.decode(var335)
			elseif var332 == 2 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p19, var327)
				var327 = var338
				var326.kind = { type = "literal", value = t.CardStyle.decode(var337) }
			elseif var332 == 3 then
				local _ = nil
				local var339, var340 = protoModule.readBuffer(p19, var327)
				var327 = var340
				var326.kind = { type = "binding_path", value = buffer.tostring(var339) }
			else
				local _ = nil
				local var341, var342 = protoModule.readVarInt(p19, var327)
				var327 = var342 + var341
			end
		elseif var328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var343, var344 = protoModule.readFixed32(p19, var327)
			local _ = var343
			var327 = var344
		elseif var328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var345, var346 = protoModule.readFixed64(p19, var327)
			local _ = var345
			var327 = var346
		else
			error("Unsupported wire type: " .. var328)
		end
	end
	return var326
end

function t_10:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), propConditionModule (ref), t (ref)
	local var348 = t_10.new()
	
	if self.condition ~= nil then
		var348.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var348.kind = {
			type = "literal",
			value = t.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var348.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var348.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var348
end

t_10.descriptor = {
	name = "CardStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.CardStyleProp_ConditionalOption = t_10
typeRegistryModule.default:register(t.CardStyleProp_ConditionalOption)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20)
	-- upvalues: t_11 (ref)
	return setmetatable({
		options = if p20 == nil or p20.options == nil then {} else p20.options
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var350 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var351 = v:encode()
			local var352, var353 = protoModule.writeTag(buff, var350, 1, protoModule.wireTypes.lengthDelimited)
			var352, var353 = protoModule.writeBuffer(var352, var353, var351, buffer.len(var351))
			buff = var352
			var350 = var353
		end
	end
	local buff_1 = buffer.create(var350)
	buffer.copy(buff_1, 0, buff, 0, var350)
	
	return buff_1
end

function t_11.decode(p21)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var355 = t_11.new()
	local var356 = 0
	while var356 < buffer.len(p21) do
		local _ = nil
		local var357 = nil
		local var358, var359, var360 = protoModule.readTag(p21, var356)
		local var361 = var358
		var357 = var359
		var356 = var360
		
		if var357 == protoModule.wireTypes.varint then
			local _ = nil
			local var362, var363 = protoModule.readVarInt(p21, var356)
			local _ = var362
			var356 = var363
			continue
		end
		if var357 == protoModule.wireTypes.lengthDelimited then
			if var361 == 1 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p21, var356)
				var356 = var365
				table.insert(var355.options, t.CardStyleProp_ConditionalOption.decode(var364))
			else
				local _ = nil
				local var366, var367 = protoModule.readVarInt(p21, var356)
				var356 = var367 + var366
			end
		elseif var357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var368, var369 = protoModule.readFixed32(p21, var356)
			local _ = var368
			var356 = var369
		elseif var357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var370, var371 = protoModule.readFixed64(p21, var356)
			local _ = var370
			var356 = var371
		else
			error("Unsupported wire type: " .. var357)
		end
	end
	return var355
end

function t_11:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), t (ref)
	local var374 = t_11.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.CardStyleProp_ConditionalOption.jsonDecode(v))
		end
		var374.options = t_1
	end
	return var374
end

t_11.descriptor = {
	name = "CardStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.CardStyleProp_ConditionalOptions = t_11
typeRegistryModule.default:register(t.CardStyleProp_ConditionalOptions)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22)
	-- upvalues: t_12 (ref)
	return setmetatable({
		id = if p22 == nil or p22.id == nil then nil else p22.id,
		type = if p22 == nil or p22.type == nil then nil else p22.type
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var377 = 0
	
	if self.id ~= nil then
		local var378 = self.id:encode()
		local var379, var380 = protoModule.writeTag(buff, var377, 1, protoModule.wireTypes.lengthDelimited)
		var379, var380 = protoModule.writeBuffer(var379, var380, var378, buffer.len(var378))
		buff = var379
		var377 = var380
	end
	if self.type ~= nil then
		local var381 = self.type:encode()
		local var382, var383 = protoModule.writeTag(buff, var377, 2, protoModule.wireTypes.lengthDelimited)
		var382, var383 = protoModule.writeBuffer(var382, var383, var381, buffer.len(var381))
		buff = var382
		var377 = var383
	end
	local buff_1 = buffer.create(var377)
	buffer.copy(buff_1, 0, buff, 0, var377)
	
	return buff_1
end

function t_12.decode(p23)
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var385 = t_12.new()
	local var386 = 0
	while var386 < buffer.len(p23) do
		local _ = nil
		local var387 = nil
		local var388, var389, var390 = protoModule.readTag(p23, var386)
		local var391 = var388
		var387 = var389
		var386 = var390
		
		if var387 == protoModule.wireTypes.varint then
			local _ = nil
			local var392, var393 = protoModule.readVarInt(p23, var386)
			local _ = var392
			var386 = var393
			continue
		end
		if var387 == protoModule.wireTypes.lengthDelimited then
			if var391 == 1 then
				local _ = nil
				local var394, var395 = protoModule.readBuffer(p23, var386)
				var386 = var395
				var385.id = propTypesModule.StringProp.decode(var394)
			elseif var391 == 2 then
				local _ = nil
				local var396, var397 = protoModule.readBuffer(p23, var386)
				var386 = var397
				var385.type = propTypesModule.StringProp.decode(var396)
			else
				local _ = nil
				local var398, var399 = protoModule.readVarInt(p23, var386)
				var386 = var399 + var398
			end
		elseif var387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var400, var401 = protoModule.readFixed32(p23, var386)
			local _ = var400
			var386 = var401
		elseif var387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var402, var403 = protoModule.readFixed64(p23, var386)
			local _ = var402
			var386 = var403
		else
			error("Unsupported wire type: " .. var387)
		end
	end
	return var385
end

function t_12:jsonEncode()
	local t = {}
	
	if self.id ~= nil then
		t.id = self.id:jsonEncode()
	end
	if self.type ~= nil then
		t.type = self.type:jsonEncode()
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var405 = t_12.new()
	
	if self.id ~= nil then
		var405.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.type ~= nil then
		var405.type = propTypesModule.StringProp.jsonDecode(self.type)
	end
	return var405
end

t_12.descriptor = {
	name = "CatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContent"
}
t.CatalogSortContent = t_12
typeRegistryModule.default:register(t.CatalogSortContent)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p24 == nil or p24.kind == nil then nil else p24.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var407 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var408 = self.kind.value:encode()
			local var409, var410 = protoModule.writeTag(buff, var407, 1, protoModule.wireTypes.lengthDelimited)
			var409, var410 = protoModule.writeBuffer(var409, var410, var408, buffer.len(var408))
			buff = var409
			var407 = var410
		elseif self.kind.type == "binding_path" then
			local var411, var412 = protoModule.writeTag(buff, var407, 2, protoModule.wireTypes.lengthDelimited)
			var411, var412 = protoModule.writeString(var411, var412, self.kind.value)
			buff = var411
			var407 = var412
		elseif self.kind.type == "conditional" then
			local var413 = self.kind.value:encode()
			local var414, var415 = protoModule.writeTag(buff, var407, 3, protoModule.wireTypes.lengthDelimited)
			var414, var415 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
			buff = var414
			var407 = var415
		elseif self.kind.type == "array_map" then
			local var416 = self.kind.value:encode()
			local var417, var418 = protoModule.writeTag(buff, var407, 4, protoModule.wireTypes.lengthDelimited)
			var417, var418 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
			buff = var417
			var407 = var418
		end
	end
	local buff_1 = buffer.create(var407)
	buffer.copy(buff_1, 0, buff, 0, var407)
	
	return buff_1
end

function t_13.decode(p25)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var420 = t_13.new()
	local var421 = 0
	while var421 < buffer.len(p25) do
		local _ = nil
		local var422 = nil
		local var423, var424, var425 = protoModule.readTag(p25, var421)
		local var426 = var423
		var422 = var424
		var421 = var425
		
		if var422 == protoModule.wireTypes.varint then
			local _ = nil
			local var427, var428 = protoModule.readVarInt(p25, var421)
			local _ = var427
			var421 = var428
			continue
		end
		if var422 == protoModule.wireTypes.lengthDelimited then
			if var426 == 1 then
				local _ = nil
				local var429, var430 = protoModule.readBuffer(p25, var421)
				var421 = var430
				var420.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(var429)
				}
			elseif var426 == 2 then
				local _ = nil
				local var431, var432 = protoModule.readBuffer(p25, var421)
				var421 = var432
				var420.kind = { type = "binding_path", value = buffer.tostring(var431) }
			elseif var426 == 3 then
				local _ = nil
				local var433, var434 = protoModule.readBuffer(p25, var421)
				var421 = var434
				var420.kind = {
					type = "conditional",
					value = t.ArrayOfCatalogSortContentProp_ConditionalOptions.decode(var433)
				}
			elseif var426 == 4 then
				local _ = nil
				local var435, var436 = protoModule.readBuffer(p25, var421)
				var421 = var436
				var420.kind = {
					type = "array_map",
					value = t.ArrayOfCatalogSortContentProp_ArrayMap.decode(var435)
				}
			else
				local _ = nil
				local var437, var438 = protoModule.readVarInt(p25, var421)
				var421 = var438 + var437
			end
		elseif var422 == protoModule.wireTypes.i32 then
			local _ = nil
			local var439, var440 = protoModule.readFixed32(p25, var421)
			local _ = var439
			var421 = var440
		elseif var422 == protoModule.wireTypes.i64 then
			local _ = nil
			local var441, var442 = protoModule.readFixed64(p25, var421)
			local _ = var441
			var421 = var442
		else
			error("Unsupported wire type: " .. var422)
		end
	end
	return var420
end

function t_13:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_13:jsonDecode()
	-- upvalues: t_13 (ref), t (ref)
	local var444 = t_13.new()
	
	if self.literal ~= nil then
		var444.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var444.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var444.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var444.kind = {
			type = "conditional",
			value = t.ArrayOfCatalogSortContentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var444.kind = {
			type = "array_map",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var444.kind = {
			type = "array_map",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var444
end

t_13.descriptor = {
	name = "ArrayOfCatalogSortContentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContentProp"
}
t.ArrayOfCatalogSortContentProp = t_13
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p26)
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p26 == nil or p26.condition == nil then nil else p26.condition,
		kind = if p26 == nil or p26.kind == nil then nil else p26.kind
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var446 = 0
	
	if self.condition ~= nil then
		local var447 = self.condition:encode()
		local var448, var449 = protoModule.writeTag(buff, var446, 1, protoModule.wireTypes.lengthDelimited)
		var448, var449 = protoModule.writeBuffer(var448, var449, var447, buffer.len(var447))
		buff = var448
		var446 = var449
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var450 = self.kind.value:encode()
			local var451, var452 = protoModule.writeTag(buff, var446, 2, protoModule.wireTypes.lengthDelimited)
			var451, var452 = protoModule.writeBuffer(var451, var452, var450, buffer.len(var450))
			buff = var451
			var446 = var452
		elseif self.kind.type == "binding_path" then
			local var453, var454 = protoModule.writeTag(buff, var446, 3, protoModule.wireTypes.lengthDelimited)
			var453, var454 = protoModule.writeString(var453, var454, self.kind.value)
			buff = var453
			var446 = var454
		end
	end
	local buff_1 = buffer.create(var446)
	buffer.copy(buff_1, 0, buff, 0, var446)
	
	return buff_1
end

function t_14.decode(p27)
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var456 = t_14.new()
	local var457 = 0
	while var457 < buffer.len(p27) do
		local _ = nil
		local var458 = nil
		local var459, var460, var461 = protoModule.readTag(p27, var457)
		local var462 = var459
		var458 = var460
		var457 = var461
		
		if var458 == protoModule.wireTypes.varint then
			local _ = nil
			local var463, var464 = protoModule.readVarInt(p27, var457)
			local _ = var463
			var457 = var464
			continue
		end
		if var458 == protoModule.wireTypes.lengthDelimited then
			if var462 == 1 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p27, var457)
				var457 = var466
				var456.condition = propConditionModule.PropCondition.decode(var465)
			elseif var462 == 2 then
				local _ = nil
				local var467, var468 = protoModule.readBuffer(p27, var457)
				var457 = var468
				var456.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(var467)
				}
			elseif var462 == 3 then
				local _ = nil
				local var469, var470 = protoModule.readBuffer(p27, var457)
				var457 = var470
				var456.kind = { type = "binding_path", value = buffer.tostring(var469) }
			else
				local _ = nil
				local var471, var472 = protoModule.readVarInt(p27, var457)
				var457 = var472 + var471
			end
		elseif var458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var473, var474 = protoModule.readFixed32(p27, var457)
			local _ = var473
			var457 = var474
		elseif var458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var475, var476 = protoModule.readFixed64(p27, var457)
			local _ = var475
			var457 = var476
		else
			error("Unsupported wire type: " .. var458)
		end
	end
	return var456
end

function t_14:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), propConditionModule (ref), t (ref)
	local var478 = t_14.new()
	
	if self.condition ~= nil then
		var478.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var478.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var478.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var478.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var478
end

t_14.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfCatalogSortContentProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p28)
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p28 == nil or p28.options == nil then {} else p28.options
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var480 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var481 = v:encode()
			local var482, var483 = protoModule.writeTag(buff, var480, 1, protoModule.wireTypes.lengthDelimited)
			var482, var483 = protoModule.writeBuffer(var482, var483, var481, buffer.len(var481))
			buff = var482
			var480 = var483
		end
	end
	local buff_1 = buffer.create(var480)
	buffer.copy(buff_1, 0, buff, 0, var480)
	
	return buff_1
end

function t_15.decode(p29)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var485 = t_15.new()
	local var486 = 0
	while var486 < buffer.len(p29) do
		local _ = nil
		local var487 = nil
		local var488, var489, var490 = protoModule.readTag(p29, var486)
		local var491 = var488
		var487 = var489
		var486 = var490
		
		if var487 == protoModule.wireTypes.varint then
			local _ = nil
			local var492, var493 = protoModule.readVarInt(p29, var486)
			local _ = var492
			var486 = var493
			continue
		end
		if var487 == protoModule.wireTypes.lengthDelimited then
			if var491 == 1 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p29, var486)
				var486 = var495
				table.insert(var485.options, t.ArrayOfCatalogSortContentProp_ConditionalOption.decode(var494))
			else
				local _ = nil
				local var496, var497 = protoModule.readVarInt(p29, var486)
				var486 = var497 + var496
			end
		elseif var487 == protoModule.wireTypes.i32 then
			local _ = nil
			local var498, var499 = protoModule.readFixed32(p29, var486)
			local _ = var498
			var486 = var499
		elseif var487 == protoModule.wireTypes.i64 then
			local _ = nil
			local var500, var501 = protoModule.readFixed64(p29, var486)
			local _ = var500
			var486 = var501
		else
			error("Unsupported wire type: " .. var487)
		end
	end
	return var485
end

function t_15:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref)
	local var504 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfCatalogSortContentProp_ConditionalOption.jsonDecode(v))
		end
		var504.options = t_1
	end
	return var504
end

t_15.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfCatalogSortContentProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p30)
	-- upvalues: t_16 (ref)
	return setmetatable({
		array = if p30 == nil or p30.array == nil then {} else p30.array
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var507 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var508 = v:encode()
			local var509, var510 = protoModule.writeTag(buff, var507, 1, protoModule.wireTypes.lengthDelimited)
			var509, var510 = protoModule.writeBuffer(var509, var510, var508, buffer.len(var508))
			buff = var509
			var507 = var510
		end
	end
	local buff_1 = buffer.create(var507)
	buffer.copy(buff_1, 0, buff, 0, var507)
	
	return buff_1
end

function t_16.decode(p31)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var512 = t_16.new()
	local var513 = 0
	while var513 < buffer.len(p31) do
		local _ = nil
		local var514 = nil
		local var515, var516, var517 = protoModule.readTag(p31, var513)
		local var518 = var515
		var514 = var516
		var513 = var517
		
		if var514 == protoModule.wireTypes.varint then
			local _ = nil
			local var519, var520 = protoModule.readVarInt(p31, var513)
			local _ = var519
			var513 = var520
			continue
		end
		if var514 == protoModule.wireTypes.lengthDelimited then
			if var518 == 1 then
				local _ = nil
				local var521, var522 = protoModule.readBuffer(p31, var513)
				var513 = var522
				table.insert(var512.array, t.CatalogSortContent.decode(var521))
			else
				local _ = nil
				local var523, var524 = protoModule.readVarInt(p31, var513)
				var513 = var524 + var523
			end
		elseif var514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var525, var526 = protoModule.readFixed32(p31, var513)
			local _ = var525
			var513 = var526
		elseif var514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var527, var528 = protoModule.readFixed64(p31, var513)
			local _ = var527
			var513 = var528
		else
			error("Unsupported wire type: " .. var514)
		end
	end
	return var512
end

function t_16:jsonEncode()
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, v:jsonEncode())
		end
		t.array = t_1
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), t (ref)
	local var531 = t_16.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.CatalogSortContent.jsonDecode(v))
		end
		var531.array = t_1
	end
	return var531
end

t_16.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContent"
}
t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = t_16
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p32)
	-- upvalues: t_17 (ref)
	return setmetatable({
		kind = if p32 == nil or p32.kind == nil then nil else p32.kind,
		item_hydration_specs = if p32 == nil or p32.item_hydration_specs == nil then {} else p32.item_hydration_specs,
		field_map = if p32 == nil or p32.field_map == nil then nil else p32.field_map
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var534 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var535, var536 = protoModule.writeTag(buff, var534, 1, protoModule.wireTypes.lengthDelimited)
			var535, var536 = protoModule.writeString(var535, var536, self.kind.value)
			buff = var535
			var534 = var536
		elseif self.kind.type == "literal" then
			local var537 = self.kind.value:encode()
			local var538, var539 = protoModule.writeTag(buff, var534, 2, protoModule.wireTypes.lengthDelimited)
			var538, var539 = protoModule.writeBuffer(var538, var539, var537, buffer.len(var537))
			buff = var538
			var534 = var539
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var540 = v:encode()
			local var541, var542 = protoModule.writeTag(buff, var534, 3, protoModule.wireTypes.lengthDelimited)
			var541, var542 = protoModule.writeBuffer(var541, var542, var540, buffer.len(var540))
			buff = var541
			var534 = var542
		end
	end
	if self.field_map ~= nil then
		local var543 = self.field_map:encode()
		local var544, var545 = protoModule.writeTag(buff, var534, 4, protoModule.wireTypes.lengthDelimited)
		var544, var545 = protoModule.writeBuffer(var544, var545, var543, buffer.len(var543))
		buff = var544
		var534 = var545
	end
	local buff_1 = buffer.create(var534)
	buffer.copy(buff_1, 0, buff, 0, var534)
	
	return buff_1
end

function t_17.decode(p33)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref), hydrationDataSpecModule (ref)
	local var547 = t_17.new()
	local var548 = 0
	while var548 < buffer.len(p33) do
		local _ = nil
		local var549 = nil
		local var550, var551, var552 = protoModule.readTag(p33, var548)
		local var553 = var550
		var549 = var551
		var548 = var552
		
		if var549 == protoModule.wireTypes.varint then
			local _ = nil
			local var554, var555 = protoModule.readVarInt(p33, var548)
			local _ = var554
			var548 = var555
			continue
		end
		if var549 == protoModule.wireTypes.lengthDelimited then
			if var553 == 1 then
				local _ = nil
				local var556, var557 = protoModule.readBuffer(p33, var548)
				var548 = var557
				var547.kind = { type = "binding_path", value = buffer.tostring(var556) }
			elseif var553 == 2 then
				local _ = nil
				local var558, var559 = protoModule.readBuffer(p33, var548)
				var548 = var559
				var547.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.decode(var558)
				}
			elseif var553 == 3 then
				local _ = nil
				local var560, var561 = protoModule.readBuffer(p33, var548)
				var548 = var561
				table.insert(var547.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var560))
			elseif var553 == 4 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p33, var548)
				var548 = var563
				var547.field_map = t.CatalogSortContent.decode(var562)
			else
				local _ = nil
				local var564, var565 = protoModule.readVarInt(p33, var548)
				var548 = var565 + var564
			end
		elseif var549 == protoModule.wireTypes.i32 then
			local _ = nil
			local var566, var567 = protoModule.readFixed32(p33, var548)
			local _ = var566
			var548 = var567
		elseif var549 == protoModule.wireTypes.i64 then
			local _ = nil
			local var568, var569 = protoModule.readFixed64(p33, var548)
			local _ = var568
			var548 = var569
		else
			error("Unsupported wire type: " .. var549)
		end
	end
	return var547
end

function t_17:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		elseif self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, v:jsonEncode())
		end
		t.itemHydrationSpecs = t_1
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), t (ref), hydrationDataSpecModule (ref)
	local var572 = t_17.new()
	
	if self.binding_path ~= nil then
		var572.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var572.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var572.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var572.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var572.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var572.field_map = t.CatalogSortContent.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var572.field_map = t.CatalogSortContent.jsonDecode(self.fieldMap)
	end
	return var572
end

t_17.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfCatalogSortContentProp_ArrayMap = t_17
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayMap)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p34)
	-- upvalues: t_18 (ref)
	return setmetatable({
		items = if p34 == nil or p34.items == nil then {} else p34.items
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var576 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var577 = v:encode()
			local var578, var579 = protoModule.writeTag(buff, var576, 1, protoModule.wireTypes.lengthDelimited)
			var578, var579 = protoModule.writeBuffer(var578, var579, var577, buffer.len(var577))
			buff = var578
			var576 = var579
		end
	end
	local buff_1 = buffer.create(var576)
	buffer.copy(buff_1, 0, buff, 0, var576)
	
	return buff_1
end

function t_18.decode(p35)
	-- upvalues: t_18 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var581 = t_18.new()
	local var582 = 0
	while var582 < buffer.len(p35) do
		local _ = nil
		local var583 = nil
		local var584, var585, var586 = protoModule.readTag(p35, var582)
		local var587 = var584
		var583 = var585
		var582 = var586
		
		if var583 == protoModule.wireTypes.varint then
			local _ = nil
			local var588, var589 = protoModule.readVarInt(p35, var582)
			local _ = var588
			var582 = var589
			continue
		end
		if var583 == protoModule.wireTypes.lengthDelimited then
			if var587 == 1 then
				local _ = nil
				local var590, var591 = protoModule.readBuffer(p35, var582)
				var582 = var591
				table.insert(var581.items, catalogSortDataModule.CatalogSortContentData.decode(var590))
			else
				local _ = nil
				local var592, var593 = protoModule.readVarInt(p35, var582)
				var582 = var593 + var592
			end
		elseif var583 == protoModule.wireTypes.i32 then
			local _ = nil
			local var594, var595 = protoModule.readFixed32(p35, var582)
			local _ = var594
			var582 = var595
		elseif var583 == protoModule.wireTypes.i64 then
			local _ = nil
			local var596, var597 = protoModule.readFixed64(p35, var582)
			local _ = var596
			var582 = var597
		else
			error("Unsupported wire type: " .. var583)
		end
	end
	return var581
end

function t_18:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	return t
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref), catalogSortDataModule (ref)
	local var600 = t_18.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, catalogSortDataModule.CatalogSortContentData.jsonDecode(v))
		end
		var600.items = t
	end
	return var600
end

t_18.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems = t_18
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p36)
	-- upvalues: t_19 (ref)
	return setmetatable({
		background_layers = if p36 == nil or p36.background_layers == nil then nil else p36.background_layers
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var603 = 0
	
	if self.background_layers ~= nil then
		local var604 = self.background_layers:encode()
		local var605, var606 = protoModule.writeTag(buff, var603, 1, protoModule.wireTypes.lengthDelimited)
		var605, var606 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
		buff = var605
		var603 = var606
	end
	local buff_1 = buffer.create(var603)
	buffer.copy(buff_1, 0, buff, 0, var603)
	
	return buff_1
end

function t_19.decode(p37)
	-- upvalues: t_19 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var608 = t_19.new()
	local var609 = 0
	while var609 < buffer.len(p37) do
		local _ = nil
		local var610 = nil
		local var611, var612, var613 = protoModule.readTag(p37, var609)
		local var614 = var611
		var610 = var612
		var609 = var613
		
		if var610 == protoModule.wireTypes.varint then
			local _ = nil
			local var615, var616 = protoModule.readVarInt(p37, var609)
			local _ = var615
			var609 = var616
			continue
		end
		if var610 == protoModule.wireTypes.lengthDelimited then
			if var614 == 1 then
				local _ = nil
				local var617, var618 = protoModule.readBuffer(p37, var609)
				var609 = var618
				var608.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.decode(var617)
			else
				local _ = nil
				local var619, var620 = protoModule.readVarInt(p37, var609)
				var609 = var620 + var619
			end
		elseif var610 == protoModule.wireTypes.i32 then
			local _ = nil
			local var621, var622 = protoModule.readFixed32(p37, var609)
			local _ = var621
			var609 = var622
		elseif var610 == protoModule.wireTypes.i64 then
			local _ = nil
			local var623, var624 = protoModule.readFixed64(p37, var609)
			local _ = var623
			var609 = var624
		else
			error("Unsupported wire type: " .. var610)
		end
	end
	return var608
end

function t_19:jsonEncode()
	local t = {}
	
	if self.background_layers ~= nil then
		t.backgroundLayers = self.background_layers:jsonEncode()
	end
	return t
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref), backgroundLayerModule (ref)
	local var626 = t_19.new()
	
	if self.background_layers ~= nil then
		var626.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		var626.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return var626
end

t_19.descriptor = {
	name = "WidgetStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyle"
}
t.WidgetStyle = t_19
typeRegistryModule.default:register(t.WidgetStyle)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p38)
	-- upvalues: t_20 (ref)
	return setmetatable({
		kind = if p38 == nil or p38.kind == nil then nil else p38.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var628 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var629 = self.kind.value:encode()
			local var630, var631 = protoModule.writeTag(buff, var628, 1, protoModule.wireTypes.lengthDelimited)
			var630, var631 = protoModule.writeBuffer(var630, var631, var629, buffer.len(var629))
			buff = var630
			var628 = var631
		elseif self.kind.type == "binding_path" then
			local var632, var633 = protoModule.writeTag(buff, var628, 2, protoModule.wireTypes.lengthDelimited)
			var632, var633 = protoModule.writeString(var632, var633, self.kind.value)
			buff = var632
			var628 = var633
		elseif self.kind.type == "conditional" then
			local var634 = self.kind.value:encode()
			local var635, var636 = protoModule.writeTag(buff, var628, 3, protoModule.wireTypes.lengthDelimited)
			var635, var636 = protoModule.writeBuffer(var635, var636, var634, buffer.len(var634))
			buff = var635
			var628 = var636
		end
	end
	local buff_1 = buffer.create(var628)
	buffer.copy(buff_1, 0, buff, 0, var628)
	
	return buff_1
end

function t_20.decode(p39)
	-- upvalues: t_20 (ref), protoModule (ref), t (ref)
	local var638 = t_20.new()
	local var639 = 0
	while var639 < buffer.len(p39) do
		local _ = nil
		local var640 = nil
		local var641, var642, var643 = protoModule.readTag(p39, var639)
		local var644 = var641
		var640 = var642
		var639 = var643
		
		if var640 == protoModule.wireTypes.varint then
			local _ = nil
			local var645, var646 = protoModule.readVarInt(p39, var639)
			local _ = var645
			var639 = var646
			continue
		end
		if var640 == protoModule.wireTypes.lengthDelimited then
			if var644 == 1 then
				local _ = nil
				local var647, var648 = protoModule.readBuffer(p39, var639)
				var639 = var648
				var638.kind = { type = "literal", value = t.WidgetStyle.decode(var647) }
			elseif var644 == 2 then
				local _ = nil
				local var649, var650 = protoModule.readBuffer(p39, var639)
				var639 = var650
				var638.kind = { type = "binding_path", value = buffer.tostring(var649) }
			elseif var644 == 3 then
				local _ = nil
				local var651, var652 = protoModule.readBuffer(p39, var639)
				var639 = var652
				var638.kind = {
					type = "conditional",
					value = t.WidgetStyleProp_ConditionalOptions.decode(var651)
				}
			else
				local _ = nil
				local var653, var654 = protoModule.readVarInt(p39, var639)
				var639 = var654 + var653
			end
		elseif var640 == protoModule.wireTypes.i32 then
			local _ = nil
			local var655, var656 = protoModule.readFixed32(p39, var639)
			local _ = var655
			var639 = var656
		elseif var640 == protoModule.wireTypes.i64 then
			local _ = nil
			local var657, var658 = protoModule.readFixed64(p39, var639)
			local _ = var657
			var639 = var658
		else
			error("Unsupported wire type: " .. var640)
		end
	end
	return var638
end

function t_20:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref), t (ref)
	local var660 = t_20.new()
	
	if self.literal ~= nil then
		var660.kind = {
			type = "literal",
			value = t.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var660.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var660.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var660.kind = {
			type = "conditional",
			value = t.WidgetStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var660
end

t_20.descriptor = {
	name = "WidgetStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleProp"
}
t.WidgetStyleProp = t_20
typeRegistryModule.default:register(t.WidgetStyleProp)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p40)
	-- upvalues: t_21 (ref)
	return setmetatable({
		condition = if p40 == nil or p40.condition == nil then nil else p40.condition,
		kind = if p40 == nil or p40.kind == nil then nil else p40.kind
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var662 = 0
	
	if self.condition ~= nil then
		local var663 = self.condition:encode()
		local var664, var665 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.lengthDelimited)
		var664, var665 = protoModule.writeBuffer(var664, var665, var663, buffer.len(var663))
		buff = var664
		var662 = var665
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var666 = self.kind.value:encode()
			local var667, var668 = protoModule.writeTag(buff, var662, 2, protoModule.wireTypes.lengthDelimited)
			var667, var668 = protoModule.writeBuffer(var667, var668, var666, buffer.len(var666))
			buff = var667
			var662 = var668
		elseif self.kind.type == "binding_path" then
			local var669, var670 = protoModule.writeTag(buff, var662, 3, protoModule.wireTypes.lengthDelimited)
			var669, var670 = protoModule.writeString(var669, var670, self.kind.value)
			buff = var669
			var662 = var670
		end
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_21.decode(p41)
	-- upvalues: t_21 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var672 = t_21.new()
	local var673 = 0
	while var673 < buffer.len(p41) do
		local _ = nil
		local var674 = nil
		local var675, var676, var677 = protoModule.readTag(p41, var673)
		local var678 = var675
		var674 = var676
		var673 = var677
		
		if var674 == protoModule.wireTypes.varint then
			local _ = nil
			local var679, var680 = protoModule.readVarInt(p41, var673)
			local _ = var679
			var673 = var680
			continue
		end
		if var674 == protoModule.wireTypes.lengthDelimited then
			if var678 == 1 then
				local _ = nil
				local var681, var682 = protoModule.readBuffer(p41, var673)
				var673 = var682
				var672.condition = propConditionModule.PropCondition.decode(var681)
			elseif var678 == 2 then
				local _ = nil
				local var683, var684 = protoModule.readBuffer(p41, var673)
				var673 = var684
				var672.kind = { type = "literal", value = t.WidgetStyle.decode(var683) }
			elseif var678 == 3 then
				local _ = nil
				local var685, var686 = protoModule.readBuffer(p41, var673)
				var673 = var686
				var672.kind = { type = "binding_path", value = buffer.tostring(var685) }
			else
				local _ = nil
				local var687, var688 = protoModule.readVarInt(p41, var673)
				var673 = var688 + var687
			end
		elseif var674 == protoModule.wireTypes.i32 then
			local _ = nil
			local var689, var690 = protoModule.readFixed32(p41, var673)
			local _ = var689
			var673 = var690
		elseif var674 == protoModule.wireTypes.i64 then
			local _ = nil
			local var691, var692 = protoModule.readFixed64(p41, var673)
			local _ = var691
			var673 = var692
		else
			error("Unsupported wire type: " .. var674)
		end
	end
	return var672
end

function t_21:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_21:jsonDecode()
	-- upvalues: t_21 (ref), propConditionModule (ref), t (ref)
	local var694 = t_21.new()
	
	if self.condition ~= nil then
		var694.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var694.kind = {
			type = "literal",
			value = t.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var694.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var694.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var694
end

t_21.descriptor = {
	name = "WidgetStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.WidgetStyleProp_ConditionalOption = t_21
typeRegistryModule.default:register(t.WidgetStyleProp_ConditionalOption)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p42)
	-- upvalues: t_22 (ref)
	return setmetatable({
		options = if p42 == nil or p42.options == nil then {} else p42.options
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var696 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var697 = v:encode()
			local var698, var699 = protoModule.writeTag(buff, var696, 1, protoModule.wireTypes.lengthDelimited)
			var698, var699 = protoModule.writeBuffer(var698, var699, var697, buffer.len(var697))
			buff = var698
			var696 = var699
		end
	end
	local buff_1 = buffer.create(var696)
	buffer.copy(buff_1, 0, buff, 0, var696)
	
	return buff_1
end

function t_22.decode(p43)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var701 = t_22.new()
	local var702 = 0
	while var702 < buffer.len(p43) do
		local _ = nil
		local var703 = nil
		local var704, var705, var706 = protoModule.readTag(p43, var702)
		local var707 = var704
		var703 = var705
		var702 = var706
		
		if var703 == protoModule.wireTypes.varint then
			local _ = nil
			local var708, var709 = protoModule.readVarInt(p43, var702)
			local _ = var708
			var702 = var709
			continue
		end
		if var703 == protoModule.wireTypes.lengthDelimited then
			if var707 == 1 then
				local _ = nil
				local var710, var711 = protoModule.readBuffer(p43, var702)
				var702 = var711
				table.insert(var701.options, t.WidgetStyleProp_ConditionalOption.decode(var710))
			else
				local _ = nil
				local var712, var713 = protoModule.readVarInt(p43, var702)
				var702 = var713 + var712
			end
		elseif var703 == protoModule.wireTypes.i32 then
			local _ = nil
			local var714, var715 = protoModule.readFixed32(p43, var702)
			local _ = var714
			var702 = var715
		elseif var703 == protoModule.wireTypes.i64 then
			local _ = nil
			local var716, var717 = protoModule.readFixed64(p43, var702)
			local _ = var716
			var702 = var717
		else
			error("Unsupported wire type: " .. var703)
		end
	end
	return var701
end

function t_22:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), t (ref)
	local var720 = t_22.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.WidgetStyleProp_ConditionalOption.jsonDecode(v))
		end
		var720.options = t_1
	end
	return var720
end

t_22.descriptor = {
	name = "WidgetStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.WidgetStyleProp_ConditionalOptions = t_22
typeRegistryModule.default:register(t.WidgetStyleProp_ConditionalOptions)

return {
	ItemFooter = t.ItemFooter,
	ArrayOfItemFooterProp = t.ArrayOfItemFooterProp,
	ArrayOfItemFooterProp_ConditionalOption = t.ArrayOfItemFooterProp_ConditionalOption,
	ArrayOfItemFooterProp_ConditionalOptions = t.ArrayOfItemFooterProp_ConditionalOptions,
	ArrayOfItemFooterProp_ArrayOfItemFooter = t.ArrayOfItemFooterProp_ArrayOfItemFooter,
	ArrayOfItemFooterProp_ArrayMap = t.ArrayOfItemFooterProp_ArrayMap,
	ArrayOfItemFooterProp_ArrayMap_LiteralItems = t.ArrayOfItemFooterProp_ArrayMap_LiteralItems,
	CardStyle = t.CardStyle,
	CardStyleProp = t.CardStyleProp,
	CardStyleProp_ConditionalOption = t.CardStyleProp_ConditionalOption,
	CardStyleProp_ConditionalOptions = t.CardStyleProp_ConditionalOptions,
	CatalogSortContent = t.CatalogSortContent,
	ArrayOfCatalogSortContentProp = t.ArrayOfCatalogSortContentProp,
	ArrayOfCatalogSortContentProp_ConditionalOption = t.ArrayOfCatalogSortContentProp_ConditionalOption,
	ArrayOfCatalogSortContentProp_ConditionalOptions = t.ArrayOfCatalogSortContentProp_ConditionalOptions,
	ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent,
	ArrayOfCatalogSortContentProp_ArrayMap = t.ArrayOfCatalogSortContentProp_ArrayMap,
	ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems = t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems,
	WidgetStyle = t.WidgetStyle,
	WidgetStyleProp = t.WidgetStyleProp,
	WidgetStyleProp_ConditionalOption = t.WidgetStyleProp_ConditionalOption,
	WidgetStyleProp_ConditionalOptions = t.WidgetStyleProp_ConditionalOptions
}