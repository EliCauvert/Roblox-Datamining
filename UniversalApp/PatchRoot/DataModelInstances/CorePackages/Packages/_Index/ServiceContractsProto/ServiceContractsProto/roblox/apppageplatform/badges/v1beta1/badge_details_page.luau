local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: pageEntryContentModule (ref), t_1 (ref)
	return setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then 0 else p1.badge_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id,
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var22 = protoModule.writeVarInt(var2, var3, self.badge_id)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var24 = protoModule.writeVarInt(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var26 = protoModule.writeVarInt(var6, var7, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var6
		var1 = var7
	end
	if self.client_capabilities ~= nil then
		local var8 = self.client_capabilities:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var29 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref), clientCapabilitiesModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.badge_id = var8
			elseif var7 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.user_id = var10
			elseif var7 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				local var14 = var12
				var2 = var13
				var1.page_entry_format = pageEntryContentModule.PageEntryFormat.fromNumber(var14) or var14
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				local _ = var15
				var2 = var16
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 4 then
				local _ = nil
				local var17, var18 = protoModule.readBuffer(p1, var2)
				var2 = var18
				var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var17)
			else
				local _ = nil
				local var19, var20 = protoModule.readVarInt(p1, var2)
				var2 = var20 + var19
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var21, var22 = protoModule.readFixed32(p1, var2)
			local _ = var21
			var2 = var22
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var23, var24 = protoModule.readFixed64(p1, var2)
			local _ = var23
			var2 = var24
		else
			error("Unsupported wire type: " .. var33)
		end
	end
	return var1
end

function t_1:jsonEncode()
	-- upvalues: pageEntryContentModule (ref)
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		t.badgeId = self.badge_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		t.pageEntryFormat = if typeof(self.page_entry_format) == "number" then self.page_entry_format else pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format)
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryContentModule (ref), clientCapabilitiesModule (ref)
	local var25 = t_1.new()
	
	if self.badge_id ~= nil then
		var25.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var25.badge_id = self.badgeId
	end
	if self.user_id ~= nil then
		var25.user_id = self.user_id
	end
	if self.userId ~= nil then
		var25.user_id = self.userId
	end
	if self.page_entry_format ~= nil then
		var25.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var25.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	if self.client_capabilities ~= nil then
		var25.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var25.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var25
end

t_1.descriptor = {
	name = "BadgeDetailsPageRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageRequest"
}
t.BadgeDetailsPageRequest = t_1
typeRegistryModule.default:register(t.BadgeDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var25 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var26 = v:encode()
			local var27, var28 = protoModule.writeTag(buff, var25, 1, protoModule.wireTypes.lengthDelimited)
			var27, var61 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
			buff = var27
			var25 = var28
		end
	end
	if self.hydration_data ~= nil then
		local var29 = self.hydration_data:encode()
		local var30, var31 = protoModule.writeTag(buff, var25, 2, protoModule.wireTypes.lengthDelimited)
		var30, var64 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var25 = var31
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var32, var33 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var32, var66 = protoModule.writeString(var32, var33, i)
			local var34 = v:encode()
			var33, var68 = protoModule.writeTag(var32, var33, 2, protoModule.wireTypes.lengthDelimited)
			var33, var68 = protoModule.writeBuffer(var33, var68, var34, buffer.len(var34))
			local var35 = var33
			local var36 = var68
			local var37, var38 = protoModule.writeTag(buff, var25, 3, protoModule.wireTypes.lengthDelimited)
			var37, var72 = protoModule.writeBuffer(var37, var38, var35, var36)
			buff = var37
			var25 = var38
		end
	end
	local buff_1 = buffer.create(var25)
	buffer.copy(buff_1, 0, buff, 0, var25)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
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
				table.insert(var39.page_entries, t.BadgeDetailsPageEntry.decode(var48))
			elseif var45 == 2 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p2, var40)
				var40 = var51
				var39.hydration_data = hydrationContentModule.HydrationContent.decode(var50)
			elseif var45 == 3 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p2, var40)
				var40 = var53
				var52 = t.BadgeDetailsPageResponse_TemplatesEntry.decode(var52)
				var39.templates[var52.key or ""] = var52.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var54, var55 = protoModule.readVarInt(p2, var40)
				var40 = var55 + var54
			end
		elseif var41 == protoModule.wireTypes.i32 then
			local _ = nil
			local var56, var57 = protoModule.readFixed32(p2, var40)
			local _ = var56
			var40 = var57
		elseif var41 == protoModule.wireTypes.i64 then
			local _ = nil
			local var58, var59 = protoModule.readFixed64(p2, var40)
			local _ = var58
			var40 = var59
		else
			error("Unsupported wire type: " .. var76)
		end
	end
	return var39
