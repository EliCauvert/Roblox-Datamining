local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
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
		var2, var15 = protoModule.writeString(var2, var3, self.session_id)
		buff = var2
		var1 = var3
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
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
	if self.client_capabilities ~= nil then
		local var10 = self.client_capabilities:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var11, var24 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var13 = t_1.new()
	local var14 = 0
	while var14 < buffer.len(p1) do
		local _ = nil
		local var15 = nil
		local var16, var17, var18 = protoModule.readTag(p1, var14)
		local var19 = var16
		var15 = var17
		var14 = var18
		
		if var15 == protoModule.wireTypes.varint then
			local _ = nil
			local var20, var21 = protoModule.readVarInt(p1, var14)
			local _ = var20
			var14 = var21
			continue
		end
		if var15 == protoModule.wireTypes.lengthDelimited then
			if var19 == 1 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var14)
				var14 = var23
				var13.session_id = buffer.tostring(var22)
			elseif var19 == 2 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var14)
				var14 = var25
				var24 = t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var24)
				var13.cached_roblox_component_to_template_id[var24.key or ""] = var24.value or ""
			elseif var19 == 3 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var14)
				var14 = var27
				var13.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var14)
				var14 = var29 + var28
			end
		elseif var15 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var14)
			local _ = var30
			var14 = var31
		elseif var15 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var14)
			local _ = var32
			var14 = var33
		else
			error("Unsupported wire type: " .. var28)
		end
	end
	return var13
end

function t_1:jsonEncode()
	local t = {}
	
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
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
	local var34 = t_1.new()
	
	if self.session_id ~= nil then
		var34.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var34.session_id = self.sessionId
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var34.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var34.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var34.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var34.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var34
end

t_1.descriptor = {
	name = "SettingsPageRequest",
	fullName = "roblox.apppageplatform.settings.v1beta1.SettingsPageRequest"
}
t.SettingsPageRequest = t_1
typeRegistryModule.default:register(t.SettingsPageRequest)
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
	local var35 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var36, var37 = protoModule.writeTag(buff, var35, 1, protoModule.wireTypes.lengthDelimited)
		var36, var55 = protoModule.writeString(var36, var37, self.key)
		buff = var36
		var35 = var37
	end
	if self.value ~= nil and self.value ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var35, 2, protoModule.wireTypes.lengthDelimited)
		var38, var57 = protoModule.writeString(var38, var39, self.value)
		buff = var38
		var35 = var39
	end
	local buff_1 = buffer.create(var35)
	buffer.copy(buff_1, 0, buff, 0, var35)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var35 = t_2.new()
	local var36 = 0
	while var36 < buffer.len(p2) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p2, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			local _ = nil
			local var42, var43 = protoModule.readVarInt(p2, var36)
			local _ = var42
			var36 = var43
			continue
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p2, var36)
				var36 = var45
				var35.key = buffer.tostring(var44)
			elseif var41 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p2, var36)
				var36 = var47
				var35.value = buffer.tostring(var46)
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p2, var36)
				var36 = var49 + var48
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var50, var51 = protoModule.readFixed32(p2, var36)
			local _ = var50
			var36 = var51
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var52, var53 = protoModule.readFixed64(p2, var36)
			local _ = var52
			var36 = var53
		else
			error("Unsupported wire type: " .. var61)
		end
	end
	return var35
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
	local var54 = t_2.new()
	
	if self.key ~= nil then
		var54.key = self.key
	end
	if self.value ~= nil then
		var54.value = self.value
	end
	return var54
end

