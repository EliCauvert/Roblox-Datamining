local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 197 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		resource_identifier = if p0 == nil or p0.resource_identifier == nil then "" else p0.resource_identifier
	}, t_1)
end

function t_1:encode() --[[ line: 205 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.resource_identifier ~= nil and self.resource_identifier ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.resource_identifier)
		buff = var12
		var11 = var13
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 219 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			local _ = nil
			local var22, var23 = protoModule.readVarInt(p1, var16)
			local _ = var22
			var16 = var23
			continue
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var16)
				var16 = var25
				var15.resource_identifier = buffer.tostring(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var16)
				var16 = var27 + var26
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var16)
			local _ = var28
			var16 = var29
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var16)
			local _ = var30
			var16 = var31
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var15
end

function t_1:jsonEncode() --[[ line: 262 ]]
	local t = {}
	
	if self.resource_identifier ~= nil and self.resource_identifier ~= "" then
		t.resourceIdentifier = self.resource_identifier
	end
	return t
end

function t_1:jsonDecode() --[[ line: 272 ]]
	-- upvalues: t_1 (ref)
	local var33 = t_1.new()
	
	if self.resource_identifier ~= nil then
		var33.resource_identifier = self.resource_identifier
	end
	if self.resourceIdentifier ~= nil then
		var33.resource_identifier = self.resourceIdentifier
	end
	return var33
end

t_1.descriptor = {
	name = "ImageBackground",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageBackground"
}
t.ImageBackground = t_1
typeRegistryModule.default:register(t.ImageBackground)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 300 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode() --[[ line: 306 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var35 = 0
	
	if self.kind ~= nil and self.kind.type == "image_background" then
		local var36 = self.kind.value:encode()
		local var37, var38 = protoModule.writeTag(buff, var35, 1, protoModule.wireTypes.lengthDelimited)
		var37, var38 = protoModule.writeBuffer(var37, var38, var36, buffer.len(var36))
		buff = var37
		var35 = var38
	end
	local buff_1 = buffer.create(var35)
	buffer.copy(buff_1, 0, buff, 0, var35)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 323 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var40 = t_2.new()
	local var41 = 0
	while var41 < buffer.len(p3) do
		local _ = nil
		local var42 = nil
		local var43, var44, var45 = protoModule.readTag(p3, var41)
		local var46 = var43
		var42 = var44
		var41 = var45
		
		if var42 == protoModule.wireTypes.varint then
			local _ = nil
			local var47, var48 = protoModule.readVarInt(p3, var41)
			local _ = var47
			var41 = var48
			continue
		end
		if var42 == protoModule.wireTypes.lengthDelimited then
			if var46 == 1 then
				local _ = nil
				local var49, var50 = protoModule.readBuffer(p3, var41)
				var41 = var50
				var40.kind = {
					type = "image_background",
					value = t.ImageBackground.decode(var49)
				}
			else
				local _ = nil
				local var51, var52 = protoModule.readVarInt(p3, var41)
				var41 = var52 + var51
			end
		elseif var42 == protoModule.wireTypes.i32 then
			local _ = nil
			local var53, var54 = protoModule.readFixed32(p3, var41)
			local _ = var53
			var41 = var54
		elseif var42 == protoModule.wireTypes.i64 then
			local _ = nil
			local var55, var56 = protoModule.readFixed64(p3, var41)
			local _ = var55
			var41 = var56
		else
			error("Unsupported wire type: " .. var42)
		end
	end
	return var40
end

function t_2:jsonEncode() --[[ line: 366 ]]
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "image_background" then
		t.imageBackground = self.kind.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 378 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var58 = t_2.new()
	
	if self.image_background ~= nil then
		var58.kind = {
			type = "image_background",
			value = t.ImageBackground.jsonDecode(self.image_background)
		}
	end
	if self.imageBackground ~= nil then
		var58.kind = {
			type = "image_background",
			value = t.ImageBackground.jsonDecode(self.imageBackground)
		}
	end
	return var58
end

t_2.descriptor = {
	name = "BackgroundLayer",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundLayer"
}
t.BackgroundLayer = t_2
typeRegistryModule.default:register(t.BackgroundLayer)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 408 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_3)
end

function t_3:encode() --[[ line: 416 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var60 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var61 = self.kind.value:encode()
			local var62, var63 = protoModule.writeTag(buff, var60, 1, protoModule.wireTypes.lengthDelimited)
			var62, var63 = protoModule.writeBuffer(var62, var63, var61, buffer.len(var61))
			buff = var62
			var60 = var63
		elseif self.kind.type == "binding_path" then
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var65 = protoModule.writeString(var64, var65, self.kind.value)
			buff = var64
			var60 = var65
		elseif self.kind.type == "conditional" then
			local var66 = self.kind.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var68 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
			buff = var67
			var60 = var68
		end
	end
	local buff_1 = buffer.create(var60)
	buffer.copy(buff_1, 0, buff, 0, var60)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 440 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var70 = t_3.new()
	local var71 = 0
	while var71 < buffer.len(p5) do
		local _ = nil
		local var72 = nil
		local var73, var74, var75 = protoModule.readTag(p5, var71)
		local var76 = var73
		var72 = var74
		var71 = var75
		
		if var72 == protoModule.wireTypes.varint then
			local _ = nil
			local var77, var78 = protoModule.readVarInt(p5, var71)
			local _ = var77
			var71 = var78
			continue
		end
		if var72 == protoModule.wireTypes.lengthDelimited then
			if var76 == 1 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p5, var71)
				var71 = var80
				var70.kind = {
					type = "literal",
					value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.decode(var79)
				}
			elseif var76 == 2 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p5, var71)
				var71 = var82
				var70.kind = { type = "binding_path", value = buffer.tostring(var81) }
			elseif var76 == 3 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p5, var71)
				var71 = var84
				var70.kind = {
					type = "conditional",
					value = t.ArrayOfBackgroundLayerProp_ConditionalOptions.decode(var83)
				}
			else
				local _ = nil
				local var85, var86 = protoModule.readVarInt(p5, var71)
				var71 = var86 + var85
			end
		elseif var72 == protoModule.wireTypes.i32 then
			local _ = nil
			local var87, var88 = protoModule.readFixed32(p5, var71)
			local _ = var87
			var71 = var88
		elseif var72 == protoModule.wireTypes.i64 then
			local _ = nil
			local var89, var90 = protoModule.readFixed64(p5, var71)
			local _ = var89
			var71 = var90
		else
			error("Unsupported wire type: " .. var72)
		end
	end
	return var70