end

function t_2:jsonEncode()
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
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var60 = t_2.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var60.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var60.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var60.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var60.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var60.templates = t_1
	end
	return var60
end

t_2.descriptor = {
	name = "BadgeDetailsPageResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageResponse"
}
t.BadgeDetailsPageResponse = t_2
typeRegistryModule.default:register(t.BadgeDetailsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var61 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var62, var63 = protoModule.writeTag(buff, var61, 1, protoModule.wireTypes.lengthDelimited)
		var62, var105 = protoModule.writeString(var62, var63, self.key)
		buff = var62
		var61 = var63
	end
	if self.value ~= nil then
		local var64 = self.value:encode()
		local var65, var66 = protoModule.writeTag(buff, var61, 2, protoModule.wireTypes.lengthDelimited)
		var65, var108 = protoModule.writeBuffer(var65, var66, var64, buffer.len(var64))
		buff = var65
		var61 = var66
	end
	local buff_1 = buffer.create(var61)
	buffer.copy(buff_1, 0, buff, 0, var61)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
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
			local _ = nil
			local var68, var69 = protoModule.readVarInt(p3, var62)
			local _ = var68
			var62 = var69
			continue
		end
		if var63 == protoModule.wireTypes.lengthDelimited then
			if var67 == 1 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var62)
				var62 = var71
				var61.key = buffer.tostring(var70)
			elseif var67 == 2 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var62)
				var62 = var73
				var61.value = templateEntryModule.TemplateEntry.decode(var72)
			else
				local _ = nil
				local var74, var75 = protoModule.readVarInt(p3, var62)
				var62 = var75 + var74
			end
		elseif var63 == protoModule.wireTypes.i32 then
			local _ = nil
			local var76, var77 = protoModule.readFixed32(p3, var62)
			local _ = var76
			var62 = var77
		elseif var63 == protoModule.wireTypes.i64 then
			local _ = nil
			local var78, var79 = protoModule.readFixed64(p3, var62)
			local _ = var78
			var62 = var79
		else
			error("Unsupported wire type: " .. var112)
		end
	end
	return var61
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var80 = t_3.new()
	
	if self.key ~= nil then
		var80.key = self.key
	end
	if self.value ~= nil then
		var80.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var80
end

