local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local uiComponentTypeModule = require(script.Parent.ui_component_type)
local analyticsDataModule = require(script.Parent.analytics_data)
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 106 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		hidden = if p0 == nil or p0.hidden == nil then nil else p0.hidden,
		label = if p0 == nil or p0.label == nil then nil else p0.label
	}, t_1)
end

function t_1:encode() --[[ line: 113 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.hidden ~= nil then
		local var12 = self.hidden:encode()
		local var13, var14 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var13, var14 = protoModule.writeBuffer(var13, var14, var12, buffer.len(var12))
		buff = var13
		var11 = var14
	end
	if self.label ~= nil then
		local var15 = self.label:encode()
		local var16, var17 = protoModule.writeTag(buff, var11, 2, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeBuffer(var16, var17, var15, buffer.len(var15))
		buff = var16
		var11 = var17
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 134 ]]
	-- upvalues: t_1 (ref), protoModule (ref), propTypesModule (ref)
	local var19 = t_1.new()
	local var20 = 0
	while var20 < buffer.len(p1) do
		local _ = nil
		local var21 = nil
		local var22, var23, var24 = protoModule.readTag(p1, var20)
		local var25 = var22
		var21 = var23
		var20 = var24
		
		if var21 == protoModule.wireTypes.varint then
			local _ = nil
			local var26, var27 = protoModule.readVarInt(p1, var20)
			local _ = var26
			var20 = var27
			continue
		end
		if var21 == protoModule.wireTypes.lengthDelimited then
			if var25 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var20)
				var20 = var29
				var19.hidden = propTypesModule.BoolProp.decode(var28)
			elseif var25 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var20)
				var20 = var31
				var19.label = propTypesModule.StringProp.decode(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var20)
				var20 = var33 + var32
			end
		elseif var21 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var20)
			local _ = var34
			var20 = var35
		elseif var21 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var20)
			local _ = var36
			var20 = var37
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var19
end

function t_1:jsonEncode() --[[ line: 182 ]]
	local t = {}
	
	if self.hidden ~= nil then
		t.hidden = self.hidden:jsonEncode()
	end
	if self.label ~= nil then
		t.label = self.label:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 196 ]]
	-- upvalues: t_1 (ref), propTypesModule (ref)
	local var39 = t_1.new()
	
	if self.hidden ~= nil then
		var39.hidden = propTypesModule.BoolProp.jsonDecode(self.hidden)
	end
	if self.label ~= nil then
		var39.label = propTypesModule.StringProp.jsonDecode(self.label)
	end
	return var39
end

t_1.descriptor = {
	name = "AccessibilityProps",
	fullName = "roblox.apppageplatform.shared.v1beta1.AccessibilityProps"
}
t.AccessibilityProps = t_1
typeRegistryModule.default:register(t.AccessibilityProps)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 224 ]]
	-- upvalues: uiComponentTypeModule (ref), t_2 (ref)
	return setmetatable({
		component_type = if p2 == nil or p2.component_type == nil then assert(uiComponentTypeModule.UiComponentType.fromNumber(0), "Enum has no 0 default") else p2.component_type,
		data = if p2 == nil or p2.data == nil then {} else p2.data,
		analytics_data = if p2 == nil or p2.analytics_data == nil then {} else p2.analytics_data,
		is_component_filtered = if p2 == nil or p2.is_component_filtered == nil then nil else p2.is_component_filtered,
		accessibility = if p2 == nil or p2.accessibility == nil then nil else p2.accessibility
	}, t_2)
end

