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
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var15 = protoModule.writeString(var2, var3, i)
			var2, var15 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var2, var15 = protoModule.writeString(var2, var3, v)
			local var4 = var2
			local var5 = var3
			local var6, var7 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var6, var19 = protoModule.writeBuffer(var6, var7, var4, var5)
			buff = var6
			var1 = var7
		end
	end
	if self.client_capabilities ~= nil then
		local var8 = self.client_capabilities:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var9, var22 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var11 = t_1.new()
	local var12 = 0
	while var12 < buffer.len(p1) do
		local _ = nil
		local var13 = nil
		local var14, var15, var16 = protoModule.readTag(p1, var12)
		local var17 = var14
		var13 = var15
		var12 = var16
		
		if var13 == protoModule.wireTypes.varint then
			local _ = nil
			local var18, var19 = protoModule.readVarInt(p1, var12)
			local _ = var18
			var12 = var19
			continue
		end
		if var13 == protoModule.wireTypes.lengthDelimited then
			if var17 == 1 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var12)
				var12 = var21
				var20 = t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var20)
				var11.cached_roblox_component_to_template_id[var20.key or ""] = var20.value or ""
			elseif var17 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var12)
				var12 = var23
				var11.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var12)
				var12 = var25 + var24
			end
		elseif var13 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var12)
			local _ = var26
			var12 = var27
		elseif var13 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var12)
			local _ = var28
			var12 = var29
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var11
end

function t_1:jsonEncode()
	local t = {}
	
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
	local var30 = t_1.new()
	
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var30.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var30.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var30.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var30.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var30
end

t_1.descriptor = {
	name = "ExperienceDetailsPageRequest",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.ExperienceDetailsPageRequest"
}
t.ExperienceDetailsPageRequest = t_1
typeRegistryModule.default:register(t.ExperienceDetailsPageRequest)
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
	name = "ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		page_entries = if p3 == nil or p3.page_entries == nil then {} else p3.page_entries,
		hydration_data = if p3 == nil or p3.hydration_data == nil then nil else p3.hydration_data,
		templates = if p3 == nil or p3.templates == nil then {} else p3.templates,
		localized_literals = if p3 == nil or p3.localized_literals == nil then {} else p3.localized_literals
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var50 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var51 = v:encode()
			local var52, var53 = protoModule.writeTag(buff, var50, 1, protoModule.wireTypes.lengthDelimited)
			var52, var80 = protoModule.writeBuffer(var52, var53, var51, buffer.len(var51))
			buff = var52
			var50 = var53
		end
	end
	if self.hydration_data ~= nil then
		local var54 = self.hydration_data:encode()
		local var55, var56 = protoModule.writeTag(buff, var50, 2, protoModule.wireTypes.lengthDelimited)
		var55, var83 = protoModule.writeBuffer(var55, var56, var54, buffer.len(var54))
		buff = var55
		var50 = var56
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var57, var58 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var57, var85 = protoModule.writeString(var57, var58, i)
			local var59 = v:encode()
			var58, var87 = protoModule.writeTag(var57, var58, 2, protoModule.wireTypes.lengthDelimited)
			var58, var87 = protoModule.writeBuffer(var58, var87, var59, buffer.len(var59))
			local var60 = var58
			local var61 = var87
			local var62, var63 = protoModule.writeTag(buff, var50, 3, protoModule.wireTypes.lengthDelimited)
			var62, var91 = protoModule.writeBuffer(var62, var63, var60, var61)
			buff = var62
			var50 = var63
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var64, var65 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var64, var93 = protoModule.writeString(var64, var65, i)
			var64, var93 = protoModule.writeTag(var64, var65, 2, protoModule.wireTypes.lengthDelimited)
			var64, var93 = protoModule.writeString(var64, var65, v)
			local var66 = var64
			local var67 = var65
			local var68, var69 = protoModule.writeTag(buff, var50, 4, protoModule.wireTypes.lengthDelimited)
			var68, var97 = protoModule.writeBuffer(var68, var69, var66, var67)
			buff = var68
			var50 = var69
		end
	end
	local buff_1 = buffer.create(var50)
	buffer.copy(buff_1, 0, buff, 0, var50)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var70 = t_3.new()
	local var71 = 0
	while var71 < buffer.len(p3) do
		local _ = nil
		local var72 = nil
		local var73, var74, var75 = protoModule.readTag(p3, var71)
		local var76 = var73
		var72 = var74
		var71 = var75
		
		if var72 == protoModule.wireTypes.varint then
			local _ = nil
			local var77, var78 = protoModule.readVarInt(p3, var71)
			local _ = var77
			var71 = var78
			continue
		end
		if var72 == protoModule.wireTypes.lengthDelimited then
			if var76 == 1 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var71)
				var71 = var80
				table.insert(var70.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var79))
			elseif var76 == 2 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var71)
				var71 = var82
				var70.hydration_data = hydrationContentModule.HydrationContent.decode(var81)
			elseif var76 == 3 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p3, var71)
				var71 = var84
				var83 = t.ExperienceDetailsPageResponse_TemplatesEntry.decode(var83)
				var70.templates[var83.key or ""] = var83.value or templateEntryModule.TemplateEntry.new()
			elseif var76 == 4 then
				local _ = nil
				local var85, var86 = protoModule.readBuffer(p3, var71)
				var71 = var86
				var85 = t.ExperienceDetailsPageResponse_LocalizedLiteralsEntry.decode(var85)
				var70.localized_literals[var85.key or ""] = var85.value or ""
			else
				local _ = nil
				local var87, var88 = protoModule.readVarInt(p3, var71)
				var71 = var88 + var87
			end
		elseif var72 == protoModule.wireTypes.i32 then
			local _ = nil
			local var89, var90 = protoModule.readFixed32(p3, var71)
			local _ = var89
			var71 = var90
		elseif var72 == protoModule.wireTypes.i64 then
			local _ = nil
			local var91, var92 = protoModule.readFixed64(p3, var71)
			local _ = var91
			var71 = var92
		else
			error("Unsupported wire type: " .. var101)
		end
	end
	return var70
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var93 = t_3.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var93.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var93.page_entries = t
	end
	if self.hydration_data ~= nil then
		var93.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var93.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var93.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var93.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var93.localized_literals = t
	end
	return var93
