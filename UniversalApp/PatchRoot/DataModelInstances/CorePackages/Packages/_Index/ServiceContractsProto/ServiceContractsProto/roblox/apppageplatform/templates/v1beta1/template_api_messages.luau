local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local displayLocationModule = require(script.Parent.Parent.Parent.shared.v1beta1.display_location)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: displayLocationModule (ref), t_1 (ref)
	return setmetatable({
		display_location = if p1 == nil or p1.display_location == nil then assert(displayLocationModule.DisplayLocation.fromNumber(0), "Enum has no 0 default") else p1.display_location,
		roblox_component_to_template_id = if p1 == nil or p1.roblox_component_to_template_id == nil then {} else p1.roblox_component_to_template_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: displayLocationModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.display_location ~= nil and (self.display_location ~= nil and self.display_location ~= 0 or self.display_location ~= displayLocationModule.DisplayLocation.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var15 = protoModule.writeVarInt(var2, var3, displayLocationModule.DisplayLocation.toNumber(self.display_location))
		buff = var2
		var1 = var3
	end
	if self.roblox_component_to_template_id ~= nil and next(self.roblox_component_to_template_id) ~= nil then
		for i, v in self.roblox_component_to_template_id do
			local var4, var5 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4, var17 = protoModule.writeString(var4, var5, i)
			var4, var17 = protoModule.writeTag(var4, var5, 2, protoModule.wireTypes.lengthDelimited)
			var4, var17 = protoModule.writeString(var4, var5, v)
			local var6 = var4
			local var7 = var5
			local var8, var9 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var8, var21 = protoModule.writeBuffer(var8, var9, var6, var7)
			buff = var8
			var1 = var9
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), displayLocationModule (ref), t (ref)
	local var10 = t_1.new()
	local var11 = 0
	while var11 < buffer.len(p1) do
		local _ = nil
		local var12 = nil
		local var13, var14, var15 = protoModule.readTag(p1, var11)
		local var16 = var13
		var12 = var14
		var11 = var15
		
		if var12 == protoModule.wireTypes.varint then
			if var16 == 1 then
				local _ = nil
				local var17, var18 = protoModule.readVarIntI32(p1, var11)
				local var19 = var17
				var11 = var18
				var10.display_location = displayLocationModule.DisplayLocation.fromNumber(var19) or var19
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var11)
				local _ = var20
				var11 = var21
			end
		end
		if var12 == protoModule.wireTypes.lengthDelimited then
			if var16 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var11)
				var11 = var23
				var22 = t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry.decode(var22)
				var10.roblox_component_to_template_id[var22.key or ""] = var22.value or ""
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var11)
				var11 = var25 + var24
			end
		elseif var12 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var11)
			local _ = var26
			var11 = var27
		elseif var12 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var11)
			local _ = var28
			var11 = var29
		else
			error("Unsupported wire type: " .. var25)
		end
	end
	return var10
end

function t_1:jsonEncode()
	-- upvalues: displayLocationModule (ref)
	local t = {}
	
	if self.display_location ~= nil and (self.display_location ~= nil and self.display_location ~= 0 or self.display_location ~= displayLocationModule.DisplayLocation.fromNumber(0)) then
		t.displayLocation = if typeof(self.display_location) == "number" then self.display_location else displayLocationModule.DisplayLocation.toNumber(self.display_location)
	end
	if self.roblox_component_to_template_id ~= nil and next(self.roblox_component_to_template_id) ~= nil then
		local t_1 = {}
		
		for i, v in self.roblox_component_to_template_id do
			t_1[i] = v
		end
		t.robloxComponentToTemplateId = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), displayLocationModule (ref)
	local var30 = t_1.new()
	
	if self.display_location ~= nil then
		var30.display_location = if typeof(self.display_location) == "number" then displayLocationModule.DisplayLocation.fromNumber(self.display_location) or self.display_location else displayLocationModule.DisplayLocation.fromName(self.display_location) or self.display_location
	end
	if self.displayLocation ~= nil then
		var30.display_location = if typeof(self.displayLocation) == "number" then displayLocationModule.DisplayLocation.fromNumber(self.displayLocation) or self.displayLocation else displayLocationModule.DisplayLocation.fromName(self.displayLocation) or self.displayLocation
	end
	if self.roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.roblox_component_to_template_id do
			t[i] = v
		end
		var30.roblox_component_to_template_id = t
	end
	if self.robloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.robloxComponentToTemplateId do
			t[i] = v
		end
		var30.roblox_component_to_template_id = t
	end
	return var30
