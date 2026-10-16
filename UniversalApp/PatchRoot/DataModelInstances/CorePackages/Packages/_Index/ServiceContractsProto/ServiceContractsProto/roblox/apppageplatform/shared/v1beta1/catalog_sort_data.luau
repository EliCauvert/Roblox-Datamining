local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local BackgroundLayerModule = require(script.Parent.background_layer)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 145 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		encrypted_ad_tracking_data = if p1 == nil or p1.encrypted_ad_tracking_data == nil then nil else p1.encrypted_ad_tracking_data
	}, Module))
end

function Module:encode() --[[ Line: 155 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.type ~= nil and self.type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.type)
	end
	if self.encrypted_ad_tracking_data ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.encrypted_ad_tracking_data)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 179 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v17 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.type = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.encrypted_ad_tracking_data = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v17 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v17 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 232 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.encrypted_ad_tracking_data ~= nil then
		t.encryptedAdTrackingData = self.encrypted_ad_tracking_data
	end
	return t
end

function Module:jsonDecode() --[[ Line: 250 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	if self.encrypted_ad_tracking_data ~= nil then
		NewModule.encrypted_ad_tracking_data = self.encrypted_ad_tracking_data
	end
	if self.encryptedAdTrackingData ~= nil then
		NewModule.encrypted_ad_tracking_data = self.encryptedAdTrackingData
	end
	return NewModule
end

Module.descriptor = {
	name = "CatalogSortContentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContentData"
}
local config = { CatalogSortContentData = Module }
TypeRegistryModule.default:register(config.CatalogSortContentData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 286 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type
	}, Module1))
end

function Module1:encode() --[[ Line: 294 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.content_type ~= nil and self.content_type ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.content_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 308 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v35 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v35 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v35 = ProtoModule.readBuffer(Buf, v2)
				NewModule.content_type = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v35 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v35 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 351 ]]
	local t = {}
	
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 361 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.content_type ~= nil then
		NewModule.content_type = self.content_type
	end
	if self.contentType ~= nil then
		NewModule.content_type = self.contentType
	end
	return NewModule
end

Module1.descriptor = {
	name = "CatalogSortCardItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardItemFooter"
}
config.CatalogSortCardItemFooter = Module1
TypeRegistryModule.default:register(config.CatalogSortCardItemFooter)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 389 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		thumbnail_aspect_ratio = if p1 == nil or p1.thumbnail_aspect_ratio == nil then "" else p1.thumbnail_aspect_ratio,
		background_layers = if p1 == nil or p1.background_layers == nil then {} else p1.background_layers
	}, Module2))
end

function Module2:encode() --[[ Line: 398 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.thumbnail_aspect_ratio)
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for _, backgroundLayer in self.background_layers do
			local EncodeResult = backgroundLayer:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 420 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v54 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v54 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v54 = ProtoModule.readBuffer(Buf, v3)
				NewModule.thumbnail_aspect_ratio = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v54 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.background_layers, BackgroundLayerModule.BackgroundLayer.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v54 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v54 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 471 ]]
	local t = {}
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		t.thumbnailAspectRatio = self.thumbnail_aspect_ratio
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		local BackgroundLayers = {}
		
		for _, backgroundLayer in self.background_layers do
			table.insert(BackgroundLayers, backgroundLayer:jsonEncode())
		end
		t.backgroundLayers = BackgroundLayers
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 489 ]]
	-- upvalues: Module2 (copy), BackgroundLayerModule (copy)
	local NewModule = Module2.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		NewModule.thumbnail_aspect_ratio = self.thumbnail_aspect_ratio
	end
	if self.thumbnailAspectRatio ~= nil then
		NewModule.thumbnail_aspect_ratio = self.thumbnailAspectRatio
	end
	if self.background_layers ~= nil then
		local Background_layers = {}
		
		for _, backgroundLayer in self.background_layers do
			table.insert(Background_layers, BackgroundLayerModule.BackgroundLayer.jsonDecode(backgroundLayer))
		end
		NewModule.background_layers = Background_layers
	end
	if self.backgroundLayers ~= nil then
		local Background_layers = {}
		
		for _, backgroundLayer1 in self.backgroundLayers do
			table.insert(Background_layers, BackgroundLayerModule.BackgroundLayer.jsonDecode(backgroundLayer1))
		end
		NewModule.background_layers = Background_layers
	end
	return NewModule
end

Module2.descriptor = {
	name = "CatalogSortCardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardStyle"
}
config.CatalogSortCardStyle = Module2
TypeRegistryModule.default:register(config.CatalogSortCardStyle)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 541 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		hydration_priority = if p1 == nil or p1.hydration_priority == nil then 0 else p1.hydration_priority,
		hydration_count = if p1 == nil or p1.hydration_count == nil then 0 else p1.hydration_count,
		content = if p1 == nil or p1.content == nil then {} else p1.content,
		preview_columns = if p1 == nil or p1.preview_columns == nil then 0 else p1.preview_columns,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		card_style = if p1 == nil or p1.card_style == nil then nil else p1.card_style,
		card_footers = if p1 == nil or p1.card_footers == nil then {} else p1.card_footers,
		tag_id = if p1 == nil or p1.tag_id == nil then "" else p1.tag_id
	}, Module3))
