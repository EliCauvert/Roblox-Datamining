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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.session_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.topic_ids, buffer.tostring(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.HomePageRequest_ContextualFeaturesEntry.decode(var14)
				var1.contextual_features[var14.key or ""] = var14.value or ""
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var16 = t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var16)
				var1.cached_roblox_component_to_template_id[var16.key or ""] = var16.value or ""
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.collection_layout = t.HomeCollectionLayoutInfo.decode(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var42)
		end
	end
	return var1
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
	local var1 = t_1.new()
	
	if self.session_id ~= nil then
		var1.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var1.session_id = self.sessionId
	end
	if self.topic_ids ~= nil then
		local t_2 = {}
		
		for i, v in self.topic_ids do
			table.insert(t_2, v)
		end
		var1.topic_ids = t_2
	end
	if self.topicIds ~= nil then
		local t_2 = {}
		
		for i, v in self.topicIds do
			table.insert(t_2, v)
		end
		var1.topic_ids = t_2
	end
	if self.contextual_features ~= nil then
		local t_2 = {}
		
		for i, v in self.contextual_features do
			t_2[i] = v
		end
		var1.contextual_features = t_2
	end
	if self.contextualFeatures ~= nil then
		local t_2 = {}
		
		for i, v in self.contextualFeatures do
			t_2[i] = v
		end
		var1.contextual_features = t_2
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t_2 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_2[i] = v
		end
		var1.cached_roblox_component_to_template_id = t_2
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t_2 = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t_2[i] = v
		end
		var1.cached_roblox_component_to_template_id = t_2
	end
	if self.client_capabilities ~= nil then
		var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.collection_layout ~= nil then
		var1.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		var1.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	return var1
end

t_1.descriptor = {
	name = "HomePageRequest",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageRequest"
}
t.HomePageRequest = t_1
typeRegistryModule.default:register(t.HomePageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var81 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil and self.value ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var83 = protoModule.writeString(var4, var5, self.value)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var1 = t_2.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var87)
		end
	end
	return var1
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
	local var1 = t_2.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = self.value
	end
	return var1
end

t_2.descriptor = {
	name = "HomePageRequest_ContextualFeaturesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ContextualFeaturesEntry"
}
t.HomePageRequest_ContextualFeaturesEntry = t_2
typeRegistryModule.default:register(t.HomePageRequest_ContextualFeaturesEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var109 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil and self.value ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var111 = protoModule.writeString(var4, var5, self.value)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_3.decode(p1)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var1 = t_3.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var115)
		end
	end
	return var1
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
	local var1 = t_3.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = self.value
	end
	return var1
end

t_3.descriptor = {
	name = "HomePageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry = t_3
typeRegistryModule.default:register(t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p1)
	-- upvalues: t_4 (ref)
	return setmetatable({
		items_per_row = if p1 == nil or p1.items_per_row == nil then {} else p1.items_per_row,
		rows_above_fold = if p1 == nil or p1.rows_above_fold == nil then 0 else p1.rows_above_fold
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, v in self.items_per_row do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var137 = protoModule.writeString(var2, var3, i)
			var2, var137 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.varint)
			var2, var137 = protoModule.writeVarInt(var2, var3, v)
			local var4 = var2
			local var5 = var3
			local var6, var7 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var6, var141 = protoModule.writeBuffer(var6, var7, var4, var5)
			buff = var6
			var1 = var7
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var8, var143 = protoModule.writeVarInt(var8, var9, self.rows_above_fold)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_4.decode(p1)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var1 = t_4.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.rows_above_fold = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var12 = t.HomeCollectionLayoutInfo_ItemsPerRowEntry.decode(var12)
				var1.items_per_row[var12.key or ""] = var12.value or 0
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var147)
		end
	end
	return var1
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
	local var1 = t_4.new()
	
	if self.items_per_row ~= nil then
		local t = {}
		
		for i, v in self.items_per_row do
			t[i] = v
		end
		var1.items_per_row = t
	end
	if self.itemsPerRow ~= nil then
		local t = {}
		
		for i, v in self.itemsPerRow do
			t[i] = v
		end
		var1.items_per_row = t
	end
	if self.rows_above_fold ~= nil then
		var1.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		var1.rows_above_fold = self.rowsAboveFold
	end
	return var1
end

t_4.descriptor = {
	name = "HomeCollectionLayoutInfo",
	fullName = "roblox.apppageplatform.home.v1beta1.HomeCollectionLayoutInfo"
}
t.HomeCollectionLayoutInfo = t_4
typeRegistryModule.default:register(t.HomeCollectionLayoutInfo)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p1)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then 0 else p1.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var172 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil and self.value ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var174 = protoModule.writeVarInt(var4, var5, self.value)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_5.decode(p1)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var1 = t_5.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.value = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.key = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var178)
		end
	end
	return var1
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
	local var1 = t_5.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = self.value
	end
	return var1
