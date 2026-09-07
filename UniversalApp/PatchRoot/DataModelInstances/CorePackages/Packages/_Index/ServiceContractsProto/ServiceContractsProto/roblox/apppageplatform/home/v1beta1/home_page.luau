local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		topic_ids = if p1 == nil or p1.topic_ids == nil then {} else p1.topic_ids,
		contextual_features = if p1 == nil or p1.contextual_features == nil then {} else p1.contextual_features,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.session_id ~= nil and self.session_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var16 = protoModule.writeString(var2, var3, self.session_id)
		buff = var2
		var1 = var3
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		for i, v in self.topic_ids do
			local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var4, var18 = protoModule.writeString(var4, var5, v)
			buff = var4
			var1 = var5
		end
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		for i, v in self.contextual_features do
			local var6, var7 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6, var20 = protoModule.writeString(var6, var7, i)
			var6, var20 = protoModule.writeTag(var6, var7, 2, protoModule.wireTypes.lengthDelimited)
			var6, var20 = protoModule.writeString(var6, var7, v)
			local var8 = var6
			local var9 = var7
			local var10, var11 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var10, var24 = protoModule.writeBuffer(var10, var11, var8, var9)
			buff = var10
			var1 = var11
		end
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var12, var13 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var12, var26 = protoModule.writeString(var12, var13, i)
			var12, var26 = protoModule.writeTag(var12, var13, 2, protoModule.wireTypes.lengthDelimited)
			var12, var26 = protoModule.writeString(var12, var13, v)
			local var14 = var12
			local var15 = var13
			local var16, var17 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var16, var30 = protoModule.writeBuffer(var16, var17, var14, var15)
			buff = var16
			var1 = var17
		end
	end
	if self.client_capabilities ~= nil then
		local var18 = self.client_capabilities:encode()
		local var19, var20 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var19, var33 = protoModule.writeBuffer(var19, var20, var18, buffer.len(var18))
		buff = var19
		var1 = var20
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var21 = t_1.new()
	local var22 = 0
	while var22 < buffer.len(p1) do
		local _ = nil
		local var23 = nil
		local var24, var25, var26 = protoModule.readTag(p1, var22)
		local var27 = var24
		var23 = var25
		var22 = var26
		
		if var23 == protoModule.wireTypes.varint then
			local _ = nil
			local var28, var29 = protoModule.readVarInt(p1, var22)
			local _ = var28
			var22 = var29
			continue
		end
		if var23 == protoModule.wireTypes.lengthDelimited then
			if var27 == 1 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var22)
				var22 = var31
				var21.session_id = buffer.tostring(var30)
			elseif var27 == 2 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var22)
				var22 = var33
				table.insert(var21.topic_ids, buffer.tostring(var32))
			elseif var27 == 3 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var22)
				var22 = var35
				var34 = t.HomePageRequest_ContextualFeaturesEntry.decode(var34)
				var21.contextual_features[var34.key or ""] = var34.value or ""
			elseif var27 == 4 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var22)
				var22 = var37
				var36 = t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var36)
				var21.cached_roblox_component_to_template_id[var36.key or ""] = var36.value or ""
			elseif var27 == 5 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var22)
				var22 = var39
				var21.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var38)
			else
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p1, var22)
				var22 = var41 + var40
			end
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var42, var43 = protoModule.readFixed32(p1, var22)
			local _ = var42
			var22 = var43
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var44, var45 = protoModule.readFixed64(p1, var22)
			local _ = var44
			var22 = var45
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var21
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), clientCapabilitiesModule (ref)
	local var46 = t_1.new()
	
	if self.session_id ~= nil then
		var46.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var46.session_id = self.sessionId
	end
	if self.topic_ids ~= nil then
		local t = {}
		
		for i, v in self.topic_ids do
			table.insert(t, v)
		end
		var46.topic_ids = t
	end
	if self.topicIds ~= nil then
		local t = {}
		
		for i, v in self.topicIds do
			table.insert(t, v)
		end
		var46.topic_ids = t
	end
	if self.contextual_features ~= nil then
		local t = {}
		
		for i, v in self.contextual_features do
			t[i] = v
		end
		var46.contextual_features = t
	end
	if self.contextualFeatures ~= nil then
		local t = {}
		
		for i, v in self.contextualFeatures do
			t[i] = v
		end
		var46.contextual_features = t
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var46.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var46.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var46.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var46.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var46
end

