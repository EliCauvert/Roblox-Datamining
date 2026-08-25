local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p0 == nil or p0.kind == nil then nil else p0.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var41 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var42, var43 = protoModule.writeTag(buff, var41, 1, protoModule.wireTypes.varint)
			var42, var43 = protoModule.writeVarInt(var42, var43, t.AutomaticSize.toNumber(self.kind.value))
			buff = var42
			var41 = var43
		elseif self.kind.type == "binding_path" then
			local var44, var45 = protoModule.writeTag(buff, var41, 2, protoModule.wireTypes.lengthDelimited)
			var44, var45 = protoModule.writeString(var44, var45, self.kind.value)
			buff = var44
			var41 = var45
		elseif self.kind.type == "conditional" then
			local var46 = self.kind.value:encode()
			local var47, var48 = protoModule.writeTag(buff, var41, 3, protoModule.wireTypes.lengthDelimited)
			var47, var48 = protoModule.writeBuffer(var47, var48, var46, buffer.len(var46))
			buff = var47
			var41 = var48
		end
	end
	local buff_1 = buffer.create(var41)
	buffer.copy(buff_1, 0, buff, 0, var41)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var50 = t_1.new()
	local var51 = 0
	while var51 < buffer.len(p1) do
		local _ = nil
		local var52 = nil
		local var53, var54, var55 = protoModule.readTag(p1, var51)
		local var56 = var53
		var52 = var54
		var51 = var55
		
		if var52 == protoModule.wireTypes.varint then
			if var56 == 1 then
				local _ = nil
				local var57, var58 = protoModule.readVarIntI32(p1, var51)
				local var59 = var57
				var51 = var58
				var50.kind = {
					type = "literal",
					value = t.AutomaticSize.fromNumber(var59) or var59
				}
			else
				local _ = nil
				local var60, var61 = protoModule.readVarInt(p1, var51)
				local _ = var60
				var51 = var61
			end
		end
		if var52 == protoModule.wireTypes.lengthDelimited then
			if var56 == 2 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var51)
				var51 = var63
				var50.kind = { type = "binding_path", value = buffer.tostring(var62) }
			elseif var56 == 3 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var51)
				var51 = var65
				var50.kind = {
					type = "conditional",
					value = t.AutomaticSizeProp_ConditionalOptions.decode(var64)
				}
			else
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p1, var51)
				var51 = var67 + var66
			end
		elseif var52 == protoModule.wireTypes.i32 then
			local _ = nil
			local var68, var69 = protoModule.readFixed32(p1, var51)
			local _ = var68
			var51 = var69
		elseif var52 == protoModule.wireTypes.i64 then
			local _ = nil
			local var70, var71 = protoModule.readFixed64(p1, var51)
			local _ = var70
			var51 = var71
		else
			error("Unsupported wire type: " .. var52)
		end
	end
	return var50
end

function t_1:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.AutomaticSize.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var73 = t_1.new()
	
	if self.literal ~= nil then
		var73.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.AutomaticSize.fromNumber(self.literal) or self.literal else t.AutomaticSize.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var73.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var73.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var73.kind = {
			type = "conditional",
			value = t.AutomaticSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var73
end

t_1.descriptor = {
	name = "AutomaticSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AutomaticSizeProp"
}
t.AutomaticSizeProp = t_1
typeRegistryModule.default:register(t.AutomaticSizeProp)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		condition = if p2 == nil or p2.condition == nil then nil else p2.condition,
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var75 = 0
	
	if self.condition ~= nil then
		local var76 = self.condition:encode()
		local var77, var78 = protoModule.writeTag(buff, var75, 1, protoModule.wireTypes.lengthDelimited)
		var77, var78 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
		buff = var77
		var75 = var78
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var79, var80 = protoModule.writeTag(buff, var75, 2, protoModule.wireTypes.varint)
			var79, var80 = protoModule.writeVarInt(var79, var80, t.AutomaticSize.toNumber(self.kind.value))
			buff = var79
			var75 = var80
		elseif self.kind.type == "binding_path" then
			local var81, var82 = protoModule.writeTag(buff, var75, 3, protoModule.wireTypes.lengthDelimited)
			var81, var82 = protoModule.writeString(var81, var82, self.kind.value)
			buff = var81
			var75 = var82
		end
	end
	local buff_1 = buffer.create(var75)
	buffer.copy(buff_1, 0, buff, 0, var75)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var84 = t_2.new()
	local var85 = 0
	while var85 < buffer.len(p3) do
		local _ = nil
		local var86 = nil
		local var87, var88, var89 = protoModule.readTag(p3, var85)
		local var90 = var87
		var86 = var88
		var85 = var89
		
		if var86 == protoModule.wireTypes.varint then
			if var90 == 2 then
				local _ = nil
				local var91, var92 = protoModule.readVarIntI32(p3, var85)
				local var93 = var91
				var85 = var92
				var84.kind = {
					type = "literal",
					value = t.AutomaticSize.fromNumber(var93) or var93
				}
			else
				local _ = nil
				local var94, var95 = protoModule.readVarInt(p3, var85)
				local _ = var94
				var85 = var95
			end
		end
		if var86 == protoModule.wireTypes.lengthDelimited then
			if var90 == 1 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p3, var85)
				var85 = var97
				var84.condition = propConditionModule.PropCondition.decode(var96)
			elseif var90 == 3 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p3, var85)
				var85 = var99
				var84.kind = { type = "binding_path", value = buffer.tostring(var98) }
			else
				local _ = nil
				local var100, var101 = protoModule.readVarInt(p3, var85)
				var85 = var101 + var100
			end
		elseif var86 == protoModule.wireTypes.i32 then
			local _ = nil
			local var102, var103 = protoModule.readFixed32(p3, var85)
			local _ = var102
			var85 = var103
		elseif var86 == protoModule.wireTypes.i64 then
			local _ = nil
			local var104, var105 = protoModule.readFixed64(p3, var85)
			local _ = var104
			var85 = var105
		else
			error("Unsupported wire type: " .. var86)
		end
	end
	return var84
end

function t_2:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.AutomaticSize.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), propConditionModule (ref), t (ref)
	local var107 = t_2.new()
	
	if self.condition ~= nil then
		var107.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var107.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.AutomaticSize.fromNumber(self.literal) or self.literal else t.AutomaticSize.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var107.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var107.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var107
end

t_2.descriptor = {
	name = "AutomaticSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.AutomaticSizeProp_ConditionalOption = t_2
typeRegistryModule.default:register(t.AutomaticSizeProp_ConditionalOption)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		options = if p4 == nil or p4.options == nil then {} else p4.options
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var109 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var110 = v:encode()
			local var111, var112 = protoModule.writeTag(buff, var109, 1, protoModule.wireTypes.lengthDelimited)
			var111, var112 = protoModule.writeBuffer(var111, var112, var110, buffer.len(var110))
			buff = var111
			var109 = var112
		end
	end
	local buff_1 = buffer.create(var109)
	buffer.copy(buff_1, 0, buff, 0, var109)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var114 = t_3.new()
	local var115 = 0
	while var115 < buffer.len(p5) do
		local _ = nil
		local var116 = nil
		local var117, var118, var119 = protoModule.readTag(p5, var115)
		local var120 = var117
		var116 = var118
		var115 = var119
		
		if var116 == protoModule.wireTypes.varint then
			local _ = nil
			local var121, var122 = protoModule.readVarInt(p5, var115)
			local _ = var121
			var115 = var122
			continue
		end
		if var116 == protoModule.wireTypes.lengthDelimited then
			if var120 == 1 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var115)
				var115 = var124
				table.insert(var114.options, t.AutomaticSizeProp_ConditionalOption.decode(var123))
			else
				local _ = nil
				local var125, var126 = protoModule.readVarInt(p5, var115)
				var115 = var126 + var125
			end
		elseif var116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var127, var128 = protoModule.readFixed32(p5, var115)
			local _ = var127
			var115 = var128
		elseif var116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var129, var130 = protoModule.readFixed64(p5, var115)
			local _ = var129
			var115 = var130
		else
			error("Unsupported wire type: " .. var116)
		end
	end
	return var114
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var133 = t_3.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.AutomaticSizeProp_ConditionalOption.jsonDecode(v))
		end
		var133.options = t_1
	end
	return var133
end

t_3.descriptor = {
	name = "AutomaticSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.AutomaticSizeProp_ConditionalOptions = t_3
typeRegistryModule.default:register(t.AutomaticSizeProp_ConditionalOptions)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var136 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var137, var138 = protoModule.writeTag(buff, var136, 1, protoModule.wireTypes.varint)
			var137, var138 = protoModule.writeVarInt(var137, var138, t.TextTruncate.toNumber(self.kind.value))
			buff = var137
			var136 = var138
		elseif self.kind.type == "binding_path" then
			local var139, var140 = protoModule.writeTag(buff, var136, 2, protoModule.wireTypes.lengthDelimited)
			var139, var140 = protoModule.writeString(var139, var140, self.kind.value)
			buff = var139
			var136 = var140
		elseif self.kind.type == "conditional" then
			local var141 = self.kind.value:encode()
			local var142, var143 = protoModule.writeTag(buff, var136, 3, protoModule.wireTypes.lengthDelimited)
			var142, var143 = protoModule.writeBuffer(var142, var143, var141, buffer.len(var141))
			buff = var142
			var136 = var143
		end
	end
	local buff_1 = buffer.create(var136)
	buffer.copy(buff_1, 0, buff, 0, var136)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var145 = t_4.new()
	local var146 = 0
	while var146 < buffer.len(p7) do
		local _ = nil
		local var147 = nil
		local var148, var149, var150 = protoModule.readTag(p7, var146)
		local var151 = var148
		var147 = var149
		var146 = var150
		
		if var147 == protoModule.wireTypes.varint then
			if var151 == 1 then
				local _ = nil
				local var152, var153 = protoModule.readVarIntI32(p7, var146)
				local var154 = var152
				var146 = var153
				var145.kind = {
					type = "literal",
					value = t.TextTruncate.fromNumber(var154) or var154
				}
			else
				local _ = nil
				local var155, var156 = protoModule.readVarInt(p7, var146)
				local _ = var155
				var146 = var156
			end
		end
		if var147 == protoModule.wireTypes.lengthDelimited then
			if var151 == 2 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p7, var146)
				var146 = var158
				var145.kind = { type = "binding_path", value = buffer.tostring(var157) }
			elseif var151 == 3 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p7, var146)
				var146 = var160
				var145.kind = {
					type = "conditional",
					value = t.TextTruncateProp_ConditionalOptions.decode(var159)
				}
			else
				local _ = nil
				local var161, var162 = protoModule.readVarInt(p7, var146)
				var146 = var162 + var161
			end
		elseif var147 == protoModule.wireTypes.i32 then
			local _ = nil
			local var163, var164 = protoModule.readFixed32(p7, var146)
			local _ = var163
			var146 = var164
		elseif var147 == protoModule.wireTypes.i64 then
			local _ = nil
			local var165, var166 = protoModule.readFixed64(p7, var146)
			local _ = var165
			var146 = var166
		else
			error("Unsupported wire type: " .. var147)
		end
	end
	return var145
end

function t_4:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextTruncate.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var168 = t_4.new()
	
	if self.literal ~= nil then
		var168.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextTruncate.fromNumber(self.literal) or self.literal else t.TextTruncate.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var168.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var168.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var168.kind = {
			type = "conditional",
			value = t.TextTruncateProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var168
end

t_4.descriptor = {
	name = "TextTruncateProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextTruncateProp"
}
t.TextTruncateProp = t_4
typeRegistryModule.default:register(t.TextTruncateProp)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		condition = if p8 == nil or p8.condition == nil then nil else p8.condition,
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var170 = 0
	
	if self.condition ~= nil then
		local var171 = self.condition:encode()
		local var172, var173 = protoModule.writeTag(buff, var170, 1, protoModule.wireTypes.lengthDelimited)
		var172, var173 = protoModule.writeBuffer(var172, var173, var171, buffer.len(var171))
		buff = var172
		var170 = var173
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var174, var175 = protoModule.writeTag(buff, var170, 2, protoModule.wireTypes.varint)
			var174, var175 = protoModule.writeVarInt(var174, var175, t.TextTruncate.toNumber(self.kind.value))
			buff = var174
			var170 = var175
		elseif self.kind.type == "binding_path" then
			local var176, var177 = protoModule.writeTag(buff, var170, 3, protoModule.wireTypes.lengthDelimited)
			var176, var177 = protoModule.writeString(var176, var177, self.kind.value)
			buff = var176
			var170 = var177
		end
	end
	local buff_1 = buffer.create(var170)
	buffer.copy(buff_1, 0, buff, 0, var170)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var179 = t_5.new()
	local var180 = 0
	while var180 < buffer.len(p9) do
		local _ = nil
		local var181 = nil
		local var182, var183, var184 = protoModule.readTag(p9, var180)
		local var185 = var182
		var181 = var183
		var180 = var184
		
		if var181 == protoModule.wireTypes.varint then
			if var185 == 2 then
				local _ = nil
				local var186, var187 = protoModule.readVarIntI32(p9, var180)
				local var188 = var186
				var180 = var187
				var179.kind = {
					type = "literal",
					value = t.TextTruncate.fromNumber(var188) or var188
				}
			else
				local _ = nil
				local var189, var190 = protoModule.readVarInt(p9, var180)
				local _ = var189
				var180 = var190
			end
		end
		if var181 == protoModule.wireTypes.lengthDelimited then
			if var185 == 1 then
				local _ = nil
				local var191, var192 = protoModule.readBuffer(p9, var180)
				var180 = var192
				var179.condition = propConditionModule.PropCondition.decode(var191)
			elseif var185 == 3 then
				local _ = nil
				local var193, var194 = protoModule.readBuffer(p9, var180)
				var180 = var194
				var179.kind = { type = "binding_path", value = buffer.tostring(var193) }
			else
				local _ = nil
				local var195, var196 = protoModule.readVarInt(p9, var180)
				var180 = var196 + var195
			end
		elseif var181 == protoModule.wireTypes.i32 then
			local _ = nil
			local var197, var198 = protoModule.readFixed32(p9, var180)
			local _ = var197
			var180 = var198
		elseif var181 == protoModule.wireTypes.i64 then
			local _ = nil
			local var199, var200 = protoModule.readFixed64(p9, var180)
			local _ = var199
			var180 = var200
		else
			error("Unsupported wire type: " .. var181)
		end
	end
	return var179
end

function t_5:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextTruncate.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), propConditionModule (ref), t (ref)
	local var202 = t_5.new()
	
	if self.condition ~= nil then
		var202.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var202.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextTruncate.fromNumber(self.literal) or self.literal else t.TextTruncate.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var202.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var202.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var202
end

t_5.descriptor = {
	name = "TextTruncateProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextTruncateProp_ConditionalOption = t_5
typeRegistryModule.default:register(t.TextTruncateProp_ConditionalOption)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		options = if p10 == nil or p10.options == nil then {} else p10.options
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var204 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var205 = v:encode()
			local var206, var207 = protoModule.writeTag(buff, var204, 1, protoModule.wireTypes.lengthDelimited)
			var206, var207 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var204 = var207
		end
	end
	local buff_1 = buffer.create(var204)
	buffer.copy(buff_1, 0, buff, 0, var204)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var209 = t_6.new()
	local var210 = 0
	while var210 < buffer.len(p11) do
		local _ = nil
		local var211 = nil
		local var212, var213, var214 = protoModule.readTag(p11, var210)
		local var215 = var212
		var211 = var213
		var210 = var214
		
		if var211 == protoModule.wireTypes.varint then
			local _ = nil
			local var216, var217 = protoModule.readVarInt(p11, var210)
			local _ = var216
			var210 = var217
			continue
		end
		if var211 == protoModule.wireTypes.lengthDelimited then
			if var215 == 1 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p11, var210)
				var210 = var219
				table.insert(var209.options, t.TextTruncateProp_ConditionalOption.decode(var218))
			else
				local _ = nil
				local var220, var221 = protoModule.readVarInt(p11, var210)
				var210 = var221 + var220
			end
		elseif var211 == protoModule.wireTypes.i32 then
			local _ = nil
			local var222, var223 = protoModule.readFixed32(p11, var210)
			local _ = var222
			var210 = var223
		elseif var211 == protoModule.wireTypes.i64 then
			local _ = nil
			local var224, var225 = protoModule.readFixed64(p11, var210)
			local _ = var224
			var210 = var225
		else
			error("Unsupported wire type: " .. var211)
		end
	end
	return var209
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var228 = t_6.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextTruncateProp_ConditionalOption.jsonDecode(v))
		end
		var228.options = t_1
	end
	return var228
