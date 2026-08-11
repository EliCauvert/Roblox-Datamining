local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 206 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		session_id = if p0 == nil or p0.session_id == nil then "" else p0.session_id,
		topic_ids = if p0 == nil or p0.topic_ids == nil then {} else p0.topic_ids,
		contextual_features = if p0 == nil or p0.contextual_features == nil then {} else p0.contextual_features,
		cached_roblox_component_to_template_id = if p0 == nil or p0.cached_roblox_component_to_template_id == nil then {} else p0.cached_roblox_component_to_template_id,
		client_capabilities = if p0 == nil or p0.client_capabilities == nil then nil else p0.client_capabilities
	}, t_1)
end

function t_1:encode() --[[ line: 223 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var14 = 0
	
	if self.session_id ~= nil and self.session_id ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var14, 1, protoModule.wireTypes.lengthDelimited)
		var15, var16 = protoModule.writeString(var15, var16, self.session_id)
		buff = var15
		var14 = var16
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		for i, v in self.topic_ids do
			local var17, var18 = protoModule.writeTag(buff, var14, 2, protoModule.wireTypes.lengthDelimited)
			var17, var18 = protoModule.writeString(var17, var18, v)
			buff = var17
			var14 = var18
		end
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		for i, v in self.contextual_features do
			local var19, var20 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var19, var20 = protoModule.writeString(var19, var20, i)
			var19, var20 = protoModule.writeTag(var19, var20, 2, protoModule.wireTypes.lengthDelimited)
			var19, var20 = protoModule.writeString(var19, var20, v)
			local var21 = var19
			local var22 = var20
			local var23, var24 = protoModule.writeTag(buff, var14, 3, protoModule.wireTypes.lengthDelimited)
			var23, var24 = protoModule.writeBuffer(var23, var24, var21, var22)
			buff = var23
			var14 = var24
		end
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var25, var26 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var25, var26 = protoModule.writeString(var25, var26, i)
			var25, var26 = protoModule.writeTag(var25, var26, 2, protoModule.wireTypes.lengthDelimited)
			var25, var26 = protoModule.writeString(var25, var26, v)
			local var27 = var25
			local var28 = var26
			local var29, var30 = protoModule.writeTag(buff, var14, 4, protoModule.wireTypes.lengthDelimited)
			var29, var30 = protoModule.writeBuffer(var29, var30, var27, var28)
			buff = var29
			var14 = var30
		end
	end
	if self.client_capabilities ~= nil then
		local var31 = self.client_capabilities:encode()
		local var32, var33 = protoModule.writeTag(buff, var14, 5, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
		buff = var32
		var14 = var33
	end
	local buff_1 = buffer.create(var14)
	buffer.copy(buff_1, 0, buff, 0, var14)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 279 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var35 = t_1.new()
	local var36 = 0
	while var36 < buffer.len(p1) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p1, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			local _ = nil
			local var42, var43 = protoModule.readVarInt(p1, var36)
			local _ = var42
			var36 = var43
			continue
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var36)
				var36 = var45
				var35.session_id = buffer.tostring(var44)
			elseif var41 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var36)
				var36 = var47
				table.insert(var35.topic_ids, buffer.tostring(var46))
			elseif var41 == 3 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var36)
				var36 = var49
				var48 = t.HomePageRequest_ContextualFeaturesEntry.decode(var48)
				var35.contextual_features[var48.key or ""] = var48.value or ""
			elseif var41 == 4 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var36)
				var36 = var51
				var50 = t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var50)
				var35.cached_roblox_component_to_template_id[var50.key or ""] = var50.value or ""
			elseif var41 == 5 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var36)
				var36 = var53
				var35.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var52)
			else
				local _ = nil
				local var54, var55 = protoModule.readVarInt(p1, var36)
				var36 = var55 + var54
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var56, var57 = protoModule.readFixed32(p1, var36)
			local _ = var56
			var36 = var57
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var58, var59 = protoModule.readFixed64(p1, var36)
			local _ = var58
			var36 = var59
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var35
end