end

t_1.descriptor = {
	name = "DisplayLocationTemplateMapping",
	fullName = "roblox.apppageplatform.templates.v1beta1.DisplayLocationTemplateMapping"
}
t.DisplayLocationTemplateMapping = t_1
typeRegistryModule.default:register(t.DisplayLocationTemplateMapping)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var31 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var31, 1, protoModule.wireTypes.lengthDelimited)
		var32, var51 = protoModule.writeString(var32, var33, self.key)
		buff = var32
		var31 = var33
	end
	if self.value ~= nil and self.value ~= "" then
		local var34, var35 = protoModule.writeTag(buff, var31, 2, protoModule.wireTypes.lengthDelimited)
		var34, var53 = protoModule.writeString(var34, var35, self.value)
		buff = var34
		var31 = var35
	end
	local buff_1 = buffer.create(var31)
	buffer.copy(buff_1, 0, buff, 0, var31)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var31 = t_2.new()
	local var32 = 0
	while var32 < buffer.len(p2) do
		local _ = nil
		local var33 = nil
		local var34, var35, var36 = protoModule.readTag(p2, var32)
		local var37 = var34
		var33 = var35
		var32 = var36
		
		if var33 == protoModule.wireTypes.varint then
			local _ = nil
			local var38, var39 = protoModule.readVarInt(p2, var32)
			local _ = var38
			var32 = var39
			continue
		end
		if var33 == protoModule.wireTypes.lengthDelimited then
			if var37 == 1 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p2, var32)
				var32 = var41
				var31.key = buffer.tostring(var40)
			elseif var37 == 2 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p2, var32)
				var32 = var43
				var31.value = buffer.tostring(var42)
			else
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p2, var32)
				var32 = var45 + var44
			end
		elseif var33 == protoModule.wireTypes.i32 then
			local _ = nil
			local var46, var47 = protoModule.readFixed32(p2, var32)
			local _ = var46
			var32 = var47
		elseif var33 == protoModule.wireTypes.i64 then
			local _ = nil
			local var48, var49 = protoModule.readFixed64(p2, var32)
			local _ = var48
			var32 = var49
		else
			error("Unsupported wire type: " .. var57)
		end
	end
	return var31
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var50 = t_2.new()
	
	if self.key ~= nil then
		var50.key = self.key
	end
	if self.value ~= nil then
		var50.value = self.value
	end
	return var50
end

