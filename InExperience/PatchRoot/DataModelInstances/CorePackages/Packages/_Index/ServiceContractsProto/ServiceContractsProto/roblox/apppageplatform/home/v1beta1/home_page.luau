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
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		collection_layout = if p1 == nil or p1.collection_layout == nil then nil else p1.collection_layout
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.session_id ~= nil and self.session_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var18 = protoModule.writeString(var2, var3, self.session_id)
		buff = var2
		var1 = var3
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		for i, v in self.topic_ids do
			local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var4, var20 = protoModule.writeString(var4, var5, v)
			buff = var4
			var1 = var5
		end
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		for i, v in self.contextual_features do
			local var6, var7 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6, var22 = protoModule.writeString(var6, var7, i)
			var6, var22 = protoModule.writeTag(var6, var7, 2, protoModule.wireTypes.lengthDelimited)
			var6, var22 = protoModule.writeString(var6, var7, v)
			local var8 = var6
			local var9 = var7
			local var10, var11 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var10, var26 = protoModule.writeBuffer(var10, var11, var8, var9)
			buff = var10
			var1 = var11
		end
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var12, var13 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var12, var28 = protoModule.writeString(var12, var13, i)
			var12, var28 = protoModule.writeTag(var12, var13, 2, protoModule.wireTypes.lengthDelimited)
			var12, var28 = protoModule.writeString(var12, var13, v)
			local var14 = var12
			local var15 = var13
			local var16, var17 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var16, var32 = protoModule.writeBuffer(var16, var17, var14, var15)
			buff = var16
			var1 = var17
		end
	end
	if self.client_capabilities ~= nil then
		local var18 = self.client_capabilities:encode()
		local var19, var20 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var19, var35 = protoModule.writeBuffer(var19, var20, var18, buffer.len(var18))
		buff = var19
		var1 = var20
	end
	if self.collection_layout ~= nil then
		local var21 = self.collection_layout:encode()
		local var22, var23 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var22, var38 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var1 = var23
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
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
				var24.session_id = buffer.tostring(var33)
			elseif var30 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var25)
				var25 = var36
				table.insert(var24.topic_ids, buffer.tostring(var35))
			elseif var30 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var25)
				var25 = var38
				var37 = t.HomePageRequest_ContextualFeaturesEntry.decode(var37)
				var24.contextual_features[var37.key or ""] = var37.value or ""
			elseif var30 == 4 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var25)
				var25 = var40
				var39 = t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var39)
				var24.cached_roblox_component_to_template_id[var39.key or ""] = var39.value or ""
			elseif var30 == 5 then
				local _ = nil
				local var41, var42 = protoModule.readBuffer(p1, var25)
				var25 = var42
				var24.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var41)
			elseif var30 == 6 then
				local _ = nil
				local var43, var44 = protoModule.readBuffer(p1, var25)
				var25 = var44
				var24.collection_layout = t.HomeCollectionLayoutInfo.decode(var43)
			else
				local _ = nil
				local var45, var46 = protoModule.readVarInt(p1, var25)
				var25 = var46 + var45
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var47, var48 = protoModule.readFixed32(p1, var25)
			local _ = var47
			var25 = var48
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var49, var50 = protoModule.readFixed64(p1, var25)
			local _ = var49
			var25 = var50
		else
			error("Unsupported wire type: " .. var42)
		end
	end
	return var24
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
	if self.collection_layout ~= nil then
		t.collectionLayout = self.collection_layout:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), clientCapabilitiesModule (ref), t (ref)
	local var51 = t_1.new()
	
	if self.session_id ~= nil then
		var51.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var51.session_id = self.sessionId
	end
	if self.topic_ids ~= nil then
		local t_2 = {}
		
		for i, v in self.topic_ids do
			table.insert(t_2, v)
		end
		var51.topic_ids = t_2
	end
	if self.topicIds ~= nil then
		local t_2 = {}
		
		for i, v in self.topicIds do
			table.insert(t_2, v)
		end
		var51.topic_ids = t_2
	end
	if self.contextual_features ~= nil then
		local t_2 = {}
		
		for i, v in self.contextual_features do
			t_2[i] = v
		end
		var51.contextual_features = t_2
	end
	if self.contextualFeatures ~= nil then
		local t_2 = {}
		
		for i, v in self.contextualFeatures do
			t_2[i] = v
		end
		var51.contextual_features = t_2
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t_2 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_2[i] = v
		end
		var51.cached_roblox_component_to_template_id = t_2
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t_2 = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t_2[i] = v
		end
		var51.cached_roblox_component_to_template_id = t_2
	end
	if self.client_capabilities ~= nil then
		var51.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var51.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.collection_layout ~= nil then
		var51.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		var51.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	return var51
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
	local var52 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var53, var54 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.lengthDelimited)
		var53, var81 = protoModule.writeString(var53, var54, self.key)
		buff = var53
		var52 = var54
	end
	if self.value ~= nil and self.value ~= "" then
		local var55, var56 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.lengthDelimited)
		var55, var83 = protoModule.writeString(var55, var56, self.value)
		buff = var55
		var52 = var56
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var52 = t_2.new()
	local var53 = 0
	while var53 < buffer.len(p2) do
		local _ = nil
		local var54 = nil
		local var55, var56, var57 = protoModule.readTag(p2, var53)
		local var58 = var55
		var54 = var56
		var53 = var57
		
		if var54 == protoModule.wireTypes.varint then
			local _ = nil
			local var59, var60 = protoModule.readVarInt(p2, var53)
			local _ = var59
			var53 = var60
			continue
		end
		if var54 == protoModule.wireTypes.lengthDelimited then
			if var58 == 1 then
				local _ = nil
				local var61, var62 = protoModule.readBuffer(p2, var53)
				var53 = var62
				var52.key = buffer.tostring(var61)
			elseif var58 == 2 then
				local _ = nil
				local var63, var64 = protoModule.readBuffer(p2, var53)
				var53 = var64
				var52.value = buffer.tostring(var63)
			else
				local _ = nil
				local var65, var66 = protoModule.readVarInt(p2, var53)
				var53 = var66 + var65
			end
		elseif var54 == protoModule.wireTypes.i32 then
			local _ = nil
			local var67, var68 = protoModule.readFixed32(p2, var53)
			local _ = var67
			var53 = var68
		elseif var54 == protoModule.wireTypes.i64 then
			local _ = nil
			local var69, var70 = protoModule.readFixed64(p2, var53)
			local _ = var69
			var53 = var70
		else
			error("Unsupported wire type: " .. var87)
		end
	end
	return var52
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
	local var71 = t_2.new()
	
	if self.key ~= nil then
		var71.key = self.key
	end
	if self.value ~= nil then
		var71.value = self.value
	end
	return var71
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
	local var71 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var72, var73 = protoModule.writeTag(buff, var71, 1, protoModule.wireTypes.lengthDelimited)
		var72, var109 = protoModule.writeString(var72, var73, self.key)
		buff = var72
		var71 = var73
	end
	if self.value ~= nil and self.value ~= "" then
		local var74, var75 = protoModule.writeTag(buff, var71, 2, protoModule.wireTypes.lengthDelimited)
		var74, var111 = protoModule.writeString(var74, var75, self.value)
		buff = var74
		var71 = var75
	end
	local buff_1 = buffer.create(var71)
	buffer.copy(buff_1, 0, buff, 0, var71)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var71 = t_3.new()
	local var72 = 0
	while var72 < buffer.len(p3) do
		local _ = nil
		local var73 = nil
		local var74, var75, var76 = protoModule.readTag(p3, var72)
		local var77 = var74
		var73 = var75
		var72 = var76
		
		if var73 == protoModule.wireTypes.varint then
			local _ = nil
			local var78, var79 = protoModule.readVarInt(p3, var72)
			local _ = var78
			var72 = var79
			continue
		end
		if var73 == protoModule.wireTypes.lengthDelimited then
			if var77 == 1 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var72)
				var72 = var81
				var71.key = buffer.tostring(var80)
			elseif var77 == 2 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var72)
				var72 = var83
				var71.value = buffer.tostring(var82)
			else
				local _ = nil
				local var84, var85 = protoModule.readVarInt(p3, var72)
				var72 = var85 + var84
			end
		elseif var73 == protoModule.wireTypes.i32 then
			local _ = nil
			local var86, var87 = protoModule.readFixed32(p3, var72)
			local _ = var86
			var72 = var87
		elseif var73 == protoModule.wireTypes.i64 then
			local _ = nil
			local var88, var89 = protoModule.readFixed64(p3, var72)
			local _ = var88
			var72 = var89
		else
			error("Unsupported wire type: " .. var115)
		end
	end
	return var71
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
	local var90 = t_3.new()
	
	if self.key ~= nil then
		var90.key = self.key
	end
	if self.value ~= nil then
		var90.value = self.value
	end
	return var90
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
		items_per_row = if p4 == nil or p4.items_per_row == nil then {} else p4.items_per_row,
		rows_above_fold = if p4 == nil or p4.rows_above_fold == nil then 0 else p4.rows_above_fold
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var90 = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, v in self.items_per_row do
			local var91, var92 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var91, var137 = protoModule.writeString(var91, var92, i)
			var91, var137 = protoModule.writeTag(var91, var92, 2, protoModule.wireTypes.varint)
			var91, var137 = protoModule.writeVarInt(var91, var92, v)
			local var93 = var91
			local var94 = var92
			local var95, var96 = protoModule.writeTag(buff, var90, 1, protoModule.wireTypes.lengthDelimited)
			var95, var141 = protoModule.writeBuffer(var95, var96, var93, var94)
			buff = var95
			var90 = var96
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local var97, var98 = protoModule.writeTag(buff, var90, 2, protoModule.wireTypes.varint)
		var97, var143 = protoModule.writeVarInt(var97, var98, self.rows_above_fold)
		buff = var97
		var90 = var98
	end
	local buff_1 = buffer.create(var90)
	buffer.copy(buff_1, 0, buff, 0, var90)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var99 = t_4.new()
	local var100 = 0
	while var100 < buffer.len(p4) do
		local _ = nil
		local var101 = nil
		local var102, var103, var104 = protoModule.readTag(p4, var100)
		local var105 = var102
		var101 = var103
		var100 = var104
		
		if var101 == protoModule.wireTypes.varint then
			if var105 == 2 then
				local _ = nil
				local var106, var107 = protoModule.readVarIntI32(p4, var100)
				var100 = var107
				var99.rows_above_fold = var106
			else
				local _ = nil
				local var108, var109 = protoModule.readVarInt(p4, var100)
				local _ = var108
				var100 = var109
			end
		end
		if var101 == protoModule.wireTypes.lengthDelimited then
			if var105 == 1 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p4, var100)
				var100 = var111
				var110 = t.HomeCollectionLayoutInfo_ItemsPerRowEntry.decode(var110)
				var99.items_per_row[var110.key or ""] = var110.value or 0
			else
				local _ = nil
				local var112, var113 = protoModule.readVarInt(p4, var100)
				var100 = var113 + var112
			end
		elseif var101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var114, var115 = protoModule.readFixed32(p4, var100)
			local _ = var114
			var100 = var115
		elseif var101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var116, var117 = protoModule.readFixed64(p4, var100)
			local _ = var116
			var100 = var117
		else
			error("Unsupported wire type: " .. var147)
		end
	end
	return var99
