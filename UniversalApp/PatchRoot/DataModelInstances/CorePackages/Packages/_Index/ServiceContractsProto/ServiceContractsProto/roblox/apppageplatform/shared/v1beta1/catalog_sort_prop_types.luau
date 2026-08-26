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

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		content_type = if p1 == nil or p1.content_type == nil then nil else p1.content_type
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.content_type ~= nil then
		local var2 = self.content_type:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var34 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), propTypesModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.content_type = propTypesModule.StringProp.decode(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var38)
		end
	end
	return var1
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
	local var18 = t_1.new()
	
	if self.content_type ~= nil then
		var18.content_type = propTypesModule.StringProp.jsonDecode(self.content_type)
	end
	if self.contentType ~= nil then
		var18.content_type = propTypesModule.StringProp.jsonDecode(self.contentType)
	end
	return var18
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
	local var18 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var19 = self.kind.value:encode()
			local var20, var21 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.lengthDelimited)
			var20, var59 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
			buff = var20
			var18 = var21
		elseif self.kind.type == "binding_path" then
			local var22, var23 = protoModule.writeTag(buff, var18, 2, protoModule.wireTypes.lengthDelimited)
			var22, var61 = protoModule.writeString(var22, var23, self.kind.value)
			buff = var22
			var18 = var23
		elseif self.kind.type == "conditional" then
			local var24 = self.kind.value:encode()
			local var25, var26 = protoModule.writeTag(buff, var18, 3, protoModule.wireTypes.lengthDelimited)
			var25, var64 = protoModule.writeBuffer(var25, var26, var24, buffer.len(var24))
			buff = var25
			var18 = var26
		elseif self.kind.type == "array_map" then
			local var27 = self.kind.value:encode()
			local var28, var29 = protoModule.writeTag(buff, var18, 4, protoModule.wireTypes.lengthDelimited)
			var28, var67 = protoModule.writeBuffer(var28, var29, var27, buffer.len(var27))
			buff = var28
			var18 = var29
		end
	end
	local buff_1 = buffer.create(var18)
	buffer.copy(buff_1, 0, buff, 0, var18)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var18 = t_2.new()
	local var19 = 0
	while var19 < buffer.len(p2) do
		local _ = nil
		local var20 = nil
		local var21, var22, var23 = protoModule.readTag(p2, var19)
		local var24 = var21
		var20 = var22
		var19 = var23
		
		if var20 == protoModule.wireTypes.varint then
			local _ = nil
			local var25, var26 = protoModule.readVarInt(p2, var19)
			local _ = var25
			var19 = var26
			continue
		end
		if var20 == protoModule.wireTypes.lengthDelimited then
			if var24 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p2, var19)
				var19 = var28
				var18.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(var27)
				}
			elseif var24 == 2 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p2, var19)
				var19 = var30
				var18.kind = { type = "binding_path", value = buffer.tostring(var29) }
			elseif var24 == 3 then
				local _ = nil
				local var31, var32 = protoModule.readBuffer(p2, var19)
				var19 = var32
				var18.kind = {
					type = "conditional",
					value = t.ArrayOfItemFooterProp_ConditionalOptions.decode(var31)
				}
			elseif var24 == 4 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p2, var19)
				var19 = var34
				var18.kind = {
					type = "array_map",
					value = t.ArrayOfItemFooterProp_ArrayMap.decode(var33)
				}
			else
				local _ = nil
				local var35, var36 = protoModule.readVarInt(p2, var19)
				var19 = var36 + var35
			end
		elseif var20 == protoModule.wireTypes.i32 then
			local _ = nil
			local var37, var38 = protoModule.readFixed32(p2, var19)
			local _ = var37
			var19 = var38
		elseif var20 == protoModule.wireTypes.i64 then
			local _ = nil
			local var39, var40 = protoModule.readFixed64(p2, var19)
			local _ = var39
			var19 = var40
		else
			error("Unsupported wire type: " .. var71)
		end
	end
	return var18
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
	local var41 = t_2.new()
	
	if self.literal ~= nil then
		var41.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var41.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var41.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var41.kind = {
			type = "conditional",
			value = t.ArrayOfItemFooterProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var41.kind = {
			type = "array_map",
			value = t.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var41.kind = {
			type = "array_map",
			value = t.ArrayOfItemFooterProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var41
end

t_2.descriptor = {
	name = "ArrayOfItemFooterProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooterProp"
}
t.ArrayOfItemFooterProp = t_2
typeRegistryModule.default:register(t.ArrayOfItemFooterProp)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		condition = if p3 == nil or p3.condition == nil then nil else p3.condition,
		kind = if p3 == nil or p3.kind == nil then nil else p3.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var41 = 0
	
	if self.condition ~= nil then
		local var42 = self.condition:encode()
		local var43, var44 = protoModule.writeTag(buff, var41, 1, protoModule.wireTypes.lengthDelimited)
		var43, var98 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var41 = var44
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var45 = self.kind.value:encode()
			local var46, var47 = protoModule.writeTag(buff, var41, 2, protoModule.wireTypes.lengthDelimited)
			var46, var101 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
			buff = var46
			var41 = var47
		elseif self.kind.type == "binding_path" then
			local var48, var49 = protoModule.writeTag(buff, var41, 3, protoModule.wireTypes.lengthDelimited)
			var48, var103 = protoModule.writeString(var48, var49, self.kind.value)
			buff = var48
			var41 = var49
		end
	end
	local buff_1 = buffer.create(var41)
	buffer.copy(buff_1, 0, buff, 0, var41)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var41 = t_3.new()
	local var42 = 0
	while var42 < buffer.len(p3) do
		local _ = nil
		local var43 = nil
		local var44, var45, var46 = protoModule.readTag(p3, var42)
		local var47 = var44
		var43 = var45
		var42 = var46
		
		if var43 == protoModule.wireTypes.varint then
			local _ = nil
			local var48, var49 = protoModule.readVarInt(p3, var42)
			local _ = var48
			var42 = var49
			continue
		end
		if var43 == protoModule.wireTypes.lengthDelimited then
			if var47 == 1 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p3, var42)
				var42 = var51
				var41.condition = propConditionModule.PropCondition.decode(var50)
			elseif var47 == 2 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p3, var42)
				var42 = var53
				var41.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.decode(var52)
				}
			elseif var47 == 3 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p3, var42)
				var42 = var55
				var41.kind = { type = "binding_path", value = buffer.tostring(var54) }
			else
				local _ = nil
				local var56, var57 = protoModule.readVarInt(p3, var42)
				var42 = var57 + var56
			end
		elseif var43 == protoModule.wireTypes.i32 then
			local _ = nil
			local var58, var59 = protoModule.readFixed32(p3, var42)
			local _ = var58
			var42 = var59
		elseif var43 == protoModule.wireTypes.i64 then
			local _ = nil
			local var60, var61 = protoModule.readFixed64(p3, var42)
			local _ = var60
			var42 = var61
		else
			error("Unsupported wire type: " .. var107)
		end
	end
	return var41
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
	local var62 = t_3.new()
	
	if self.condition ~= nil then
		var62.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var62.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayOfItemFooter.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var62.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var62.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var62
