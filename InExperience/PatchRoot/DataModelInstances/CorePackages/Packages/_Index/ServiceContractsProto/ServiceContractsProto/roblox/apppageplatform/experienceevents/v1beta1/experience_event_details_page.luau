local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then 0 else p1.event_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var13 = protoModule.writeVarInt(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var15 = protoModule.writeVarInt(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.event_id = var8
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.user_id = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var14, var15 = protoModule.readVarInt(p1, var2)
			var2 = var15 + var14
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var23)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= 0 then
		t.eventId = self.event_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var20 = t_1.new()
	
	if self.event_id ~= nil then
		var20.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var20.event_id = self.eventId
	end
	if self.user_id ~= nil then
		var20.user_id = self.user_id
	end
	if self.userId ~= nil then
		var20.user_id = self.userId
	end
	return var20
end

t_1.descriptor = {
	name = "ExperienceEventDetailsPageRequest",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageRequest"
}
t.ExperienceEventDetailsPageRequest = t_1
typeRegistryModule.default:register(t.ExperienceEventDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var20 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var21 = v:encode()
			local var22, var23 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.lengthDelimited)
			var22, var42 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
			buff = var22
			var20 = var23
		end
	end
	if self.hydration_data ~= nil then
		local var24 = self.hydration_data:encode()
		local var25, var26 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var25, var45 = protoModule.writeBuffer(var25, var26, var24, buffer.len(var24))
		buff = var25
		var20 = var26
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var27, var28 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var27, var47 = protoModule.writeString(var27, var28, i)
			local var29 = v:encode()
			var28, var49 = protoModule.writeTag(var27, var28, 2, protoModule.wireTypes.lengthDelimited)
			var28, var49 = protoModule.writeBuffer(var28, var49, var29, buffer.len(var29))
			local var30 = var28
			local var31 = var49
			local var32, var33 = protoModule.writeTag(buff, var20, 3, protoModule.wireTypes.lengthDelimited)
			var32, var53 = protoModule.writeBuffer(var32, var33, var30, var31)
			buff = var32
			var20 = var33
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var34, var35 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var34, var55 = protoModule.writeString(var34, var35, i)
			var34, var55 = protoModule.writeTag(var34, var35, 2, protoModule.wireTypes.lengthDelimited)
			var34, var55 = protoModule.writeString(var34, var35, v)
			local var36 = var34
			local var37 = var35
			local var38, var39 = protoModule.writeTag(buff, var20, 4, protoModule.wireTypes.lengthDelimited)
			var38, var59 = protoModule.writeBuffer(var38, var39, var36, var37)
			buff = var38
			var20 = var39
		end
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var40 = t_2.new()
	local var41 = 0
	while var41 < buffer.len(p2) do
		local _ = nil
		local var42 = nil
		local var43, var44, var45 = protoModule.readTag(p2, var41)
		local var46 = var43
		var42 = var44
		var41 = var45
		
		if var42 == protoModule.wireTypes.varint then
			local _ = nil
			local var47, var48 = protoModule.readVarInt(p2, var41)
			local _ = var47
			var41 = var48
			continue
		end
		if var42 == protoModule.wireTypes.lengthDelimited then
			if var46 == 1 then
				local _ = nil
				local var49, var50 = protoModule.readBuffer(p2, var41)
				var41 = var50
				table.insert(var40.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var49))
			elseif var46 == 2 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var41)
				var41 = var52
				var40.hydration_data = hydrationContentModule.HydrationContent.decode(var51)
			elseif var46 == 3 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p2, var41)
				var41 = var54
				var53 = t.ExperienceEventDetailsPageResponse_TemplatesEntry.decode(var53)
				var40.templates[var53.key or ""] = var53.value or templateEntryModule.TemplateEntry.new()
			elseif var46 == 4 then
				local _ = nil
				local var55, var56 = protoModule.readBuffer(p2, var41)
				var41 = var56
				var55 = t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry.decode(var55)
				var40.localized_literals[var55.key or ""] = var55.value or ""
			else
				local _ = nil
				local var57, var58 = protoModule.readVarInt(p2, var41)
				var41 = var58 + var57
			end
		elseif var42 == protoModule.wireTypes.i32 then
			local _ = nil
			local var59, var60 = protoModule.readFixed32(p2, var41)
			local _ = var59
			var41 = var60
		elseif var42 == protoModule.wireTypes.i64 then
			local _ = nil
			local var61, var62 = protoModule.readFixed64(p2, var41)
			local _ = var61
			var41 = var62
		else
			error("Unsupported wire type: " .. var63)
		end
	end
	return var40
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
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var63 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var63.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var63.page_entries = t
	end
	if self.hydration_data ~= nil then
		var63.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var63.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var63.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var63.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var63.localized_literals = t
	end
	return var63
end