t_2.descriptor = {
	name = "SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry)
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
	local var54 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var55 = v:encode()
			local var56, var57 = protoModule.writeTag(buff, var54, 1, protoModule.wireTypes.lengthDelimited)
			var56, var84 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
			buff = var56
			var54 = var57
		end
	end
	if self.hydration_data ~= nil then
		local var58 = self.hydration_data:encode()
		local var59, var60 = protoModule.writeTag(buff, var54, 2, protoModule.wireTypes.lengthDelimited)
		var59, var87 = protoModule.writeBuffer(var59, var60, var58, buffer.len(var58))
		buff = var59
		var54 = var60
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var61, var62 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var61, var89 = protoModule.writeString(var61, var62, i)
			local var63 = v:encode()
			var62, var91 = protoModule.writeTag(var61, var62, 2, protoModule.wireTypes.lengthDelimited)
			var62, var91 = protoModule.writeBuffer(var62, var91, var63, buffer.len(var63))
			local var64 = var62
			local var65 = var91
			local var66, var67 = protoModule.writeTag(buff, var54, 3, protoModule.wireTypes.lengthDelimited)
			var66, var95 = protoModule.writeBuffer(var66, var67, var64, var65)
			buff = var66
			var54 = var67
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var68, var69 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var68, var97 = protoModule.writeString(var68, var69, i)
			var68, var97 = protoModule.writeTag(var68, var69, 2, protoModule.wireTypes.lengthDelimited)
			var68, var97 = protoModule.writeString(var68, var69, v)
			local var70 = var68
			local var71 = var69
			local var72, var73 = protoModule.writeTag(buff, var54, 4, protoModule.wireTypes.lengthDelimited)
			var72, var101 = protoModule.writeBuffer(var72, var73, var70, var71)
			buff = var72
			var54 = var73
		end
	end
	local buff_1 = buffer.create(var54)
	buffer.copy(buff_1, 0, buff, 0, var54)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var74 = t_3.new()
	local var75 = 0
	while var75 < buffer.len(p3) do
		local _ = nil
		local var76 = nil
		local var77, var78, var79 = protoModule.readTag(p3, var75)
		local var80 = var77
		var76 = var78
		var75 = var79
		
		if var76 == protoModule.wireTypes.varint then
			local _ = nil
			local var81, var82 = protoModule.readVarInt(p3, var75)
			local _ = var81
			var75 = var82
			continue
		end
		if var76 == protoModule.wireTypes.lengthDelimited then
			if var80 == 1 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p3, var75)
				var75 = var84
				table.insert(var74.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var83))
			elseif var80 == 2 then
				local _ = nil
				local var85, var86 = protoModule.readBuffer(p3, var75)
				var75 = var86
				var74.hydration_data = hydrationContentModule.HydrationContent.decode(var85)
			elseif var80 == 3 then
				local _ = nil
				local var87, var88 = protoModule.readBuffer(p3, var75)
				var75 = var88
				var87 = t.SettingsPageResponse_TemplatesEntry.decode(var87)
				var74.templates[var87.key or ""] = var87.value or templateEntryModule.TemplateEntry.new()
			elseif var80 == 4 then
				local _ = nil
				local var89, var90 = protoModule.readBuffer(p3, var75)
				var75 = var90
				var89 = t.SettingsPageResponse_LocalizedLiteralsEntry.decode(var89)
				var74.localized_literals[var89.key or ""] = var89.value or ""
			else
				local _ = nil
				local var91, var92 = protoModule.readVarInt(p3, var75)
				var75 = var92 + var91
			end
		elseif var76 == protoModule.wireTypes.i32 then
			local _ = nil
			local var93, var94 = protoModule.readFixed32(p3, var75)
			local _ = var93
			var75 = var94
		elseif var76 == protoModule.wireTypes.i64 then
			local _ = nil
			local var95, var96 = protoModule.readFixed64(p3, var75)
			local _ = var95
			var75 = var96
		else
			error("Unsupported wire type: " .. var105)
		end
	end
	return var74
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
	local var97 = t_3.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var97.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var97.page_entries = t
	end
	if self.hydration_data ~= nil then
		var97.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var97.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var97.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var97.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var97.localized_literals = t
	end
	return var97
end