end

t_3.descriptor = {
	name = "ExperienceDetailsPageResponse",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.ExperienceDetailsPageResponse"
}
t.ExperienceDetailsPageResponse = t_3
typeRegistryModule.default:register(t.ExperienceDetailsPageResponse)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var94 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var95, var96 = protoModule.writeTag(buff, var94, 1, protoModule.wireTypes.lengthDelimited)
		var95, var135 = protoModule.writeString(var95, var96, self.key)
		buff = var95
		var94 = var96
	end
	if self.value ~= nil then
		local var97 = self.value:encode()
		local var98, var99 = protoModule.writeTag(buff, var94, 2, protoModule.wireTypes.lengthDelimited)
		var98, var138 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
		buff = var98
		var94 = var99
	end
	local buff_1 = buffer.create(var94)
	buffer.copy(buff_1, 0, buff, 0, var94)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var94 = t_4.new()
	local var95 = 0
	while var95 < buffer.len(p4) do
		local _ = nil
		local var96 = nil
		local var97, var98, var99 = protoModule.readTag(p4, var95)
		local var100 = var97
		var96 = var98
		var95 = var99
		
		if var96 == protoModule.wireTypes.varint then
			local _ = nil
			local var101, var102 = protoModule.readVarInt(p4, var95)
			local _ = var101
			var95 = var102
			continue
		end
		if var96 == protoModule.wireTypes.lengthDelimited then
			if var100 == 1 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p4, var95)
				var95 = var104
				var94.key = buffer.tostring(var103)
			elseif var100 == 2 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p4, var95)
				var95 = var106
				var94.value = templateEntryModule.TemplateEntry.decode(var105)
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p4, var95)
				var95 = var108 + var107
			end
		elseif var96 == protoModule.wireTypes.i32 then
			local _ = nil
			local var109, var110 = protoModule.readFixed32(p4, var95)
			local _ = var109
			var95 = var110
		elseif var96 == protoModule.wireTypes.i64 then
			local _ = nil
			local var111, var112 = protoModule.readFixed64(p4, var95)
			local _ = var111
			var95 = var112
		else
			error("Unsupported wire type: " .. var142)
		end
	end
	return var94
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), templateEntryModule (ref)
	local var113 = t_4.new()
	
	if self.key ~= nil then
		var113.key = self.key
	end
	if self.value ~= nil then
		var113.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var113
end

t_4.descriptor = {
	name = "ExperienceDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.TemplatesEntry"
}
t.ExperienceDetailsPageResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.ExperienceDetailsPageResponse_TemplatesEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then "" else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var113 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var114, var115 = protoModule.writeTag(buff, var113, 1, protoModule.wireTypes.lengthDelimited)
		var114, var164 = protoModule.writeString(var114, var115, self.key)
		buff = var114
		var113 = var115
	end
	if self.value ~= nil and self.value ~= "" then
		local var116, var117 = protoModule.writeTag(buff, var113, 2, protoModule.wireTypes.lengthDelimited)
		var116, var166 = protoModule.writeString(var116, var117, self.value)
		buff = var116
		var113 = var117
	end
	local buff_1 = buffer.create(var113)
	buffer.copy(buff_1, 0, buff, 0, var113)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var113 = t_5.new()
	local var114 = 0
	while var114 < buffer.len(p5) do
		local _ = nil
		local var115 = nil
		local var116, var117, var118 = protoModule.readTag(p5, var114)
		local var119 = var116
		var115 = var117
		var114 = var118
		
		if var115 == protoModule.wireTypes.varint then
			local _ = nil
			local var120, var121 = protoModule.readVarInt(p5, var114)
			local _ = var120
			var114 = var121
			continue
		end
		if var115 == protoModule.wireTypes.lengthDelimited then
			if var119 == 1 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p5, var114)
				var114 = var123
				var113.key = buffer.tostring(var122)
			elseif var119 == 2 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p5, var114)
				var114 = var125
				var113.value = buffer.tostring(var124)
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p5, var114)
				var114 = var127 + var126
			end
		elseif var115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p5, var114)
			local _ = var128
			var114 = var129
		elseif var115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p5, var114)
			local _ = var130
			var114 = var131
		else
			error("Unsupported wire type: " .. var170)
		end
	end
	return var113
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var132 = t_5.new()
	
	if self.key ~= nil then
		var132.key = self.key
	end
	if self.value ~= nil then
		var132.value = self.value
	end
	return var132
end

t_5.descriptor = {
	name = "ExperienceDetailsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.LocalizedLiteralsEntry"
}
t.ExperienceDetailsPageResponse_LocalizedLiteralsEntry = t_5
typeRegistryModule.default:register(t.ExperienceDetailsPageResponse_LocalizedLiteralsEntry)

return {
	ExperienceDetailsPageRequest = t.ExperienceDetailsPageRequest,
	ExperienceDetailsPageResponse = t.ExperienceDetailsPageResponse
}