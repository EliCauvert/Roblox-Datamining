local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
			var2, var43 = protoModule.writeVarInt(var2, var3, t.AutomaticSize.toNumber(self.kind.value))
			buff = var2
			var1 = var3
		elseif self.kind.type == "binding_path" then
			local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var4, var45 = protoModule.writeString(var4, var5, self.kind.value)
			buff = var4
			var1 = var5
		elseif self.kind.type == "conditional" then
			local var6 = self.kind.value:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var48 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
			buff = var7
			var1 = var8
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.kind = {
					type = "literal",
					value = t.AutomaticSize.fromNumber(var10) or var10
				}
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.kind = { type = "binding_path", value = buffer.tostring(var13) }
			elseif var7 == 3 then
				local _ = nil
				local var15, var16 = protoModule.readBuffer(p1, var2)
				var2 = var16
				var1.kind = {
					type = "conditional",
					value = t.AutomaticSizeProp_ConditionalOptions.decode(var15)
				}
			else
				local _ = nil
				local var17, var18 = protoModule.readVarInt(p1, var2)
				var2 = var18 + var17
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var19, var20 = protoModule.readFixed32(p1, var2)
			local _ = var19
			var2 = var20
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var21, var22 = protoModule.readFixed64(p1, var2)
			local _ = var21
			var2 = var22
		else
			error("Unsupported wire type: " .. var52)
		end
	end
	return var1
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
	local var23 = t_1.new()
	
	if self.literal ~= nil then
		var23.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.AutomaticSize.fromNumber(self.literal) or self.literal else t.AutomaticSize.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var23.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var23.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var23.kind = {
			type = "conditional",
			value = t.AutomaticSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var23
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
	local var23 = 0
	
	if self.condition ~= nil then
		local var24 = self.condition:encode()
		local var25, var26 = protoModule.writeTag(buff, var23, 1, protoModule.wireTypes.lengthDelimited)
		var25, var78 = protoModule.writeBuffer(var25, var26, var24, buffer.len(var24))
		buff = var25
		var23 = var26
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var27, var28 = protoModule.writeTag(buff, var23, 2, protoModule.wireTypes.varint)
			var27, var80 = protoModule.writeVarInt(var27, var28, t.AutomaticSize.toNumber(self.kind.value))
			buff = var27
			var23 = var28
		elseif self.kind.type == "binding_path" then
			local var29, var30 = protoModule.writeTag(buff, var23, 3, protoModule.wireTypes.lengthDelimited)
			var29, var82 = protoModule.writeString(var29, var30, self.kind.value)
			buff = var29
			var23 = var30
		end
	end
	local buff_1 = buffer.create(var23)
	buffer.copy(buff_1, 0, buff, 0, var23)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var23 = t_2.new()
	local var24 = 0
	while var24 < buffer.len(p2) do
		local _ = nil
		local var25 = nil
		local var26, var27, var28 = protoModule.readTag(p2, var24)
		local var29 = var26
		var25 = var27
		var24 = var28
		
		if var25 == protoModule.wireTypes.varint then
			if var29 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readVarIntI32(p2, var24)
				local var32 = var30
				var24 = var31
				var23.kind = {
					type = "literal",
					value = t.AutomaticSize.fromNumber(var32) or var32
				}
			else
				local _ = nil
				local var33, var34 = protoModule.readVarInt(p2, var24)
				local _ = var33
				var24 = var34
			end
		end
		if var25 == protoModule.wireTypes.lengthDelimited then
			if var29 == 1 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p2, var24)
				var24 = var36
				var23.condition = propConditionModule.PropCondition.decode(var35)
			elseif var29 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p2, var24)
				var24 = var38
				var23.kind = { type = "binding_path", value = buffer.tostring(var37) }
			else
				local _ = nil
				local var39, var40 = protoModule.readVarInt(p2, var24)
				var24 = var40 + var39
			end
		elseif var25 == protoModule.wireTypes.i32 then
			local _ = nil
			local var41, var42 = protoModule.readFixed32(p2, var24)
			local _ = var41
			var24 = var42
		elseif var25 == protoModule.wireTypes.i64 then
			local _ = nil
			local var43, var44 = protoModule.readFixed64(p2, var24)
			local _ = var43
			var24 = var44
		else
			error("Unsupported wire type: " .. var86)
		end
	end
	return var23
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
	local var45 = t_2.new()
	
	if self.condition ~= nil then
		var45.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var45.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.AutomaticSize.fromNumber(self.literal) or self.literal else t.AutomaticSize.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var45.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var45.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var45
end

t_2.descriptor = {
	name = "AutomaticSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.AutomaticSizeProp_ConditionalOption = t_2
typeRegistryModule.default:register(t.AutomaticSizeProp_ConditionalOption)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		options = if p3 == nil or p3.options == nil then {} else p3.options
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var45 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var46 = v:encode()
			local var47, var48 = protoModule.writeTag(buff, var45, 1, protoModule.wireTypes.lengthDelimited)
			var47, var112 = protoModule.writeBuffer(var47, var48, var46, buffer.len(var46))
			buff = var47
			var45 = var48
		end
	end
	local buff_1 = buffer.create(var45)
	buffer.copy(buff_1, 0, buff, 0, var45)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var49 = t_3.new()
	local var50 = 0
	while var50 < buffer.len(p3) do
		local _ = nil
		local var51 = nil
		local var52, var53, var54 = protoModule.readTag(p3, var50)
		local var55 = var52
		var51 = var53
		var50 = var54
		
		if var51 == protoModule.wireTypes.varint then
			local _ = nil
			local var56, var57 = protoModule.readVarInt(p3, var50)
			local _ = var56
			var50 = var57
			continue
		end
		if var51 == protoModule.wireTypes.lengthDelimited then
			if var55 == 1 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p3, var50)
				var50 = var59
				table.insert(var49.options, t.AutomaticSizeProp_ConditionalOption.decode(var58))
			else
				local _ = nil
				local var60, var61 = protoModule.readVarInt(p3, var50)
				var50 = var61 + var60
			end
		elseif var51 == protoModule.wireTypes.i32 then
			local _ = nil
			local var62, var63 = protoModule.readFixed32(p3, var50)
			local _ = var62
			var50 = var63
		elseif var51 == protoModule.wireTypes.i64 then
			local _ = nil
			local var64, var65 = protoModule.readFixed64(p3, var50)
			local _ = var64
			var50 = var65
		else
			error("Unsupported wire type: " .. var116)
		end
	end
	return var49
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
	local var66 = t_3.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.AutomaticSizeProp_ConditionalOption.jsonDecode(v))
		end
		var66.options = t_1
	end
	return var66
end

t_3.descriptor = {
	name = "AutomaticSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.AutomaticSizeProp_ConditionalOptions = t_3
typeRegistryModule.default:register(t.AutomaticSizeProp_ConditionalOptions)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var67 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var68, var69 = protoModule.writeTag(buff, var67, 1, protoModule.wireTypes.varint)
			var68, var138 = protoModule.writeVarInt(var68, var69, t.TextTruncate.toNumber(self.kind.value))
			buff = var68
			var67 = var69
		elseif self.kind.type == "binding_path" then
			local var70, var71 = protoModule.writeTag(buff, var67, 2, protoModule.wireTypes.lengthDelimited)
			var70, var140 = protoModule.writeString(var70, var71, self.kind.value)
			buff = var70
			var67 = var71
		elseif self.kind.type == "conditional" then
			local var72 = self.kind.value:encode()
			local var73, var74 = protoModule.writeTag(buff, var67, 3, protoModule.wireTypes.lengthDelimited)
			var73, var143 = protoModule.writeBuffer(var73, var74, var72, buffer.len(var72))
			buff = var73
			var67 = var74
		end
	end
	local buff_1 = buffer.create(var67)
	buffer.copy(buff_1, 0, buff, 0, var67)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var67 = t_4.new()
	local var68 = 0
	while var68 < buffer.len(p4) do
		local _ = nil
		local var69 = nil
		local var70, var71, var72 = protoModule.readTag(p4, var68)
		local var73 = var70
		var69 = var71
		var68 = var72
		
		if var69 == protoModule.wireTypes.varint then
			if var73 == 1 then
				local _ = nil
				local var74, var75 = protoModule.readVarIntI32(p4, var68)
				local var76 = var74
				var68 = var75
				var67.kind = {
					type = "literal",
					value = t.TextTruncate.fromNumber(var76) or var76
				}
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p4, var68)
				local _ = var77
				var68 = var78
			end
		end
		if var69 == protoModule.wireTypes.lengthDelimited then
			if var73 == 2 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p4, var68)
				var68 = var80
				var67.kind = { type = "binding_path", value = buffer.tostring(var79) }
			elseif var73 == 3 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p4, var68)
				var68 = var82
				var67.kind = {
					type = "conditional",
					value = t.TextTruncateProp_ConditionalOptions.decode(var81)
				}
			else
				local _ = nil
				local var83, var84 = protoModule.readVarInt(p4, var68)
				var68 = var84 + var83
			end
		elseif var69 == protoModule.wireTypes.i32 then
			local _ = nil
			local var85, var86 = protoModule.readFixed32(p4, var68)
			local _ = var85
			var68 = var86
		elseif var69 == protoModule.wireTypes.i64 then
			local _ = nil
			local var87, var88 = protoModule.readFixed64(p4, var68)
			local _ = var87
			var68 = var88
		else
			error("Unsupported wire type: " .. var147)
		end
	end
	return var67
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
	local var89 = t_4.new()
	
	if self.literal ~= nil then
		var89.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextTruncate.fromNumber(self.literal) or self.literal else t.TextTruncate.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var89.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var89.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var89.kind = {
			type = "conditional",
			value = t.TextTruncateProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var89
end

t_4.descriptor = {
	name = "TextTruncateProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextTruncateProp"
}
t.TextTruncateProp = t_4
typeRegistryModule.default:register(t.TextTruncateProp)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		condition = if p5 == nil or p5.condition == nil then nil else p5.condition,
		kind = if p5 == nil or p5.kind == nil then nil else p5.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var89 = 0
	
	if self.condition ~= nil then
		local var90 = self.condition:encode()
		local var91, var92 = protoModule.writeTag(buff, var89, 1, protoModule.wireTypes.lengthDelimited)
		var91, var173 = protoModule.writeBuffer(var91, var92, var90, buffer.len(var90))
		buff = var91
		var89 = var92
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var93, var94 = protoModule.writeTag(buff, var89, 2, protoModule.wireTypes.varint)
			var93, var175 = protoModule.writeVarInt(var93, var94, t.TextTruncate.toNumber(self.kind.value))
			buff = var93
			var89 = var94
		elseif self.kind.type == "binding_path" then
			local var95, var96 = protoModule.writeTag(buff, var89, 3, protoModule.wireTypes.lengthDelimited)
			var95, var177 = protoModule.writeString(var95, var96, self.kind.value)
			buff = var95
			var89 = var96
		end
	end
	local buff_1 = buffer.create(var89)
	buffer.copy(buff_1, 0, buff, 0, var89)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var89 = t_5.new()
	local var90 = 0
	while var90 < buffer.len(p5) do
		local _ = nil
		local var91 = nil
		local var92, var93, var94 = protoModule.readTag(p5, var90)
		local var95 = var92
		var91 = var93
		var90 = var94
		
		if var91 == protoModule.wireTypes.varint then
			if var95 == 2 then
				local _ = nil
				local var96, var97 = protoModule.readVarIntI32(p5, var90)
				local var98 = var96
				var90 = var97
				var89.kind = {
					type = "literal",
					value = t.TextTruncate.fromNumber(var98) or var98
				}
			else
				local _ = nil
				local var99, var100 = protoModule.readVarInt(p5, var90)
				local _ = var99
				var90 = var100
			end
		end
		if var91 == protoModule.wireTypes.lengthDelimited then
			if var95 == 1 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p5, var90)
				var90 = var102
				var89.condition = propConditionModule.PropCondition.decode(var101)
			elseif var95 == 3 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p5, var90)
				var90 = var104
				var89.kind = { type = "binding_path", value = buffer.tostring(var103) }
			else
				local _ = nil
				local var105, var106 = protoModule.readVarInt(p5, var90)
				var90 = var106 + var105
			end
		elseif var91 == protoModule.wireTypes.i32 then
			local _ = nil
			local var107, var108 = protoModule.readFixed32(p5, var90)
			local _ = var107
			var90 = var108
		elseif var91 == protoModule.wireTypes.i64 then
			local _ = nil
			local var109, var110 = protoModule.readFixed64(p5, var90)
			local _ = var109
			var90 = var110
		else
			error("Unsupported wire type: " .. var181)
		end
	end
	return var89
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
	local var111 = t_5.new()
	
	if self.condition ~= nil then
		var111.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var111.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextTruncate.fromNumber(self.literal) or self.literal else t.TextTruncate.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var111.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var111.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var111
end

t_5.descriptor = {
	name = "TextTruncateProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextTruncateProp_ConditionalOption = t_5
typeRegistryModule.default:register(t.TextTruncateProp_ConditionalOption)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		options = if p6 == nil or p6.options == nil then {} else p6.options
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var111 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var112 = v:encode()
			local var113, var114 = protoModule.writeTag(buff, var111, 1, protoModule.wireTypes.lengthDelimited)
			var113, var207 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var111 = var114
		end
	end
	local buff_1 = buffer.create(var111)
	buffer.copy(buff_1, 0, buff, 0, var111)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var115 = t_6.new()
	local var116 = 0
	while var116 < buffer.len(p6) do
		local _ = nil
		local var117 = nil
		local var118, var119, var120 = protoModule.readTag(p6, var116)
		local var121 = var118
		var117 = var119
		var116 = var120
		
		if var117 == protoModule.wireTypes.varint then
			local _ = nil
			local var122, var123 = protoModule.readVarInt(p6, var116)
			local _ = var122
			var116 = var123
			continue
		end
		if var117 == protoModule.wireTypes.lengthDelimited then
			if var121 == 1 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p6, var116)
				var116 = var125
				table.insert(var115.options, t.TextTruncateProp_ConditionalOption.decode(var124))
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p6, var116)
				var116 = var127 + var126
			end
		elseif var117 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p6, var116)
			local _ = var128
			var116 = var129
		elseif var117 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p6, var116)
			local _ = var130
			var116 = var131
		else
			error("Unsupported wire type: " .. var211)
		end
	end
	return var115
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
	local var132 = t_6.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextTruncateProp_ConditionalOption.jsonDecode(v))
		end
		var132.options = t_1
	end
	return var132
