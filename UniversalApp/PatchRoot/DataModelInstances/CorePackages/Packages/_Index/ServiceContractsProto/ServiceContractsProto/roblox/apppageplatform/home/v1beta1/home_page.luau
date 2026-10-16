local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 269 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		topic_ids = if p1 == nil or p1.topic_ids == nil then {} else p1.topic_ids,
		contextual_features = if p1 == nil or p1.contextual_features == nil then {} else p1.contextual_features,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		collection_layout = if p1 == nil or p1.collection_layout == nil then nil else p1.collection_layout
	}, Module))
end

function Module:encode() --[[ Line: 287 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.session_id ~= nil and self.session_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.session_id)
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		for _, topicId in self.topic_ids do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, topicId)
		end
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		for i, contextualFeature in self.contextual_features do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, contextualFeature)
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i1, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i1)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult4, WriteStringResult2_3 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, value)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult4, WriteStringResult2_3)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	if self.collection_layout ~= nil then
		local EncodeResult = self.collection_layout:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 349 ]]
	-- upvalues: Module (copy), ProtoModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v48 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v48 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v48 = ProtoModule.readBuffer(Buf, v1)
				NewModule.session_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v48 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.topic_ids, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v48 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HomePageRequest_ContextualFeaturesEntry.decode(Buffer3)
				NewModule.contextual_features[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v48 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer4)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v48 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v48 = ProtoModule.readBuffer(Buf, v1)
				NewModule.collection_layout = t.HomeCollectionLayoutInfo.decode(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v48 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v48 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 433 ]]
	local t = {}
	
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.topic_ids ~= nil and #self.topic_ids > 0 then
		local TopicIds = {}
		
		for _, topicId in self.topic_ids do
			table.insert(TopicIds, topicId)
		end
		t.topicIds = TopicIds
	end
	if self.contextual_features ~= nil and next(self.contextual_features) ~= nil then
		local ContextualFeatures = {}
		
		for i, contextualFeature in self.contextual_features do
			ContextualFeatures[i] = contextualFeature
		end
		t.contextualFeatures = ContextualFeatures
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i1, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i1] = value
		end
		t.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.collection_layout ~= nil then
		t.collectionLayout = self.collection_layout:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 478 ]]
	-- upvalues: Module (copy), ClientCapabilitiesModule (copy), t (copy)
	local NewModule = Module.new()
	
	if self.session_id ~= nil then
		NewModule.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		NewModule.session_id = self.sessionId
	end
	if self.topic_ids ~= nil then
		local Topic_ids = {}
		
		for _, topicId in self.topic_ids do
			table.insert(Topic_ids, topicId)
		end
		NewModule.topic_ids = Topic_ids
	end
	if self.topicIds ~= nil then
		local Topic_ids = {}
		
		for _, topicId1 in self.topicIds do
			table.insert(Topic_ids, topicId1)
		end
		NewModule.topic_ids = Topic_ids
	end
	if self.contextual_features ~= nil then
		local Contextual_features = {}
		
		for i, contextualFeature in self.contextual_features do
			Contextual_features[i] = contextualFeature
		end
		NewModule.contextual_features = Contextual_features
	end
	if self.contextualFeatures ~= nil then
		local Contextual_features = {}
		
		for i1, contextualFeature1 in self.contextualFeatures do
			Contextual_features[i1] = contextualFeature1
		end
		NewModule.contextual_features = Contextual_features
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i2, value in self.cached_roblox_component_to_template_id do
			Cached_roblox_component_to_template_id[i2] = value
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i3, value1 in self.cachedRobloxComponentToTemplateId do
			Cached_roblox_component_to_template_id[i3] = value1
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.collection_layout ~= nil then
		NewModule.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		NewModule.collection_layout = t.HomeCollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	return NewModule
end

Module.descriptor = {
	name = "HomePageRequest",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageRequest"
}
t.HomePageRequest = Module
TypeRegistryModule.default:register(t.HomePageRequest)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 582 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module1))
end

function Module1:encode() --[[ Line: 591 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 610 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v82 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v82 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v82 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v82 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v82 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v82 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 658 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 672 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module1.descriptor = {
	name = "HomePageRequest_ContextualFeaturesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ContextualFeaturesEntry"
}
t.HomePageRequest_ContextualFeaturesEntry = Module1
TypeRegistryModule.default:register(t.HomePageRequest_ContextualFeaturesEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 703 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module2))
end

function Module2:encode() --[[ Line: 715 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 736 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v101 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v101 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v101 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v101 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v101 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v101 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 786 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 802 ]]
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module2.descriptor = {
	name = "HomePageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry = Module2
TypeRegistryModule.default:register(t.HomePageRequest_CachedRobloxComponentToTemplateIdEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 833 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		items_per_row = if p1 == nil or p1.items_per_row == nil then {} else p1.items_per_row,
		rows_above_fold = if p1 == nil or p1.rows_above_fold == nil then 0 else p1.rows_above_fold
	}, Module3))
end

