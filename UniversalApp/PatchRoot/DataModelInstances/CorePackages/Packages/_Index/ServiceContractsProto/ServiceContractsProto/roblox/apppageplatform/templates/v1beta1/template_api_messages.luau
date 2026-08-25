local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local displayLocationModule = require(script.Parent.Parent.Parent.shared.v1beta1.display_location)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: displayLocationModule (ref), t_1 (ref)
	return setmetatable({
		display_location = if p0 == nil or p0.display_location == nil then assert(displayLocationModule.DisplayLocation.fromNumber(0), "Enum has no 0 default") else p0.display_location,
		roblox_component_to_template_id = if p0 == nil or p0.roblox_component_to_template_id == nil then {} else p0.roblox_component_to_template_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: displayLocationModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var13 = 0
	
	if self.display_location ~= nil and (self.display_location ~= nil and self.display_location ~= 0 or self.display_location ~= displayLocationModule.DisplayLocation.fromNumber(0)) then
		local var14, var15 = protoModule.writeTag(buff, var13, 1, protoModule.wireTypes.varint)
		var14, var15 = protoModule.writeVarInt(var14, var15, displayLocationModule.DisplayLocation.toNumber(self.display_location))
		buff = var14
		var13 = var15
	end
	if self.roblox_component_to_template_id ~= nil and next(self.roblox_component_to_template_id) ~= nil then
		for i, v in self.roblox_component_to_template_id do
			local var16, var17 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var16, var17 = protoModule.writeString(var16, var17, i)
			var16, var17 = protoModule.writeTag(var16, var17, 2, protoModule.wireTypes.lengthDelimited)
			var16, var17 = protoModule.writeString(var16, var17, v)
			local var18 = var16
			local var19 = var17
			local var20, var21 = protoModule.writeTag(buff, var13, 2, protoModule.wireTypes.lengthDelimited)
			var20, var21 = protoModule.writeBuffer(var20, var21, var18, var19)
			buff = var20
			var13 = var21
		end
	end
	local buff_1 = buffer.create(var13)
	buffer.copy(buff_1, 0, buff, 0, var13)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), displayLocationModule (ref), t (ref)
	local var23 = t_1.new()
	local var24 = 0
	while var24 < buffer.len(p1) do
		local _ = nil
		local var25 = nil
		local var26, var27, var28 = protoModule.readTag(p1, var24)
		local var29 = var26
		var25 = var27
		var24 = var28
		
		if var25 == protoModule.wireTypes.varint then
			if var29 == 1 then
				local _ = nil
				local var30, var31 = protoModule.readVarIntI32(p1, var24)
				local var32 = var30
				var24 = var31
				var23.display_location = displayLocationModule.DisplayLocation.fromNumber(var32) or var32
			else
				local _ = nil
				local var33, var34 = protoModule.readVarInt(p1, var24)
				local _ = var33
				var24 = var34
			end
		end
		if var25 == protoModule.wireTypes.lengthDelimited then
			if var29 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var24)
				var24 = var36
				var35 = t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry.decode(var35)
				var23.roblox_component_to_template_id[var35.key or ""] = var35.value or ""
			else
				local _ = nil
				local var37, var38 = protoModule.readVarInt(p1, var24)
				var24 = var38 + var37
			end
		elseif var25 == protoModule.wireTypes.i32 then
			local _ = nil
			local var39, var40 = protoModule.readFixed32(p1, var24)
			local _ = var39
			var24 = var40
		elseif var25 == protoModule.wireTypes.i64 then
			local _ = nil
			local var41, var42 = protoModule.readFixed64(p1, var24)
			local _ = var41
			var24 = var42
		else
			error("Unsupported wire type: " .. var25)
		end
	end
	return var23
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
	local var45 = t_1.new()
	
	if self.display_location ~= nil then
		var45.display_location = if typeof(self.display_location) == "number" then displayLocationModule.DisplayLocation.fromNumber(self.display_location) or self.display_location else displayLocationModule.DisplayLocation.fromName(self.display_location) or self.display_location
	end
	if self.displayLocation ~= nil then
		var45.display_location = if typeof(self.displayLocation) == "number" then displayLocationModule.DisplayLocation.fromNumber(self.displayLocation) or self.displayLocation else displayLocationModule.DisplayLocation.fromName(self.displayLocation) or self.displayLocation
	end
	if self.roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.roblox_component_to_template_id do
			t[i] = v
		end
		var45.roblox_component_to_template_id = t
	end
	if self.robloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.robloxComponentToTemplateId do
			t[i] = v
		end
		var45.roblox_component_to_template_id = t
	end
	return var45
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
	local var49 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var50, var51 = protoModule.writeTag(buff, var49, 1, protoModule.wireTypes.lengthDelimited)
		var50, var51 = protoModule.writeString(var50, var51, self.key)
		buff = var50
		var49 = var51
	end
	if self.value ~= nil and self.value ~= "" then
		local var52, var53 = protoModule.writeTag(buff, var49, 2, protoModule.wireTypes.lengthDelimited)
		var52, var53 = protoModule.writeString(var52, var53, self.value)
		buff = var52
		var49 = var53
	end
	local buff_1 = buffer.create(var49)
	buffer.copy(buff_1, 0, buff, 0, var49)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var55 = t_2.new()
	local var56 = 0
	while var56 < buffer.len(p3) do
		local _ = nil
		local var57 = nil
		local var58, var59, var60 = protoModule.readTag(p3, var56)
		local var61 = var58
		var57 = var59
		var56 = var60
		
		if var57 == protoModule.wireTypes.varint then
			local _ = nil
			local var62, var63 = protoModule.readVarInt(p3, var56)
			local _ = var62
			var56 = var63
			continue
		end
		if var57 == protoModule.wireTypes.lengthDelimited then
			if var61 == 1 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p3, var56)
				var56 = var65
				var55.key = buffer.tostring(var64)
			elseif var61 == 2 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p3, var56)
				var56 = var67
				var55.value = buffer.tostring(var66)
			else
				local _ = nil
				local var68, var69 = protoModule.readVarInt(p3, var56)
				var56 = var69 + var68
			end
		elseif var57 == protoModule.wireTypes.i32 then
			local _ = nil
			local var70, var71 = protoModule.readFixed32(p3, var56)
			local _ = var70
			var56 = var71
		elseif var57 == protoModule.wireTypes.i64 then
			local _ = nil
			local var72, var73 = protoModule.readFixed64(p3, var56)
			local _ = var72
			var56 = var73
		else
			error("Unsupported wire type: " .. var57)
		end
	end
	return var55
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
	local var75 = t_2.new()
	
	if self.key ~= nil then
		var75.key = self.key
	end
	if self.value ~= nil then
		var75.value = self.value
	end
	return var75
