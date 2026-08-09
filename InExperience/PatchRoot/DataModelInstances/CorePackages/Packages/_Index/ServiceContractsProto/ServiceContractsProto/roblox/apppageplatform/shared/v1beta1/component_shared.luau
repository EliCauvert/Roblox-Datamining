local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local uiComponentTypeModule = require(script.Parent.ui_component_type)
local analyticsDataModule = require(script.Parent.analytics_data)
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 104 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		hidden = if p0 == nil or p0.hidden == nil then nil else p0.hidden
	}, t_1)
end

function t_1:encode() --[[ line: 110 ]]
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
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 125 ]]
	-- upvalues: t_1 (ref), protoModule (ref), propTypesModule (ref)
	local var16 = t_1.new()
	local var17 = 0
	while var17 < buffer.len(p1) do
		local _ = nil
		local var18 = nil
		local var19, var20, var21 = protoModule.readTag(p1, var17)
		local var22 = var19
		var18 = var20
		var17 = var21
		
		if var18 == protoModule.wireTypes.varint then
			local _ = nil
			local var23, var24 = protoModule.readVarInt(p1, var17)
			local _ = var23
			var17 = var24
			continue
		end
		if var18 == protoModule.wireTypes.lengthDelimited then
			if var22 == 1 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var17)
				var17 = var26
				var16.hidden = propTypesModule.BoolProp.decode(var25)
			else
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p1, var17)
				var17 = var28 + var27
			end
		elseif var18 == protoModule.wireTypes.i32 then
			local _ = nil
			local var29, var30 = protoModule.readFixed32(p1, var17)
			local _ = var29
			var17 = var30
		elseif var18 == protoModule.wireTypes.i64 then
			local _ = nil
			local var31, var32 = protoModule.readFixed64(p1, var17)
			local _ = var31
			var17 = var32
		else
			error("Unsupported wire type: " .. var18)
		end
	end
	return var16
end

function t_1:jsonEncode() --[[ line: 168 ]]
	local t = {}
	
	if self.hidden ~= nil then
		t.hidden = self.hidden:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 178 ]]
	-- upvalues: t_1 (ref), propTypesModule (ref)
	local var34 = t_1.new()
	
	if self.hidden ~= nil then
		var34.hidden = propTypesModule.BoolProp.jsonDecode(self.hidden)
	end
	return var34
end

t_1.descriptor = {
	name = "AccessibilityProps",
	fullName = "roblox.apppageplatform.shared.v1beta1.AccessibilityProps"
}
t.AccessibilityProps = t_1
typeRegistryModule.default:register(t.AccessibilityProps)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 202 ]]
	-- upvalues: uiComponentTypeModule (ref), t_2 (ref)
	return setmetatable({
		component_type = if p2 == nil or p2.component_type == nil then assert(uiComponentTypeModule.UiComponentType.fromNumber(0), "Enum has no 0 default") else p2.component_type,
		data = if p2 == nil or p2.data == nil then {} else p2.data,
		analytics_data = if p2 == nil or p2.analytics_data == nil then {} else p2.analytics_data,
		is_component_filtered = if p2 == nil or p2.is_component_filtered == nil then nil else p2.is_component_filtered,
		accessibility = if p2 == nil or p2.accessibility == nil then nil else p2.accessibility
	}, t_2)
end