function t_2:encode() --[[ line: 241 ]]
	-- upvalues: uiComponentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var41 = 0
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= uiComponentTypeModule.UiComponentType.fromNumber(0)) then
		local var42, var43 = protoModule.writeTag(buff, var41, 1, protoModule.wireTypes.varint)
		var42, var43 = protoModule.writeVarInt(var42, var43, uiComponentTypeModule.UiComponentType.toNumber(self.component_type))
		buff = var42
		var41 = var43
	end
	if self.data ~= nil and #self.data > 0 then
		for i, v in self.data do
			local var44 = v:encode()
			local var45, var46 = protoModule.writeTag(buff, var41, 2, protoModule.wireTypes.lengthDelimited)
			var45, var46 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var41 = var46
		end
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		for i, v in self.analytics_data do
			local var47, var48 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var47, var48 = protoModule.writeString(var47, var48, i)
			local var49 = v:encode()
			var48, var50 = protoModule.writeTag(var47, var48, 2, protoModule.wireTypes.lengthDelimited)
			var48, var50 = protoModule.writeBuffer(var48, var50, var49, buffer.len(var49))
			local var51 = var48
			local var52 = var50
			local var53, var54 = protoModule.writeTag(buff, var41, 3, protoModule.wireTypes.lengthDelimited)
			var53, var54 = protoModule.writeBuffer(var53, var54, var51, var52)
			buff = var53
			var41 = var54
		end
	end
	if self.is_component_filtered ~= nil then
		local var55 = self.is_component_filtered:encode()
		local var56, var57 = protoModule.writeTag(buff, var41, 4, protoModule.wireTypes.lengthDelimited)
		var56, var57 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
		buff = var56
		var41 = var57
	end
	if self.accessibility ~= nil then
		local var58 = self.accessibility:encode()
		local var59, var60 = protoModule.writeTag(buff, var41, 5, protoModule.wireTypes.lengthDelimited)
		var59, var60 = protoModule.writeBuffer(var59, var60, var58, buffer.len(var58))
		buff = var59
		var41 = var60
	end
	local buff_1 = buffer.create(var41)
	buffer.copy(buff_1, 0, buff, 0, var41)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 302 ]]
	-- upvalues: t_2 (ref), protoModule (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), t (ref), analyticsDataModule (ref), propTypesModule (ref)
	local var62 = t_2.new()
	local var63 = 0
	while var63 < buffer.len(p3) do
		local _ = nil
		local var64 = nil
		local var65, var66, var67 = protoModule.readTag(p3, var63)
		local var68 = var65
		var64 = var66
		var63 = var67
		
		if var64 == protoModule.wireTypes.varint then
			if var68 == 1 then
				local _ = nil
				local var69, var70 = protoModule.readVarIntI32(p3, var63)
				local var71 = var69
				var63 = var70
				var62.component_type = uiComponentTypeModule.UiComponentType.fromNumber(var71) or var71
			else
				local _ = nil
				local var72, var73 = protoModule.readVarInt(p3, var63)
				local _ = var72
				var63 = var73
			end
		end
		if var64 == protoModule.wireTypes.lengthDelimited then
			if var68 == 2 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p3, var63)
				var63 = var75
				table.insert(var62.data, hydrationDataSpecModule.HydrationDataSpec.decode(var74))
			elseif var68 == 3 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p3, var63)
				var63 = var77
				var76 = t.ComponentShared_AnalyticsDataEntry.decode(var76)
				var62.analytics_data[var76.key or ""] = var76.value or analyticsDataModule.AnalyticsDataField.new()
			elseif var68 == 4 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var63)
				var63 = var79
				var62.is_component_filtered = propTypesModule.BoolProp.decode(var78)
			elseif var68 == 5 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var63)
				var63 = var81
				var62.accessibility = t.AccessibilityProps.decode(var80)
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p3, var63)
				var63 = var83 + var82
			end
		elseif var64 == protoModule.wireTypes.i32 then
			local _ = nil
			local var84, var85 = protoModule.readFixed32(p3, var63)
			local _ = var84
			var63 = var85
		elseif var64 == protoModule.wireTypes.i64 then
			local _ = nil
			local var86, var87 = protoModule.readFixed64(p3, var63)
			local _ = var86
			var63 = var87
		else
			error("Unsupported wire type: " .. var64)
		end
	end
	return var62
end

function t_2:jsonEncode() --[[ line: 379 ]]
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