function Module3:encode() --[[ Line: 840 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, value in self.items_per_row do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.varint)
			local WriteVarIntResult, WriteVarIntResult2 = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, value)
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteVarIntResult, WriteVarIntResult2)
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.rows_above_fold)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 867 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v128 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.rows_above_fold, v128 = ProtoModule.readVarIntI32(Buf, v4)
			else
				local _
				_, v128 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v128 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.HomeCollectionLayoutInfo_ItemsPerRowEntry.decode(Buffer1)
				NewModule.items_per_row[DecodeResult.key or ""] = DecodeResult.value or 0
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v128 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v128 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 922 ]]
	local t = {}
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		local ItemsPerRow = {}
		
		for i, value in self.items_per_row do
			ItemsPerRow[i] = value
		end
		t.itemsPerRow = ItemsPerRow
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		t.rowsAboveFold = self.rows_above_fold
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 940 ]]
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.items_per_row ~= nil then
		local Items_per_row = {}
		
		for i, value in self.items_per_row do
			Items_per_row[i] = value
		end
		NewModule.items_per_row = Items_per_row
	end
	if self.itemsPerRow ~= nil then
		local Items_per_row = {}
		
		for i1, value1 in self.itemsPerRow do
			Items_per_row[i1] = value1
		end
		NewModule.items_per_row = Items_per_row
	end
	if self.rows_above_fold ~= nil then
		NewModule.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		NewModule.rows_above_fold = self.rowsAboveFold
	end
	return NewModule
end

Module3.descriptor = {
	name = "HomeCollectionLayoutInfo",
	fullName = "roblox.apppageplatform.home.v1beta1.HomeCollectionLayoutInfo"
}
t.HomeCollectionLayoutInfo = Module3
TypeRegistryModule.default:register(t.HomeCollectionLayoutInfo)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 986 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then 0 else p1.value
	}, Module4))
end

function Module4:encode() --[[ Line: 995 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1016 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v150 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.value, v150 = ProtoModule.readVarIntI32(Buf, v5)
			else
				local _
				_, v150 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v150 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v150 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v150 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1066 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= 0 then
		t.value = self.value
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1082 ]]
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module4.descriptor = {
	name = "HomeCollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.ItemsPerRowEntry"
}
t.HomeCollectionLayoutInfo_ItemsPerRowEntry = Module4
TypeRegistryModule.default:register(t.HomeCollectionLayoutInfo_ItemsPerRowEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1112 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals,
		request_id = if p1 == nil or p1.request_id == nil then "" else p1.request_id
	}, Module5))
end

function Module5:encode() --[[ Line: 1122 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i1, localizedLiteral in self.localized_literals do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i1)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, localizedLiteral)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult3, WriteStringResult2_2)
		end
	end
	if self.request_id ~= nil and self.request_id ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.request_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1177 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v193 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v193 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v193 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v193 = ProtoModule.readBuffer(Buf, v6)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v193 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = t.HomePageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v193 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = t.HomePageResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v193 = ProtoModule.readBuffer(Buf, v6)
				NewModule.request_id = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v193 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v193 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1258 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local LocalizedLiterals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			LocalizedLiterals[i1] = localizedLiteral
		end
		t.localizedLiterals = LocalizedLiterals
	end
	if self.request_id ~= nil and self.request_id ~= "" then
		t.requestId = self.request_id
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1296 ]]
	-- upvalues: Module5 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.localized_literals ~= nil then
		local Localized_literals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			Localized_literals[i1] = localizedLiteral
		end
		NewModule.localized_literals = Localized_literals
	end
	if self.localizedLiterals ~= nil then
		local Localized_literals = {}
		
		for i2, localizedLiteral1 in self.localizedLiterals do
			Localized_literals[i2] = localizedLiteral1
		end
		NewModule.localized_literals = Localized_literals
	end
	if self.request_id ~= nil then
		NewModule.request_id = self.request_id
	end
	if self.requestId ~= nil then
		NewModule.request_id = self.requestId
	end
	return NewModule
end

Module5.descriptor = {
	name = "HomePageResponse",
	fullName = "roblox.apppageplatform.home.v1beta1.HomePageResponse"
}
t.HomePageResponse = Module5
TypeRegistryModule.default:register(t.HomePageResponse)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1387 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module6))
end

function Module6:encode() --[[ Line: 1396 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1416 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v227 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v227 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v227 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v227 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v227 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v227 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1464 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1478 ]]
	-- upvalues: Module6 (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module6.descriptor = {
	name = "HomePageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.TemplatesEntry"
}
t.HomePageResponse_TemplatesEntry = Module6
TypeRegistryModule.default:register(t.HomePageResponse_TemplatesEntry)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1506 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module7))
end

function Module7:encode() --[[ Line: 1515 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1534 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v246 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v246 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v246 = ProtoModule.readBuffer(Buf, v8)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v246 = ProtoModule.readBuffer(Buf, v8)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v246 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v246 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1582 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1596 ]]
	-- upvalues: Module7 (copy)
	local NewModule = Module7.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module7.descriptor = {
	name = "HomePageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.home.v1beta1.LocalizedLiteralsEntry"
}
t.HomePageResponse_LocalizedLiteralsEntry = Module7
TypeRegistryModule.default:register(t.HomePageResponse_LocalizedLiteralsEntry)

return {
	HomePageRequest = t.HomePageRequest,
	HomeCollectionLayoutInfo = t.HomeCollectionLayoutInfo,
	HomePageResponse = t.HomePageResponse
}