end

t_2.descriptor = {
	name = "DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.RobloxComponentToTemplateIdEntry"
}
t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		display_locations = if p4 == nil or p4.display_locations == nil then {} else p4.display_locations,
		client_capabilities = if p4 == nil or p4.client_capabilities == nil then nil else p4.client_capabilities,
		cached_component_mappings = if p4 == nil or p4.cached_component_mappings == nil then {} else p4.cached_component_mappings,
		locale = if p4 == nil or p4.locale == nil then "" else p4.locale
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref), displayLocationModule (ref)
	local buff = buffer.create(0)
	local var77 = 0
	
	if self.display_locations ~= nil and #self.display_locations > 0 then
		for i, v in self.display_locations do
			local var78, var79 = protoModule.writeTag(buff, var77, 1, protoModule.wireTypes.varint)
			var78, var79 = protoModule.writeVarInt(var78, var79, displayLocationModule.DisplayLocation.toNumber(v))
			buff = var78
			var77 = var79
		end
	end
	if self.client_capabilities ~= nil then
		local var80 = self.client_capabilities:encode()
		local var81, var82 = protoModule.writeTag(buff, var77, 2, protoModule.wireTypes.lengthDelimited)
		var81, var82 = protoModule.writeBuffer(var81, var82, var80, buffer.len(var80))
		buff = var81
		var77 = var82
	end
	if self.cached_component_mappings ~= nil and #self.cached_component_mappings > 0 then
		for i, v in self.cached_component_mappings do
			local var83 = v:encode()
			local var84, var85 = protoModule.writeTag(buff, var77, 3, protoModule.wireTypes.lengthDelimited)
			var84, var85 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
			buff = var84
			var77 = var85
		end
	end
	if self.locale ~= nil and self.locale ~= "" then
		local var86, var87 = protoModule.writeTag(buff, var77, 4, protoModule.wireTypes.lengthDelimited)
		var86, var87 = protoModule.writeString(var86, var87, self.locale)
		buff = var86
		var77 = var87
	end
	local buff_1 = buffer.create(var77)
	buffer.copy(buff_1, 0, buff, 0, var77)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), displayLocationModule (ref), clientCapabilitiesModule (ref), t (ref)
	local var89 = t_3.new()
	local var90 = 0
	while var90 < buffer.len(p5) do
		local _ = nil
		local var91 = nil
		local var92, var93, var94 = protoModule.readTag(p5, var90)
		local var95 = var92
		var91 = var93
		var90 = var94
		
		if var91 == protoModule.wireTypes.varint then
			if var95 == 1 then
				local _ = nil
				local var96, var97 = protoModule.readVarIntI32(p5, var90)
				local var98 = var96
				var90 = var97
				table.insert(var89.display_locations, displayLocationModule.DisplayLocation.fromNumber(var98) or var98)
			else
				local _ = nil
				local var99, var100 = protoModule.readVarInt(p5, var90)
				local _ = var99
				var90 = var100
			end
		end
		if var91 == protoModule.wireTypes.lengthDelimited then
			if var95 == 2 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p5, var90)
				var90 = var102
				var89.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var101)
			elseif var95 == 3 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p5, var90)
				var90 = var104
				table.insert(var89.cached_component_mappings, t.DisplayLocationTemplateMapping.decode(var103))
			elseif var95 == 4 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p5, var90)
				var90 = var106
				var89.locale = buffer.tostring(var105)
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p5, var90)
				var90 = var108 + var107
			end
		elseif var91 == protoModule.wireTypes.i32 then
			local _ = nil
			local var109, var110 = protoModule.readFixed32(p5, var90)
			local _ = var109
			var90 = var110
		elseif var91 == protoModule.wireTypes.i64 then
			local _ = nil
			local var111, var112 = protoModule.readFixed64(p5, var90)
			local _ = var111
			var90 = var112
		else
			error("Unsupported wire type: " .. var91)
		end
	end
	return var89
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
	local var116 = t_3.new()
	
	if self.display_locations ~= nil then
		local t_1 = {}
		
		for i, v in self.display_locations do
			table.insert(t_1, if typeof(v) == "number" then displayLocationModule.DisplayLocation.fromNumber(v) or v else displayLocationModule.DisplayLocation.fromName(v) or v)
		end
		var116.display_locations = t_1
	end
	if self.displayLocations ~= nil then
		local t_1 = {}
		
		for i, v in self.displayLocations do
			table.insert(t_1, if typeof(v) == "number" then displayLocationModule.DisplayLocation.fromNumber(v) or v else displayLocationModule.DisplayLocation.fromName(v) or v)
		end
		var116.display_locations = t_1
	end
	if self.client_capabilities ~= nil then
		var116.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var116.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.cached_component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.cached_component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var116.cached_component_mappings = t_1
	end
	if self.cachedComponentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.cachedComponentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var116.cached_component_mappings = t_1
	end
	if self.locale ~= nil then
		var116.locale = self.locale
	end
	return var116
