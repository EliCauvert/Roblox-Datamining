-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:29 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 107 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p0 == nil or p0.kind == nil then nil else p0.kind
	}, t_1)
end

function t_1:encode() --[[ line: 113 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var8 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var9, var10 = protoModule.writeTag(buff, var8, 1, protoModule.wireTypes.lengthDelimited)
			var9, var10 = protoModule.writeString(var9, var10, self.kind.value)
			buff = var9
			var8 = var10
		elseif self.kind.type == "literal" then
			local var11, var12 = protoModule.writeTag(buff, var8, 2, protoModule.wireTypes.lengthDelimited)
			var11, var12 = protoModule.writeString(var11, var12, self.kind.value)
			buff = var11
			var8 = var12
		elseif self.kind.type == "conditional" then
			local var13 = self.kind.value:encode()
			local var14, var15 = protoModule.writeTag(buff, var8, 3, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
			buff = var14
			var8 = var15
		end
	end
	local buff_1 = buffer.create(var8)
	buffer.copy(buff_1, 0, buff, 0, var8)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 136 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local var19 = nil
		local var20, var21, var22 = protoModule.readTag(p1, var18)
		local var23 = var20
		var19 = var21
		var18 = var22
		
		if var19 == protoModule.wireTypes.varint then
			local _ = nil
			local var24, var25 = protoModule.readVarInt(p1, var18)
			local _ = var24
			var18 = var25
			continue
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 1 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var18)
				var18 = var27
				var17.kind = { type = "binding_path", value = buffer.tostring(var26) }
			elseif var23 == 2 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var18)
				var18 = var29
				var17.kind = { type = "literal", value = buffer.tostring(var28) }
			elseif var23 == 3 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var18)
				var18 = var31
				var17.kind = {
					type = "conditional",
					value = t.AnalyticsDataField_ConditionalOptions.decode(var30)
				}
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var18)
				var18 = var33 + var32
			end
		elseif var19 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var18)
			local _ = var34
			var18 = var35
		elseif var19 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var18)
			local _ = var36
			var18 = var37
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var17
end