t_2.descriptor = {
	name = "DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.RobloxComponentToTemplateIdEntry"
}
t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		display_locations = if p3 == nil or p3.display_locations == nil then {} else p3.display_locations,
		client_capabilities = if p3 == nil or p3.client_capabilities == nil then nil else p3.client_capabilities,
		cached_component_mappings = if p3 == nil or p3.cached_component_mappings == nil then {} else p3.cached_component_mappings,
		locale = if p3 == nil or p3.locale == nil then "" else p3.locale
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref), displayLocationModule (ref)
	local buff = buffer.create(0)
	local var50 = 0
	
	if self.display_locations ~= nil and #self.display_locations > 0 then
		for i, v in self.display_locations do
			local var51, var52 = protoModule.writeTag(buff, var50, 1, protoModule.wireTypes.varint)
			var51, var79 = protoModule.writeVarInt(var51, var52, displayLocationModule.DisplayLocation.toNumber(v))
			buff = var51
			var50 = var52
		end
	end
	if self.client_capabilities ~= nil then
		local var53 = self.client_capabilities:encode()
		local var54, var55 = protoModule.writeTag(buff, var50, 2, protoModule.wireTypes.lengthDelimited)
		var54, var82 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
		buff = var54
		var50 = var55
	end
	if self.cached_component_mappings ~= nil and #self.cached_component_mappings > 0 then
		for i, v in self.cached_component_mappings do
			local var56 = v:encode()
			local var57, var58 = protoModule.writeTag(buff, var50, 3, protoModule.wireTypes.lengthDelimited)
			var57, var85 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
			buff = var57
			var50 = var58
		end
	end
	if self.locale ~= nil and self.locale ~= "" then
		local var59, var60 = protoModule.writeTag(buff, var50, 4, protoModule.wireTypes.lengthDelimited)
		var59, var87 = protoModule.writeString(var59, var60, self.locale)
		buff = var59
		var50 = var60
	end
	local buff_1 = buffer.create(var50)
	buffer.copy(buff_1, 0, buff, 0, var50)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), displayLocationModule (ref), clientCapabilitiesModule (ref), t (ref)
	local var61 = t_3.new()
	local var62 = 0
	while var62 < buffer.len(p3) do
		local _ = nil
		local var63 = nil
		local var64, var65, var66 = protoModule.readTag(p3, var62)
		local var67 = var64
		var63 = var65
		var62 = var66
		
		if var63 == protoModule.wireTypes.varint then
			if var67 == 1 then
				local _ = nil
				local var68, var69 = protoModule.readVarIntI32(p3, var62)
				local var70 = var68
				var62 = var69
				table.insert(var61.display_locations, displayLocationModule.DisplayLocation.fromNumber(var70) or var70)
			else
				local _ = nil
				local var71, var72 = protoModule.readVarInt(p3, var62)
				local _ = var71
				var62 = var72
			end
		end
		if var63 == protoModule.wireTypes.lengthDelimited then
			if var67 == 2 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var62)
				var62 = var74
				var61.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var73)
			elseif var67 == 3 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var62)
				var62 = var76
				table.insert(var61.cached_component_mappings, t.DisplayLocationTemplateMapping.decode(var75))
			elseif var67 == 4 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var62)
				var62 = var78
				var61.locale = buffer.tostring(var77)
			else
				local _ = nil
				local var79, var80 = protoModule.readVarInt(p3, var62)
				var62 = var80 + var79
			end
		elseif var63 == protoModule.wireTypes.i32 then
			local _ = nil
			local var81, var82 = protoModule.readFixed32(p3, var62)
			local _ = var81
			var62 = var82
		elseif var63 == protoModule.wireTypes.i64 then
			local _ = nil
			local var83, var84 = protoModule.readFixed64(p3, var62)
			local _ = var83
			var62 = var84
		else
			error("Unsupported wire type: " .. var91)
		end
	end
	return var61
end

function t_3:jsonEncode()
	-- upvalues: displayLocationModule (ref)
	local t = {}
	
	if self.display_locations ~= nil and #self.display_locations > 0 then
		local t_1 = {}
		
		for i, v in self.display_locations do
			table.insert(t_1, if typeof(v) == "number" then v else displayLocationModule.DisplayLocation.toNumber(v))
		end
		t.displayLocations = t_1
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.cached_component_mappings ~= nil and #self.cached_component_mappings > 0 then
		local t_1 = {}
		
		for i, v in self.cached_component_mappings do
			table.insert(t_1, v:jsonEncode())
		end
		t.cachedComponentMappings = t_1
	end
	if self.locale ~= nil and self.locale ~= "" then
		t.locale = self.locale
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), displayLocationModule (ref), clientCapabilitiesModule (ref), t (ref)
	local var85 = t_3.new()
	
	if self.display_locations ~= nil then
		local t_1 = {}
		
		for i, v in self.display_locations do
			table.insert(t_1, if typeof(v) == "number" then displayLocationModule.DisplayLocation.fromNumber(v) or v else displayLocationModule.DisplayLocation.fromName(v) or v)
		end
		var85.display_locations = t_1
	end
	if self.displayLocations ~= nil then
		local t_1 = {}
		
		for i, v in self.displayLocations do
			table.insert(t_1, if typeof(v) == "number" then displayLocationModule.DisplayLocation.fromNumber(v) or v else displayLocationModule.DisplayLocation.fromName(v) or v)
		end
		var85.display_locations = t_1
	end
	if self.client_capabilities ~= nil then
		var85.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var85.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.cached_component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.cached_component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var85.cached_component_mappings = t_1
	end
	if self.cachedComponentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.cachedComponentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var85.cached_component_mappings = t_1
	end
	if self.locale ~= nil then
		var85.locale = self.locale
	end
	return var85