end

function t_4:jsonEncode()
	local t = {}
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		local t_1 = {}
		
		for i, v in self.items_per_row do
			t_1[i] = v
		end
		t.itemsPerRow = t_1
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		t.rowsAboveFold = self.rows_above_fold
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var118 = t_4.new()
	
	if self.items_per_row ~= nil then
		local t = {}
		
		for i, v in self.items_per_row do
			t[i] = v
		end
		var118.items_per_row = t
	end
	if self.itemsPerRow ~= nil then
		local t = {}
		
		for i, v in self.itemsPerRow do
			t[i] = v
		end
		var118.items_per_row = t
	end
	if self.rows_above_fold ~= nil then
		var118.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		var118.rows_above_fold = self.rowsAboveFold
	end
	return var118
end

t_4.descriptor = {
	name = "HomeCollectionLayoutInfo",
	fullName = "roblox.apppageplatform.home.v1beta1.HomeCollectionLayoutInfo"
}
t.HomeCollectionLayoutInfo = t_4
typeRegistryModule.default:register(t.HomeCollectionLayoutInfo)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then 0 else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var119 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var120, var121 = protoModule.writeTag(buff, var119, 1, protoModule.wireTypes.lengthDelimited)
		var120, var172 = protoModule.writeString(var120, var121, self.key)
		buff = var120
		var119 = var121
	end
	if self.value ~= nil and self.value ~= 0 then
		local var122, var123 = protoModule.writeTag(buff, var119, 2, protoModule.wireTypes.varint)
		var122, var174 = protoModule.writeVarInt(var122, var123, self.value)
		buff = var122
		var119 = var123
	end
	local buff_1 = buffer.create(var119)
	buffer.copy(buff_1, 0, buff, 0, var119)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var119 = t_5.new()
	local var120 = 0
	while var120 < buffer.len(p5) do
		local _ = nil
		local var121 = nil
		local var122, var123, var124 = protoModule.readTag(p5, var120)
		local var125 = var122
		var121 = var123
		var120 = var124
		
		if var121 == protoModule.wireTypes.varint then
			if var125 == 2 then
				local _ = nil
				local var126, var127 = protoModule.readVarIntI32(p5, var120)
				var120 = var127
				var119.value = var126
			else
				local _ = nil
				local var128, var129 = protoModule.readVarInt(p5, var120)
				local _ = var128
				var120 = var129
			end
		end
		if var121 == protoModule.wireTypes.lengthDelimited then
			if var125 == 1 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p5, var120)
				var120 = var131
				var119.key = buffer.tostring(var130)
			else
				local _ = nil
				local var132, var133 = protoModule.readVarInt(p5, var120)
				var120 = var133 + var132
			end
		elseif var121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var134, var135 = protoModule.readFixed32(p5, var120)
			local _ = var134
			var120 = var135
		elseif var121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var136, var137 = protoModule.readFixed64(p5, var120)
			local _ = var136
			var120 = var137
		else
			error("Unsupported wire type: " .. var178)
		end
	end
	return var119
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= 0 then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var138 = t_5.new()
	
	if self.key ~= nil then
		var138.key = self.key
	end
	if self.value ~= nil then
		var138.value = self.value
	end
	return var138
