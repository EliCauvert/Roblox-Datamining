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
		universe_id = if p1 == nil or p1.universe_id == nil then 0 else p1.universe_id,
		initial_tab = if p1 == nil or p1.initial_tab == nil then "" else p1.initial_tab,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var15 = protoModule.writeVarInt(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var17 = protoModule.writeString(var4, var5, self.initial_tab)
		buff = var4
		var1 = var5
	end
	if self.client_capabilities ~= nil then
		local var6 = self.client_capabilities:encode()
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var20 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
		buff = var7
		var1 = var8
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var22 = protoModule.writeString(var9, var10, i)
			var9, var22 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var9, var22 = protoModule.writeString(var9, var10, v)
			local var11 = var9
			local var12 = var10
			local var13, var14 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var13, var26 = protoModule.writeBuffer(var13, var14, var11, var12)
			buff = var13
			var1 = var14
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), clientCapabilitiesModule (ref), t (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			if var21 == 1 then
				local _ = nil
				local var22, var23 = protoModule.readVarIntI64(p1, var16)
				var16 = var23
				var15.universe_id = var22
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var16)
				local _ = var24
				var16 = var25
			end
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 2 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var16)
				var16 = var27
				var15.initial_tab = buffer.tostring(var26)
			elseif var21 == 3 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var16)
				var16 = var29
				var15.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var28)
			elseif var21 == 4 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var16)
				var16 = var31
				var30 = t.ExperienceLeaderboardSeeAllRequest_CachedRobloxComponentToTemplateIdEntry.decode(var30)
				var15.cached_roblox_component_to_template_id[var30.key or ""] = var30.value or ""
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var16)
				var16 = var33 + var32
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var16)
			local _ = var34
			var16 = var35
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var16)
			local _ = var36
			var16 = var37
		else
			error("Unsupported wire type: " .. var30)
		end
	end
	return var15
end

function t_1:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		t.universeId = self.universe_id
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		t.initialTab = self.initial_tab
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local t_1 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_1[i] = v
		end
		t.cachedRobloxComponentToTemplateId = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), clientCapabilitiesModule (ref)
	local var38 = t_1.new()
	
	if self.universe_id ~= nil then
		var38.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var38.universe_id = self.universeId
	end
	if self.initial_tab ~= nil then
		var38.initial_tab = self.initial_tab
	end
	if self.initialTab ~= nil then
		var38.initial_tab = self.initialTab
	end
	if self.client_capabilities ~= nil then
		var38.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var38.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var38.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var38.cached_roblox_component_to_template_id = t
	end
	return var38
end

t_1.descriptor = {
	name = "ExperienceLeaderboardSeeAllRequest",
	fullName = "roblox.apppageplatform.experienceleaderboard.v1beta1.ExperienceLeaderboardSeeAllRequest"
}
t.ExperienceLeaderboardSeeAllRequest = t_1
typeRegistryModule.default:register(t.ExperienceLeaderboardSeeAllRequest)
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
	local var39 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var40, var41 = protoModule.writeTag(buff, var39, 1, protoModule.wireTypes.lengthDelimited)
		var40, var59 = protoModule.writeString(var40, var41, self.key)
		buff = var40
		var39 = var41
	end
	if self.value ~= nil and self.value ~= "" then
		local var42, var43 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var42, var61 = protoModule.writeString(var42, var43, self.value)
		buff = var42
		var39 = var43
	end
	local buff_1 = buffer.create(var39)
	buffer.copy(buff_1, 0, buff, 0, var39)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var39 = t_2.new()
	local var40 = 0
	while var40 < buffer.len(p2) do
		local _ = nil
		local var41 = nil
		local var42, var43, var44 = protoModule.readTag(p2, var40)
		local var45 = var42
		var41 = var43
		var40 = var44
		
		if var41 == protoModule.wireTypes.varint then
			local _ = nil
			local var46, var47 = protoModule.readVarInt(p2, var40)
			local _ = var46
			var40 = var47
			continue
		end
		if var41 == protoModule.wireTypes.lengthDelimited then
			if var45 == 1 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p2, var40)
				var40 = var49
				var39.key = buffer.tostring(var48)
			elseif var45 == 2 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p2, var40)
				var40 = var51
				var39.value = buffer.tostring(var50)
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p2, var40)
				var40 = var53 + var52
			end
		elseif var41 == protoModule.wireTypes.i32 then
			local _ = nil
			local var54, var55 = protoModule.readFixed32(p2, var40)
			local _ = var54
			var40 = var55
		elseif var41 == protoModule.wireTypes.i64 then
			local _ = nil
			local var56, var57 = protoModule.readFixed64(p2, var40)
			local _ = var56
			var40 = var57
		else
			error("Unsupported wire type: " .. var65)
		end
	end
	return var39
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
	local var58 = t_2.new()
	
	if self.key ~= nil then
		var58.key = self.key
	end
	if self.value ~= nil then
		var58.value = self.value
	end
	return var58