end

t_3.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfItemFooterProp_ConditionalOption = t_3
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ConditionalOption)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		options = if p4 == nil or p4.options == nil then {} else p4.options
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var62 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var63 = v:encode()
			local var64, var65 = protoModule.writeTag(buff, var62, 1, protoModule.wireTypes.lengthDelimited)
			var64, var132 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var62 = var65
		end
	end
	local buff_1 = buffer.create(var62)
	buffer.copy(buff_1, 0, buff, 0, var62)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var66 = t_4.new()
	local var67 = 0
	while var67 < buffer.len(p4) do
		local _ = nil
		local var68 = nil
		local var69, var70, var71 = protoModule.readTag(p4, var67)
		local var72 = var69
		var68 = var70
		var67 = var71
		
		if var68 == protoModule.wireTypes.varint then
			local _ = nil
			local var73, var74 = protoModule.readVarInt(p4, var67)
			local _ = var73
			var67 = var74
			continue
		end
		if var68 == protoModule.wireTypes.lengthDelimited then
			if var72 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p4, var67)
				var67 = var76
				table.insert(var66.options, t.ArrayOfItemFooterProp_ConditionalOption.decode(var75))
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p4, var67)
				var67 = var78 + var77
			end
		elseif var68 == protoModule.wireTypes.i32 then
			local _ = nil
			local var79, var80 = protoModule.readFixed32(p4, var67)
			local _ = var79
			var67 = var80
		elseif var68 == protoModule.wireTypes.i64 then
			local _ = nil
			local var81, var82 = protoModule.readFixed64(p4, var67)
			local _ = var81
			var67 = var82
		else
			error("Unsupported wire type: " .. var136)
		end
	end
	return var66
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
	local var83 = t_4.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfItemFooterProp_ConditionalOption.jsonDecode(v))
		end
		var83.options = t_1
	end
	return var83
end

t_4.descriptor = {
	name = "ArrayOfItemFooterProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfItemFooterProp_ConditionalOptions = t_4
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ConditionalOptions)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		array = if p5 == nil or p5.array == nil then {} else p5.array
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var84 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var85 = v:encode()
			local var86, var87 = protoModule.writeTag(buff, var84, 1, protoModule.wireTypes.lengthDelimited)
			var86, var159 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var84 = var87
		end
	end
	local buff_1 = buffer.create(var84)
	buffer.copy(buff_1, 0, buff, 0, var84)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var88 = t_5.new()
	local var89 = 0
	while var89 < buffer.len(p5) do
		local _ = nil
		local var90 = nil
		local var91, var92, var93 = protoModule.readTag(p5, var89)
		local var94 = var91
		var90 = var92
		var89 = var93
		
		if var90 == protoModule.wireTypes.varint then
			local _ = nil
			local var95, var96 = protoModule.readVarInt(p5, var89)
			local _ = var95
			var89 = var96
			continue
		end
		if var90 == protoModule.wireTypes.lengthDelimited then
			if var94 == 1 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p5, var89)
				var89 = var98
				table.insert(var88.array, t.ItemFooter.decode(var97))
			else
				local _ = nil
				local var99, var100 = protoModule.readVarInt(p5, var89)
				var89 = var100 + var99
			end
		elseif var90 == protoModule.wireTypes.i32 then
			local _ = nil
			local var101, var102 = protoModule.readFixed32(p5, var89)
			local _ = var101
			var89 = var102
		elseif var90 == protoModule.wireTypes.i64 then
			local _ = nil
			local var103, var104 = protoModule.readFixed64(p5, var89)
			local _ = var103
			var89 = var104
		else
			error("Unsupported wire type: " .. var163)
		end
	end
	return var88
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
	local var105 = t_5.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.ItemFooter.jsonDecode(v))
		end
		var105.array = t_1
	end
	return var105
end

t_5.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayOfItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfItemFooter"
}
t.ArrayOfItemFooterProp_ArrayOfItemFooter = t_5
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayOfItemFooter)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind,
		item_hydration_specs = if p6 == nil or p6.item_hydration_specs == nil then {} else p6.item_hydration_specs,
		field_map = if p6 == nil or p6.field_map == nil then nil else p6.field_map
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var106 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var107, var108 = protoModule.writeTag(buff, var106, 1, protoModule.wireTypes.lengthDelimited)
			var107, var185 = protoModule.writeString(var107, var108, self.kind.value)
			buff = var107
			var106 = var108
		elseif self.kind.type == "literal" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var106, 2, protoModule.wireTypes.lengthDelimited)
			var110, var188 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var106 = var111
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var112 = v:encode()
			local var113, var114 = protoModule.writeTag(buff, var106, 3, protoModule.wireTypes.lengthDelimited)
			var113, var191 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var106 = var114
		end
	end
	if self.field_map ~= nil then
		local var115 = self.field_map:encode()
		local var116, var117 = protoModule.writeTag(buff, var106, 4, protoModule.wireTypes.lengthDelimited)
		var116, var194 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
		buff = var116
		var106 = var117
	end
	local buff_1 = buffer.create(var106)
	buffer.copy(buff_1, 0, buff, 0, var106)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref), hydrationDataSpecModule (ref)
	local var118 = t_6.new()
	local var119 = 0
	while var119 < buffer.len(p6) do
		local _ = nil
		local var120 = nil
		local var121, var122, var123 = protoModule.readTag(p6, var119)
		local var124 = var121
		var120 = var122
		var119 = var123
		
		if var120 == protoModule.wireTypes.varint then
			local _ = nil
			local var125, var126 = protoModule.readVarInt(p6, var119)
			local _ = var125
			var119 = var126
			continue
		end
		if var120 == protoModule.wireTypes.lengthDelimited then
			if var124 == 1 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p6, var119)
				var119 = var128
				var118.kind = { type = "binding_path", value = buffer.tostring(var127) }
			elseif var124 == 2 then
				local _ = nil
				local var129, var130 = protoModule.readBuffer(p6, var119)
				var119 = var130
				var118.kind = {
					type = "literal",
					value = t.ArrayOfItemFooterProp_ArrayMap_LiteralItems.decode(var129)
				}
			elseif var124 == 3 then
				local _ = nil
				local var131, var132 = protoModule.readBuffer(p6, var119)
				var119 = var132
				table.insert(var118.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var131))
			elseif var124 == 4 then
				local _ = nil
				local var133, var134 = protoModule.readBuffer(p6, var119)
				var119 = var134
				var118.field_map = t.ItemFooter.decode(var133)
			else
				local _ = nil
				local var135, var136 = protoModule.readVarInt(p6, var119)
				var119 = var136 + var135
			end
		elseif var120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var137, var138 = protoModule.readFixed32(p6, var119)
			local _ = var137
			var119 = var138
		elseif var120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var139, var140 = protoModule.readFixed64(p6, var119)
			local _ = var139
			var119 = var140
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var118
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
	local var141 = t_6.new()
	
	if self.binding_path ~= nil then
		var141.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var141.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var141.kind = {
			type = "literal",
			value = t.ArrayOfItemFooterProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var141.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var141.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var141.field_map = t.ItemFooter.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var141.field_map = t.ItemFooter.jsonDecode(self.fieldMap)
	end
	return var141
end

t_6.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfItemFooterProp_ArrayMap = t_6
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayMap)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		items = if p7 == nil or p7.items == nil then {} else p7.items
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var142 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var143 = v:encode()
			local var144, var145 = protoModule.writeTag(buff, var142, 1, protoModule.wireTypes.lengthDelimited)
			var144, var228 = protoModule.writeBuffer(var144, var145, var143, buffer.len(var143))
			buff = var144
			var142 = var145
		end
	end
	local buff_1 = buffer.create(var142)
	buffer.copy(buff_1, 0, buff, 0, var142)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var146 = t_7.new()
	local var147 = 0
	while var147 < buffer.len(p7) do
		local _ = nil
		local var148 = nil
		local var149, var150, var151 = protoModule.readTag(p7, var147)
		local var152 = var149
		var148 = var150
		var147 = var151
		
		if var148 == protoModule.wireTypes.varint then
			local _ = nil
			local var153, var154 = protoModule.readVarInt(p7, var147)
			local _ = var153
			var147 = var154
			continue
		end
		if var148 == protoModule.wireTypes.lengthDelimited then
			if var152 == 1 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p7, var147)
				var147 = var156
				table.insert(var146.items, catalogSortDataModule.CatalogSortCardItemFooter.decode(var155))
			else
				local _ = nil
				local var157, var158 = protoModule.readVarInt(p7, var147)
				var147 = var158 + var157
			end
		elseif var148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var159, var160 = protoModule.readFixed32(p7, var147)
			local _ = var159
			var147 = var160
		elseif var148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var161, var162 = protoModule.readFixed64(p7, var147)
			local _ = var161
			var147 = var162
		else
			error("Unsupported wire type: " .. var232)
		end
	end
	return var146
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
	local var163 = t_7.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, catalogSortDataModule.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var163.items = t
	end
	return var163