function t_2:encode() --[[ line: 219 ]]
	-- upvalues: uiComponentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var36 = 0
	
	if self.component_type ~= nil and (self.component_type ~= nil and self.component_type ~= 0 or self.component_type ~= uiComponentTypeModule.UiComponentType.fromNumber(0)) then
		local var37, var38 = protoModule.writeTag(buff, var36, 1, protoModule.wireTypes.varint)
		var37, var38 = protoModule.writeVarInt(var37, var38, uiComponentTypeModule.UiComponentType.toNumber(self.component_type))
		buff = var37
		var36 = var38
	end
	if self.data ~= nil and #self.data > 0 then
		for i, v in self.data do
			local var39 = v:encode()
			local var40, var41 = protoModule.writeTag(buff, var36, 2, protoModule.wireTypes.lengthDelimited)
			var40, var41 = protoModule.writeBuffer(var40, var41, var39, buffer.len(var39))
			buff = var40
			var36 = var41
		end
	end
	if self.analytics_data ~= nil and next(self.analytics_data) ~= nil then
		for i, v in self.analytics_data do
			local var42, var43 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var42, var43 = protoModule.writeString(var42, var43, i)
			local var44 = v:encode()
			var43, var45 = protoModule.writeTag(var42, var43, 2, protoModule.wireTypes.lengthDelimited)
			var43, var45 = protoModule.writeBuffer(var43, var45, var44, buffer.len(var44))
			local var46 = var43
			local var47 = var45
			local var48, var49 = protoModule.writeTag(buff, var36, 3, protoModule.wireTypes.lengthDelimited)
			var48, var49 = protoModule.writeBuffer(var48, var49, var46, var47)
			buff = var48
			var36 = var49
		end
	end
	if self.is_component_filtered ~= nil then
		local var50 = self.is_component_filtered:encode()
		local var51, var52 = protoModule.writeTag(buff, var36, 4, protoModule.wireTypes.lengthDelimited)
		var51, var52 = protoModule.writeBuffer(var51, var52, var50, buffer.len(var50))
		buff = var51
		var36 = var52
	end
	if self.accessibility ~= nil then
		local var53 = self.accessibility:encode()
		local var54, var55 = protoModule.writeTag(buff, var36, 5, protoModule.wireTypes.lengthDelimited)
		var54, var55 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
		buff = var54
		var36 = var55
	end
	local buff_1 = buffer.create(var36)
	buffer.copy(buff_1, 0, buff, 0, var36)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 280 ]]
	-- upvalues: t_2 (ref), protoModule (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), t (ref), analyticsDataModule (ref), propTypesModule (ref)
	local var57 = t_2.new()
	local var58 = 0
	while var58 < buffer.len(p3) do
		local _ = nil
		local var59 = nil
		local var60, var61, var62 = protoModule.readTag(p3, var58)
		local var63 = var60
		var59 = var61
		var58 = var62
		
		if var59 == protoModule.wireTypes.varint then
			if var63 == 1 then
				local _ = nil
				local var64, var65 = protoModule.readVarIntI32(p3, var58)
				local var66 = var64
				var58 = var65
				var57.component_type = uiComponentTypeModule.UiComponentType.fromNumber(var66) or var66
			else
				local _ = nil
				local var67, var68 = protoModule.readVarInt(p3, var58)
				local _ = var67
				var58 = var68
			end
		end
		if var59 == protoModule.wireTypes.lengthDelimited then
			if var63 == 2 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p3, var58)
				var58 = var70
				table.insert(var57.data, hydrationDataSpecModule.HydrationDataSpec.decode(var69))
			elseif var63 == 3 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var58)
				var58 = var72
				var71 = t.ComponentShared_AnalyticsDataEntry.decode(var71)
				var57.analytics_data[var71.key or ""] = var71.value or analyticsDataModule.AnalyticsDataField.new()
			elseif var63 == 4 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var58)
				var58 = var74
				var57.is_component_filtered = propTypesModule.BoolProp.decode(var73)
			elseif var63 == 5 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var58)
				var58 = var76
				var57.accessibility = t.AccessibilityProps.decode(var75)
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p3, var58)
				var58 = var78 + var77
			end
		elseif var59 == protoModule.wireTypes.i32 then
			local _ = nil
			local var79, var80 = protoModule.readFixed32(p3, var58)
			local _ = var79
			var58 = var80
		elseif var59 == protoModule.wireTypes.i64 then
			local _ = nil
			local var81, var82 = protoModule.readFixed64(p3, var58)
			local _ = var81
			var58 = var82
		else
			error("Unsupported wire type: " .. var59)
		end
	end
	return var57
end

function t_2:jsonEncode() --[[ line: 357 ]]
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