end

t_5.descriptor = {
	name = "HomeCollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ItemsPerRowEntry"
}
t.HomeCollectionLayoutInfo_ItemsPerRowEntry = t_5
typeRegistryModule.default:register(t.HomeCollectionLayoutInfo_ItemsPerRowEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		localized_literals = if p6 == nil or p6.localized_literals == nil then {} else p6.localized_literals,
		request_id = if p6 == nil or p6.request_id == nil then "" else p6.request_id
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var138 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var139 = v:encode()
			local var140, var141 = protoModule.writeTag(buff, var138, 1, protoModule.wireTypes.lengthDelimited)
			var140, var201 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var138 = var141
		end
	end
	if self.hydration_data ~= nil then
		local var142 = self.hydration_data:encode()
		local var143, var144 = protoModule.writeTag(buff, var138, 2, protoModule.wireTypes.lengthDelimited)
		var143, var204 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
		buff = var143
		var138 = var144
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var145, var146 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var145, var206 = protoModule.writeString(var145, var146, i)
			local var147 = v:encode()
			var146, var208 = protoModule.writeTag(var145, var146, 2, protoModule.wireTypes.lengthDelimited)
			var146, var208 = protoModule.writeBuffer(var146, var208, var147, buffer.len(var147))
			local var148 = var146
			local var149 = var208
			local var150, var151 = protoModule.writeTag(buff, var138, 3, protoModule.wireTypes.lengthDelimited)
			var150, var212 = protoModule.writeBuffer(var150, var151, var148, var149)
			buff = var150
			var138 = var151
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var152, var153 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var152, var214 = protoModule.writeString(var152, var153, i)
			var152, var214 = protoModule.writeTag(var152, var153, 2, protoModule.wireTypes.lengthDelimited)
			var152, var214 = protoModule.writeString(var152, var153, v)
			local var154 = var152
			local var155 = var153
			local var156, var157 = protoModule.writeTag(buff, var138, 4, protoModule.wireTypes.lengthDelimited)
			var156, var218 = protoModule.writeBuffer(var156, var157, var154, var155)
			buff = var156
			var138 = var157
		end
	end
	if self.request_id ~= nil and self.request_id ~= "" then
		local var158, var159 = protoModule.writeTag(buff, var138, 5, protoModule.wireTypes.lengthDelimited)
		var158, var220 = protoModule.writeString(var158, var159, self.request_id)
		buff = var158
		var138 = var159
	end
	local buff_1 = buffer.create(var138)
	buffer.copy(buff_1, 0, buff, 0, var138)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var160 = t_6.new()
	local var161 = 0
	while var161 < buffer.len(p6) do
		local _ = nil
		local var162 = nil
		local var163, var164, var165 = protoModule.readTag(p6, var161)
		local var166 = var163
		var162 = var164
		var161 = var165
		
		if var162 == protoModule.wireTypes.varint then
			local _ = nil
			local var167, var168 = protoModule.readVarInt(p6, var161)
			local _ = var167
			var161 = var168
			continue
		end
		if var162 == protoModule.wireTypes.lengthDelimited then
			if var166 == 1 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p6, var161)
				var161 = var170
				table.insert(var160.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var169))
			elseif var166 == 2 then
				local _ = nil
				local var171, var172 = protoModule.readBuffer(p6, var161)
				var161 = var172
				var160.hydration_data = hydrationContentModule.HydrationContent.decode(var171)
			elseif var166 == 3 then
				local _ = nil
				local var173, var174 = protoModule.readBuffer(p6, var161)
				var161 = var174
				var173 = t.HomePageResponse_TemplatesEntry.decode(var173)
				var160.templates[var173.key or ""] = var173.value or templateEntryModule.TemplateEntry.new()
			elseif var166 == 4 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p6, var161)
				var161 = var176
				var175 = t.HomePageResponse_LocalizedLiteralsEntry.decode(var175)
				var160.localized_literals[var175.key or ""] = var175.value or ""
			elseif var166 == 5 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p6, var161)
				var161 = var178
				var160.request_id = buffer.tostring(var177)
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p6, var161)
				var161 = var180 + var179
			end
		elseif var162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var181, var182 = protoModule.readFixed32(p6, var161)
			local _ = var181
			var161 = var182
		elseif var162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var183, var184 = protoModule.readFixed64(p6, var161)
			local _ = var183
			var161 = var184
		else
			error("Unsupported wire type: " .. var224)
		end
	end
	return var160
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var185 = t_6.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var185.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var185.page_entries = t
	end
	if self.hydration_data ~= nil then
		var185.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var185.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var185.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var185.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var185.localized_literals = t
	end
	if self.request_id ~= nil then
		var185.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var185.request_id = self.requestId
	end
	return var185