end

t_3.descriptor = {
	name = "GetTemplatesRequest",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesRequest"
}
t.GetTemplatesRequest = t_3
typeRegistryModule.default:register(t.GetTemplatesRequest)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		component_mappings = if p6 == nil or p6.component_mappings == nil then {} else p6.component_mappings,
		valid_cached_component_mappings = if p6 == nil or p6.valid_cached_component_mappings == nil then {} else p6.valid_cached_component_mappings,
		localized_literals = if p6 == nil or p6.localized_literals == nil then {} else p6.localized_literals
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var122 = 0
	
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var123, var124 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var123, var124 = protoModule.writeString(var123, var124, i)
			local var125 = v:encode()
			var124, var126 = protoModule.writeTag(var123, var124, 2, protoModule.wireTypes.lengthDelimited)
			var124, var126 = protoModule.writeBuffer(var124, var126, var125, buffer.len(var125))
			local var127 = var124
			local var128 = var126
			local var129, var130 = protoModule.writeTag(buff, var122, 1, protoModule.wireTypes.lengthDelimited)
			var129, var130 = protoModule.writeBuffer(var129, var130, var127, var128)
			buff = var129
			var122 = var130
		end
	end
	if self.component_mappings ~= nil and #self.component_mappings > 0 then
		for i, v in self.component_mappings do
			local var131 = v:encode()
			local var132, var133 = protoModule.writeTag(buff, var122, 2, protoModule.wireTypes.lengthDelimited)
			var132, var133 = protoModule.writeBuffer(var132, var133, var131, buffer.len(var131))
			buff = var132
			var122 = var133
		end
	end
	if self.valid_cached_component_mappings ~= nil and #self.valid_cached_component_mappings > 0 then
		for i, v in self.valid_cached_component_mappings do
			local var134 = v:encode()
			local var135, var136 = protoModule.writeTag(buff, var122, 3, protoModule.wireTypes.lengthDelimited)
			var135, var136 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
			buff = var135
			var122 = var136
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var137, var138 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var137, var138 = protoModule.writeString(var137, var138, i)
			var137, var138 = protoModule.writeTag(var137, var138, 2, protoModule.wireTypes.lengthDelimited)
			var137, var138 = protoModule.writeString(var137, var138, v)
			local var139 = var137
			local var140 = var138
			local var141, var142 = protoModule.writeTag(buff, var122, 4, protoModule.wireTypes.lengthDelimited)
			var141, var142 = protoModule.writeBuffer(var141, var142, var139, var140)
			buff = var141
			var122 = var142
		end
	end
	local buff_1 = buffer.create(var122)
	buffer.copy(buff_1, 0, buff, 0, var122)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref), templateEntryModule (ref)
	local var144 = t_4.new()
	local var145 = 0
	while var145 < buffer.len(p7) do
		local _ = nil
		local var146 = nil
		local var147, var148, var149 = protoModule.readTag(p7, var145)
		local var150 = var147
		var146 = var148
		var145 = var149
		
		if var146 == protoModule.wireTypes.varint then
			local _ = nil
			local var151, var152 = protoModule.readVarInt(p7, var145)
			local _ = var151
			var145 = var152
			continue
		end
		if var146 == protoModule.wireTypes.lengthDelimited then
			if var150 == 1 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p7, var145)
				var145 = var154
				var153 = t.GetTemplatesResponse_TemplatesEntry.decode(var153)
				var144.templates[var153.key or ""] = var153.value or templateEntryModule.TemplateEntry.new()
			elseif var150 == 2 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p7, var145)
				var145 = var156
				table.insert(var144.component_mappings, t.DisplayLocationTemplateMapping.decode(var155))
			elseif var150 == 3 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p7, var145)
				var145 = var158
				table.insert(var144.valid_cached_component_mappings, t.DisplayLocationTemplateMapping.decode(var157))
			elseif var150 == 4 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p7, var145)
				var145 = var160
				var159 = t.GetTemplatesResponse_LocalizedLiteralsEntry.decode(var159)
				var144.localized_literals[var159.key or ""] = var159.value or ""
			else
				local _ = nil
				local var161, var162 = protoModule.readVarInt(p7, var145)
				var145 = var162 + var161
			end
		elseif var146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var163, var164 = protoModule.readFixed32(p7, var145)
			local _ = var163
			var145 = var164
		elseif var146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var165, var166 = protoModule.readFixed64(p7, var145)
			local _ = var165
			var145 = var166
		else
			error("Unsupported wire type: " .. var146)
		end
	end
	return var144
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
	local var172 = t_4.new()
	
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var172.templates = t_1
	end
	if self.component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var172.component_mappings = t_1
	end
	if self.componentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.componentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var172.component_mappings = t_1
	end
	if self.valid_cached_component_mappings ~= nil then
		local t_1 = {}
		
		for i, v in self.valid_cached_component_mappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var172.valid_cached_component_mappings = t_1
	end
	if self.validCachedComponentMappings ~= nil then
		local t_1 = {}
		
		for i, v in self.validCachedComponentMappings do
			table.insert(t_1, t.DisplayLocationTemplateMapping.jsonDecode(v))
		end
		var172.valid_cached_component_mappings = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var172.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var172.localized_literals = t_1
	end
	return var172