function t_1:jsonEncode() --[[ line: 358 ]]
	local t = {}
	
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		local t_1 = {}
		
		for i, v in self.topic_ids do
			table.insert(t_1, v)
		end
		t.topicIds = t_1
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		local t_1 = {}
		
		for i, v in self.contextual_features do
			t_1[i] = v
		end
		t.contextualFeatures = t_1
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local t_1 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_1[i] = v
		end
		t.cachedRobloxComponentToTemplateId = t_1
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 399 ]]
	-- upvalues: t_1 (ref), clientCapabilitiesModule (ref)
	local var64 = t_1.new()
	
	if self.session_id ~= nil then
		var64.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var64.session_id = self.sessionId
	end
	if self.topic_ids ~= nil then
		local t = {}
		
		for i, v in self.topic_ids do
			table.insert(t, v)
		end
		var64.topic_ids = t
	end
	if self.topicIds ~= nil then
		local t = {}
		
		for i, v in self.topicIds do
			table.insert(t, v)
		end
		var64.topic_ids = t
	end
	if self.contextual_features ~= nil then
		local t = {}
		
		for i, v in self.contextual_features do
			t[i] = v
		end
		var64.contextual_features = t
	end
	if self.contextualFeatures ~= nil then
		local t = {}
		
		for i, v in self.contextualFeatures do
			t[i] = v
		end
		var64.contextual_features = t
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var64.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var64.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var64.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var64.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var64
end

t_1.descriptor = {
	name = "HomePageRequest",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageRequest"
}
t.HomePageRequest = t_1
typeRegistryModule.default:register(t.HomePageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 495 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 504 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var72 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var73, var74 = protoModule.writeTag(buff, var72, 1, protoModule.wireTypes.lengthDelimited)
		var73, var74 = protoModule.writeString(var73, var74, self.key)
		buff = var73
		var72 = var74
	end
	if self.value ~= nil and self.value ~= "" then
		local var75, var76 = protoModule.writeTag(buff, var72, 2, protoModule.wireTypes.lengthDelimited)
		var75, var76 = protoModule.writeString(var75, var76, self.value)
		buff = var75
		var72 = var76
	end
	local buff_1 = buffer.create(var72)
	buffer.copy(buff_1, 0, buff, 0, var72)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 523 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var78 = t_2.new()
	local var79 = 0
	while var79 < buffer.len(p3) do
		local _ = nil
		local var80 = nil
		local var81, var82, var83 = protoModule.readTag(p3, var79)
		local var84 = var81
		var80 = var82
		var79 = var83
		
		if var80 == protoModule.wireTypes.varint then
			local _ = nil
			local var85, var86 = protoModule.readVarInt(p3, var79)
			local _ = var85
			var79 = var86
			continue
		end
		if var80 == protoModule.wireTypes.lengthDelimited then
			if var84 == 1 then
				local _ = nil
				local var87, var88 = protoModule.readBuffer(p3, var79)
				var79 = var88
				var78.key = buffer.tostring(var87)
			elseif var84 == 2 then
				local _ = nil
				local var89, var90 = protoModule.readBuffer(p3, var79)
				var79 = var90
				var78.value = buffer.tostring(var89)
			else
				local _ = nil
				local var91, var92 = protoModule.readVarInt(p3, var79)
				var79 = var92 + var91
			end
		elseif var80 == protoModule.wireTypes.i32 then
			local _ = nil
			local var93, var94 = protoModule.readFixed32(p3, var79)
			local _ = var93
			var79 = var94
		elseif var80 == protoModule.wireTypes.i64 then
			local _ = nil
			local var95, var96 = protoModule.readFixed64(p3, var79)
			local _ = var95
			var79 = var96
		else
			error("Unsupported wire type: " .. var80)
		end
	end
	return var78
end

function t_2:jsonEncode() --[[ line: 571 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode() --[[ line: 585 ]]
	-- upvalues: t_2 (ref)
	local var98 = t_2.new()
	
	if self.key ~= nil then
		var98.key = self.key
	end
	if self.value ~= nil then
		var98.value = self.value
	end
	return var98
end

t_2.descriptor = {
	name = "HomePageRequest_ContextualFeaturesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ContextualFeaturesEntry"
}
t.HomePageRequest_ContextualFeaturesEntry = t_2
typeRegistryModule.default:register(t.HomePageRequest_ContextualFeaturesEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 616 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then "" else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 628 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var100 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var101, var102 = protoModule.writeTag(buff, var100, 1, protoModule.wireTypes.lengthDelimited)
		var101, var102 = protoModule.writeString(var101, var102, self.key)
		buff = var101
		var100 = var102
	end
	if self.value ~= nil and self.value ~= "" then
		local var103, var104 = protoModule.writeTag(buff, var100, 2, protoModule.wireTypes.lengthDelimited)
		var103, var104 = protoModule.writeString(var103, var104, self.value)
		buff = var103
		var100 = var104
	end
	local buff_1 = buffer.create(var100)
	buffer.copy(buff_1, 0, buff, 0, var100)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 649 ]]
	-- upvalues: t_3 (ref), protoModule (ref)
	local var106 = t_3.new()
	local var107 = 0
	while var107 < buffer.len(p5) do
		local _ = nil
		local var108 = nil
		local var109, var110, var111 = protoModule.readTag(p5, var107)
		local var112 = var109
		var108 = var110
		var107 = var111
		
		if var108 == protoModule.wireTypes.varint then
			local _ = nil
			local var113, var114 = protoModule.readVarInt(p5, var107)
			local _ = var113
			var107 = var114
			continue
		end
		if var108 == protoModule.wireTypes.lengthDelimited then
			if var112 == 1 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p5, var107)
				var107 = var116
				var106.key = buffer.tostring(var115)
			elseif var112 == 2 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p5, var107)
				var107 = var118
				var106.value = buffer.tostring(var117)
			else
				local _ = nil
				local var119, var120 = protoModule.readVarInt(p5, var107)
				var107 = var120 + var119
			end
		elseif var108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var121, var122 = protoModule.readFixed32(p5, var107)
			local _ = var121
			var107 = var122
		elseif var108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var123, var124 = protoModule.readFixed64(p5, var107)
			local _ = var123
			var107 = var124
		else
			error("Unsupported wire type: " .. var108)
		end
	end
	return var106
