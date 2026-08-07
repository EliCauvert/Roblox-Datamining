-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:14 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 187 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		cached_roblox_component_to_template_id = if p0 == nil or p0.cached_roblox_component_to_template_id == nil then {} else p0.cached_roblox_component_to_template_id,
		client_capabilities = if p0 == nil or p0.client_capabilities == nil then nil else p0.client_capabilities
	}, t_1)
end

function t_1:encode() --[[ line: 201 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var13 = 0
	
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var14, var15 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeString(var14, var15, i)
			var14, var15 = protoModule.writeTag(var14, var15, 2, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeString(var14, var15, v)
			local var16 = var14
			local var17 = var15
			local var18, var19 = protoModule.writeTag(buff, var13, 1, protoModule.wireTypes.lengthDelimited)
			var18, var19 = protoModule.writeBuffer(var18, var19, var16, var17)
			buff = var18
			var13 = var19
		end
	end
	if self.client_capabilities ~= nil then
		local var20 = self.client_capabilities:encode()
		local var21, var22 = protoModule.writeTag(buff, var13, 2, protoModule.wireTypes.lengthDelimited)
		var21, var22 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var13 = var22
	end
	local buff_1 = buffer.create(var13)
	buffer.copy(buff_1, 0, buff, 0, var13)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 232 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var24 = t_1.new()
	local var25 = 0
	while var25 < buffer.len(p1) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p1, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			local _ = nil
			local var31, var32 = protoModule.readVarInt(p1, var25)
			local _ = var31
			var25 = var32
			continue
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 1 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var25)
				var25 = var34
				var33 = t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var33)
				var24.cached_roblox_component_to_template_id[var33.key or ""] = var33.value or ""
			elseif var30 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var25)
				var25 = var36
				var24.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var35)
			else
				local _ = nil
				local var37, var38 = protoModule.readVarInt(p1, var25)
				var25 = var38 + var37
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var39, var40 = protoModule.readFixed32(p1, var25)
			local _ = var39
			var25 = var40
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var41, var42 = protoModule.readFixed64(p1, var25)
			local _ = var41
			var25 = var42
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var24
end

function t_1:jsonEncode() --[[ line: 290 ]]
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

function t_1:jsonDecode() --[[ line: 311 ]]
	-- upvalues: t_1 (ref), clientCapabilitiesModule (ref)
	local var45 = t_1.new()
	
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var45.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var45.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var45.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var45.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var45
end

t_1.descriptor = {
	name = "ExperienceDetailsPageRequest",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.ExperienceDetailsPageRequest"
}
t.ExperienceDetailsPageRequest = t_1
typeRegistryModule.default:register(t.ExperienceDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 364 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 376 ]]
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

function t_2.decode(p3) --[[ line: 397 ]]
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

function t_2:jsonEncode() --[[ line: 447 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode() --[[ line: 463 ]]
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
	name = "ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.ExperienceDetailsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 494 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates,
		localized_literals = if p4 == nil or p4.localized_literals == nil then {} else p4.localized_literals
	}, t_3)
end