end

function t_3:jsonEncode() --[[ line: 499 ]]
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

function t_3:jsonDecode() --[[ line: 515 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var92 = t_3.new()
	
	if self.literal ~= nil then
		var92.kind = {
			type = "literal",
			value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var92.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var92.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var92.kind = {
			type = "conditional",
			value = t.ArrayOfBackgroundLayerProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var92
end

t_3.descriptor = {
	name = "ArrayOfBackgroundLayerProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfBackgroundLayerProp"
}
t.ArrayOfBackgroundLayerProp = t_3
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 557 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		condition = if p6 == nil or p6.condition == nil then nil else p6.condition,
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind
	}, t_4)
end

function t_4:encode() --[[ line: 566 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var94 = 0
	
	if self.condition ~= nil then
		local var95 = self.condition:encode()
		local var96, var97 = protoModule.writeTag(buff, var94, 1, protoModule.wireTypes.lengthDelimited)
		var96, var97 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
		buff = var96
		var94 = var97
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var98 = self.kind.value:encode()
			local var99, var100 = protoModule.writeTag(buff, var94, 2, protoModule.wireTypes.lengthDelimited)
			var99, var100 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
			buff = var99
			var94 = var100
		elseif self.kind.type == "binding_path" then
			local var101, var102 = protoModule.writeTag(buff, var94, 3, protoModule.wireTypes.lengthDelimited)
			var101, var102 = protoModule.writeString(var101, var102, self.kind.value)
			buff = var101
			var94 = var102
		end
	end
	local buff_1 = buffer.create(var94)
	buffer.copy(buff_1, 0, buff, 0, var94)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 594 ]]
	-- upvalues: t_4 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var104 = t_4.new()
	local var105 = 0
	while var105 < buffer.len(p7) do
		local _ = nil
		local var106 = nil
		local var107, var108, var109 = protoModule.readTag(p7, var105)
		local var110 = var107
		var106 = var108
		var105 = var109
		
		if var106 == protoModule.wireTypes.varint then
			local _ = nil
			local var111, var112 = protoModule.readVarInt(p7, var105)
			local _ = var111
			var105 = var112
			continue
		end
		if var106 == protoModule.wireTypes.lengthDelimited then
			if var110 == 1 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p7, var105)
				var105 = var114
				var104.condition = propConditionModule.PropCondition.decode(var113)
			elseif var110 == 2 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p7, var105)
				var105 = var116
				var104.kind = {
					type = "literal",
					value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.decode(var115)
				}
			elseif var110 == 3 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p7, var105)
				var105 = var118
				var104.kind = { type = "binding_path", value = buffer.tostring(var117) }
			else
				local _ = nil
				local var119, var120 = protoModule.readVarInt(p7, var105)
				var105 = var120 + var119
			end
		elseif var106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var121, var122 = protoModule.readFixed32(p7, var105)
			local _ = var121
			var105 = var122
		elseif var106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var123, var124 = protoModule.readFixed64(p7, var105)
			local _ = var123
			var105 = var124
		else
			error("Unsupported wire type: " .. var106)
		end
	end
	return var104
end

function t_4:jsonEncode() --[[ line: 652 ]]
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