end

function t_3:jsonEncode() --[[ line: 699 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode() --[[ line: 715 ]]
	-- upvalues: t_3 (ref)
	local var126 = t_3.new()
	
	if self.key ~= nil then
		var126.key = self.key
	end
	if self.value ~= nil then
		var126.value = self.value
	end
	return var126
end

t_3.descriptor = {
	name = "HomePageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry = t_3
typeRegistryModule.default:register(t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 746 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		localized_literals = if p6 == nil or p6.localized_literals == nil then {} else p6.localized_literals
	}, t_4)
end

function t_4:encode() --[[ line: 755 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var128 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var129 = v:encode()
			local var130, var131 = protoModule.writeTag(buff, var128, 1, protoModule.wireTypes.lengthDelimited)
			var130, var131 = protoModule.writeBuffer(var130, var131, var129, buffer.len(var129))
			buff = var130
			var128 = var131
		end
	end
	if self.hydration_data ~= nil then
		local var132 = self.hydration_data:encode()
		local var133, var134 = protoModule.writeTag(buff, var128, 2, protoModule.wireTypes.lengthDelimited)
		var133, var134 = protoModule.writeBuffer(var133, var134, var132, buffer.len(var132))
		buff = var133
		var128 = var134
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var135, var136 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var135, var136 = protoModule.writeString(var135, var136, i)
			local var137 = v:encode()
			var136, var138 = protoModule.writeTag(var135, var136, 2, protoModule.wireTypes.lengthDelimited)
			var136, var138 = protoModule.writeBuffer(var136, var138, var137, buffer.len(var137))
			local var139 = var136
			local var140 = var138
			local var141, var142 = protoModule.writeTag(buff, var128, 3, protoModule.wireTypes.lengthDelimited)
			var141, var142 = protoModule.writeBuffer(var141, var142, var139, var140)
			buff = var141
			var128 = var142
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var143, var144 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var143, var144 = protoModule.writeString(var143, var144, i)
			var143, var144 = protoModule.writeTag(var143, var144, 2, protoModule.wireTypes.lengthDelimited)
			var143, var144 = protoModule.writeString(var143, var144, v)
			local var145 = var143
			local var146 = var144
			local var147, var148 = protoModule.writeTag(buff, var128, 4, protoModule.wireTypes.lengthDelimited)
			var147, var148 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var128 = var148
		end
	end
	local buff_1 = buffer.create(var128)
	buffer.copy(buff_1, 0, buff, 0, var128)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 805 ]]
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var150 = t_4.new()
	local var151 = 0
	while var151 < buffer.len(p7) do
		local _ = nil
		local var152 = nil
		local var153, var154, var155 = protoModule.readTag(p7, var151)
		local var156 = var153
		var152 = var154
		var151 = var155
		
		if var152 == protoModule.wireTypes.varint then
			local _ = nil
			local var157, var158 = protoModule.readVarInt(p7, var151)
			local _ = var157
			var151 = var158
			continue
		end
		if var152 == protoModule.wireTypes.lengthDelimited then
			if var156 == 1 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p7, var151)
				var151 = var160
				table.insert(var150.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var159))
			elseif var156 == 2 then
				local _ = nil
				local var161, var162 = protoModule.readBuffer(p7, var151)
				var151 = var162
				var150.hydration_data = hydrationContentModule.HydrationContent.decode(var161)
			elseif var156 == 3 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p7, var151)
				var151 = var164
				var163 = t.HomePageResponse_TemplatesEntry.decode(var163)
				var150.templates[var163.key or ""] = var163.value or templateEntryModule.TemplateEntry.new()
			elseif var156 == 4 then
				local _ = nil
				local var165, var166 = protoModule.readBuffer(p7, var151)
				var151 = var166
				var165 = t.HomePageResponse_LocalizedLiteralsEntry.decode(var165)
				var150.localized_literals[var165.key or ""] = var165.value or ""
			else
				local _ = nil
				local var167, var168 = protoModule.readVarInt(p7, var151)
				var151 = var168 + var167
			end
		elseif var152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var169, var170 = protoModule.readFixed32(p7, var151)
			local _ = var169
			var151 = var170
		elseif var152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var171, var172 = protoModule.readFixed64(p7, var151)
			local _ = var171
			var151 = var172
		else
			error("Unsupported wire type: " .. var152)
		end
	end
	return var150