end

t_7.descriptor = {
	name = "ArrayOfItemFooterProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
t.ArrayOfItemFooterProp_ArrayMap_LiteralItems = t_7
typeRegistryModule.default:register(t.ArrayOfItemFooterProp_ArrayMap_LiteralItems)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		thumbnail_aspect_ratio = if p8 == nil or p8.thumbnail_aspect_ratio == nil then nil else p8.thumbnail_aspect_ratio,
		background_layers = if p8 == nil or p8.background_layers == nil then nil else p8.background_layers
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var164 = 0
	
	if self.thumbnail_aspect_ratio ~= nil then
		local var165 = self.thumbnail_aspect_ratio:encode()
		local var166, var167 = protoModule.writeTag(buff, var164, 1, protoModule.wireTypes.lengthDelimited)
		var166, var255 = protoModule.writeBuffer(var166, var167, var165, buffer.len(var165))
		buff = var166
		var164 = var167
	end
	if self.background_layers ~= nil then
		local var168 = self.background_layers:encode()
		local var169, var170 = protoModule.writeTag(buff, var164, 2, protoModule.wireTypes.lengthDelimited)
		var169, var258 = protoModule.writeBuffer(var169, var170, var168, buffer.len(var168))
		buff = var169
		var164 = var170
	end
	local buff_1 = buffer.create(var164)
	buffer.copy(buff_1, 0, buff, 0, var164)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), propTypesModule (ref), backgroundLayerModule (ref)
	local var164 = t_8.new()
	local var165 = 0
	while var165 < buffer.len(p8) do
		local _ = nil
		local var166 = nil
		local var167, var168, var169 = protoModule.readTag(p8, var165)
		local var170 = var167
		var166 = var168
		var165 = var169
		
		if var166 == protoModule.wireTypes.varint then
			local _ = nil
			local var171, var172 = protoModule.readVarInt(p8, var165)
			local _ = var171
			var165 = var172
			continue
		end
		if var166 == protoModule.wireTypes.lengthDelimited then
			if var170 == 1 then
				local _ = nil
				local var173, var174 = protoModule.readBuffer(p8, var165)
				var165 = var174
				var164.thumbnail_aspect_ratio = propTypesModule.StringProp.decode(var173)
			elseif var170 == 2 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p8, var165)
				var165 = var176
				var164.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.decode(var175)
			else
				local _ = nil
				local var177, var178 = protoModule.readVarInt(p8, var165)
				var165 = var178 + var177
			end
		elseif var166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var179, var180 = protoModule.readFixed32(p8, var165)
			local _ = var179
			var165 = var180
		elseif var166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var181, var182 = protoModule.readFixed64(p8, var165)
			local _ = var181
			var165 = var182
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var164
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
	local var183 = t_8.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		var183.thumbnail_aspect_ratio = propTypesModule.StringProp.jsonDecode(self.thumbnail_aspect_ratio)
	end
	if self.thumbnailAspectRatio ~= nil then
		var183.thumbnail_aspect_ratio = propTypesModule.StringProp.jsonDecode(self.thumbnailAspectRatio)
	end
	if self.background_layers ~= nil then
		var183.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		var183.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return var183
end