end

t_6.descriptor = {
	name = "TextTruncateProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextTruncateProp_ConditionalOptions = t_6
typeRegistryModule.default:register(t.TextTruncateProp_ConditionalOptions)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12)
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p12 == nil or p12.kind == nil then nil else p12.kind
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var231 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var232, var233 = protoModule.writeTag(buff, var231, 1, protoModule.wireTypes.varint)
			var232, var233 = protoModule.writeVarInt(var232, var233, t.TextXAlignment.toNumber(self.kind.value))
			buff = var232
			var231 = var233
		elseif self.kind.type == "binding_path" then
			local var234, var235 = protoModule.writeTag(buff, var231, 2, protoModule.wireTypes.lengthDelimited)
			var234, var235 = protoModule.writeString(var234, var235, self.kind.value)
			buff = var234
			var231 = var235
		elseif self.kind.type == "conditional" then
			local var236 = self.kind.value:encode()
			local var237, var238 = protoModule.writeTag(buff, var231, 3, protoModule.wireTypes.lengthDelimited)
			var237, var238 = protoModule.writeBuffer(var237, var238, var236, buffer.len(var236))
			buff = var237
			var231 = var238
		end
	end
	local buff_1 = buffer.create(var231)
	buffer.copy(buff_1, 0, buff, 0, var231)
	
	return buff_1
end

function t_7.decode(p13)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var240 = t_7.new()
	local var241 = 0
	while var241 < buffer.len(p13) do
		local _ = nil
		local var242 = nil
		local var243, var244, var245 = protoModule.readTag(p13, var241)
		local var246 = var243
		var242 = var244
		var241 = var245
		
		if var242 == protoModule.wireTypes.varint then
			if var246 == 1 then
				local _ = nil
				local var247, var248 = protoModule.readVarIntI32(p13, var241)
				local var249 = var247
				var241 = var248
				var240.kind = {
					type = "literal",
					value = t.TextXAlignment.fromNumber(var249) or var249
				}
			else
				local _ = nil
				local var250, var251 = protoModule.readVarInt(p13, var241)
				local _ = var250
				var241 = var251
			end
		end
		if var242 == protoModule.wireTypes.lengthDelimited then
			if var246 == 2 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p13, var241)
				var241 = var253
				var240.kind = { type = "binding_path", value = buffer.tostring(var252) }
			elseif var246 == 3 then
				local _ = nil
				local var254, var255 = protoModule.readBuffer(p13, var241)
				var241 = var255
				var240.kind = {
					type = "conditional",
					value = t.TextXAlignmentProp_ConditionalOptions.decode(var254)
				}
			else
				local _ = nil
				local var256, var257 = protoModule.readVarInt(p13, var241)
				var241 = var257 + var256
			end
		elseif var242 == protoModule.wireTypes.i32 then
			local _ = nil
			local var258, var259 = protoModule.readFixed32(p13, var241)
			local _ = var258
			var241 = var259
		elseif var242 == protoModule.wireTypes.i64 then
			local _ = nil
			local var260, var261 = protoModule.readFixed64(p13, var241)
			local _ = var260
			var241 = var261
		else
			error("Unsupported wire type: " .. var242)
		end
	end
	return var240
end

function t_7:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextXAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var263 = t_7.new()
	
	if self.literal ~= nil then
		var263.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextXAlignment.fromNumber(self.literal) or self.literal else t.TextXAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var263.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var263.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var263.kind = {
			type = "conditional",
			value = t.TextXAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var263
end

t_7.descriptor = {
	name = "TextXAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextXAlignmentProp"
}
t.TextXAlignmentProp = t_7
typeRegistryModule.default:register(t.TextXAlignmentProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14)
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p14 == nil or p14.condition == nil then nil else p14.condition,
		kind = if p14 == nil or p14.kind == nil then nil else p14.kind
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var265 = 0
	
	if self.condition ~= nil then
		local var266 = self.condition:encode()
		local var267, var268 = protoModule.writeTag(buff, var265, 1, protoModule.wireTypes.lengthDelimited)
		var267, var268 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
		buff = var267
		var265 = var268
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var269, var270 = protoModule.writeTag(buff, var265, 2, protoModule.wireTypes.varint)
			var269, var270 = protoModule.writeVarInt(var269, var270, t.TextXAlignment.toNumber(self.kind.value))
			buff = var269
			var265 = var270
		elseif self.kind.type == "binding_path" then
			local var271, var272 = protoModule.writeTag(buff, var265, 3, protoModule.wireTypes.lengthDelimited)
			var271, var272 = protoModule.writeString(var271, var272, self.kind.value)
			buff = var271
			var265 = var272
		end
	end
	local buff_1 = buffer.create(var265)
	buffer.copy(buff_1, 0, buff, 0, var265)
	
	return buff_1
end

function t_8.decode(p15)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var274 = t_8.new()
	local var275 = 0
	while var275 < buffer.len(p15) do
		local _ = nil
		local var276 = nil
		local var277, var278, var279 = protoModule.readTag(p15, var275)
		local var280 = var277
		var276 = var278
		var275 = var279
		
		if var276 == protoModule.wireTypes.varint then
			if var280 == 2 then
				local _ = nil
				local var281, var282 = protoModule.readVarIntI32(p15, var275)
				local var283 = var281
				var275 = var282
				var274.kind = {
					type = "literal",
					value = t.TextXAlignment.fromNumber(var283) or var283
				}
			else
				local _ = nil
				local var284, var285 = protoModule.readVarInt(p15, var275)
				local _ = var284
				var275 = var285
			end
		end
		if var276 == protoModule.wireTypes.lengthDelimited then
			if var280 == 1 then
				local _ = nil
				local var286, var287 = protoModule.readBuffer(p15, var275)
				var275 = var287
				var274.condition = propConditionModule.PropCondition.decode(var286)
			elseif var280 == 3 then
				local _ = nil
				local var288, var289 = protoModule.readBuffer(p15, var275)
				var275 = var289
				var274.kind = { type = "binding_path", value = buffer.tostring(var288) }
			else
				local _ = nil
				local var290, var291 = protoModule.readVarInt(p15, var275)
				var275 = var291 + var290
			end
		elseif var276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var292, var293 = protoModule.readFixed32(p15, var275)
			local _ = var292
			var275 = var293
		elseif var276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var294, var295 = protoModule.readFixed64(p15, var275)
			local _ = var294
			var275 = var295
		else
			error("Unsupported wire type: " .. var276)
		end
	end
	return var274
end

function t_8:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextXAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), propConditionModule (ref), t (ref)
	local var297 = t_8.new()
	
	if self.condition ~= nil then
		var297.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var297.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextXAlignment.fromNumber(self.literal) or self.literal else t.TextXAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var297.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var297.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var297
end