end

t_3.descriptor = {
	name = "GetTemplatesRequest",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesRequest"
}
t.GetTemplatesRequest = t_3
typeRegistryModule.default:register(t.GetTemplatesRequest)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates,
		component_mappings = if p4 == nil or p4.component_mappings == nil then {} else p4.component_mappings,
		valid_cached_component_mappings = if p4 == nil or p4.valid_cached_component_mappings == nil then {} else p4.valid_cached_component_mappings,
		localized_literals = if p4 == nil or p4.localized_literals == nil then {} else p4.localized_literals
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var86 = 0
	
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var87, var88 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var87, var124 = protoModule.writeString(var87, var88, i)
			local var89 = v:encode()
			var88, var126 = protoModule.writeTag(var87, var88, 2, protoModule.wireTypes.lengthDelimited)
			var88, var126 = protoModule.writeBuffer(var88, var126, var89, buffer.len(var89))
			local var90 = var88
			local var91 = var126
			local var92, var93 = protoModule.writeTag(buff, var86, 1, protoModule.wireTypes.lengthDelimited)
			var92, var130 = protoModule.writeBuffer(var92, var93, var90, var91)
			buff = var92
			var86 = var93
		end
	end
	if self.component_mappings ~= nil and #self.component_mappings > 0 then
		for i, v in self.component_mappings do
			local var94 = v:encode()
			local var95, var96 = protoModule.writeTag(buff, var86, 2, protoModule.wireTypes.lengthDelimited)
			var95, var133 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var86 = var96
		end
	end
	if self.valid_cached_component_mappings ~= nil and #self.valid_cached_component_mappings > 0 then
		for i, v in self.valid_cached_component_mappings do
			local var97 = v:encode()
			local var98, var99 = protoModule.writeTag(buff, var86, 3, protoModule.wireTypes.lengthDelimited)
			var98, var136 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var86 = var99
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var100, var101 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var100, var138 = protoModule.writeString(var100, var101, i)
			var100, var138 = protoModule.writeTag(var100, var101, 2, protoModule.wireTypes.lengthDelimited)
			var100, var138 = protoModule.writeString(var100, var101, v)
			local var102 = var100
			local var103 = var101
			local var104, var105 = protoModule.writeTag(buff, var86, 4, protoModule.wireTypes.lengthDelimited)
			var104, var142 = protoModule.writeBuffer(var104, var105, var102, var103)
			buff = var104
			var86 = var105
		end
	end
	local buff_1 = buffer.create(var86)
	buffer.copy(buff_1, 0, buff, 0, var86)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref), templateEntryModule (ref)
	local var106 = t_4.new()
	local var107 = 0
	while var107 < buffer.len(p4) do
		local _ = nil
		local var108 = nil
		local var109, var110, var111 = protoModule.readTag(p4, var107)
		local var112 = var109
		var108 = var110
		var107 = var111
		
		if var108 == protoModule.wireTypes.varint then
			local _ = nil
			local var113, var114 = protoModule.readVarInt(p4, var107)
			local _ = var113
			var107 = var114
			continue
		end
		if var108 == protoModule.wireTypes.lengthDelimited then
			if var112 == 1 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p4, var107)
				var107 = var116
				var115 = t.GetTemplatesResponse_TemplatesEntry.decode(var115)
				var106.templates[var115.key or ""] = var115.value or templateEntryModule.TemplateEntry.new()
			elseif var112 == 2 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p4, var107)
				var107 = var118
				table.insert(var106.component_mappings, t.DisplayLocationTemplateMapping.decode(var117))
			elseif var112 == 3 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p4, var107)
				var107 = var120
				table.insert(var106.valid_cached_component_mappings, t.DisplayLocationTemplateMapping.decode(var119))
			elseif var112 == 4 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p4, var107)
				var107 = var122
				var121 = t.GetTemplatesResponse_LocalizedLiteralsEntry.decode(var121)
				var106.localized_literals[var121.key or ""] = var121.value or ""
			else
				local _ = nil
				local var123, var124 = protoModule.readVarInt(p4, var107)
				var107 = var124 + var123
			end
		elseif var108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var125, var126 = protoModule.readFixed32(p4, var107)
			local _ = var125
			var107 = var126
		elseif var108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var127, var128 = protoModule.readFixed64(p4, var107)
			local _ = var127
			var107 = var128
		else
			error("Unsupported wire type: " .. var146)
		end
	end
	return var106