t_8.descriptor = {
	name = "CardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyle"
}
t.CardStyle = t_8
typeRegistryModule.default:register(t.CardStyle)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		kind = if p9 == nil or p9.kind == nil then nil else p9.kind
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var183 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var183, 1, protoModule.wireTypes.lengthDelimited)
			var185, var285 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var183 = var186
		elseif self.kind.type == "binding_path" then
			local var187, var188 = protoModule.writeTag(buff, var183, 2, protoModule.wireTypes.lengthDelimited)
			var187, var287 = protoModule.writeString(var187, var188, self.kind.value)
			buff = var187
			var183 = var188
		elseif self.kind.type == "conditional" then
			local var189 = self.kind.value:encode()
			local var190, var191 = protoModule.writeTag(buff, var183, 3, protoModule.wireTypes.lengthDelimited)
			var190, var290 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
			buff = var190
			var183 = var191
		end
	end
	local buff_1 = buffer.create(var183)
	buffer.copy(buff_1, 0, buff, 0, var183)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var183 = t_9.new()
	local var184 = 0
	while var184 < buffer.len(p9) do
		local _ = nil
		local var185 = nil
		local var186, var187, var188 = protoModule.readTag(p9, var184)
		local var189 = var186
		var185 = var187
		var184 = var188
		
		if var185 == protoModule.wireTypes.varint then
			local _ = nil
			local var190, var191 = protoModule.readVarInt(p9, var184)
			local _ = var190
			var184 = var191
			continue
		end
		if var185 == protoModule.wireTypes.lengthDelimited then
			if var189 == 1 then
				local _ = nil
				local var192, var193 = protoModule.readBuffer(p9, var184)
				var184 = var193
				var183.kind = { type = "literal", value = t.CardStyle.decode(var192) }
			elseif var189 == 2 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p9, var184)
				var184 = var195
				var183.kind = { type = "binding_path", value = buffer.tostring(var194) }
			elseif var189 == 3 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p9, var184)
				var184 = var197
				var183.kind = {
					type = "conditional",
					value = t.CardStyleProp_ConditionalOptions.decode(var196)
				}
			else
				local _ = nil
				local var198, var199 = protoModule.readVarInt(p9, var184)
				var184 = var199 + var198
			end
		elseif var185 == protoModule.wireTypes.i32 then
			local _ = nil
			local var200, var201 = protoModule.readFixed32(p9, var184)
			local _ = var200
			var184 = var201
		elseif var185 == protoModule.wireTypes.i64 then
			local _ = nil
			local var202, var203 = protoModule.readFixed64(p9, var184)
			local _ = var202
			var184 = var203
		else
			error("Unsupported wire type: " .. var294)
		end
	end
	return var183
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
	local var204 = t_9.new()
	
	if self.literal ~= nil then
		var204.kind = {
			type = "literal",
			value = t.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var204.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var204.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var204.kind = {
			type = "conditional",
			value = t.CardStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var204
end

t_9.descriptor = {
	name = "CardStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardStyleProp"
}
t.CardStyleProp = t_9
typeRegistryModule.default:register(t.CardStyleProp)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		condition = if p10 == nil or p10.condition == nil then nil else p10.condition,
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var204 = 0
	
	if self.condition ~= nil then
		local var205 = self.condition:encode()
		local var206, var207 = protoModule.writeTag(buff, var204, 1, protoModule.wireTypes.lengthDelimited)
		var206, var319 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
		buff = var206
		var204 = var207
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var204, 2, protoModule.wireTypes.lengthDelimited)
			var209, var322 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var204 = var210
		elseif self.kind.type == "binding_path" then
			local var211, var212 = protoModule.writeTag(buff, var204, 3, protoModule.wireTypes.lengthDelimited)
			var211, var324 = protoModule.writeString(var211, var212, self.kind.value)
			buff = var211
			var204 = var212
		end
	end
	local buff_1 = buffer.create(var204)
	buffer.copy(buff_1, 0, buff, 0, var204)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var204 = t_10.new()
	local var205 = 0
	while var205 < buffer.len(p10) do
		local _ = nil
		local var206 = nil
		local var207, var208, var209 = protoModule.readTag(p10, var205)
		local var210 = var207
		var206 = var208
		var205 = var209
		
		if var206 == protoModule.wireTypes.varint then
			local _ = nil
			local var211, var212 = protoModule.readVarInt(p10, var205)
			local _ = var211
			var205 = var212
			continue
		end
		if var206 == protoModule.wireTypes.lengthDelimited then
			if var210 == 1 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p10, var205)
				var205 = var214
				var204.condition = propConditionModule.PropCondition.decode(var213)
			elseif var210 == 2 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p10, var205)
				var205 = var216
				var204.kind = { type = "literal", value = t.CardStyle.decode(var215) }
			elseif var210 == 3 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p10, var205)
				var205 = var218
				var204.kind = { type = "binding_path", value = buffer.tostring(var217) }
			else
				local _ = nil
				local var219, var220 = protoModule.readVarInt(p10, var205)
				var205 = var220 + var219
			end
		elseif var206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var221, var222 = protoModule.readFixed32(p10, var205)
			local _ = var221
			var205 = var222
		elseif var206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var223, var224 = protoModule.readFixed64(p10, var205)
			local _ = var223
			var205 = var224
		else
			error("Unsupported wire type: " .. var328)
		end
	end
	return var204
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
	local var225 = t_10.new()
	
	if self.condition ~= nil then
		var225.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var225.kind = {
			type = "literal",
			value = t.CardStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var225.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var225.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var225
end

t_10.descriptor = {
	name = "CardStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.CardStyleProp_ConditionalOption = t_10
typeRegistryModule.default:register(t.CardStyleProp_ConditionalOption)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		options = if p11 == nil or p11.options == nil then {} else p11.options
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var225 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var226 = v:encode()
			local var227, var228 = protoModule.writeTag(buff, var225, 1, protoModule.wireTypes.lengthDelimited)
			var227, var353 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var225 = var228
		end
	end
	local buff_1 = buffer.create(var225)
	buffer.copy(buff_1, 0, buff, 0, var225)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref)
	local var229 = t_11.new()
	local var230 = 0
	while var230 < buffer.len(p11) do
		local _ = nil
		local var231 = nil
		local var232, var233, var234 = protoModule.readTag(p11, var230)
		local var235 = var232
		var231 = var233
		var230 = var234
		
		if var231 == protoModule.wireTypes.varint then
			local _ = nil
			local var236, var237 = protoModule.readVarInt(p11, var230)
			local _ = var236
			var230 = var237
			continue
		end
		if var231 == protoModule.wireTypes.lengthDelimited then
			if var235 == 1 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p11, var230)
				var230 = var239
				table.insert(var229.options, t.CardStyleProp_ConditionalOption.decode(var238))
			else
				local _ = nil
				local var240, var241 = protoModule.readVarInt(p11, var230)
				var230 = var241 + var240
			end
		elseif var231 == protoModule.wireTypes.i32 then
			local _ = nil
			local var242, var243 = protoModule.readFixed32(p11, var230)
			local _ = var242
			var230 = var243
		elseif var231 == protoModule.wireTypes.i64 then
			local _ = nil
			local var244, var245 = protoModule.readFixed64(p11, var230)
			local _ = var244
			var230 = var245
		else
			error("Unsupported wire type: " .. var357)
		end
	end
	return var229
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
	local var246 = t_11.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.CardStyleProp_ConditionalOption.jsonDecode(v))
		end
		var246.options = t_1
	end
	return var246
end

t_11.descriptor = {
	name = "CardStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.CardStyleProp_ConditionalOptions = t_11
typeRegistryModule.default:register(t.CardStyleProp_ConditionalOptions)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		id = if p12 == nil or p12.id == nil then nil else p12.id,
		type = if p12 == nil or p12.type == nil then nil else p12.type
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var247 = 0
	
	if self.id ~= nil then
		local var248 = self.id:encode()
		local var249, var250 = protoModule.writeTag(buff, var247, 1, protoModule.wireTypes.lengthDelimited)
		var249, var380 = protoModule.writeBuffer(var249, var250, var248, buffer.len(var248))
		buff = var249
		var247 = var250
	end
	if self.type ~= nil then
		local var251 = self.type:encode()
		local var252, var253 = protoModule.writeTag(buff, var247, 2, protoModule.wireTypes.lengthDelimited)
		var252, var383 = protoModule.writeBuffer(var252, var253, var251, buffer.len(var251))
		buff = var252
		var247 = var253
	end
	local buff_1 = buffer.create(var247)
	buffer.copy(buff_1, 0, buff, 0, var247)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), propTypesModule (ref)
	local var247 = t_12.new()
	local var248 = 0
	while var248 < buffer.len(p12) do
		local _ = nil
		local var249 = nil
		local var250, var251, var252 = protoModule.readTag(p12, var248)
		local var253 = var250
		var249 = var251
		var248 = var252
		
		if var249 == protoModule.wireTypes.varint then
			local _ = nil
			local var254, var255 = protoModule.readVarInt(p12, var248)
			local _ = var254
			var248 = var255
			continue
		end
		if var249 == protoModule.wireTypes.lengthDelimited then
			if var253 == 1 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p12, var248)
				var248 = var257
				var247.id = propTypesModule.StringProp.decode(var256)
			elseif var253 == 2 then
				local _ = nil
				local var258, var259 = protoModule.readBuffer(p12, var248)
				var248 = var259
				var247.type = propTypesModule.StringProp.decode(var258)
			else
				local _ = nil
				local var260, var261 = protoModule.readVarInt(p12, var248)
				var248 = var261 + var260
			end
		elseif var249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var262, var263 = protoModule.readFixed32(p12, var248)
			local _ = var262
			var248 = var263
		elseif var249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var264, var265 = protoModule.readFixed64(p12, var248)
			local _ = var264
			var248 = var265
		else
			error("Unsupported wire type: " .. var387)
		end
	end
	return var247
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
	local var266 = t_12.new()
	
	if self.id ~= nil then
		var266.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.type ~= nil then
		var266.type = propTypesModule.StringProp.jsonDecode(self.type)
	end
	return var266