end

t_5.descriptor = {
	name = "HomeCollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ItemsPerRowEntry"
}
t.HomeCollectionLayoutInfo_ItemsPerRowEntry = t_5
typeRegistryModule.default:register(t.HomeCollectionLayoutInfo_ItemsPerRowEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p1)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals,
		request_id = if p1 == nil or p1.request_id == nil then "" else p1.request_id
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var201 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.hydration_data ~= nil then
		local var5 = self.hydration_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var204 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var8, var9 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var8, var206 = protoModule.writeString(var8, var9, i)
			local var10 = v:encode()
			var9, var208 = protoModule.writeTag(var8, var9, 2, protoModule.wireTypes.lengthDelimited)
			var9, var208 = protoModule.writeBuffer(var9, var208, var10, buffer.len(var10))
			local var11 = var9
			local var12 = var208
			local var13, var14 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var13, var212 = protoModule.writeBuffer(var13, var14, var11, var12)
			buff = var13
			var1 = var14
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var15, var16 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var15, var214 = protoModule.writeString(var15, var16, i)
			var15, var214 = protoModule.writeTag(var15, var16, 2, protoModule.wireTypes.lengthDelimited)
			var15, var214 = protoModule.writeString(var15, var16, v)
			local var17 = var15
			local var18 = var16
			local var19, var20 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var19, var218 = protoModule.writeBuffer(var19, var20, var17, var18)
			buff = var19
			var1 = var20
		end
	end
	if self.request_id ~= nil and self.request_id ~= "" then
		local var21, var22 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var21, var220 = protoModule.writeString(var21, var22, self.request_id)
		buff = var21
		var1 = var22
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_6.decode(p1)
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var1 = t_6.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				table.insert(var1.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.hydration_data = hydrationContentModule.HydrationContent.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.HomePageResponse_TemplatesEntry.decode(var14)
				var1.templates[var14.key or ""] = var14.value or templateEntryModule.TemplateEntry.new()
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var16 = t.HomePageResponse_LocalizedLiteralsEntry.decode(var16)
				var1.localized_literals[var16.key or ""] = var16.value or ""
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.request_id = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var224)
		end
	end
	return var1
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
	local var1 = t_6.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var1.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var1.page_entries = t
	end
	if self.hydration_data ~= nil then
		var1.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var1.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var1.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var1.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var1.localized_literals = t
	end
	if self.request_id ~= nil then
		var1.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var1.request_id = self.requestId
	end
	return var1
end

t_6.descriptor = {
	name = "HomePageResponse",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageResponse"
}
t.HomePageResponse = t_6
typeRegistryModule.default:register(t.HomePageResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p1)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var260 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var263 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_7.decode(p1)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var1 = t_7.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = templateEntryModule.TemplateEntry.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var267)
		end
	end
	return var1
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
	local var1 = t_7.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var1
end

t_7.descriptor = {
	name = "HomePageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.TemplatesEntry"
}
t.HomePageResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.HomePageResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p1)
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var289 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil and self.value ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var291 = protoModule.writeString(var4, var5, self.value)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_8.decode(p1)
	-- upvalues: t_8 (ref), protoModule (ref)
	local var1 = t_8.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var295)
		end
	end
	return var1
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
	local var1 = t_8.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = self.value
	end
	return var1
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