end

function t_4:jsonEncode() --[[ line: 881 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
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

function t_4:jsonDecode() --[[ line: 915 ]]
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var177 = t_4.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var177.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var177.page_entries = t
	end
	if self.hydration_data ~= nil then
		var177.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var177.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var177.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var177.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var177.localized_literals = t
	end
	return var177
end

t_4.descriptor = {
	name = "HomePageResponse",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageResponse"
}
t.HomePageResponse = t_4
typeRegistryModule.default:register(t.HomePageResponse)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 998 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_5)
end

function t_5:encode() --[[ line: 1007 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var184 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var185, var186 = protoModule.writeTag(buff, var184, 1, protoModule.wireTypes.lengthDelimited)
		var185, var186 = protoModule.writeString(var185, var186, self.key)
		buff = var185
		var184 = var186
	end
	if self.value ~= nil then
		local var187 = self.value:encode()
		local var188, var189 = protoModule.writeTag(buff, var184, 2, protoModule.wireTypes.lengthDelimited)
		var188, var189 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
		buff = var188
		var184 = var189
	end
	local buff_1 = buffer.create(var184)
	buffer.copy(buff_1, 0, buff, 0, var184)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 1027 ]]
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var191 = t_5.new()
	local var192 = 0
	while var192 < buffer.len(p9) do
		local _ = nil
		local var193 = nil
		local var194, var195, var196 = protoModule.readTag(p9, var192)
		local var197 = var194
		var193 = var195
		var192 = var196
		
		if var193 == protoModule.wireTypes.varint then
			local _ = nil
			local var198, var199 = protoModule.readVarInt(p9, var192)
			local _ = var198
			var192 = var199
			continue
		end
		if var193 == protoModule.wireTypes.lengthDelimited then
			if var197 == 1 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p9, var192)
				var192 = var201
				var191.key = buffer.tostring(var200)
			elseif var197 == 2 then
				local _ = nil
				local var202, var203 = protoModule.readBuffer(p9, var192)
				var192 = var203
				var191.value = templateEntryModule.TemplateEntry.decode(var202)
			else
				local _ = nil
				local var204, var205 = protoModule.readVarInt(p9, var192)
				var192 = var205 + var204
			end
		elseif var193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var206, var207 = protoModule.readFixed32(p9, var192)
			local _ = var206
			var192 = var207
		elseif var193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var208, var209 = protoModule.readFixed64(p9, var192)
			local _ = var208
			var192 = var209
		else
			error("Unsupported wire type: " .. var193)
		end
	end
	return var191