t_3.descriptor = {
	name = "BadgeDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.BadgeDetailsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var80 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var81 = v:encode()
			local var82, var83 = protoModule.writeTag(buff, var80, 1, protoModule.wireTypes.lengthDelimited)
			var82, var135 = protoModule.writeBuffer(var82, var83, var81, buffer.len(var81))
			buff = var82
			var80 = var83
		end
	end
	if self.hydration_data ~= nil then
		local var84 = self.hydration_data:encode()
		local var85, var86 = protoModule.writeTag(buff, var80, 2, protoModule.wireTypes.lengthDelimited)
		var85, var138 = protoModule.writeBuffer(var85, var86, var84, buffer.len(var84))
		buff = var85
		var80 = var86
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var87, var88 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var87, var140 = protoModule.writeString(var87, var88, i)
			local var89 = v:encode()
			var88, var142 = protoModule.writeTag(var87, var88, 2, protoModule.wireTypes.lengthDelimited)
			var88, var142 = protoModule.writeBuffer(var88, var142, var89, buffer.len(var89))
			local var90 = var88
			local var91 = var142
			local var92, var93 = protoModule.writeTag(buff, var80, 3, protoModule.wireTypes.lengthDelimited)
			var92, var146 = protoModule.writeBuffer(var92, var93, var90, var91)
			buff = var92
			var80 = var93
		end
	end
	local buff_1 = buffer.create(var80)
	buffer.copy(buff_1, 0, buff, 0, var80)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
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
				table.insert(var94.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var103))
			elseif var100 == 2 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p4, var95)
				var95 = var106
				var94.hydration_data = hydrationContentModule.HydrationContent.decode(var105)
			elseif var100 == 3 then
				local _ = nil
				local var107, var108 = protoModule.readBuffer(p4, var95)
				var95 = var108
				var107 = t.BadgeDetailsPageV2Response_TemplatesEntry.decode(var107)
				var94.templates[var107.key or ""] = var107.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var109, var110 = protoModule.readVarInt(p4, var95)
				var95 = var110 + var109
			end
		elseif var96 == protoModule.wireTypes.i32 then
			local _ = nil
			local var111, var112 = protoModule.readFixed32(p4, var95)
			local _ = var111
			var95 = var112
		elseif var96 == protoModule.wireTypes.i64 then
			local _ = nil
			local var113, var114 = protoModule.readFixed64(p4, var95)
			local _ = var113
			var95 = var114
		else
			error("Unsupported wire type: " .. var150)
		end
	end
	return var94
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
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var115 = t_4.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var115.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var115.page_entries = t
	end
	if self.hydration_data ~= nil then
		var115.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var115.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var115.templates = t
	end
	return var115
end

t_4.descriptor = {
	name = "BadgeDetailsPageV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageV2Response"
}
t.BadgeDetailsPageV2Response = t_4
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response)
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
	local var116 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var117, var118 = protoModule.writeTag(buff, var116, 1, protoModule.wireTypes.lengthDelimited)
		var117, var179 = protoModule.writeString(var117, var118, self.key)
		buff = var117
		var116 = var118
	end
	if self.value ~= nil then
		local var119 = self.value:encode()
		local var120, var121 = protoModule.writeTag(buff, var116, 2, protoModule.wireTypes.lengthDelimited)
		var120, var182 = protoModule.writeBuffer(var120, var121, var119, buffer.len(var119))
		buff = var120
		var116 = var121
	end
	local buff_1 = buffer.create(var116)
	buffer.copy(buff_1, 0, buff, 0, var116)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var116 = t_5.new()
	local var117 = 0
	while var117 < buffer.len(p5) do
		local _ = nil
		local var118 = nil
		local var119, var120, var121 = protoModule.readTag(p5, var117)
		local var122 = var119
		var118 = var120
		var117 = var121
		
		if var118 == protoModule.wireTypes.varint then
			local _ = nil
			local var123, var124 = protoModule.readVarInt(p5, var117)
			local _ = var123
			var117 = var124
			continue
		end
		if var118 == protoModule.wireTypes.lengthDelimited then
			if var122 == 1 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var117)
				var117 = var126
				var116.key = buffer.tostring(var125)
			elseif var122 == 2 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p5, var117)
				var117 = var128
				var116.value = templateEntryModule.TemplateEntry.decode(var127)
			else
				local _ = nil
				local var129, var130 = protoModule.readVarInt(p5, var117)
				var117 = var130 + var129
			end
		elseif var118 == protoModule.wireTypes.i32 then
			local _ = nil
			local var131, var132 = protoModule.readFixed32(p5, var117)
			local _ = var131
			var117 = var132
		elseif var118 == protoModule.wireTypes.i64 then
			local _ = nil
			local var133, var134 = protoModule.readFixed64(p5, var117)
			local _ = var133
			var117 = var134
		else
			error("Unsupported wire type: " .. var186)
		end
	end
	return var116
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
	local var135 = t_5.new()
	
	if self.key ~= nil then
		var135.key = self.key
	end
	if self.value ~= nil then
		var135.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var135
end