t_8.descriptor = {
	name = "TextXAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextXAlignmentProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.TextXAlignmentProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16)
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p16 == nil or p16.options == nil then {} else p16.options
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var299 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var300 = v:encode()
			local var301, var302 = protoModule.writeTag(buff, var299, 1, protoModule.wireTypes.lengthDelimited)
			var301, var302 = protoModule.writeBuffer(var301, var302, var300, buffer.len(var300))
			buff = var301
			var299 = var302
		end
	end
	local buff_1 = buffer.create(var299)
	buffer.copy(buff_1, 0, buff, 0, var299)
	
	return buff_1
end

function t_9.decode(p17)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var304 = t_9.new()
	local var305 = 0
	while var305 < buffer.len(p17) do
		local _ = nil
		local var306 = nil
		local var307, var308, var309 = protoModule.readTag(p17, var305)
		local var310 = var307
		var306 = var308
		var305 = var309
		
		if var306 == protoModule.wireTypes.varint then
			local _ = nil
			local var311, var312 = protoModule.readVarInt(p17, var305)
			local _ = var311
			var305 = var312
			continue
		end
		if var306 == protoModule.wireTypes.lengthDelimited then
			if var310 == 1 then
				local _ = nil
				local var313, var314 = protoModule.readBuffer(p17, var305)
				var305 = var314
				table.insert(var304.options, t.TextXAlignmentProp_ConditionalOption.decode(var313))
			else
				local _ = nil
				local var315, var316 = protoModule.readVarInt(p17, var305)
				var305 = var316 + var315
			end
		elseif var306 == protoModule.wireTypes.i32 then
			local _ = nil
			local var317, var318 = protoModule.readFixed32(p17, var305)
			local _ = var317
			var305 = var318
		elseif var306 == protoModule.wireTypes.i64 then
			local _ = nil
			local var319, var320 = protoModule.readFixed64(p17, var305)
			local _ = var319
			var305 = var320
		else
			error("Unsupported wire type: " .. var306)
		end
	end
	return var304
end

function t_9:jsonEncode()
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

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var323 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextXAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var323.options = t_1
	end
	return var323
end

t_9.descriptor = {
	name = "TextXAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextXAlignmentProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.TextXAlignmentProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18)
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p18 == nil or p18.kind == nil then nil else p18.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var326 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var327, var328 = protoModule.writeTag(buff, var326, 1, protoModule.wireTypes.varint)
			var327, var328 = protoModule.writeVarInt(var327, var328, t.TextYAlignment.toNumber(self.kind.value))
			buff = var327
			var326 = var328
		elseif self.kind.type == "binding_path" then
			local var329, var330 = protoModule.writeTag(buff, var326, 2, protoModule.wireTypes.lengthDelimited)
			var329, var330 = protoModule.writeString(var329, var330, self.kind.value)
			buff = var329
			var326 = var330
		elseif self.kind.type == "conditional" then
			local var331 = self.kind.value:encode()
			local var332, var333 = protoModule.writeTag(buff, var326, 3, protoModule.wireTypes.lengthDelimited)
			var332, var333 = protoModule.writeBuffer(var332, var333, var331, buffer.len(var331))
			buff = var332
			var326 = var333
		end
	end
	local buff_1 = buffer.create(var326)
	buffer.copy(buff_1, 0, buff, 0, var326)
	
	return buff_1
end

function t_10.decode(p19)
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var335 = t_10.new()
	local var336 = 0
	while var336 < buffer.len(p19) do
		local _ = nil
		local var337 = nil
		local var338, var339, var340 = protoModule.readTag(p19, var336)
		local var341 = var338
		var337 = var339
		var336 = var340
		
		if var337 == protoModule.wireTypes.varint then
			if var341 == 1 then
				local _ = nil
				local var342, var343 = protoModule.readVarIntI32(p19, var336)
				local var344 = var342
				var336 = var343
				var335.kind = {
					type = "literal",
					value = t.TextYAlignment.fromNumber(var344) or var344
				}
			else
				local _ = nil
				local var345, var346 = protoModule.readVarInt(p19, var336)
				local _ = var345
				var336 = var346
			end
		end
		if var337 == protoModule.wireTypes.lengthDelimited then
			if var341 == 2 then
				local _ = nil
				local var347, var348 = protoModule.readBuffer(p19, var336)
				var336 = var348
				var335.kind = { type = "binding_path", value = buffer.tostring(var347) }
			elseif var341 == 3 then
				local _ = nil
				local var349, var350 = protoModule.readBuffer(p19, var336)
				var336 = var350
				var335.kind = {
					type = "conditional",
					value = t.TextYAlignmentProp_ConditionalOptions.decode(var349)
				}
			else
				local _ = nil
				local var351, var352 = protoModule.readVarInt(p19, var336)
				var336 = var352 + var351
			end
		elseif var337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var353, var354 = protoModule.readFixed32(p19, var336)
			local _ = var353
			var336 = var354
		elseif var337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var355, var356 = protoModule.readFixed64(p19, var336)
			local _ = var355
			var336 = var356
		else
			error("Unsupported wire type: " .. var337)
		end
	end
	return var335
end

function t_10:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextYAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), t (ref)
	local var358 = t_10.new()
	
	if self.literal ~= nil then
		var358.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextYAlignment.fromNumber(self.literal) or self.literal else t.TextYAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var358.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var358.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var358.kind = {
			type = "conditional",
			value = t.TextYAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var358
end

t_10.descriptor = {
	name = "TextYAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextYAlignmentProp"
}
t.TextYAlignmentProp = t_10
typeRegistryModule.default:register(t.TextYAlignmentProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20)
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p20 == nil or p20.condition == nil then nil else p20.condition,
		kind = if p20 == nil or p20.kind == nil then nil else p20.kind
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var360 = 0
	
	if self.condition ~= nil then
		local var361 = self.condition:encode()
		local var362, var363 = protoModule.writeTag(buff, var360, 1, protoModule.wireTypes.lengthDelimited)
		var362, var363 = protoModule.writeBuffer(var362, var363, var361, buffer.len(var361))
		buff = var362
		var360 = var363
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var364, var365 = protoModule.writeTag(buff, var360, 2, protoModule.wireTypes.varint)
			var364, var365 = protoModule.writeVarInt(var364, var365, t.TextYAlignment.toNumber(self.kind.value))
			buff = var364
			var360 = var365
		elseif self.kind.type == "binding_path" then
			local var366, var367 = protoModule.writeTag(buff, var360, 3, protoModule.wireTypes.lengthDelimited)
			var366, var367 = protoModule.writeString(var366, var367, self.kind.value)
			buff = var366
			var360 = var367
		end
	end
	local buff_1 = buffer.create(var360)
	buffer.copy(buff_1, 0, buff, 0, var360)
	
	return buff_1
end

function t_11.decode(p21)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var369 = t_11.new()
	local var370 = 0
	while var370 < buffer.len(p21) do
		local _ = nil
		local var371 = nil
		local var372, var373, var374 = protoModule.readTag(p21, var370)
		local var375 = var372
		var371 = var373
		var370 = var374
		
		if var371 == protoModule.wireTypes.varint then
			if var375 == 2 then
				local _ = nil
				local var376, var377 = protoModule.readVarIntI32(p21, var370)
				local var378 = var376
				var370 = var377
				var369.kind = {
					type = "literal",
					value = t.TextYAlignment.fromNumber(var378) or var378
				}
			else
				local _ = nil
				local var379, var380 = protoModule.readVarInt(p21, var370)
				local _ = var379
				var370 = var380
			end
		end
		if var371 == protoModule.wireTypes.lengthDelimited then
			if var375 == 1 then
				local _ = nil
				local var381, var382 = protoModule.readBuffer(p21, var370)
				var370 = var382
				var369.condition = propConditionModule.PropCondition.decode(var381)
			elseif var375 == 3 then
				local _ = nil
				local var383, var384 = protoModule.readBuffer(p21, var370)
				var370 = var384
				var369.kind = { type = "binding_path", value = buffer.tostring(var383) }
			else
				local _ = nil
				local var385, var386 = protoModule.readVarInt(p21, var370)
				var370 = var386 + var385
			end
		elseif var371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var387, var388 = protoModule.readFixed32(p21, var370)
			local _ = var387
			var370 = var388
		elseif var371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var389, var390 = protoModule.readFixed64(p21, var370)
			local _ = var389
			var370 = var390
		else
			error("Unsupported wire type: " .. var371)
		end
	end
	return var369
end

function t_11:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.TextYAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), propConditionModule (ref), t (ref)
	local var392 = t_11.new()
	
	if self.condition ~= nil then
		var392.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var392.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextYAlignment.fromNumber(self.literal) or self.literal else t.TextYAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var392.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var392.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var392
end

t_11.descriptor = {
	name = "TextYAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextYAlignmentProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.TextYAlignmentProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22)
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p22 == nil or p22.options == nil then {} else p22.options
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var394 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var395 = v:encode()
			local var396, var397 = protoModule.writeTag(buff, var394, 1, protoModule.wireTypes.lengthDelimited)
			var396, var397 = protoModule.writeBuffer(var396, var397, var395, buffer.len(var395))
			buff = var396
			var394 = var397
		end
	end
	local buff_1 = buffer.create(var394)
	buffer.copy(buff_1, 0, buff, 0, var394)
	
	return buff_1
end

function t_12.decode(p23)
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
	local var399 = t_12.new()
	local var400 = 0
	while var400 < buffer.len(p23) do
		local _ = nil
		local var401 = nil
		local var402, var403, var404 = protoModule.readTag(p23, var400)
		local var405 = var402
		var401 = var403
		var400 = var404
		
		if var401 == protoModule.wireTypes.varint then
			local _ = nil
			local var406, var407 = protoModule.readVarInt(p23, var400)
			local _ = var406
			var400 = var407
			continue
		end
		if var401 == protoModule.wireTypes.lengthDelimited then
			if var405 == 1 then
				local _ = nil
				local var408, var409 = protoModule.readBuffer(p23, var400)
				var400 = var409
				table.insert(var399.options, t.TextYAlignmentProp_ConditionalOption.decode(var408))
			else
				local _ = nil
				local var410, var411 = protoModule.readVarInt(p23, var400)
				var400 = var411 + var410
			end
		elseif var401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var412, var413 = protoModule.readFixed32(p23, var400)
			local _ = var412
			var400 = var413
		elseif var401 == protoModule.wireTypes.i64 then
			local _ = nil
			local var414, var415 = protoModule.readFixed64(p23, var400)
			local _ = var414
			var400 = var415
		else
			error("Unsupported wire type: " .. var401)
		end
	end
	return var399
end

function t_12:jsonEncode()
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

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), t (ref)
	local var418 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextYAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var418.options = t_1
	end
	return var418
end

t_12.descriptor = {
	name = "TextYAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextYAlignmentProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.TextYAlignmentProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p24 == nil or p24.kind == nil then nil else p24.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var421 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var422, var423 = protoModule.writeTag(buff, var421, 1, protoModule.wireTypes.varint)
			var422, var423 = protoModule.writeVarInt(var422, var423, t.UIFlexMode.toNumber(self.kind.value))
			buff = var422
			var421 = var423
		elseif self.kind.type == "binding_path" then
			local var424, var425 = protoModule.writeTag(buff, var421, 2, protoModule.wireTypes.lengthDelimited)
			var424, var425 = protoModule.writeString(var424, var425, self.kind.value)
			buff = var424
			var421 = var425
		elseif self.kind.type == "conditional" then
			local var426 = self.kind.value:encode()
			local var427, var428 = protoModule.writeTag(buff, var421, 3, protoModule.wireTypes.lengthDelimited)
			var427, var428 = protoModule.writeBuffer(var427, var428, var426, buffer.len(var426))
			buff = var427
			var421 = var428
		end
	end
	local buff_1 = buffer.create(var421)
	buffer.copy(buff_1, 0, buff, 0, var421)
	
	return buff_1
end

function t_13.decode(p25)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var430 = t_13.new()
	local var431 = 0
	while var431 < buffer.len(p25) do
		local _ = nil
		local var432 = nil
		local var433, var434, var435 = protoModule.readTag(p25, var431)
		local var436 = var433
		var432 = var434
		var431 = var435
		
		if var432 == protoModule.wireTypes.varint then
			if var436 == 1 then
				local _ = nil
				local var437, var438 = protoModule.readVarIntI32(p25, var431)
				local var439 = var437
				var431 = var438
				var430.kind = {
					type = "literal",
					value = t.UIFlexMode.fromNumber(var439) or var439
				}
			else
				local _ = nil
				local var440, var441 = protoModule.readVarInt(p25, var431)
				local _ = var440
				var431 = var441
			end
		end
		if var432 == protoModule.wireTypes.lengthDelimited then
			if var436 == 2 then
				local _ = nil
				local var442, var443 = protoModule.readBuffer(p25, var431)
				var431 = var443
				var430.kind = { type = "binding_path", value = buffer.tostring(var442) }
			elseif var436 == 3 then
				local _ = nil
				local var444, var445 = protoModule.readBuffer(p25, var431)
				var431 = var445
				var430.kind = {
					type = "conditional",
					value = t.UIFlexModeProp_ConditionalOptions.decode(var444)
				}
			else
				local _ = nil
				local var446, var447 = protoModule.readVarInt(p25, var431)
				var431 = var447 + var446
			end
		elseif var432 == protoModule.wireTypes.i32 then
			local _ = nil
			local var448, var449 = protoModule.readFixed32(p25, var431)
			local _ = var448
			var431 = var449
		elseif var432 == protoModule.wireTypes.i64 then
			local _ = nil
			local var450, var451 = protoModule.readFixed64(p25, var431)
			local _ = var450
			var431 = var451
		else
			error("Unsupported wire type: " .. var432)
		end
	end
	return var430
end

function t_13:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.UIFlexMode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_13:jsonDecode()
	-- upvalues: t_13 (ref), t (ref)
	local var453 = t_13.new()
	
	if self.literal ~= nil then
		var453.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.UIFlexMode.fromNumber(self.literal) or self.literal else t.UIFlexMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var453.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var453.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var453.kind = {
			type = "conditional",
			value = t.UIFlexModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var453
end

t_13.descriptor = {
	name = "UIFlexModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UIFlexModeProp"
}
t.UIFlexModeProp = t_13
typeRegistryModule.default:register(t.UIFlexModeProp)
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
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var455 = 0
	
	if self.condition ~= nil then
		local var456 = self.condition:encode()
		local var457, var458 = protoModule.writeTag(buff, var455, 1, protoModule.wireTypes.lengthDelimited)
		var457, var458 = protoModule.writeBuffer(var457, var458, var456, buffer.len(var456))
		buff = var457
		var455 = var458
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var459, var460 = protoModule.writeTag(buff, var455, 2, protoModule.wireTypes.varint)
			var459, var460 = protoModule.writeVarInt(var459, var460, t.UIFlexMode.toNumber(self.kind.value))
			buff = var459
			var455 = var460
		elseif self.kind.type == "binding_path" then
			local var461, var462 = protoModule.writeTag(buff, var455, 3, protoModule.wireTypes.lengthDelimited)
			var461, var462 = protoModule.writeString(var461, var462, self.kind.value)
			buff = var461
			var455 = var462
		end
	end
	local buff_1 = buffer.create(var455)
	buffer.copy(buff_1, 0, buff, 0, var455)
	
	return buff_1
end

function t_14.decode(p27)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var464 = t_14.new()
	local var465 = 0
	while var465 < buffer.len(p27) do
		local _ = nil
		local var466 = nil
		local var467, var468, var469 = protoModule.readTag(p27, var465)
		local var470 = var467
		var466 = var468
		var465 = var469
		
		if var466 == protoModule.wireTypes.varint then
			if var470 == 2 then
				local _ = nil
				local var471, var472 = protoModule.readVarIntI32(p27, var465)
				local var473 = var471
				var465 = var472
				var464.kind = {
					type = "literal",
					value = t.UIFlexMode.fromNumber(var473) or var473
				}
			else
				local _ = nil
				local var474, var475 = protoModule.readVarInt(p27, var465)
				local _ = var474
				var465 = var475
			end
		end
		if var466 == protoModule.wireTypes.lengthDelimited then
			if var470 == 1 then
				local _ = nil
				local var476, var477 = protoModule.readBuffer(p27, var465)
				var465 = var477
				var464.condition = propConditionModule.PropCondition.decode(var476)
			elseif var470 == 3 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p27, var465)
				var465 = var479
				var464.kind = { type = "binding_path", value = buffer.tostring(var478) }
			else
				local _ = nil
				local var480, var481 = protoModule.readVarInt(p27, var465)
				var465 = var481 + var480
			end
		elseif var466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var482, var483 = protoModule.readFixed32(p27, var465)
			local _ = var482
			var465 = var483
		elseif var466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var484, var485 = protoModule.readFixed64(p27, var465)
			local _ = var484
			var465 = var485
		else
			error("Unsupported wire type: " .. var466)
		end
	end
	return var464
end

function t_14:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.UIFlexMode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), propConditionModule (ref), t (ref)
	local var487 = t_14.new()
	
	if self.condition ~= nil then
		var487.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var487.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.UIFlexMode.fromNumber(self.literal) or self.literal else t.UIFlexMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var487.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var487.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var487
end

t_14.descriptor = {
	name = "UIFlexModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UIFlexModeProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.UIFlexModeProp_ConditionalOption)
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
	local var489 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var490 = v:encode()
			local var491, var492 = protoModule.writeTag(buff, var489, 1, protoModule.wireTypes.lengthDelimited)
			var491, var492 = protoModule.writeBuffer(var491, var492, var490, buffer.len(var490))
			buff = var491
			var489 = var492
		end
	end
	local buff_1 = buffer.create(var489)
	buffer.copy(buff_1, 0, buff, 0, var489)
	
	return buff_1
end

function t_15.decode(p29)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var494 = t_15.new()
	local var495 = 0
	while var495 < buffer.len(p29) do
		local _ = nil
		local var496 = nil
		local var497, var498, var499 = protoModule.readTag(p29, var495)
		local var500 = var497
		var496 = var498
		var495 = var499
		
		if var496 == protoModule.wireTypes.varint then
			local _ = nil
			local var501, var502 = protoModule.readVarInt(p29, var495)
			local _ = var501
			var495 = var502
			continue
		end
		if var496 == protoModule.wireTypes.lengthDelimited then
			if var500 == 1 then
				local _ = nil
				local var503, var504 = protoModule.readBuffer(p29, var495)
				var495 = var504
				table.insert(var494.options, t.UIFlexModeProp_ConditionalOption.decode(var503))
			else
				local _ = nil
				local var505, var506 = protoModule.readVarInt(p29, var495)
				var495 = var506 + var505
			end
		elseif var496 == protoModule.wireTypes.i32 then
			local _ = nil
			local var507, var508 = protoModule.readFixed32(p29, var495)
			local _ = var507
			var495 = var508
		elseif var496 == protoModule.wireTypes.i64 then
			local _ = nil
			local var509, var510 = protoModule.readFixed64(p29, var495)
			local _ = var509
			var495 = var510
		else
			error("Unsupported wire type: " .. var496)
		end
	end
	return var494
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
	local var513 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UIFlexModeProp_ConditionalOption.jsonDecode(v))
		end
		var513.options = t_1
	end
	return var513
end

t_15.descriptor = {
	name = "UIFlexModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UIFlexModeProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.UIFlexModeProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p30)
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p30 == nil or p30.kind == nil then nil else p30.kind
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var516 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var517, var518 = protoModule.writeTag(buff, var516, 1, protoModule.wireTypes.varint)
			var517, var518 = protoModule.writeVarInt(var517, var518, t.ScaleType.toNumber(self.kind.value))
			buff = var517
			var516 = var518
		elseif self.kind.type == "binding_path" then
			local var519, var520 = protoModule.writeTag(buff, var516, 2, protoModule.wireTypes.lengthDelimited)
			var519, var520 = protoModule.writeString(var519, var520, self.kind.value)
			buff = var519
			var516 = var520
		elseif self.kind.type == "conditional" then
			local var521 = self.kind.value:encode()
			local var522, var523 = protoModule.writeTag(buff, var516, 3, protoModule.wireTypes.lengthDelimited)
			var522, var523 = protoModule.writeBuffer(var522, var523, var521, buffer.len(var521))
			buff = var522
			var516 = var523
		end
	end
	local buff_1 = buffer.create(var516)
	buffer.copy(buff_1, 0, buff, 0, var516)
	
	return buff_1
end

function t_16.decode(p31)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var525 = t_16.new()
	local var526 = 0
	while var526 < buffer.len(p31) do
		local _ = nil
		local var527 = nil
		local var528, var529, var530 = protoModule.readTag(p31, var526)
		local var531 = var528
		var527 = var529
		var526 = var530
		
		if var527 == protoModule.wireTypes.varint then
			if var531 == 1 then
				local _ = nil
				local var532, var533 = protoModule.readVarIntI32(p31, var526)
				local var534 = var532
				var526 = var533
				var525.kind = {
					type = "literal",
					value = t.ScaleType.fromNumber(var534) or var534
				}
			else
				local _ = nil
				local var535, var536 = protoModule.readVarInt(p31, var526)
				local _ = var535
				var526 = var536
			end
		end
		if var527 == protoModule.wireTypes.lengthDelimited then
			if var531 == 2 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p31, var526)
				var526 = var538
				var525.kind = { type = "binding_path", value = buffer.tostring(var537) }
			elseif var531 == 3 then
				local _ = nil
				local var539, var540 = protoModule.readBuffer(p31, var526)
				var526 = var540
				var525.kind = {
					type = "conditional",
					value = t.ScaleTypeProp_ConditionalOptions.decode(var539)
				}
			else
				local _ = nil
				local var541, var542 = protoModule.readVarInt(p31, var526)
				var526 = var542 + var541
			end
		elseif var527 == protoModule.wireTypes.i32 then
			local _ = nil
			local var543, var544 = protoModule.readFixed32(p31, var526)
			local _ = var543
			var526 = var544
		elseif var527 == protoModule.wireTypes.i64 then
			local _ = nil
			local var545, var546 = protoModule.readFixed64(p31, var526)
			local _ = var545
			var526 = var546
		else
			error("Unsupported wire type: " .. var527)
		end
	end
	return var525
end

function t_16:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ScaleType.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), t (ref)
	local var548 = t_16.new()
	
	if self.literal ~= nil then
		var548.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleType.fromNumber(self.literal) or self.literal else t.ScaleType.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var548.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var548.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var548.kind = {
			type = "conditional",
			value = t.ScaleTypeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var548
end

t_16.descriptor = {
	name = "ScaleTypeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleTypeProp"
}
t.ScaleTypeProp = t_16
typeRegistryModule.default:register(t.ScaleTypeProp)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p32)
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p32 == nil or p32.condition == nil then nil else p32.condition,
		kind = if p32 == nil or p32.kind == nil then nil else p32.kind
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var550 = 0
	
	if self.condition ~= nil then
		local var551 = self.condition:encode()
		local var552, var553 = protoModule.writeTag(buff, var550, 1, protoModule.wireTypes.lengthDelimited)
		var552, var553 = protoModule.writeBuffer(var552, var553, var551, buffer.len(var551))
		buff = var552
		var550 = var553
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var554, var555 = protoModule.writeTag(buff, var550, 2, protoModule.wireTypes.varint)
			var554, var555 = protoModule.writeVarInt(var554, var555, t.ScaleType.toNumber(self.kind.value))
			buff = var554
			var550 = var555
		elseif self.kind.type == "binding_path" then
			local var556, var557 = protoModule.writeTag(buff, var550, 3, protoModule.wireTypes.lengthDelimited)
			var556, var557 = protoModule.writeString(var556, var557, self.kind.value)
			buff = var556
			var550 = var557
		end
	end
	local buff_1 = buffer.create(var550)
	buffer.copy(buff_1, 0, buff, 0, var550)
	
	return buff_1
end

