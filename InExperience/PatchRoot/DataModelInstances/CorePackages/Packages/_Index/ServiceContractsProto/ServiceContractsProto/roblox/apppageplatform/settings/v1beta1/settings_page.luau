local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local configDrivenFormDataModule = require(script.Parent.Parent.Parent.shared.v1beta1.config_driven_form_data)
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
		var2, var21 = protoModule.writeString(var2, var3, self.session_id)
		buff = var2
		var1 = var3
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var4, var5 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4, var23 = protoModule.writeString(var4, var5, i)
			var4, var23 = protoModule.writeTag(var4, var5, 2, protoModule.wireTypes.lengthDelimited)
			var4, var23 = protoModule.writeString(var4, var5, v)
			local var6 = var4
			local var7 = var5
			local var8, var9 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var8, var27 = protoModule.writeBuffer(var8, var9, var6, var7)
			buff = var8
			var1 = var9
		end
	end
	if self.client_capabilities ~= nil then
		local var10 = self.client_capabilities:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var11, var30 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
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
			error("Unsupported wire type: " .. var34)
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
		var36, var61 = protoModule.writeString(var36, var37, self.key)
		buff = var36
		var35 = var37
	end
	if self.value ~= nil and self.value ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var35, 2, protoModule.wireTypes.lengthDelimited)
		var38, var63 = protoModule.writeString(var38, var39, self.value)
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
			error("Unsupported wire type: " .. var67)
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
			var56, var90 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
			buff = var56
			var54 = var57
		end
	end
	if self.hydration_data ~= nil then
		local var58 = self.hydration_data:encode()
		local var59, var60 = protoModule.writeTag(buff, var54, 2, protoModule.wireTypes.lengthDelimited)
		var59, var93 = protoModule.writeBuffer(var59, var60, var58, buffer.len(var58))
		buff = var59
		var54 = var60
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var61, var62 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var61, var95 = protoModule.writeString(var61, var62, i)
			local var63 = v:encode()
			var62, var97 = protoModule.writeTag(var61, var62, 2, protoModule.wireTypes.lengthDelimited)
			var62, var97 = protoModule.writeBuffer(var62, var97, var63, buffer.len(var63))
			local var64 = var62
			local var65 = var97
			local var66, var67 = protoModule.writeTag(buff, var54, 3, protoModule.wireTypes.lengthDelimited)
			var66, var101 = protoModule.writeBuffer(var66, var67, var64, var65)
			buff = var66
			var54 = var67
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var68, var69 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var68, var103 = protoModule.writeString(var68, var69, i)
			var68, var103 = protoModule.writeTag(var68, var69, 2, protoModule.wireTypes.lengthDelimited)
			var68, var103 = protoModule.writeString(var68, var69, v)
			local var70 = var68
			local var71 = var69
			local var72, var73 = protoModule.writeTag(buff, var54, 4, protoModule.wireTypes.lengthDelimited)
			var72, var107 = protoModule.writeBuffer(var72, var73, var70, var71)
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
			error("Unsupported wire type: " .. var111)
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
		var99, var145 = protoModule.writeString(var99, var100, self.key)
		buff = var99
		var98 = var100
	end
	if self.value ~= nil then
		local var101 = self.value:encode()
		local var102, var103 = protoModule.writeTag(buff, var98, 2, protoModule.wireTypes.lengthDelimited)
		var102, var148 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
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
			error("Unsupported wire type: " .. var152)
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
		var118, var174 = protoModule.writeString(var118, var119, self.key)
		buff = var118
		var117 = var119
	end
	if self.value ~= nil and self.value ~= "" then
		local var120, var121 = protoModule.writeTag(buff, var117, 2, protoModule.wireTypes.lengthDelimited)
		var120, var176 = protoModule.writeString(var120, var121, self.value)
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
			error("Unsupported wire type: " .. var180)
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
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		name = if p6 == nil or p6.name == nil then "" else p6.name,
		parameters = if p6 == nil or p6.parameters == nil then nil else p6.parameters
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var136 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var137, var138 = protoModule.writeTag(buff, var136, 1, protoModule.wireTypes.lengthDelimited)
		var137, var202 = protoModule.writeString(var137, var138, self.name)
		buff = var137
		var136 = var138
	end
	if self.parameters ~= nil then
		local var139 = self.parameters:encode()
		local var140, var141 = protoModule.writeTag(buff, var136, 2, protoModule.wireTypes.lengthDelimited)
		var140, var205 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
		buff = var140
		var136 = var141
	end
	local buff_1 = buffer.create(var136)
	buffer.copy(buff_1, 0, buff, 0, var136)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), structModule (ref)
	local var136 = t_6.new()
	local var137 = 0
	while var137 < buffer.len(p6) do
		local _ = nil
		local var138 = nil
		local var139, var140, var141 = protoModule.readTag(p6, var137)
		local var142 = var139
		var138 = var140
		var137 = var141
		
		if var138 == protoModule.wireTypes.varint then
			local _ = nil
			local var143, var144 = protoModule.readVarInt(p6, var137)
			local _ = var143
			var137 = var144
			continue
		end
		if var138 == protoModule.wireTypes.lengthDelimited then
			if var142 == 1 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p6, var137)
				var137 = var146
				var136.name = buffer.tostring(var145)
			elseif var142 == 2 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p6, var137)
				var137 = var148
				var136.parameters = structModule.Struct.decode(var147)
			else
				local _ = nil
				local var149, var150 = protoModule.readVarInt(p6, var137)
				var137 = var150 + var149
			end
		elseif var138 == protoModule.wireTypes.i32 then
			local _ = nil
			local var151, var152 = protoModule.readFixed32(p6, var137)
			local _ = var151
			var137 = var152
		elseif var138 == protoModule.wireTypes.i64 then
			local _ = nil
			local var153, var154 = protoModule.readFixed64(p6, var137)
			local _ = var153
			var137 = var154
		else
			error("Unsupported wire type: " .. var209)
		end
	end
	return var136