end

t_12.descriptor = {
	name = "CatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContent"
}
t.CatalogSortContent = t_12
typeRegistryModule.default:register(t.CatalogSortContent)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p13 == nil or p13.kind == nil then nil else p13.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var266 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var267 = self.kind.value:encode()
			local var268, var269 = protoModule.writeTag(buff, var266, 1, protoModule.wireTypes.lengthDelimited)
			var268, var410 = protoModule.writeBuffer(var268, var269, var267, buffer.len(var267))
			buff = var268
			var266 = var269
		elseif self.kind.type == "binding_path" then
			local var270, var271 = protoModule.writeTag(buff, var266, 2, protoModule.wireTypes.lengthDelimited)
			var270, var412 = protoModule.writeString(var270, var271, self.kind.value)
			buff = var270
			var266 = var271
		elseif self.kind.type == "conditional" then
			local var272 = self.kind.value:encode()
			local var273, var274 = protoModule.writeTag(buff, var266, 3, protoModule.wireTypes.lengthDelimited)
			var273, var415 = protoModule.writeBuffer(var273, var274, var272, buffer.len(var272))
			buff = var273
			var266 = var274
		elseif self.kind.type == "array_map" then
			local var275 = self.kind.value:encode()
			local var276, var277 = protoModule.writeTag(buff, var266, 4, protoModule.wireTypes.lengthDelimited)
			var276, var418 = protoModule.writeBuffer(var276, var277, var275, buffer.len(var275))
			buff = var276
			var266 = var277
		end
	end
	local buff_1 = buffer.create(var266)
	buffer.copy(buff_1, 0, buff, 0, var266)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var266 = t_13.new()
	local var267 = 0
	while var267 < buffer.len(p13) do
		local _ = nil
		local var268 = nil
		local var269, var270, var271 = protoModule.readTag(p13, var267)
		local var272 = var269
		var268 = var270
		var267 = var271
		
		if var268 == protoModule.wireTypes.varint then
			local _ = nil
			local var273, var274 = protoModule.readVarInt(p13, var267)
			local _ = var273
			var267 = var274
			continue
		end
		if var268 == protoModule.wireTypes.lengthDelimited then
			if var272 == 1 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p13, var267)
				var267 = var276
				var266.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(var275)
				}
			elseif var272 == 2 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p13, var267)
				var267 = var278
				var266.kind = { type = "binding_path", value = buffer.tostring(var277) }
			elseif var272 == 3 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p13, var267)
				var267 = var280
				var266.kind = {
					type = "conditional",
					value = t.ArrayOfCatalogSortContentProp_ConditionalOptions.decode(var279)
				}
			elseif var272 == 4 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p13, var267)
				var267 = var282
				var266.kind = {
					type = "array_map",
					value = t.ArrayOfCatalogSortContentProp_ArrayMap.decode(var281)
				}
			else
				local _ = nil
				local var283, var284 = protoModule.readVarInt(p13, var267)
				var267 = var284 + var283
			end
		elseif var268 == protoModule.wireTypes.i32 then
			local _ = nil
			local var285, var286 = protoModule.readFixed32(p13, var267)
			local _ = var285
			var267 = var286
		elseif var268 == protoModule.wireTypes.i64 then
			local _ = nil
			local var287, var288 = protoModule.readFixed64(p13, var267)
			local _ = var287
			var267 = var288
		else
			error("Unsupported wire type: " .. var422)
		end
	end
	return var266
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
	local var289 = t_13.new()
	
	if self.literal ~= nil then
		var289.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var289.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var289.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var289.kind = {
			type = "conditional",
			value = t.ArrayOfCatalogSortContentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var289.kind = {
			type = "array_map",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var289.kind = {
			type = "array_map",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var289
end

t_13.descriptor = {
	name = "ArrayOfCatalogSortContentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContentProp"
}
t.ArrayOfCatalogSortContentProp = t_13
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p14 == nil or p14.condition == nil then nil else p14.condition,
		kind = if p14 == nil or p14.kind == nil then nil else p14.kind
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var289 = 0
	
	if self.condition ~= nil then
		local var290 = self.condition:encode()
		local var291, var292 = protoModule.writeTag(buff, var289, 1, protoModule.wireTypes.lengthDelimited)
		var291, var449 = protoModule.writeBuffer(var291, var292, var290, buffer.len(var290))
		buff = var291
		var289 = var292
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var293 = self.kind.value:encode()
			local var294, var295 = protoModule.writeTag(buff, var289, 2, protoModule.wireTypes.lengthDelimited)
			var294, var452 = protoModule.writeBuffer(var294, var295, var293, buffer.len(var293))
			buff = var294
			var289 = var295
		elseif self.kind.type == "binding_path" then
			local var296, var297 = protoModule.writeTag(buff, var289, 3, protoModule.wireTypes.lengthDelimited)
			var296, var454 = protoModule.writeString(var296, var297, self.kind.value)
			buff = var296
			var289 = var297
		end
	end
	local buff_1 = buffer.create(var289)
	buffer.copy(buff_1, 0, buff, 0, var289)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var289 = t_14.new()
	local var290 = 0
	while var290 < buffer.len(p14) do
		local _ = nil
		local var291 = nil
		local var292, var293, var294 = protoModule.readTag(p14, var290)
		local var295 = var292
		var291 = var293
		var290 = var294
		
		if var291 == protoModule.wireTypes.varint then
			local _ = nil
			local var296, var297 = protoModule.readVarInt(p14, var290)
			local _ = var296
			var290 = var297
			continue
		end
		if var291 == protoModule.wireTypes.lengthDelimited then
			if var295 == 1 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p14, var290)
				var290 = var299
				var289.condition = propConditionModule.PropCondition.decode(var298)
			elseif var295 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p14, var290)
				var290 = var301
				var289.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.decode(var300)
				}
			elseif var295 == 3 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p14, var290)
				var290 = var303
				var289.kind = { type = "binding_path", value = buffer.tostring(var302) }
			else
				local _ = nil
				local var304, var305 = protoModule.readVarInt(p14, var290)
				var290 = var305 + var304
			end
		elseif var291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var306, var307 = protoModule.readFixed32(p14, var290)
			local _ = var306
			var290 = var307
		elseif var291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var308, var309 = protoModule.readFixed64(p14, var290)
			local _ = var308
			var290 = var309
		else
			error("Unsupported wire type: " .. var458)
		end
	end
	return var289
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
	local var310 = t_14.new()
	
	if self.condition ~= nil then
		var310.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var310.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var310.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var310.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var310