function t_17.decode(p33)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var559 = t_17.new()
	local var560 = 0
	while var560 < buffer.len(p33) do
		local _ = nil
		local var561 = nil
		local var562, var563, var564 = protoModule.readTag(p33, var560)
		local var565 = var562
		var561 = var563
		var560 = var564
		
		if var561 == protoModule.wireTypes.varint then
			if var565 == 2 then
				local _ = nil
				local var566, var567 = protoModule.readVarIntI32(p33, var560)
				local var568 = var566
				var560 = var567
				var559.kind = {
					type = "literal",
					value = t.ScaleType.fromNumber(var568) or var568
				}
			else
				local _ = nil
				local var569, var570 = protoModule.readVarInt(p33, var560)
				local _ = var569
				var560 = var570
			end
		end
		if var561 == protoModule.wireTypes.lengthDelimited then
			if var565 == 1 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p33, var560)
				var560 = var572
				var559.condition = propConditionModule.PropCondition.decode(var571)
			elseif var565 == 3 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p33, var560)
				var560 = var574
				var559.kind = { type = "binding_path", value = buffer.tostring(var573) }
			else
				local _ = nil
				local var575, var576 = protoModule.readVarInt(p33, var560)
				var560 = var576 + var575
			end
		elseif var561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var577, var578 = protoModule.readFixed32(p33, var560)
			local _ = var577
			var560 = var578
		elseif var561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var579, var580 = protoModule.readFixed64(p33, var560)
			local _ = var579
			var560 = var580
		else
			error("Unsupported wire type: " .. var561)
		end
	end
	return var559
end

function t_17:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ScaleType.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), propConditionModule (ref), t (ref)
	local var582 = t_17.new()
	
	if self.condition ~= nil then
		var582.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var582.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleType.fromNumber(self.literal) or self.literal else t.ScaleType.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var582.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var582.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var582
end

t_17.descriptor = {
	name = "ScaleTypeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ScaleTypeProp_ConditionalOption = t_17
typeRegistryModule.default:register(t.ScaleTypeProp_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p34)
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p34 == nil or p34.options == nil then {} else p34.options
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var584 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var585 = v:encode()
			local var586, var587 = protoModule.writeTag(buff, var584, 1, protoModule.wireTypes.lengthDelimited)
			var586, var587 = protoModule.writeBuffer(var586, var587, var585, buffer.len(var585))
			buff = var586
			var584 = var587
		end
	end
	local buff_1 = buffer.create(var584)
	buffer.copy(buff_1, 0, buff, 0, var584)
	
	return buff_1
end

function t_18.decode(p35)
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var589 = t_18.new()
	local var590 = 0
	while var590 < buffer.len(p35) do
		local _ = nil
		local var591 = nil
		local var592, var593, var594 = protoModule.readTag(p35, var590)
		local var595 = var592
		var591 = var593
		var590 = var594
		
		if var591 == protoModule.wireTypes.varint then
			local _ = nil
			local var596, var597 = protoModule.readVarInt(p35, var590)
			local _ = var596
			var590 = var597
			continue
		end
		if var591 == protoModule.wireTypes.lengthDelimited then
			if var595 == 1 then
				local _ = nil
				local var598, var599 = protoModule.readBuffer(p35, var590)
				var590 = var599
				table.insert(var589.options, t.ScaleTypeProp_ConditionalOption.decode(var598))
			else
				local _ = nil
				local var600, var601 = protoModule.readVarInt(p35, var590)
				var590 = var601 + var600
			end
		elseif var591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var602, var603 = protoModule.readFixed32(p35, var590)
			local _ = var602
			var590 = var603
		elseif var591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var604, var605 = protoModule.readFixed64(p35, var590)
			local _ = var604
			var590 = var605
		else
			error("Unsupported wire type: " .. var591)
		end
	end
	return var589
end

function t_18:jsonEncode()
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

function t_18:jsonDecode()
	-- upvalues: t_18 (ref), t (ref)
	local var608 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ScaleTypeProp_ConditionalOption.jsonDecode(v))
		end
		var608.options = t_1
	end
	return var608
end

t_18.descriptor = {
	name = "ScaleTypeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ScaleTypeProp_ConditionalOptions = t_18
typeRegistryModule.default:register(t.ScaleTypeProp_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p36)
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p36 == nil or p36.kind == nil then nil else p36.kind
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var611 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.varint)
			var612, var613 = protoModule.writeVarInt(var612, var613, t.ResamplerMode.toNumber(self.kind.value))
			buff = var612
			var611 = var613
		elseif self.kind.type == "binding_path" then
			local var614, var615 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
			var614, var615 = protoModule.writeString(var614, var615, self.kind.value)
			buff = var614
			var611 = var615
		elseif self.kind.type == "conditional" then
			local var616 = self.kind.value:encode()
			local var617, var618 = protoModule.writeTag(buff, var611, 3, protoModule.wireTypes.lengthDelimited)
			var617, var618 = protoModule.writeBuffer(var617, var618, var616, buffer.len(var616))
			buff = var617
			var611 = var618
		end
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_19.decode(p37)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var620 = t_19.new()
	local var621 = 0
	while var621 < buffer.len(p37) do
		local _ = nil
		local var622 = nil
		local var623, var624, var625 = protoModule.readTag(p37, var621)
		local var626 = var623
		var622 = var624
		var621 = var625
		
		if var622 == protoModule.wireTypes.varint then
			if var626 == 1 then
				local _ = nil
				local var627, var628 = protoModule.readVarIntI32(p37, var621)
				local var629 = var627
				var621 = var628
				var620.kind = {
					type = "literal",
					value = t.ResamplerMode.fromNumber(var629) or var629
				}
			else
				local _ = nil
				local var630, var631 = protoModule.readVarInt(p37, var621)
				local _ = var630
				var621 = var631
			end
		end
		if var622 == protoModule.wireTypes.lengthDelimited then
			if var626 == 2 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p37, var621)
				var621 = var633
				var620.kind = { type = "binding_path", value = buffer.tostring(var632) }
			elseif var626 == 3 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p37, var621)
				var621 = var635
				var620.kind = {
					type = "conditional",
					value = t.ResamplerModeProp_ConditionalOptions.decode(var634)
				}
			else
				local _ = nil
				local var636, var637 = protoModule.readVarInt(p37, var621)
				var621 = var637 + var636
			end
		elseif var622 == protoModule.wireTypes.i32 then
			local _ = nil
			local var638, var639 = protoModule.readFixed32(p37, var621)
			local _ = var638
			var621 = var639
		elseif var622 == protoModule.wireTypes.i64 then
			local _ = nil
			local var640, var641 = protoModule.readFixed64(p37, var621)
			local _ = var640
			var621 = var641
		else
			error("Unsupported wire type: " .. var622)
		end
	end
	return var620
end

function t_19:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ResamplerMode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref), t (ref)
	local var643 = t_19.new()
	
	if self.literal ~= nil then
		var643.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ResamplerMode.fromNumber(self.literal) or self.literal else t.ResamplerMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var643.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var643.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var643.kind = {
			type = "conditional",
			value = t.ResamplerModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var643
end

t_19.descriptor = {
	name = "ResamplerModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResamplerModeProp"
}
t.ResamplerModeProp = t_19
typeRegistryModule.default:register(t.ResamplerModeProp)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p38)
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p38 == nil or p38.condition == nil then nil else p38.condition,
		kind = if p38 == nil or p38.kind == nil then nil else p38.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var645 = 0
	
	if self.condition ~= nil then
		local var646 = self.condition:encode()
		local var647, var648 = protoModule.writeTag(buff, var645, 1, protoModule.wireTypes.lengthDelimited)
		var647, var648 = protoModule.writeBuffer(var647, var648, var646, buffer.len(var646))
		buff = var647
		var645 = var648
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var649, var650 = protoModule.writeTag(buff, var645, 2, protoModule.wireTypes.varint)
			var649, var650 = protoModule.writeVarInt(var649, var650, t.ResamplerMode.toNumber(self.kind.value))
			buff = var649
			var645 = var650
		elseif self.kind.type == "binding_path" then
			local var651, var652 = protoModule.writeTag(buff, var645, 3, protoModule.wireTypes.lengthDelimited)
			var651, var652 = protoModule.writeString(var651, var652, self.kind.value)
			buff = var651
			var645 = var652
		end
	end
	local buff_1 = buffer.create(var645)
	buffer.copy(buff_1, 0, buff, 0, var645)
	
	return buff_1
end

function t_20.decode(p39)
	-- upvalues: t_20 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var654 = t_20.new()
	local var655 = 0
	while var655 < buffer.len(p39) do
		local _ = nil
		local var656 = nil
		local var657, var658, var659 = protoModule.readTag(p39, var655)
		local var660 = var657
		var656 = var658
		var655 = var659
		
		if var656 == protoModule.wireTypes.varint then
			if var660 == 2 then
				local _ = nil
				local var661, var662 = protoModule.readVarIntI32(p39, var655)
				local var663 = var661
				var655 = var662
				var654.kind = {
					type = "literal",
					value = t.ResamplerMode.fromNumber(var663) or var663
				}
			else
				local _ = nil
				local var664, var665 = protoModule.readVarInt(p39, var655)
				local _ = var664
				var655 = var665
			end
		end
		if var656 == protoModule.wireTypes.lengthDelimited then
			if var660 == 1 then
				local _ = nil
				local var666, var667 = protoModule.readBuffer(p39, var655)
				var655 = var667
				var654.condition = propConditionModule.PropCondition.decode(var666)
			elseif var660 == 3 then
				local _ = nil
				local var668, var669 = protoModule.readBuffer(p39, var655)
				var655 = var669
				var654.kind = { type = "binding_path", value = buffer.tostring(var668) }
			else
				local _ = nil
				local var670, var671 = protoModule.readVarInt(p39, var655)
				var655 = var671 + var670
			end
		elseif var656 == protoModule.wireTypes.i32 then
			local _ = nil
			local var672, var673 = protoModule.readFixed32(p39, var655)
			local _ = var672
			var655 = var673
		elseif var656 == protoModule.wireTypes.i64 then
			local _ = nil
			local var674, var675 = protoModule.readFixed64(p39, var655)
			local _ = var674
			var655 = var675
		else
			error("Unsupported wire type: " .. var656)
		end
	end
	return var654
end

function t_20:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ResamplerMode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref), propConditionModule (ref), t (ref)
	local var677 = t_20.new()
	
	if self.condition ~= nil then
		var677.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var677.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ResamplerMode.fromNumber(self.literal) or self.literal else t.ResamplerMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var677.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var677.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var677
end

t_20.descriptor = {
	name = "ResamplerModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ResamplerModeProp_ConditionalOption = t_20
typeRegistryModule.default:register(t.ResamplerModeProp_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p40)
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p40 == nil or p40.options == nil then {} else p40.options
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var679 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var680 = v:encode()
			local var681, var682 = protoModule.writeTag(buff, var679, 1, protoModule.wireTypes.lengthDelimited)
			var681, var682 = protoModule.writeBuffer(var681, var682, var680, buffer.len(var680))
			buff = var681
			var679 = var682
		end
	end
	local buff_1 = buffer.create(var679)
	buffer.copy(buff_1, 0, buff, 0, var679)
	
	return buff_1
end

function t_21.decode(p41)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var684 = t_21.new()
	local var685 = 0
	while var685 < buffer.len(p41) do
		local _ = nil
		local var686 = nil
		local var687, var688, var689 = protoModule.readTag(p41, var685)
		local var690 = var687
		var686 = var688
		var685 = var689
		
		if var686 == protoModule.wireTypes.varint then
			local _ = nil
			local var691, var692 = protoModule.readVarInt(p41, var685)
			local _ = var691
			var685 = var692
			continue
		end
		if var686 == protoModule.wireTypes.lengthDelimited then
			if var690 == 1 then
				local _ = nil
				local var693, var694 = protoModule.readBuffer(p41, var685)
				var685 = var694
				table.insert(var684.options, t.ResamplerModeProp_ConditionalOption.decode(var693))
			else
				local _ = nil
				local var695, var696 = protoModule.readVarInt(p41, var685)
				var685 = var696 + var695
			end
		elseif var686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var697, var698 = protoModule.readFixed32(p41, var685)
			local _ = var697
			var685 = var698
		elseif var686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var699, var700 = protoModule.readFixed64(p41, var685)
			local _ = var699
			var685 = var700
		else
			error("Unsupported wire type: " .. var686)
		end
	end
	return var684
end

function t_21:jsonEncode()
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

function t_21:jsonDecode()
	-- upvalues: t_21 (ref), t (ref)
	local var703 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ResamplerModeProp_ConditionalOption.jsonDecode(v))
		end
		var703.options = t_1
	end
	return var703
end