t_5.descriptor = {
	name = "BadgeDetailsPageV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageV2Response_TemplatesEntry = t_5
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entry = if p6 == nil or p6.page_entry == nil then nil else p6.page_entry,
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var135 = 0
	
	if self.page_entry ~= nil then
		local var136 = self.page_entry:encode()
		local var137, var138 = protoModule.writeTag(buff, var135, 1, protoModule.wireTypes.lengthDelimited)
		var137, var209 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
		buff = var137
		var135 = var138
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		local var139 = self.kind.value:encode()
		local var140, var141 = protoModule.writeTag(buff, var135, 2, protoModule.wireTypes.lengthDelimited)
		var140, var212 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
		buff = var140
		var135 = var141
	end
	local buff_1 = buffer.create(var135)
	buffer.copy(buff_1, 0, buff, 0, var135)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var135 = t_6.new()
	local var136 = 0
	while var136 < buffer.len(p6) do
		local _ = nil
		local var137 = nil
		local var138, var139, var140 = protoModule.readTag(p6, var136)
		local var141 = var138
		var137 = var139
		var136 = var140
		
		if var137 == protoModule.wireTypes.varint then
			local _ = nil
			local var142, var143 = protoModule.readVarInt(p6, var136)
			local _ = var142
			var136 = var143
			continue
		end
		if var137 == protoModule.wireTypes.lengthDelimited then
			if var141 == 1 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p6, var136)
				var136 = var145
				var135.page_entry = pageEntryModule.PageEntry.decode(var144)
			elseif var141 == 2 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p6, var136)
				var136 = var147
				var135.kind = {
					type = "badge_details",
					value = t.BadgeDetailsContent.decode(var146)
				}
			else
				local _ = nil
				local var148, var149 = protoModule.readVarInt(p6, var136)
				var136 = var149 + var148
			end
		elseif var137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var150, var151 = protoModule.readFixed32(p6, var136)
			local _ = var150
			var136 = var151
		elseif var137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var152, var153 = protoModule.readFixed64(p6, var136)
			local _ = var152
			var136 = var153
		else
			error("Unsupported wire type: " .. var216)
		end
	end
	return var135
end

function t_6:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		t.badgeDetails = self.kind.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), pageEntryModule (ref), t (ref)
	local var154 = t_6.new()
	
	if self.page_entry ~= nil then
		var154.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var154.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badge_details ~= nil then
		var154.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var154.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badgeDetails)
		}
	end
	return var154
end

t_6.descriptor = {
	name = "BadgeDetailsPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageEntry"
}
t.BadgeDetailsPageEntry = t_6
typeRegistryModule.default:register(t.BadgeDetailsPageEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p7 == nil or p7.badge_id == nil then "" else p7.badge_id,
		universe_id = if p7 == nil or p7.universe_id == nil then "" else p7.universe_id,
		localized_literals = if p7 == nil or p7.localized_literals == nil then nil else p7.localized_literals,
		creator_key = if p7 == nil or p7.creator_key == nil then "" else p7.creator_key
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var154 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var155, var156 = protoModule.writeTag(buff, var154, 1, protoModule.wireTypes.lengthDelimited)
		var155, var238 = protoModule.writeString(var155, var156, self.badge_id)
		buff = var155
		var154 = var156
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var157, var158 = protoModule.writeTag(buff, var154, 2, protoModule.wireTypes.lengthDelimited)
		var157, var240 = protoModule.writeString(var157, var158, self.universe_id)
		buff = var157
		var154 = var158
	end
	if self.localized_literals ~= nil then
		local var159 = self.localized_literals:encode()
		local var160, var161 = protoModule.writeTag(buff, var154, 3, protoModule.wireTypes.lengthDelimited)
		var160, var243 = protoModule.writeBuffer(var160, var161, var159, buffer.len(var159))
		buff = var160
		var154 = var161
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var162, var163 = protoModule.writeTag(buff, var154, 4, protoModule.wireTypes.lengthDelimited)
		var162, var245 = protoModule.writeString(var162, var163, self.creator_key)
		buff = var162
		var154 = var163
	end
	local buff_1 = buffer.create(var154)
	buffer.copy(buff_1, 0, buff, 0, var154)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var154 = t_7.new()
	local var155 = 0
	while var155 < buffer.len(p7) do
		local _ = nil
		local var156 = nil
		local var157, var158, var159 = protoModule.readTag(p7, var155)
		local var160 = var157
		var156 = var158
		var155 = var159
		
		if var156 == protoModule.wireTypes.varint then
			local _ = nil
			local var161, var162 = protoModule.readVarInt(p7, var155)
			local _ = var161
			var155 = var162
			continue
		end
		if var156 == protoModule.wireTypes.lengthDelimited then
			if var160 == 1 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p7, var155)
				var155 = var164
				var154.badge_id = buffer.tostring(var163)
			elseif var160 == 2 then
				local _ = nil
				local var165, var166 = protoModule.readBuffer(p7, var155)
				var155 = var166
				var154.universe_id = buffer.tostring(var165)
			elseif var160 == 3 then
				local _ = nil
				local var167, var168 = protoModule.readBuffer(p7, var155)
				var155 = var168
				var154.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.decode(var167)
			elseif var160 == 4 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p7, var155)
				var155 = var170
				var154.creator_key = buffer.tostring(var169)
			else
				local _ = nil
				local var171, var172 = protoModule.readVarInt(p7, var155)
				var155 = var172 + var171
			end
		elseif var156 == protoModule.wireTypes.i32 then
			local _ = nil
			local var173, var174 = protoModule.readFixed32(p7, var155)
			local _ = var173
			var155 = var174
		elseif var156 == protoModule.wireTypes.i64 then
			local _ = nil
			local var175, var176 = protoModule.readFixed64(p7, var155)
			local _ = var175
			var155 = var176
		else
			error("Unsupported wire type: " .. var249)
		end
	end
	return var154