t_1.descriptor = {
	name = "HomePageRequest",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageRequest"
}
t.HomePageRequest = t_1
typeRegistryModule.default:register(t.HomePageRequest)
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
	local var47 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var48, var49 = protoModule.writeTag(buff, var47, 1, protoModule.wireTypes.lengthDelimited)
		var48, var74 = protoModule.writeString(var48, var49, self.key)
		buff = var48
		var47 = var49
	end
	if self.value ~= nil and self.value ~= "" then
		local var50, var51 = protoModule.writeTag(buff, var47, 2, protoModule.wireTypes.lengthDelimited)
		var50, var76 = protoModule.writeString(var50, var51, self.value)
		buff = var50
		var47 = var51
	end
	local buff_1 = buffer.create(var47)
	buffer.copy(buff_1, 0, buff, 0, var47)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var47 = t_2.new()
	local var48 = 0
	while var48 < buffer.len(p2) do
		local _ = nil
		local var49 = nil
		local var50, var51, var52 = protoModule.readTag(p2, var48)
		local var53 = var50
		var49 = var51
		var48 = var52
		
		if var49 == protoModule.wireTypes.varint then
			local _ = nil
			local var54, var55 = protoModule.readVarInt(p2, var48)
			local _ = var54
			var48 = var55
			continue
		end
		if var49 == protoModule.wireTypes.lengthDelimited then
			if var53 == 1 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p2, var48)
				var48 = var57
				var47.key = buffer.tostring(var56)
			elseif var53 == 2 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p2, var48)
				var48 = var59
				var47.value = buffer.tostring(var58)
			else
				local _ = nil
				local var60, var61 = protoModule.readVarInt(p2, var48)
				var48 = var61 + var60
			end
		elseif var49 == protoModule.wireTypes.i32 then
			local _ = nil
			local var62, var63 = protoModule.readFixed32(p2, var48)
			local _ = var62
			var48 = var63
		elseif var49 == protoModule.wireTypes.i64 then
			local _ = nil
			local var64, var65 = protoModule.readFixed64(p2, var48)
			local _ = var64
			var48 = var65
		else
			error("Unsupported wire type: " .. var80)
		end
	end
	return var47
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
	local var66 = t_2.new()
	
	if self.key ~= nil then
		var66.key = self.key
	end
	if self.value ~= nil then
		var66.value = self.value
	end
	return var66
end

t_2.descriptor = {
	name = "HomePageRequest_ContextualFeaturesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ContextualFeaturesEntry"
}
t.HomePageRequest_ContextualFeaturesEntry = t_2
typeRegistryModule.default:register(t.HomePageRequest_ContextualFeaturesEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then "" else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var66 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var66, 1, protoModule.wireTypes.lengthDelimited)
		var67, var102 = protoModule.writeString(var67, var68, self.key)
		buff = var67
		var66 = var68
	end
	if self.value ~= nil and self.value ~= "" then
		local var69, var70 = protoModule.writeTag(buff, var66, 2, protoModule.wireTypes.lengthDelimited)
		var69, var104 = protoModule.writeString(var69, var70, self.value)
		buff = var69
		var66 = var70
	end
	local buff_1 = buffer.create(var66)
	buffer.copy(buff_1, 0, buff, 0, var66)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
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
				var66.value = buffer.tostring(var77)
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
			error("Unsupported wire type: " .. var108)
		end
	end
	return var66
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var85 = t_3.new()
	
	if self.key ~= nil then
		var85.key = self.key
	end
	if self.value ~= nil then
		var85.value = self.value
	end
	return var85
end