end

t_2.descriptor = {
	name = "ExperienceLeaderboardSeeAllRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.experienceleaderboard.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.ExperienceLeaderboardSeeAllRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.ExperienceLeaderboardSeeAllRequest_CachedRobloxComponentToTemplateIdEntry)
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
	local var58 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var59 = v:encode()
			local var60, var61 = protoModule.writeTag(buff, var58, 1, protoModule.wireTypes.lengthDelimited)
			var60, var88 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
			buff = var60
			var58 = var61
		end
	end
	if self.hydration_data ~= nil then
		local var62 = self.hydration_data:encode()
		local var63, var64 = protoModule.writeTag(buff, var58, 2, protoModule.wireTypes.lengthDelimited)
		var63, var91 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var58 = var64
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var65, var66 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var65, var93 = protoModule.writeString(var65, var66, i)
			local var67 = v:encode()
			var66, var95 = protoModule.writeTag(var65, var66, 2, protoModule.wireTypes.lengthDelimited)
			var66, var95 = protoModule.writeBuffer(var66, var95, var67, buffer.len(var67))
			local var68 = var66
			local var69 = var95
			local var70, var71 = protoModule.writeTag(buff, var58, 3, protoModule.wireTypes.lengthDelimited)
			var70, var99 = protoModule.writeBuffer(var70, var71, var68, var69)
			buff = var70
			var58 = var71
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var72, var73 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var72, var101 = protoModule.writeString(var72, var73, i)
			var72, var101 = protoModule.writeTag(var72, var73, 2, protoModule.wireTypes.lengthDelimited)
			var72, var101 = protoModule.writeString(var72, var73, v)
			local var74 = var72
			local var75 = var73
			local var76, var77 = protoModule.writeTag(buff, var58, 4, protoModule.wireTypes.lengthDelimited)
			var76, var105 = protoModule.writeBuffer(var76, var77, var74, var75)
			buff = var76
			var58 = var77
		end
	end
	local buff_1 = buffer.create(var58)
	buffer.copy(buff_1, 0, buff, 0, var58)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var78 = t_3.new()
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
				table.insert(var78.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var87))
			elseif var84 == 2 then
				local _ = nil
				local var89, var90 = protoModule.readBuffer(p3, var79)
				var79 = var90
				var78.hydration_data = hydrationContentModule.HydrationContent.decode(var89)
			elseif var84 == 3 then
				local _ = nil
				local var91, var92 = protoModule.readBuffer(p3, var79)
				var79 = var92
				var91 = t.ExperienceLeaderboardSeeAllResponse_TemplatesEntry.decode(var91)
				var78.templates[var91.key or ""] = var91.value or templateEntryModule.TemplateEntry.new()
			elseif var84 == 4 then
				local _ = nil
				local var93, var94 = protoModule.readBuffer(p3, var79)
				var79 = var94
				var93 = t.ExperienceLeaderboardSeeAllResponse_LocalizedLiteralsEntry.decode(var93)
				var78.localized_literals[var93.key or ""] = var93.value or ""
			else
				local _ = nil
				local var95, var96 = protoModule.readVarInt(p3, var79)
				var79 = var96 + var95
			end
		elseif var80 == protoModule.wireTypes.i32 then
			local _ = nil
			local var97, var98 = protoModule.readFixed32(p3, var79)
			local _ = var97
			var79 = var98
		elseif var80 == protoModule.wireTypes.i64 then
			local _ = nil
			local var99, var100 = protoModule.readFixed64(p3, var79)
			local _ = var99
			var79 = var100
		else
			error("Unsupported wire type: " .. var109)
		end
	end
	return var78
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
	local var101 = t_3.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var101.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var101.page_entries = t
	end
	if self.hydration_data ~= nil then
		var101.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var101.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var101.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var101.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var101.localized_literals = t
	end
	return var101
end