t_2.descriptor = {
	name = "ExperienceEventDetailsPageResponse",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageResponse"
}
t.ExperienceEventDetailsPageResponse = t_2
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse)
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
	local var64 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var65, var66 = protoModule.writeTag(buff, var64, 1, protoModule.wireTypes.lengthDelimited)
		var65, var97 = protoModule.writeString(var65, var66, self.key)
		buff = var65
		var64 = var66
	end
	if self.value ~= nil then
		local var67 = self.value:encode()
		local var68, var69 = protoModule.writeTag(buff, var64, 2, protoModule.wireTypes.lengthDelimited)
		var68, var100 = protoModule.writeBuffer(var68, var69, var67, buffer.len(var67))
		buff = var68
		var64 = var69
	end
	local buff_1 = buffer.create(var64)
	buffer.copy(buff_1, 0, buff, 0, var64)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var64 = t_3.new()
	local var65 = 0
	while var65 < buffer.len(p3) do
		local _ = nil
		local var66 = nil
		local var67, var68, var69 = protoModule.readTag(p3, var65)
		local var70 = var67
		var66 = var68
		var65 = var69
		
		if var66 == protoModule.wireTypes.varint then
			local _ = nil
			local var71, var72 = protoModule.readVarInt(p3, var65)
			local _ = var71
			var65 = var72
			continue
		end
		if var66 == protoModule.wireTypes.lengthDelimited then
			if var70 == 1 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var65)
				var65 = var74
				var64.key = buffer.tostring(var73)
			elseif var70 == 2 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var65)
				var65 = var76
				var64.value = templateEntryModule.TemplateEntry.decode(var75)
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p3, var65)
				var65 = var78 + var77
			end
		elseif var66 == protoModule.wireTypes.i32 then
			local _ = nil
			local var79, var80 = protoModule.readFixed32(p3, var65)
			local _ = var79
			var65 = var80
		elseif var66 == protoModule.wireTypes.i64 then
			local _ = nil
			local var81, var82 = protoModule.readFixed64(p3, var65)
			local _ = var81
			var65 = var82
		else
			error("Unsupported wire type: " .. var104)
		end
	end
	return var64
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
	local var83 = t_3.new()
	
	if self.key ~= nil then
		var83.key = self.key
	end
	if self.value ~= nil then
		var83.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var83
end

t_3.descriptor = {
	name = "ExperienceEventDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.TemplatesEntry"
}
t.ExperienceEventDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then "" else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var83 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var84, var85 = protoModule.writeTag(buff, var83, 1, protoModule.wireTypes.lengthDelimited)
		var84, var126 = protoModule.writeString(var84, var85, self.key)
		buff = var84
		var83 = var85
	end
	if self.value ~= nil and self.value ~= "" then
		local var86, var87 = protoModule.writeTag(buff, var83, 2, protoModule.wireTypes.lengthDelimited)
		var86, var128 = protoModule.writeString(var86, var87, self.value)
		buff = var86
		var83 = var87
	end
	local buff_1 = buffer.create(var83)
	buffer.copy(buff_1, 0, buff, 0, var83)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var83 = t_4.new()
	local var84 = 0
	while var84 < buffer.len(p4) do
		local _ = nil
		local var85 = nil
		local var86, var87, var88 = protoModule.readTag(p4, var84)
		local var89 = var86
		var85 = var87
		var84 = var88
		
		if var85 == protoModule.wireTypes.varint then
			local _ = nil
			local var90, var91 = protoModule.readVarInt(p4, var84)
			local _ = var90
			var84 = var91
			continue
		end
		if var85 == protoModule.wireTypes.lengthDelimited then
			if var89 == 1 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p4, var84)
				var84 = var93
				var83.key = buffer.tostring(var92)
			elseif var89 == 2 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p4, var84)
				var84 = var95
				var83.value = buffer.tostring(var94)
			else
				local _ = nil
				local var96, var97 = protoModule.readVarInt(p4, var84)
				var84 = var97 + var96
			end
		elseif var85 == protoModule.wireTypes.i32 then
			local _ = nil
			local var98, var99 = protoModule.readFixed32(p4, var84)
			local _ = var98
			var84 = var99
		elseif var85 == protoModule.wireTypes.i64 then
			local _ = nil
			local var100, var101 = protoModule.readFixed64(p4, var84)
			local _ = var100
			var84 = var101
		else
			error("Unsupported wire type: " .. var132)
		end
	end
	return var83
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var102 = t_4.new()
	
	if self.key ~= nil then
		var102.key = self.key
	end
	if self.value ~= nil then
		var102.value = self.value
	end
	return var102
end

t_4.descriptor = {
	name = "ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.LocalizedLiteralsEntry"
}
t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry)

return {
	ExperienceEventDetailsPageRequest = t.ExperienceEventDetailsPageRequest,
	ExperienceEventDetailsPageResponse = t.ExperienceEventDetailsPageResponse
}