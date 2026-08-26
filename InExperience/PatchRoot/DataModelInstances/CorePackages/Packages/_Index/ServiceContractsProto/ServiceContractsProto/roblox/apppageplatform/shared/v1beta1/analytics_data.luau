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
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "binding_path" then
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var2, var10 = protoModule.writeString(var2, var3, self.kind.value)
			buff = var2
			var1 = var3
		elseif self.kind.type == "literal" then
			local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var4, var12 = protoModule.writeString(var4, var5, self.kind.value)
			buff = var4
			var1 = var5
		elseif self.kind.type == "conditional" then
			local var6 = self.kind.value:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var15 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
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
				var1.kind = { type = "binding_path", value = buffer.tostring(var10) }
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "literal", value = buffer.tostring(var12) }
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = {
					type = "conditional",
					value = t.AnalyticsDataField_ConditionalOptions.decode(var14)
				}
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var22 = t_1.new()
	
	if self.binding_path ~= nil then
		var22.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var22.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.literal ~= nil then
		var22.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var22.kind = {
			type = "conditional",
			value = t.AnalyticsDataField_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var22
end

t_1.descriptor = {
	name = "AnalyticsDataField",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataField"
}
t.AnalyticsDataField = t_1
typeRegistryModule.default:register(t.AnalyticsDataField)
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
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var22 = 0
	
	if self.condition ~= nil then
		local var23 = self.condition:encode()
		local var24, var25 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
		var24, var44 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var22 = var25
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var26, var27 = protoModule.writeTag(buff, var22, 2, protoModule.wireTypes.lengthDelimited)
			var26, var46 = protoModule.writeString(var26, var27, self.kind.value)
			buff = var26
			var22 = var27
		elseif self.kind.type == "binding_path" then
			local var28, var29 = protoModule.writeTag(buff, var22, 3, protoModule.wireTypes.lengthDelimited)
			var28, var48 = protoModule.writeString(var28, var29, self.kind.value)
			buff = var28
			var22 = var29
		end
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), propConditionModule (ref)
	local var22 = t_2.new()
	local var23 = 0
	while var23 < buffer.len(p2) do
		local _ = nil
		local var24 = nil
		local var25, var26, var27 = protoModule.readTag(p2, var23)
		local var28 = var25
		var24 = var26
		var23 = var27
		
		if var24 == protoModule.wireTypes.varint then
			local _ = nil
			local var29, var30 = protoModule.readVarInt(p2, var23)
			local _ = var29
			var23 = var30
			continue
		end
		if var24 == protoModule.wireTypes.lengthDelimited then
			if var28 == 1 then
				local _ = nil
				local var31, var32 = protoModule.readBuffer(p2, var23)
				var23 = var32
				var22.condition = propConditionModule.PropCondition.decode(var31)
			elseif var28 == 2 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p2, var23)
				var23 = var34
				var22.kind = { type = "literal", value = buffer.tostring(var33) }
			elseif var28 == 3 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p2, var23)
				var23 = var36
				var22.kind = { type = "binding_path", value = buffer.tostring(var35) }
			else
				local _ = nil
				local var37, var38 = protoModule.readVarInt(p2, var23)
				var23 = var38 + var37
			end
		elseif var24 == protoModule.wireTypes.i32 then
			local _ = nil
			local var39, var40 = protoModule.readFixed32(p2, var23)
			local _ = var39
			var23 = var40
		elseif var24 == protoModule.wireTypes.i64 then
			local _ = nil
			local var41, var42 = protoModule.readFixed64(p2, var23)
			local _ = var41
			var23 = var42
		else
			error("Unsupported wire type: " .. var52)
		end
	end
	return var22
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), propConditionModule (ref)
	local var43 = t_2.new()
	
	if self.condition ~= nil then
		var43.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var43.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var43.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var43.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var43
end

t_2.descriptor = {
	name = "AnalyticsDataField_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.AnalyticsDataField_ConditionalOption = t_2
typeRegistryModule.default:register(t.AnalyticsDataField_ConditionalOption)
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
	local var43 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var44 = v:encode()
			local var45, var46 = protoModule.writeTag(buff, var43, 1, protoModule.wireTypes.lengthDelimited)
			var45, var77 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var43 = var46
		end
	end
	local buff_1 = buffer.create(var43)
	buffer.copy(buff_1, 0, buff, 0, var43)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var47 = t_3.new()
	local var48 = 0
	while var48 < buffer.len(p3) do
		local _ = nil
		local var49 = nil
		local var50, var51, var52 = protoModule.readTag(p3, var48)
		local var53 = var50
		var49 = var51
		var48 = var52
		
		if var49 == protoModule.wireTypes.varint then
			local _ = nil
			local var54, var55 = protoModule.readVarInt(p3, var48)
			local _ = var54
			var48 = var55
			continue
		end
		if var49 == protoModule.wireTypes.lengthDelimited then
			if var53 == 1 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p3, var48)
				var48 = var57
				table.insert(var47.options, t.AnalyticsDataField_ConditionalOption.decode(var56))
			else
				local _ = nil
				local var58, var59 = protoModule.readVarInt(p3, var48)
				var48 = var59 + var58
			end
		elseif var49 == protoModule.wireTypes.i32 then
			local _ = nil
			local var60, var61 = protoModule.readFixed32(p3, var48)
			local _ = var60
			var48 = var61
		elseif var49 == protoModule.wireTypes.i64 then
			local _ = nil
			local var62, var63 = protoModule.readFixed64(p3, var48)
			local _ = var62
			var48 = var63
		else
			error("Unsupported wire type: " .. var81)
		end
	end
	return var47
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
	local var64 = t_3.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.AnalyticsDataField_ConditionalOption.jsonDecode(v))
		end
		var64.options = t_1
	end
	return var64
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