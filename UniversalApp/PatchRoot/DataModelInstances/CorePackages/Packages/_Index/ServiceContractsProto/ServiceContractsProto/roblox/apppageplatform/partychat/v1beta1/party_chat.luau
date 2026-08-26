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
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var13 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.hydration_data ~= nil then
		local var5 = self.hydration_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var16 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var8, var9 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var8, var18 = protoModule.writeString(var8, var9, i)
			local var10 = v:encode()
			var9, var20 = protoModule.writeTag(var8, var9, 2, protoModule.wireTypes.lengthDelimited)
			var9, var20 = protoModule.writeBuffer(var9, var20, var10, buffer.len(var10))
			local var11 = var9
			local var12 = var20
			local var13, var14 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var13, var24 = protoModule.writeBuffer(var13, var14, var11, var12)
			buff = var13
			var1 = var14
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var15, var16 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var15, var26 = protoModule.writeString(var15, var16, i)
			var15, var26 = protoModule.writeTag(var15, var16, 2, protoModule.wireTypes.lengthDelimited)
			var15, var26 = protoModule.writeString(var15, var16, v)
			local var17 = var15
			local var18 = var16
			local var19, var20 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var19, var30 = protoModule.writeBuffer(var19, var20, var17, var18)
			buff = var19
			var1 = var20
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
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
				table.insert(var21.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var30))
			elseif var27 == 2 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var22)
				var22 = var33
				var21.hydration_data = hydrationContentModule.HydrationContent.decode(var32)
			elseif var27 == 3 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var22)
				var22 = var35
				var34 = t.PartyChatResponse_TemplatesEntry.decode(var34)
				var21.templates[var34.key or ""] = var34.value or templateEntryModule.TemplateEntry.new()
			elseif var27 == 4 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var22)
				var22 = var37
				var36 = t.PartyChatResponse_LocalizedLiteralsEntry.decode(var36)
				var21.localized_literals[var36.key or ""] = var36.value or ""
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p1, var22)
				var22 = var39 + var38
			end
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var40, var41 = protoModule.readFixed32(p1, var22)
			local _ = var40
			var22 = var41
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var42, var43 = protoModule.readFixed64(p1, var22)
			local _ = var42
			var22 = var43
		else
			error("Unsupported wire type: " .. var34)
		end
	end
	return var21
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var44 = t_1.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var44.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var44.page_entries = t
	end
	if self.hydration_data ~= nil then
		var44.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var44.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var44.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var44.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var44.localized_literals = t
	end
	return var44
end

t_1.descriptor = {
	name = "PartyChatResponse",
	fullName = "roblox.apppageplatform.partychat.v1beta1.PartyChatResponse"
}
t.PartyChatResponse = t_1
typeRegistryModule.default:register(t.PartyChatResponse)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then nil else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var45 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var46, var47 = protoModule.writeTag(buff, var45, 1, protoModule.wireTypes.lengthDelimited)
		var46, var68 = protoModule.writeString(var46, var47, self.key)
		buff = var46
		var45 = var47
	end
	if self.value ~= nil then
		local var48 = self.value:encode()
		local var49, var50 = protoModule.writeTag(buff, var45, 2, protoModule.wireTypes.lengthDelimited)
		var49, var71 = protoModule.writeBuffer(var49, var50, var48, buffer.len(var48))
		buff = var49
		var45 = var50
	end
	local buff_1 = buffer.create(var45)
	buffer.copy(buff_1, 0, buff, 0, var45)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), templateEntryModule (ref)
	local var45 = t_2.new()
	local var46 = 0
	while var46 < buffer.len(p2) do
		local _ = nil
		local var47 = nil
		local var48, var49, var50 = protoModule.readTag(p2, var46)
		local var51 = var48
		var47 = var49
		var46 = var50
		
		if var47 == protoModule.wireTypes.varint then
			local _ = nil
			local var52, var53 = protoModule.readVarInt(p2, var46)
			local _ = var52
			var46 = var53
			continue
		end
		if var47 == protoModule.wireTypes.lengthDelimited then
			if var51 == 1 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p2, var46)
				var46 = var55
				var45.key = buffer.tostring(var54)
			elseif var51 == 2 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p2, var46)
				var46 = var57
				var45.value = templateEntryModule.TemplateEntry.decode(var56)
			else
				local _ = nil
				local var58, var59 = protoModule.readVarInt(p2, var46)
				var46 = var59 + var58
			end
		elseif var47 == protoModule.wireTypes.i32 then
			local _ = nil
			local var60, var61 = protoModule.readFixed32(p2, var46)
			local _ = var60
			var46 = var61
		elseif var47 == protoModule.wireTypes.i64 then
			local _ = nil
			local var62, var63 = protoModule.readFixed64(p2, var46)
			local _ = var62
			var46 = var63
		else
			error("Unsupported wire type: " .. var75)
		end
	end
	return var45
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), templateEntryModule (ref)
	local var64 = t_2.new()
	
	if self.key ~= nil then
		var64.key = self.key
	end
	if self.value ~= nil then
		var64.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var64
end

t_2.descriptor = {
	name = "PartyChatResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.TemplatesEntry"
}
t.PartyChatResponse_TemplatesEntry = t_2
typeRegistryModule.default:register(t.PartyChatResponse_TemplatesEntry)
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
	local var64 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var65, var66 = protoModule.writeTag(buff, var64, 1, protoModule.wireTypes.lengthDelimited)
		var65, var97 = protoModule.writeString(var65, var66, self.key)
		buff = var65
		var64 = var66
	end
	if self.value ~= nil and self.value ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var64, 2, protoModule.wireTypes.lengthDelimited)
		var67, var99 = protoModule.writeString(var67, var68, self.value)
		buff = var67
		var64 = var68
	end
	local buff_1 = buffer.create(var64)
	buffer.copy(buff_1, 0, buff, 0, var64)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
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
				var64.value = buffer.tostring(var75)
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
			error("Unsupported wire type: " .. var103)
		end
	end
	return var64
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
	local var83 = t_3.new()
	
	if self.key ~= nil then
		var83.key = self.key
	end
	if self.value ~= nil then
		var83.value = self.value
	end
	return var83
end

t_3.descriptor = {
	name = "PartyChatResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.LocalizedLiteralsEntry"
}
t.PartyChatResponse_LocalizedLiteralsEntry = t_3
typeRegistryModule.default:register(t.PartyChatResponse_LocalizedLiteralsEntry)

return { PartyChatResponse = t.PartyChatResponse }