t_3.descriptor = {
	name = "SettingsPageResponse",
	fullName = "roblox.apppageplatform.settings.v1beta1.SettingsPageResponse"
}
t.SettingsPageResponse = t_3
typeRegistryModule.default:register(t.SettingsPageResponse)
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
	local var98 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var99, var100 = protoModule.writeTag(buff, var98, 1, protoModule.wireTypes.lengthDelimited)
		var99, var139 = protoModule.writeString(var99, var100, self.key)
		buff = var99
		var98 = var100
	end
	if self.value ~= nil then
		local var101 = self.value:encode()
		local var102, var103 = protoModule.writeTag(buff, var98, 2, protoModule.wireTypes.lengthDelimited)
		var102, var142 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
		buff = var102
		var98 = var103
	end
	local buff_1 = buffer.create(var98)
	buffer.copy(buff_1, 0, buff, 0, var98)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var98 = t_4.new()
	local var99 = 0
	while var99 < buffer.len(p4) do
		local _ = nil
		local var100 = nil
		local var101, var102, var103 = protoModule.readTag(p4, var99)
		local var104 = var101
		var100 = var102
		var99 = var103
		
		if var100 == protoModule.wireTypes.varint then
			local _ = nil
			local var105, var106 = protoModule.readVarInt(p4, var99)
			local _ = var105
			var99 = var106
			continue
		end
		if var100 == protoModule.wireTypes.lengthDelimited then
			if var104 == 1 then
				local _ = nil
				local var107, var108 = protoModule.readBuffer(p4, var99)
				var99 = var108
				var98.key = buffer.tostring(var107)
			elseif var104 == 2 then
				local _ = nil
				local var109, var110 = protoModule.readBuffer(p4, var99)
				var99 = var110
				var98.value = templateEntryModule.TemplateEntry.decode(var109)
			else
				local _ = nil
				local var111, var112 = protoModule.readVarInt(p4, var99)
				var99 = var112 + var111
			end
		elseif var100 == protoModule.wireTypes.i32 then
			local _ = nil
			local var113, var114 = protoModule.readFixed32(p4, var99)
			local _ = var113
			var99 = var114
		elseif var100 == protoModule.wireTypes.i64 then
			local _ = nil
			local var115, var116 = protoModule.readFixed64(p4, var99)
			local _ = var115
			var99 = var116
		else
			error("Unsupported wire type: " .. var146)
		end
	end
	return var98
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
	local var117 = t_4.new()
	
	if self.key ~= nil then
		var117.key = self.key
	end
	if self.value ~= nil then
		var117.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var117
end

t_4.descriptor = {
	name = "SettingsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.TemplatesEntry"
}
t.SettingsPageResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.SettingsPageResponse_TemplatesEntry)
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
	local var117 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var118, var119 = protoModule.writeTag(buff, var117, 1, protoModule.wireTypes.lengthDelimited)
		var118, var168 = protoModule.writeString(var118, var119, self.key)
		buff = var118
		var117 = var119
	end
	if self.value ~= nil and self.value ~= "" then
		local var120, var121 = protoModule.writeTag(buff, var117, 2, protoModule.wireTypes.lengthDelimited)
		var120, var170 = protoModule.writeString(var120, var121, self.value)
		buff = var120
		var117 = var121
	end
	local buff_1 = buffer.create(var117)
	buffer.copy(buff_1, 0, buff, 0, var117)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var117 = t_5.new()
	local var118 = 0
	while var118 < buffer.len(p5) do
		local _ = nil
		local var119 = nil
		local var120, var121, var122 = protoModule.readTag(p5, var118)
		local var123 = var120
		var119 = var121
		var118 = var122
		
		if var119 == protoModule.wireTypes.varint then
			local _ = nil
			local var124, var125 = protoModule.readVarInt(p5, var118)
			local _ = var124
			var118 = var125
			continue
		end
		if var119 == protoModule.wireTypes.lengthDelimited then
			if var123 == 1 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p5, var118)
				var118 = var127
				var117.key = buffer.tostring(var126)
			elseif var123 == 2 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p5, var118)
				var118 = var129
				var117.value = buffer.tostring(var128)
			else
				local _ = nil
				local var130, var131 = protoModule.readVarInt(p5, var118)
				var118 = var131 + var130
			end
		elseif var119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var132, var133 = protoModule.readFixed32(p5, var118)
			local _ = var132
			var118 = var133
		elseif var119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var134, var135 = protoModule.readFixed64(p5, var118)
			local _ = var134
			var118 = var135
		else
			error("Unsupported wire type: " .. var174)
		end
	end
	return var117
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
	local var136 = t_5.new()
	
	if self.key ~= nil then
		var136.key = self.key
	end
	if self.value ~= nil then
		var136.value = self.value
	end
	return var136
end

t_5.descriptor = {
	name = "SettingsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.LocalizedLiteralsEntry"
}
t.SettingsPageResponse_LocalizedLiteralsEntry = t_5
typeRegistryModule.default:register(t.SettingsPageResponse_LocalizedLiteralsEntry)

return {
	SettingsPageRequest = t.SettingsPageRequest,
	SettingsPageResponse = t.SettingsPageResponse
}