end

function t_6:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.parameters ~= nil then
		t.parameters = self.parameters:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), structModule (ref)
	local var155 = t_6.new()
	
	if self.name ~= nil then
		var155.name = self.name
	end
	if self.parameters ~= nil then
		var155.parameters = structModule.Struct.jsonDecode(self.parameters)
	end
	return var155
end

t_6.descriptor = {
	name = "FormAction",
	fullName = "roblox.apppageplatform.settings.v1beta1.FormAction"
}
t.FormAction = t_6
typeRegistryModule.default:register(t.FormAction)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		operation = if p7 == nil or p7.operation == nil then nil else p7.operation
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var155 = 0
	
	if self.operation ~= nil then
		if self.operation.type == "diff" then
			local var156 = self.operation.value:encode()
			local var157, var158 = protoModule.writeTag(buff, var155, 1, protoModule.wireTypes.lengthDelimited)
			var157, var232 = protoModule.writeBuffer(var157, var158, var156, buffer.len(var156))
			buff = var157
			var155 = var158
		elseif self.operation.type == "action" then
			local var159 = self.operation.value:encode()
			local var160, var161 = protoModule.writeTag(buff, var155, 2, protoModule.wireTypes.lengthDelimited)
			var160, var235 = protoModule.writeBuffer(var160, var161, var159, buffer.len(var159))
			buff = var160
			var155 = var161
		end
	end
	local buff_1 = buffer.create(var155)
	buffer.copy(buff_1, 0, buff, 0, var155)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), structModule (ref), t (ref)
	local var155 = t_7.new()
	local var156 = 0
	while var156 < buffer.len(p7) do
		local _ = nil
		local var157 = nil
		local var158, var159, var160 = protoModule.readTag(p7, var156)
		local var161 = var158
		var157 = var159
		var156 = var160
		
		if var157 == protoModule.wireTypes.varint then
			local _ = nil
			local var162, var163 = protoModule.readVarInt(p7, var156)
			local _ = var162
			var156 = var163
			continue
		end
		if var157 == protoModule.wireTypes.lengthDelimited then
			if var161 == 1 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p7, var156)
				var156 = var165
				var155.operation = {
					type = "diff",
					value = structModule.Struct.decode(var164)
				}
			elseif var161 == 2 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p7, var156)
				var156 = var167
				var155.operation = { type = "action", value = t.FormAction.decode(var166) }
			else
				local _ = nil
				local var168, var169 = protoModule.readVarInt(p7, var156)
				var156 = var169 + var168
			end
		elseif var157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var170, var171 = protoModule.readFixed32(p7, var156)
			local _ = var170
			var156 = var171
		elseif var157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var172, var173 = protoModule.readFixed64(p7, var156)
			local _ = var172
			var156 = var173
		else
			error("Unsupported wire type: " .. var239)
		end
	end
	return var155
end

function t_7:jsonEncode()
	local t = {}
	
	if self.operation ~= nil then
		if self.operation.type == "diff" then
			t.diff = self.operation.value:jsonEncode()
			
			return t
		elseif self.operation.type == "action" then
			t.action = self.operation.value:jsonEncode()
		end
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), structModule (ref), t (ref)
	local var174 = t_7.new()
	
	if self.diff ~= nil then
		var174.operation = {
			type = "diff",
			value = structModule.Struct.jsonDecode(self.diff)
		}
	end
	if self.action ~= nil then
		var174.operation = {
			type = "action",
			value = t.FormAction.jsonDecode(self.action)
		}
	end
	return var174