end

function t_7:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.localized_literals ~= nil then
		t.localizedLiterals = self.localized_literals:jsonEncode()
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var177 = t_7.new()
	
	if self.badge_id ~= nil then
		var177.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var177.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var177.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var177.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var177.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var177.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var177.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var177.creator_key = self.creatorKey
	end
	return var177
end

t_7.descriptor = {
	name = "BadgeDetailsContent",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsContent"
}
t.BadgeDetailsContent = t_7
typeRegistryModule.default:register(t.BadgeDetailsContent)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		info_table = if p8 == nil or p8.info_table == nil then nil else p8.info_table,
		action_module = if p8 == nil or p8.action_module == nil then nil else p8.action_module,
		overflow_menu = if p8 == nil or p8.overflow_menu == nil then nil else p8.overflow_menu
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var177 = 0
	
	if self.info_table ~= nil then
		local var178 = self.info_table:encode()
		local var179, var180 = protoModule.writeTag(buff, var177, 1, protoModule.wireTypes.lengthDelimited)
		var179, var276 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
		buff = var179
		var177 = var180
	end
	if self.action_module ~= nil then
		local var181 = self.action_module:encode()
		local var182, var183 = protoModule.writeTag(buff, var177, 2, protoModule.wireTypes.lengthDelimited)
		var182, var279 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
		buff = var182
		var177 = var183
	end
	if self.overflow_menu ~= nil then
		local var184 = self.overflow_menu:encode()
		local var185, var186 = protoModule.writeTag(buff, var177, 3, protoModule.wireTypes.lengthDelimited)
		var185, var282 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
		buff = var185
		var177 = var186
	end
	local buff_1 = buffer.create(var177)
	buffer.copy(buff_1, 0, buff, 0, var177)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var177 = t_8.new()
	local var178 = 0
	while var178 < buffer.len(p8) do
		local _ = nil
		local var179 = nil
		local var180, var181, var182 = protoModule.readTag(p8, var178)
		local var183 = var180
		var179 = var181
		var178 = var182
		
		if var179 == protoModule.wireTypes.varint then
			local _ = nil
			local var184, var185 = protoModule.readVarInt(p8, var178)
			local _ = var184
			var178 = var185
			continue
		end
		if var179 == protoModule.wireTypes.lengthDelimited then
			if var183 == 1 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p8, var178)
				var178 = var187
				var177.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.decode(var186)
			elseif var183 == 2 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p8, var178)
				var178 = var189
				var177.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.decode(var188)
			elseif var183 == 3 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p8, var178)
				var178 = var191
				var177.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.decode(var190)
			else
				local _ = nil
				local var192, var193 = protoModule.readVarInt(p8, var178)
				var178 = var193 + var192
			end
		elseif var179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var194, var195 = protoModule.readFixed32(p8, var178)
			local _ = var194
			var178 = var195
		elseif var179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var196, var197 = protoModule.readFixed64(p8, var178)
			local _ = var196
			var178 = var197
		else
			error("Unsupported wire type: " .. var286)
		end
	end
	return var177