end

t_14.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfCatalogSortContentProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p15 == nil or p15.options == nil then {} else p15.options
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var310 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var311 = v:encode()
			local var312, var313 = protoModule.writeTag(buff, var310, 1, protoModule.wireTypes.lengthDelimited)
			var312, var483 = protoModule.writeBuffer(var312, var313, var311, buffer.len(var311))
			buff = var312
			var310 = var313
		end
	end
	local buff_1 = buffer.create(var310)
	buffer.copy(buff_1, 0, buff, 0, var310)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var314 = t_15.new()
	local var315 = 0
	while var315 < buffer.len(p15) do
		local _ = nil
		local var316 = nil
		local var317, var318, var319 = protoModule.readTag(p15, var315)
		local var320 = var317
		var316 = var318
		var315 = var319
		
		if var316 == protoModule.wireTypes.varint then
			local _ = nil
			local var321, var322 = protoModule.readVarInt(p15, var315)
			local _ = var321
			var315 = var322
			continue
		end
		if var316 == protoModule.wireTypes.lengthDelimited then
			if var320 == 1 then
				local _ = nil
				local var323, var324 = protoModule.readBuffer(p15, var315)
				var315 = var324
				table.insert(var314.options, t.ArrayOfCatalogSortContentProp_ConditionalOption.decode(var323))
			else
				local _ = nil
				local var325, var326 = protoModule.readVarInt(p15, var315)
				var315 = var326 + var325
			end
		elseif var316 == protoModule.wireTypes.i32 then
			local _ = nil
			local var327, var328 = protoModule.readFixed32(p15, var315)
			local _ = var327
			var315 = var328
		elseif var316 == protoModule.wireTypes.i64 then
			local _ = nil
			local var329, var330 = protoModule.readFixed64(p15, var315)
			local _ = var329
			var315 = var330
		else
			error("Unsupported wire type: " .. var487)
		end
	end
	return var314
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
	local var331 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfCatalogSortContentProp_ConditionalOption.jsonDecode(v))
		end
		var331.options = t_1
	end
	return var331
end

t_15.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfCatalogSortContentProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		array = if p16 == nil or p16.array == nil then {} else p16.array
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var332 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var333 = v:encode()
			local var334, var335 = protoModule.writeTag(buff, var332, 1, protoModule.wireTypes.lengthDelimited)
			var334, var510 = protoModule.writeBuffer(var334, var335, var333, buffer.len(var333))
			buff = var334
			var332 = var335
		end
	end
	local buff_1 = buffer.create(var332)
	buffer.copy(buff_1, 0, buff, 0, var332)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var336 = t_16.new()
	local var337 = 0
	while var337 < buffer.len(p16) do
		local _ = nil
		local var338 = nil
		local var339, var340, var341 = protoModule.readTag(p16, var337)
		local var342 = var339
		var338 = var340
		var337 = var341
		
		if var338 == protoModule.wireTypes.varint then
			local _ = nil
			local var343, var344 = protoModule.readVarInt(p16, var337)
			local _ = var343
			var337 = var344
			continue
		end
		if var338 == protoModule.wireTypes.lengthDelimited then
			if var342 == 1 then
				local _ = nil
				local var345, var346 = protoModule.readBuffer(p16, var337)
				var337 = var346
				table.insert(var336.array, t.CatalogSortContent.decode(var345))
			else
				local _ = nil
				local var347, var348 = protoModule.readVarInt(p16, var337)
				var337 = var348 + var347
			end
		elseif var338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var349, var350 = protoModule.readFixed32(p16, var337)
			local _ = var349
			var337 = var350
		elseif var338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var351, var352 = protoModule.readFixed64(p16, var337)
			local _ = var351
			var337 = var352
		else
			error("Unsupported wire type: " .. var514)
		end
	end
	return var336
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
	local var353 = t_16.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.CatalogSortContent.jsonDecode(v))
		end
		var353.array = t_1
	end
	return var353
end

t_16.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfCatalogSortContent"
}
t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent = t_16
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayOfCatalogSortContent)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind,
		item_hydration_specs = if p17 == nil or p17.item_hydration_specs == nil then {} else p17.item_hydration_specs,
		field_map = if p17 == nil or p17.field_map == nil then nil else p17.field_map
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var354 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var355, var356 = protoModule.writeTag(buff, var354, 1, protoModule.wireTypes.lengthDelimited)
			var355, var536 = protoModule.writeString(var355, var356, self.kind.value)
			buff = var355
			var354 = var356
		elseif self.kind.type == "literal" then
			local var357 = self.kind.value:encode()
			local var358, var359 = protoModule.writeTag(buff, var354, 2, protoModule.wireTypes.lengthDelimited)
			var358, var539 = protoModule.writeBuffer(var358, var359, var357, buffer.len(var357))
			buff = var358
			var354 = var359
		end
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var360 = v:encode()
			local var361, var362 = protoModule.writeTag(buff, var354, 3, protoModule.wireTypes.lengthDelimited)
			var361, var542 = protoModule.writeBuffer(var361, var362, var360, buffer.len(var360))
			buff = var361
			var354 = var362
		end
	end
	if self.field_map ~= nil then
		local var363 = self.field_map:encode()
		local var364, var365 = protoModule.writeTag(buff, var354, 4, protoModule.wireTypes.lengthDelimited)
		var364, var545 = protoModule.writeBuffer(var364, var365, var363, buffer.len(var363))
		buff = var364
		var354 = var365
	end
	local buff_1 = buffer.create(var354)
	buffer.copy(buff_1, 0, buff, 0, var354)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref), hydrationDataSpecModule (ref)
	local var366 = t_17.new()
	local var367 = 0
	while var367 < buffer.len(p17) do
		local _ = nil
		local var368 = nil
		local var369, var370, var371 = protoModule.readTag(p17, var367)
		local var372 = var369
		var368 = var370
		var367 = var371
		
		if var368 == protoModule.wireTypes.varint then
			local _ = nil
			local var373, var374 = protoModule.readVarInt(p17, var367)
			local _ = var373
			var367 = var374
			continue
		end
		if var368 == protoModule.wireTypes.lengthDelimited then
			if var372 == 1 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p17, var367)
				var367 = var376
				var366.kind = { type = "binding_path", value = buffer.tostring(var375) }
			elseif var372 == 2 then
				local _ = nil
				local var377, var378 = protoModule.readBuffer(p17, var367)
				var367 = var378
				var366.kind = {
					type = "literal",
					value = t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.decode(var377)
				}
			elseif var372 == 3 then
				local _ = nil
				local var379, var380 = protoModule.readBuffer(p17, var367)
				var367 = var380
				table.insert(var366.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var379))
			elseif var372 == 4 then
				local _ = nil
				local var381, var382 = protoModule.readBuffer(p17, var367)
				var367 = var382
				var366.field_map = t.CatalogSortContent.decode(var381)
			else
				local _ = nil
				local var383, var384 = protoModule.readVarInt(p17, var367)
				var367 = var384 + var383
			end
		elseif var368 == protoModule.wireTypes.i32 then
			local _ = nil
			local var385, var386 = protoModule.readFixed32(p17, var367)
			local _ = var385
			var367 = var386
		elseif var368 == protoModule.wireTypes.i64 then
			local _ = nil
			local var387, var388 = protoModule.readFixed64(p17, var367)
			local _ = var387
			var367 = var388
		else
			error("Unsupported wire type: " .. var549)
		end
	end
	return var366
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
	local var389 = t_17.new()
	
	if self.binding_path ~= nil then
		var389.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var389.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var389.kind = {
			type = "literal",
			value = t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems.jsonDecode(self.literal)
		}
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var389.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var389.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var389.field_map = t.CatalogSortContent.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var389.field_map = t.CatalogSortContent.jsonDecode(self.fieldMap)
	end
	return var389