end

function Module3:encode() --[[ Line: 557 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.type ~= nil and self.type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.type)
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.hydration_priority)
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.hydration_count)
	end
	if self.content ~= nil and #self.content > 0 then
		for _, value in self.content do
			local EncodeResult = value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.preview_columns)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.title)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.description)
	end
	if self.card_style ~= nil then
		local EncodeResult = self.card_style:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		for _, cardFooter in self.card_footers do
			local EncodeResult = cardFooter:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.tag_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 628 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v97 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.hydration_priority, v97 = ProtoModule.readVarIntI32(Buf, v4)
			elseif Tag == 4 then
				NewModule.hydration_count, v97 = ProtoModule.readVarIntI32(Buf, v4)
			elseif Tag == 6 then
				NewModule.preview_columns, v97 = ProtoModule.readVarIntI64(Buf, v4)
			else
				local _
				_, v97 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.type = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v97 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.content, config.CatalogSortContentData.decode(Buffer3))
			elseif Tag == 7 then
				local Buffer4
				Buffer4, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 8 then
				local Buffer5
				Buffer5, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.description = buffer.tostring(Buffer5)
			elseif Tag == 9 then
				local Buffer6
				Buffer6, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.card_style = config.CatalogSortCardStyle.decode(Buffer6)
			elseif Tag == 10 then
				local Buffer7
				Buffer7, v97 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.card_footers, config.CatalogSortCardItemFooter.decode(Buffer7))
			elseif Tag == 11 then
				local Buffer8
				Buffer8, v97 = ProtoModule.readBuffer(Buf, v4)
				NewModule.tag_id = buffer.tostring(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v97 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v97 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 721 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		t.hydrationPriority = self.hydration_priority
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		t.hydrationCount = self.hydration_count
	end
	if self.content ~= nil and #self.content > 0 then
		local Content = {}
		
		for _, value in self.content do
			table.insert(Content, value:jsonEncode())
		end
		t.content = Content
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		t.previewColumns = self.preview_columns
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.card_style ~= nil then
		t.cardStyle = self.card_style:jsonEncode()
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		local CardFooters = {}
		
		for _, cardFooter in self.card_footers do
			table.insert(CardFooters, cardFooter:jsonEncode())
		end
		t.cardFooters = CardFooters
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		t.tagId = self.tag_id
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 779 ]]
	-- upvalues: Module3 (copy), config (copy)
	local NewModule = Module3.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	if self.hydration_priority ~= nil then
		NewModule.hydration_priority = self.hydration_priority
	end
	if self.hydrationPriority ~= nil then
		NewModule.hydration_priority = self.hydrationPriority
	end
	if self.hydration_count ~= nil then
		NewModule.hydration_count = self.hydration_count
	end
	if self.hydrationCount ~= nil then
		NewModule.hydration_count = self.hydrationCount
	end
	if self.content ~= nil then
		local Content = {}
		
		for _, value in self.content do
			table.insert(Content, config.CatalogSortContentData.jsonDecode(value))
		end
		NewModule.content = Content
	end
	if self.preview_columns ~= nil then
		NewModule.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		NewModule.preview_columns = self.previewColumns
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.card_style ~= nil then
		NewModule.card_style = config.CatalogSortCardStyle.jsonDecode(self.card_style)
	end
	if self.cardStyle ~= nil then
		NewModule.card_style = config.CatalogSortCardStyle.jsonDecode(self.cardStyle)
	end
	if self.card_footers ~= nil then
		local Card_footers = {}
		
		for _, cardFooter in self.card_footers do
			table.insert(Card_footers, config.CatalogSortCardItemFooter.jsonDecode(cardFooter))
		end
		NewModule.card_footers = Card_footers
	end
	if self.cardFooters ~= nil then
		local Card_footers = {}
		
		for _, cardFooter1 in self.cardFooters do
			table.insert(Card_footers, config.CatalogSortCardItemFooter.jsonDecode(cardFooter1))
		end
		NewModule.card_footers = Card_footers
	end
	if self.tag_id ~= nil then
		NewModule.tag_id = self.tag_id
	end
	if self.tagId ~= nil then
		NewModule.tag_id = self.tagId
	end
	return NewModule
end

Module3.descriptor = {
	name = "CatalogSortData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortData"
}
config.CatalogSortData = Module3
TypeRegistryModule.default:register(config.CatalogSortData)

return {
	CatalogSortContentData = config.CatalogSortContentData,
	CatalogSortCardItemFooter = config.CatalogSortCardItemFooter,
	CatalogSortCardStyle = config.CatalogSortCardStyle,
	CatalogSortData = config.CatalogSortData
}