end

function t_8:jsonEncode()
	local t = {}
	
	if self.info_table ~= nil then
		t.infoTable = self.info_table:jsonEncode()
	end
	if self.action_module ~= nil then
		t.actionModule = self.action_module:jsonEncode()
	end
	if self.overflow_menu ~= nil then
		t.overflowMenu = self.overflow_menu:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var198 = t_8.new()
	
	if self.info_table ~= nil then
		var198.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var198.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var198.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var198.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var198.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var198.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var198
end

t_8.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals",
	fullName = "roblox.apppageplatform.badges.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsContent_LocalizedLiterals = t_8
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		type_label = if p9 == nil or p9.type_label == nil then "" else p9.type_label,
		earned_label = if p9 == nil or p9.earned_label == nil then "" else p9.earned_label,
		updated_label = if p9 == nil or p9.updated_label == nil then "" else p9.updated_label,
		experience_label = if p9 == nil or p9.experience_label == nil then "" else p9.experience_label,
		rarity_label = if p9 == nil or p9.rarity_label == nil then "" else p9.rarity_label,
		won_yesterday_label = if p9 == nil or p9.won_yesterday_label == nil then "" else p9.won_yesterday_label,
		won_ever_label = if p9 == nil or p9.won_ever_label == nil then "" else p9.won_ever_label
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var198 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var199, var200 = protoModule.writeTag(buff, var198, 1, protoModule.wireTypes.lengthDelimited)
		var199, var310 = protoModule.writeString(var199, var200, self.type_label)
		buff = var199
		var198 = var200
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var201, var202 = protoModule.writeTag(buff, var198, 2, protoModule.wireTypes.lengthDelimited)
		var201, var312 = protoModule.writeString(var201, var202, self.earned_label)
		buff = var201
		var198 = var202
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var203, var204 = protoModule.writeTag(buff, var198, 3, protoModule.wireTypes.lengthDelimited)
		var203, var314 = protoModule.writeString(var203, var204, self.updated_label)
		buff = var203
		var198 = var204
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var205, var206 = protoModule.writeTag(buff, var198, 4, protoModule.wireTypes.lengthDelimited)
		var205, var316 = protoModule.writeString(var205, var206, self.experience_label)
		buff = var205
		var198 = var206
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var207, var208 = protoModule.writeTag(buff, var198, 5, protoModule.wireTypes.lengthDelimited)
		var207, var318 = protoModule.writeString(var207, var208, self.rarity_label)
		buff = var207
		var198 = var208
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var209, var210 = protoModule.writeTag(buff, var198, 6, protoModule.wireTypes.lengthDelimited)
		var209, var320 = protoModule.writeString(var209, var210, self.won_yesterday_label)
		buff = var209
		var198 = var210
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var211, var212 = protoModule.writeTag(buff, var198, 7, protoModule.wireTypes.lengthDelimited)
		var211, var322 = protoModule.writeString(var211, var212, self.won_ever_label)
		buff = var211
		var198 = var212
	end
	local buff_1 = buffer.create(var198)
	buffer.copy(buff_1, 0, buff, 0, var198)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var198 = t_9.new()
	local var199 = 0
	while var199 < buffer.len(p9) do
		local _ = nil
		local var200 = nil
		local var201, var202, var203 = protoModule.readTag(p9, var199)
		local var204 = var201
		var200 = var202
		var199 = var203
		
		if var200 == protoModule.wireTypes.varint then
			local _ = nil
			local var205, var206 = protoModule.readVarInt(p9, var199)
			local _ = var205
			var199 = var206
			continue
		end
		if var200 == protoModule.wireTypes.lengthDelimited then
			if var204 == 1 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p9, var199)
				var199 = var208
				var198.type_label = buffer.tostring(var207)
			elseif var204 == 2 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p9, var199)
				var199 = var210
				var198.earned_label = buffer.tostring(var209)
			elseif var204 == 3 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p9, var199)
				var199 = var212
				var198.updated_label = buffer.tostring(var211)
			elseif var204 == 4 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p9, var199)
				var199 = var214
				var198.experience_label = buffer.tostring(var213)
			elseif var204 == 5 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p9, var199)
				var199 = var216
				var198.rarity_label = buffer.tostring(var215)
			elseif var204 == 6 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p9, var199)
				var199 = var218
				var198.won_yesterday_label = buffer.tostring(var217)
			elseif var204 == 7 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p9, var199)
				var199 = var220
				var198.won_ever_label = buffer.tostring(var219)
			else
				local _ = nil
				local var221, var222 = protoModule.readVarInt(p9, var199)
				var199 = var222 + var221
			end
		elseif var200 == protoModule.wireTypes.i32 then
			local _ = nil
			local var223, var224 = protoModule.readFixed32(p9, var199)
			local _ = var223
			var199 = var224
		elseif var200 == protoModule.wireTypes.i64 then
			local _ = nil
			local var225, var226 = protoModule.readFixed64(p9, var199)
			local _ = var225
			var199 = var226
		else
			error("Unsupported wire type: " .. var326)
		end
	end
	return var198