end

t_17.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfCatalogSortContentProp_ArrayMap = t_17
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayMap)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		items = if p18 == nil or p18.items == nil then {} else p18.items
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var390 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var391 = v:encode()
			local var392, var393 = protoModule.writeTag(buff, var390, 1, protoModule.wireTypes.lengthDelimited)
			var392, var579 = protoModule.writeBuffer(var392, var393, var391, buffer.len(var391))
			buff = var392
			var390 = var393
		end
	end
	local buff_1 = buffer.create(var390)
	buffer.copy(buff_1, 0, buff, 0, var390)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var394 = t_18.new()
	local var395 = 0
	while var395 < buffer.len(p18) do
		local _ = nil
		local var396 = nil
		local var397, var398, var399 = protoModule.readTag(p18, var395)
		local var400 = var397
		var396 = var398
		var395 = var399
		
		if var396 == protoModule.wireTypes.varint then
			local _ = nil
			local var401, var402 = protoModule.readVarInt(p18, var395)
			local _ = var401
			var395 = var402
			continue
		end
		if var396 == protoModule.wireTypes.lengthDelimited then
			if var400 == 1 then
				local _ = nil
				local var403, var404 = protoModule.readBuffer(p18, var395)
				var395 = var404
				table.insert(var394.items, catalogSortDataModule.CatalogSortContentData.decode(var403))
			else
				local _ = nil
				local var405, var406 = protoModule.readVarInt(p18, var395)
				var395 = var406 + var405
			end
		elseif var396 == protoModule.wireTypes.i32 then
			local _ = nil
			local var407, var408 = protoModule.readFixed32(p18, var395)
			local _ = var407
			var395 = var408
		elseif var396 == protoModule.wireTypes.i64 then
			local _ = nil
			local var409, var410 = protoModule.readFixed64(p18, var395)
			local _ = var409
			var395 = var410
		else
			error("Unsupported wire type: " .. var583)
		end
	end
	return var394
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
	local var411 = t_18.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, catalogSortDataModule.CatalogSortContentData.jsonDecode(v))
		end
		var411.items = t
	end
	return var411
end

