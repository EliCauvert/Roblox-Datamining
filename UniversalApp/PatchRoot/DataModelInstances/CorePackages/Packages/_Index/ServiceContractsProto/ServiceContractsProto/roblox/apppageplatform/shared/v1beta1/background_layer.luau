local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		resource_identifier = if p1 == nil or p1.resource_identifier == nil then "" else p1.resource_identifier
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.resource_identifier ~= nil and self.resource_identifier ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var13 = protoModule.writeString(var2, var3, self.resource_identifier)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
				var1.resource_identifier = buffer.tostring(var10)
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
			error("Unsupported wire type: " .. var17)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.resource_identifier ~= nil and self.resource_identifier ~= "" then
		t.resourceIdentifier = self.resource_identifier
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var18 = t_1.new()
	
	if self.resource_identifier ~= nil then
		var18.resource_identifier = self.resource_identifier
	end
	if self.resourceIdentifier ~= nil then
		var18.resource_identifier = self.resourceIdentifier
	end
	return var18
end

t_1.descriptor = {
	name = "ImageBackground",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageBackground"
}
t.ImageBackground = t_1
typeRegistryModule.default:register(t.ImageBackground)
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
	
	if self.kind ~= nil and self.kind.type == "image_background" then
		local var19 = self.kind.value:encode()
		local var20, var21 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.lengthDelimited)
		var20, var38 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
		buff = var20
		var18 = var21
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
					type = "image_background",
					value = t.ImageBackground.decode(var27)
				}
			else
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p2, var19)
				var19 = var30 + var29
			end
		elseif var20 == protoModule.wireTypes.i32 then
			local _ = nil
			local var31, var32 = protoModule.readFixed32(p2, var19)
			local _ = var31
			var19 = var32
		elseif var20 == protoModule.wireTypes.i64 then
			local _ = nil
			local var33, var34 = protoModule.readFixed64(p2, var19)
			local _ = var33
			var19 = var34
		else
			error("Unsupported wire type: " .. var42)
		end
	end
	return var18
end

function t_2:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "image_background" then
		t.imageBackground = self.kind.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var35 = t_2.new()
	
	if self.image_background ~= nil then
		var35.kind = {
			type = "image_background",
			value = t.ImageBackground.jsonDecode(self.image_background)
		}
	end
	if self.imageBackground ~= nil then
		var35.kind = {
			type = "image_background",
			value = t.ImageBackground.jsonDecode(self.imageBackground)
		}
	end
	return var35
end