function t_3:encode() --[[ line: 505 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var77 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var78 = v:encode()
			local var79, var80 = protoModule.writeTag(buff, var77, 1, protoModule.wireTypes.lengthDelimited)
			var79, var80 = protoModule.writeBuffer(var79, var80, var78, buffer.len(var78))
			buff = var79
			var77 = var80
		end
	end
	if self.hydration_data ~= nil then
		local var81 = self.hydration_data:encode()
		local var82, var83 = protoModule.writeTag(buff, var77, 2, protoModule.wireTypes.lengthDelimited)
		var82, var83 = protoModule.writeBuffer(var82, var83, var81, buffer.len(var81))
		buff = var82
		var77 = var83
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var84, var85 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var84, var85 = protoModule.writeString(var84, var85, i)
			local var86 = v:encode()
			var85, var87 = protoModule.writeTag(var84, var85, 2, protoModule.wireTypes.lengthDelimited)
			var85, var87 = protoModule.writeBuffer(var85, var87, var86, buffer.len(var86))
			local var88 = var85
			local var89 = var87
			local var90, var91 = protoModule.writeTag(buff, var77, 3, protoModule.wireTypes.lengthDelimited)
			var90, var91 = protoModule.writeBuffer(var90, var91, var88, var89)
			buff = var90
			var77 = var91
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var92, var93 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var92, var93 = protoModule.writeString(var92, var93, i)
			var92, var93 = protoModule.writeTag(var92, var93, 2, protoModule.wireTypes.lengthDelimited)
			var92, var93 = protoModule.writeString(var92, var93, v)
			local var94 = var92
			local var95 = var93
			local var96, var97 = protoModule.writeTag(buff, var77, 4, protoModule.wireTypes.lengthDelimited)
			var96, var97 = protoModule.writeBuffer(var96, var97, var94, var95)
			buff = var96
			var77 = var97
		end
	end
	local buff_1 = buffer.create(var77)
	buffer.copy(buff_1, 0, buff, 0, var77)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 555 ]]
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var99 = t_3.new()
	local var100 = 0
	while var100 < buffer.len(p5) do
		local _ = nil
		local var101 = nil
		local var102, var103, var104 = protoModule.readTag(p5, var100)
		local var105 = var102
		var101 = var103
		var100 = var104
		
		if var101 == protoModule.wireTypes.varint then
			local _ = nil
			local var106, var107 = protoModule.readVarInt(p5, var100)
			local _ = var106
			var100 = var107
			continue
		end
		if var101 == protoModule.wireTypes.lengthDelimited then
			if var105 == 1 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p5, var100)
				var100 = var109
				table.insert(var99.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var108))
			elseif var105 == 2 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p5, var100)
				var100 = var111
				var99.hydration_data = hydrationContentModule.HydrationContent.decode(var110)
			elseif var105 == 3 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p5, var100)
				var100 = var113
				var112 = t.ExperienceDetailsPageResponse_TemplatesEntry.decode(var112)
				var99.templates[var112.key or ""] = var112.value or templateEntryModule.TemplateEntry.new()
			elseif var105 == 4 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p5, var100)
				var100 = var115
				var114 = t.ExperienceDetailsPageResponse_LocalizedLiteralsEntry.decode(var114)
				var99.localized_literals[var114.key or ""] = var114.value or ""
			else
				local _ = nil
				local var116, var117 = protoModule.readVarInt(p5, var100)
				var100 = var117 + var116
			end
		elseif var101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var118, var119 = protoModule.readFixed32(p5, var100)
			local _ = var118
			var100 = var119
		elseif var101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var120, var121 = protoModule.readFixed64(p5, var100)
			local _ = var120
			var100 = var121
		else
			error("Unsupported wire type: " .. var101)
		end
	end
	return var99
end

function t_3:jsonEncode() --[[ line: 631 ]]
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

function t_3:jsonDecode() --[[ line: 665 ]]
	-- upvalues: t_3 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var126 = t_3.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var126.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var126.page_entries = t
	end
	if self.hydration_data ~= nil then
		var126.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var126.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var126.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var126.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var126.localized_literals = t
	end
	return var126
end