function t_4:jsonDecode() --[[ line: 672 ]]
	-- upvalues: t_4 (ref), propConditionModule (ref), t (ref)
	local var126 = t_4.new()
	
	if self.condition ~= nil then
		var126.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var126.kind = {
			type = "literal",
			value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var126.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var126.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var126
end

t_4.descriptor = {
	name = "ArrayOfBackgroundLayerProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfBackgroundLayerProp_ConditionalOption = t_4
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp_ConditionalOption)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 714 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		options = if p8 == nil or p8.options == nil then {} else p8.options
	}, t_5)
end

function t_5:encode() --[[ line: 722 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var128 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var129 = v:encode()
			local var130, var131 = protoModule.writeTag(buff, var128, 1, protoModule.wireTypes.lengthDelimited)
			var130, var131 = protoModule.writeBuffer(var130, var131, var129, buffer.len(var129))
			buff = var130
			var128 = var131
		end
	end
	local buff_1 = buffer.create(var128)
	buffer.copy(buff_1, 0, buff, 0, var128)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 741 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var133 = t_5.new()
	local var134 = 0
	while var134 < buffer.len(p9) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p9, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			local _ = nil
			local var140, var141 = protoModule.readVarInt(p9, var134)
			local _ = var140
			var134 = var141
			continue
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 1 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p9, var134)
				var134 = var143
				table.insert(var133.options, t.ArrayOfBackgroundLayerProp_ConditionalOption.decode(var142))
			else
				local _ = nil
				local var144, var145 = protoModule.readVarInt(p9, var134)
				var134 = var145 + var144
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var146, var147 = protoModule.readFixed32(p9, var134)
			local _ = var146
			var134 = var147
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var148, var149 = protoModule.readFixed64(p9, var134)
			local _ = var148
			var134 = var149
		else
			error("Unsupported wire type: " .. var135)
		end
	end
	return var133
end

function t_5:jsonEncode() --[[ line: 786 ]]
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

function t_5:jsonDecode() --[[ line: 802 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var152 = t_5.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfBackgroundLayerProp_ConditionalOption.jsonDecode(v))
		end
		var152.options = t_1
	end
	return var152
end

t_5.descriptor = {
	name = "ArrayOfBackgroundLayerProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfBackgroundLayerProp_ConditionalOptions = t_5
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp_ConditionalOptions)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 834 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		array = if p10 == nil or p10.array == nil then {} else p10.array
	}, t_6)
end

function t_6:encode() --[[ line: 845 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var155 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var156 = v:encode()
			local var157, var158 = protoModule.writeTag(buff, var155, 1, protoModule.wireTypes.lengthDelimited)
			var157, var158 = protoModule.writeBuffer(var157, var158, var156, buffer.len(var156))
			buff = var157
			var155 = var158
		end
	end
	local buff_1 = buffer.create(var155)
	buffer.copy(buff_1, 0, buff, 0, var155)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 864 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var160 = t_6.new()
	local var161 = 0
	while var161 < buffer.len(p11) do
		local _ = nil
		local var162 = nil
		local var163, var164, var165 = protoModule.readTag(p11, var161)
		local var166 = var163
		var162 = var164
		var161 = var165
		
		if var162 == protoModule.wireTypes.varint then
			local _ = nil
			local var167, var168 = protoModule.readVarInt(p11, var161)
			local _ = var167
			var161 = var168
			continue
		end
		if var162 == protoModule.wireTypes.lengthDelimited then
			if var166 == 1 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p11, var161)
				var161 = var170
				table.insert(var160.array, t.BackgroundLayer.decode(var169))
			else
				local _ = nil
				local var171, var172 = protoModule.readVarInt(p11, var161)
				var161 = var172 + var171
			end
		elseif var162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var173, var174 = protoModule.readFixed32(p11, var161)
			local _ = var173
			var161 = var174
		elseif var162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var175, var176 = protoModule.readFixed64(p11, var161)
			local _ = var175
			var161 = var176
		else
			error("Unsupported wire type: " .. var162)
		end
	end
	return var160
end

function t_6:jsonEncode() --[[ line: 909 ]]
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

function t_6:jsonDecode() --[[ line: 925 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var179 = t_6.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.BackgroundLayer.jsonDecode(v))
		end
		var179.array = t_1
	end
	return var179
end

t_6.descriptor = {
	name = "ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfBackgroundLayer"
}
t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer = t_6
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer)

return {
	ImageBackground = t.ImageBackground,
	BackgroundLayer = t.BackgroundLayer,
	ArrayOfBackgroundLayerProp = t.ArrayOfBackgroundLayerProp,
	ArrayOfBackgroundLayerProp_ConditionalOption = t.ArrayOfBackgroundLayerProp_ConditionalOption,
	ArrayOfBackgroundLayerProp_ConditionalOptions = t.ArrayOfBackgroundLayerProp_ConditionalOptions,
	ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer
}