t_21.descriptor = {
	name = "ResamplerModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ResamplerModeProp_ConditionalOptions = t_21
typeRegistryModule.default:register(t.ResamplerModeProp_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p42)
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p42 == nil or p42.kind == nil then nil else p42.kind
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var706 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var707, var708 = protoModule.writeTag(buff, var706, 1, protoModule.wireTypes.varint)
			var707, var708 = protoModule.writeVarInt(var707, var708, t.SizeConstraint.toNumber(self.kind.value))
			buff = var707
			var706 = var708
		elseif self.kind.type == "binding_path" then
			local var709, var710 = protoModule.writeTag(buff, var706, 2, protoModule.wireTypes.lengthDelimited)
			var709, var710 = protoModule.writeString(var709, var710, self.kind.value)
			buff = var709
			var706 = var710
		elseif self.kind.type == "conditional" then
			local var711 = self.kind.value:encode()
			local var712, var713 = protoModule.writeTag(buff, var706, 3, protoModule.wireTypes.lengthDelimited)
			var712, var713 = protoModule.writeBuffer(var712, var713, var711, buffer.len(var711))
			buff = var712
			var706 = var713
		end
	end
	local buff_1 = buffer.create(var706)
	buffer.copy(buff_1, 0, buff, 0, var706)
	
	return buff_1
end

function t_22.decode(p43)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var715 = t_22.new()
	local var716 = 0
	while var716 < buffer.len(p43) do
		local _ = nil
		local var717 = nil
		local var718, var719, var720 = protoModule.readTag(p43, var716)
		local var721 = var718
		var717 = var719
		var716 = var720
		
		if var717 == protoModule.wireTypes.varint then
			if var721 == 1 then
				local _ = nil
				local var722, var723 = protoModule.readVarIntI32(p43, var716)
				local var724 = var722
				var716 = var723
				var715.kind = {
					type = "literal",
					value = t.SizeConstraint.fromNumber(var724) or var724
				}
			else
				local _ = nil
				local var725, var726 = protoModule.readVarInt(p43, var716)
				local _ = var725
				var716 = var726
			end
		end
		if var717 == protoModule.wireTypes.lengthDelimited then
			if var721 == 2 then
				local _ = nil
				local var727, var728 = protoModule.readBuffer(p43, var716)
				var716 = var728
				var715.kind = { type = "binding_path", value = buffer.tostring(var727) }
			elseif var721 == 3 then
				local _ = nil
				local var729, var730 = protoModule.readBuffer(p43, var716)
				var716 = var730
				var715.kind = {
					type = "conditional",
					value = t.SizeConstraintProp_ConditionalOptions.decode(var729)
				}
			else
				local _ = nil
				local var731, var732 = protoModule.readVarInt(p43, var716)
				var716 = var732 + var731
			end
		elseif var717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var733, var734 = protoModule.readFixed32(p43, var716)
			local _ = var733
			var716 = var734
		elseif var717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var735, var736 = protoModule.readFixed64(p43, var716)
			local _ = var735
			var716 = var736
		else
			error("Unsupported wire type: " .. var717)
		end
	end
	return var715
end

function t_22:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.SizeConstraint.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), t (ref)
	local var738 = t_22.new()
	
	if self.literal ~= nil then
		var738.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SizeConstraint.fromNumber(self.literal) or self.literal else t.SizeConstraint.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var738.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var738.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var738.kind = {
			type = "conditional",
			value = t.SizeConstraintProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var738
end

t_22.descriptor = {
	name = "SizeConstraintProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SizeConstraintProp"
}
t.SizeConstraintProp = t_22
typeRegistryModule.default:register(t.SizeConstraintProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p44)
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p44 == nil or p44.condition == nil then nil else p44.condition,
		kind = if p44 == nil or p44.kind == nil then nil else p44.kind
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var740 = 0
	
	if self.condition ~= nil then
		local var741 = self.condition:encode()
		local var742, var743 = protoModule.writeTag(buff, var740, 1, protoModule.wireTypes.lengthDelimited)
		var742, var743 = protoModule.writeBuffer(var742, var743, var741, buffer.len(var741))
		buff = var742
		var740 = var743
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var744, var745 = protoModule.writeTag(buff, var740, 2, protoModule.wireTypes.varint)
			var744, var745 = protoModule.writeVarInt(var744, var745, t.SizeConstraint.toNumber(self.kind.value))
			buff = var744
			var740 = var745
		elseif self.kind.type == "binding_path" then
			local var746, var747 = protoModule.writeTag(buff, var740, 3, protoModule.wireTypes.lengthDelimited)
			var746, var747 = protoModule.writeString(var746, var747, self.kind.value)
			buff = var746
			var740 = var747
		end
	end
	local buff_1 = buffer.create(var740)
	buffer.copy(buff_1, 0, buff, 0, var740)
	
	return buff_1
end

function t_23.decode(p45)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var749 = t_23.new()
	local var750 = 0
	while var750 < buffer.len(p45) do
		local _ = nil
		local var751 = nil
		local var752, var753, var754 = protoModule.readTag(p45, var750)
		local var755 = var752
		var751 = var753
		var750 = var754
		
		if var751 == protoModule.wireTypes.varint then
			if var755 == 2 then
				local _ = nil
				local var756, var757 = protoModule.readVarIntI32(p45, var750)
				local var758 = var756
				var750 = var757
				var749.kind = {
					type = "literal",
					value = t.SizeConstraint.fromNumber(var758) or var758
				}
			else
				local _ = nil
				local var759, var760 = protoModule.readVarInt(p45, var750)
				local _ = var759
				var750 = var760
			end
		end
		if var751 == protoModule.wireTypes.lengthDelimited then
			if var755 == 1 then
				local _ = nil
				local var761, var762 = protoModule.readBuffer(p45, var750)
				var750 = var762
				var749.condition = propConditionModule.PropCondition.decode(var761)
			elseif var755 == 3 then
				local _ = nil
				local var763, var764 = protoModule.readBuffer(p45, var750)
				var750 = var764
				var749.kind = { type = "binding_path", value = buffer.tostring(var763) }
			else
				local _ = nil
				local var765, var766 = protoModule.readVarInt(p45, var750)
				var750 = var766 + var765
			end
		elseif var751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var767, var768 = protoModule.readFixed32(p45, var750)
			local _ = var767
			var750 = var768
		elseif var751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var769, var770 = protoModule.readFixed64(p45, var750)
			local _ = var769
			var750 = var770
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var749
end

function t_23:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.SizeConstraint.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_23:jsonDecode()
	-- upvalues: t_23 (ref), propConditionModule (ref), t (ref)
	local var772 = t_23.new()
	
	if self.condition ~= nil then
		var772.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var772.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SizeConstraint.fromNumber(self.literal) or self.literal else t.SizeConstraint.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var772.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var772.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var772
end

t_23.descriptor = {
	name = "SizeConstraintProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.SizeConstraintProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.SizeConstraintProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p46)
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p46 == nil or p46.options == nil then {} else p46.options
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var774 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var775 = v:encode()
			local var776, var777 = protoModule.writeTag(buff, var774, 1, protoModule.wireTypes.lengthDelimited)
			var776, var777 = protoModule.writeBuffer(var776, var777, var775, buffer.len(var775))
			buff = var776
			var774 = var777
		end
	end
	local buff_1 = buffer.create(var774)
	buffer.copy(buff_1, 0, buff, 0, var774)
	
	return buff_1
end

function t_24.decode(p47)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var779 = t_24.new()
	local var780 = 0
	while var780 < buffer.len(p47) do
		local _ = nil
		local var781 = nil
		local var782, var783, var784 = protoModule.readTag(p47, var780)
		local var785 = var782
		var781 = var783
		var780 = var784
		
		if var781 == protoModule.wireTypes.varint then
			local _ = nil
			local var786, var787 = protoModule.readVarInt(p47, var780)
			local _ = var786
			var780 = var787
			continue
		end
		if var781 == protoModule.wireTypes.lengthDelimited then
			if var785 == 1 then
				local _ = nil
				local var788, var789 = protoModule.readBuffer(p47, var780)
				var780 = var789
				table.insert(var779.options, t.SizeConstraintProp_ConditionalOption.decode(var788))
			else
				local _ = nil
				local var790, var791 = protoModule.readVarInt(p47, var780)
				var780 = var791 + var790
			end
		elseif var781 == protoModule.wireTypes.i32 then
			local _ = nil
			local var792, var793 = protoModule.readFixed32(p47, var780)
			local _ = var792
			var780 = var793
		elseif var781 == protoModule.wireTypes.i64 then
			local _ = nil
			local var794, var795 = protoModule.readFixed64(p47, var780)
			local _ = var794
			var780 = var795
		else
			error("Unsupported wire type: " .. var781)
		end
	end
	return var779
end

function t_24:jsonEncode()
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

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), t (ref)
	local var798 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SizeConstraintProp_ConditionalOption.jsonDecode(v))
		end
		var798.options = t_1
	end
	return var798
end

t_24.descriptor = {
	name = "SizeConstraintProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.SizeConstraintProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.SizeConstraintProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p48)
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p48 == nil or p48.kind == nil then nil else p48.kind
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var801 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var802, var803 = protoModule.writeTag(buff, var801, 1, protoModule.wireTypes.varint)
			var802, var803 = protoModule.writeVarInt(var802, var803, t.HorizontalAlignment.toNumber(self.kind.value))
			buff = var802
			var801 = var803
		elseif self.kind.type == "binding_path" then
			local var804, var805 = protoModule.writeTag(buff, var801, 2, protoModule.wireTypes.lengthDelimited)
			var804, var805 = protoModule.writeString(var804, var805, self.kind.value)
			buff = var804
			var801 = var805
		elseif self.kind.type == "conditional" then
			local var806 = self.kind.value:encode()
			local var807, var808 = protoModule.writeTag(buff, var801, 3, protoModule.wireTypes.lengthDelimited)
			var807, var808 = protoModule.writeBuffer(var807, var808, var806, buffer.len(var806))
			buff = var807
			var801 = var808
		end
	end
	local buff_1 = buffer.create(var801)
	buffer.copy(buff_1, 0, buff, 0, var801)
	
	return buff_1
end

function t_25.decode(p49)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var810 = t_25.new()
	local var811 = 0
	while var811 < buffer.len(p49) do
		local _ = nil
		local var812 = nil
		local var813, var814, var815 = protoModule.readTag(p49, var811)
		local var816 = var813
		var812 = var814
		var811 = var815
		
		if var812 == protoModule.wireTypes.varint then
			if var816 == 1 then
				local _ = nil
				local var817, var818 = protoModule.readVarIntI32(p49, var811)
				local var819 = var817
				var811 = var818
				var810.kind = {
					type = "literal",
					value = t.HorizontalAlignment.fromNumber(var819) or var819
				}
			else
				local _ = nil
				local var820, var821 = protoModule.readVarInt(p49, var811)
				local _ = var820
				var811 = var821
			end
		end
		if var812 == protoModule.wireTypes.lengthDelimited then
			if var816 == 2 then
				local _ = nil
				local var822, var823 = protoModule.readBuffer(p49, var811)
				var811 = var823
				var810.kind = { type = "binding_path", value = buffer.tostring(var822) }
			elseif var816 == 3 then
				local _ = nil
				local var824, var825 = protoModule.readBuffer(p49, var811)
				var811 = var825
				var810.kind = {
					type = "conditional",
					value = t.HorizontalAlignmentProp_ConditionalOptions.decode(var824)
				}
			else
				local _ = nil
				local var826, var827 = protoModule.readVarInt(p49, var811)
				var811 = var827 + var826
			end
		elseif var812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var828, var829 = protoModule.readFixed32(p49, var811)
			local _ = var828
			var811 = var829
		elseif var812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var830, var831 = protoModule.readFixed64(p49, var811)
			local _ = var830
			var811 = var831
		else
			error("Unsupported wire type: " .. var812)
		end
	end
	return var810
end

function t_25:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.HorizontalAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref), t (ref)
	local var833 = t_25.new()
	
	if self.literal ~= nil then
		var833.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.HorizontalAlignment.fromNumber(self.literal) or self.literal else t.HorizontalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var833.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var833.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var833.kind = {
			type = "conditional",
			value = t.HorizontalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var833
end

t_25.descriptor = {
	name = "HorizontalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.HorizontalAlignmentProp"
}
t.HorizontalAlignmentProp = t_25
typeRegistryModule.default:register(t.HorizontalAlignmentProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p50)
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p50 == nil or p50.condition == nil then nil else p50.condition,
		kind = if p50 == nil or p50.kind == nil then nil else p50.kind
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var835 = 0
	
	if self.condition ~= nil then
		local var836 = self.condition:encode()
		local var837, var838 = protoModule.writeTag(buff, var835, 1, protoModule.wireTypes.lengthDelimited)
		var837, var838 = protoModule.writeBuffer(var837, var838, var836, buffer.len(var836))
		buff = var837
		var835 = var838
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var839, var840 = protoModule.writeTag(buff, var835, 2, protoModule.wireTypes.varint)
			var839, var840 = protoModule.writeVarInt(var839, var840, t.HorizontalAlignment.toNumber(self.kind.value))
			buff = var839
			var835 = var840
		elseif self.kind.type == "binding_path" then
			local var841, var842 = protoModule.writeTag(buff, var835, 3, protoModule.wireTypes.lengthDelimited)
			var841, var842 = protoModule.writeString(var841, var842, self.kind.value)
			buff = var841
			var835 = var842
		end
	end
	local buff_1 = buffer.create(var835)
	buffer.copy(buff_1, 0, buff, 0, var835)
	
	return buff_1
end

function t_26.decode(p51)
	-- upvalues: t_26 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var844 = t_26.new()
	local var845 = 0
	while var845 < buffer.len(p51) do
		local _ = nil
		local var846 = nil
		local var847, var848, var849 = protoModule.readTag(p51, var845)
		local var850 = var847
		var846 = var848
		var845 = var849
		
		if var846 == protoModule.wireTypes.varint then
			if var850 == 2 then
				local _ = nil
				local var851, var852 = protoModule.readVarIntI32(p51, var845)
				local var853 = var851
				var845 = var852
				var844.kind = {
					type = "literal",
					value = t.HorizontalAlignment.fromNumber(var853) or var853
				}
			else
				local _ = nil
				local var854, var855 = protoModule.readVarInt(p51, var845)
				local _ = var854
				var845 = var855
			end
		end
		if var846 == protoModule.wireTypes.lengthDelimited then
			if var850 == 1 then
				local _ = nil
				local var856, var857 = protoModule.readBuffer(p51, var845)
				var845 = var857
				var844.condition = propConditionModule.PropCondition.decode(var856)
			elseif var850 == 3 then
				local _ = nil
				local var858, var859 = protoModule.readBuffer(p51, var845)
				var845 = var859
				var844.kind = { type = "binding_path", value = buffer.tostring(var858) }
			else
				local _ = nil
				local var860, var861 = protoModule.readVarInt(p51, var845)
				var845 = var861 + var860
			end
		elseif var846 == protoModule.wireTypes.i32 then
			local _ = nil
			local var862, var863 = protoModule.readFixed32(p51, var845)
			local _ = var862
			var845 = var863
		elseif var846 == protoModule.wireTypes.i64 then
			local _ = nil
			local var864, var865 = protoModule.readFixed64(p51, var845)
			local _ = var864
			var845 = var865
		else
			error("Unsupported wire type: " .. var846)
		end
	end
	return var844
end

function t_26:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.HorizontalAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref), propConditionModule (ref), t (ref)
	local var867 = t_26.new()
	
	if self.condition ~= nil then
		var867.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var867.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.HorizontalAlignment.fromNumber(self.literal) or self.literal else t.HorizontalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var867.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var867.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var867
end