function t_2:jsonDecode() --[[ line: 424 ]]
	-- upvalues: t_2 (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), analyticsDataModule (ref), propTypesModule (ref), t (ref)
	local var91 = t_2.new()
	
	if self.component_type ~= nil then
		var91.component_type = if typeof(self.component_type) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.component_type) or self.component_type else uiComponentTypeModule.UiComponentType.fromName(self.component_type) or self.component_type
	end
	if self.componentType ~= nil then
		var91.component_type = if typeof(self.componentType) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.componentType) or self.componentType else uiComponentTypeModule.UiComponentType.fromName(self.componentType) or self.componentType
	end
	if self.data ~= nil then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var91.data = t_1
	end
	if self.analytics_data ~= nil then
		local t_1 = {}
		
		for i, v in self.analytics_data do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var91.analytics_data = t_1
	end
	if self.analyticsData ~= nil then
		local t_1 = {}
		
		for i, v in self.analyticsData do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var91.analytics_data = t_1
	end
	if self.is_component_filtered ~= nil then
		var91.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.is_component_filtered)
	end
	if self.isComponentFiltered ~= nil then
		var91.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.isComponentFiltered)
	end
	if self.accessibility ~= nil then
		var91.accessibility = t.AccessibilityProps.jsonDecode(self.accessibility)
	end
	return var91
end

t_2.descriptor = {
	name = "ComponentShared",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComponentShared"
}
t.ComponentShared = t_2
typeRegistryModule.default:register(t.ComponentShared)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 510 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 519 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var96 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var97, var98 = protoModule.writeTag(buff, var96, 1, protoModule.wireTypes.lengthDelimited)
		var97, var98 = protoModule.writeString(var97, var98, self.key)
		buff = var97
		var96 = var98
	end
	if self.value ~= nil then
		local var99 = self.value:encode()
		local var100, var101 = protoModule.writeTag(buff, var96, 2, protoModule.wireTypes.lengthDelimited)
		var100, var101 = protoModule.writeBuffer(var100, var101, var99, buffer.len(var99))
		buff = var100
		var96 = var101
	end
	local buff_1 = buffer.create(var96)
	buffer.copy(buff_1, 0, buff, 0, var96)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 539 ]]
	-- upvalues: t_3 (ref), protoModule (ref), analyticsDataModule (ref)
	local var103 = t_3.new()
	local var104 = 0
	while var104 < buffer.len(p5) do
		local _ = nil
		local var105 = nil
		local var106, var107, var108 = protoModule.readTag(p5, var104)
		local var109 = var106
		var105 = var107
		var104 = var108
		
		if var105 == protoModule.wireTypes.varint then
			local _ = nil
			local var110, var111 = protoModule.readVarInt(p5, var104)
			local _ = var110
			var104 = var111
			continue
		end
		if var105 == protoModule.wireTypes.lengthDelimited then
			if var109 == 1 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p5, var104)
				var104 = var113
				var103.key = buffer.tostring(var112)
			elseif var109 == 2 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p5, var104)
				var104 = var115
				var103.value = analyticsDataModule.AnalyticsDataField.decode(var114)
			else
				local _ = nil
				local var116, var117 = protoModule.readVarInt(p5, var104)
				var104 = var117 + var116
			end
		elseif var105 == protoModule.wireTypes.i32 then
			local _ = nil
			local var118, var119 = protoModule.readFixed32(p5, var104)
			local _ = var118
			var104 = var119
		elseif var105 == protoModule.wireTypes.i64 then
			local _ = nil
			local var120, var121 = protoModule.readFixed64(p5, var104)
			local _ = var120
			var104 = var121
		else
			error("Unsupported wire type: " .. var105)
		end
	end
	return var103
end

function t_3:jsonEncode() --[[ line: 587 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 601 ]]
	-- upvalues: t_3 (ref), analyticsDataModule (ref)
	local var123 = t_3.new()
	
	if self.key ~= nil then
		var123.key = self.key
	end
	if self.value ~= nil then
		var123.value = analyticsDataModule.AnalyticsDataField.jsonDecode(self.value)
	end
	return var123
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