end

function t_5:jsonEncode() --[[ line: 1075 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1089 ]]
	-- upvalues: t_5 (ref), templateEntryModule (ref)
	local var211 = t_5.new()
	
	if self.key ~= nil then
		var211.key = self.key
	end
	if self.value ~= nil then
		var211.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var211
end

t_5.descriptor = {
	name = "HomePageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.TemplatesEntry"
}
t.HomePageResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.HomePageResponse_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1117 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then "" else p10.value
	}, t_6)
end

function t_6:encode() --[[ line: 1126 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var213 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var214, var215 = protoModule.writeTag(buff, var213, 1, protoModule.wireTypes.lengthDelimited)
		var214, var215 = protoModule.writeString(var214, var215, self.key)
		buff = var214
		var213 = var215
	end
	if self.value ~= nil and self.value ~= "" then
		local var216, var217 = protoModule.writeTag(buff, var213, 2, protoModule.wireTypes.lengthDelimited)
		var216, var217 = protoModule.writeString(var216, var217, self.value)
		buff = var216
		var213 = var217
	end
	local buff_1 = buffer.create(var213)
	buffer.copy(buff_1, 0, buff, 0, var213)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1145 ]]
	-- upvalues: t_6 (ref), protoModule (ref)
	local var219 = t_6.new()
	local var220 = 0
	while var220 < buffer.len(p11) do
		local _ = nil
		local var221 = nil
		local var222, var223, var224 = protoModule.readTag(p11, var220)
		local var225 = var222
		var221 = var223
		var220 = var224
		
		if var221 == protoModule.wireTypes.varint then
			local _ = nil
			local var226, var227 = protoModule.readVarInt(p11, var220)
			local _ = var226
			var220 = var227
			continue
		end
		if var221 == protoModule.wireTypes.lengthDelimited then
			if var225 == 1 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p11, var220)
				var220 = var229
				var219.key = buffer.tostring(var228)
			elseif var225 == 2 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p11, var220)
				var220 = var231
				var219.value = buffer.tostring(var230)
			else
				local _ = nil
				local var232, var233 = protoModule.readVarInt(p11, var220)
				var220 = var233 + var232
			end
		elseif var221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var234, var235 = protoModule.readFixed32(p11, var220)
			local _ = var234
			var220 = var235
		elseif var221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var236, var237 = protoModule.readFixed64(p11, var220)
			local _ = var236
			var220 = var237
		else
			error("Unsupported wire type: " .. var221)
		end
	end
	return var219
end

function t_6:jsonEncode() --[[ line: 1193 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1207 ]]
	-- upvalues: t_6 (ref)
	local var239 = t_6.new()
	
	if self.key ~= nil then
		var239.key = self.key
	end
	if self.value ~= nil then
		var239.value = self.value
	end
	return var239
end

t_6.descriptor = {
	name = "HomePageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.LocalizedLiteralsEntry"
}
t.HomePageResponse_LocalizedLiteralsEntry = t_6
typeRegistryModule.default:register(t.HomePageResponse_LocalizedLiteralsEntry)

return {
	HomePageRequest = t.HomePageRequest,
	HomePageResponse = t.HomePageResponse
}