end

t_6.descriptor = {
	name = "HomePageResponse",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageResponse"
}
t.HomePageResponse = t_6
typeRegistryModule.default:register(t.HomePageResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then nil else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var186 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var187, var188 = protoModule.writeTag(buff, var186, 1, protoModule.wireTypes.lengthDelimited)
		var187, var260 = protoModule.writeString(var187, var188, self.key)
		buff = var187
		var186 = var188
	end
	if self.value ~= nil then
		local var189 = self.value:encode()
		local var190, var191 = protoModule.writeTag(buff, var186, 2, protoModule.wireTypes.lengthDelimited)
		var190, var263 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
		buff = var190
		var186 = var191
	end
	local buff_1 = buffer.create(var186)
	buffer.copy(buff_1, 0, buff, 0, var186)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var186 = t_7.new()
	local var187 = 0
	while var187 < buffer.len(p7) do
		local _ = nil
		local var188 = nil
		local var189, var190, var191 = protoModule.readTag(p7, var187)
		local var192 = var189
		var188 = var190
		var187 = var191
		
		if var188 == protoModule.wireTypes.varint then
			local _ = nil
			local var193, var194 = protoModule.readVarInt(p7, var187)
			local _ = var193
			var187 = var194
			continue
		end
		if var188 == protoModule.wireTypes.lengthDelimited then
			if var192 == 1 then
				local _ = nil
				local var195, var196 = protoModule.readBuffer(p7, var187)
				var187 = var196
				var186.key = buffer.tostring(var195)
			elseif var192 == 2 then
				local _ = nil
				local var197, var198 = protoModule.readBuffer(p7, var187)
				var187 = var198
				var186.value = templateEntryModule.TemplateEntry.decode(var197)
			else
				local _ = nil
				local var199, var200 = protoModule.readVarInt(p7, var187)
				var187 = var200 + var199
			end
		elseif var188 == protoModule.wireTypes.i32 then
			local _ = nil
			local var201, var202 = protoModule.readFixed32(p7, var187)
			local _ = var201
			var187 = var202
		elseif var188 == protoModule.wireTypes.i64 then
			local _ = nil
			local var203, var204 = protoModule.readFixed64(p7, var187)
			local _ = var203
			var187 = var204
		else
			error("Unsupported wire type: " .. var267)
		end
	end
	return var186
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), templateEntryModule (ref)
	local var205 = t_7.new()
	
	if self.key ~= nil then
		var205.key = self.key
	end
	if self.value ~= nil then
		var205.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var205