end

t_7.descriptor = {
	name = "SaveSettingsFormRequest",
	fullName = "roblox.apppageplatform.settings.v1beta1.SaveSettingsFormRequest"
}
t.SaveSettingsFormRequest = t_7
typeRegistryModule.default:register(t.SaveSettingsFormRequest)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		name = if p8 == nil or p8.name == nil then "" else p8.name,
		status = if p8 == nil or p8.status == nil then 0 else p8.status,
		message = if p8 == nil or p8.message == nil then "" else p8.message
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var174 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var175, var176 = protoModule.writeTag(buff, var174, 1, protoModule.wireTypes.lengthDelimited)
		var175, var261 = protoModule.writeString(var175, var176, self.name)
		buff = var175
		var174 = var176
	end
	if self.status ~= nil and self.status ~= 0 then
		local var177, var178 = protoModule.writeTag(buff, var174, 2, protoModule.wireTypes.varint)
		var177, var263 = protoModule.writeVarInt(var177, var178, self.status)
		buff = var177
		var174 = var178
	end
	if self.message ~= nil and self.message ~= "" then
		local var179, var180 = protoModule.writeTag(buff, var174, 3, protoModule.wireTypes.lengthDelimited)
		var179, var265 = protoModule.writeString(var179, var180, self.message)
		buff = var179
		var174 = var180
	end
	local buff_1 = buffer.create(var174)
	buffer.copy(buff_1, 0, buff, 0, var174)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref)
	local var174 = t_8.new()
	local var175 = 0
	while var175 < buffer.len(p8) do
		local _ = nil
		local var176 = nil
		local var177, var178, var179 = protoModule.readTag(p8, var175)
		local var180 = var177
		var176 = var178
		var175 = var179
		
		if var176 == protoModule.wireTypes.varint then
			if var180 == 2 then
				local _ = nil
				local var181, var182 = protoModule.readVarIntI32(p8, var175)
				var175 = var182
				var174.status = var181
			else
				local _ = nil
				local var183, var184 = protoModule.readVarInt(p8, var175)
				local _ = var183
				var175 = var184
			end
		end
		if var176 == protoModule.wireTypes.lengthDelimited then
			if var180 == 1 then
				local _ = nil
				local var185, var186 = protoModule.readBuffer(p8, var175)
				var175 = var186
				var174.name = buffer.tostring(var185)
			elseif var180 == 3 then
				local _ = nil
				local var187, var188 = protoModule.readBuffer(p8, var175)
				var175 = var188
				var174.message = buffer.tostring(var187)
			else
				local _ = nil
				local var189, var190 = protoModule.readVarInt(p8, var175)
				var175 = var190 + var189
			end
		elseif var176 == protoModule.wireTypes.i32 then
			local _ = nil
			local var191, var192 = protoModule.readFixed32(p8, var175)
			local _ = var191
			var175 = var192
		elseif var176 == protoModule.wireTypes.i64 then
			local _ = nil
			local var193, var194 = protoModule.readFixed64(p8, var175)
			local _ = var193
			var175 = var194
		else
			error("Unsupported wire type: " .. var269)
		end
	end
	return var174
end

function t_8:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.status ~= nil and self.status ~= 0 then
		t.status = self.status
	end
	if self.message ~= nil and self.message ~= "" then
		t.message = self.message
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref)
	local var195 = t_8.new()
	
	if self.name ~= nil then
		var195.name = self.name
	end
	if self.status ~= nil then
		var195.status = self.status
	end
	if self.message ~= nil then
		var195.message = self.message
	end
	return var195
end