end

t_4.descriptor = {
	name = "GetTemplatesResponse",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesResponse"
}
t.GetTemplatesResponse = t_4
typeRegistryModule.default:register(t.GetTemplatesResponse)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var181 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var182, var183 = protoModule.writeTag(buff, var181, 1, protoModule.wireTypes.lengthDelimited)
		var182, var183 = protoModule.writeString(var182, var183, self.key)
		buff = var182
		var181 = var183
	end
	if self.value ~= nil then
		local var184 = self.value:encode()
		local var185, var186 = protoModule.writeTag(buff, var181, 2, protoModule.wireTypes.lengthDelimited)
		var185, var186 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
		buff = var185
		var181 = var186
	end
	local buff_1 = buffer.create(var181)
	buffer.copy(buff_1, 0, buff, 0, var181)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var188 = t_5.new()
	local var189 = 0
	while var189 < buffer.len(p9) do
		local _ = nil
		local var190 = nil
		local var191, var192, var193 = protoModule.readTag(p9, var189)
		local var194 = var191
		var190 = var192
		var189 = var193
		
		if var190 == protoModule.wireTypes.varint then
			local _ = nil
			local var195, var196 = protoModule.readVarInt(p9, var189)
			local _ = var195
			var189 = var196
			continue
		end
		if var190 == protoModule.wireTypes.lengthDelimited then
			if var194 == 1 then
				local _ = nil
				local var197, var198 = protoModule.readBuffer(p9, var189)
				var189 = var198
				var188.key = buffer.tostring(var197)
			elseif var194 == 2 then
				local _ = nil
				local var199, var200 = protoModule.readBuffer(p9, var189)
				var189 = var200
				var188.value = templateEntryModule.TemplateEntry.decode(var199)
			else
				local _ = nil
				local var201, var202 = protoModule.readVarInt(p9, var189)
				var189 = var202 + var201
			end
		elseif var190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var203, var204 = protoModule.readFixed32(p9, var189)
			local _ = var203
			var189 = var204
		elseif var190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var205, var206 = protoModule.readFixed64(p9, var189)
			local _ = var205
			var189 = var206
		else
			error("Unsupported wire type: " .. var190)
		end
	end
	return var188
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
	local var208 = t_5.new()
	
	if self.key ~= nil then
		var208.key = self.key
	end
	if self.value ~= nil then
		var208.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var208