t_26.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.HorizontalAlignmentProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.HorizontalAlignmentProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p52)
	-- upvalues: t_27 (ref)
	return setmetatable({
		option = if p52 == nil or p52.option == nil then {} else p52.option
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var869 = 0
	
	if self.option ~= nil and #self.option > 0 then
		for i, v in self.option do
			local var870 = v:encode()
			local var871, var872 = protoModule.writeTag(buff, var869, 1, protoModule.wireTypes.lengthDelimited)
			var871, var872 = protoModule.writeBuffer(var871, var872, var870, buffer.len(var870))
			buff = var871
			var869 = var872
		end
	end
	local buff_1 = buffer.create(var869)
	buffer.copy(buff_1, 0, buff, 0, var869)
	
	return buff_1
end

function t_27.decode(p53)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var874 = t_27.new()
	local var875 = 0
	while var875 < buffer.len(p53) do
		local _ = nil
		local var876 = nil
		local var877, var878, var879 = protoModule.readTag(p53, var875)
		local var880 = var877
		var876 = var878
		var875 = var879
		
		if var876 == protoModule.wireTypes.varint then
			local _ = nil
			local var881, var882 = protoModule.readVarInt(p53, var875)
			local _ = var881
			var875 = var882
			continue
		end
		if var876 == protoModule.wireTypes.lengthDelimited then
			if var880 == 1 then
				local _ = nil
				local var883, var884 = protoModule.readBuffer(p53, var875)
				var875 = var884
				table.insert(var874.option, t.HorizontalAlignmentProp_ConditionalOption.decode(var883))
			else
				local _ = nil
				local var885, var886 = protoModule.readVarInt(p53, var875)
				var875 = var886 + var885
			end
		elseif var876 == protoModule.wireTypes.i32 then
			local _ = nil
			local var887, var888 = protoModule.readFixed32(p53, var875)
			local _ = var887
			var875 = var888
		elseif var876 == protoModule.wireTypes.i64 then
			local _ = nil
			local var889, var890 = protoModule.readFixed64(p53, var875)
			local _ = var889
			var875 = var890
		else
			error("Unsupported wire type: " .. var876)
		end
	end
	return var874
end

function t_27:jsonEncode()
	local t = {}
	
	if self.option ~= nil and #self.option > 0 then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, v:jsonEncode())
		end
		t.option = t_1
	end
	return t
end

function t_27:jsonDecode()
	-- upvalues: t_27 (ref), t (ref)
	local var893 = t_27.new()
	
	if self.option ~= nil then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, t.HorizontalAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var893.option = t_1
	end
	return var893
end

t_27.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.HorizontalAlignmentProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.HorizontalAlignmentProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p54)
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p54 == nil or p54.kind == nil then nil else p54.kind
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var896 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var897, var898 = protoModule.writeTag(buff, var896, 1, protoModule.wireTypes.varint)
			var897, var898 = protoModule.writeVarInt(var897, var898, t.SelectionBehavior.toNumber(self.kind.value))
			buff = var897
			var896 = var898
		elseif self.kind.type == "binding_path" then
			local var899, var900 = protoModule.writeTag(buff, var896, 2, protoModule.wireTypes.lengthDelimited)
			var899, var900 = protoModule.writeString(var899, var900, self.kind.value)
			buff = var899
			var896 = var900
		elseif self.kind.type == "conditional" then
			local var901 = self.kind.value:encode()
			local var902, var903 = protoModule.writeTag(buff, var896, 3, protoModule.wireTypes.lengthDelimited)
			var902, var903 = protoModule.writeBuffer(var902, var903, var901, buffer.len(var901))
			buff = var902
			var896 = var903
		end
	end
	local buff_1 = buffer.create(var896)
	buffer.copy(buff_1, 0, buff, 0, var896)
	
	return buff_1
end

function t_28.decode(p55)
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var905 = t_28.new()
	local var906 = 0
	while var906 < buffer.len(p55) do
		local _ = nil
		local var907 = nil
		local var908, var909, var910 = protoModule.readTag(p55, var906)
		local var911 = var908
		var907 = var909
		var906 = var910
		
		if var907 == protoModule.wireTypes.varint then
			if var911 == 1 then
				local _ = nil
				local var912, var913 = protoModule.readVarIntI32(p55, var906)
				local var914 = var912
				var906 = var913
				var905.kind = {
					type = "literal",
					value = t.SelectionBehavior.fromNumber(var914) or var914
				}
			else
				local _ = nil
				local var915, var916 = protoModule.readVarInt(p55, var906)
				local _ = var915
				var906 = var916
			end
		end
		if var907 == protoModule.wireTypes.lengthDelimited then
			if var911 == 2 then
				local _ = nil
				local var917, var918 = protoModule.readBuffer(p55, var906)
				var906 = var918
				var905.kind = { type = "binding_path", value = buffer.tostring(var917) }
			elseif var911 == 3 then
				local _ = nil
				local var919, var920 = protoModule.readBuffer(p55, var906)
				var906 = var920
				var905.kind = {
					type = "conditional",
					value = t.SelectionBehaviorProp_ConditionalOptions.decode(var919)
				}
			else
				local _ = nil
				local var921, var922 = protoModule.readVarInt(p55, var906)
				var906 = var922 + var921
			end
		elseif var907 == protoModule.wireTypes.i32 then
			local _ = nil
			local var923, var924 = protoModule.readFixed32(p55, var906)
			local _ = var923
			var906 = var924
		elseif var907 == protoModule.wireTypes.i64 then
			local _ = nil
			local var925, var926 = protoModule.readFixed64(p55, var906)
			local _ = var925
			var906 = var926
		else
			error("Unsupported wire type: " .. var907)
		end
	end
	return var905
end

function t_28:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.SelectionBehavior.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_28:jsonDecode()
	-- upvalues: t_28 (ref), t (ref)
	local var928 = t_28.new()
	
	if self.literal ~= nil then
		var928.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SelectionBehavior.fromNumber(self.literal) or self.literal else t.SelectionBehavior.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var928.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var928.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var928.kind = {
			type = "conditional",
			value = t.SelectionBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var928
end

t_28.descriptor = {
	name = "SelectionBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectionBehaviorProp"
}
t.SelectionBehaviorProp = t_28
typeRegistryModule.default:register(t.SelectionBehaviorProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p56)
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p56 == nil or p56.condition == nil then nil else p56.condition,
		kind = if p56 == nil or p56.kind == nil then nil else p56.kind
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var930 = 0
	
	if self.condition ~= nil then
		local var931 = self.condition:encode()
		local var932, var933 = protoModule.writeTag(buff, var930, 1, protoModule.wireTypes.lengthDelimited)
		var932, var933 = protoModule.writeBuffer(var932, var933, var931, buffer.len(var931))
		buff = var932
		var930 = var933
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var934, var935 = protoModule.writeTag(buff, var930, 2, protoModule.wireTypes.varint)
			var934, var935 = protoModule.writeVarInt(var934, var935, t.SelectionBehavior.toNumber(self.kind.value))
			buff = var934
			var930 = var935
		elseif self.kind.type == "binding_path" then
			local var936, var937 = protoModule.writeTag(buff, var930, 3, protoModule.wireTypes.lengthDelimited)
			var936, var937 = protoModule.writeString(var936, var937, self.kind.value)
			buff = var936
			var930 = var937
		end
	end
	local buff_1 = buffer.create(var930)
	buffer.copy(buff_1, 0, buff, 0, var930)
	
	return buff_1
end

function t_29.decode(p57)
	-- upvalues: t_29 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var939 = t_29.new()
	local var940 = 0
	while var940 < buffer.len(p57) do
		local _ = nil
		local var941 = nil
		local var942, var943, var944 = protoModule.readTag(p57, var940)
		local var945 = var942
		var941 = var943
		var940 = var944
		
		if var941 == protoModule.wireTypes.varint then
			if var945 == 2 then
				local _ = nil
				local var946, var947 = protoModule.readVarIntI32(p57, var940)
				local var948 = var946
				var940 = var947
				var939.kind = {
					type = "literal",
					value = t.SelectionBehavior.fromNumber(var948) or var948
				}
			else
				local _ = nil
				local var949, var950 = protoModule.readVarInt(p57, var940)
				local _ = var949
				var940 = var950
			end
		end
		if var941 == protoModule.wireTypes.lengthDelimited then
			if var945 == 1 then
				local _ = nil
				local var951, var952 = protoModule.readBuffer(p57, var940)
				var940 = var952
				var939.condition = propConditionModule.PropCondition.decode(var951)
			elseif var945 == 3 then
				local _ = nil
				local var953, var954 = protoModule.readBuffer(p57, var940)
				var940 = var954
				var939.kind = { type = "binding_path", value = buffer.tostring(var953) }
			else
				local _ = nil
				local var955, var956 = protoModule.readVarInt(p57, var940)
				var940 = var956 + var955
			end
		elseif var941 == protoModule.wireTypes.i32 then
			local _ = nil
			local var957, var958 = protoModule.readFixed32(p57, var940)
			local _ = var957
			var940 = var958
		elseif var941 == protoModule.wireTypes.i64 then
			local _ = nil
			local var959, var960 = protoModule.readFixed64(p57, var940)
			local _ = var959
			var940 = var960
		else
			error("Unsupported wire type: " .. var941)
		end
	end
	return var939
end

function t_29:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.SelectionBehavior.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref), propConditionModule (ref), t (ref)
	local var962 = t_29.new()
	
	if self.condition ~= nil then
		var962.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var962.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SelectionBehavior.fromNumber(self.literal) or self.literal else t.SelectionBehavior.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var962.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var962.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var962
end

t_29.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.SelectionBehaviorProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.SelectionBehaviorProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p58)
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p58 == nil or p58.options == nil then {} else p58.options
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var964 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var965 = v:encode()
			local var966, var967 = protoModule.writeTag(buff, var964, 1, protoModule.wireTypes.lengthDelimited)
			var966, var967 = protoModule.writeBuffer(var966, var967, var965, buffer.len(var965))
			buff = var966
			var964 = var967
		end
	end
	local buff_1 = buffer.create(var964)
	buffer.copy(buff_1, 0, buff, 0, var964)
	
	return buff_1
end

function t_30.decode(p59)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var969 = t_30.new()
	local var970 = 0
	while var970 < buffer.len(p59) do
		local _ = nil
		local var971 = nil
		local var972, var973, var974 = protoModule.readTag(p59, var970)
		local var975 = var972
		var971 = var973
		var970 = var974
		
		if var971 == protoModule.wireTypes.varint then
			local _ = nil
			local var976, var977 = protoModule.readVarInt(p59, var970)
			local _ = var976
			var970 = var977
			continue
		end
		if var971 == protoModule.wireTypes.lengthDelimited then
			if var975 == 1 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p59, var970)
				var970 = var979
				table.insert(var969.options, t.SelectionBehaviorProp_ConditionalOption.decode(var978))
			else
				local _ = nil
				local var980, var981 = protoModule.readVarInt(p59, var970)
				var970 = var981 + var980
			end
		elseif var971 == protoModule.wireTypes.i32 then
			local _ = nil
			local var982, var983 = protoModule.readFixed32(p59, var970)
			local _ = var982
			var970 = var983
		elseif var971 == protoModule.wireTypes.i64 then
			local _ = nil
			local var984, var985 = protoModule.readFixed64(p59, var970)
			local _ = var984
			var970 = var985
		else
			error("Unsupported wire type: " .. var971)
		end
	end
	return var969
end

function t_30:jsonEncode()
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

function t_30:jsonDecode()
	-- upvalues: t_30 (ref), t (ref)
	local var988 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectionBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var988.options = t_1
	end
	return var988
end

t_30.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.SelectionBehaviorProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.SelectionBehaviorProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p60)
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p60 == nil or p60.kind == nil then nil else p60.kind
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var991 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var992, var993 = protoModule.writeTag(buff, var991, 1, protoModule.wireTypes.varint)
			var992, var993 = protoModule.writeVarInt(var992, var993, t.KeyCode.toNumber(self.kind.value))
			buff = var992
			var991 = var993
		elseif self.kind.type == "binding_path" then
			local var994, var995 = protoModule.writeTag(buff, var991, 2, protoModule.wireTypes.lengthDelimited)
			var994, var995 = protoModule.writeString(var994, var995, self.kind.value)
			buff = var994
			var991 = var995
		elseif self.kind.type == "conditional" then
			local var996 = self.kind.value:encode()
			local var997, var998 = protoModule.writeTag(buff, var991, 3, protoModule.wireTypes.lengthDelimited)
			var997, var998 = protoModule.writeBuffer(var997, var998, var996, buffer.len(var996))
			buff = var997
			var991 = var998
		end
	end
	local buff_1 = buffer.create(var991)
	buffer.copy(buff_1, 0, buff, 0, var991)
	
	return buff_1
end

function t_31.decode(p61)
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var1000 = t_31.new()
	local var1001 = 0
	while var1001 < buffer.len(p61) do
		local _ = nil
		local var1002 = nil
		local var1003, var1004, var1005 = protoModule.readTag(p61, var1001)
		local var1006 = var1003
		var1002 = var1004
		var1001 = var1005
		
		if var1002 == protoModule.wireTypes.varint then
			if var1006 == 1 then
				local _ = nil
				local var1007, var1008 = protoModule.readVarIntI32(p61, var1001)
				local var1009 = var1007
				var1001 = var1008
				var1000.kind = {
					type = "literal",
					value = t.KeyCode.fromNumber(var1009) or var1009
				}
			else
				local _ = nil
				local var1010, var1011 = protoModule.readVarInt(p61, var1001)
				local _ = var1010
				var1001 = var1011
			end
		end
		if var1002 == protoModule.wireTypes.lengthDelimited then
			if var1006 == 2 then
				local _ = nil
				local var1012, var1013 = protoModule.readBuffer(p61, var1001)
				var1001 = var1013
				var1000.kind = { type = "binding_path", value = buffer.tostring(var1012) }
			elseif var1006 == 3 then
				local _ = nil
				local var1014, var1015 = protoModule.readBuffer(p61, var1001)
				var1001 = var1015
				var1000.kind = {
					type = "conditional",
					value = t.KeyCodeProp_ConditionalOptions.decode(var1014)
				}
			else
				local _ = nil
				local var1016, var1017 = protoModule.readVarInt(p61, var1001)
				var1001 = var1017 + var1016
			end
		elseif var1002 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1018, var1019 = protoModule.readFixed32(p61, var1001)
			local _ = var1018
			var1001 = var1019
		elseif var1002 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1020, var1021 = protoModule.readFixed64(p61, var1001)
			local _ = var1020
			var1001 = var1021
		else
			error("Unsupported wire type: " .. var1002)
		end
	end
	return var1000
end

function t_31:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.KeyCode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref), t (ref)
	local var1023 = t_31.new()
	
	if self.literal ~= nil then
		var1023.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.KeyCode.fromNumber(self.literal) or self.literal else t.KeyCode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var1023.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1023.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1023.kind = {
			type = "conditional",
			value = t.KeyCodeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1023
end

t_31.descriptor = {
	name = "KeyCodeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeyCodeProp"
}
t.KeyCodeProp = t_31
typeRegistryModule.default:register(t.KeyCodeProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p62)
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p62 == nil or p62.condition == nil then nil else p62.condition,
		kind = if p62 == nil or p62.kind == nil then nil else p62.kind
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1025 = 0
	
	if self.condition ~= nil then
		local var1026 = self.condition:encode()
		local var1027, var1028 = protoModule.writeTag(buff, var1025, 1, protoModule.wireTypes.lengthDelimited)
		var1027, var1028 = protoModule.writeBuffer(var1027, var1028, var1026, buffer.len(var1026))
		buff = var1027
		var1025 = var1028
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1029, var1030 = protoModule.writeTag(buff, var1025, 2, protoModule.wireTypes.varint)
			var1029, var1030 = protoModule.writeVarInt(var1029, var1030, t.KeyCode.toNumber(self.kind.value))
			buff = var1029
			var1025 = var1030
		elseif self.kind.type == "binding_path" then
			local var1031, var1032 = protoModule.writeTag(buff, var1025, 3, protoModule.wireTypes.lengthDelimited)
			var1031, var1032 = protoModule.writeString(var1031, var1032, self.kind.value)
			buff = var1031
			var1025 = var1032
		end
	end
	local buff_1 = buffer.create(var1025)
	buffer.copy(buff_1, 0, buff, 0, var1025)
	
	return buff_1
end

function t_32.decode(p63)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var1034 = t_32.new()
	local var1035 = 0
	while var1035 < buffer.len(p63) do
		local _ = nil
		local var1036 = nil
		local var1037, var1038, var1039 = protoModule.readTag(p63, var1035)
		local var1040 = var1037
		var1036 = var1038
		var1035 = var1039
		
		if var1036 == protoModule.wireTypes.varint then
			if var1040 == 2 then
				local _ = nil
				local var1041, var1042 = protoModule.readVarIntI32(p63, var1035)
				local var1043 = var1041
				var1035 = var1042
				var1034.kind = {
					type = "literal",
					value = t.KeyCode.fromNumber(var1043) or var1043
				}
			else
				local _ = nil
				local var1044, var1045 = protoModule.readVarInt(p63, var1035)
				local _ = var1044
				var1035 = var1045
			end
		end
		if var1036 == protoModule.wireTypes.lengthDelimited then
			if var1040 == 1 then
				local _ = nil
				local var1046, var1047 = protoModule.readBuffer(p63, var1035)
				var1035 = var1047
				var1034.condition = propConditionModule.PropCondition.decode(var1046)
			elseif var1040 == 3 then
				local _ = nil
				local var1048, var1049 = protoModule.readBuffer(p63, var1035)
				var1035 = var1049
				var1034.kind = { type = "binding_path", value = buffer.tostring(var1048) }
			else
				local _ = nil
				local var1050, var1051 = protoModule.readVarInt(p63, var1035)
				var1035 = var1051 + var1050
			end
		elseif var1036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1052, var1053 = protoModule.readFixed32(p63, var1035)
			local _ = var1052
			var1035 = var1053
		elseif var1036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1054, var1055 = protoModule.readFixed64(p63, var1035)
			local _ = var1054
			var1035 = var1055
		else
			error("Unsupported wire type: " .. var1036)
		end
	end
	return var1034
end

function t_32:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.KeyCode.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref), propConditionModule (ref), t (ref)
	local var1057 = t_32.new()
	
	if self.condition ~= nil then
		var1057.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1057.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.KeyCode.fromNumber(self.literal) or self.literal else t.KeyCode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var1057.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1057.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1057
end

