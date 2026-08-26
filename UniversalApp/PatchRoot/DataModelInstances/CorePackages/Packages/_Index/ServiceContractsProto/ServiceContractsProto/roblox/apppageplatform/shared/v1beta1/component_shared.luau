local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local uiComponentTypeModule = require(script.Parent.ui_component_type)
local analyticsDataModule = require(script.Parent.analytics_data)
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		hidden = if p1 == nil or p1.hidden == nil then nil else p1.hidden,
		label = if p1 == nil or p1.label == nil then nil else p1.label
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.hidden ~= nil then
		local var2 = self.hidden:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var14 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.label ~= nil then
		local var5 = self.label:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var17 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
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
				var1.hidden = propTypesModule.BoolProp.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.label = propTypesModule.StringProp.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.hidden ~= nil then
		t.hidden = self.hidden:jsonEncode()
	end
	if self.label ~= nil then
		t.label = self.label:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), propTypesModule (ref)
	local var20 = t_1.new()
	
	if self.hidden ~= nil then
		var20.hidden = propTypesModule.BoolProp.jsonDecode(self.hidden)
	end
	if self.label ~= nil then
		var20.label = propTypesModule.StringProp.jsonDecode(self.label)
	end
	return var20
end

t_1.descriptor = {
	name = "AccessibilityProps",
	fullName = "roblox.apppageplatform.shared.v1beta1.AccessibilityProps"
}
t.AccessibilityProps = t_1
typeRegistryModule.default:register(t.AccessibilityProps)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: uiComponentTypeModule (ref), t_2 (ref)
	return setmetatable({
		component_type = if p2 == nil or p2.component_type == nil then assert(uiComponentTypeModule.UiComponentType.fromNumber(0), "Enum has no 0 default") else p2.component_type,
		data = if p2 == nil or p2.data == nil then {} else p2.data,
		analytics_data = if p2 == nil or p2.analytics_data == nil then {} else p2.analytics_data,
		is_component_filtered = if p2 == nil or p2.is_component_filtered == nil then nil else p2.is_component_filtered,
		accessibility = if p2 == nil or p2.accessibility == nil then nil else p2.accessibility
	}, t_2)
end

function t_2:encode()
	-- upvalues: uiComponentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var20 = 0
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= uiComponentTypeModule.UiComponentType.fromNumber(0)) then
		local var21, var22 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.varint)
		var21, var43 = protoModule.writeVarInt(var21, var22, uiComponentTypeModule.UiComponentType.toNumber(self.component_type))
		buff = var21
		var20 = var22
	end
	if self.data ~= nil and #self.data > 0 then
		for i, v in self.data do
			local var23 = v:encode()
			local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
			var24, var46 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var20 = var25
		end
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		for i, v in self.analytics_data do
			local var26, var27 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var26, var48 = protoModule.writeString(var26, var27, i)
			local var28 = v:encode()
			var27, var50 = protoModule.writeTag(var26, var27, 2, protoModule.wireTypes.lengthDelimited)
			var27, var50 = protoModule.writeBuffer(var27, var50, var28, buffer.len(var28))
			local var29 = var27
			local var30 = var50
			local var31, var32 = protoModule.writeTag(buff, var20, 3, protoModule.wireTypes.lengthDelimited)
			var31, var54 = protoModule.writeBuffer(var31, var32, var29, var30)
			buff = var31
			var20 = var32
		end
	end
	if self.is_component_filtered ~= nil then
		local var33 = self.is_component_filtered:encode()
		local var34, var35 = protoModule.writeTag(buff, var20, 4, protoModule.wireTypes.lengthDelimited)
		var34, var57 = protoModule.writeBuffer(var34, var35, var33, buffer.len(var33))
		buff = var34
		var20 = var35
	end
	if self.accessibility ~= nil then
		local var36 = self.accessibility:encode()
		local var37, var38 = protoModule.writeTag(buff, var20, 5, protoModule.wireTypes.lengthDelimited)
		var37, var60 = protoModule.writeBuffer(var37, var38, var36, buffer.len(var36))
		buff = var37
		var20 = var38
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), t (ref), analyticsDataModule (ref), propTypesModule (ref)
	local var39 = t_2.new()
	local var40 = 0
	while var40 < buffer.len(p2) do
		local _ = nil
		local var41 = nil
		local var42, var43, var44 = protoModule.readTag(p2, var40)
		local var45 = var42
		var41 = var43
		var40 = var44
		
		if var41 == protoModule.wireTypes.varint then
			if var45 == 1 then
				local _ = nil
				local var46, var47 = protoModule.readVarIntI32(p2, var40)
				local var48 = var46
				var40 = var47
				var39.component_type = uiComponentTypeModule.UiComponentType.fromNumber(var48) or var48
			else
				local _ = nil
				local var49, var50 = protoModule.readVarInt(p2, var40)
				local _ = var49
				var40 = var50
			end
		end
		if var41 == protoModule.wireTypes.lengthDelimited then
			if var45 == 2 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var40)
				var40 = var52
				table.insert(var39.data, hydrationDataSpecModule.HydrationDataSpec.decode(var51))
			elseif var45 == 3 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p2, var40)
				var40 = var54
				var53 = t.ComponentShared_AnalyticsDataEntry.decode(var53)
				var39.analytics_data[var53.key or ""] = var53.value or analyticsDataModule.AnalyticsDataField.new()
			elseif var45 == 4 then
				local _ = nil
				local var55, var56 = protoModule.readBuffer(p2, var40)
				var40 = var56
				var39.is_component_filtered = propTypesModule.BoolProp.decode(var55)
			elseif var45 == 5 then
				local _ = nil
				local var57, var58 = protoModule.readBuffer(p2, var40)
				var40 = var58
				var39.accessibility = t.AccessibilityProps.decode(var57)
			else
				local _ = nil
				local var59, var60 = protoModule.readVarInt(p2, var40)
				var40 = var60 + var59
			end
		elseif var41 == protoModule.wireTypes.i32 then
			local _ = nil
			local var61, var62 = protoModule.readFixed32(p2, var40)
			local _ = var61
			var40 = var62
		elseif var41 == protoModule.wireTypes.i64 then
			local _ = nil
			local var63, var64 = protoModule.readFixed64(p2, var40)
			local _ = var63
			var40 = var64
		else
			error("Unsupported wire type: " .. var64)
		end
	end
	return var39