t_3.descriptor = {
	name = "HomePageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry = t_3
typeRegistryModule.default:register(t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates,
		localized_literals = if p4 == nil or p4.localized_literals == nil then {} else p4.localized_literals,
		request_id = if p4 == nil or p4.request_id == nil then "" else p4.request_id
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var85 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var86 = v:encode()
			local var87, var88 = protoModule.writeTag(buff, var85, 1, protoModule.wireTypes.lengthDelimited)
			var87, var131 = protoModule.writeBuffer(var87, var88, var86, buffer.len(var86))
			buff = var87
			var85 = var88
		end
	end
	if self.hydration_data ~= nil then
		local var89 = self.hydration_data:encode()
		local var90, var91 = protoModule.writeTag(buff, var85, 2, protoModule.wireTypes.lengthDelimited)
		var90, var134 = protoModule.writeBuffer(var90, var91, var89, buffer.len(var89))
		buff = var90
		var85 = var91
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var92, var93 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var92, var136 = protoModule.writeString(var92, var93, i)
			local var94 = v:encode()
			var93, var138 = protoModule.writeTag(var92, var93, 2, protoModule.wireTypes.lengthDelimited)
			var93, var138 = protoModule.writeBuffer(var93, var138, var94, buffer.len(var94))
			local var95 = var93
			local var96 = var138
			local var97, var98 = protoModule.writeTag(buff, var85, 3, protoModule.wireTypes.lengthDelimited)
			var97, var142 = protoModule.writeBuffer(var97, var98, var95, var96)
			buff = var97
			var85 = var98
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var99, var100 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var99, var144 = protoModule.writeString(var99, var100, i)
			var99, var144 = protoModule.writeTag(var99, var100, 2, protoModule.wireTypes.lengthDelimited)
			var99, var144 = protoModule.writeString(var99, var100, v)
			local var101 = var99
			local var102 = var100
			local var103, var104 = protoModule.writeTag(buff, var85, 4, protoModule.wireTypes.lengthDelimited)
			var103, var148 = protoModule.writeBuffer(var103, var104, var101, var102)
			buff = var103
			var85 = var104
		end
	end
	if self.request_id ~= nil and self.request_id ~= "" then
		local var105, var106 = protoModule.writeTag(buff, var85, 5, protoModule.wireTypes.lengthDelimited)
		var105, var150 = protoModule.writeString(var105, var106, self.request_id)
		buff = var105
		var85 = var106
	end
	local buff_1 = buffer.create(var85)
	buffer.copy(buff_1, 0, buff, 0, var85)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var107 = t_4.new()
	local var108 = 0
	while var108 < buffer.len(p4) do
		local _ = nil
		local var109 = nil
		local var110, var111, var112 = protoModule.readTag(p4, var108)
		local var113 = var110
		var109 = var111
		var108 = var112
		
		if var109 == protoModule.wireTypes.varint then
			local _ = nil
			local var114, var115 = protoModule.readVarInt(p4, var108)
			local _ = var114
			var108 = var115
			continue
		end
		if var109 == protoModule.wireTypes.lengthDelimited then
			if var113 == 1 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p4, var108)
				var108 = var117
				table.insert(var107.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var116))
			elseif var113 == 2 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p4, var108)
				var108 = var119
				var107.hydration_data = hydrationContentModule.HydrationContent.decode(var118)
			elseif var113 == 3 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p4, var108)
				var108 = var121
				var120 = t.HomePageResponse_TemplatesEntry.decode(var120)
				var107.templates[var120.key or ""] = var120.value or templateEntryModule.TemplateEntry.new()
			elseif var113 == 4 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p4, var108)
				var108 = var123
				var122 = t.HomePageResponse_LocalizedLiteralsEntry.decode(var122)
				var107.localized_literals[var122.key or ""] = var122.value or ""
			elseif var113 == 5 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p4, var108)
				var108 = var125
				var107.request_id = buffer.tostring(var124)
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p4, var108)
				var108 = var127 + var126
			end
		elseif var109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p4, var108)
			local _ = var128
			var108 = var129
		elseif var109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p4, var108)
			local _ = var130
			var108 = var131
		else
			error("Unsupported wire type: " .. var154)
		end
	end
	return var107
end

function t_4:jsonEncode()
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
	if self.request_id ~= nil and self.request_id ~= "" then
		t.requestId = self.request_id
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var132 = t_4.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var132.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var132.page_entries = t
	end
	if self.hydration_data ~= nil then
		var132.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var132.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var132.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var132.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var132.localized_literals = t
	end
	if self.request_id ~= nil then
		var132.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var132.request_id = self.requestId
	end
	return var132