function t_1:jsonEncode() --[[ line: 190 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_1:jsonDecode() --[[ line: 206 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var39 = t_1.new()
	
	if self.binding_path ~= nil then
		var39.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var39.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var39.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var39.kind = {
			type = "conditional",
			value = t.AnalyticsDataField_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var39
end

t_1.descriptor = {
	name = "AnalyticsDataField",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataField"
}
t.AnalyticsDataField = t_1
typeRegistryModule.default:register(t.AnalyticsDataField)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 245 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		condition = if p2 == nil or p2.condition == nil then nil else p2.condition,
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode() --[[ line: 254 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var41 = 0
	
	if self.condition ~= nil then
		local var42 = self.condition:encode()
		local var43, var44 = protoModule.writeTag(buff, var41, 1, protoModule.wireTypes.lengthDelimited)
		var43, var44 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var41 = var44
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var45, var46 = protoModule.writeTag(buff, var41, 2, protoModule.wireTypes.lengthDelimited)
			var45, var46 = protoModule.writeString(var45, var46, self.kind.value)
			buff = var45
			var41 = var46
		elseif self.kind.type == "binding_path" then
			local var47, var48 = protoModule.writeTag(buff, var41, 3, protoModule.wireTypes.lengthDelimited)
			var47, var48 = protoModule.writeString(var47, var48, self.kind.value)
			buff = var47
			var41 = var48
		end
	end
	local buff_1 = buffer.create(var41)
	buffer.copy(buff_1, 0, buff, 0, var41)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 279 ]]
	-- upvalues: t_2 (ref), protoModule (ref), propConditionModule (ref)
	local var50 = t_2.new()
	local var51 = 0
	while var51 < buffer.len(p3) do
		local _ = nil
		local var52 = nil
		local var53, var54, var55 = protoModule.readTag(p3, var51)
		local var56 = var53
		var52 = var54
		var51 = var55
		
		if var52 == protoModule.wireTypes.varint then
			local _ = nil
			local var57, var58 = protoModule.readVarInt(p3, var51)
			local _ = var57
			var51 = var58
			continue
		end
		if var52 == protoModule.wireTypes.lengthDelimited then
			if var56 == 1 then
				local _ = nil
				local var59, var60 = protoModule.readBuffer(p3, var51)
				var51 = var60
				var50.condition = propConditionModule.PropCondition.decode(var59)
			elseif var56 == 2 then
				local _ = nil
				local var61, var62 = protoModule.readBuffer(p3, var51)
				var51 = var62
				var50.kind = { type = "literal", value = buffer.tostring(var61) }
			elseif var56 == 3 then
				local _ = nil
				local var63, var64 = protoModule.readBuffer(p3, var51)
				var51 = var64
				var50.kind = { type = "binding_path", value = buffer.tostring(var63) }
			else
				local _ = nil
				local var65, var66 = protoModule.readVarInt(p3, var51)
				var51 = var66 + var65
			end
		elseif var52 == protoModule.wireTypes.i32 then
			local _ = nil
			local var67, var68 = protoModule.readFixed32(p3, var51)
			local _ = var67
			var51 = var68
		elseif var52 == protoModule.wireTypes.i64 then
			local _ = nil
			local var69, var70 = protoModule.readFixed64(p3, var51)
			local _ = var69
			var51 = var70
		else
			error("Unsupported wire type: " .. var52)
		end
	end
	return var50
end

function t_2:jsonEncode() --[[ line: 332 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_2:jsonDecode() --[[ line: 350 ]]
	-- upvalues: t_2 (ref), propConditionModule (ref)
	local var72 = t_2.new()
	
	if self.condition ~= nil then
		var72.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var72.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var72.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var72.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var72
end

t_2.descriptor = {
	name = "AnalyticsDataField_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.AnalyticsDataField_ConditionalOption = t_2
typeRegistryModule.default:register(t.AnalyticsDataField_ConditionalOption)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 389 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		options = if p4 == nil or p4.options == nil then {} else p4.options
	}, t_3)
end

function t_3:encode() --[[ line: 397 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var74 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var75 = v:encode()
			local var76, var77 = protoModule.writeTag(buff, var74, 1, protoModule.wireTypes.lengthDelimited)
			var76, var77 = protoModule.writeBuffer(var76, var77, var75, buffer.len(var75))
			buff = var76
			var74 = var77
		end
	end
	local buff_1 = buffer.create(var74)
	buffer.copy(buff_1, 0, buff, 0, var74)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 414 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var79 = t_3.new()
	local var80 = 0
	while var80 < buffer.len(p5) do
		local _ = nil
		local var81 = nil
		local var82, var83, var84 = protoModule.readTag(p5, var80)
		local var85 = var82
		var81 = var83
		var80 = var84
		
		if var81 == protoModule.wireTypes.varint then
			local _ = nil
			local var86, var87 = protoModule.readVarInt(p5, var80)
			local _ = var86
			var80 = var87
			continue
		end
		if var81 == protoModule.wireTypes.lengthDelimited then
			if var85 == 1 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p5, var80)
				var80 = var89
				table.insert(var79.options, t.AnalyticsDataField_ConditionalOption.decode(var88))
			else
				local _ = nil
				local var90, var91 = protoModule.readVarInt(p5, var80)
				var80 = var91 + var90
			end
		elseif var81 == protoModule.wireTypes.i32 then
			local _ = nil
			local var92, var93 = protoModule.readFixed32(p5, var80)
			local _ = var92
			var80 = var93
		elseif var81 == protoModule.wireTypes.i64 then
			local _ = nil
			local var94, var95 = protoModule.readFixed64(p5, var80)
			local _ = var94
			var80 = var95
		else
			error("Unsupported wire type: " .. var81)
		end
	end
	return var79
end

function t_3:jsonEncode() --[[ line: 457 ]]
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

function t_3:jsonDecode() --[[ line: 471 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var98 = t_3.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.AnalyticsDataField_ConditionalOption.jsonDecode(v))
		end
		var98.options = t_1
	end
	return var98
end

t_3.descriptor = {
	name = "AnalyticsDataField_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.AnalyticsDataField_ConditionalOptions = t_3
typeRegistryModule.default:register(t.AnalyticsDataField_ConditionalOptions)

return {
	AnalyticsDataField = t.AnalyticsDataField,
	AnalyticsDataField_ConditionalOption = t.AnalyticsDataField_ConditionalOption,
	AnalyticsDataField_ConditionalOptions = t.AnalyticsDataField_ConditionalOptions
}