end

t_7.descriptor = {
	name = "HomePageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.TemplatesEntry"
}
t.HomePageResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.HomePageResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then "" else p8.value
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var205 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var206, var207 = protoModule.writeTag(buff, var205, 1, protoModule.wireTypes.lengthDelimited)
		var206, var289 = protoModule.writeString(var206, var207, self.key)
		buff = var206
		var205 = var207
	end
	if self.value ~= nil and self.value ~= "" then
		local var208, var209 = protoModule.writeTag(buff, var205, 2, protoModule.wireTypes.lengthDelimited)
		var208, var291 = protoModule.writeString(var208, var209, self.value)
		buff = var208
		var205 = var209
	end
	local buff_1 = buffer.create(var205)
	buffer.copy(buff_1, 0, buff, 0, var205)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref)
	local var205 = t_8.new()
	local var206 = 0
	while var206 < buffer.len(p8) do
		local _ = nil
		local var207 = nil
		local var208, var209, var210 = protoModule.readTag(p8, var206)
		local var211 = var208
		var207 = var209
		var206 = var210
		
		if var207 == protoModule.wireTypes.varint then
			local _ = nil
			local var212, var213 = protoModule.readVarInt(p8, var206)
			local _ = var212
			var206 = var213
			continue
		end
		if var207 == protoModule.wireTypes.lengthDelimited then
			if var211 == 1 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p8, var206)
				var206 = var215
				var205.key = buffer.tostring(var214)
			elseif var211 == 2 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p8, var206)
				var206 = var217
				var205.value = buffer.tostring(var216)
			else
				local _ = nil
				local var218, var219 = protoModule.readVarInt(p8, var206)
				var206 = var219 + var218
			end
		elseif var207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var220, var221 = protoModule.readFixed32(p8, var206)
			local _ = var220
			var206 = var221
		elseif var207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var222, var223 = protoModule.readFixed64(p8, var206)
			local _ = var222
			var206 = var223
		else
			error("Unsupported wire type: " .. var295)
		end
	end
	return var205
end

function t_8:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref)
	local var224 = t_8.new()
	
	if self.key ~= nil then
		var224.key = self.key
	end
	if self.value ~= nil then
		var224.value = self.value
	end
	return var224
end

t_8.descriptor = {
	name = "HomePageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.LocalizedLiteralsEntry"
}
t.HomePageResponse_LocalizedLiteralsEntry = t_8
typeRegistryModule.default:register(t.HomePageResponse_LocalizedLiteralsEntry)

return {
	HomePageRequest = t.HomePageRequest,
	HomeCollectionLayoutInfo = t.HomeCollectionLayoutInfo,
	HomePageResponse = t.HomePageResponse
}