end

t_4.descriptor = {
	name = "HomePageResponse",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageResponse"
}
t.HomePageResponse = t_4
typeRegistryModule.default:register(t.HomePageResponse)
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
	local var133 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var134, var190 = protoModule.writeString(var134, var135, self.key)
		buff = var134
		var133 = var135
	end
	if self.value ~= nil then
		local var136 = self.value:encode()
		local var137, var138 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var137, var193 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
		buff = var137
		var133 = var138
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var133 = t_5.new()
	local var134 = 0
	while var134 < buffer.len(p5) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p5, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			local _ = nil
			local var140, var141 = protoModule.readVarInt(p5, var134)
			local _ = var140
			var134 = var141
			continue
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 1 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p5, var134)
				var134 = var143
				var133.key = buffer.tostring(var142)
			elseif var139 == 2 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p5, var134)
				var134 = var145
				var133.value = templateEntryModule.TemplateEntry.decode(var144)
			else
				local _ = nil
				local var146, var147 = protoModule.readVarInt(p5, var134)
				var134 = var147 + var146
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var148, var149 = protoModule.readFixed32(p5, var134)
			local _ = var148
			var134 = var149
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var150, var151 = protoModule.readFixed64(p5, var134)
			local _ = var150
			var134 = var151
		else
			error("Unsupported wire type: " .. var197)
		end
	end
	return var133
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
	local var152 = t_5.new()
	
	if self.key ~= nil then
		var152.key = self.key
	end
	if self.value ~= nil then
		var152.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var152
end

t_5.descriptor = {
	name = "HomePageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.TemplatesEntry"
}
t.HomePageResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.HomePageResponse_TemplatesEntry)
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
	local var152 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var153, var154 = protoModule.writeTag(buff, var152, 1, protoModule.wireTypes.lengthDelimited)
		var153, var219 = protoModule.writeString(var153, var154, self.key)
		buff = var153
		var152 = var154
	end
	if self.value ~= nil and self.value ~= "" then
		local var155, var156 = protoModule.writeTag(buff, var152, 2, protoModule.wireTypes.lengthDelimited)
		var155, var221 = protoModule.writeString(var155, var156, self.value)
		buff = var155
		var152 = var156
	end
	local buff_1 = buffer.create(var152)
	buffer.copy(buff_1, 0, buff, 0, var152)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var152 = t_6.new()
	local var153 = 0
	while var153 < buffer.len(p6) do
		local _ = nil
		local var154 = nil
		local var155, var156, var157 = protoModule.readTag(p6, var153)
		local var158 = var155
		var154 = var156
		var153 = var157
		
		if var154 == protoModule.wireTypes.varint then
			local _ = nil
			local var159, var160 = protoModule.readVarInt(p6, var153)
			local _ = var159
			var153 = var160
			continue
		end
		if var154 == protoModule.wireTypes.lengthDelimited then
			if var158 == 1 then
				local _ = nil
				local var161, var162 = protoModule.readBuffer(p6, var153)
				var153 = var162
				var152.key = buffer.tostring(var161)
			elseif var158 == 2 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p6, var153)
				var153 = var164
				var152.value = buffer.tostring(var163)
			else
				local _ = nil
				local var165, var166 = protoModule.readVarInt(p6, var153)
				var153 = var166 + var165
			end
		elseif var154 == protoModule.wireTypes.i32 then
			local _ = nil
			local var167, var168 = protoModule.readFixed32(p6, var153)
			local _ = var167
			var153 = var168
		elseif var154 == protoModule.wireTypes.i64 then
			local _ = nil
			local var169, var170 = protoModule.readFixed64(p6, var153)
			local _ = var169
			var153 = var170
		else
			error("Unsupported wire type: " .. var225)
		end
	end
	return var152
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
	local var171 = t_6.new()
	
	if self.key ~= nil then
		var171.key = self.key
	end
	if self.value ~= nil then
		var171.value = self.value
	end
	return var171
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