function t_2:jsonDecode() --[[ line: 402 ]]
	-- upvalues: t_2 (ref), uiComponentTypeModule (ref), hydrationDataSpecModule (ref), analyticsDataModule (ref), propTypesModule (ref), t (ref)
	local var86 = t_2.new()
	
	if self.component_type ~= nil then
		var86.component_type = if typeof(self.component_type) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.component_type) or self.component_type else uiComponentTypeModule.UiComponentType.fromName(self.component_type) or self.component_type
	end
	if self.componentType ~= nil then
		var86.component_type = if typeof(self.componentType) == "number" then uiComponentTypeModule.UiComponentType.fromNumber(self.componentType) or self.componentType else uiComponentTypeModule.UiComponentType.fromName(self.componentType) or self.componentType
	end
	if self.data ~= nil then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var86.data = t_1
	end
	if self.analytics_data ~= nil then
		local t_1 = {}
		
		for i, v in self.analytics_data do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var86.analytics_data = t_1
	end
	if self.analyticsData ~= nil then
		local t_1 = {}
		
		for i, v in self.analyticsData do
			t_1[i] = analyticsDataModule.AnalyticsDataField.jsonDecode(v)
		end
		var86.analytics_data = t_1
	end
	if self.is_component_filtered ~= nil then
		var86.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.is_component_filtered)
	end
	if self.isComponentFiltered ~= nil then
		var86.is_component_filtered = propTypesModule.BoolProp.jsonDecode(self.isComponentFiltered)
	end
	if self.accessibility ~= nil then
		var86.accessibility = t.AccessibilityProps.jsonDecode(self.accessibility)
	end
	return var86
end

t_2.descriptor = {
	name = "ComponentShared",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComponentShared"
}
t.ComponentShared = t_2
typeRegistryModule.default:register(t.ComponentShared)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 488 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 497 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var91 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var92, var93 = protoModule.writeTag(buff, var91, 1, protoModule.wireTypes.lengthDelimited)
		var92, var93 = protoModule.writeString(var92, var93, self.key)
		buff = var92
		var91 = var93
	end
	if self.value ~= nil then
		local var94 = self.value:encode()
		local var95, var96 = protoModule.writeTag(buff, var91, 2, protoModule.wireTypes.lengthDelimited)
		var95, var96 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
		buff = var95
		var91 = var96
	end
	local buff_1 = buffer.create(var91)
	buffer.copy(buff_1, 0, buff, 0, var91)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 517 ]]
	-- upvalues: t_3 (ref), protoModule (ref), analyticsDataModule (ref)
	local var98 = t_3.new()
	local var99 = 0
	while var99 < buffer.len(p5) do
		local _ = nil
		local var100 = nil
		local var101, var102, var103 = protoModule.readTag(p5, var99)
		local var104 = var101
		var100 = var102
		var99 = var103
		
		if var100 == protoModule.wireTypes.varint then
			local _ = nil
			local var105, var106 = protoModule.readVarInt(p5, var99)
			local _ = var105
			var99 = var106
			continue
		end
		if var100 == protoModule.wireTypes.lengthDelimited then
			if var104 == 1 then
				local _ = nil
				local var107, var108 = protoModule.readBuffer(p5, var99)
				var99 = var108
				var98.key = buffer.tostring(var107)
			elseif var104 == 2 then
				local _ = nil
				local var109, var110 = protoModule.readBuffer(p5, var99)
				var99 = var110
				var98.value = analyticsDataModule.AnalyticsDataField.decode(var109)
			else
				local _ = nil
				local var111, var112 = protoModule.readVarInt(p5, var99)
				var99 = var112 + var111
			end
		elseif var100 == protoModule.wireTypes.i32 then
			local _ = nil
			local var113, var114 = protoModule.readFixed32(p5, var99)
			local _ = var113
			var99 = var114
		elseif var100 == protoModule.wireTypes.i64 then
			local _ = nil
			local var115, var116 = protoModule.readFixed64(p5, var99)
			local _ = var115
			var99 = var116
		else
			error("Unsupported wire type: " .. var100)
		end
	end
	return var98
end

function t_3:jsonEncode() --[[ line: 565 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 579 ]]
	-- upvalues: t_3 (ref), analyticsDataModule (ref)
	local var118 = t_3.new()
	
	if self.key ~= nil then
		var118.key = self.key
	end
	if self.value ~= nil then
		var118.value = analyticsDataModule.AnalyticsDataField.jsonDecode(self.value)
	end
	return var118
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