t_32.descriptor = {
	name = "KeyCodeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.KeyCodeProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.KeyCodeProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p64)
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p64 == nil or p64.options == nil then {} else p64.options
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1059 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1060 = v:encode()
			local var1061, var1062 = protoModule.writeTag(buff, var1059, 1, protoModule.wireTypes.lengthDelimited)
			var1061, var1062 = protoModule.writeBuffer(var1061, var1062, var1060, buffer.len(var1060))
			buff = var1061
			var1059 = var1062
		end
	end
	local buff_1 = buffer.create(var1059)
	buffer.copy(buff_1, 0, buff, 0, var1059)
	
	return buff_1
end

function t_33.decode(p65)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1064 = t_33.new()
	local var1065 = 0
	while var1065 < buffer.len(p65) do
		local _ = nil
		local var1066 = nil
		local var1067, var1068, var1069 = protoModule.readTag(p65, var1065)
		local var1070 = var1067
		var1066 = var1068
		var1065 = var1069
		
		if var1066 == protoModule.wireTypes.varint then
			local _ = nil
			local var1071, var1072 = protoModule.readVarInt(p65, var1065)
			local _ = var1071
			var1065 = var1072
			continue
		end
		if var1066 == protoModule.wireTypes.lengthDelimited then
			if var1070 == 1 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p65, var1065)
				var1065 = var1074
				table.insert(var1064.options, t.KeyCodeProp_ConditionalOption.decode(var1073))
			else
				local _ = nil
				local var1075, var1076 = protoModule.readVarInt(p65, var1065)
				var1065 = var1076 + var1075
			end
		elseif var1066 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1077, var1078 = protoModule.readFixed32(p65, var1065)
			local _ = var1077
			var1065 = var1078
		elseif var1066 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1079, var1080 = protoModule.readFixed64(p65, var1065)
			local _ = var1079
			var1065 = var1080
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var1064
end

function t_33:jsonEncode()
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

function t_33:jsonDecode()
	-- upvalues: t_33 (ref), t (ref)
	local var1083 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.KeyCodeProp_ConditionalOption.jsonDecode(v))
		end
		var1083.options = t_1
	end
	return var1083
end

t_33.descriptor = {
	name = "KeyCodeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.KeyCodeProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.KeyCodeProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p66)
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p66 == nil or p66.kind == nil then nil else p66.kind
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1086 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1087, var1088 = protoModule.writeTag(buff, var1086, 1, protoModule.wireTypes.varint)
			var1087, var1088 = protoModule.writeVarInt(var1087, var1088, t.VerticalAlignment.toNumber(self.kind.value))
			buff = var1087
			var1086 = var1088
		elseif self.kind.type == "binding_path" then
			local var1089, var1090 = protoModule.writeTag(buff, var1086, 2, protoModule.wireTypes.lengthDelimited)
			var1089, var1090 = protoModule.writeString(var1089, var1090, self.kind.value)
			buff = var1089
			var1086 = var1090
		elseif self.kind.type == "conditional" then
			local var1091 = self.kind.value:encode()
			local var1092, var1093 = protoModule.writeTag(buff, var1086, 3, protoModule.wireTypes.lengthDelimited)
			var1092, var1093 = protoModule.writeBuffer(var1092, var1093, var1091, buffer.len(var1091))
			buff = var1092
			var1086 = var1093
		end
	end
	local buff_1 = buffer.create(var1086)
	buffer.copy(buff_1, 0, buff, 0, var1086)
	
	return buff_1
end

function t_34.decode(p67)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1095 = t_34.new()
	local var1096 = 0
	while var1096 < buffer.len(p67) do
		local _ = nil
		local var1097 = nil
		local var1098, var1099, var1100 = protoModule.readTag(p67, var1096)
		local var1101 = var1098
		var1097 = var1099
		var1096 = var1100
		
		if var1097 == protoModule.wireTypes.varint then
			if var1101 == 1 then
				local _ = nil
				local var1102, var1103 = protoModule.readVarIntI32(p67, var1096)
				local var1104 = var1102
				var1096 = var1103
				var1095.kind = {
					type = "literal",
					value = t.VerticalAlignment.fromNumber(var1104) or var1104
				}
			else
				local _ = nil
				local var1105, var1106 = protoModule.readVarInt(p67, var1096)
				local _ = var1105
				var1096 = var1106
			end
		end
		if var1097 == protoModule.wireTypes.lengthDelimited then
			if var1101 == 2 then
				local _ = nil
				local var1107, var1108 = protoModule.readBuffer(p67, var1096)
				var1096 = var1108
				var1095.kind = { type = "binding_path", value = buffer.tostring(var1107) }
			elseif var1101 == 3 then
				local _ = nil
				local var1109, var1110 = protoModule.readBuffer(p67, var1096)
				var1096 = var1110
				var1095.kind = {
					type = "conditional",
					value = t.VerticalAlignmentProp_ConditionalOptions.decode(var1109)
				}
			else
				local _ = nil
				local var1111, var1112 = protoModule.readVarInt(p67, var1096)
				var1096 = var1112 + var1111
			end
		elseif var1097 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1113, var1114 = protoModule.readFixed32(p67, var1096)
			local _ = var1113
			var1096 = var1114
		elseif var1097 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1115, var1116 = protoModule.readFixed64(p67, var1096)
			local _ = var1115
			var1096 = var1116
		else
			error("Unsupported wire type: " .. var1097)
		end
	end
	return var1095
end

function t_34:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.VerticalAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref), t (ref)
	local var1118 = t_34.new()
	
	if self.literal ~= nil then
		var1118.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.VerticalAlignment.fromNumber(self.literal) or self.literal else t.VerticalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var1118.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1118.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1118.kind = {
			type = "conditional",
			value = t.VerticalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1118
end

t_34.descriptor = {
	name = "VerticalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalAlignmentProp"
}
t.VerticalAlignmentProp = t_34
typeRegistryModule.default:register(t.VerticalAlignmentProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p68)
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p68 == nil or p68.condition == nil then nil else p68.condition,
		kind = if p68 == nil or p68.kind == nil then nil else p68.kind
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1120 = 0
	
	if self.condition ~= nil then
		local var1121 = self.condition:encode()
		local var1122, var1123 = protoModule.writeTag(buff, var1120, 1, protoModule.wireTypes.lengthDelimited)
		var1122, var1123 = protoModule.writeBuffer(var1122, var1123, var1121, buffer.len(var1121))
		buff = var1122
		var1120 = var1123
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1124, var1125 = protoModule.writeTag(buff, var1120, 2, protoModule.wireTypes.varint)
			var1124, var1125 = protoModule.writeVarInt(var1124, var1125, t.VerticalAlignment.toNumber(self.kind.value))
			buff = var1124
			var1120 = var1125
		elseif self.kind.type == "binding_path" then
			local var1126, var1127 = protoModule.writeTag(buff, var1120, 3, protoModule.wireTypes.lengthDelimited)
			var1126, var1127 = protoModule.writeString(var1126, var1127, self.kind.value)
			buff = var1126
			var1120 = var1127
		end
	end
	local buff_1 = buffer.create(var1120)
	buffer.copy(buff_1, 0, buff, 0, var1120)
	
	return buff_1
end

function t_35.decode(p69)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var1129 = t_35.new()
	local var1130 = 0
	while var1130 < buffer.len(p69) do
		local _ = nil
		local var1131 = nil
		local var1132, var1133, var1134 = protoModule.readTag(p69, var1130)
		local var1135 = var1132
		var1131 = var1133
		var1130 = var1134
		
		if var1131 == protoModule.wireTypes.varint then
			if var1135 == 2 then
				local _ = nil
				local var1136, var1137 = protoModule.readVarIntI32(p69, var1130)
				local var1138 = var1136
				var1130 = var1137
				var1129.kind = {
					type = "literal",
					value = t.VerticalAlignment.fromNumber(var1138) or var1138
				}
			else
				local _ = nil
				local var1139, var1140 = protoModule.readVarInt(p69, var1130)
				local _ = var1139
				var1130 = var1140
			end
		end
		if var1131 == protoModule.wireTypes.lengthDelimited then
			if var1135 == 1 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p69, var1130)
				var1130 = var1142
				var1129.condition = propConditionModule.PropCondition.decode(var1141)
			elseif var1135 == 3 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p69, var1130)
				var1130 = var1144
				var1129.kind = { type = "binding_path", value = buffer.tostring(var1143) }
			else
				local _ = nil
				local var1145, var1146 = protoModule.readVarInt(p69, var1130)
				var1130 = var1146 + var1145
			end
		elseif var1131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1147, var1148 = protoModule.readFixed32(p69, var1130)
			local _ = var1147
			var1130 = var1148
		elseif var1131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1149, var1150 = protoModule.readFixed64(p69, var1130)
			local _ = var1149
			var1130 = var1150
		else
			error("Unsupported wire type: " .. var1131)
		end
	end
	return var1129
end

function t_35:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.VerticalAlignment.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), propConditionModule (ref), t (ref)
	local var1152 = t_35.new()
	
	if self.condition ~= nil then
		var1152.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1152.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.VerticalAlignment.fromNumber(self.literal) or self.literal else t.VerticalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var1152.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1152.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1152
end