end

function t_9:jsonEncode()
	local t = {}
	
	if self.type_label ~= nil and self.type_label ~= "" then
		t.typeLabel = self.type_label
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		t.earnedLabel = self.earned_label
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		t.updatedLabel = self.updated_label
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		t.experienceLabel = self.experience_label
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		t.rarityLabel = self.rarity_label
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		t.wonYesterdayLabel = self.won_yesterday_label
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		t.wonEverLabel = self.won_ever_label
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref)
	local var227 = t_9.new()
	
	if self.type_label ~= nil then
		var227.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var227.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var227.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var227.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var227.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var227.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var227.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var227.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var227.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var227.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var227.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var227.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var227.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var227.won_ever_label = self.wonEverLabel
	end
	return var227
end

t_9.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.badges.v1beta1.InfoTable"
}
t.BadgeDetailsContent_LocalizedLiterals_InfoTable = t_9
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_InfoTable)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		share = if p10 == nil or p10.share == nil then "" else p10.share,
		report = if p10 == nil or p10.report == nil then "" else p10.report
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var227 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var228, var229 = protoModule.writeTag(buff, var227, 1, protoModule.wireTypes.lengthDelimited)
		var228, var358 = protoModule.writeString(var228, var229, self.share)
		buff = var228
		var227 = var229
	end
	if self.report ~= nil and self.report ~= "" then
		local var230, var231 = protoModule.writeTag(buff, var227, 2, protoModule.wireTypes.lengthDelimited)
		var230, var360 = protoModule.writeString(var230, var231, self.report)
		buff = var230
		var227 = var231
	end
	local buff_1 = buffer.create(var227)
	buffer.copy(buff_1, 0, buff, 0, var227)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var227 = t_10.new()
	local var228 = 0
	while var228 < buffer.len(p10) do
		local _ = nil
		local var229 = nil
		local var230, var231, var232 = protoModule.readTag(p10, var228)
		local var233 = var230
		var229 = var231
		var228 = var232
		
		if var229 == protoModule.wireTypes.varint then
			local _ = nil
			local var234, var235 = protoModule.readVarInt(p10, var228)
			local _ = var234
			var228 = var235
			continue
		end
		if var229 == protoModule.wireTypes.lengthDelimited then
			if var233 == 1 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p10, var228)
				var228 = var237
				var227.share = buffer.tostring(var236)
			elseif var233 == 2 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p10, var228)
				var228 = var239
				var227.report = buffer.tostring(var238)
			else
				local _ = nil
				local var240, var241 = protoModule.readVarInt(p10, var228)
				var228 = var241 + var240
			end
		elseif var229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var242, var243 = protoModule.readFixed32(p10, var228)
			local _ = var242
			var228 = var243
		elseif var229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var244, var245 = protoModule.readFixed64(p10, var228)
			local _ = var244
			var228 = var245
		else
			error("Unsupported wire type: " .. var364)
		end
	end
	return var227