end

function t_4:jsonEncode()
	local t = {}
	
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.component_mappings ~= nil and #self.component_mappings > 0 then
		local t_1 = {}
		
		for i, v in self.component_mappings do
			table.insert(t_1, v:jsonEncode())
		end
		t.componentMappings = t_1
	end
	if self.valid_cached_component_mappings ~= nil and #self.valid_cached_component_mappings > 0 then
		local t_1 = {}
		
		for i, v in self.valid_cached_component_mappings do
			table.insert(t_1, v:jsonEncode())
		end
		t.validCachedComponentMappings = t_1
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), templateEntryModule (ref), t (ref)
	local var129 = t_4.new()
	
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var129.templates = t_1
	end
	if self.component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var129.component_mappings = t_1
	end
	if self.componentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.componentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var129.component_mappings = t_1
	end
	if self.valid_cached_component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.valid_cached_component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var129.valid_cached_component_mappings = t_1
	end
	if self.validCachedComponentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.validCachedComponentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var129.valid_cached_component_mappings = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var129.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var129.localized_literals = t_1
	end
	return var129
end

t_4.descriptor = {
	name = "GetTemplatesResponse",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesResponse"
}
t.GetTemplatesResponse = t_4
typeRegistryModule.default:register(t.GetTemplatesResponse)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then nil else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var130 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var131, var132 = protoModule.writeTag(buff, var130, 1, protoModule.wireTypes.lengthDelimited)
		var131, var183 = protoModule.writeString(var131, var132, self.key)
		buff = var131
		var130 = var132
	end
	if self.value ~= nil then
		local var133 = self.value:encode()
		local var134, var135 = protoModule.writeTag(buff, var130, 2, protoModule.wireTypes.lengthDelimited)
		var134, var186 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
		buff = var134
		var130 = var135
	end
	local buff_1 = buffer.create(var130)
	buffer.copy(buff_1, 0, buff, 0, var130)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var130 = t_5.new()
	local var131 = 0
	while var131 < buffer.len(p5) do
		local _ = nil
		local var132 = nil
		local var133, var134, var135 = protoModule.readTag(p5, var131)
		local var136 = var133
		var132 = var134
		var131 = var135
		
		if var132 == protoModule.wireTypes.varint then
			local _ = nil
			local var137, var138 = protoModule.readVarInt(p5, var131)
			local _ = var137
			var131 = var138
			continue
		end
		if var132 == protoModule.wireTypes.lengthDelimited then
			if var136 == 1 then
				local _ = nil
				local var139, var140 = protoModule.readBuffer(p5, var131)
				var131 = var140
				var130.key = buffer.tostring(var139)
			elseif var136 == 2 then
				local _ = nil
				local var141, var142 = protoModule.readBuffer(p5, var131)
				var131 = var142
				var130.value = templateEntryModule.TemplateEntry.decode(var141)
			else
				local _ = nil
				local var143, var144 = protoModule.readVarInt(p5, var131)
				var131 = var144 + var143
			end
		elseif var132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var145, var146 = protoModule.readFixed32(p5, var131)
			local _ = var145
			var131 = var146
		elseif var132 == protoModule.wireTypes.i64 then
			local _ = nil
			local var147, var148 = protoModule.readFixed64(p5, var131)
			local _ = var147
			var131 = var148
		else
			error("Unsupported wire type: " .. var190)
		end
	end
	return var130
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), templateEntryModule (ref)
	local var149 = t_5.new()
	
	if self.key ~= nil then
		var149.key = self.key
	end
	if self.value ~= nil then
		var149.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var149