t_35.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.VerticalAlignmentProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.VerticalAlignmentProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p70)
	-- upvalues: t_36 (ref)
	return setmetatable({
		option = if p70 == nil or p70.option == nil then {} else p70.option
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1154 = 0
	
	if self.option ~= nil and #self.option > 0 then
		for i, v in self.option do
			local var1155 = v:encode()
			local var1156, var1157 = protoModule.writeTag(buff, var1154, 1, protoModule.wireTypes.lengthDelimited)
			var1156, var1157 = protoModule.writeBuffer(var1156, var1157, var1155, buffer.len(var1155))
			buff = var1156
			var1154 = var1157
		end
	end
	local buff_1 = buffer.create(var1154)
	buffer.copy(buff_1, 0, buff, 0, var1154)
	
	return buff_1
end

function t_36.decode(p71)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1159 = t_36.new()
	local var1160 = 0
	while var1160 < buffer.len(p71) do
		local _ = nil
		local var1161 = nil
		local var1162, var1163, var1164 = protoModule.readTag(p71, var1160)
		local var1165 = var1162
		var1161 = var1163
		var1160 = var1164
		
		if var1161 == protoModule.wireTypes.varint then
			local _ = nil
			local var1166, var1167 = protoModule.readVarInt(p71, var1160)
			local _ = var1166
			var1160 = var1167
			continue
		end
		if var1161 == protoModule.wireTypes.lengthDelimited then
			if var1165 == 1 then
				local _ = nil
				local var1168, var1169 = protoModule.readBuffer(p71, var1160)
				var1160 = var1169
				table.insert(var1159.option, t.VerticalAlignmentProp_ConditionalOption.decode(var1168))
			else
				local _ = nil
				local var1170, var1171 = protoModule.readVarInt(p71, var1160)
				var1160 = var1171 + var1170
			end
		elseif var1161 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1172, var1173 = protoModule.readFixed32(p71, var1160)
			local _ = var1172
			var1160 = var1173
		elseif var1161 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1174, var1175 = protoModule.readFixed64(p71, var1160)
			local _ = var1174
			var1160 = var1175
		else
			error("Unsupported wire type: " .. var1161)
		end
	end
	return var1159
end

function t_36:jsonEncode()
	local t = {}
	
	if self.option ~= nil and #self.option > 0 then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, v:jsonEncode())
		end
		t.option = t_1
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), t (ref)
	local var1178 = t_36.new()
	
	if self.option ~= nil then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, t.VerticalAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var1178.option = t_1
	end
	return var1178
end

t_36.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.VerticalAlignmentProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.VerticalAlignmentProp_ConditionalOptions)
t.AutomaticSize = {
	fromNumber = function(p72)
		return if p72 == 0 then "AUTOMATIC_SIZE_INVALID" elseif p72 == 1 then "AUTOMATIC_SIZE_NONE" elseif p72 == 2 then "AUTOMATIC_SIZE_X" elseif p72 == 3 then "AUTOMATIC_SIZE_Y" elseif p72 == 4 then "AUTOMATIC_SIZE_XY" else nil
	end,
	toNumber = function(p73)
		return if p73 == "AUTOMATIC_SIZE_INVALID" then 0 elseif p73 == "AUTOMATIC_SIZE_NONE" then 1 elseif p73 == "AUTOMATIC_SIZE_X" then 2 elseif p73 == "AUTOMATIC_SIZE_Y" then 3 elseif p73 == "AUTOMATIC_SIZE_XY" then 4 else p73
	end,
	fromName = function(p74)
		return if p74 == "AUTOMATIC_SIZE_INVALID" then "AUTOMATIC_SIZE_INVALID" elseif p74 == "AUTOMATIC_SIZE_NONE" then "AUTOMATIC_SIZE_NONE" elseif p74 == "AUTOMATIC_SIZE_X" then "AUTOMATIC_SIZE_X" elseif p74 == "AUTOMATIC_SIZE_Y" then "AUTOMATIC_SIZE_Y" elseif p74 == "AUTOMATIC_SIZE_XY" then "AUTOMATIC_SIZE_XY" else nil
	end
}
t.TextTruncate = {
	fromNumber = function(p75)
		return if p75 == 0 then "TEXT_TRUNCATE_INVALID" elseif p75 == 1 then "TEXT_TRUNCATE_NONE" elseif p75 == 2 then "TEXT_TRUNCATE_AT_END" elseif p75 == 3 then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end,
	toNumber = function(p76)
		return if p76 == "TEXT_TRUNCATE_INVALID" then 0 elseif p76 == "TEXT_TRUNCATE_NONE" then 1 elseif p76 == "TEXT_TRUNCATE_AT_END" then 2 elseif p76 == "TEXT_TRUNCATE_SPLIT_WORD" then 3 else p76
	end,
	fromName = function(p77)
		return if p77 == "TEXT_TRUNCATE_INVALID" then "TEXT_TRUNCATE_INVALID" elseif p77 == "TEXT_TRUNCATE_NONE" then "TEXT_TRUNCATE_NONE" elseif p77 == "TEXT_TRUNCATE_AT_END" then "TEXT_TRUNCATE_AT_END" elseif p77 == "TEXT_TRUNCATE_SPLIT_WORD" then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end
}
t.TextXAlignment = {
	fromNumber = function(p78)
		return if p78 == 0 then "TEXT_X_ALIGNMENT_INVALID" elseif p78 == 1 then "TEXT_X_ALIGNMENT_LEFT" elseif p78 == 2 then "TEXT_X_ALIGNMENT_CENTER" elseif p78 == 3 then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p79)
		return if p79 == "TEXT_X_ALIGNMENT_INVALID" then 0 elseif p79 == "TEXT_X_ALIGNMENT_LEFT" then 1 elseif p79 == "TEXT_X_ALIGNMENT_CENTER" then 2 elseif p79 == "TEXT_X_ALIGNMENT_RIGHT" then 3 else p79
	end,
	fromName = function(p80)
		return if p80 == "TEXT_X_ALIGNMENT_INVALID" then "TEXT_X_ALIGNMENT_INVALID" elseif p80 == "TEXT_X_ALIGNMENT_LEFT" then "TEXT_X_ALIGNMENT_LEFT" elseif p80 == "TEXT_X_ALIGNMENT_CENTER" then "TEXT_X_ALIGNMENT_CENTER" elseif p80 == "TEXT_X_ALIGNMENT_RIGHT" then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end
}
t.TextYAlignment = {
	fromNumber = function(p81)
		return if p81 == 0 then "TEXT_Y_ALIGNMENT_INVALID" elseif p81 == 1 then "TEXT_Y_ALIGNMENT_TOP" elseif p81 == 2 then "TEXT_Y_ALIGNMENT_CENTER" elseif p81 == 3 then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p82)
		return if p82 == "TEXT_Y_ALIGNMENT_INVALID" then 0 elseif p82 == "TEXT_Y_ALIGNMENT_TOP" then 1 elseif p82 == "TEXT_Y_ALIGNMENT_CENTER" then 2 elseif p82 == "TEXT_Y_ALIGNMENT_BOTTOM" then 3 else p82
	end,
	fromName = function(p83)
		return if p83 == "TEXT_Y_ALIGNMENT_INVALID" then "TEXT_Y_ALIGNMENT_INVALID" elseif p83 == "TEXT_Y_ALIGNMENT_TOP" then "TEXT_Y_ALIGNMENT_TOP" elseif p83 == "TEXT_Y_ALIGNMENT_CENTER" then "TEXT_Y_ALIGNMENT_CENTER" elseif p83 == "TEXT_Y_ALIGNMENT_BOTTOM" then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end
}
t.UIFlexMode = {
	fromNumber = function(p84)
		return if p84 == 0 then "UI_FLEX_MODE_INVALID" elseif p84 == 1 then "UI_FLEX_MODE_NONE" elseif p84 == 2 then "UI_FLEX_MODE_GROW" elseif p84 == 3 then "UI_FLEX_MODE_SHRINK" elseif p84 == 4 then "UI_FLEX_MODE_FILL" elseif p84 == 5 then "UI_FLEX_MODE_CUSTOM" else nil
	end,
	toNumber = function(p85)
		return if p85 == "UI_FLEX_MODE_INVALID" then 0 elseif p85 == "UI_FLEX_MODE_NONE" then 1 elseif p85 == "UI_FLEX_MODE_GROW" then 2 elseif p85 == "UI_FLEX_MODE_SHRINK" then 3 elseif p85 == "UI_FLEX_MODE_FILL" then 4 elseif p85 == "UI_FLEX_MODE_CUSTOM" then 5 else p85
	end,
	fromName = function(p86)
		return if p86 == "UI_FLEX_MODE_INVALID" then "UI_FLEX_MODE_INVALID" elseif p86 == "UI_FLEX_MODE_NONE" then "UI_FLEX_MODE_NONE" elseif p86 == "UI_FLEX_MODE_GROW" then "UI_FLEX_MODE_GROW" elseif p86 == "UI_FLEX_MODE_SHRINK" then "UI_FLEX_MODE_SHRINK" elseif p86 == "UI_FLEX_MODE_FILL" then "UI_FLEX_MODE_FILL" elseif p86 == "UI_FLEX_MODE_CUSTOM" then "UI_FLEX_MODE_CUSTOM" else nil
	end
}
t.ScaleType = {
	fromNumber = function(p87)
		return if p87 == 0 then "SCALE_TYPE_INVALID" elseif p87 == 1 then "SCALE_TYPE_STRETCH" elseif p87 == 2 then "SCALE_TYPE_SLICE" elseif p87 == 3 then "SCALE_TYPE_TILE" elseif p87 == 4 then "SCALE_TYPE_FIT" elseif p87 == 5 then "SCALE_TYPE_CROP" else nil
	end,
	toNumber = function(p88)
		return if p88 == "SCALE_TYPE_INVALID" then 0 elseif p88 == "SCALE_TYPE_STRETCH" then 1 elseif p88 == "SCALE_TYPE_SLICE" then 2 elseif p88 == "SCALE_TYPE_TILE" then 3 elseif p88 == "SCALE_TYPE_FIT" then 4 elseif p88 == "SCALE_TYPE_CROP" then 5 else p88
	end,
	fromName = function(p89)
		return if p89 == "SCALE_TYPE_INVALID" then "SCALE_TYPE_INVALID" elseif p89 == "SCALE_TYPE_STRETCH" then "SCALE_TYPE_STRETCH" elseif p89 == "SCALE_TYPE_SLICE" then "SCALE_TYPE_SLICE" elseif p89 == "SCALE_TYPE_TILE" then "SCALE_TYPE_TILE" elseif p89 == "SCALE_TYPE_FIT" then "SCALE_TYPE_FIT" elseif p89 == "SCALE_TYPE_CROP" then "SCALE_TYPE_CROP" else nil
	end
}
t.ResamplerMode = {
	fromNumber = function(p90)
		return if p90 == 0 then "RESAMPLER_MODE_INVALID" elseif p90 == 1 then "RESAMPLER_MODE_DEFAULT" elseif p90 == 2 then "RESAMPLER_MODE_PIXELATED" else nil
	end,
	toNumber = function(p91)
		return if p91 == "RESAMPLER_MODE_INVALID" then 0 elseif p91 == "RESAMPLER_MODE_DEFAULT" then 1 elseif p91 == "RESAMPLER_MODE_PIXELATED" then 2 else p91
	end,
	fromName = function(p92)
		return if p92 == "RESAMPLER_MODE_INVALID" then "RESAMPLER_MODE_INVALID" elseif p92 == "RESAMPLER_MODE_DEFAULT" then "RESAMPLER_MODE_DEFAULT" elseif p92 == "RESAMPLER_MODE_PIXELATED" then "RESAMPLER_MODE_PIXELATED" else nil
	end
}
t.SizeConstraint = {
	fromNumber = function(p93)
		return if p93 == 0 then "SIZE_CONSTRAINT_INVALID" elseif p93 == 1 then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p93 == 2 then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p93 == 3 then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end,
	toNumber = function(p94)
		return if p94 == "SIZE_CONSTRAINT_INVALID" then 0 elseif p94 == "SIZE_CONSTRAINT_RELATIVE_XY" then 1 elseif p94 == "SIZE_CONSTRAINT_RELATIVE_XX" then 2 elseif p94 == "SIZE_CONSTRAINT_RELATIVE_YY" then 3 else p94
	end,
	fromName = function(p95)
		return if p95 == "SIZE_CONSTRAINT_INVALID" then "SIZE_CONSTRAINT_INVALID" elseif p95 == "SIZE_CONSTRAINT_RELATIVE_XY" then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p95 == "SIZE_CONSTRAINT_RELATIVE_XX" then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p95 == "SIZE_CONSTRAINT_RELATIVE_YY" then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end
}
t.HorizontalAlignment = {
	fromNumber = function(p96)
		return if p96 == 0 then "HORIZONTAL_ALIGNMENT_INVALID" elseif p96 == 1 then "HORIZONTAL_ALIGNMENT_LEFT" elseif p96 == 2 then "HORIZONTAL_ALIGNMENT_CENTER" elseif p96 == 3 then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p97)
		return if p97 == "HORIZONTAL_ALIGNMENT_INVALID" then 0 elseif p97 == "HORIZONTAL_ALIGNMENT_LEFT" then 1 elseif p97 == "HORIZONTAL_ALIGNMENT_CENTER" then 2 elseif p97 == "HORIZONTAL_ALIGNMENT_RIGHT" then 3 else p97
	end,
	fromName = function(p98)
		return if p98 == "HORIZONTAL_ALIGNMENT_INVALID" then "HORIZONTAL_ALIGNMENT_INVALID" elseif p98 == "HORIZONTAL_ALIGNMENT_LEFT" then "HORIZONTAL_ALIGNMENT_LEFT" elseif p98 == "HORIZONTAL_ALIGNMENT_CENTER" then "HORIZONTAL_ALIGNMENT_CENTER" elseif p98 == "HORIZONTAL_ALIGNMENT_RIGHT" then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end
}
t.VerticalAlignment = {
	fromNumber = function(p99)
		return if p99 == 0 then "VERTICAL_ALIGNMENT_INVALID" elseif p99 == 1 then "VERTICAL_ALIGNMENT_TOP" elseif p99 == 2 then "VERTICAL_ALIGNMENT_CENTER" elseif p99 == 3 then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p100)
		return if p100 == "VERTICAL_ALIGNMENT_INVALID" then 0 elseif p100 == "VERTICAL_ALIGNMENT_TOP" then 1 elseif p100 == "VERTICAL_ALIGNMENT_CENTER" then 2 elseif p100 == "VERTICAL_ALIGNMENT_BOTTOM" then 3 else p100
	end,
	fromName = function(p101)
		return if p101 == "VERTICAL_ALIGNMENT_INVALID" then "VERTICAL_ALIGNMENT_INVALID" elseif p101 == "VERTICAL_ALIGNMENT_TOP" then "VERTICAL_ALIGNMENT_TOP" elseif p101 == "VERTICAL_ALIGNMENT_CENTER" then "VERTICAL_ALIGNMENT_CENTER" elseif p101 == "VERTICAL_ALIGNMENT_BOTTOM" then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end
}
t.SelectionBehavior = {
	fromNumber = function(p102)
		return if p102 == 0 then "SELECTION_BEHAVIOR_INVALID" elseif p102 == 1 then "SELECTION_BEHAVIOR_ESCAPE" elseif p102 == 2 then "SELECTION_BEHAVIOR_STOP" else nil
	end,
	toNumber = function(p103)
		return if p103 == "SELECTION_BEHAVIOR_INVALID" then 0 elseif p103 == "SELECTION_BEHAVIOR_ESCAPE" then 1 elseif p103 == "SELECTION_BEHAVIOR_STOP" then 2 else p103
	end,
	fromName = function(p104)
		return if p104 == "SELECTION_BEHAVIOR_INVALID" then "SELECTION_BEHAVIOR_INVALID" elseif p104 == "SELECTION_BEHAVIOR_ESCAPE" then "SELECTION_BEHAVIOR_ESCAPE" elseif p104 == "SELECTION_BEHAVIOR_STOP" then "SELECTION_BEHAVIOR_STOP" else nil
	end
}
t.KeyCode = {
	fromNumber = function(p105)
		return if p105 == 0 then "KEY_CODE_INVALID" elseif p105 == 1 then "KEY_CODE_BUTTON_A" elseif p105 == 2 then "KEY_CODE_BUTTON_B" elseif p105 == 3 then "KEY_CODE_BUTTON_X" elseif p105 == 4 then "KEY_CODE_BUTTON_Y" elseif p105 == 5 then "KEY_CODE_BUTTON_L1" elseif p105 == 6 then "KEY_CODE_BUTTON_R1" elseif p105 == 7 then "KEY_CODE_BUTTON_L2" elseif p105 == 8 then "KEY_CODE_BUTTON_R2" elseif p105 == 9 then "KEY_CODE_BUTTON_L3" elseif p105 == 10 then "KEY_CODE_BUTTON_R3" else nil
	end,
	toNumber = function(p106)
		return if p106 == "KEY_CODE_INVALID" then 0 elseif p106 == "KEY_CODE_BUTTON_A" then 1 elseif p106 == "KEY_CODE_BUTTON_B" then 2 elseif p106 == "KEY_CODE_BUTTON_X" then 3 elseif p106 == "KEY_CODE_BUTTON_Y" then 4 elseif p106 == "KEY_CODE_BUTTON_L1" then 5 elseif p106 == "KEY_CODE_BUTTON_R1" then 6 elseif p106 == "KEY_CODE_BUTTON_L2" then 7 elseif p106 == "KEY_CODE_BUTTON_R2" then 8 elseif p106 == "KEY_CODE_BUTTON_L3" then 9 elseif p106 == "KEY_CODE_BUTTON_R3" then 10 else p106
	end,
	fromName = function(p107)
		return if p107 == "KEY_CODE_INVALID" then "KEY_CODE_INVALID" elseif p107 == "KEY_CODE_BUTTON_A" then "KEY_CODE_BUTTON_A" elseif p107 == "KEY_CODE_BUTTON_B" then "KEY_CODE_BUTTON_B" elseif p107 == "KEY_CODE_BUTTON_X" then "KEY_CODE_BUTTON_X" elseif p107 == "KEY_CODE_BUTTON_Y" then "KEY_CODE_BUTTON_Y" elseif p107 == "KEY_CODE_BUTTON_L1" then "KEY_CODE_BUTTON_L1" elseif p107 == "KEY_CODE_BUTTON_R1" then "KEY_CODE_BUTTON_R1" elseif p107 == "KEY_CODE_BUTTON_L2" then "KEY_CODE_BUTTON_L2" elseif p107 == "KEY_CODE_BUTTON_R2" then "KEY_CODE_BUTTON_R2" elseif p107 == "KEY_CODE_BUTTON_L3" then "KEY_CODE_BUTTON_L3" elseif p107 == "KEY_CODE_BUTTON_R3" then "KEY_CODE_BUTTON_R3" else nil
	end
}

return {
	AutomaticSizeProp = t.AutomaticSizeProp,
	AutomaticSizeProp_ConditionalOption = t.AutomaticSizeProp_ConditionalOption,
	AutomaticSizeProp_ConditionalOptions = t.AutomaticSizeProp_ConditionalOptions,
	TextTruncateProp = t.TextTruncateProp,
	TextTruncateProp_ConditionalOption = t.TextTruncateProp_ConditionalOption,
	TextTruncateProp_ConditionalOptions = t.TextTruncateProp_ConditionalOptions,
	TextXAlignmentProp = t.TextXAlignmentProp,
	TextXAlignmentProp_ConditionalOption = t.TextXAlignmentProp_ConditionalOption,
	TextXAlignmentProp_ConditionalOptions = t.TextXAlignmentProp_ConditionalOptions,
	TextYAlignmentProp = t.TextYAlignmentProp,
	TextYAlignmentProp_ConditionalOption = t.TextYAlignmentProp_ConditionalOption,
	TextYAlignmentProp_ConditionalOptions = t.TextYAlignmentProp_ConditionalOptions,
	UIFlexModeProp = t.UIFlexModeProp,
	UIFlexModeProp_ConditionalOption = t.UIFlexModeProp_ConditionalOption,
	UIFlexModeProp_ConditionalOptions = t.UIFlexModeProp_ConditionalOptions,
	ScaleTypeProp = t.ScaleTypeProp,
	ScaleTypeProp_ConditionalOption = t.ScaleTypeProp_ConditionalOption,
	ScaleTypeProp_ConditionalOptions = t.ScaleTypeProp_ConditionalOptions,
	ResamplerModeProp = t.ResamplerModeProp,
	ResamplerModeProp_ConditionalOption = t.ResamplerModeProp_ConditionalOption,
	ResamplerModeProp_ConditionalOptions = t.ResamplerModeProp_ConditionalOptions,
	SizeConstraintProp = t.SizeConstraintProp,
	SizeConstraintProp_ConditionalOption = t.SizeConstraintProp_ConditionalOption,
	SizeConstraintProp_ConditionalOptions = t.SizeConstraintProp_ConditionalOptions,
	HorizontalAlignmentProp = t.HorizontalAlignmentProp,
	HorizontalAlignmentProp_ConditionalOption = t.HorizontalAlignmentProp_ConditionalOption,
	HorizontalAlignmentProp_ConditionalOptions = t.HorizontalAlignmentProp_ConditionalOptions,
	SelectionBehaviorProp = t.SelectionBehaviorProp,
	SelectionBehaviorProp_ConditionalOption = t.SelectionBehaviorProp_ConditionalOption,
	SelectionBehaviorProp_ConditionalOptions = t.SelectionBehaviorProp_ConditionalOptions,
	KeyCodeProp = t.KeyCodeProp,
	KeyCodeProp_ConditionalOption = t.KeyCodeProp_ConditionalOption,
	KeyCodeProp_ConditionalOptions = t.KeyCodeProp_ConditionalOptions,
	VerticalAlignmentProp = t.VerticalAlignmentProp,
	VerticalAlignmentProp_ConditionalOption = t.VerticalAlignmentProp_ConditionalOption,
	VerticalAlignmentProp_ConditionalOptions = t.VerticalAlignmentProp_ConditionalOptions,
	AutomaticSize = t.AutomaticSize,
	TextTruncate = t.TextTruncate,
	TextXAlignment = t.TextXAlignment,
	TextYAlignment = t.TextYAlignment,
	UIFlexMode = t.UIFlexMode,
	ScaleType = t.ScaleType,
	ResamplerMode = t.ResamplerMode,
	SizeConstraint = t.SizeConstraint,
	HorizontalAlignment = t.HorizontalAlignment,
	VerticalAlignment = t.VerticalAlignment,
	SelectionBehavior = t.SelectionBehavior,
	KeyCode = t.KeyCode
}