end

function t_10:jsonEncode()
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref)
	local var246 = t_10.new()
	
	if self.share ~= nil then
		var246.share = self.share
	end
	if self.report ~= nil then
		var246.report = self.report
	end
	return var246
end

t_10.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.badges.v1beta1.ActionModule"
}
t.BadgeDetailsContent_LocalizedLiterals_ActionModule = t_10
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_ActionModule)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		report = if p11 == nil or p11.report == nil then "" else p11.report,
		remove = if p11 == nil or p11.remove == nil then "" else p11.remove
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var246 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var247, var248 = protoModule.writeTag(buff, var246, 1, protoModule.wireTypes.lengthDelimited)
		var247, var386 = protoModule.writeString(var247, var248, self.report)
		buff = var247
		var246 = var248
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var249, var250 = protoModule.writeTag(buff, var246, 2, protoModule.wireTypes.lengthDelimited)
		var249, var388 = protoModule.writeString(var249, var250, self.remove)
		buff = var249
		var246 = var250
	end
	local buff_1 = buffer.create(var246)
	buffer.copy(buff_1, 0, buff, 0, var246)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var246 = t_11.new()
	local var247 = 0
	while var247 < buffer.len(p11) do
		local _ = nil
		local var248 = nil
		local var249, var250, var251 = protoModule.readTag(p11, var247)
		local var252 = var249
		var248 = var250
		var247 = var251
		
		if var248 == protoModule.wireTypes.varint then
			local _ = nil
			local var253, var254 = protoModule.readVarInt(p11, var247)
			local _ = var253
			var247 = var254
			continue
		end
		if var248 == protoModule.wireTypes.lengthDelimited then
			if var252 == 1 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p11, var247)
				var247 = var256
				var246.report = buffer.tostring(var255)
			elseif var252 == 2 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p11, var247)
				var247 = var258
				var246.remove = buffer.tostring(var257)
			else
				local _ = nil
				local var259, var260 = protoModule.readVarInt(p11, var247)
				var247 = var260 + var259
			end
		elseif var248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var261, var262 = protoModule.readFixed32(p11, var247)
			local _ = var261
			var247 = var262
		elseif var248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var263, var264 = protoModule.readFixed64(p11, var247)
			local _ = var263
			var247 = var264
		else
			error("Unsupported wire type: " .. var392)
		end
	end
	return var246
end

function t_11:jsonEncode()
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref)
	local var265 = t_11.new()
	
	if self.report ~= nil then
		var265.report = self.report
	end
	if self.remove ~= nil then
		var265.remove = self.remove
	end
	return var265
end

t_11.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.badges.v1beta1.OverflowMenu"
}
t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu = t_11
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu)

return {
	BadgeDetailsPageRequest = t.BadgeDetailsPageRequest,
	BadgeDetailsPageResponse = t.BadgeDetailsPageResponse,
	BadgeDetailsPageV2Response = t.BadgeDetailsPageV2Response,
	BadgeDetailsPageEntry = t.BadgeDetailsPageEntry,
	BadgeDetailsContent = t.BadgeDetailsContent,
	BadgeDetailsContent_LocalizedLiterals = t.BadgeDetailsContent_LocalizedLiterals,
	BadgeDetailsContent_LocalizedLiterals_InfoTable = t.BadgeDetailsContent_LocalizedLiterals_InfoTable,
	BadgeDetailsContent_LocalizedLiterals_ActionModule = t.BadgeDetailsContent_LocalizedLiterals_ActionModule,
	BadgeDetailsContent_LocalizedLiterals_OverflowMenu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu
}