t_8.descriptor = {
	name = "FormWriteError",
	fullName = "roblox.apppageplatform.settings.v1beta1.FormWriteError"
}
t.FormWriteError = t_8
typeRegistryModule.default:register(t.FormWriteError)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		refreshed_data = if p9 == nil or p9.refreshed_data == nil then nil else p9.refreshed_data,
		committed_groups = if p9 == nil or p9.committed_groups == nil then {} else p9.committed_groups,
		write_errors = if p9 == nil or p9.write_errors == nil then {} else p9.write_errors
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var195 = 0
	
	if self.refreshed_data ~= nil then
		local var196 = self.refreshed_data:encode()
		local var197, var198 = protoModule.writeTag(buff, var195, 1, protoModule.wireTypes.lengthDelimited)
		var197, var294 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
		buff = var197
		var195 = var198
	end
	if self.committed_groups ~= nil and #self.committed_groups > 0 then
		for i, v in self.committed_groups do
			local var199, var200 = protoModule.writeTag(buff, var195, 2, protoModule.wireTypes.lengthDelimited)
			var199, var296 = protoModule.writeString(var199, var200, v)
			buff = var199
			var195 = var200
		end
	end
	if self.write_errors ~= nil and #self.write_errors > 0 then
		for i, v in self.write_errors do
			local var201 = v:encode()
			local var202, var203 = protoModule.writeTag(buff, var195, 3, protoModule.wireTypes.lengthDelimited)
			var202, var299 = protoModule.writeBuffer(var202, var203, var201, buffer.len(var201))
			buff = var202
			var195 = var203
		end
	end
	local buff_1 = buffer.create(var195)
	buffer.copy(buff_1, 0, buff, 0, var195)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), configDrivenFormDataModule (ref), t (ref)
	local var204 = t_9.new()
	local var205 = 0
	while var205 < buffer.len(p9) do
		local _ = nil
		local var206 = nil
		local var207, var208, var209 = protoModule.readTag(p9, var205)
		local var210 = var207
		var206 = var208
		var205 = var209
		
		if var206 == protoModule.wireTypes.varint then
			local _ = nil
			local var211, var212 = protoModule.readVarInt(p9, var205)
			local _ = var211
			var205 = var212
			continue
		end
		if var206 == protoModule.wireTypes.lengthDelimited then
			if var210 == 1 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p9, var205)
				var205 = var214
				var204.refreshed_data = configDrivenFormDataModule.ConfigDrivenFormInputData.decode(var213)
			elseif var210 == 2 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p9, var205)
				var205 = var216
				table.insert(var204.committed_groups, buffer.tostring(var215))
			elseif var210 == 3 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p9, var205)
				var205 = var218
				table.insert(var204.write_errors, t.FormWriteError.decode(var217))
			else
				local _ = nil
				local var219, var220 = protoModule.readVarInt(p9, var205)
				var205 = var220 + var219
			end
		elseif var206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var221, var222 = protoModule.readFixed32(p9, var205)
			local _ = var221
			var205 = var222
		elseif var206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var223, var224 = protoModule.readFixed64(p9, var205)
			local _ = var223
			var205 = var224
		else
			error("Unsupported wire type: " .. var303)
		end
	end
	return var204
end

function t_9:jsonEncode()
	local t = {}
	
	if self.refreshed_data ~= nil then
		t.refreshedData = self.refreshed_data:jsonEncode()
	end
	if self.committed_groups ~= nil and #self.committed_groups > 0 then
		local t_1 = {}
		
		for i, v in self.committed_groups do
			table.insert(t_1, v)
		end
		t.committedGroups = t_1
	end
	if self.write_errors ~= nil and #self.write_errors > 0 then
		local t_1 = {}
		
		for i, v in self.write_errors do
			table.insert(t_1, v:jsonEncode())
		end
		t.writeErrors = t_1
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), configDrivenFormDataModule (ref), t (ref)
	local var225 = t_9.new()
	
	if self.refreshed_data ~= nil then
		var225.refreshed_data = configDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.refreshed_data)
	end
	if self.refreshedData ~= nil then
		var225.refreshed_data = configDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.refreshedData)
	end
	if self.committed_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.committed_groups do
			table.insert(t_1, v)
		end
		var225.committed_groups = t_1
	end
	if self.committedGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.committedGroups do
			table.insert(t_1, v)
		end
		var225.committed_groups = t_1
	end
	if self.write_errors ~= nil then
		local t_1 = {}
		
		for i, v in self.write_errors do
			table.insert(t_1, t.FormWriteError.jsonDecode(v))
		end
		var225.write_errors = t_1
	end
	if self.writeErrors ~= nil then
		local t_1 = {}
		
		for i, v in self.writeErrors do
			table.insert(t_1, t.FormWriteError.jsonDecode(v))
		end
		var225.write_errors = t_1
	end
	return var225
end

t_9.descriptor = {
	name = "SaveSettingsFormResponse",
	fullName = "roblox.apppageplatform.settings.v1beta1.SaveSettingsFormResponse"
}
t.SaveSettingsFormResponse = t_9
typeRegistryModule.default:register(t.SaveSettingsFormResponse)

return {
	SettingsPageRequest = t.SettingsPageRequest,
	SettingsPageResponse = t.SettingsPageResponse,
	FormAction = t.FormAction,
	SaveSettingsFormRequest = t.SaveSettingsFormRequest,
	FormWriteError = t.FormWriteError,
	SaveSettingsFormResponse = t.SaveSettingsFormResponse
}