end

function t_2:jsonEncode()
	-- upvalues: uiComponentTypeModule (ref)
	local t = {}
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= uiComponentTypeModule.UiComponentType.fromNumber(0)) then
		t.componentType = if typeof(self.component_type) == "number" then self.component_type else uiComponentTypeModule.UiComponentType.toNumber(self.component_type)
	end
	if self.data ~= nil and #self.data > 0 then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, v:jsonEncode())
		end
		t.data = t_1
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		local t_1 = {}
		
		for i, v in self.analytics_data do
			t_1[i] = v:jsonEncode()
		end
		t.analyticsData = t_1
	end
	if self.is_component_filtered ~= nil then
		t.isComponentFiltered = self.is_component_filtered:jsonEncode()
	end
	if self.accessibility ~= nil then
		t.accessibility = self.accessibility:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), analyticsDataModule (ref), propTypesModule (ref), t (ref)
	local var65 = t_2.new()
	
	if self.component_type ~= nil then
		var65.component_type = if typeof(self.component_type) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.component_type) or self.component_type else uiComponentTypeModule.UiComponentType.fromName(self.component_type) or self.component_type
	end
	if self.componentType ~= nil then
		var65.component_type = if typeof(self.componentType) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.componentType) or self.componentType else uiComponentTypeModule.UiComponentType.fromName(self.componentType) or self.componentType
	end
	if self.data ~= nil then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var65.data = t_1
	end
	if self.analytics_data ~= nil then
		local t_1 = {}
		
		for i, v in self.analytics_data do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var65.analytics_data = t_1
	end
	if self.analyticsData ~= nil then
		local t_1 = {}
		
		for i, v in self.analyticsData do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var65.analytics_data = t_1
	end
	if self.is_component_filtered ~= nil then
		var65.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.is_component_filtered)
	end
	if self.isComponentFiltered ~= nil then
		var65.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.isComponentFiltered)
	end
	if self.accessibility ~= nil then
		var65.accessibility = t.AccessibilityProps.jsonDecode(self.accessibility)
	end
	return var65
end

t_2.descriptor = {
	name = "ComponentShared",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComponentShared"
}
t.ComponentShared = t_2
typeRegistryModule.default:register(t.ComponentShared)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var66 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var66, 1, protoModule.wireTypes.lengthDelimited)
		var67, var98 = protoModule.writeString(var67, var68, self.key)
		buff = var67
		var66 = var68
	end
	if self.value ~= nil then
		local var69 = self.value:encode()
		local var70, var71 = protoModule.writeTag(buff, var66, 2, protoModule.wireTypes.lengthDelimited)
		var70, var101 = protoModule.writeBuffer(var70, var71, var69, buffer.len(var69))
		buff = var70
		var66 = var71
	end
	local buff_1 = buffer.create(var66)
	buffer.copy(buff_1, 0, buff, 0, var66)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), analyticsDataModule (ref)
	local var66 = t_3.new()
	local var67 = 0
	while var67 < buffer.len(p3) do
		local _ = nil
		local var68 = nil
		local var69, var70, var71 = protoModule.readTag(p3, var67)
		local var72 = var69
		var68 = var70
		var67 = var71
		
		if var68 == protoModule.wireTypes.varint then
			local _ = nil
			local var73, var74 = protoModule.readVarInt(p3, var67)
			local _ = var73
			var67 = var74
			continue
		end
		if var68 == protoModule.wireTypes.lengthDelimited then
			if var72 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var67)
				var67 = var76
				var66.key = buffer.tostring(var75)
			elseif var72 == 2 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var67)
				var67 = var78
				var66.value = analyticsDataModule.AnalyticsDataField.decode(var77)
			else
				local _ = nil
				local var79, var80 = protoModule.readVarInt(p3, var67)
				var67 = var80 + var79
			end
		elseif var68 == protoModule.wireTypes.i32 then
			local _ = nil
			local var81, var82 = protoModule.readFixed32(p3, var67)
			local _ = var81
			var67 = var82
		elseif var68 == protoModule.wireTypes.i64 then
			local _ = nil
			local var83, var84 = protoModule.readFixed64(p3, var67)
			local _ = var83
			var67 = var84
		else
			error("Unsupported wire type: " .. var105)
		end
	end
	return var66
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), analyticsDataModule (ref)
	local var85 = t_3.new()
	
	if self.key ~= nil then
		var85.key = self.key
	end
	if self.value ~= nil then
		var85.value = analyticsDataModule.AnalyticsDataField.jsonDecode(self.value)
	end
	return var85
end

t_3.descriptor = {
	name = "ComponentShared_AnalyticsDataEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsDataEntry"
}
t.ComponentShared_AnalyticsDataEntry = t_3
typeRegistryModule.default:register(t.ComponentShared_AnalyticsDataEntry)

return {
	AccessibilityProps = t.AccessibilityProps,
	ComponentShared = t.ComponentShared
}