end

t_6.descriptor = {
	name = "TextTruncateProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextTruncateProp_ConditionalOptions = t_6
typeRegistryModule.default:register(t.TextTruncateProp_ConditionalOptions)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p7 == nil or p7.kind == nil then nil else p7.kind
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.varint)
			var134, var233 = protoModule.writeVarInt(var134, var135, t.TextXAlignment.toNumber(self.kind.value))
			buff = var134
			var133 = var135
		elseif self.kind.type == "binding_path" then
			local var136, var137 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
			var136, var235 = protoModule.writeString(var136, var137, self.kind.value)
			buff = var136
			var133 = var137
		elseif self.kind.type == "conditional" then
			local var138 = self.kind.value:encode()
			local var139, var140 = protoModule.writeTag(buff, var133, 3, protoModule.wireTypes.lengthDelimited)
			var139, var238 = protoModule.writeBuffer(var139, var140, var138, buffer.len(var138))
			buff = var139
			var133 = var140
		end
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var133 = t_7.new()
	local var134 = 0
	while var134 < buffer.len(p7) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p7, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			if var139 == 1 then
				local _ = nil
				local var140, var141 = protoModule.readVarIntI32(p7, var134)
				local var142 = var140
				var134 = var141
				var133.kind = {
					type = "literal",
					value = t.TextXAlignment.fromNumber(var142) or var142
				}
			else
				local _ = nil
				local var143, var144 = protoModule.readVarInt(p7, var134)
				local _ = var143
				var134 = var144
			end
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 2 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p7, var134)
				var134 = var146
				var133.kind = { type = "binding_path", value = buffer.tostring(var145) }
			elseif var139 == 3 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p7, var134)
				var134 = var148
				var133.kind = {
					type = "conditional",
					value = t.TextXAlignmentProp_ConditionalOptions.decode(var147)
				}
			else
				local _ = nil
				local var149, var150 = protoModule.readVarInt(p7, var134)
				var134 = var150 + var149
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var151, var152 = protoModule.readFixed32(p7, var134)
			local _ = var151
			var134 = var152
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var153, var154 = protoModule.readFixed64(p7, var134)
			local _ = var153
			var134 = var154
		else
			error("Unsupported wire type: " .. var242)
		end
	end
	return var133
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
	local var155 = t_7.new()
	
	if self.literal ~= nil then
		var155.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextXAlignment.fromNumber(self.literal) or self.literal else t.TextXAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var155.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var155.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var155.kind = {
			type = "conditional",
			value = t.TextXAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var155
end

t_7.descriptor = {
	name = "TextXAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextXAlignmentProp"
}
t.TextXAlignmentProp = t_7
typeRegistryModule.default:register(t.TextXAlignmentProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p8 == nil or p8.condition == nil then nil else p8.condition,
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var155 = 0
	
	if self.condition ~= nil then
		local var156 = self.condition:encode()
		local var157, var158 = protoModule.writeTag(buff, var155, 1, protoModule.wireTypes.lengthDelimited)
		var157, var268 = protoModule.writeBuffer(var157, var158, var156, buffer.len(var156))
		buff = var157
		var155 = var158
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var159, var160 = protoModule.writeTag(buff, var155, 2, protoModule.wireTypes.varint)
			var159, var270 = protoModule.writeVarInt(var159, var160, t.TextXAlignment.toNumber(self.kind.value))
			buff = var159
			var155 = var160
		elseif self.kind.type == "binding_path" then
			local var161, var162 = protoModule.writeTag(buff, var155, 3, protoModule.wireTypes.lengthDelimited)
			var161, var272 = protoModule.writeString(var161, var162, self.kind.value)
			buff = var161
			var155 = var162
		end
	end
	local buff_1 = buffer.create(var155)
	buffer.copy(buff_1, 0, buff, 0, var155)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var155 = t_8.new()
	local var156 = 0
	while var156 < buffer.len(p8) do
		local _ = nil
		local var157 = nil
		local var158, var159, var160 = protoModule.readTag(p8, var156)
		local var161 = var158
		var157 = var159
		var156 = var160
		
		if var157 == protoModule.wireTypes.varint then
			if var161 == 2 then
				local _ = nil
				local var162, var163 = protoModule.readVarIntI32(p8, var156)
				local var164 = var162
				var156 = var163
				var155.kind = {
					type = "literal",
					value = t.TextXAlignment.fromNumber(var164) or var164
				}
			else
				local _ = nil
				local var165, var166 = protoModule.readVarInt(p8, var156)
				local _ = var165
				var156 = var166
			end
		end
		if var157 == protoModule.wireTypes.lengthDelimited then
			if var161 == 1 then
				local _ = nil
				local var167, var168 = protoModule.readBuffer(p8, var156)
				var156 = var168
				var155.condition = propConditionModule.PropCondition.decode(var167)
			elseif var161 == 3 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p8, var156)
				var156 = var170
				var155.kind = { type = "binding_path", value = buffer.tostring(var169) }
			else
				local _ = nil
				local var171, var172 = protoModule.readVarInt(p8, var156)
				var156 = var172 + var171
			end
		elseif var157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var173, var174 = protoModule.readFixed32(p8, var156)
			local _ = var173
			var156 = var174
		elseif var157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var175, var176 = protoModule.readFixed64(p8, var156)
			local _ = var175
			var156 = var176
		else
			error("Unsupported wire type: " .. var276)
		end
	end
	return var155
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
	local var177 = t_8.new()
	
	if self.condition ~= nil then
		var177.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var177.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextXAlignment.fromNumber(self.literal) or self.literal else t.TextXAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var177.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var177.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var177
end

t_8.descriptor = {
	name = "TextXAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextXAlignmentProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.TextXAlignmentProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p9 == nil or p9.options == nil then {} else p9.options
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var177 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var178 = v:encode()
			local var179, var180 = protoModule.writeTag(buff, var177, 1, protoModule.wireTypes.lengthDelimited)
			var179, var302 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var177 = var180
		end
	end
	local buff_1 = buffer.create(var177)
	buffer.copy(buff_1, 0, buff, 0, var177)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var181 = t_9.new()
	local var182 = 0
	while var182 < buffer.len(p9) do
		local _ = nil
		local var183 = nil
		local var184, var185, var186 = protoModule.readTag(p9, var182)
		local var187 = var184
		var183 = var185
		var182 = var186
		
		if var183 == protoModule.wireTypes.varint then
			local _ = nil
			local var188, var189 = protoModule.readVarInt(p9, var182)
			local _ = var188
			var182 = var189
			continue
		end
		if var183 == protoModule.wireTypes.lengthDelimited then
			if var187 == 1 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p9, var182)
				var182 = var191
				table.insert(var181.options, t.TextXAlignmentProp_ConditionalOption.decode(var190))
			else
				local _ = nil
				local var192, var193 = protoModule.readVarInt(p9, var182)
				var182 = var193 + var192
			end
		elseif var183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var194, var195 = protoModule.readFixed32(p9, var182)
			local _ = var194
			var182 = var195
		elseif var183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var196, var197 = protoModule.readFixed64(p9, var182)
			local _ = var196
			var182 = var197
		else
			error("Unsupported wire type: " .. var306)
		end
	end
	return var181
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
	local var198 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextXAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var198.options = t_1
	end
	return var198
end

t_9.descriptor = {
	name = "TextXAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextXAlignmentProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.TextXAlignmentProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var199 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var200, var201 = protoModule.writeTag(buff, var199, 1, protoModule.wireTypes.varint)
			var200, var328 = protoModule.writeVarInt(var200, var201, t.TextYAlignment.toNumber(self.kind.value))
			buff = var200
			var199 = var201
		elseif self.kind.type == "binding_path" then
			local var202, var203 = protoModule.writeTag(buff, var199, 2, protoModule.wireTypes.lengthDelimited)
			var202, var330 = protoModule.writeString(var202, var203, self.kind.value)
			buff = var202
			var199 = var203
		elseif self.kind.type == "conditional" then
			local var204 = self.kind.value:encode()
			local var205, var206 = protoModule.writeTag(buff, var199, 3, protoModule.wireTypes.lengthDelimited)
			var205, var333 = protoModule.writeBuffer(var205, var206, var204, buffer.len(var204))
			buff = var205
			var199 = var206
		end
	end
	local buff_1 = buffer.create(var199)
	buffer.copy(buff_1, 0, buff, 0, var199)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var199 = t_10.new()
	local var200 = 0
	while var200 < buffer.len(p10) do
		local _ = nil
		local var201 = nil
		local var202, var203, var204 = protoModule.readTag(p10, var200)
		local var205 = var202
		var201 = var203
		var200 = var204
		
		if var201 == protoModule.wireTypes.varint then
			if var205 == 1 then
				local _ = nil
				local var206, var207 = protoModule.readVarIntI32(p10, var200)
				local var208 = var206
				var200 = var207
				var199.kind = {
					type = "literal",
					value = t.TextYAlignment.fromNumber(var208) or var208
				}
			else
				local _ = nil
				local var209, var210 = protoModule.readVarInt(p10, var200)
				local _ = var209
				var200 = var210
			end
		end
		if var201 == protoModule.wireTypes.lengthDelimited then
			if var205 == 2 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p10, var200)
				var200 = var212
				var199.kind = { type = "binding_path", value = buffer.tostring(var211) }
			elseif var205 == 3 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p10, var200)
				var200 = var214
				var199.kind = {
					type = "conditional",
					value = t.TextYAlignmentProp_ConditionalOptions.decode(var213)
				}
			else
				local _ = nil
				local var215, var216 = protoModule.readVarInt(p10, var200)
				var200 = var216 + var215
			end
		elseif var201 == protoModule.wireTypes.i32 then
			local _ = nil
			local var217, var218 = protoModule.readFixed32(p10, var200)
			local _ = var217
			var200 = var218
		elseif var201 == protoModule.wireTypes.i64 then
			local _ = nil
			local var219, var220 = protoModule.readFixed64(p10, var200)
			local _ = var219
			var200 = var220
		else
			error("Unsupported wire type: " .. var337)
		end
	end
	return var199
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
	local var221 = t_10.new()
	
	if self.literal ~= nil then
		var221.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextYAlignment.fromNumber(self.literal) or self.literal else t.TextYAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var221.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var221.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var221.kind = {
			type = "conditional",
			value = t.TextYAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var221
end

t_10.descriptor = {
	name = "TextYAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextYAlignmentProp"
}
t.TextYAlignmentProp = t_10
typeRegistryModule.default:register(t.TextYAlignmentProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p11 == nil or p11.condition == nil then nil else p11.condition,
		kind = if p11 == nil or p11.kind == nil then nil else p11.kind
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var221 = 0
	
	if self.condition ~= nil then
		local var222 = self.condition:encode()
		local var223, var224 = protoModule.writeTag(buff, var221, 1, protoModule.wireTypes.lengthDelimited)
		var223, var363 = protoModule.writeBuffer(var223, var224, var222, buffer.len(var222))
		buff = var223
		var221 = var224
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var225, var226 = protoModule.writeTag(buff, var221, 2, protoModule.wireTypes.varint)
			var225, var365 = protoModule.writeVarInt(var225, var226, t.TextYAlignment.toNumber(self.kind.value))
			buff = var225
			var221 = var226
		elseif self.kind.type == "binding_path" then
			local var227, var228 = protoModule.writeTag(buff, var221, 3, protoModule.wireTypes.lengthDelimited)
			var227, var367 = protoModule.writeString(var227, var228, self.kind.value)
			buff = var227
			var221 = var228
		end
	end
	local buff_1 = buffer.create(var221)
	buffer.copy(buff_1, 0, buff, 0, var221)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var221 = t_11.new()
	local var222 = 0
	while var222 < buffer.len(p11) do
		local _ = nil
		local var223 = nil
		local var224, var225, var226 = protoModule.readTag(p11, var222)
		local var227 = var224
		var223 = var225
		var222 = var226
		
		if var223 == protoModule.wireTypes.varint then
			if var227 == 2 then
				local _ = nil
				local var228, var229 = protoModule.readVarIntI32(p11, var222)
				local var230 = var228
				var222 = var229
				var221.kind = {
					type = "literal",
					value = t.TextYAlignment.fromNumber(var230) or var230
				}
			else
				local _ = nil
				local var231, var232 = protoModule.readVarInt(p11, var222)
				local _ = var231
				var222 = var232
			end
		end
		if var223 == protoModule.wireTypes.lengthDelimited then
			if var227 == 1 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p11, var222)
				var222 = var234
				var221.condition = propConditionModule.PropCondition.decode(var233)
			elseif var227 == 3 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p11, var222)
				var222 = var236
				var221.kind = { type = "binding_path", value = buffer.tostring(var235) }
			else
				local _ = nil
				local var237, var238 = protoModule.readVarInt(p11, var222)
				var222 = var238 + var237
			end
		elseif var223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var239, var240 = protoModule.readFixed32(p11, var222)
			local _ = var239
			var222 = var240
		elseif var223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var241, var242 = protoModule.readFixed64(p11, var222)
			local _ = var241
			var222 = var242
		else
			error("Unsupported wire type: " .. var371)
		end
	end
	return var221
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
	local var243 = t_11.new()
	
	if self.condition ~= nil then
		var243.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var243.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.TextYAlignment.fromNumber(self.literal) or self.literal else t.TextYAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var243.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var243.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var243
end