t_2.descriptor = {
	name = "BackgroundLayer",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundLayer"
}
t.BackgroundLayer = t_2
typeRegistryModule.default:register(t.BackgroundLayer)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p3 == nil or p3.kind == nil then nil else p3.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var35 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var36 = self.kind.value:encode()
			local var37, var38 = protoModule.writeTag(buff, var35, 1, protoModule.wireTypes.lengthDelimited)
			var37, var63 = protoModule.writeBuffer(var37, var38, var36, buffer.len(var36))
			buff = var37
			var35 = var38
		elseif self.kind.type == "binding_path" then
			local var39, var40 = protoModule.writeTag(buff, var35, 2, protoModule.wireTypes.lengthDelimited)
			var39, var65 = protoModule.writeString(var39, var40, self.kind.value)
			buff = var39
			var35 = var40
		elseif self.kind.type == "conditional" then
			local var41 = self.kind.value:encode()
			local var42, var43 = protoModule.writeTag(buff, var35, 3, protoModule.wireTypes.lengthDelimited)
			var42, var68 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
			buff = var42
			var35 = var43
		end
	end
	local buff_1 = buffer.create(var35)
	buffer.copy(buff_1, 0, buff, 0, var35)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var35 = t_3.new()
	local var36 = 0
	while var36 < buffer.len(p3) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p3, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			local _ = nil
			local var42, var43 = protoModule.readVarInt(p3, var36)
			local _ = var42
			var36 = var43
			continue
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p3, var36)
				var36 = var45
				var35.kind = {
					type = "literal",
					value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.decode(var44)
				}
			elseif var41 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p3, var36)
				var36 = var47
				var35.kind = { type = "binding_path", value = buffer.tostring(var46) }
			elseif var41 == 3 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p3, var36)
				var36 = var49
				var35.kind = {
					type = "conditional",
					value = t.ArrayOfBackgroundLayerProp_ConditionalOptions.decode(var48)
				}
			else
				local _ = nil
				local var50, var51 = protoModule.readVarInt(p3, var36)
				var36 = var51 + var50
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var52, var53 = protoModule.readFixed32(p3, var36)
			local _ = var52
			var36 = var53
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var54, var55 = protoModule.readFixed64(p3, var36)
			local _ = var54
			var36 = var55
		else
			error("Unsupported wire type: " .. var72)
		end
	end
	return var35
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var56 = t_3.new()
	
	if self.literal ~= nil then
		var56.kind = {
			type = "literal",
			value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var56.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var56.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var56.kind = {
			type = "conditional",
			value = t.ArrayOfBackgroundLayerProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var56
end

t_3.descriptor = {
	name = "ArrayOfBackgroundLayerProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfBackgroundLayerProp"
}
t.ArrayOfBackgroundLayerProp = t_3
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		condition = if p4 == nil or p4.condition == nil then nil else p4.condition,
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var56 = 0
	
	if self.condition ~= nil then
		local var57 = self.condition:encode()
		local var58, var59 = protoModule.writeTag(buff, var56, 1, protoModule.wireTypes.lengthDelimited)
		var58, var97 = protoModule.writeBuffer(var58, var59, var57, buffer.len(var57))
		buff = var58
		var56 = var59
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var60 = self.kind.value:encode()
			local var61, var62 = protoModule.writeTag(buff, var56, 2, protoModule.wireTypes.lengthDelimited)
			var61, var100 = protoModule.writeBuffer(var61, var62, var60, buffer.len(var60))
			buff = var61
			var56 = var62
		elseif self.kind.type == "binding_path" then
			local var63, var64 = protoModule.writeTag(buff, var56, 3, protoModule.wireTypes.lengthDelimited)
			var63, var102 = protoModule.writeString(var63, var64, self.kind.value)
			buff = var63
			var56 = var64
		end
	end
	local buff_1 = buffer.create(var56)
	buffer.copy(buff_1, 0, buff, 0, var56)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var56 = t_4.new()
	local var57 = 0
	while var57 < buffer.len(p4) do
		local _ = nil
		local var58 = nil
		local var59, var60, var61 = protoModule.readTag(p4, var57)
		local var62 = var59
		var58 = var60
		var57 = var61
		
		if var58 == protoModule.wireTypes.varint then
			local _ = nil
			local var63, var64 = protoModule.readVarInt(p4, var57)
			local _ = var63
			var57 = var64
			continue
		end
		if var58 == protoModule.wireTypes.lengthDelimited then
			if var62 == 1 then
				local _ = nil
				local var65, var66 = protoModule.readBuffer(p4, var57)
				var57 = var66
				var56.condition = propConditionModule.PropCondition.decode(var65)
			elseif var62 == 2 then
				local _ = nil
				local var67, var68 = protoModule.readBuffer(p4, var57)
				var57 = var68
				var56.kind = {
					type = "literal",
					value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.decode(var67)
				}
			elseif var62 == 3 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p4, var57)
				var57 = var70
				var56.kind = { type = "binding_path", value = buffer.tostring(var69) }
			else
				local _ = nil
				local var71, var72 = protoModule.readVarInt(p4, var57)
				var57 = var72 + var71
			end
		elseif var58 == protoModule.wireTypes.i32 then
			local _ = nil
			local var73, var74 = protoModule.readFixed32(p4, var57)
			local _ = var73
			var57 = var74
		elseif var58 == protoModule.wireTypes.i64 then
			local _ = nil
			local var75, var76 = protoModule.readFixed64(p4, var57)
			local _ = var75
			var57 = var76
		else
			error("Unsupported wire type: " .. var106)
		end
	end
	return var56
end

function t_4:jsonEncode()
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), propConditionModule (ref), t (ref)
	local var77 = t_4.new()
	
	if self.condition ~= nil then
		var77.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var77.kind = {
			type = "literal",
			value = t.ArrayOfBackgroundLayerProp_ArrayOfBackgroundLayer.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var77.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var77.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var77
end

t_4.descriptor = {
	name = "ArrayOfBackgroundLayerProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfBackgroundLayerProp_ConditionalOption = t_4
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp_ConditionalOption)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		options = if p5 == nil or p5.options == nil then {} else p5.options
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var77 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var78 = v:encode()
			local var79, var80 = protoModule.writeTag(buff, var77, 1, protoModule.wireTypes.lengthDelimited)
			var79, var131 = protoModule.writeBuffer(var79, var80, var78, buffer.len(var78))
			buff = var79
			var77 = var80
		end
	end
	local buff_1 = buffer.create(var77)
	buffer.copy(buff_1, 0, buff, 0, var77)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var81 = t_5.new()
	local var82 = 0
	while var82 < buffer.len(p5) do
		local _ = nil
		local var83 = nil
		local var84, var85, var86 = protoModule.readTag(p5, var82)
		local var87 = var84
		var83 = var85
		var82 = var86
		
		if var83 == protoModule.wireTypes.varint then
			local _ = nil
			local var88, var89 = protoModule.readVarInt(p5, var82)
			local _ = var88
			var82 = var89
			continue
		end
		if var83 == protoModule.wireTypes.lengthDelimited then
			if var87 == 1 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p5, var82)
				var82 = var91
				table.insert(var81.options, t.ArrayOfBackgroundLayerProp_ConditionalOption.decode(var90))
			else
				local _ = nil
				local var92, var93 = protoModule.readVarInt(p5, var82)
				var82 = var93 + var92
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var94, var95 = protoModule.readFixed32(p5, var82)
			local _ = var94
			var82 = var95
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var96, var97 = protoModule.readFixed64(p5, var82)
			local _ = var96
			var82 = var97
		else
			error("Unsupported wire type: " .. var135)
		end
	end
	return var81