end

t_5.descriptor = {
	name = "GetTemplatesResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.TemplatesEntry"
}
t.GetTemplatesResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.GetTemplatesResponse_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then "" else p10.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var210 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var211, var212 = protoModule.writeTag(buff, var210, 1, protoModule.wireTypes.lengthDelimited)
		var211, var212 = protoModule.writeString(var211, var212, self.key)
		buff = var211
		var210 = var212
	end
	if self.value ~= nil and self.value ~= "" then
		local var213, var214 = protoModule.writeTag(buff, var210, 2, protoModule.wireTypes.lengthDelimited)
		var213, var214 = protoModule.writeString(var213, var214, self.value)
		buff = var213
		var210 = var214
	end
	local buff_1 = buffer.create(var210)
	buffer.copy(buff_1, 0, buff, 0, var210)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var216 = t_6.new()
	local var217 = 0
	while var217 < buffer.len(p11) do
		local _ = nil
		local var218 = nil
		local var219, var220, var221 = protoModule.readTag(p11, var217)
		local var222 = var219
		var218 = var220
		var217 = var221
		
		if var218 == protoModule.wireTypes.varint then
			local _ = nil
			local var223, var224 = protoModule.readVarInt(p11, var217)
			local _ = var223
			var217 = var224
			continue
		end
		if var218 == protoModule.wireTypes.lengthDelimited then
			if var222 == 1 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p11, var217)
				var217 = var226
				var216.key = buffer.tostring(var225)
			elseif var222 == 2 then
				local _ = nil
				local var227, var228 = protoModule.readBuffer(p11, var217)
				var217 = var228
				var216.value = buffer.tostring(var227)
			else
				local _ = nil
				local var229, var230 = protoModule.readVarInt(p11, var217)
				var217 = var230 + var229
			end
		elseif var218 == protoModule.wireTypes.i32 then
			local _ = nil
			local var231, var232 = protoModule.readFixed32(p11, var217)
			local _ = var231
			var217 = var232
		elseif var218 == protoModule.wireTypes.i64 then
			local _ = nil
			local var233, var234 = protoModule.readFixed64(p11, var217)
			local _ = var233
			var217 = var234
		else
			error("Unsupported wire type: " .. var218)
		end
	end
	return var216
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
	local var236 = t_6.new()
	
	if self.key ~= nil then
		var236.key = self.key
	end
	if self.value ~= nil then
		var236.value = self.value
	end
	return var236
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