t_11.descriptor = {
	name = "TextYAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TextYAlignmentProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.TextYAlignmentProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p12 == nil or p12.options == nil then {} else p12.options
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var243 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var244 = v:encode()
			local var245, var246 = protoModule.writeTag(buff, var243, 1, protoModule.wireTypes.lengthDelimited)
			var245, var397 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var243 = var246
		end
	end
	local buff_1 = buffer.create(var243)
	buffer.copy(buff_1, 0, buff, 0, var243)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
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
				table.insert(var247.options, t.TextYAlignmentProp_ConditionalOption.decode(var256))
			else
				local _ = nil
				local var258, var259 = protoModule.readVarInt(p12, var248)
				var248 = var259 + var258
			end
		elseif var249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var260, var261 = protoModule.readFixed32(p12, var248)
			local _ = var260
			var248 = var261
		elseif var249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var262, var263 = protoModule.readFixed64(p12, var248)
			local _ = var262
			var248 = var263
		else
			error("Unsupported wire type: " .. var401)
		end
	end
	return var247
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
	local var264 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TextYAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var264.options = t_1
	end
	return var264
end

t_12.descriptor = {
	name = "TextYAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TextYAlignmentProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.TextYAlignmentProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p13 == nil or p13.kind == nil then nil else p13.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var265 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var266, var267 = protoModule.writeTag(buff, var265, 1, protoModule.wireTypes.varint)
			var266, var423 = protoModule.writeVarInt(var266, var267, t.UIFlexMode.toNumber(self.kind.value))
			buff = var266
			var265 = var267
		elseif self.kind.type == "binding_path" then
			local var268, var269 = protoModule.writeTag(buff, var265, 2, protoModule.wireTypes.lengthDelimited)
			var268, var425 = protoModule.writeString(var268, var269, self.kind.value)
			buff = var268
			var265 = var269
		elseif self.kind.type == "conditional" then
			local var270 = self.kind.value:encode()
			local var271, var272 = protoModule.writeTag(buff, var265, 3, protoModule.wireTypes.lengthDelimited)
			var271, var428 = protoModule.writeBuffer(var271, var272, var270, buffer.len(var270))
			buff = var271
			var265 = var272
		end
	end
	local buff_1 = buffer.create(var265)
	buffer.copy(buff_1, 0, buff, 0, var265)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var265 = t_13.new()
	local var266 = 0
	while var266 < buffer.len(p13) do
		local _ = nil
		local var267 = nil
		local var268, var269, var270 = protoModule.readTag(p13, var266)
		local var271 = var268
		var267 = var269
		var266 = var270
		
		if var267 == protoModule.wireTypes.varint then
			if var271 == 1 then
				local _ = nil
				local var272, var273 = protoModule.readVarIntI32(p13, var266)
				local var274 = var272
				var266 = var273
				var265.kind = {
					type = "literal",
					value = t.UIFlexMode.fromNumber(var274) or var274
				}
			else
				local _ = nil
				local var275, var276 = protoModule.readVarInt(p13, var266)
				local _ = var275
				var266 = var276
			end
		end
		if var267 == protoModule.wireTypes.lengthDelimited then
			if var271 == 2 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p13, var266)
				var266 = var278
				var265.kind = { type = "binding_path", value = buffer.tostring(var277) }
			elseif var271 == 3 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p13, var266)
				var266 = var280
				var265.kind = {
					type = "conditional",
					value = t.UIFlexModeProp_ConditionalOptions.decode(var279)
				}
			else
				local _ = nil
				local var281, var282 = protoModule.readVarInt(p13, var266)
				var266 = var282 + var281
			end
		elseif var267 == protoModule.wireTypes.i32 then
			local _ = nil
			local var283, var284 = protoModule.readFixed32(p13, var266)
			local _ = var283
			var266 = var284
		elseif var267 == protoModule.wireTypes.i64 then
			local _ = nil
			local var285, var286 = protoModule.readFixed64(p13, var266)
			local _ = var285
			var266 = var286
		else
			error("Unsupported wire type: " .. var432)
		end
	end
	return var265
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
	local var287 = t_13.new()
	
	if self.literal ~= nil then
		var287.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.UIFlexMode.fromNumber(self.literal) or self.literal else t.UIFlexMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var287.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var287.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var287.kind = {
			type = "conditional",
			value = t.UIFlexModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var287
end

t_13.descriptor = {
	name = "UIFlexModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UIFlexModeProp"
}
t.UIFlexModeProp = t_13
typeRegistryModule.default:register(t.UIFlexModeProp)
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
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var287 = 0
	
	if self.condition ~= nil then
		local var288 = self.condition:encode()
		local var289, var290 = protoModule.writeTag(buff, var287, 1, protoModule.wireTypes.lengthDelimited)
		var289, var458 = protoModule.writeBuffer(var289, var290, var288, buffer.len(var288))
		buff = var289
		var287 = var290
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var291, var292 = protoModule.writeTag(buff, var287, 2, protoModule.wireTypes.varint)
			var291, var460 = protoModule.writeVarInt(var291, var292, t.UIFlexMode.toNumber(self.kind.value))
			buff = var291
			var287 = var292
		elseif self.kind.type == "binding_path" then
			local var293, var294 = protoModule.writeTag(buff, var287, 3, protoModule.wireTypes.lengthDelimited)
			var293, var462 = protoModule.writeString(var293, var294, self.kind.value)
			buff = var293
			var287 = var294
		end
	end
	local buff_1 = buffer.create(var287)
	buffer.copy(buff_1, 0, buff, 0, var287)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var287 = t_14.new()
	local var288 = 0
	while var288 < buffer.len(p14) do
		local _ = nil
		local var289 = nil
		local var290, var291, var292 = protoModule.readTag(p14, var288)
		local var293 = var290
		var289 = var291
		var288 = var292
		
		if var289 == protoModule.wireTypes.varint then
			if var293 == 2 then
				local _ = nil
				local var294, var295 = protoModule.readVarIntI32(p14, var288)
				local var296 = var294
				var288 = var295
				var287.kind = {
					type = "literal",
					value = t.UIFlexMode.fromNumber(var296) or var296
				}
			else
				local _ = nil
				local var297, var298 = protoModule.readVarInt(p14, var288)
				local _ = var297
				var288 = var298
			end
		end
		if var289 == protoModule.wireTypes.lengthDelimited then
			if var293 == 1 then
				local _ = nil
				local var299, var300 = protoModule.readBuffer(p14, var288)
				var288 = var300
				var287.condition = propConditionModule.PropCondition.decode(var299)
			elseif var293 == 3 then
				local _ = nil
				local var301, var302 = protoModule.readBuffer(p14, var288)
				var288 = var302
				var287.kind = { type = "binding_path", value = buffer.tostring(var301) }
			else
				local _ = nil
				local var303, var304 = protoModule.readVarInt(p14, var288)
				var288 = var304 + var303
			end
		elseif var289 == protoModule.wireTypes.i32 then
			local _ = nil
			local var305, var306 = protoModule.readFixed32(p14, var288)
			local _ = var305
			var288 = var306
		elseif var289 == protoModule.wireTypes.i64 then
			local _ = nil
			local var307, var308 = protoModule.readFixed64(p14, var288)
			local _ = var307
			var288 = var308
		else
			error("Unsupported wire type: " .. var466)
		end
	end
	return var287
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
	local var309 = t_14.new()
	
	if self.condition ~= nil then
		var309.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var309.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.UIFlexMode.fromNumber(self.literal) or self.literal else t.UIFlexMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var309.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var309.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var309
end

t_14.descriptor = {
	name = "UIFlexModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UIFlexModeProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.UIFlexModeProp_ConditionalOption)
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
	local var309 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var310 = v:encode()
			local var311, var312 = protoModule.writeTag(buff, var309, 1, protoModule.wireTypes.lengthDelimited)
			var311, var492 = protoModule.writeBuffer(var311, var312, var310, buffer.len(var310))
			buff = var311
			var309 = var312
		end
	end
	local buff_1 = buffer.create(var309)
	buffer.copy(buff_1, 0, buff, 0, var309)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var313 = t_15.new()
	local var314 = 0
	while var314 < buffer.len(p15) do
		local _ = nil
		local var315 = nil
		local var316, var317, var318 = protoModule.readTag(p15, var314)
		local var319 = var316
		var315 = var317
		var314 = var318
		
		if var315 == protoModule.wireTypes.varint then
			local _ = nil
			local var320, var321 = protoModule.readVarInt(p15, var314)
			local _ = var320
			var314 = var321
			continue
		end
		if var315 == protoModule.wireTypes.lengthDelimited then
			if var319 == 1 then
				local _ = nil
				local var322, var323 = protoModule.readBuffer(p15, var314)
				var314 = var323
				table.insert(var313.options, t.UIFlexModeProp_ConditionalOption.decode(var322))
			else
				local _ = nil
				local var324, var325 = protoModule.readVarInt(p15, var314)
				var314 = var325 + var324
			end
		elseif var315 == protoModule.wireTypes.i32 then
			local _ = nil
			local var326, var327 = protoModule.readFixed32(p15, var314)
			local _ = var326
			var314 = var327
		elseif var315 == protoModule.wireTypes.i64 then
			local _ = nil
			local var328, var329 = protoModule.readFixed64(p15, var314)
			local _ = var328
			var314 = var329
		else
			error("Unsupported wire type: " .. var496)
		end
	end
	return var313
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
	local var330 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UIFlexModeProp_ConditionalOption.jsonDecode(v))
		end
		var330.options = t_1
	end
	return var330
end

t_15.descriptor = {
	name = "UIFlexModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UIFlexModeProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.UIFlexModeProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p16 == nil or p16.kind == nil then nil else p16.kind
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var331 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var332, var333 = protoModule.writeTag(buff, var331, 1, protoModule.wireTypes.varint)
			var332, var518 = protoModule.writeVarInt(var332, var333, t.ScaleType.toNumber(self.kind.value))
			buff = var332
			var331 = var333
		elseif self.kind.type == "binding_path" then
			local var334, var335 = protoModule.writeTag(buff, var331, 2, protoModule.wireTypes.lengthDelimited)
			var334, var520 = protoModule.writeString(var334, var335, self.kind.value)
			buff = var334
			var331 = var335
		elseif self.kind.type == "conditional" then
			local var336 = self.kind.value:encode()
			local var337, var338 = protoModule.writeTag(buff, var331, 3, protoModule.wireTypes.lengthDelimited)
			var337, var523 = protoModule.writeBuffer(var337, var338, var336, buffer.len(var336))
			buff = var337
			var331 = var338
		end
	end
	local buff_1 = buffer.create(var331)
	buffer.copy(buff_1, 0, buff, 0, var331)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var331 = t_16.new()
	local var332 = 0
	while var332 < buffer.len(p16) do
		local _ = nil
		local var333 = nil
		local var334, var335, var336 = protoModule.readTag(p16, var332)
		local var337 = var334
		var333 = var335
		var332 = var336
		
		if var333 == protoModule.wireTypes.varint then
			if var337 == 1 then
				local _ = nil
				local var338, var339 = protoModule.readVarIntI32(p16, var332)
				local var340 = var338
				var332 = var339
				var331.kind = {
					type = "literal",
					value = t.ScaleType.fromNumber(var340) or var340
				}
			else
				local _ = nil
				local var341, var342 = protoModule.readVarInt(p16, var332)
				local _ = var341
				var332 = var342
			end
		end
		if var333 == protoModule.wireTypes.lengthDelimited then
			if var337 == 2 then
				local _ = nil
				local var343, var344 = protoModule.readBuffer(p16, var332)
				var332 = var344
				var331.kind = { type = "binding_path", value = buffer.tostring(var343) }
			elseif var337 == 3 then
				local _ = nil
				local var345, var346 = protoModule.readBuffer(p16, var332)
				var332 = var346
				var331.kind = {
					type = "conditional",
					value = t.ScaleTypeProp_ConditionalOptions.decode(var345)
				}
			else
				local _ = nil
				local var347, var348 = protoModule.readVarInt(p16, var332)
				var332 = var348 + var347
			end
		elseif var333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var349, var350 = protoModule.readFixed32(p16, var332)
			local _ = var349
			var332 = var350
		elseif var333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var351, var352 = protoModule.readFixed64(p16, var332)
			local _ = var351
			var332 = var352
		else
			error("Unsupported wire type: " .. var527)
		end
	end
	return var331
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
	local var353 = t_16.new()
	
	if self.literal ~= nil then
		var353.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleType.fromNumber(self.literal) or self.literal else t.ScaleType.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var353.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var353.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var353.kind = {
			type = "conditional",
			value = t.ScaleTypeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var353
end

t_16.descriptor = {
	name = "ScaleTypeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleTypeProp"
}
t.ScaleTypeProp = t_16
typeRegistryModule.default:register(t.ScaleTypeProp)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p17 == nil or p17.condition == nil then nil else p17.condition,
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var353 = 0
	
	if self.condition ~= nil then
		local var354 = self.condition:encode()
		local var355, var356 = protoModule.writeTag(buff, var353, 1, protoModule.wireTypes.lengthDelimited)
		var355, var553 = protoModule.writeBuffer(var355, var356, var354, buffer.len(var354))
		buff = var355
		var353 = var356
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var357, var358 = protoModule.writeTag(buff, var353, 2, protoModule.wireTypes.varint)
			var357, var555 = protoModule.writeVarInt(var357, var358, t.ScaleType.toNumber(self.kind.value))
			buff = var357
			var353 = var358
		elseif self.kind.type == "binding_path" then
			local var359, var360 = protoModule.writeTag(buff, var353, 3, protoModule.wireTypes.lengthDelimited)
			var359, var557 = protoModule.writeString(var359, var360, self.kind.value)
			buff = var359
			var353 = var360
		end
	end
	local buff_1 = buffer.create(var353)
	buffer.copy(buff_1, 0, buff, 0, var353)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var353 = t_17.new()
	local var354 = 0
	while var354 < buffer.len(p17) do
		local _ = nil
		local var355 = nil
		local var356, var357, var358 = protoModule.readTag(p17, var354)
		local var359 = var356
		var355 = var357
		var354 = var358
		
		if var355 == protoModule.wireTypes.varint then
			if var359 == 2 then
				local _ = nil
				local var360, var361 = protoModule.readVarIntI32(p17, var354)
				local var362 = var360
				var354 = var361
				var353.kind = {
					type = "literal",
					value = t.ScaleType.fromNumber(var362) or var362
				}
			else
				local _ = nil
				local var363, var364 = protoModule.readVarInt(p17, var354)
				local _ = var363
				var354 = var364
			end
		end
		if var355 == protoModule.wireTypes.lengthDelimited then
			if var359 == 1 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p17, var354)
				var354 = var366
				var353.condition = propConditionModule.PropCondition.decode(var365)
			elseif var359 == 3 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p17, var354)
				var354 = var368
				var353.kind = { type = "binding_path", value = buffer.tostring(var367) }
			else
				local _ = nil
				local var369, var370 = protoModule.readVarInt(p17, var354)
				var354 = var370 + var369
			end
		elseif var355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var371, var372 = protoModule.readFixed32(p17, var354)
			local _ = var371
			var354 = var372
		elseif var355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var373, var374 = protoModule.readFixed64(p17, var354)
			local _ = var373
			var354 = var374
		else
			error("Unsupported wire type: " .. var561)
		end
	end
	return var353
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
	local var375 = t_17.new()
	
	if self.condition ~= nil then
		var375.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var375.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleType.fromNumber(self.literal) or self.literal else t.ScaleType.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var375.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var375.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var375
end

t_17.descriptor = {
	name = "ScaleTypeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ScaleTypeProp_ConditionalOption = t_17
typeRegistryModule.default:register(t.ScaleTypeProp_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p18 == nil or p18.options == nil then {} else p18.options
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var375 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var376 = v:encode()
			local var377, var378 = protoModule.writeTag(buff, var375, 1, protoModule.wireTypes.lengthDelimited)
			var377, var587 = protoModule.writeBuffer(var377, var378, var376, buffer.len(var376))
			buff = var377
			var375 = var378
		end
	end
	local buff_1 = buffer.create(var375)
	buffer.copy(buff_1, 0, buff, 0, var375)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var379 = t_18.new()
	local var380 = 0
	while var380 < buffer.len(p18) do
		local _ = nil
		local var381 = nil
		local var382, var383, var384 = protoModule.readTag(p18, var380)
		local var385 = var382
		var381 = var383
		var380 = var384
		
		if var381 == protoModule.wireTypes.varint then
			local _ = nil
			local var386, var387 = protoModule.readVarInt(p18, var380)
			local _ = var386
			var380 = var387
			continue
		end
		if var381 == protoModule.wireTypes.lengthDelimited then
			if var385 == 1 then
				local _ = nil
				local var388, var389 = protoModule.readBuffer(p18, var380)
				var380 = var389
				table.insert(var379.options, t.ScaleTypeProp_ConditionalOption.decode(var388))
			else
				local _ = nil
				local var390, var391 = protoModule.readVarInt(p18, var380)
				var380 = var391 + var390
			end
		elseif var381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var392, var393 = protoModule.readFixed32(p18, var380)
			local _ = var392
			var380 = var393
		elseif var381 == protoModule.wireTypes.i64 then
			local _ = nil
			local var394, var395 = protoModule.readFixed64(p18, var380)
			local _ = var394
			var380 = var395
		else
			error("Unsupported wire type: " .. var591)
		end
	end
	return var379
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
	local var396 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ScaleTypeProp_ConditionalOption.jsonDecode(v))
		end
		var396.options = t_1
	end
	return var396
end

t_18.descriptor = {
	name = "ScaleTypeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ScaleTypeProp_ConditionalOptions = t_18
typeRegistryModule.default:register(t.ScaleTypeProp_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p19)
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p19 == nil or p19.kind == nil then nil else p19.kind
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var397 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var398, var399 = protoModule.writeTag(buff, var397, 1, protoModule.wireTypes.varint)
			var398, var613 = protoModule.writeVarInt(var398, var399, t.ResamplerMode.toNumber(self.kind.value))
			buff = var398
			var397 = var399
		elseif self.kind.type == "binding_path" then
			local var400, var401 = protoModule.writeTag(buff, var397, 2, protoModule.wireTypes.lengthDelimited)
			var400, var615 = protoModule.writeString(var400, var401, self.kind.value)
			buff = var400
			var397 = var401
		elseif self.kind.type == "conditional" then
			local var402 = self.kind.value:encode()
			local var403, var404 = protoModule.writeTag(buff, var397, 3, protoModule.wireTypes.lengthDelimited)
			var403, var618 = protoModule.writeBuffer(var403, var404, var402, buffer.len(var402))
			buff = var403
			var397 = var404
		end
	end
	local buff_1 = buffer.create(var397)
	buffer.copy(buff_1, 0, buff, 0, var397)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var397 = t_19.new()
	local var398 = 0
	while var398 < buffer.len(p19) do
		local _ = nil
		local var399 = nil
		local var400, var401, var402 = protoModule.readTag(p19, var398)
		local var403 = var400
		var399 = var401
		var398 = var402
		
		if var399 == protoModule.wireTypes.varint then
			if var403 == 1 then
				local _ = nil
				local var404, var405 = protoModule.readVarIntI32(p19, var398)
				local var406 = var404
				var398 = var405
				var397.kind = {
					type = "literal",
					value = t.ResamplerMode.fromNumber(var406) or var406
				}
			else
				local _ = nil
				local var407, var408 = protoModule.readVarInt(p19, var398)
				local _ = var407
				var398 = var408
			end
		end
		if var399 == protoModule.wireTypes.lengthDelimited then
			if var403 == 2 then
				local _ = nil
				local var409, var410 = protoModule.readBuffer(p19, var398)
				var398 = var410
				var397.kind = { type = "binding_path", value = buffer.tostring(var409) }
			elseif var403 == 3 then
				local _ = nil
				local var411, var412 = protoModule.readBuffer(p19, var398)
				var398 = var412
				var397.kind = {
					type = "conditional",
					value = t.ResamplerModeProp_ConditionalOptions.decode(var411)
				}
			else
				local _ = nil
				local var413, var414 = protoModule.readVarInt(p19, var398)
				var398 = var414 + var413
			end
		elseif var399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var415, var416 = protoModule.readFixed32(p19, var398)
			local _ = var415
			var398 = var416
		elseif var399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var417, var418 = protoModule.readFixed64(p19, var398)
			local _ = var417
			var398 = var418
		else
			error("Unsupported wire type: " .. var622)
		end
	end
	return var397
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
	local var419 = t_19.new()
	
	if self.literal ~= nil then
		var419.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ResamplerMode.fromNumber(self.literal) or self.literal else t.ResamplerMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var419.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var419.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var419.kind = {
			type = "conditional",
			value = t.ResamplerModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var419
end

t_19.descriptor = {
	name = "ResamplerModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResamplerModeProp"
}
t.ResamplerModeProp = t_19
typeRegistryModule.default:register(t.ResamplerModeProp)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p20 == nil or p20.condition == nil then nil else p20.condition,
		kind = if p20 == nil or p20.kind == nil then nil else p20.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var419 = 0
	
	if self.condition ~= nil then
		local var420 = self.condition:encode()
		local var421, var422 = protoModule.writeTag(buff, var419, 1, protoModule.wireTypes.lengthDelimited)
		var421, var648 = protoModule.writeBuffer(var421, var422, var420, buffer.len(var420))
		buff = var421
		var419 = var422
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var423, var424 = protoModule.writeTag(buff, var419, 2, protoModule.wireTypes.varint)
			var423, var650 = protoModule.writeVarInt(var423, var424, t.ResamplerMode.toNumber(self.kind.value))
			buff = var423
			var419 = var424
		elseif self.kind.type == "binding_path" then
			local var425, var426 = protoModule.writeTag(buff, var419, 3, protoModule.wireTypes.lengthDelimited)
			var425, var652 = protoModule.writeString(var425, var426, self.kind.value)
			buff = var425
			var419 = var426
		end
	end
	local buff_1 = buffer.create(var419)
	buffer.copy(buff_1, 0, buff, 0, var419)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var419 = t_20.new()
	local var420 = 0
	while var420 < buffer.len(p20) do
		local _ = nil
		local var421 = nil
		local var422, var423, var424 = protoModule.readTag(p20, var420)
		local var425 = var422
		var421 = var423
		var420 = var424
		
		if var421 == protoModule.wireTypes.varint then
			if var425 == 2 then
				local _ = nil
				local var426, var427 = protoModule.readVarIntI32(p20, var420)
				local var428 = var426
				var420 = var427
				var419.kind = {
					type = "literal",
					value = t.ResamplerMode.fromNumber(var428) or var428
				}
			else
				local _ = nil
				local var429, var430 = protoModule.readVarInt(p20, var420)
				local _ = var429
				var420 = var430
			end
		end
		if var421 == protoModule.wireTypes.lengthDelimited then
			if var425 == 1 then
				local _ = nil
				local var431, var432 = protoModule.readBuffer(p20, var420)
				var420 = var432
				var419.condition = propConditionModule.PropCondition.decode(var431)
			elseif var425 == 3 then
				local _ = nil
				local var433, var434 = protoModule.readBuffer(p20, var420)
				var420 = var434
				var419.kind = { type = "binding_path", value = buffer.tostring(var433) }
			else
				local _ = nil
				local var435, var436 = protoModule.readVarInt(p20, var420)
				var420 = var436 + var435
			end
		elseif var421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var437, var438 = protoModule.readFixed32(p20, var420)
			local _ = var437
			var420 = var438
		elseif var421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var439, var440 = protoModule.readFixed64(p20, var420)
			local _ = var439
			var420 = var440
		else
			error("Unsupported wire type: " .. var656)
		end
	end
	return var419
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
	local var441 = t_20.new()
	
	if self.condition ~= nil then
		var441.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var441.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ResamplerMode.fromNumber(self.literal) or self.literal else t.ResamplerMode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var441.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var441.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var441
end

t_20.descriptor = {
	name = "ResamplerModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ResamplerModeProp_ConditionalOption = t_20
typeRegistryModule.default:register(t.ResamplerModeProp_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p21 == nil or p21.options == nil then {} else p21.options
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var441 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var442 = v:encode()
			local var443, var444 = protoModule.writeTag(buff, var441, 1, protoModule.wireTypes.lengthDelimited)
			var443, var682 = protoModule.writeBuffer(var443, var444, var442, buffer.len(var442))
			buff = var443
			var441 = var444
		end
	end
	local buff_1 = buffer.create(var441)
	buffer.copy(buff_1, 0, buff, 0, var441)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var445 = t_21.new()
	local var446 = 0
	while var446 < buffer.len(p21) do
		local _ = nil
		local var447 = nil
		local var448, var449, var450 = protoModule.readTag(p21, var446)
		local var451 = var448
		var447 = var449
		var446 = var450
		
		if var447 == protoModule.wireTypes.varint then
			local _ = nil
			local var452, var453 = protoModule.readVarInt(p21, var446)
			local _ = var452
			var446 = var453
			continue
		end
		if var447 == protoModule.wireTypes.lengthDelimited then
			if var451 == 1 then
				local _ = nil
				local var454, var455 = protoModule.readBuffer(p21, var446)
				var446 = var455
				table.insert(var445.options, t.ResamplerModeProp_ConditionalOption.decode(var454))
			else
				local _ = nil
				local var456, var457 = protoModule.readVarInt(p21, var446)
				var446 = var457 + var456
			end
		elseif var447 == protoModule.wireTypes.i32 then
			local _ = nil
			local var458, var459 = protoModule.readFixed32(p21, var446)
			local _ = var458
			var446 = var459
		elseif var447 == protoModule.wireTypes.i64 then
			local _ = nil
			local var460, var461 = protoModule.readFixed64(p21, var446)
			local _ = var460
			var446 = var461
		else
			error("Unsupported wire type: " .. var686)
		end
	end
	return var445
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
	local var462 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ResamplerModeProp_ConditionalOption.jsonDecode(v))
		end
		var462.options = t_1
	end
	return var462
end

t_21.descriptor = {
	name = "ResamplerModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ResamplerModeProp_ConditionalOptions = t_21
typeRegistryModule.default:register(t.ResamplerModeProp_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p22 == nil or p22.kind == nil then nil else p22.kind
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var463 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var464, var465 = protoModule.writeTag(buff, var463, 1, protoModule.wireTypes.varint)
			var464, var708 = protoModule.writeVarInt(var464, var465, t.SizeConstraint.toNumber(self.kind.value))
			buff = var464
			var463 = var465
		elseif self.kind.type == "binding_path" then
			local var466, var467 = protoModule.writeTag(buff, var463, 2, protoModule.wireTypes.lengthDelimited)
			var466, var710 = protoModule.writeString(var466, var467, self.kind.value)
			buff = var466
			var463 = var467
		elseif self.kind.type == "conditional" then
			local var468 = self.kind.value:encode()
			local var469, var470 = protoModule.writeTag(buff, var463, 3, protoModule.wireTypes.lengthDelimited)
			var469, var713 = protoModule.writeBuffer(var469, var470, var468, buffer.len(var468))
			buff = var469
			var463 = var470
		end
	end
	local buff_1 = buffer.create(var463)
	buffer.copy(buff_1, 0, buff, 0, var463)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var463 = t_22.new()
	local var464 = 0
	while var464 < buffer.len(p22) do
		local _ = nil
		local var465 = nil
		local var466, var467, var468 = protoModule.readTag(p22, var464)
		local var469 = var466
		var465 = var467
		var464 = var468
		
		if var465 == protoModule.wireTypes.varint then
			if var469 == 1 then
				local _ = nil
				local var470, var471 = protoModule.readVarIntI32(p22, var464)
				local var472 = var470
				var464 = var471
				var463.kind = {
					type = "literal",
					value = t.SizeConstraint.fromNumber(var472) or var472
				}
			else
				local _ = nil
				local var473, var474 = protoModule.readVarInt(p22, var464)
				local _ = var473
				var464 = var474
			end
		end
		if var465 == protoModule.wireTypes.lengthDelimited then
			if var469 == 2 then
				local _ = nil
				local var475, var476 = protoModule.readBuffer(p22, var464)
				var464 = var476
				var463.kind = { type = "binding_path", value = buffer.tostring(var475) }
			elseif var469 == 3 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p22, var464)
				var464 = var478
				var463.kind = {
					type = "conditional",
					value = t.SizeConstraintProp_ConditionalOptions.decode(var477)
				}
			else
				local _ = nil
				local var479, var480 = protoModule.readVarInt(p22, var464)
				var464 = var480 + var479
			end
		elseif var465 == protoModule.wireTypes.i32 then
			local _ = nil
			local var481, var482 = protoModule.readFixed32(p22, var464)
			local _ = var481
			var464 = var482
		elseif var465 == protoModule.wireTypes.i64 then
			local _ = nil
			local var483, var484 = protoModule.readFixed64(p22, var464)
			local _ = var483
			var464 = var484
		else
			error("Unsupported wire type: " .. var717)
		end
	end
	return var463
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
	local var485 = t_22.new()
	
	if self.literal ~= nil then
		var485.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SizeConstraint.fromNumber(self.literal) or self.literal else t.SizeConstraint.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var485.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var485.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var485.kind = {
			type = "conditional",
			value = t.SizeConstraintProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var485
end

t_22.descriptor = {
	name = "SizeConstraintProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SizeConstraintProp"
}
t.SizeConstraintProp = t_22
typeRegistryModule.default:register(t.SizeConstraintProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p23)
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p23 == nil or p23.condition == nil then nil else p23.condition,
		kind = if p23 == nil or p23.kind == nil then nil else p23.kind
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var485 = 0
	
	if self.condition ~= nil then
		local var486 = self.condition:encode()
		local var487, var488 = protoModule.writeTag(buff, var485, 1, protoModule.wireTypes.lengthDelimited)
		var487, var743 = protoModule.writeBuffer(var487, var488, var486, buffer.len(var486))
		buff = var487
		var485 = var488
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var489, var490 = protoModule.writeTag(buff, var485, 2, protoModule.wireTypes.varint)
			var489, var745 = protoModule.writeVarInt(var489, var490, t.SizeConstraint.toNumber(self.kind.value))
			buff = var489
			var485 = var490
		elseif self.kind.type == "binding_path" then
			local var491, var492 = protoModule.writeTag(buff, var485, 3, protoModule.wireTypes.lengthDelimited)
			var491, var747 = protoModule.writeString(var491, var492, self.kind.value)
			buff = var491
			var485 = var492
		end
	end
	local buff_1 = buffer.create(var485)
	buffer.copy(buff_1, 0, buff, 0, var485)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var485 = t_23.new()
	local var486 = 0
	while var486 < buffer.len(p23) do
		local _ = nil
		local var487 = nil
		local var488, var489, var490 = protoModule.readTag(p23, var486)
		local var491 = var488
		var487 = var489
		var486 = var490
		
		if var487 == protoModule.wireTypes.varint then
			if var491 == 2 then
				local _ = nil
				local var492, var493 = protoModule.readVarIntI32(p23, var486)
				local var494 = var492
				var486 = var493
				var485.kind = {
					type = "literal",
					value = t.SizeConstraint.fromNumber(var494) or var494
				}
			else
				local _ = nil
				local var495, var496 = protoModule.readVarInt(p23, var486)
				local _ = var495
				var486 = var496
			end
		end
		if var487 == protoModule.wireTypes.lengthDelimited then
			if var491 == 1 then
				local _ = nil
				local var497, var498 = protoModule.readBuffer(p23, var486)
				var486 = var498
				var485.condition = propConditionModule.PropCondition.decode(var497)
			elseif var491 == 3 then
				local _ = nil
				local var499, var500 = protoModule.readBuffer(p23, var486)
				var486 = var500
				var485.kind = { type = "binding_path", value = buffer.tostring(var499) }
			else
				local _ = nil
				local var501, var502 = protoModule.readVarInt(p23, var486)
				var486 = var502 + var501
			end
		elseif var487 == protoModule.wireTypes.i32 then
			local _ = nil
			local var503, var504 = protoModule.readFixed32(p23, var486)
			local _ = var503
			var486 = var504
		elseif var487 == protoModule.wireTypes.i64 then
			local _ = nil
			local var505, var506 = protoModule.readFixed64(p23, var486)
			local _ = var505
			var486 = var506
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var485
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
	local var507 = t_23.new()
	
	if self.condition ~= nil then
		var507.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var507.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SizeConstraint.fromNumber(self.literal) or self.literal else t.SizeConstraint.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var507.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var507.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var507
end

t_23.descriptor = {
	name = "SizeConstraintProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.SizeConstraintProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.SizeConstraintProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p24)
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p24 == nil or p24.options == nil then {} else p24.options
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var507 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var508 = v:encode()
			local var509, var510 = protoModule.writeTag(buff, var507, 1, protoModule.wireTypes.lengthDelimited)
			var509, var777 = protoModule.writeBuffer(var509, var510, var508, buffer.len(var508))
			buff = var509
			var507 = var510
		end
	end
	local buff_1 = buffer.create(var507)
	buffer.copy(buff_1, 0, buff, 0, var507)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var511 = t_24.new()
	local var512 = 0
	while var512 < buffer.len(p24) do
		local _ = nil
		local var513 = nil
		local var514, var515, var516 = protoModule.readTag(p24, var512)
		local var517 = var514
		var513 = var515
		var512 = var516
		
		if var513 == protoModule.wireTypes.varint then
			local _ = nil
			local var518, var519 = protoModule.readVarInt(p24, var512)
			local _ = var518
			var512 = var519
			continue
		end
		if var513 == protoModule.wireTypes.lengthDelimited then
			if var517 == 1 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p24, var512)
				var512 = var521
				table.insert(var511.options, t.SizeConstraintProp_ConditionalOption.decode(var520))
			else
				local _ = nil
				local var522, var523 = protoModule.readVarInt(p24, var512)
				var512 = var523 + var522
			end
		elseif var513 == protoModule.wireTypes.i32 then
			local _ = nil
			local var524, var525 = protoModule.readFixed32(p24, var512)
			local _ = var524
			var512 = var525
		elseif var513 == protoModule.wireTypes.i64 then
			local _ = nil
			local var526, var527 = protoModule.readFixed64(p24, var512)
			local _ = var526
			var512 = var527
		else
			error("Unsupported wire type: " .. var781)
		end
	end
	return var511
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
	local var528 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SizeConstraintProp_ConditionalOption.jsonDecode(v))
		end
		var528.options = t_1
	end
	return var528
end

t_24.descriptor = {
	name = "SizeConstraintProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.SizeConstraintProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.SizeConstraintProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p25)
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p25 == nil or p25.kind == nil then nil else p25.kind
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var529 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var530, var531 = protoModule.writeTag(buff, var529, 1, protoModule.wireTypes.varint)
			var530, var803 = protoModule.writeVarInt(var530, var531, t.HorizontalAlignment.toNumber(self.kind.value))
			buff = var530
			var529 = var531
		elseif self.kind.type == "binding_path" then
			local var532, var533 = protoModule.writeTag(buff, var529, 2, protoModule.wireTypes.lengthDelimited)
			var532, var805 = protoModule.writeString(var532, var533, self.kind.value)
			buff = var532
			var529 = var533
		elseif self.kind.type == "conditional" then
			local var534 = self.kind.value:encode()
			local var535, var536 = protoModule.writeTag(buff, var529, 3, protoModule.wireTypes.lengthDelimited)
			var535, var808 = protoModule.writeBuffer(var535, var536, var534, buffer.len(var534))
			buff = var535
			var529 = var536
		end
	end
	local buff_1 = buffer.create(var529)
	buffer.copy(buff_1, 0, buff, 0, var529)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var529 = t_25.new()
	local var530 = 0
	while var530 < buffer.len(p25) do
		local _ = nil
		local var531 = nil
		local var532, var533, var534 = protoModule.readTag(p25, var530)
		local var535 = var532
		var531 = var533
		var530 = var534
		
		if var531 == protoModule.wireTypes.varint then
			if var535 == 1 then
				local _ = nil
				local var536, var537 = protoModule.readVarIntI32(p25, var530)
				local var538 = var536
				var530 = var537
				var529.kind = {
					type = "literal",
					value = t.HorizontalAlignment.fromNumber(var538) or var538
				}
			else
				local _ = nil
				local var539, var540 = protoModule.readVarInt(p25, var530)
				local _ = var539
				var530 = var540
			end
		end
		if var531 == protoModule.wireTypes.lengthDelimited then
			if var535 == 2 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p25, var530)
				var530 = var542
				var529.kind = { type = "binding_path", value = buffer.tostring(var541) }
			elseif var535 == 3 then
				local _ = nil
				local var543, var544 = protoModule.readBuffer(p25, var530)
				var530 = var544
				var529.kind = {
					type = "conditional",
					value = t.HorizontalAlignmentProp_ConditionalOptions.decode(var543)
				}
			else
				local _ = nil
				local var545, var546 = protoModule.readVarInt(p25, var530)
				var530 = var546 + var545
			end
		elseif var531 == protoModule.wireTypes.i32 then
			local _ = nil
			local var547, var548 = protoModule.readFixed32(p25, var530)
			local _ = var547
			var530 = var548
		elseif var531 == protoModule.wireTypes.i64 then
			local _ = nil
			local var549, var550 = protoModule.readFixed64(p25, var530)
			local _ = var549
			var530 = var550
		else
			error("Unsupported wire type: " .. var812)
		end
	end
	return var529
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
	local var551 = t_25.new()
	
	if self.literal ~= nil then
		var551.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.HorizontalAlignment.fromNumber(self.literal) or self.literal else t.HorizontalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var551.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var551.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var551.kind = {
			type = "conditional",
			value = t.HorizontalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var551
end

t_25.descriptor = {
	name = "HorizontalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.HorizontalAlignmentProp"
}
t.HorizontalAlignmentProp = t_25
typeRegistryModule.default:register(t.HorizontalAlignmentProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p26)
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p26 == nil or p26.condition == nil then nil else p26.condition,
		kind = if p26 == nil or p26.kind == nil then nil else p26.kind
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var551 = 0
	
	if self.condition ~= nil then
		local var552 = self.condition:encode()
		local var553, var554 = protoModule.writeTag(buff, var551, 1, protoModule.wireTypes.lengthDelimited)
		var553, var838 = protoModule.writeBuffer(var553, var554, var552, buffer.len(var552))
		buff = var553
		var551 = var554
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var555, var556 = protoModule.writeTag(buff, var551, 2, protoModule.wireTypes.varint)
			var555, var840 = protoModule.writeVarInt(var555, var556, t.HorizontalAlignment.toNumber(self.kind.value))
			buff = var555
			var551 = var556
		elseif self.kind.type == "binding_path" then
			local var557, var558 = protoModule.writeTag(buff, var551, 3, protoModule.wireTypes.lengthDelimited)
			var557, var842 = protoModule.writeString(var557, var558, self.kind.value)
			buff = var557
			var551 = var558
		end
	end
	local buff_1 = buffer.create(var551)
	buffer.copy(buff_1, 0, buff, 0, var551)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var551 = t_26.new()
	local var552 = 0
	while var552 < buffer.len(p26) do
		local _ = nil
		local var553 = nil
		local var554, var555, var556 = protoModule.readTag(p26, var552)
		local var557 = var554
		var553 = var555
		var552 = var556
		
		if var553 == protoModule.wireTypes.varint then
			if var557 == 2 then
				local _ = nil
				local var558, var559 = protoModule.readVarIntI32(p26, var552)
				local var560 = var558
				var552 = var559
				var551.kind = {
					type = "literal",
					value = t.HorizontalAlignment.fromNumber(var560) or var560
				}
			else
				local _ = nil
				local var561, var562 = protoModule.readVarInt(p26, var552)
				local _ = var561
				var552 = var562
			end
		end
		if var553 == protoModule.wireTypes.lengthDelimited then
			if var557 == 1 then
				local _ = nil
				local var563, var564 = protoModule.readBuffer(p26, var552)
				var552 = var564
				var551.condition = propConditionModule.PropCondition.decode(var563)
			elseif var557 == 3 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p26, var552)
				var552 = var566
				var551.kind = { type = "binding_path", value = buffer.tostring(var565) }
			else
				local _ = nil
				local var567, var568 = protoModule.readVarInt(p26, var552)
				var552 = var568 + var567
			end
		elseif var553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var569, var570 = protoModule.readFixed32(p26, var552)
			local _ = var569
			var552 = var570
		elseif var553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var571, var572 = protoModule.readFixed64(p26, var552)
			local _ = var571
			var552 = var572
		else
			error("Unsupported wire type: " .. var846)
		end
	end
	return var551
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
	local var573 = t_26.new()
	
	if self.condition ~= nil then
		var573.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var573.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.HorizontalAlignment.fromNumber(self.literal) or self.literal else t.HorizontalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var573.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var573.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var573
end

t_26.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.HorizontalAlignmentProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.HorizontalAlignmentProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p27)
	-- upvalues: t_27 (ref)
	return setmetatable({
		option = if p27 == nil or p27.option == nil then {} else p27.option
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var573 = 0
	
	if self.option ~= nil and #self.option > 0 then
		for i, v in self.option do
			local var574 = v:encode()
			local var575, var576 = protoModule.writeTag(buff, var573, 1, protoModule.wireTypes.lengthDelimited)
			var575, var872 = protoModule.writeBuffer(var575, var576, var574, buffer.len(var574))
			buff = var575
			var573 = var576
		end
	end
	local buff_1 = buffer.create(var573)
	buffer.copy(buff_1, 0, buff, 0, var573)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var577 = t_27.new()
	local var578 = 0
	while var578 < buffer.len(p27) do
		local _ = nil
		local var579 = nil
		local var580, var581, var582 = protoModule.readTag(p27, var578)
		local var583 = var580
		var579 = var581
		var578 = var582
		
		if var579 == protoModule.wireTypes.varint then
			local _ = nil
			local var584, var585 = protoModule.readVarInt(p27, var578)
			local _ = var584
			var578 = var585
			continue
		end
		if var579 == protoModule.wireTypes.lengthDelimited then
			if var583 == 1 then
				local _ = nil
				local var586, var587 = protoModule.readBuffer(p27, var578)
				var578 = var587
				table.insert(var577.option, t.HorizontalAlignmentProp_ConditionalOption.decode(var586))
			else
				local _ = nil
				local var588, var589 = protoModule.readVarInt(p27, var578)
				var578 = var589 + var588
			end
		elseif var579 == protoModule.wireTypes.i32 then
			local _ = nil
			local var590, var591 = protoModule.readFixed32(p27, var578)
			local _ = var590
			var578 = var591
		elseif var579 == protoModule.wireTypes.i64 then
			local _ = nil
			local var592, var593 = protoModule.readFixed64(p27, var578)
			local _ = var592
			var578 = var593
		else
			error("Unsupported wire type: " .. var876)
		end
	end
	return var577
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
	local var594 = t_27.new()
	
	if self.option ~= nil then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, t.HorizontalAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var594.option = t_1
	end
	return var594
end

t_27.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.HorizontalAlignmentProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.HorizontalAlignmentProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p28 == nil or p28.kind == nil then nil else p28.kind
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var595 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var596, var597 = protoModule.writeTag(buff, var595, 1, protoModule.wireTypes.varint)
			var596, var898 = protoModule.writeVarInt(var596, var597, t.SelectionBehavior.toNumber(self.kind.value))
			buff = var596
			var595 = var597
		elseif self.kind.type == "binding_path" then
			local var598, var599 = protoModule.writeTag(buff, var595, 2, protoModule.wireTypes.lengthDelimited)
			var598, var900 = protoModule.writeString(var598, var599, self.kind.value)
			buff = var598
			var595 = var599
		elseif self.kind.type == "conditional" then
			local var600 = self.kind.value:encode()
			local var601, var602 = protoModule.writeTag(buff, var595, 3, protoModule.wireTypes.lengthDelimited)
			var601, var903 = protoModule.writeBuffer(var601, var602, var600, buffer.len(var600))
			buff = var601
			var595 = var602
		end
	end
	local buff_1 = buffer.create(var595)
	buffer.copy(buff_1, 0, buff, 0, var595)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var595 = t_28.new()
	local var596 = 0
	while var596 < buffer.len(p28) do
		local _ = nil
		local var597 = nil
		local var598, var599, var600 = protoModule.readTag(p28, var596)
		local var601 = var598
		var597 = var599
		var596 = var600
		
		if var597 == protoModule.wireTypes.varint then
			if var601 == 1 then
				local _ = nil
				local var602, var603 = protoModule.readVarIntI32(p28, var596)
				local var604 = var602
				var596 = var603
				var595.kind = {
					type = "literal",
					value = t.SelectionBehavior.fromNumber(var604) or var604
				}
			else
				local _ = nil
				local var605, var606 = protoModule.readVarInt(p28, var596)
				local _ = var605
				var596 = var606
			end
		end
		if var597 == protoModule.wireTypes.lengthDelimited then
			if var601 == 2 then
				local _ = nil
				local var607, var608 = protoModule.readBuffer(p28, var596)
				var596 = var608
				var595.kind = { type = "binding_path", value = buffer.tostring(var607) }
			elseif var601 == 3 then
				local _ = nil
				local var609, var610 = protoModule.readBuffer(p28, var596)
				var596 = var610
				var595.kind = {
					type = "conditional",
					value = t.SelectionBehaviorProp_ConditionalOptions.decode(var609)
				}
			else
				local _ = nil
				local var611, var612 = protoModule.readVarInt(p28, var596)
				var596 = var612 + var611
			end
		elseif var597 == protoModule.wireTypes.i32 then
			local _ = nil
			local var613, var614 = protoModule.readFixed32(p28, var596)
			local _ = var613
			var596 = var614
		elseif var597 == protoModule.wireTypes.i64 then
			local _ = nil
			local var615, var616 = protoModule.readFixed64(p28, var596)
			local _ = var615
			var596 = var616
		else
			error("Unsupported wire type: " .. var907)
		end
	end
	return var595
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
	local var617 = t_28.new()
	
	if self.literal ~= nil then
		var617.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SelectionBehavior.fromNumber(self.literal) or self.literal else t.SelectionBehavior.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var617.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var617.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var617.kind = {
			type = "conditional",
			value = t.SelectionBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var617
end

t_28.descriptor = {
	name = "SelectionBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectionBehaviorProp"
}
t.SelectionBehaviorProp = t_28
typeRegistryModule.default:register(t.SelectionBehaviorProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p29 == nil or p29.condition == nil then nil else p29.condition,
		kind = if p29 == nil or p29.kind == nil then nil else p29.kind
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var617 = 0
	
	if self.condition ~= nil then
		local var618 = self.condition:encode()
		local var619, var620 = protoModule.writeTag(buff, var617, 1, protoModule.wireTypes.lengthDelimited)
		var619, var933 = protoModule.writeBuffer(var619, var620, var618, buffer.len(var618))
		buff = var619
		var617 = var620
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var621, var622 = protoModule.writeTag(buff, var617, 2, protoModule.wireTypes.varint)
			var621, var935 = protoModule.writeVarInt(var621, var622, t.SelectionBehavior.toNumber(self.kind.value))
			buff = var621
			var617 = var622
		elseif self.kind.type == "binding_path" then
			local var623, var624 = protoModule.writeTag(buff, var617, 3, protoModule.wireTypes.lengthDelimited)
			var623, var937 = protoModule.writeString(var623, var624, self.kind.value)
			buff = var623
			var617 = var624
		end
	end
	local buff_1 = buffer.create(var617)
	buffer.copy(buff_1, 0, buff, 0, var617)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var617 = t_29.new()
	local var618 = 0
	while var618 < buffer.len(p29) do
		local _ = nil
		local var619 = nil
		local var620, var621, var622 = protoModule.readTag(p29, var618)
		local var623 = var620
		var619 = var621
		var618 = var622
		
		if var619 == protoModule.wireTypes.varint then
			if var623 == 2 then
				local _ = nil
				local var624, var625 = protoModule.readVarIntI32(p29, var618)
				local var626 = var624
				var618 = var625
				var617.kind = {
					type = "literal",
					value = t.SelectionBehavior.fromNumber(var626) or var626
				}
			else
				local _ = nil
				local var627, var628 = protoModule.readVarInt(p29, var618)
				local _ = var627
				var618 = var628
			end
		end
		if var619 == protoModule.wireTypes.lengthDelimited then
			if var623 == 1 then
				local _ = nil
				local var629, var630 = protoModule.readBuffer(p29, var618)
				var618 = var630
				var617.condition = propConditionModule.PropCondition.decode(var629)
			elseif var623 == 3 then
				local _ = nil
				local var631, var632 = protoModule.readBuffer(p29, var618)
				var618 = var632
				var617.kind = { type = "binding_path", value = buffer.tostring(var631) }
			else
				local _ = nil
				local var633, var634 = protoModule.readVarInt(p29, var618)
				var618 = var634 + var633
			end
		elseif var619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var635, var636 = protoModule.readFixed32(p29, var618)
			local _ = var635
			var618 = var636
		elseif var619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var637, var638 = protoModule.readFixed64(p29, var618)
			local _ = var637
			var618 = var638
		else
			error("Unsupported wire type: " .. var941)
		end
	end
	return var617
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
	local var639 = t_29.new()
	
	if self.condition ~= nil then
		var639.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var639.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.SelectionBehavior.fromNumber(self.literal) or self.literal else t.SelectionBehavior.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var639.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var639.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var639
end

t_29.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.SelectionBehaviorProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.SelectionBehaviorProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p30 == nil or p30.options == nil then {} else p30.options
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var639 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var640 = v:encode()
			local var641, var642 = protoModule.writeTag(buff, var639, 1, protoModule.wireTypes.lengthDelimited)
			var641, var967 = protoModule.writeBuffer(var641, var642, var640, buffer.len(var640))
			buff = var641
			var639 = var642
		end
	end
	local buff_1 = buffer.create(var639)
	buffer.copy(buff_1, 0, buff, 0, var639)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var643 = t_30.new()
	local var644 = 0
	while var644 < buffer.len(p30) do
		local _ = nil
		local var645 = nil
		local var646, var647, var648 = protoModule.readTag(p30, var644)
		local var649 = var646
		var645 = var647
		var644 = var648
		
		if var645 == protoModule.wireTypes.varint then
			local _ = nil
			local var650, var651 = protoModule.readVarInt(p30, var644)
			local _ = var650
			var644 = var651
			continue
		end
		if var645 == protoModule.wireTypes.lengthDelimited then
			if var649 == 1 then
				local _ = nil
				local var652, var653 = protoModule.readBuffer(p30, var644)
				var644 = var653
				table.insert(var643.options, t.SelectionBehaviorProp_ConditionalOption.decode(var652))
			else
				local _ = nil
				local var654, var655 = protoModule.readVarInt(p30, var644)
				var644 = var655 + var654
			end
		elseif var645 == protoModule.wireTypes.i32 then
			local _ = nil
			local var656, var657 = protoModule.readFixed32(p30, var644)
			local _ = var656
			var644 = var657
		elseif var645 == protoModule.wireTypes.i64 then
			local _ = nil
			local var658, var659 = protoModule.readFixed64(p30, var644)
			local _ = var658
			var644 = var659
		else
			error("Unsupported wire type: " .. var971)
		end
	end
	return var643
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
	local var660 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectionBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var660.options = t_1
	end
	return var660
end

t_30.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.SelectionBehaviorProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.SelectionBehaviorProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p31 == nil or p31.kind == nil then nil else p31.kind
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var661 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var662, var663 = protoModule.writeTag(buff, var661, 1, protoModule.wireTypes.varint)
			var662, var993 = protoModule.writeVarInt(var662, var663, t.KeyCode.toNumber(self.kind.value))
			buff = var662
			var661 = var663
		elseif self.kind.type == "binding_path" then
			local var664, var665 = protoModule.writeTag(buff, var661, 2, protoModule.wireTypes.lengthDelimited)
			var664, var995 = protoModule.writeString(var664, var665, self.kind.value)
			buff = var664
			var661 = var665
		elseif self.kind.type == "conditional" then
			local var666 = self.kind.value:encode()
			local var667, var668 = protoModule.writeTag(buff, var661, 3, protoModule.wireTypes.lengthDelimited)
			var667, var998 = protoModule.writeBuffer(var667, var668, var666, buffer.len(var666))
			buff = var667
			var661 = var668
		end
	end
	local buff_1 = buffer.create(var661)
	buffer.copy(buff_1, 0, buff, 0, var661)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var661 = t_31.new()
	local var662 = 0
	while var662 < buffer.len(p31) do
		local _ = nil
		local var663 = nil
		local var664, var665, var666 = protoModule.readTag(p31, var662)
		local var667 = var664
		var663 = var665
		var662 = var666
		
		if var663 == protoModule.wireTypes.varint then
			if var667 == 1 then
				local _ = nil
				local var668, var669 = protoModule.readVarIntI32(p31, var662)
				local var670 = var668
				var662 = var669
				var661.kind = {
					type = "literal",
					value = t.KeyCode.fromNumber(var670) or var670
				}
			else
				local _ = nil
				local var671, var672 = protoModule.readVarInt(p31, var662)
				local _ = var671
				var662 = var672
			end
		end
		if var663 == protoModule.wireTypes.lengthDelimited then
			if var667 == 2 then
				local _ = nil
				local var673, var674 = protoModule.readBuffer(p31, var662)
				var662 = var674
				var661.kind = { type = "binding_path", value = buffer.tostring(var673) }
			elseif var667 == 3 then
				local _ = nil
				local var675, var676 = protoModule.readBuffer(p31, var662)
				var662 = var676
				var661.kind = {
					type = "conditional",
					value = t.KeyCodeProp_ConditionalOptions.decode(var675)
				}
			else
				local _ = nil
				local var677, var678 = protoModule.readVarInt(p31, var662)
				var662 = var678 + var677
			end
		elseif var663 == protoModule.wireTypes.i32 then
			local _ = nil
			local var679, var680 = protoModule.readFixed32(p31, var662)
			local _ = var679
			var662 = var680
		elseif var663 == protoModule.wireTypes.i64 then
			local _ = nil
			local var681, var682 = protoModule.readFixed64(p31, var662)
			local _ = var681
			var662 = var682
		else
			error("Unsupported wire type: " .. var1002)
		end
	end
	return var661
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
	local var683 = t_31.new()
	
	if self.literal ~= nil then
		var683.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.KeyCode.fromNumber(self.literal) or self.literal else t.KeyCode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var683.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var683.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var683.kind = {
			type = "conditional",
			value = t.KeyCodeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var683
end

t_31.descriptor = {
	name = "KeyCodeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeyCodeProp"
}
t.KeyCodeProp = t_31
typeRegistryModule.default:register(t.KeyCodeProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p32 == nil or p32.condition == nil then nil else p32.condition,
		kind = if p32 == nil or p32.kind == nil then nil else p32.kind
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var683 = 0
	
	if self.condition ~= nil then
		local var684 = self.condition:encode()
		local var685, var686 = protoModule.writeTag(buff, var683, 1, protoModule.wireTypes.lengthDelimited)
		var685, var1028 = protoModule.writeBuffer(var685, var686, var684, buffer.len(var684))
		buff = var685
		var683 = var686
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var687, var688 = protoModule.writeTag(buff, var683, 2, protoModule.wireTypes.varint)
			var687, var1030 = protoModule.writeVarInt(var687, var688, t.KeyCode.toNumber(self.kind.value))
			buff = var687
			var683 = var688
		elseif self.kind.type == "binding_path" then
			local var689, var690 = protoModule.writeTag(buff, var683, 3, protoModule.wireTypes.lengthDelimited)
			var689, var1032 = protoModule.writeString(var689, var690, self.kind.value)
			buff = var689
			var683 = var690
		end
	end
	local buff_1 = buffer.create(var683)
	buffer.copy(buff_1, 0, buff, 0, var683)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var683 = t_32.new()
	local var684 = 0
	while var684 < buffer.len(p32) do
		local _ = nil
		local var685 = nil
		local var686, var687, var688 = protoModule.readTag(p32, var684)
		local var689 = var686
		var685 = var687
		var684 = var688
		
		if var685 == protoModule.wireTypes.varint then
			if var689 == 2 then
				local _ = nil
				local var690, var691 = protoModule.readVarIntI32(p32, var684)
				local var692 = var690
				var684 = var691
				var683.kind = {
					type = "literal",
					value = t.KeyCode.fromNumber(var692) or var692
				}
			else
				local _ = nil
				local var693, var694 = protoModule.readVarInt(p32, var684)
				local _ = var693
				var684 = var694
			end
		end
		if var685 == protoModule.wireTypes.lengthDelimited then
			if var689 == 1 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p32, var684)
				var684 = var696
				var683.condition = propConditionModule.PropCondition.decode(var695)
			elseif var689 == 3 then
				local _ = nil
				local var697, var698 = protoModule.readBuffer(p32, var684)
				var684 = var698
				var683.kind = { type = "binding_path", value = buffer.tostring(var697) }
			else
				local _ = nil
				local var699, var700 = protoModule.readVarInt(p32, var684)
				var684 = var700 + var699
			end
		elseif var685 == protoModule.wireTypes.i32 then
			local _ = nil
			local var701, var702 = protoModule.readFixed32(p32, var684)
			local _ = var701
			var684 = var702
		elseif var685 == protoModule.wireTypes.i64 then
			local _ = nil
			local var703, var704 = protoModule.readFixed64(p32, var684)
			local _ = var703
			var684 = var704
		else
			error("Unsupported wire type: " .. var1036)
		end
	end
	return var683
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
	local var705 = t_32.new()
	
	if self.condition ~= nil then
		var705.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var705.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.KeyCode.fromNumber(self.literal) or self.literal else t.KeyCode.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var705.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var705.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var705
end

t_32.descriptor = {
	name = "KeyCodeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.KeyCodeProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.KeyCodeProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p33)
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p33 == nil or p33.options == nil then {} else p33.options
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var705 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var706 = v:encode()
			local var707, var708 = protoModule.writeTag(buff, var705, 1, protoModule.wireTypes.lengthDelimited)
			var707, var1062 = protoModule.writeBuffer(var707, var708, var706, buffer.len(var706))
			buff = var707
			var705 = var708
		end
	end
	local buff_1 = buffer.create(var705)
	buffer.copy(buff_1, 0, buff, 0, var705)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var709 = t_33.new()
	local var710 = 0
	while var710 < buffer.len(p33) do
		local _ = nil
		local var711 = nil
		local var712, var713, var714 = protoModule.readTag(p33, var710)
		local var715 = var712
		var711 = var713
		var710 = var714
		
		if var711 == protoModule.wireTypes.varint then
			local _ = nil
			local var716, var717 = protoModule.readVarInt(p33, var710)
			local _ = var716
			var710 = var717
			continue
		end
		if var711 == protoModule.wireTypes.lengthDelimited then
			if var715 == 1 then
				local _ = nil
				local var718, var719 = protoModule.readBuffer(p33, var710)
				var710 = var719
				table.insert(var709.options, t.KeyCodeProp_ConditionalOption.decode(var718))
			else
				local _ = nil
				local var720, var721 = protoModule.readVarInt(p33, var710)
				var710 = var721 + var720
			end
		elseif var711 == protoModule.wireTypes.i32 then
			local _ = nil
			local var722, var723 = protoModule.readFixed32(p33, var710)
			local _ = var722
			var710 = var723
		elseif var711 == protoModule.wireTypes.i64 then
			local _ = nil
			local var724, var725 = protoModule.readFixed64(p33, var710)
			local _ = var724
			var710 = var725
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var709
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
	local var726 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.KeyCodeProp_ConditionalOption.jsonDecode(v))
		end
		var726.options = t_1
	end
	return var726
end

t_33.descriptor = {
	name = "KeyCodeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.KeyCodeProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.KeyCodeProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p34)
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p34 == nil or p34.kind == nil then nil else p34.kind
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var727 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var728, var729 = protoModule.writeTag(buff, var727, 1, protoModule.wireTypes.varint)
			var728, var1088 = protoModule.writeVarInt(var728, var729, t.VerticalAlignment.toNumber(self.kind.value))
			buff = var728
			var727 = var729
		elseif self.kind.type == "binding_path" then
			local var730, var731 = protoModule.writeTag(buff, var727, 2, protoModule.wireTypes.lengthDelimited)
			var730, var1090 = protoModule.writeString(var730, var731, self.kind.value)
			buff = var730
			var727 = var731
		elseif self.kind.type == "conditional" then
			local var732 = self.kind.value:encode()
			local var733, var734 = protoModule.writeTag(buff, var727, 3, protoModule.wireTypes.lengthDelimited)
			var733, var1093 = protoModule.writeBuffer(var733, var734, var732, buffer.len(var732))
			buff = var733
			var727 = var734
		end
	end
	local buff_1 = buffer.create(var727)
	buffer.copy(buff_1, 0, buff, 0, var727)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var727 = t_34.new()
	local var728 = 0
	while var728 < buffer.len(p34) do
		local _ = nil
		local var729 = nil
		local var730, var731, var732 = protoModule.readTag(p34, var728)
		local var733 = var730
		var729 = var731
		var728 = var732
		
		if var729 == protoModule.wireTypes.varint then
			if var733 == 1 then
				local _ = nil
				local var734, var735 = protoModule.readVarIntI32(p34, var728)
				local var736 = var734
				var728 = var735
				var727.kind = {
					type = "literal",
					value = t.VerticalAlignment.fromNumber(var736) or var736
				}
			else
				local _ = nil
				local var737, var738 = protoModule.readVarInt(p34, var728)
				local _ = var737
				var728 = var738
			end
		end
		if var729 == protoModule.wireTypes.lengthDelimited then
			if var733 == 2 then
				local _ = nil
				local var739, var740 = protoModule.readBuffer(p34, var728)
				var728 = var740
				var727.kind = { type = "binding_path", value = buffer.tostring(var739) }
			elseif var733 == 3 then
				local _ = nil
				local var741, var742 = protoModule.readBuffer(p34, var728)
				var728 = var742
				var727.kind = {
					type = "conditional",
					value = t.VerticalAlignmentProp_ConditionalOptions.decode(var741)
				}
			else
				local _ = nil
				local var743, var744 = protoModule.readVarInt(p34, var728)
				var728 = var744 + var743
			end
		elseif var729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var745, var746 = protoModule.readFixed32(p34, var728)
			local _ = var745
			var728 = var746
		elseif var729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var747, var748 = protoModule.readFixed64(p34, var728)
			local _ = var747
			var728 = var748
		else
			error("Unsupported wire type: " .. var1097)
		end
	end
	return var727
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
	local var749 = t_34.new()
	
	if self.literal ~= nil then
		var749.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.VerticalAlignment.fromNumber(self.literal) or self.literal else t.VerticalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var749.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var749.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var749.kind = {
			type = "conditional",
			value = t.VerticalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var749
end

t_34.descriptor = {
	name = "VerticalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalAlignmentProp"
}
t.VerticalAlignmentProp = t_34
typeRegistryModule.default:register(t.VerticalAlignmentProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p35 == nil or p35.condition == nil then nil else p35.condition,
		kind = if p35 == nil or p35.kind == nil then nil else p35.kind
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var749 = 0
	
	if self.condition ~= nil then
		local var750 = self.condition:encode()
		local var751, var752 = protoModule.writeTag(buff, var749, 1, protoModule.wireTypes.lengthDelimited)
		var751, var1123 = protoModule.writeBuffer(var751, var752, var750, buffer.len(var750))
		buff = var751
		var749 = var752
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var753, var754 = protoModule.writeTag(buff, var749, 2, protoModule.wireTypes.varint)
			var753, var1125 = protoModule.writeVarInt(var753, var754, t.VerticalAlignment.toNumber(self.kind.value))
			buff = var753
			var749 = var754
		elseif self.kind.type == "binding_path" then
			local var755, var756 = protoModule.writeTag(buff, var749, 3, protoModule.wireTypes.lengthDelimited)
			var755, var1127 = protoModule.writeString(var755, var756, self.kind.value)
			buff = var755
			var749 = var756
		end
	end
	local buff_1 = buffer.create(var749)
	buffer.copy(buff_1, 0, buff, 0, var749)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var749 = t_35.new()
	local var750 = 0
	while var750 < buffer.len(p35) do
		local _ = nil
		local var751 = nil
		local var752, var753, var754 = protoModule.readTag(p35, var750)
		local var755 = var752
		var751 = var753
		var750 = var754
		
		if var751 == protoModule.wireTypes.varint then
			if var755 == 2 then
				local _ = nil
				local var756, var757 = protoModule.readVarIntI32(p35, var750)
				local var758 = var756
				var750 = var757
				var749.kind = {
					type = "literal",
					value = t.VerticalAlignment.fromNumber(var758) or var758
				}
			else
				local _ = nil
				local var759, var760 = protoModule.readVarInt(p35, var750)
				local _ = var759
				var750 = var760
			end
		end
		if var751 == protoModule.wireTypes.lengthDelimited then
			if var755 == 1 then
				local _ = nil
				local var761, var762 = protoModule.readBuffer(p35, var750)
				var750 = var762
				var749.condition = propConditionModule.PropCondition.decode(var761)
			elseif var755 == 3 then
				local _ = nil
				local var763, var764 = protoModule.readBuffer(p35, var750)
				var750 = var764
				var749.kind = { type = "binding_path", value = buffer.tostring(var763) }
			else
				local _ = nil
				local var765, var766 = protoModule.readVarInt(p35, var750)
				var750 = var766 + var765
			end
		elseif var751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var767, var768 = protoModule.readFixed32(p35, var750)
			local _ = var767
			var750 = var768
		elseif var751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var769, var770 = protoModule.readFixed64(p35, var750)
			local _ = var769
			var750 = var770
		else
			error("Unsupported wire type: " .. var1131)
		end
	end
	return var749
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
	local var771 = t_35.new()
	
	if self.condition ~= nil then
		var771.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var771.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.VerticalAlignment.fromNumber(self.literal) or self.literal else t.VerticalAlignment.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var771.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var771.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var771
end

t_35.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.VerticalAlignmentProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.VerticalAlignmentProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t_36 (ref)
	return setmetatable({
		option = if p36 == nil or p36.option == nil then {} else p36.option
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var771 = 0
	
	if self.option ~= nil and #self.option > 0 then
		for i, v in self.option do
			local var772 = v:encode()
			local var773, var774 = protoModule.writeTag(buff, var771, 1, protoModule.wireTypes.lengthDelimited)
			var773, var1157 = protoModule.writeBuffer(var773, var774, var772, buffer.len(var772))
			buff = var773
			var771 = var774
		end
	end
	local buff_1 = buffer.create(var771)
	buffer.copy(buff_1, 0, buff, 0, var771)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var775 = t_36.new()
	local var776 = 0
	while var776 < buffer.len(p36) do
		local _ = nil
		local var777 = nil
		local var778, var779, var780 = protoModule.readTag(p36, var776)
		local var781 = var778
		var777 = var779
		var776 = var780
		
		if var777 == protoModule.wireTypes.varint then
			local _ = nil
			local var782, var783 = protoModule.readVarInt(p36, var776)
			local _ = var782
			var776 = var783
			continue
		end
		if var777 == protoModule.wireTypes.lengthDelimited then
			if var781 == 1 then
				local _ = nil
				local var784, var785 = protoModule.readBuffer(p36, var776)
				var776 = var785
				table.insert(var775.option, t.VerticalAlignmentProp_ConditionalOption.decode(var784))
			else
				local _ = nil
				local var786, var787 = protoModule.readVarInt(p36, var776)
				var776 = var787 + var786
			end
		elseif var777 == protoModule.wireTypes.i32 then
			local _ = nil
			local var788, var789 = protoModule.readFixed32(p36, var776)
			local _ = var788
			var776 = var789
		elseif var777 == protoModule.wireTypes.i64 then
			local _ = nil
			local var790, var791 = protoModule.readFixed64(p36, var776)
			local _ = var790
			var776 = var791
		else
			error("Unsupported wire type: " .. var1161)
		end
	end
	return var775
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
	local var792 = t_36.new()
	
	if self.option ~= nil then
		local t_1 = {}
		
		for i, v in self.option do
			table.insert(t_1, t.VerticalAlignmentProp_ConditionalOption.jsonDecode(v))
		end
		var792.option = t_1
	end
	return var792
end

t_36.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.VerticalAlignmentProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.VerticalAlignmentProp_ConditionalOptions)
t.AutomaticSize = {
	fromNumber = function(p37)
		return if p37 == 0 then "AUTOMATIC_SIZE_INVALID" elseif p37 == 1 then "AUTOMATIC_SIZE_NONE" elseif p37 == 2 then "AUTOMATIC_SIZE_X" elseif p37 == 3 then "AUTOMATIC_SIZE_Y" elseif p37 == 4 then "AUTOMATIC_SIZE_XY" else nil
	end,
	toNumber = function(p37)
		return if p37 == "AUTOMATIC_SIZE_INVALID" then 0 elseif p37 == "AUTOMATIC_SIZE_NONE" then 1 elseif p37 == "AUTOMATIC_SIZE_X" then 2 elseif p37 == "AUTOMATIC_SIZE_Y" then 3 elseif p37 == "AUTOMATIC_SIZE_XY" then 4 else p37
	end,
	fromName = function(p37)
		return if p37 == "AUTOMATIC_SIZE_INVALID" then "AUTOMATIC_SIZE_INVALID" elseif p37 == "AUTOMATIC_SIZE_NONE" then "AUTOMATIC_SIZE_NONE" elseif p37 == "AUTOMATIC_SIZE_X" then "AUTOMATIC_SIZE_X" elseif p37 == "AUTOMATIC_SIZE_Y" then "AUTOMATIC_SIZE_Y" elseif p37 == "AUTOMATIC_SIZE_XY" then "AUTOMATIC_SIZE_XY" else nil
	end
}
t.TextTruncate = {
	fromNumber = function(p37)
		return if p37 == 0 then "TEXT_TRUNCATE_INVALID" elseif p37 == 1 then "TEXT_TRUNCATE_NONE" elseif p37 == 2 then "TEXT_TRUNCATE_AT_END" elseif p37 == 3 then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end,
	toNumber = function(p37)
		return if p37 == "TEXT_TRUNCATE_INVALID" then 0 elseif p37 == "TEXT_TRUNCATE_NONE" then 1 elseif p37 == "TEXT_TRUNCATE_AT_END" then 2 elseif p37 == "TEXT_TRUNCATE_SPLIT_WORD" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "TEXT_TRUNCATE_INVALID" then "TEXT_TRUNCATE_INVALID" elseif p37 == "TEXT_TRUNCATE_NONE" then "TEXT_TRUNCATE_NONE" elseif p37 == "TEXT_TRUNCATE_AT_END" then "TEXT_TRUNCATE_AT_END" elseif p37 == "TEXT_TRUNCATE_SPLIT_WORD" then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end
}
t.TextXAlignment = {
	fromNumber = function(p37)
		return if p37 == 0 then "TEXT_X_ALIGNMENT_INVALID" elseif p37 == 1 then "TEXT_X_ALIGNMENT_LEFT" elseif p37 == 2 then "TEXT_X_ALIGNMENT_CENTER" elseif p37 == 3 then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p37)
		return if p37 == "TEXT_X_ALIGNMENT_INVALID" then 0 elseif p37 == "TEXT_X_ALIGNMENT_LEFT" then 1 elseif p37 == "TEXT_X_ALIGNMENT_CENTER" then 2 elseif p37 == "TEXT_X_ALIGNMENT_RIGHT" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "TEXT_X_ALIGNMENT_INVALID" then "TEXT_X_ALIGNMENT_INVALID" elseif p37 == "TEXT_X_ALIGNMENT_LEFT" then "TEXT_X_ALIGNMENT_LEFT" elseif p37 == "TEXT_X_ALIGNMENT_CENTER" then "TEXT_X_ALIGNMENT_CENTER" elseif p37 == "TEXT_X_ALIGNMENT_RIGHT" then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end
}
t.TextYAlignment = {
	fromNumber = function(p37)
		return if p37 == 0 then "TEXT_Y_ALIGNMENT_INVALID" elseif p37 == 1 then "TEXT_Y_ALIGNMENT_TOP" elseif p37 == 2 then "TEXT_Y_ALIGNMENT_CENTER" elseif p37 == 3 then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p37)
		return if p37 == "TEXT_Y_ALIGNMENT_INVALID" then 0 elseif p37 == "TEXT_Y_ALIGNMENT_TOP" then 1 elseif p37 == "TEXT_Y_ALIGNMENT_CENTER" then 2 elseif p37 == "TEXT_Y_ALIGNMENT_BOTTOM" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "TEXT_Y_ALIGNMENT_INVALID" then "TEXT_Y_ALIGNMENT_INVALID" elseif p37 == "TEXT_Y_ALIGNMENT_TOP" then "TEXT_Y_ALIGNMENT_TOP" elseif p37 == "TEXT_Y_ALIGNMENT_CENTER" then "TEXT_Y_ALIGNMENT_CENTER" elseif p37 == "TEXT_Y_ALIGNMENT_BOTTOM" then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end
}
t.UIFlexMode = {
	fromNumber = function(p37)
		return if p37 == 0 then "UI_FLEX_MODE_INVALID" elseif p37 == 1 then "UI_FLEX_MODE_NONE" elseif p37 == 2 then "UI_FLEX_MODE_GROW" elseif p37 == 3 then "UI_FLEX_MODE_SHRINK" elseif p37 == 4 then "UI_FLEX_MODE_FILL" elseif p37 == 5 then "UI_FLEX_MODE_CUSTOM" else nil
	end,
	toNumber = function(p37)
		return if p37 == "UI_FLEX_MODE_INVALID" then 0 elseif p37 == "UI_FLEX_MODE_NONE" then 1 elseif p37 == "UI_FLEX_MODE_GROW" then 2 elseif p37 == "UI_FLEX_MODE_SHRINK" then 3 elseif p37 == "UI_FLEX_MODE_FILL" then 4 elseif p37 == "UI_FLEX_MODE_CUSTOM" then 5 else p37
	end,
	fromName = function(p37)
		return if p37 == "UI_FLEX_MODE_INVALID" then "UI_FLEX_MODE_INVALID" elseif p37 == "UI_FLEX_MODE_NONE" then "UI_FLEX_MODE_NONE" elseif p37 == "UI_FLEX_MODE_GROW" then "UI_FLEX_MODE_GROW" elseif p37 == "UI_FLEX_MODE_SHRINK" then "UI_FLEX_MODE_SHRINK" elseif p37 == "UI_FLEX_MODE_FILL" then "UI_FLEX_MODE_FILL" elseif p37 == "UI_FLEX_MODE_CUSTOM" then "UI_FLEX_MODE_CUSTOM" else nil
	end
}
t.ScaleType = {
	fromNumber = function(p37)
		return if p37 == 0 then "SCALE_TYPE_INVALID" elseif p37 == 1 then "SCALE_TYPE_STRETCH" elseif p37 == 2 then "SCALE_TYPE_SLICE" elseif p37 == 3 then "SCALE_TYPE_TILE" elseif p37 == 4 then "SCALE_TYPE_FIT" elseif p37 == 5 then "SCALE_TYPE_CROP" else nil
	end,
	toNumber = function(p37)
		return if p37 == "SCALE_TYPE_INVALID" then 0 elseif p37 == "SCALE_TYPE_STRETCH" then 1 elseif p37 == "SCALE_TYPE_SLICE" then 2 elseif p37 == "SCALE_TYPE_TILE" then 3 elseif p37 == "SCALE_TYPE_FIT" then 4 elseif p37 == "SCALE_TYPE_CROP" then 5 else p37
	end,
	fromName = function(p37)
		return if p37 == "SCALE_TYPE_INVALID" then "SCALE_TYPE_INVALID" elseif p37 == "SCALE_TYPE_STRETCH" then "SCALE_TYPE_STRETCH" elseif p37 == "SCALE_TYPE_SLICE" then "SCALE_TYPE_SLICE" elseif p37 == "SCALE_TYPE_TILE" then "SCALE_TYPE_TILE" elseif p37 == "SCALE_TYPE_FIT" then "SCALE_TYPE_FIT" elseif p37 == "SCALE_TYPE_CROP" then "SCALE_TYPE_CROP" else nil
	end
}
t.ResamplerMode = {
	fromNumber = function(p37)
		return if p37 == 0 then "RESAMPLER_MODE_INVALID" elseif p37 == 1 then "RESAMPLER_MODE_DEFAULT" elseif p37 == 2 then "RESAMPLER_MODE_PIXELATED" else nil
	end,
	toNumber = function(p37)
		return if p37 == "RESAMPLER_MODE_INVALID" then 0 elseif p37 == "RESAMPLER_MODE_DEFAULT" then 1 elseif p37 == "RESAMPLER_MODE_PIXELATED" then 2 else p37
	end,
	fromName = function(p37)
		return if p37 == "RESAMPLER_MODE_INVALID" then "RESAMPLER_MODE_INVALID" elseif p37 == "RESAMPLER_MODE_DEFAULT" then "RESAMPLER_MODE_DEFAULT" elseif p37 == "RESAMPLER_MODE_PIXELATED" then "RESAMPLER_MODE_PIXELATED" else nil
	end
}
t.SizeConstraint = {
	fromNumber = function(p37)
		return if p37 == 0 then "SIZE_CONSTRAINT_INVALID" elseif p37 == 1 then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p37 == 2 then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p37 == 3 then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end,
	toNumber = function(p37)
		return if p37 == "SIZE_CONSTRAINT_INVALID" then 0 elseif p37 == "SIZE_CONSTRAINT_RELATIVE_XY" then 1 elseif p37 == "SIZE_CONSTRAINT_RELATIVE_XX" then 2 elseif p37 == "SIZE_CONSTRAINT_RELATIVE_YY" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "SIZE_CONSTRAINT_INVALID" then "SIZE_CONSTRAINT_INVALID" elseif p37 == "SIZE_CONSTRAINT_RELATIVE_XY" then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p37 == "SIZE_CONSTRAINT_RELATIVE_XX" then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p37 == "SIZE_CONSTRAINT_RELATIVE_YY" then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end
}
t.HorizontalAlignment = {
	fromNumber = function(p37)
		return if p37 == 0 then "HORIZONTAL_ALIGNMENT_INVALID" elseif p37 == 1 then "HORIZONTAL_ALIGNMENT_LEFT" elseif p37 == 2 then "HORIZONTAL_ALIGNMENT_CENTER" elseif p37 == 3 then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p37)
		return if p37 == "HORIZONTAL_ALIGNMENT_INVALID" then 0 elseif p37 == "HORIZONTAL_ALIGNMENT_LEFT" then 1 elseif p37 == "HORIZONTAL_ALIGNMENT_CENTER" then 2 elseif p37 == "HORIZONTAL_ALIGNMENT_RIGHT" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "HORIZONTAL_ALIGNMENT_INVALID" then "HORIZONTAL_ALIGNMENT_INVALID" elseif p37 == "HORIZONTAL_ALIGNMENT_LEFT" then "HORIZONTAL_ALIGNMENT_LEFT" elseif p37 == "HORIZONTAL_ALIGNMENT_CENTER" then "HORIZONTAL_ALIGNMENT_CENTER" elseif p37 == "HORIZONTAL_ALIGNMENT_RIGHT" then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end
}
t.VerticalAlignment = {
	fromNumber = function(p37)
		return if p37 == 0 then "VERTICAL_ALIGNMENT_INVALID" elseif p37 == 1 then "VERTICAL_ALIGNMENT_TOP" elseif p37 == 2 then "VERTICAL_ALIGNMENT_CENTER" elseif p37 == 3 then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p37)
		return if p37 == "VERTICAL_ALIGNMENT_INVALID" then 0 elseif p37 == "VERTICAL_ALIGNMENT_TOP" then 1 elseif p37 == "VERTICAL_ALIGNMENT_CENTER" then 2 elseif p37 == "VERTICAL_ALIGNMENT_BOTTOM" then 3 else p37
	end,
	fromName = function(p37)
		return if p37 == "VERTICAL_ALIGNMENT_INVALID" then "VERTICAL_ALIGNMENT_INVALID" elseif p37 == "VERTICAL_ALIGNMENT_TOP" then "VERTICAL_ALIGNMENT_TOP" elseif p37 == "VERTICAL_ALIGNMENT_CENTER" then "VERTICAL_ALIGNMENT_CENTER" elseif p37 == "VERTICAL_ALIGNMENT_BOTTOM" then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end
}
t.SelectionBehavior = {
	fromNumber = function(p37)
		return if p37 == 0 then "SELECTION_BEHAVIOR_INVALID" elseif p37 == 1 then "SELECTION_BEHAVIOR_ESCAPE" elseif p37 == 2 then "SELECTION_BEHAVIOR_STOP" else nil
	end,
	toNumber = function(p37)
		return if p37 == "SELECTION_BEHAVIOR_INVALID" then 0 elseif p37 == "SELECTION_BEHAVIOR_ESCAPE" then 1 elseif p37 == "SELECTION_BEHAVIOR_STOP" then 2 else p37
	end,
	fromName = function(p37)
		return if p37 == "SELECTION_BEHAVIOR_INVALID" then "SELECTION_BEHAVIOR_INVALID" elseif p37 == "SELECTION_BEHAVIOR_ESCAPE" then "SELECTION_BEHAVIOR_ESCAPE" elseif p37 == "SELECTION_BEHAVIOR_STOP" then "SELECTION_BEHAVIOR_STOP" else nil
	end
}
t.KeyCode = {
	fromNumber = function(p37)
		return if p37 == 0 then "KEY_CODE_INVALID" elseif p37 == 1 then "KEY_CODE_BUTTON_A" elseif p37 == 2 then "KEY_CODE_BUTTON_B" elseif p37 == 3 then "KEY_CODE_BUTTON_X" elseif p37 == 4 then "KEY_CODE_BUTTON_Y" elseif p37 == 5 then "KEY_CODE_BUTTON_L1" elseif p37 == 6 then "KEY_CODE_BUTTON_R1" elseif p37 == 7 then "KEY_CODE_BUTTON_L2" elseif p37 == 8 then "KEY_CODE_BUTTON_R2" elseif p37 == 9 then "KEY_CODE_BUTTON_L3" elseif p37 == 10 then "KEY_CODE_BUTTON_R3" else nil
	end,
	toNumber = function(p37)
		return if p37 == "KEY_CODE_INVALID" then 0 elseif p37 == "KEY_CODE_BUTTON_A" then 1 elseif p37 == "KEY_CODE_BUTTON_B" then 2 elseif p37 == "KEY_CODE_BUTTON_X" then 3 elseif p37 == "KEY_CODE_BUTTON_Y" then 4 elseif p37 == "KEY_CODE_BUTTON_L1" then 5 elseif p37 == "KEY_CODE_BUTTON_R1" then 6 elseif p37 == "KEY_CODE_BUTTON_L2" then 7 elseif p37 == "KEY_CODE_BUTTON_R2" then 8 elseif p37 == "KEY_CODE_BUTTON_L3" then 9 elseif p37 == "KEY_CODE_BUTTON_R3" then 10 else p37
	end,
	fromName = function(p37)
		return if p37 == "KEY_CODE_INVALID" then "KEY_CODE_INVALID" elseif p37 == "KEY_CODE_BUTTON_A" then "KEY_CODE_BUTTON_A" elseif p37 == "KEY_CODE_BUTTON_B" then "KEY_CODE_BUTTON_B" elseif p37 == "KEY_CODE_BUTTON_X" then "KEY_CODE_BUTTON_X" elseif p37 == "KEY_CODE_BUTTON_Y" then "KEY_CODE_BUTTON_Y" elseif p37 == "KEY_CODE_BUTTON_L1" then "KEY_CODE_BUTTON_L1" elseif p37 == "KEY_CODE_BUTTON_R1" then "KEY_CODE_BUTTON_R1" elseif p37 == "KEY_CODE_BUTTON_L2" then "KEY_CODE_BUTTON_L2" elseif p37 == "KEY_CODE_BUTTON_R2" then "KEY_CODE_BUTTON_R2" elseif p37 == "KEY_CODE_BUTTON_L3" then "KEY_CODE_BUTTON_L3" elseif p37 == "KEY_CODE_BUTTON_R3" then "KEY_CODE_BUTTON_R3" else nil
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