end

t_5.descriptor = {
	name = "GetTemplatesResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.TemplatesEntry"
}
t.GetTemplatesResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.GetTemplatesResponse_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var149 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var150, var151 = protoModule.writeTag(buff, var149, 1, protoModule.wireTypes.lengthDelimited)
		var150, var212 = protoModule.writeString(var150, var151, self.key)
		buff = var150
		var149 = var151
	end
	if self.value ~= nil and self.value ~= "" then
		local var152, var153 = protoModule.writeTag(buff, var149, 2, protoModule.wireTypes.lengthDelimited)
		var152, var214 = protoModule.writeString(var152, var153, self.value)
		buff = var152
		var149 = var153
	end
	local buff_1 = buffer.create(var149)
	buffer.copy(buff_1, 0, buff, 0, var149)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var149 = t_6.new()
	local var150 = 0
	while var150 < buffer.len(p6) do
		local _ = nil
		local var151 = nil
		local var152, var153, var154 = protoModule.readTag(p6, var150)
		local var155 = var152
		var151 = var153
		var150 = var154
		
		if var151 == protoModule.wireTypes.varint then
			local _ = nil
			local var156, var157 = protoModule.readVarInt(p6, var150)
			local _ = var156
			var150 = var157
			continue
		end
		if var151 == protoModule.wireTypes.lengthDelimited then
			if var155 == 1 then
				local _ = nil
				local var158, var159 = protoModule.readBuffer(p6, var150)
				var150 = var159
				var149.key = buffer.tostring(var158)
			elseif var155 == 2 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p6, var150)
				var150 = var161
				var149.value = buffer.tostring(var160)
			else
				local _ = nil
				local var162, var163 = protoModule.readVarInt(p6, var150)
				var150 = var163 + var162
			end
		elseif var151 == protoModule.wireTypes.i32 then
			local _ = nil
			local var164, var165 = protoModule.readFixed32(p6, var150)
			local _ = var164
			var150 = var165
		elseif var151 == protoModule.wireTypes.i64 then
			local _ = nil
			local var166, var167 = protoModule.readFixed64(p6, var150)
			local _ = var166
			var150 = var167
		else
			error("Unsupported wire type: " .. var218)
		end
	end
	return var149
end

function t_6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref)
	local var168 = t_6.new()
	
	if self.key ~= nil then
		var168.key = self.key
	end
	if self.value ~= nil then
		var168.value = self.value
	end
	return var168
end

t_6.descriptor = {
	name = "GetTemplatesResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.LocalizedLiteralsEntry"
}
t.GetTemplatesResponse_LocalizedLiteralsEntry = t_6
typeRegistryModule.default:register(t.GetTemplatesResponse_LocalizedLiteralsEntry)

return {
	DisplayLocationTemplateMapping = t.DisplayLocationTemplateMapping,
	GetTemplatesRequest = t.GetTemplatesRequest,
	GetTemplatesResponse = t.GetTemplatesResponse
}