t_3.descriptor = {
	name = "ExperienceLeaderboardSeeAllResponse",
	fullName = "roblox.apppageplatform.experienceleaderboard.v1beta1.ExperienceLeaderboardSeeAllResponse"
}
t.ExperienceLeaderboardSeeAllResponse = t_3
typeRegistryModule.default:register(t.ExperienceLeaderboardSeeAllResponse)
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
	local var102 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var103, var104 = protoModule.writeTag(buff, var102, 1, protoModule.wireTypes.lengthDelimited)
		var103, var143 = protoModule.writeString(var103, var104, self.key)
		buff = var103
		var102 = var104
	end
	if self.value ~= nil then
		local var105 = self.value:encode()
		local var106, var107 = protoModule.writeTag(buff, var102, 2, protoModule.wireTypes.lengthDelimited)
		var106, var146 = protoModule.writeBuffer(var106, var107, var105, buffer.len(var105))
		buff = var106
		var102 = var107
	end
	local buff_1 = buffer.create(var102)
	buffer.copy(buff_1, 0, buff, 0, var102)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var102 = t_4.new()
	local var103 = 0
	while var103 < buffer.len(p4) do
		local _ = nil
		local var104 = nil
		local var105, var106, var107 = protoModule.readTag(p4, var103)
		local var108 = var105
		var104 = var106
		var103 = var107
		
		if var104 == protoModule.wireTypes.varint then
			local _ = nil
			local var109, var110 = protoModule.readVarInt(p4, var103)
			local _ = var109
			var103 = var110
			continue
		end
		if var104 == protoModule.wireTypes.lengthDelimited then
			if var108 == 1 then
				local _ = nil
				local var111, var112 = protoModule.readBuffer(p4, var103)
				var103 = var112
				var102.key = buffer.tostring(var111)
			elseif var108 == 2 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p4, var103)
				var103 = var114
				var102.value = templateEntryModule.TemplateEntry.decode(var113)
			else
				local _ = nil
				local var115, var116 = protoModule.readVarInt(p4, var103)
				var103 = var116 + var115
			end
		elseif var104 == protoModule.wireTypes.i32 then
			local _ = nil
			local var117, var118 = protoModule.readFixed32(p4, var103)
			local _ = var117
			var103 = var118
		elseif var104 == protoModule.wireTypes.i64 then
			local _ = nil
			local var119, var120 = protoModule.readFixed64(p4, var103)
			local _ = var119
			var103 = var120
		else
			error("Unsupported wire type: " .. var150)
		end
	end
	return var102
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
	local var121 = t_4.new()
	
	if self.key ~= nil then
		var121.key = self.key
	end
	if self.value ~= nil then
		var121.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var121
end

t_4.descriptor = {
	name = "ExperienceLeaderboardSeeAllResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.experienceleaderboard.v1beta1.TemplatesEntry"
}
t.ExperienceLeaderboardSeeAllResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.ExperienceLeaderboardSeeAllResponse_TemplatesEntry)
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
	local var121 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var122, var123 = protoModule.writeTag(buff, var121, 1, protoModule.wireTypes.lengthDelimited)
		var122, var172 = protoModule.writeString(var122, var123, self.key)
		buff = var122
		var121 = var123
	end
	if self.value ~= nil and self.value ~= "" then
		local var124, var125 = protoModule.writeTag(buff, var121, 2, protoModule.wireTypes.lengthDelimited)
		var124, var174 = protoModule.writeString(var124, var125, self.value)
		buff = var124
		var121 = var125
	end
	local buff_1 = buffer.create(var121)
	buffer.copy(buff_1, 0, buff, 0, var121)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var121 = t_5.new()
	local var122 = 0
	while var122 < buffer.len(p5) do
		local _ = nil
		local var123 = nil
		local var124, var125, var126 = protoModule.readTag(p5, var122)
		local var127 = var124
		var123 = var125
		var122 = var126
		
		if var123 == protoModule.wireTypes.varint then
			local _ = nil
			local var128, var129 = protoModule.readVarInt(p5, var122)
			local _ = var128
			var122 = var129
			continue
		end
		if var123 == protoModule.wireTypes.lengthDelimited then
			if var127 == 1 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p5, var122)
				var122 = var131
				var121.key = buffer.tostring(var130)
			elseif var127 == 2 then
				local _ = nil
				local var132, var133 = protoModule.readBuffer(p5, var122)
				var122 = var133
				var121.value = buffer.tostring(var132)
			else
				local _ = nil
				local var134, var135 = protoModule.readVarInt(p5, var122)
				var122 = var135 + var134
			end
		elseif var123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var136, var137 = protoModule.readFixed32(p5, var122)
			local _ = var136
			var122 = var137
		elseif var123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var138, var139 = protoModule.readFixed64(p5, var122)
			local _ = var138
			var122 = var139
		else
			error("Unsupported wire type: " .. var178)
		end
	end
	return var121
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
	local var140 = t_5.new()
	
	if self.key ~= nil then
		var140.key = self.key
	end
	if self.value ~= nil then
		var140.value = self.value
	end
	return var140
end

t_5.descriptor = {
	name = "ExperienceLeaderboardSeeAllResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.experienceleaderboard.v1beta1.LocalizedLiteralsEntry"
}
t.ExperienceLeaderboardSeeAllResponse_LocalizedLiteralsEntry = t_5
typeRegistryModule.default:register(t.ExperienceLeaderboardSeeAllResponse_LocalizedLiteralsEntry)

return {
	ExperienceLeaderboardSeeAllRequest = t.ExperienceLeaderboardSeeAllRequest,
	ExperienceLeaderboardSeeAllResponse = t.ExperienceLeaderboardSeeAllResponse
}