t_18.descriptor = {
	name = "ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralItems"
}
t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems = t_18
typeRegistryModule.default:register(t.ArrayOfCatalogSortContentProp_ArrayMap_LiteralItems)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p19)
	-- upvalues: t_19 (ref)
	return setmetatable({
		background_layers = if p19 == nil or p19.background_layers == nil then nil else p19.background_layers
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var412 = 0
	
	if self.background_layers ~= nil then
		local var413 = self.background_layers:encode()
		local var414, var415 = protoModule.writeTag(buff, var412, 1, protoModule.wireTypes.lengthDelimited)
		var414, var606 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
		buff = var414
		var412 = var415
	end
	local buff_1 = buffer.create(var412)
	buffer.copy(buff_1, 0, buff, 0, var412)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var412 = t_19.new()
	local var413 = 0
	while var413 < buffer.len(p19) do
		local _ = nil
		local var414 = nil
		local var415, var416, var417 = protoModule.readTag(p19, var413)
		local var418 = var415
		var414 = var416
		var413 = var417
		
		if var414 == protoModule.wireTypes.varint then
			local _ = nil
			local var419, var420 = protoModule.readVarInt(p19, var413)
			local _ = var419
			var413 = var420
			continue
		end
		if var414 == protoModule.wireTypes.lengthDelimited then
			if var418 == 1 then
				local _ = nil
				local var421, var422 = protoModule.readBuffer(p19, var413)
				var413 = var422
				var412.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.decode(var421)
			else
				local _ = nil
				local var423, var424 = protoModule.readVarInt(p19, var413)
				var413 = var424 + var423
			end
		elseif var414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var425, var426 = protoModule.readFixed32(p19, var413)
			local _ = var425
			var413 = var426
		elseif var414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var427, var428 = protoModule.readFixed64(p19, var413)
			local _ = var427
			var413 = var428
		else
			error("Unsupported wire type: " .. var610)
		end
	end
	return var412
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
	local var429 = t_19.new()
	
	if self.background_layers ~= nil then
		var429.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.background_layers)
	end
	if self.backgroundLayers ~= nil then
		var429.background_layers = backgroundLayerModule.ArrayOfBackgroundLayerProp.jsonDecode(self.backgroundLayers)
	end
	return var429
end

t_19.descriptor = {
	name = "WidgetStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyle"
}
t.WidgetStyle = t_19
typeRegistryModule.default:register(t.WidgetStyle)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		kind = if p20 == nil or p20.kind == nil then nil else p20.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var429 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var430 = self.kind.value:encode()
			local var431, var432 = protoModule.writeTag(buff, var429, 1, protoModule.wireTypes.lengthDelimited)
			var431, var631 = protoModule.writeBuffer(var431, var432, var430, buffer.len(var430))
			buff = var431
			var429 = var432
		elseif self.kind.type == "binding_path" then
			local var433, var434 = protoModule.writeTag(buff, var429, 2, protoModule.wireTypes.lengthDelimited)
			var433, var633 = protoModule.writeString(var433, var434, self.kind.value)
			buff = var433
			var429 = var434
		elseif self.kind.type == "conditional" then
			local var435 = self.kind.value:encode()
			local var436, var437 = protoModule.writeTag(buff, var429, 3, protoModule.wireTypes.lengthDelimited)
			var436, var636 = protoModule.writeBuffer(var436, var437, var435, buffer.len(var435))
			buff = var436
			var429 = var437
		end
	end
	local buff_1 = buffer.create(var429)
	buffer.copy(buff_1, 0, buff, 0, var429)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), t (ref)
	local var429 = t_20.new()
	local var430 = 0
	while var430 < buffer.len(p20) do
		local _ = nil
		local var431 = nil
		local var432, var433, var434 = protoModule.readTag(p20, var430)
		local var435 = var432
		var431 = var433
		var430 = var434
		
		if var431 == protoModule.wireTypes.varint then
			local _ = nil
			local var436, var437 = protoModule.readVarInt(p20, var430)
			local _ = var436
			var430 = var437
			continue
		end
		if var431 == protoModule.wireTypes.lengthDelimited then
			if var435 == 1 then
				local _ = nil
				local var438, var439 = protoModule.readBuffer(p20, var430)
				var430 = var439
				var429.kind = { type = "literal", value = t.WidgetStyle.decode(var438) }
			elseif var435 == 2 then
				local _ = nil
				local var440, var441 = protoModule.readBuffer(p20, var430)
				var430 = var441
				var429.kind = { type = "binding_path", value = buffer.tostring(var440) }
			elseif var435 == 3 then
				local _ = nil
				local var442, var443 = protoModule.readBuffer(p20, var430)
				var430 = var443
				var429.kind = {
					type = "conditional",
					value = t.WidgetStyleProp_ConditionalOptions.decode(var442)
				}
			else
				local _ = nil
				local var444, var445 = protoModule.readVarInt(p20, var430)
				var430 = var445 + var444
			end
		elseif var431 == protoModule.wireTypes.i32 then
			local _ = nil
			local var446, var447 = protoModule.readFixed32(p20, var430)
			local _ = var446
			var430 = var447
		elseif var431 == protoModule.wireTypes.i64 then
			local _ = nil
			local var448, var449 = protoModule.readFixed64(p20, var430)
			local _ = var448
			var430 = var449
		else
			error("Unsupported wire type: " .. var640)
		end
	end
	return var429
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
	local var450 = t_20.new()
	
	if self.literal ~= nil then
		var450.kind = {
			type = "literal",
			value = t.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var450.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var450.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var450.kind = {
			type = "conditional",
			value = t.WidgetStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var450
end

t_20.descriptor = {
	name = "WidgetStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleProp"
}
t.WidgetStyleProp = t_20
typeRegistryModule.default:register(t.WidgetStyleProp)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t_21 (ref)
	return setmetatable({
		condition = if p21 == nil or p21.condition == nil then nil else p21.condition,
		kind = if p21 == nil or p21.kind == nil then nil else p21.kind
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var450 = 0
	
	if self.condition ~= nil then
		local var451 = self.condition:encode()
		local var452, var453 = protoModule.writeTag(buff, var450, 1, protoModule.wireTypes.lengthDelimited)
		var452, var665 = protoModule.writeBuffer(var452, var453, var451, buffer.len(var451))
		buff = var452
		var450 = var453
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var454 = self.kind.value:encode()
			local var455, var456 = protoModule.writeTag(buff, var450, 2, protoModule.wireTypes.lengthDelimited)
			var455, var668 = protoModule.writeBuffer(var455, var456, var454, buffer.len(var454))
			buff = var455
			var450 = var456
		elseif self.kind.type == "binding_path" then
			local var457, var458 = protoModule.writeTag(buff, var450, 3, protoModule.wireTypes.lengthDelimited)
			var457, var670 = protoModule.writeString(var457, var458, self.kind.value)
			buff = var457
			var450 = var458
		end
	end
	local buff_1 = buffer.create(var450)
	buffer.copy(buff_1, 0, buff, 0, var450)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var450 = t_21.new()
	local var451 = 0
	while var451 < buffer.len(p21) do
		local _ = nil
		local var452 = nil
		local var453, var454, var455 = protoModule.readTag(p21, var451)
		local var456 = var453
		var452 = var454
		var451 = var455
		
		if var452 == protoModule.wireTypes.varint then
			local _ = nil
			local var457, var458 = protoModule.readVarInt(p21, var451)
			local _ = var457
			var451 = var458
			continue
		end
		if var452 == protoModule.wireTypes.lengthDelimited then
			if var456 == 1 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p21, var451)
				var451 = var460
				var450.condition = propConditionModule.PropCondition.decode(var459)
			elseif var456 == 2 then
				local _ = nil
				local var461, var462 = protoModule.readBuffer(p21, var451)
				var451 = var462
				var450.kind = { type = "literal", value = t.WidgetStyle.decode(var461) }
			elseif var456 == 3 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p21, var451)
				var451 = var464
				var450.kind = { type = "binding_path", value = buffer.tostring(var463) }
			else
				local _ = nil
				local var465, var466 = protoModule.readVarInt(p21, var451)
				var451 = var466 + var465
			end
		elseif var452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var467, var468 = protoModule.readFixed32(p21, var451)
			local _ = var467
			var451 = var468
		elseif var452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var469, var470 = protoModule.readFixed64(p21, var451)
			local _ = var469
			var451 = var470
		else
			error("Unsupported wire type: " .. var674)
		end
	end
	return var450
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
	local var471 = t_21.new()
	
	if self.condition ~= nil then
		var471.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var471.kind = {
			type = "literal",
			value = t.WidgetStyle.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var471.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var471.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var471
end

t_21.descriptor = {
	name = "WidgetStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.WidgetStyleProp_ConditionalOption = t_21
typeRegistryModule.default:register(t.WidgetStyleProp_ConditionalOption)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		options = if p22 == nil or p22.options == nil then {} else p22.options
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var471 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var472 = v:encode()
			local var473, var474 = protoModule.writeTag(buff, var471, 1, protoModule.wireTypes.lengthDelimited)
			var473, var699 = protoModule.writeBuffer(var473, var474, var472, buffer.len(var472))
			buff = var473
			var471 = var474
		end
	end
	local buff_1 = buffer.create(var471)
	buffer.copy(buff_1, 0, buff, 0, var471)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var475 = t_22.new()
	local var476 = 0
	while var476 < buffer.len(p22) do
		local _ = nil
		local var477 = nil
		local var478, var479, var480 = protoModule.readTag(p22, var476)
		local var481 = var478
		var477 = var479
		var476 = var480
		
		if var477 == protoModule.wireTypes.varint then
			local _ = nil
			local var482, var483 = protoModule.readVarInt(p22, var476)
			local _ = var482
			var476 = var483
			continue
		end
		if var477 == protoModule.wireTypes.lengthDelimited then
			if var481 == 1 then
				local _ = nil
				local var484, var485 = protoModule.readBuffer(p22, var476)
				var476 = var485
				table.insert(var475.options, t.WidgetStyleProp_ConditionalOption.decode(var484))
			else
				local _ = nil
				local var486, var487 = protoModule.readVarInt(p22, var476)
				var476 = var487 + var486
			end
		elseif var477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var488, var489 = protoModule.readFixed32(p22, var476)
			local _ = var488
			var476 = var489
		elseif var477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var490, var491 = protoModule.readFixed64(p22, var476)
			local _ = var490
			var476 = var491
		else
			error("Unsupported wire type: " .. var703)
		end
	end
	return var475
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
	local var492 = t_22.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.WidgetStyleProp_ConditionalOption.jsonDecode(v))
		end
		var492.options = t_1
	end
	return var492
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