end

function t_5:jsonEncode()
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var98 = t_5.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfBackgroundLayerProp_ConditionalOption.jsonDecode(v))
		end
		var98.options = t_1
	end
	return var98
end

t_5.descriptor = {
	name = "ArrayOfBackgroundLayerProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfBackgroundLayerProp_ConditionalOptions = t_5
typeRegistryModule.default:register(t.ArrayOfBackgroundLayerProp_ConditionalOptions)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		array = if p6 == nil or p6.array == nil then {} else p6.array
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var99 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var100 = v:encode()
			local var101, var102 = protoModule.writeTag(buff, var99, 1, protoModule.wireTypes.lengthDelimited)
			var101, var158 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var99 = var102
		end
	end
	local buff_1 = buffer.create(var99)
	buffer.copy(buff_1, 0, buff, 0, var99)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var103 = t_6.new()
	local var104 = 0
	while var104 < buffer.len(p6) do
		local _ = nil
		local var105 = nil
		local var106, var107, var108 = protoModule.readTag(p6, var104)
		local var109 = var106
		var105 = var107
		var104 = var108
		
		if var105 == protoModule.wireTypes.varint then
			local _ = nil
			local var110, var111 = protoModule.readVarInt(p6, var104)
			local _ = var110
			var104 = var111
			continue
		end
		if var105 == protoModule.wireTypes.lengthDelimited then
			if var109 == 1 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p6, var104)
				var104 = var113
				table.insert(var103.array, t.BackgroundLayer.decode(var112))
			else
				local _ = nil
				local var114, var115 = protoModule.readVarInt(p6, var104)
				var104 = var115 + var114
			end
		elseif var105 == protoModule.wireTypes.i32 then
			local _ = nil
			local var116, var117 = protoModule.readFixed32(p6, var104)
			local _ = var116
			var104 = var117
		elseif var105 == protoModule.wireTypes.i64 then
			local _ = nil
			local var118, var119 = protoModule.readFixed64(p6, var104)
			local _ = var118
			var104 = var119
		else
			error("Unsupported wire type: " .. var162)
		end
	end
	return var103
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var120 = t_6.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.BackgroundLayer.jsonDecode(v))
		end
		var120.array = t_1
	end
	return var120
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