t_3.descriptor = {
	name = "ExperienceDetailsPageResponse",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.ExperienceDetailsPageResponse"
}
t.ExperienceDetailsPageResponse = t_3
typeRegistryModule.default:register(t.ExperienceDetailsPageResponse)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 748 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 757 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var134, var135 = protoModule.writeString(var134, var135, self.key)
		buff = var134
		var133 = var135
	end
	if self.value ~= nil then
		local var136 = self.value:encode()
		local var137, var138 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var137, var138 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
		buff = var137
		var133 = var138
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 779 ]]
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var140 = t_4.new()
	local var141 = 0
	while var141 < buffer.len(p7) do
		local _ = nil
		local var142 = nil
		local var143, var144, var145 = protoModule.readTag(p7, var141)
		local var146 = var143
		var142 = var144
		var141 = var145
		
		if var142 == protoModule.wireTypes.varint then
			local _ = nil
			local var147, var148 = protoModule.readVarInt(p7, var141)
			local _ = var147
			var141 = var148
			continue
		end
		if var142 == protoModule.wireTypes.lengthDelimited then
			if var146 == 1 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p7, var141)
				var141 = var150
				var140.key = buffer.tostring(var149)
			elseif var146 == 2 then
				local _ = nil
				local var151, var152 = protoModule.readBuffer(p7, var141)
				var141 = var152
				var140.value = templateEntryModule.TemplateEntry.decode(var151)
			else
				local _ = nil
				local var153, var154 = protoModule.readVarInt(p7, var141)
				var141 = var154 + var153
			end
		elseif var142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var155, var156 = protoModule.readFixed32(p7, var141)
			local _ = var155
			var141 = var156
		elseif var142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var157, var158 = protoModule.readFixed64(p7, var141)
			local _ = var157
			var141 = var158
		else
			error("Unsupported wire type: " .. var142)
		end
	end
	return var140
end

function t_4:jsonEncode() --[[ line: 829 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode() --[[ line: 845 ]]
	-- upvalues: t_4 (ref), templateEntryModule (ref)
	local var160 = t_4.new()
	
	if self.key ~= nil then
		var160.key = self.key
	end
	if self.value ~= nil then
		var160.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var160
end

t_4.descriptor = {
	name = "ExperienceDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.experiencedetails.v1beta1.TemplatesEntry"
}
t.ExperienceDetailsPageResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.ExperienceDetailsPageResponse_TemplatesEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 876 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then "" else p8.value
	}, t_5)
end

function t_5:encode() --[[ line: 888 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var162 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var163, var164 = protoModule.writeTag(buff, var162, 1, protoModule.wireTypes.lengthDelimited)
		var163, var164 = protoModule.writeString(var163, var164, self.key)
		buff = var163
		var162 = var164
	end
	if self.value ~= nil and self.value ~= "" then
		local var165, var166 = protoModule.writeTag(buff, var162, 2, protoModule.wireTypes.lengthDelimited)
		var165, var166 = protoModule.writeString(var165, var166, self.value)
		buff = var165
		var162 = var166
	end
	local buff_1 = buffer.create(var162)
	buffer.copy(buff_1, 0, buff, 0, var162)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 909 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var168 = t_5.new()
	local var169 = 0
	while var169 < buffer.len(p9) do
		local _ = nil
		local var170 = nil
		local var171, var172, var173 = protoModule.readTag(p9, var169)
		local var174 = var171
		var170 = var172
		var169 = var173
		
		if var170 == protoModule.wireTypes.varint then
			local _ = nil
			local var175, var176 = protoModule.readVarInt(p9, var169)
			local _ = var175
			var169 = var176
			continue
		end
		if var170 == protoModule.wireTypes.lengthDelimited then
			if var174 == 1 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p9, var169)
				var169 = var178
				var168.key = buffer.tostring(var177)
			elseif var174 == 2 then
				local _ = nil
				local var179, var180 = protoModule.readBuffer(p9, var169)
				var169 = var180
				var168.value = buffer.tostring(var179)
			else
				local _ = nil
				local var181, var182 = protoModule.readVarInt(p9, var169)
				var169 = var182 + var181
			end
		elseif var170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var183, var184 = protoModule.readFixed32(p9, var169)
			local _ = var183
			var169 = var184
		elseif var170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var185, var186 = protoModule.readFixed64(p9, var169)
			local _ = var185
			var169 = var186
		else
			error("Unsupported wire type: " .. var170)
		end
	end
	return var168
end

function t_5:jsonEncode() --[[ line: 959 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode() --[[ line: 975 ]]
	-- upvalues: t_5 (ref)
	local var188 = t_5.new()
	
	if self.key ~= nil then
		var188.key = self.key
	end
	if self.value ~= nil then
		var188.value = self.value
	end
	return var188
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