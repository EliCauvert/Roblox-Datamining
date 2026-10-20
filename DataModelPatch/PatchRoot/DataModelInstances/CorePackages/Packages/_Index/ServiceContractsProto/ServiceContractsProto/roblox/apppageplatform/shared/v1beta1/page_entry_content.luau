local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local BackgroundLayerModule = require(script.Parent.background_layer)
local PageEntryModule = require(script.Parent.page_entry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		page_entry = if p1 == nil or p1.page_entry == nil then nil else p1.page_entry,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entry ~= nil then
		local EncodeResult = self.page_entry:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.input_data ~= nil then
		local EncodeResult = self.input_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), PageEntryModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v121 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v121 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v121 = ProtoModule.readBuffer(Buf, v1)
				NewModule.page_entry = PageEntryModule.PageEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v121 = ProtoModule.readBuffer(Buf, v1)
				NewModule.input_data = t.PageEntryInputData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v121 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v121 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), PageEntryModule (copy), t (copy)
	local NewModule = Module.new()
	
	if self.page_entry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		NewModule.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		NewModule.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return NewModule
end

Module.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = Module
TypeRegistryModule.default:register(t.UniversalPageEntry)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.input_data ~= nil then
		local EncodeResult = self.input_data:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.roblox_component)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v141 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v141 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v141 = ProtoModule.readBuffer(Buf, v2)
				NewModule.input_data = t.PageEntryInputData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v141 = ProtoModule.readBuffer(Buf, v2)
				NewModule.roblox_component = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v141 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v141 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), t (copy)
	local NewModule = Module1.new()
	
	if self.input_data ~= nil then
		NewModule.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		NewModule.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	return NewModule
end

Module1.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = Module1
TypeRegistryModule.default:register(t.FeedEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.roblox_component)
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local EncodeResult = self.input_data.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v161 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v161 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v161 = ProtoModule.readBuffer(Buf, v3)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v161 = ProtoModule.readBuffer(Buf, v3)
				NewModule.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v161 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v161 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		t.attributionRow = self.input_data.value:jsonEncode()
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		NewModule.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		NewModule.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	return NewModule
end

Module2.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = Module2
TypeRegistryModule.default:register(t.ForegroundHeaderEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.roblox_component)
	end
	if self.input_data ~= nil and self.input_data.type == "image" then
		local EncodeResult = self.input_data.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v181 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v181 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v181 = ProtoModule.readBuffer(Buf, v4)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v181 = ProtoModule.readBuffer(Buf, v4)
				NewModule.input_data = { type = "image", value = t.ImageInputData.decode(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v181 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v181 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "image" then
		t.image = self.input_data.value:jsonEncode()
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		NewModule.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	return NewModule
end

Module3.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = Module3
TypeRegistryModule.default:register(t.BackgroundHeaderEntry)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "badge_details" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "static_content" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_attribution_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_action_module" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_media_gallery" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_description" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_stat_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_info_table" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult16, WriteTagResult2_15, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "social_link_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "song_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult20, WriteTagResult2_19, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "events_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult21, WriteTagResult2_20, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "game_pass_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult22, WriteTagResult2_21, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "developer_product_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult23, WriteTagResult2_22, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "subscription_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult25, WriteTagResult2_24, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "card_container" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult26, WriteTagResult2_25, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "card" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dialog" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult29, WriteTagResult2_28, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "banner" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult31, WriteTagResult2_30, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "tooltip" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "coachmark" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "system_banner_prompt" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult33, WriteTagResult2_32 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult33, WriteTagResult2_32, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "age_check_upsell" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "catalog_item_list" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult34, WriteTagResult2_33 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult34, WriteTagResult2_33, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "user_list" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult19, WriteTagResult2_18, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_content_rating_label" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult36, WriteTagResult2_35 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult36, WriteTagResult2_35, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_refund_policy" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult37, WriteTagResult2_36 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult37, WriteTagResult2_36, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_play_with_reward" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 32, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_guidelines_dialog" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 33, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult30, WriteTagResult2_29, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "moments_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult38, WriteTagResult2_37 = ProtoModule.writeTag(Buf, Count, 34, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult38, WriteTagResult2_37, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "text" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 40, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "vertical_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult39, WriteTagResult2_38 = ProtoModule.writeTag(Buf, Count, 41, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult39, WriteTagResult2_38, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "page_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 42, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult41, WriteTagResult2_40 = ProtoModule.writeTag(Buf, Count, 500, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult41, WriteTagResult2_40, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_action_bar" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult42, WriteTagResult2_41 = ProtoModule.writeTag(Buf, Count, 501, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult42, WriteTagResult2_41, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_banner_image" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult43, WriteTagResult2_42 = ProtoModule.writeTag(Buf, Count, 502, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult43, WriteTagResult2_42, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_sticky_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 503, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult24, WriteTagResult2_23, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult44, WriteTagResult2_43 = ProtoModule.writeTag(Buf, Count, 600, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult44, WriteTagResult2_43, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_action_bar" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult35, WriteTagResult2_34 = ProtoModule.writeTag(Buf, Count, 601, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult35, WriteTagResult2_34, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_attribution_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult46, WriteTagResult2_45 = ProtoModule.writeTag(Buf, Count, 602, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult46, WriteTagResult2_45, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_description" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult47, WriteTagResult2_46 = ProtoModule.writeTag(Buf, Count, 603, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult47, WriteTagResult2_46, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_info_table" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 604, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult40, WriteTagResult2_39 = ProtoModule.writeTag(Buf, Count, 605, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult40, WriteTagResult2_39, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_notifications_modal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult48, WriteTagResult2_47 = ProtoModule.writeTag(Buf, Count, 606, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult48, WriteTagResult2_47, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dev_store_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult49, WriteTagResult2_48 = ProtoModule.writeTag(Buf, Count, 700, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult49, WriteTagResult2_48, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "charts_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 800, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "filter_pills" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult50, WriteTagResult2_49 = ProtoModule.writeTag(Buf, Count, 801, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult50, WriteTagResult2_49, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "sort_selector" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult51, WriteTagResult2_50 = ProtoModule.writeTag(Buf, Count, 802, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult51, WriteTagResult2_50, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult52, WriteTagResult2_51 = ProtoModule.writeTag(Buf, Count, 900, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult52, WriteTagResult2_51, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult53, WriteTagResult2_52 = ProtoModule.writeTag(Buf, Count, 901, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult53, WriteTagResult2_52, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 902, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult28, WriteTagResult2_27, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult54, WriteTagResult2_53 = ProtoModule.writeTag(Buf, Count, 903, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult54, WriteTagResult2_53, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult55, WriteTagResult2_54 = ProtoModule.writeTag(Buf, Count, 904, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult55, WriteTagResult2_54, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "catalog_item_grid" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult56, WriteTagResult2_55 = ProtoModule.writeTag(Buf, Count, 905, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult56, WriteTagResult2_55, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "search_results_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult45, WriteTagResult2_44 = ProtoModule.writeTag(Buf, Count, 1000, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult45, WriteTagResult2_44, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "power_search_ai_overview" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult57, WriteTagResult2_56 = ProtoModule.writeTag(Buf, Count, 1001, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult57, WriteTagResult2_56, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_emphasis_tile" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult58, WriteTagResult2_57 = ProtoModule.writeTag(Buf, Count, 1002, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult58, WriteTagResult2_57, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "option_selector_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult59, WriteTagResult2_58 = ProtoModule.writeTag(Buf, Count, 1100, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult59, WriteTagResult2_58, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult60, WriteTagResult2_59 = ProtoModule.writeTag(Buf, Count, 1200, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult60, WriteTagResult2_59, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v376 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v376 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(Buffer4)
				}
			elseif Tag == 4 then
				local Buffer5
				Buffer5, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(Buffer5)
				}
			elseif Tag == 5 then
				local Buffer6
				Buffer6, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(Buffer6)
				}
			elseif Tag == 6 then
				local Buffer8
				Buffer8, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(Buffer8)
				}
			elseif Tag == 7 then
				local Buffer11
				Buffer11, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(Buffer11)
				}
			elseif Tag == 8 then
				local Buffer13
				Buffer13, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(Buffer13)
				}
			elseif Tag == 9 then
				local Buffer14
				Buffer14, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(Buffer14)
				}
			elseif Tag == 10 then
				local Buffer15
				Buffer15, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(Buffer15)
				}
			elseif Tag == 11 then
				local Buffer16
				Buffer16, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(Buffer16)
				}
			elseif Tag == 12 then
				local Buffer17
				Buffer17, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(Buffer17)
				}
			elseif Tag == 13 then
				local Buffer18
				Buffer18, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(Buffer18)
				}
			elseif Tag == 14 then
				local Buffer19
				Buffer19, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(Buffer19)
				}
			elseif Tag == 15 then
				local Buffer20
				Buffer20, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(Buffer20)
				}
			elseif Tag == 16 then
				local Buffer23
				Buffer23, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(Buffer23)
				}
			elseif Tag == 20 then
				local Buffer25
				Buffer25, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(Buffer25)
				}
			elseif Tag == 21 then
				local Buffer27
				Buffer27, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = { type = "card", value = t.CardInputData.decode(Buffer27) }
			elseif Tag == 22 then
				local Buffer29
				Buffer29, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(Buffer29)
				}
			elseif Tag == 23 then
				local Buffer31
				Buffer31, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "banner",
					value = t.BannerInputData.decode(Buffer31)
				}
			elseif Tag == 24 then
				local Buffer33
				Buffer33, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(Buffer33)
				}
			elseif Tag == 25 then
				local Buffer34
				Buffer34, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(Buffer34)
				}
			elseif Tag == 26 then
				local Buffer35
				Buffer35, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(Buffer35)
				}
			elseif Tag == 27 then
				local Buffer36
				Buffer36, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(Buffer36)
				}
			elseif Tag == 28 then
				local Buffer37
				Buffer37, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(Buffer37)
				}
			elseif Tag == 29 then
				local Buffer38
				Buffer38, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(Buffer38)
				}
			elseif Tag == 30 then
				local Buffer39
				Buffer39, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(Buffer39)
				}
			elseif Tag == 31 then
				local Buffer40
				Buffer40, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(Buffer40)
				}
			elseif Tag == 32 then
				local Buffer41
				Buffer41, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(Buffer41)
				}
			elseif Tag == 33 then
				local Buffer42
				Buffer42, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(Buffer42)
				}
			elseif Tag == 34 then
				local Buffer43
				Buffer43, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(Buffer43)
				}
			elseif Tag == 40 then
				local Buffer44
				Buffer44, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = { type = "text", value = t.TextInputData.decode(Buffer44) }
			elseif Tag == 41 then
				local Buffer45
				Buffer45, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(Buffer45)
				}
			elseif Tag == 42 then
				local Buffer46
				Buffer46, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(Buffer46)
				}
			elseif Tag == 500 then
				local Buffer47
				Buffer47, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(Buffer47)
				}
			elseif Tag == 501 then
				local Buffer48
				Buffer48, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(Buffer48)
				}
			elseif Tag == 502 then
				local Buffer49
				Buffer49, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(Buffer49)
				}
			elseif Tag == 503 then
				local Buffer50
				Buffer50, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(Buffer50)
				}
			elseif Tag == 600 then
				local Buffer51
				Buffer51, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(Buffer51)
				}
			elseif Tag == 601 then
				local Buffer52
				Buffer52, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(Buffer52)
				}
			elseif Tag == 602 then
				local Buffer53
				Buffer53, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(Buffer53)
				}
			elseif Tag == 603 then
				local Buffer26
				Buffer26, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(Buffer26)
				}
			elseif Tag == 604 then
				local Buffer21
				Buffer21, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(Buffer21)
				}
			elseif Tag == 605 then
				local Buffer24
				Buffer24, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(Buffer24)
				}
			elseif Tag == 606 then
				local Buffer32
				Buffer32, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(Buffer32)
				}
			elseif Tag == 700 then
				local Buffer22
				Buffer22, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(Buffer22)
				}
			elseif Tag == 800 then
				local Buffer30
				Buffer30, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(Buffer30)
				}
			elseif Tag == 801 then
				local Buffer54
				Buffer54, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(Buffer54)
				}
			elseif Tag == 802 then
				local Buffer28
				Buffer28, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(Buffer28)
				}
			elseif Tag == 900 then
				local Buffer55
				Buffer55, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(Buffer55)
				}
			elseif Tag == 901 then
				local Buffer56
				Buffer56, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(Buffer56)
				}
			elseif Tag == 902 then
				local Buffer57
				Buffer57, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(Buffer57)
				}
			elseif Tag == 903 then
				local Buffer10
				Buffer10, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(Buffer10)
				}
			elseif Tag == 904 then
				local Buffer3
				Buffer3, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(Buffer3)
				}
			elseif Tag == 905 then
				local Buffer9
				Buffer9, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(Buffer9)
				}
			elseif Tag == 1000 then
				local Buffer12
				Buffer12, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(Buffer12)
				}
			elseif Tag == 1001 then
				local Buffer7
				Buffer7, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(Buffer7)
				}
			elseif Tag == 1002 then
				local Buffer58
				Buffer58, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(Buffer58)
				}
			elseif Tag == 1100 then
				local Buffer59
				Buffer59, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(Buffer59)
				}
			elseif Tag == 1200 then
				local Buffer60
				Buffer60, v376 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(Buffer60)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v376 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v376 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			t.badgesGrid = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "badge_details" then
			t.badgeDetails = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "static_content" then
			t.staticContent = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_attribution_row" then
			t.experienceAttributionRow = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_action_module" then
			t.experienceActionModule = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_media_gallery" then
			t.experienceMediaGallery = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_description" then
			t.experienceDescription = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_stat_row" then
			t.experienceStatRow = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_info_table" then
			t.experienceInfoTable = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "social_link_row" then
			t.socialLinkRow = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_carousel" then
			t.experienceCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "song_carousel" then
			t.songCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "events_carousel" then
			t.eventsCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "game_pass_collection" then
			t.gamePassCollection = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "developer_product_collection" then
			t.developerProductCollection = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "subscription_collection" then
			t.subscriptionCollection = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "card_container" then
			t.cardContainer = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "card" then
			t.card = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "dialog" then
			t.dialog = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "banner" then
			t.banner = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "tooltip" then
			t.tooltip = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "coachmark" then
			t.coachmark = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "system_banner_prompt" then
			t.systemBannerPrompt = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "age_check_upsell" then
			t.ageCheckUpsell = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "catalog_item_list" then
			t.catalogItemList = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "user_list" then
			t.userList = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_content_rating_label" then
			t.experienceContentRatingLabel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_refund_policy" then
			t.experienceRefundPolicy = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_play_with_reward" then
			t.experiencePlayWithReward = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_guidelines_dialog" then
			t.experienceGuidelinesDialog = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "moments_carousel" then
			t.momentsCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "text" then
			t.text = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "vertical_feed" then
			t.verticalFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "page_header" then
			t.pageHeader = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_details_feed" then
			t.experienceDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_details_action_bar" then
			t.experienceDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_details_banner_image" then
			t.experienceDetailsBannerImage = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_details_sticky_header" then
			t.experienceDetailsStickyHeader = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_details_feed" then
			t.eventDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_details_action_bar" then
			t.eventDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_attribution_row" then
			t.eventAttributionRow = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_description" then
			t.eventDescription = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_info_table" then
			t.eventInfoTable = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_details_sheet_full_bleed" then
			t.eventDetailsSheetFullBleed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "event_notifications_modal" then
			t.eventNotificationsModal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "dev_store_feed" then
			t.devStoreFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "charts_feed" then
			t.chartsFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "filter_pills" then
			t.filterPills = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "sort_selector" then
			t.sortSelector = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_catalog_feed" then
			t.marketplaceCatalogFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_catalog_category_menu" then
			t.marketplaceCatalogCategoryMenu = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_catalog_item_group" then
			t.marketplaceCatalogItemGroup = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_catalog_item_carousel" then
			t.marketplaceCatalogItemCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_catalog_hero_unit" then
			t.marketplaceCatalogHeroUnit = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "catalog_item_grid" then
			t.catalogItemGrid = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "search_results_feed" then
			t.searchResultsFeed = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "power_search_ai_overview" then
			t.powerSearchAiOverview = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_emphasis_tile" then
			t.experienceEmphasisTile = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "option_selector_carousel" then
			t.optionSelectorCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "party_chat_conversation_upsell" then
			t.partyChatConversationUpsell = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), t (copy)
	local NewModule = Module4.new()
	
	if self.badges_grid ~= nil then
		NewModule.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		NewModule.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		NewModule.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		NewModule.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		NewModule.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		NewModule.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		NewModule.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		NewModule.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		NewModule.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		NewModule.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		NewModule.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		NewModule.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		NewModule.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		NewModule.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		NewModule.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		NewModule.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		NewModule.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		NewModule.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		NewModule.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		NewModule.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		NewModule.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		NewModule.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		NewModule.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		NewModule.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		NewModule.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		NewModule.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		NewModule.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		NewModule.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		NewModule.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		NewModule.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		NewModule.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		NewModule.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.card_container ~= nil then
		NewModule.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		NewModule.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		NewModule.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		NewModule.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		NewModule.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		NewModule.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		NewModule.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		NewModule.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		NewModule.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		NewModule.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		NewModule.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		NewModule.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		NewModule.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		NewModule.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		NewModule.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		NewModule.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		NewModule.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		NewModule.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		NewModule.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		NewModule.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		NewModule.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		NewModule.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		NewModule.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.moments_carousel ~= nil then
		NewModule.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		NewModule.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		NewModule.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		NewModule.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		NewModule.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		NewModule.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		NewModule.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.experience_details_feed ~= nil then
		NewModule.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		NewModule.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		NewModule.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		NewModule.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		NewModule.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		NewModule.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		NewModule.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		NewModule.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		NewModule.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		NewModule.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		NewModule.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		NewModule.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		NewModule.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		NewModule.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		NewModule.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		NewModule.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		NewModule.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		NewModule.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		NewModule.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		NewModule.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		NewModule.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		NewModule.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		NewModule.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		NewModule.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		NewModule.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		NewModule.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		NewModule.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		NewModule.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		NewModule.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		NewModule.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		NewModule.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		NewModule.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		NewModule.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.search_results_feed ~= nil then
		NewModule.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		NewModule.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		NewModule.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		NewModule.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		NewModule.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		NewModule.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		NewModule.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		NewModule.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		NewModule.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		NewModule.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	return NewModule
end

Module4.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = Module4
TypeRegistryModule.default:register(t.PageEntryInputData)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		badges = if p1 == nil or p1.badges == nil then {} else p1.badges,
		collection_id = if p1 == nil or p1.collection_id == nil then "" else p1.collection_id,
		collection_position = if p1 == nil or p1.collection_position == nil then "" else p1.collection_position,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.section_title)
	end
	if self.badges ~= nil and #self.badges > 0 then
		for _, badge in self.badges do
			local EncodeResult = badge:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.collection_id)
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.collection_position)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v460 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v460 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v460 = ProtoModule.readBuffer(Buf, v6)
				NewModule.section_title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v460 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.badges, t.BadgesGridInputData_BadgeInputData.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v460 = ProtoModule.readBuffer(Buf, v6)
				NewModule.collection_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v460 = ProtoModule.readBuffer(Buf, v6)
				NewModule.collection_position = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v460 = ProtoModule.readBuffer(Buf, v6)
				NewModule.universe_id = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v460 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v460 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.badges ~= nil and #self.badges > 0 then
		local Badges = {}
		
		for _, badge in self.badges do
			table.insert(Badges, badge:jsonEncode())
		end
		t.badges = Badges
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		t.collectionId = self.collection_id
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		t.collectionPosition = self.collection_position
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.section_title ~= nil then
		NewModule.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		NewModule.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local Badges = {}
		
		for _, badge in self.badges do
			table.insert(Badges, t.BadgesGridInputData_BadgeInputData.jsonDecode(badge))
		end
		NewModule.badges = Badges
	end
	if self.collection_id ~= nil then
		NewModule.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		NewModule.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		NewModule.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		NewModule.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module5.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = Module5
TypeRegistryModule.default:register(t.BadgesGridInputData)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.badge_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v482 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v482 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v482 = ProtoModule.readBuffer(Buf, v7)
				NewModule.badge_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v482 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v482 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = self.badgeId
	end
	return NewModule
end

Module6.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = Module6
TypeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		localized_literals = if p1 == nil or p1.localized_literals == nil then nil else p1.localized_literals,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.badge_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	if self.localized_literals ~= nil then
		local EncodeResult = self.localized_literals:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.creator_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v505 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v505 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v505 = ProtoModule.readBuffer(Buf, v8)
				NewModule.badge_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v505 = ProtoModule.readBuffer(Buf, v8)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v505 = ProtoModule.readBuffer(Buf, v8)
				NewModule.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v505 = ProtoModule.readBuffer(Buf, v8)
				NewModule.creator_key = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v505 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v505 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
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

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), t (copy)
	local NewModule = Module7.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		NewModule.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		NewModule.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	return NewModule
end

Module7.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = Module7
TypeRegistryModule.default:register(t.BadgeDetailsInputData)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		info_table = if p1 == nil or p1.info_table == nil then nil else p1.info_table,
		action_module = if p1 == nil or p1.action_module == nil then nil else p1.action_module,
		overflow_menu = if p1 == nil or p1.overflow_menu == nil then nil else p1.overflow_menu
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.info_table ~= nil then
		local EncodeResult = self.info_table:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.action_module ~= nil then
		local EncodeResult = self.action_module:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.overflow_menu ~= nil then
		local EncodeResult = self.overflow_menu:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v531 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v531 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v531 = ProtoModule.readBuffer(Buf, v9)
				NewModule.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v531 = ProtoModule.readBuffer(Buf, v9)
				NewModule.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v531 = ProtoModule.readBuffer(Buf, v9)
				NewModule.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v531 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v531 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
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

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), t (copy)
	local NewModule = Module8.new()
	
	if self.info_table ~= nil then
		NewModule.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		NewModule.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		NewModule.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		NewModule.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		NewModule.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		NewModule.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return NewModule
end

Module8.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = Module8
TypeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Module9 (copy)
	return (setmetatable({
		type_label = if p1 == nil or p1.type_label == nil then "" else p1.type_label,
		earned_label = if p1 == nil or p1.earned_label == nil then "" else p1.earned_label,
		updated_label = if p1 == nil or p1.updated_label == nil then "" else p1.updated_label,
		experience_label = if p1 == nil or p1.experience_label == nil then "" else p1.experience_label,
		rarity_label = if p1 == nil or p1.rarity_label == nil then "" else p1.rarity_label,
		won_yesterday_label = if p1 == nil or p1.won_yesterday_label == nil then "" else p1.won_yesterday_label,
		won_ever_label = if p1 == nil or p1.won_ever_label == nil then "" else p1.won_ever_label
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.type_label)
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.earned_label)
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.updated_label)
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.experience_label)
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.rarity_label)
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.won_yesterday_label)
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.won_ever_label)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v561 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v561 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.type_label = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.earned_label = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.updated_label = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.experience_label = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.rarity_label = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.won_yesterday_label = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v561 = ProtoModule.readBuffer(Buf, v10)
				NewModule.won_ever_label = buffer.tostring(Buffer7)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v561 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v561 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
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

function Module9:jsonDecode()
	-- upvalues: Module9 (copy)
	local NewModule = Module9.new()
	
	if self.type_label ~= nil then
		NewModule.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		NewModule.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		NewModule.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		NewModule.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		NewModule.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		NewModule.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		NewModule.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		NewModule.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		NewModule.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		NewModule.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		NewModule.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		NewModule.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		NewModule.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		NewModule.won_ever_label = self.wonEverLabel
	end
	return NewModule
end

Module9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = Module9
TypeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: Module10 (copy)
	return (setmetatable({
		share = if p1 == nil or p1.share == nil then "" else p1.share,
		report = if p1 == nil or p1.report == nil then "" else p1.report
	}, Module10))
end

function Module10:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.share ~= nil and self.share ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.share)
	end
	if self.report ~= nil and self.report ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.report)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf)
	-- upvalues: Module10 (copy), ProtoModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v585 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v585 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v585 = ProtoModule.readBuffer(Buf, v11)
				NewModule.share = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v585 = ProtoModule.readBuffer(Buf, v11)
				NewModule.report = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v585 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v585 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy)
	local NewModule = Module10.new()
	
	if self.share ~= nil then
		NewModule.share = self.share
	end
	if self.report ~= nil then
		NewModule.report = self.report
	end
	return NewModule
end

Module10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = Module10
TypeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		report = if p1 == nil or p1.report == nil then "" else p1.report,
		remove = if p1 == nil or p1.remove == nil then "" else p1.remove
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.report ~= nil and self.report ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.report)
	end
	if self.remove ~= nil and self.remove ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.remove)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf)
	-- upvalues: Module11 (copy), ProtoModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v604 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v604 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v604 = ProtoModule.readBuffer(Buf, v12)
				NewModule.report = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v604 = ProtoModule.readBuffer(Buf, v12)
				NewModule.remove = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v604 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v604 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function Module11:jsonDecode()
	-- upvalues: Module11 (copy)
	local NewModule = Module11.new()
	
	if self.report ~= nil then
		NewModule.report = self.report
	end
	if self.remove ~= nil then
		NewModule.remove = self.remove
	end
	return NewModule
end

Module11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = Module11
TypeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local Module12 = {}
Module12.__index = Module12

function Module12:new()
	-- upvalues: Module12 (copy)
	return (setmetatable({}, Module12))
end

function Module12:encode()
	local Buf = buffer.create(0)
	buffer.copy(Buf, 0, buffer.create(0), 0, 0)
	
	return Buf
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local _, Tag2
		_, Tag2, v618 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v618 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
			v13 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v618 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v618 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	return {}
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy)
	return (Module12.new())
end

Module12.descriptor = {
	name = "StaticInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
}
t.StaticInputData = Module12
TypeRegistryModule.default:register(t.StaticInputData)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.creator_key)
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, value1)
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i1, value2 in self.entry_order_map do
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, i1)
			local EncodeResult = value2:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v657 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v657 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v657 = ProtoModule.readBuffer(Buf, v14)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v657 = ProtoModule.readBuffer(Buf, v14)
				NewModule.creator_key = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v657 = ProtoModule.readBuffer(Buf, v14)
				local DecodeResult = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(Buffer3)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v657 = ProtoModule.readBuffer(Buf, v14)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer4))
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v657 = ProtoModule.readBuffer(Buf, v14)
				local DecodeResult = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(Buffer5)
				local NewResult = t.EntryOrder.new()
				NewModule.entry_order_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v657 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v657 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local EntryOrderMap = {}
		
		for i1, value2 in self.entry_order_map do
			EntryOrderMap[i1] = value2:jsonEncode()
		end
		t.entryOrderMap = EntryOrderMap
	end
	return t
end

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), t (copy)
	local NewModule = Module13.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entry_order_map ~= nil then
		local Entry_order_map = {}
		
		for i2, value4 in self.entry_order_map do
			Entry_order_map[i2] = t.EntryOrder.jsonDecode(value4)
		end
		NewModule.entry_order_map = Entry_order_map
	end
	if self.entryOrderMap ~= nil then
		local Entry_order_map = {}
		
		for i3, value5 in self.entryOrderMap do
			Entry_order_map[i3] = t.EntryOrder.jsonDecode(value5)
		end
		NewModule.entry_order_map = Entry_order_map
	end
	return NewModule
end

Module13.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = Module13
TypeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: Module14 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module14))
end

function Module14:encode()
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

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v693 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v693 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v693 = ProtoModule.readBuffer(Buf, v15)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v693 = ProtoModule.readBuffer(Buf, v15)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v693 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v693 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), t (copy)
	local NewModule = Module14.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module14.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = Module14
TypeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local Module15 = {}
Module15.__index = Module15

function Module15.new(p1)
	-- upvalues: Module15 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module15))
end

function Module15:encode()
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

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v713 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v713 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v713 = ProtoModule.readBuffer(Buf, v16)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v713 = ProtoModule.readBuffer(Buf, v16)
				NewModule.value = t.EntryOrder.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v713 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v713 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy), t (copy)
	local NewModule = Module15.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.EntryOrder.jsonDecode(self.value)
	end
	return NewModule
end

Module15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = Module15
TypeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: Module16 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module16))
end

function Module16:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, item)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf)
	-- upvalues: Module16 (copy), ProtoModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v730 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v730 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v730 = ProtoModule.readBuffer(Buf, v17)
				table.insert(NewModule.items, buffer.tostring(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v730 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v730 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item)
		end
		t.items = Items
	end
	return t
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy)
	local NewModule = Module16.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item)
		end
		NewModule.items = Items
	end
	return NewModule
end

Module16.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = Module16
TypeRegistryModule.default:register(t.EntryOrder)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1)
	-- upvalues: Module17 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = p1 ~= nil and p1.user_owns_experience ~= nil and p1.user_owns_experience
	}, Module17))
end

function Module17:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.user_owns_experience then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.user_owns_experience then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v750 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v750 = ProtoModule.readVarInt(Buf, v18)
				NewModule.user_owns_experience = VarInt ~= 0
			else
				local _
				_, v750 = ProtoModule.readVarInt(Buf, v18)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v750 = ProtoModule.readBuffer(Buf, v18)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v750 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v750 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy)
	local NewModule = Module17.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		NewModule.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		NewModule.user_owns_experience = self.userOwnsExperience
	end
	return NewModule
end

Module17.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = Module17
TypeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1)
	-- upvalues: Module18 (copy)
	return (setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id
	}, Module18))
end

function Module18:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.media_asset_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf)
	-- upvalues: Module18 (copy), ProtoModule (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v767 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v767 = ProtoModule.readVarInt(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v767 = ProtoModule.readBuffer(Buf, v19)
				NewModule.media_asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v767 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v767 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function Module18:jsonDecode()
	-- upvalues: Module18 (copy)
	local NewModule = Module18.new()
	
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	return NewModule
end

Module18.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = Module18
TypeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1)
	-- upvalues: Module19 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module19))
end

function Module19:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf)
	-- upvalues: Module19 (copy), ProtoModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v783 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v783 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v783 = ProtoModule.readBuffer(Buf, v20)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v783 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v783 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module19:jsonDecode()
	-- upvalues: Module19 (copy)
	local NewModule = Module19.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module19.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = Module19
TypeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1)
	-- upvalues: Module20 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module20))
end

function Module20:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.creator_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf)
	-- upvalues: Module20 (copy), ProtoModule (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v801 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v801 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v801 = ProtoModule.readBuffer(Buf, v21)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v801 = ProtoModule.readBuffer(Buf, v21)
				NewModule.creator_key = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v801 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v801 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function Module20:jsonDecode()
	-- upvalues: Module20 (copy)
	local NewModule = Module20.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	return NewModule
end

Module20.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = Module20
TypeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1)
	-- upvalues: Module21 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then "" else p1.root_place_id,
		connection_played_display_name = if p1 == nil or p1.connection_played_display_name == nil then "" else p1.connection_played_display_name,
		upsell_prompt = if p1 == nil or p1.upsell_prompt == nil then "" else p1.upsell_prompt,
		connection_played_users = if p1 == nil or p1.connection_played_users == nil then {} else p1.connection_played_users,
		connection_played_num_others = if p1 == nil or p1.connection_played_num_others == nil then 0 else p1.connection_played_num_others,
		connection_played_total_count = if p1 == nil or p1.connection_played_total_count == nil then 0 else p1.connection_played_total_count
	}, Module21))
end

function Module21:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.root_place_id)
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.connection_played_display_name)
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.upsell_prompt)
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for _, connectionPlayedUser in self.connection_played_users do
			local EncodeResult = connectionPlayedUser:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.connection_played_num_others)
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.connection_played_total_count)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf)
	-- upvalues: Module21 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v831 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				NewModule.connection_played_num_others, v831 = ProtoModule.readVarIntI32(Buf, v22)
			elseif Tag == 7 then
				NewModule.connection_played_total_count, v831 = ProtoModule.readVarIntI32(Buf, v22)
			else
				local _
				_, v831 = ProtoModule.readVarInt(Buf, v22)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v831 = ProtoModule.readBuffer(Buf, v22)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v831 = ProtoModule.readBuffer(Buf, v22)
				NewModule.root_place_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v831 = ProtoModule.readBuffer(Buf, v22)
				NewModule.connection_played_display_name = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v831 = ProtoModule.readBuffer(Buf, v22)
				NewModule.upsell_prompt = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v831 = ProtoModule.readBuffer(Buf, v22)
				table.insert(NewModule.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(Buffer5))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v831 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v831 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		t.rootPlaceId = self.root_place_id
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		t.connectionPlayedDisplayName = self.connection_played_display_name
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		local ConnectionPlayedUsers = {}
		
		for _, connectionPlayedUser in self.connection_played_users do
			table.insert(ConnectionPlayedUsers, connectionPlayedUser:jsonEncode())
		end
		t.connectionPlayedUsers = ConnectionPlayedUsers
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		t.connectionPlayedNumOthers = self.connection_played_num_others
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		t.connectionPlayedTotalCount = self.connection_played_total_count
	end
	return t
end

function Module21:jsonDecode()
	-- upvalues: Module21 (copy), t (copy)
	local NewModule = Module21.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		NewModule.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		NewModule.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		NewModule.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		NewModule.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		NewModule.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local Connection_played_users = {}
		
		for _, connectionPlayedUser in self.connection_played_users do
			table.insert(Connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(connectionPlayedUser))
		end
		NewModule.connection_played_users = Connection_played_users
	end
	if self.connectionPlayedUsers ~= nil then
		local Connection_played_users = {}
		
		for _, connectionPlayedUser1 in self.connectionPlayedUsers do
			table.insert(Connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(connectionPlayedUser1))
		end
		NewModule.connection_played_users = Connection_played_users
	end
	if self.connection_played_num_others ~= nil then
		NewModule.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		NewModule.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		NewModule.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		NewModule.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return NewModule
end

Module21.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = Module21
TypeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local Module22 = {}
Module22.__index = Module22

function Module22.new(p1)
	-- upvalues: Module22 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, Module22))
end

function Module22:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module22.decode(Buf)
	-- upvalues: Module22 (copy), ProtoModule (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v854 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v854 = ProtoModule.readVarInt(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v854 = ProtoModule.readBuffer(Buf, v23)
				NewModule.user_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v854 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v854 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function Module22:jsonDecode()
	-- upvalues: Module22 (copy)
	local NewModule = Module22.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	return NewModule
end

Module22.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = Module22
TypeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local Module23 = {}
Module23.__index = Module23

function Module23.new(p1)
	-- upvalues: Module23 (copy)
	return (setmetatable({
		media_items = if p1 == nil or p1.media_items == nil then {} else p1.media_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, Module23))
end

function Module23:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for _, mediaItem in self.media_items do
			local EncodeResult = mediaItem:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.place_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module23.decode(Buf)
	-- upvalues: Module23 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v875 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v875 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v875 = ProtoModule.readBuffer(Buf, v24)
				table.insert(NewModule.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v875 = ProtoModule.readBuffer(Buf, v24)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v875 = ProtoModule.readBuffer(Buf, v24)
				NewModule.place_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v875 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v875 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode()
	local t = {}
	
	if self.media_items ~= nil and #self.media_items > 0 then
		local MediaItems = {}
		
		for _, mediaItem in self.media_items do
			table.insert(MediaItems, mediaItem:jsonEncode())
		end
		t.mediaItems = MediaItems
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function Module23:jsonDecode()
	-- upvalues: Module23 (copy), t (copy)
	local NewModule = Module23.new()
	
	if self.media_items ~= nil then
		local Media_items = {}
		
		for _, mediaItem in self.media_items do
			table.insert(Media_items, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(mediaItem))
		end
		NewModule.media_items = Media_items
	end
	if self.mediaItems ~= nil then
		local Media_items = {}
		
		for _, mediaItem1 in self.mediaItems do
			table.insert(Media_items, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(mediaItem1))
		end
		NewModule.media_items = Media_items
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		NewModule.place_id = self.place_id
	end
	if self.placeId ~= nil then
		NewModule.place_id = self.placeId
	end
	return NewModule
end

Module23.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = Module23
TypeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local Module24 = {}
Module24.__index = Module24

function Module24.new(p1)
	-- upvalues: Module24 (copy)
	return (setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id
	}, Module24))
end

function Module24:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.media_asset_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf)
	-- upvalues: Module24 (copy), ProtoModule (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v896 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v896 = ProtoModule.readVarInt(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v896 = ProtoModule.readBuffer(Buf, v25)
				NewModule.media_asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v896 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v896 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function Module24:jsonDecode()
	-- upvalues: Module24 (copy)
	local NewModule = Module24.new()
	
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	return NewModule
end

Module24.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = Module24
TypeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local Module25 = {}
Module25.__index = Module25

function Module25.new(p1)
	-- upvalues: Module25 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module25))
end

function Module25:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module25.decode(Buf)
	-- upvalues: Module25 (copy), ProtoModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v912 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v912 = ProtoModule.readVarInt(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v912 = ProtoModule.readBuffer(Buf, v26)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v912 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v912 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module25:jsonDecode()
	-- upvalues: Module25 (copy)
	local NewModule = Module25.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module25.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = Module25
TypeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1)
	-- upvalues: Module26 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module26))
end

function Module26:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module26.decode(Buf)
	-- upvalues: Module26 (copy), ProtoModule (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v928 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v928 = ProtoModule.readVarInt(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v928 = ProtoModule.readBuffer(Buf, v27)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v928 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v928 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module26:jsonDecode()
	-- upvalues: Module26 (copy)
	local NewModule = Module26.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module26.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = Module26
TypeRegistryModule.default:register(t.ExperienceStatRowInputData)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1)
	-- upvalues: Module27 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		has_store_items = p1 ~= nil and p1.has_store_items ~= nil and p1.has_store_items,
		has_badges = p1 ~= nil and p1.has_badges ~= nil and p1.has_badges,
		has_game_passes = p1 ~= nil and p1.has_game_passes ~= nil and p1.has_game_passes
	}, Module27))
end

function Module27:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.has_store_items then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.has_store_items then 1 else 0)
	end
	if self.has_badges then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.has_badges then 1 else 0)
	end
	if self.has_game_passes then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.has_game_passes then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module27.decode(Buf)
	-- upvalues: Module27 (copy), ProtoModule (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v950 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v950 = ProtoModule.readVarInt(Buf, v28)
				NewModule.has_store_items = VarInt ~= 0
			elseif Tag == 3 then
				local VarInt1
				VarInt1, v950 = ProtoModule.readVarInt(Buf, v28)
				NewModule.has_badges = VarInt1 ~= 0
			elseif Tag == 4 then
				local VarInt2
				VarInt2, v950 = ProtoModule.readVarInt(Buf, v28)
				NewModule.has_game_passes = VarInt2 ~= 0
			else
				local _
				_, v950 = ProtoModule.readVarInt(Buf, v28)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v950 = ProtoModule.readBuffer(Buf, v28)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt3, VarInt2_1 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2_1 + VarInt3
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v950 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v950 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.has_store_items then
		t.hasStoreItems = self.has_store_items
	end
	if self.has_badges then
		t.hasBadges = self.has_badges
	end
	if self.has_game_passes then
		t.hasGamePasses = self.has_game_passes
	end
	return t
end

function Module27:jsonDecode()
	-- upvalues: Module27 (copy)
	local NewModule = Module27.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		NewModule.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		NewModule.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		NewModule.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		NewModule.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		NewModule.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		NewModule.has_game_passes = self.hasGamePasses
	end
	return NewModule
end

Module27.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = Module27
TypeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1)
	-- upvalues: Module28 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module28))
end

function Module28:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module28.decode(Buf)
	-- upvalues: Module28 (copy), ProtoModule (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v969 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v969 = ProtoModule.readVarInt(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v969 = ProtoModule.readBuffer(Buf, v29)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v969 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v969 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module28:jsonDecode()
	-- upvalues: Module28 (copy)
	local NewModule = Module28.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module28.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = Module28
TypeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1)
	-- upvalues: Module29 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = p1 ~= nil and p1.user_owns_experience ~= nil and p1.user_owns_experience
	}, Module29))
end

function Module29:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.user_owns_experience then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.user_owns_experience then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module29.decode(Buf)
	-- upvalues: Module29 (copy), ProtoModule (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v987 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v987 = ProtoModule.readVarInt(Buf, v30)
				NewModule.user_owns_experience = VarInt ~= 0
			else
				local _
				_, v987 = ProtoModule.readVarInt(Buf, v30)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v987 = ProtoModule.readBuffer(Buf, v30)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v987 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v987 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function Module29:jsonDecode()
	-- upvalues: Module29 (copy)
	local NewModule = Module29.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		NewModule.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		NewModule.user_owns_experience = self.userOwnsExperience
	end
	return NewModule
end

Module29.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = Module29
TypeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1)
	-- upvalues: Module30 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, Module30))
end

function Module30:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.place_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module30.decode(Buf)
	-- upvalues: Module30 (copy), ProtoModule (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1006 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1006 = ProtoModule.readVarInt(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1006 = ProtoModule.readBuffer(Buf, v31)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1006 = ProtoModule.readBuffer(Buf, v31)
				NewModule.place_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1006 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1006 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function Module30:jsonDecode()
	-- upvalues: Module30 (copy)
	local NewModule = Module30.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		NewModule.place_id = self.place_id
	end
	if self.placeId ~= nil then
		NewModule.place_id = self.placeId
	end
	return NewModule
end

Module30.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = Module30
TypeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1)
	-- upvalues: Module31 (copy)
	return (setmetatable({
		social_link_items = if p1 == nil or p1.social_link_items == nil then {} else p1.social_link_items
	}, Module31))
end

function Module31:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for _, socialLinkItem in self.social_link_items do
			local EncodeResult = socialLinkItem:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module31.decode(Buf)
	-- upvalues: Module31 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1024 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1024 = ProtoModule.readVarInt(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1024 = ProtoModule.readBuffer(Buf, v32)
				table.insert(NewModule.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1024 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1024 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode()
	local t = {}
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		local SocialLinkItems = {}
		
		for _, socialLinkItem in self.social_link_items do
			table.insert(SocialLinkItems, socialLinkItem:jsonEncode())
		end
		t.socialLinkItems = SocialLinkItems
	end
	return t
end

function Module31:jsonDecode()
	-- upvalues: Module31 (copy), t (copy)
	local NewModule = Module31.new()
	
	if self.social_link_items ~= nil then
		local Social_link_items = {}
		
		for _, socialLinkItem in self.social_link_items do
			table.insert(Social_link_items, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(socialLinkItem))
		end
		NewModule.social_link_items = Social_link_items
	end
	if self.socialLinkItems ~= nil then
		local Social_link_items = {}
		
		for _, socialLinkItem1 in self.socialLinkItems do
			table.insert(Social_link_items, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(socialLinkItem1))
		end
		NewModule.social_link_items = Social_link_items
	end
	return NewModule
end

Module31.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = Module31
TypeRegistryModule.default:register(t.SocialLinkRowInputData)
local Module32 = {}
Module32.__index = Module32

function Module32.new(p1)
	-- upvalues: Module32 (copy)
	return (setmetatable({
		social_link_id = if p1 == nil or p1.social_link_id == nil then "" else p1.social_link_id
	}, Module32))
end

function Module32:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.social_link_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module32.decode(Buf)
	-- upvalues: Module32 (copy), ProtoModule (copy)
	local NewModule = Module32.new()
	local v33 = 0
	while v33 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1043 = ProtoModule.readTag(Buf, v33)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1043 = ProtoModule.readVarInt(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1043 = ProtoModule.readBuffer(Buf, v33)
				NewModule.social_link_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v33)
				v33 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1043 = ProtoModule.readFixed32(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1043 = ProtoModule.readFixed64(Buf, v33)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module32:jsonEncode()
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function Module32:jsonDecode()
	-- upvalues: Module32 (copy)
	local NewModule = Module32.new()
	
	if self.social_link_id ~= nil then
		NewModule.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		NewModule.social_link_id = self.socialLinkId
	end
	return NewModule
end

Module32.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = Module32
TypeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local Module33 = {}
Module33.__index = Module33

function Module33.new(p1)
	-- upvalues: Module33 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		universe_items = if p1 == nil or p1.universe_items == nil then {} else p1.universe_items,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text,
		subtitle_link_path = if p1 == nil or p1.subtitle_link_path == nil then "" else p1.subtitle_link_path,
		is_placeholder = if p1 == nil or p1.is_placeholder == nil then nil else p1.is_placeholder,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters,
		pool_id = if p1 == nil or p1.pool_id == nil then nil else p1.pool_id
	}, Module33))
end

function Module33:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for _, universeItem in self.universe_items do
			local EncodeResult = universeItem:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.next_page_token)
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.sort_id)
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.secondary_sort_id)
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.max_visible_rows)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.subtitle)
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.info_text)
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.subtitle_link_path)
	end
	if self.is_placeholder ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, if self.is_placeholder then 1 else 0)
	end
	if self.primary_sort_id ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, self.primary_sort_id)
	end
	if self.applied_filters ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.applied_filters)
	end
	if self.pool_id ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.pool_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module33.decode(Buf)
	-- upvalues: Module33 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module33.new()
	local v34 = 0
	while v34 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1084 = ProtoModule.readTag(Buf, v34)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.secondary_sort_id, v1084 = ProtoModule.readVarIntI32(Buf, v34)
			elseif Tag == 6 then
				NewModule.max_visible_rows, v1084 = ProtoModule.readVarIntI32(Buf, v34)
			elseif Tag == 10 then
				local VarInt
				VarInt, v1084 = ProtoModule.readVarInt(Buf, v34)
				NewModule.is_placeholder = VarInt ~= 0
			elseif Tag == 11 then
				NewModule.primary_sort_id, v1084 = ProtoModule.readVarIntI32(Buf, v34)
			else
				local _
				_, v1084 = ProtoModule.readVarInt(Buf, v34)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1084 = ProtoModule.readBuffer(Buf, v34)
				table.insert(NewModule.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.next_page_token = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.sort_id = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.info_text = buffer.tostring(Buffer6)
			elseif Tag == 9 then
				local Buffer7
				Buffer7, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.subtitle_link_path = buffer.tostring(Buffer7)
			elseif Tag == 12 then
				local Buffer8
				Buffer8, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.applied_filters = buffer.tostring(Buffer8)
			elseif Tag == 13 then
				local Buffer9
				Buffer9, v1084 = ProtoModule.readBuffer(Buf, v34)
				NewModule.pool_id = buffer.tostring(Buffer9)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v34)
				v34 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1084 = ProtoModule.readFixed32(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1084 = ProtoModule.readFixed64(Buf, v34)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module33:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		local UniverseItems = {}
		
		for _, universeItem in self.universe_items do
			table.insert(UniverseItems, universeItem:jsonEncode())
		end
		t.universeItems = UniverseItems
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	if self.pool_id ~= nil then
		t.poolId = self.pool_id
	end
	return t
end

function Module33:jsonDecode()
	-- upvalues: Module33 (copy), t (copy)
	local NewModule = Module33.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.universe_items ~= nil then
		local Universe_items = {}
		
		for _, universeItem in self.universe_items do
			table.insert(Universe_items, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(universeItem))
		end
		NewModule.universe_items = Universe_items
	end
	if self.universeItems ~= nil then
		local Universe_items = {}
		
		for _, universeItem1 in self.universeItems do
			table.insert(Universe_items, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(universeItem1))
		end
		NewModule.universe_items = Universe_items
	end
	if self.next_page_token ~= nil then
		NewModule.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		NewModule.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		NewModule.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		NewModule.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		NewModule.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		NewModule.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		NewModule.info_text = self.info_text
	end
	if self.infoText ~= nil then
		NewModule.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		NewModule.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		NewModule.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		NewModule.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		NewModule.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		NewModule.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		NewModule.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		NewModule.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		NewModule.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		NewModule.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		NewModule.pool_id = self.poolId
	end
	return NewModule
end

Module33.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = Module33
TypeRegistryModule.default:register(t.ExperienceCarouselInputData)
local Module34 = {}
Module34.__index = Module34

function Module34.new(p1)
	-- upvalues: Module34 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		is_sponsored = p1 ~= nil and p1.is_sponsored ~= nil and p1.is_sponsored,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		native_ad_data = if p1 == nil or p1.native_ad_data == nil then "" else p1.native_ad_data,
		is_content_locked = p1 ~= nil and p1.is_content_locked ~= nil and p1.is_content_locked,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		badge_text = if p1 == nil or p1.badge_text == nil then "" else p1.badge_text,
		player_count = if p1 == nil or p1.player_count == nil then nil else p1.player_count,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module34))
end

function Module34:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.is_sponsored then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_sponsored then 1 else 0)
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.roblox_component)
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.native_ad_data)
	end
	if self.is_content_locked then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.is_content_locked then 1 else 0)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.title)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.subtitle)
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.image_asset_id)
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.video_asset_id)
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.badge_text)
	end
	if self.player_count ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, self.player_count)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.creator_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module34.decode(Buf)
	-- upvalues: Module34 (copy), ProtoModule (copy)
	local NewModule = Module34.new()
	local v35 = 0
	while v35 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1134 = ProtoModule.readTag(Buf, v35)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v1134 = ProtoModule.readVarInt(Buf, v35)
				NewModule.is_sponsored = VarInt ~= 0
			elseif Tag == 5 then
				local VarInt1
				VarInt1, v1134 = ProtoModule.readVarInt(Buf, v35)
				NewModule.is_content_locked = VarInt1 ~= 0
			elseif Tag == 11 then
				NewModule.player_count, v1134 = ProtoModule.readVarIntI64(Buf, v35)
			else
				local _
				_, v1134 = ProtoModule.readVarInt(Buf, v35)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.roblox_component = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.native_ad_data = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.image_asset_id = buffer.tostring(Buffer6)
			elseif Tag == 9 then
				local Buffer7
				Buffer7, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.video_asset_id = buffer.tostring(Buffer7)
			elseif Tag == 10 then
				local Buffer8
				Buffer8, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.badge_text = buffer.tostring(Buffer8)
			elseif Tag == 12 then
				local Buffer9
				Buffer9, v1134 = ProtoModule.readBuffer(Buf, v35)
				NewModule.creator_key = buffer.tostring(Buffer9)
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v35)
				v35 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1134 = ProtoModule.readFixed32(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1134 = ProtoModule.readFixed64(Buf, v35)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module34:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_sponsored then
		t.isSponsored = self.is_sponsored
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		t.badgeText = self.badge_text
	end
	if self.player_count ~= nil then
		t.playerCount = self.player_count
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function Module34:jsonDecode()
	-- upvalues: Module34 (copy)
	local NewModule = Module34.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		NewModule.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		NewModule.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		NewModule.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		NewModule.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		NewModule.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		NewModule.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		NewModule.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		NewModule.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		NewModule.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		NewModule.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		NewModule.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		NewModule.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	return NewModule
end

Module34.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = Module34
TypeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local Module35 = {}
Module35.__index = Module35

function Module35.new(p1)
	-- upvalues: Module35 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		song_items = if p1 == nil or p1.song_items == nil then {} else p1.song_items,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text,
		subtitle_link_path = if p1 == nil or p1.subtitle_link_path == nil then "" else p1.subtitle_link_path,
		is_placeholder = if p1 == nil or p1.is_placeholder == nil then nil else p1.is_placeholder,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters
	}, Module35))
end

function Module35:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for _, songItem in self.song_items do
			local EncodeResult = songItem:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.next_page_token)
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.sort_id)
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.secondary_sort_id)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.subtitle)
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.info_text)
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.subtitle_link_path)
	end
	if self.is_placeholder ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, if self.is_placeholder then 1 else 0)
	end
	if self.primary_sort_id ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, self.primary_sort_id)
	end
	if self.applied_filters ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.applied_filters)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module35.decode(Buf)
	-- upvalues: Module35 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module35.new()
	local v36 = 0
	while v36 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1181 = ProtoModule.readTag(Buf, v36)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.secondary_sort_id, v1181 = ProtoModule.readVarIntI32(Buf, v36)
			elseif Tag == 9 then
				local VarInt
				VarInt, v1181 = ProtoModule.readVarInt(Buf, v36)
				NewModule.is_placeholder = VarInt ~= 0
			elseif Tag == 10 then
				NewModule.primary_sort_id, v1181 = ProtoModule.readVarIntI32(Buf, v36)
			else
				local _
				_, v1181 = ProtoModule.readVarInt(Buf, v36)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1181 = ProtoModule.readBuffer(Buf, v36)
				table.insert(NewModule.song_items, t.SongCarouselInputData_SongItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.next_page_token = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.sort_id = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.info_text = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.subtitle_link_path = buffer.tostring(Buffer7)
			elseif Tag == 11 then
				local Buffer8
				Buffer8, v1181 = ProtoModule.readBuffer(Buf, v36)
				NewModule.applied_filters = buffer.tostring(Buffer8)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v36)
				v36 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1181 = ProtoModule.readFixed32(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1181 = ProtoModule.readFixed64(Buf, v36)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module35:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		local SongItems = {}
		
		for _, songItem in self.song_items do
			table.insert(SongItems, songItem:jsonEncode())
		end
		t.songItems = SongItems
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function Module35:jsonDecode()
	-- upvalues: Module35 (copy), t (copy)
	local NewModule = Module35.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.song_items ~= nil then
		local Song_items = {}
		
		for _, songItem in self.song_items do
			table.insert(Song_items, t.SongCarouselInputData_SongItem.jsonDecode(songItem))
		end
		NewModule.song_items = Song_items
	end
	if self.songItems ~= nil then
		local Song_items = {}
		
		for _, songItem1 in self.songItems do
			table.insert(Song_items, t.SongCarouselInputData_SongItem.jsonDecode(songItem1))
		end
		NewModule.song_items = Song_items
	end
	if self.next_page_token ~= nil then
		NewModule.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		NewModule.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		NewModule.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		NewModule.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		NewModule.info_text = self.info_text
	end
	if self.infoText ~= nil then
		NewModule.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		NewModule.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		NewModule.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		NewModule.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		NewModule.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		NewModule.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		NewModule.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		NewModule.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		NewModule.applied_filters = self.appliedFilters
	end
	return NewModule
end

Module35.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = Module35
TypeRegistryModule.default:register(t.SongCarouselInputData)
local Module36 = {}
Module36.__index = Module36

function Module36.new(p1)
	-- upvalues: Module36 (copy)
	return (setmetatable({
		song_id = if p1 == nil or p1.song_id == nil then "" else p1.song_id
	}, Module36))
end

function Module36:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.song_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module36.decode(Buf)
	-- upvalues: Module36 (copy), ProtoModule (copy)
	local NewModule = Module36.new()
	local v37 = 0
	while v37 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1208 = ProtoModule.readTag(Buf, v37)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1208 = ProtoModule.readVarInt(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1208 = ProtoModule.readBuffer(Buf, v37)
				NewModule.song_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v37)
				v37 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1208 = ProtoModule.readFixed32(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1208 = ProtoModule.readFixed64(Buf, v37)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module36:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function Module36:jsonDecode()
	-- upvalues: Module36 (copy)
	local NewModule = Module36.new()
	
	if self.song_id ~= nil then
		NewModule.song_id = self.song_id
	end
	if self.songId ~= nil then
		NewModule.song_id = self.songId
	end
	return NewModule
end

Module36.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = Module36
TypeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local Module37 = {}
Module37.__index = Module37

function Module37.new(p1)
	-- upvalues: Module37 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		event_items = if p1 == nil or p1.event_items == nil then {} else p1.event_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, Module37))
end

function Module37:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for _, eventItem in self.event_items do
			local EncodeResult = eventItem:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.universe_id)
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.sort_id)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.subtitle)
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.info_text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module37.decode(Buf)
	-- upvalues: Module37 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module37.new()
	local v38 = 0
	while v38 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1235 = ProtoModule.readTag(Buf, v38)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1235 = ProtoModule.readVarInt(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1235 = ProtoModule.readBuffer(Buf, v38)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1235 = ProtoModule.readBuffer(Buf, v38)
				table.insert(NewModule.event_items, t.EventsCarouselInputData_EventItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1235 = ProtoModule.readBuffer(Buf, v38)
				NewModule.universe_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1235 = ProtoModule.readBuffer(Buf, v38)
				NewModule.sort_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1235 = ProtoModule.readBuffer(Buf, v38)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1235 = ProtoModule.readBuffer(Buf, v38)
				NewModule.info_text = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v38)
				v38 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1235 = ProtoModule.readFixed32(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1235 = ProtoModule.readFixed64(Buf, v38)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module37:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		local EventItems = {}
		
		for _, eventItem in self.event_items do
			table.insert(EventItems, eventItem:jsonEncode())
		end
		t.eventItems = EventItems
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function Module37:jsonDecode()
	-- upvalues: Module37 (copy), t (copy)
	local NewModule = Module37.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.event_items ~= nil then
		local Event_items = {}
		
		for _, eventItem in self.event_items do
			table.insert(Event_items, t.EventsCarouselInputData_EventItem.jsonDecode(eventItem))
		end
		NewModule.event_items = Event_items
	end
	if self.eventItems ~= nil then
		local Event_items = {}
		
		for _, eventItem1 in self.eventItems do
			table.insert(Event_items, t.EventsCarouselInputData_EventItem.jsonDecode(eventItem1))
		end
		NewModule.event_items = Event_items
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		NewModule.info_text = self.info_text
	end
	if self.infoText ~= nil then
		NewModule.info_text = self.infoText
	end
	return NewModule
end

Module37.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = Module37
TypeRegistryModule.default:register(t.EventsCarouselInputData)
local Module38 = {}
Module38.__index = Module38

function Module38.new(p1)
	-- upvalues: Module38 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module38))
end

function Module38:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module38.decode(Buf)
	-- upvalues: Module38 (copy), ProtoModule (copy)
	local NewModule = Module38.new()
	local v39 = 0
	while v39 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1259 = ProtoModule.readTag(Buf, v39)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1259 = ProtoModule.readVarInt(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1259 = ProtoModule.readBuffer(Buf, v39)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v39)
				v39 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1259 = ProtoModule.readFixed32(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1259 = ProtoModule.readFixed64(Buf, v39)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module38:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module38:jsonDecode()
	-- upvalues: Module38 (copy)
	local NewModule = Module38.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module38.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = Module38
TypeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local Module39 = {}
Module39.__index = Module39

function Module39.new(p1)
	-- upvalues: Module39 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module39))
end

function Module39:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, i)
			local EncodeResult = value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, value1)
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.creator_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module39.decode(Buf)
	-- upvalues: Module39 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module39.new()
	local v40 = 0
	while v40 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1290 = ProtoModule.readTag(Buf, v40)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1290 = ProtoModule.readVarInt(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1290 = ProtoModule.readBuffer(Buf, v40)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1290 = ProtoModule.readBuffer(Buf, v40)
				local DecodeResult = t.DevStoreFeedInputData_EntryMapEntry.decode(Buffer2)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1290 = ProtoModule.readBuffer(Buf, v40)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1290 = ProtoModule.readBuffer(Buf, v40)
				NewModule.creator_key = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v40)
				v40 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1290 = ProtoModule.readFixed32(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1290 = ProtoModule.readFixed64(Buf, v40)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module39:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function Module39:jsonDecode()
	-- upvalues: Module39 (copy), t (copy)
	local NewModule = Module39.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	return NewModule
end

Module39.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = Module39
TypeRegistryModule.default:register(t.DevStoreFeedInputData)
local Module40 = {}
Module40.__index = Module40

function Module40.new(p1)
	-- upvalues: Module40 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module40))
end

function Module40:encode()
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

function Module40.decode(Buf)
	-- upvalues: Module40 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module40.new()
	local v41 = 0
	while v41 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1320 = ProtoModule.readTag(Buf, v41)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1320 = ProtoModule.readVarInt(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1320 = ProtoModule.readBuffer(Buf, v41)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1320 = ProtoModule.readBuffer(Buf, v41)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v41)
				v41 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1320 = ProtoModule.readFixed32(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1320 = ProtoModule.readFixed64(Buf, v41)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module40:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module40:jsonDecode()
	-- upvalues: Module40 (copy), t (copy)
	local NewModule = Module40.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module40.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = Module40
TypeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local Module41 = {}
Module41.__index = Module41

function Module41.new(p1)
	-- upvalues: Module41 (copy)
	return (setmetatable({
		game_passes = if p1 == nil or p1.game_passes == nil then {} else p1.game_passes
	}, Module41))
end

function Module41:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for _, gamePass in self.game_passes do
			local EncodeResult = gamePass:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module41.decode(Buf)
	-- upvalues: Module41 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module41.new()
	local v42 = 0
	while v42 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1338 = ProtoModule.readTag(Buf, v42)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1338 = ProtoModule.readVarInt(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1338 = ProtoModule.readBuffer(Buf, v42)
				table.insert(NewModule.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v42)
				v42 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1338 = ProtoModule.readFixed32(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1338 = ProtoModule.readFixed64(Buf, v42)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module41:jsonEncode()
	local t = {}
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		local GamePasses = {}
		
		for _, gamePass in self.game_passes do
			table.insert(GamePasses, gamePass:jsonEncode())
		end
		t.gamePasses = GamePasses
	end
	return t
end

function Module41:jsonDecode()
	-- upvalues: Module41 (copy), t (copy)
	local NewModule = Module41.new()
	
	if self.game_passes ~= nil then
		local Game_passes = {}
		
		for _, gamePass in self.game_passes do
			table.insert(Game_passes, t.GamePassCollectionInputData_GamePassItem.jsonDecode(gamePass))
		end
		NewModule.game_passes = Game_passes
	end
	if self.gamePasses ~= nil then
		local Game_passes = {}
		
		for _, gamePass1 in self.gamePasses do
			table.insert(Game_passes, t.GamePassCollectionInputData_GamePassItem.jsonDecode(gamePass1))
		end
		NewModule.game_passes = Game_passes
	end
	return NewModule
end

Module41.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = Module41
TypeRegistryModule.default:register(t.GamePassCollectionInputData)
local Module42 = {}
Module42.__index = Module42

function Module42.new(p1)
	-- upvalues: Module42 (copy)
	return (setmetatable({
		game_pass_id = if p1 == nil or p1.game_pass_id == nil then "" else p1.game_pass_id
	}, Module42))
end

function Module42:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.game_pass_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module42.decode(Buf)
	-- upvalues: Module42 (copy), ProtoModule (copy)
	local NewModule = Module42.new()
	local v43 = 0
	while v43 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1357 = ProtoModule.readTag(Buf, v43)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1357 = ProtoModule.readVarInt(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1357 = ProtoModule.readBuffer(Buf, v43)
				NewModule.game_pass_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v43)
				v43 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1357 = ProtoModule.readFixed32(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1357 = ProtoModule.readFixed64(Buf, v43)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module42:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function Module42:jsonDecode()
	-- upvalues: Module42 (copy)
	local NewModule = Module42.new()
	
	if self.game_pass_id ~= nil then
		NewModule.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		NewModule.game_pass_id = self.gamePassId
	end
	return NewModule
end

Module42.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = Module42
TypeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local Module43 = {}
Module43.__index = Module43

function Module43.new(p1)
	-- upvalues: Module43 (copy)
	return (setmetatable({
		developer_products = if p1 == nil or p1.developer_products == nil then {} else p1.developer_products
	}, Module43))
end

function Module43:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for _, developerProduct in self.developer_products do
			local EncodeResult = developerProduct:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module43.decode(Buf)
	-- upvalues: Module43 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module43.new()
	local v44 = 0
	while v44 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1374 = ProtoModule.readTag(Buf, v44)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1374 = ProtoModule.readVarInt(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1374 = ProtoModule.readBuffer(Buf, v44)
				table.insert(NewModule.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v44)
				v44 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1374 = ProtoModule.readFixed32(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1374 = ProtoModule.readFixed64(Buf, v44)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module43:jsonEncode()
	local t = {}
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		local DeveloperProducts = {}
		
		for _, developerProduct in self.developer_products do
			table.insert(DeveloperProducts, developerProduct:jsonEncode())
		end
		t.developerProducts = DeveloperProducts
	end
	return t
end

function Module43:jsonDecode()
	-- upvalues: Module43 (copy), t (copy)
	local NewModule = Module43.new()
	
	if self.developer_products ~= nil then
		local Developer_products = {}
		
		for _, developerProduct in self.developer_products do
			table.insert(Developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(developerProduct))
		end
		NewModule.developer_products = Developer_products
	end
	if self.developerProducts ~= nil then
		local Developer_products = {}
		
		for _, developerProduct1 in self.developerProducts do
			table.insert(Developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(developerProduct1))
		end
		NewModule.developer_products = Developer_products
	end
	return NewModule
end

Module43.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = Module43
TypeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local Module44 = {}
Module44.__index = Module44

function Module44.new(p1)
	-- upvalues: Module44 (copy)
	return (setmetatable({
		developer_product_id = if p1 == nil or p1.developer_product_id == nil then "" else p1.developer_product_id
	}, Module44))
end

function Module44:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.developer_product_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module44.decode(Buf)
	-- upvalues: Module44 (copy), ProtoModule (copy)
	local NewModule = Module44.new()
	local v45 = 0
	while v45 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1393 = ProtoModule.readTag(Buf, v45)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1393 = ProtoModule.readVarInt(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1393 = ProtoModule.readBuffer(Buf, v45)
				NewModule.developer_product_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v45)
				v45 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1393 = ProtoModule.readFixed32(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1393 = ProtoModule.readFixed64(Buf, v45)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module44:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function Module44:jsonDecode()
	-- upvalues: Module44 (copy)
	local NewModule = Module44.new()
	
	if self.developer_product_id ~= nil then
		NewModule.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		NewModule.developer_product_id = self.developerProductId
	end
	return NewModule
end

Module44.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = Module44
TypeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local Module45 = {}
Module45.__index = Module45

function Module45.new(p1)
	-- upvalues: Module45 (copy)
	return (setmetatable({
		subscriptions = if p1 == nil or p1.subscriptions == nil then {} else p1.subscriptions
	}, Module45))
end

function Module45:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for _, subscription in self.subscriptions do
			local EncodeResult = subscription:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module45.decode(Buf)
	-- upvalues: Module45 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module45.new()
	local v46 = 0
	while v46 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1410 = ProtoModule.readTag(Buf, v46)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1410 = ProtoModule.readVarInt(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1410 = ProtoModule.readBuffer(Buf, v46)
				table.insert(NewModule.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v46)
				v46 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1410 = ProtoModule.readFixed32(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1410 = ProtoModule.readFixed64(Buf, v46)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module45:jsonEncode()
	local t = {}
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		local Subscriptions = {}
		
		for _, subscription in self.subscriptions do
			table.insert(Subscriptions, subscription:jsonEncode())
		end
		t.subscriptions = Subscriptions
	end
	return t
end

function Module45:jsonDecode()
	-- upvalues: Module45 (copy), t (copy)
	local NewModule = Module45.new()
	
	if self.subscriptions ~= nil then
		local Subscriptions = {}
		
		for _, subscription in self.subscriptions do
			table.insert(Subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(subscription))
		end
		NewModule.subscriptions = Subscriptions
	end
	return NewModule
end

Module45.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = Module45
TypeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local Module46 = {}
Module46.__index = Module46

function Module46.new(p1)
	-- upvalues: Module46 (copy)
	return (setmetatable({
		subscription_id = if p1 == nil or p1.subscription_id == nil then "" else p1.subscription_id
	}, Module46))
end

function Module46:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.subscription_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module46.decode(Buf)
	-- upvalues: Module46 (copy), ProtoModule (copy)
	local NewModule = Module46.new()
	local v47 = 0
	while v47 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1428 = ProtoModule.readTag(Buf, v47)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1428 = ProtoModule.readVarInt(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1428 = ProtoModule.readBuffer(Buf, v47)
				NewModule.subscription_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v47)
				v47 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1428 = ProtoModule.readFixed32(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1428 = ProtoModule.readFixed64(Buf, v47)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module46:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function Module46:jsonDecode()
	-- upvalues: Module46 (copy)
	local NewModule = Module46.new()
	
	if self.subscription_id ~= nil then
		NewModule.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		NewModule.subscription_id = self.subscriptionId
	end
	return NewModule
end

Module46.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = Module46
TypeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local Module47 = {}
Module47.__index = Module47

function Module47.new(p1)
	-- upvalues: Module47 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		identifier = if p1 == nil or p1.identifier == nil then "" else p1.identifier,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module47))
end

function Module47:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.roblox_component)
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.identifier)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.title)
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.user_id)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.description)
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.cta_text)
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.prompt_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module47.decode(Buf)
	-- upvalues: Module47 (copy), ProtoModule (copy)
	local NewModule = Module47.new()
	local v48 = 0
	while v48 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1458 = ProtoModule.readTag(Buf, v48)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1458 = ProtoModule.readVarInt(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.identifier = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.user_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.description = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.cta_text = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.prompt_id = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1458 = ProtoModule.readBuffer(Buf, v48)
				NewModule.prompt_type = buffer.tostring(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v48)
				v48 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1458 = ProtoModule.readFixed32(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1458 = ProtoModule.readFixed64(Buf, v48)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module47:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module47:jsonDecode()
	-- upvalues: Module47 (copy)
	local NewModule = Module47.new()
	
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		NewModule.identifier = self.identifier
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.cta_text ~= nil then
		NewModule.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		NewModule.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	return NewModule
end

Module47.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = Module47
TypeRegistryModule.default:register(t.CardContainerCardInputData)
local Module48 = {}
Module48.__index = Module48

function Module48.new(p1)
	-- upvalues: Module48 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		dismiss_text = if p1 == nil or p1.dismiss_text == nil then "" else p1.dismiss_text,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		cards = if p1 == nil or p1.cards == nil then {} else p1.cards,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module48))
end

function Module48:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.dismiss_text)
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.user_id)
	end
	if self.cards ~= nil and #self.cards > 0 then
		for _, card in self.cards do
			local EncodeResult = card:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.prompt_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module48.decode(Buf)
	-- upvalues: Module48 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module48.new()
	local v49 = 0
	while v49 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1492 = ProtoModule.readTag(Buf, v49)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1492 = ProtoModule.readVarInt(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1492 = ProtoModule.readBuffer(Buf, v49)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1492 = ProtoModule.readBuffer(Buf, v49)
				NewModule.dismiss_text = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1492 = ProtoModule.readBuffer(Buf, v49)
				NewModule.user_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1492 = ProtoModule.readBuffer(Buf, v49)
				table.insert(NewModule.cards, t.CardContainerCardInputData.decode(Buffer4))
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1492 = ProtoModule.readBuffer(Buf, v49)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1492 = ProtoModule.readBuffer(Buf, v49)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v49)
				v49 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1492 = ProtoModule.readFixed32(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1492 = ProtoModule.readFixed64(Buf, v49)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module48:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		t.dismissText = self.dismiss_text
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.cards ~= nil and #self.cards > 0 then
		local Cards = {}
		
		for _, card in self.cards do
			table.insert(Cards, card:jsonEncode())
		end
		t.cards = Cards
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module48:jsonDecode()
	-- upvalues: Module48 (copy), t (copy)
	local NewModule = Module48.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.dismiss_text ~= nil then
		NewModule.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		NewModule.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.cards ~= nil then
		local Cards = {}
		
		for _, card in self.cards do
			table.insert(Cards, t.CardContainerCardInputData.jsonDecode(card))
		end
		NewModule.cards = Cards
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	return NewModule
end

Module48.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = Module48
TypeRegistryModule.default:register(t.CardContainerInputData)
local Module49 = {}
Module49.__index = Module49

function Module49.new(p1)
	-- upvalues: Module49 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module49))
end

function Module49:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.user_id)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.cta_text)
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.prompt_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module49.decode(Buf)
	-- upvalues: Module49 (copy), ProtoModule (copy)
	local NewModule = Module49.new()
	local v50 = 0
	while v50 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1525 = ProtoModule.readTag(Buf, v50)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1525 = ProtoModule.readVarInt(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.user_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.cta_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1525 = ProtoModule.readBuffer(Buf, v50)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v50)
				v50 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1525 = ProtoModule.readFixed32(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1525 = ProtoModule.readFixed64(Buf, v50)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module49:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module49:jsonDecode()
	-- upvalues: Module49 (copy)
	local NewModule = Module49.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.cta_text ~= nil then
		NewModule.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		NewModule.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	return NewModule
end

Module49.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = Module49
TypeRegistryModule.default:register(t.CardInputData)
local Module50 = {}
Module50.__index = Module50

function Module50.new(p1)
	-- upvalues: Module50 (copy)
	return (setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		audit_data = if p1 == nil or p1.audit_data == nil then "" else p1.audit_data
	}, Module50))
end

function Module50:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.prompt_type)
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.user_id)
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.audit_data)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module50.decode(Buf)
	-- upvalues: Module50 (copy), ProtoModule (copy)
	local NewModule = Module50.new()
	local v51 = 0
	while v51 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1552 = ProtoModule.readTag(Buf, v51)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1552 = ProtoModule.readVarInt(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1552 = ProtoModule.readBuffer(Buf, v51)
				NewModule.prompt_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1552 = ProtoModule.readBuffer(Buf, v51)
				NewModule.prompt_type = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1552 = ProtoModule.readBuffer(Buf, v51)
				NewModule.user_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1552 = ProtoModule.readBuffer(Buf, v51)
				NewModule.audit_data = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v51)
				v51 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1552 = ProtoModule.readFixed32(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1552 = ProtoModule.readFixed64(Buf, v51)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module50:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		t.auditData = self.audit_data
	end
	return t
end

function Module50:jsonDecode()
	-- upvalues: Module50 (copy)
	local NewModule = Module50.new()
	
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.audit_data ~= nil then
		NewModule.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		NewModule.audit_data = self.auditData
	end
	return NewModule
end

Module50.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = Module50
TypeRegistryModule.default:register(t.DialogInputData)
local Module51 = {}
Module51.__index = Module51

function Module51.new(p1)
	-- upvalues: Module51 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		primary_text = if p1 == nil or p1.primary_text == nil then "" else p1.primary_text,
		secondary_text = if p1 == nil or p1.secondary_text == nil then "" else p1.secondary_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		times_seen = if p1 == nil or p1.times_seen == nil then 0 else p1.times_seen
	}, Module51))
end

function Module51:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.description)
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.primary_text)
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.secondary_text)
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.prompt_type)
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.times_seen)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module51.decode(Buf)
	-- upvalues: Module51 (copy), ProtoModule (copy)
	local NewModule = Module51.new()
	local v52 = 0
	while v52 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1583 = ProtoModule.readTag(Buf, v52)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 7 then
				NewModule.times_seen, v1583 = ProtoModule.readVarIntI32(Buf, v52)
			else
				local _
				_, v1583 = ProtoModule.readVarInt(Buf, v52)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.description = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.primary_text = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.secondary_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1583 = ProtoModule.readBuffer(Buf, v52)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v52)
				v52 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1583 = ProtoModule.readFixed32(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1583 = ProtoModule.readFixed64(Buf, v52)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module51:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		t.primaryText = self.primary_text
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		t.secondaryText = self.secondary_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		t.timesSeen = self.times_seen
	end
	return t
end

function Module51:jsonDecode()
	-- upvalues: Module51 (copy)
	local NewModule = Module51.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.primary_text ~= nil then
		NewModule.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		NewModule.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		NewModule.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		NewModule.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		NewModule.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		NewModule.times_seen = self.timesSeen
	end
	return NewModule
end

Module51.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = Module51
TypeRegistryModule.default:register(t.BannerInputData)
local Module52 = {}
Module52.__index = Module52

function Module52.new(p1)
	-- upvalues: Module52 (copy)
	return (setmetatable({
		tooltip_text = if p1 == nil or p1.tooltip_text == nil then "" else p1.tooltip_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module52))
end

function Module52:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.tooltip_text)
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.prompt_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module52.decode(Buf)
	-- upvalues: Module52 (copy), ProtoModule (copy)
	local NewModule = Module52.new()
	local v53 = 0
	while v53 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1608 = ProtoModule.readTag(Buf, v53)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1608 = ProtoModule.readVarInt(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1608 = ProtoModule.readBuffer(Buf, v53)
				NewModule.tooltip_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1608 = ProtoModule.readBuffer(Buf, v53)
				NewModule.prompt_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1608 = ProtoModule.readBuffer(Buf, v53)
				NewModule.prompt_type = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v53)
				v53 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1608 = ProtoModule.readFixed32(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1608 = ProtoModule.readFixed64(Buf, v53)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module52:jsonEncode()
	local t = {}
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		t.tooltipText = self.tooltip_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module52:jsonDecode()
	-- upvalues: Module52 (copy)
	local NewModule = Module52.new()
	
	if self.tooltip_text ~= nil then
		NewModule.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		NewModule.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	return NewModule
end

Module52.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = Module52
TypeRegistryModule.default:register(t.TooltipInputData)
local Module53 = {}
Module53.__index = Module53

function Module53.new(p1)
	-- upvalues: Module53 (copy)
	return (setmetatable({
		media_id = if p1 == nil or p1.media_id == nil then "" else p1.media_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		anchor_tag = if p1 == nil or p1.anchor_tag == nil then "" else p1.anchor_tag
	}, Module53))
end

function Module53:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.media_id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.prompt_type)
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.anchor_tag)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module53.decode(Buf)
	-- upvalues: Module53 (copy), ProtoModule (copy)
	local NewModule = Module53.new()
	local v54 = 0
	while v54 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1636 = ProtoModule.readTag(Buf, v54)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1636 = ProtoModule.readVarInt(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.media_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.prompt_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.prompt_type = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1636 = ProtoModule.readBuffer(Buf, v54)
				NewModule.anchor_tag = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v54)
				v54 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1636 = ProtoModule.readFixed32(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1636 = ProtoModule.readFixed64(Buf, v54)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module53:jsonEncode()
	local t = {}
	
	if self.media_id ~= nil and self.media_id ~= "" then
		t.mediaId = self.media_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		t.anchorTag = self.anchor_tag
	end
	return t
end

function Module53:jsonDecode()
	-- upvalues: Module53 (copy)
	local NewModule = Module53.new()
	
	if self.media_id ~= nil then
		NewModule.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		NewModule.media_id = self.mediaId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		NewModule.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		NewModule.anchor_tag = self.anchorTag
	end
	return NewModule
end

Module53.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = Module53
TypeRegistryModule.default:register(t.CoachmarkInputData)
local Module54 = {}
Module54.__index = Module54

function Module54.new(p1)
	-- upvalues: Module54 (copy)
	return (setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module54))
end

function Module54:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.prompt_id)
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.prompt_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module54.decode(Buf)
	-- upvalues: Module54 (copy), ProtoModule (copy)
	local NewModule = Module54.new()
	local v55 = 0
	while v55 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1659 = ProtoModule.readTag(Buf, v55)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1659 = ProtoModule.readVarInt(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1659 = ProtoModule.readBuffer(Buf, v55)
				NewModule.prompt_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1659 = ProtoModule.readBuffer(Buf, v55)
				NewModule.prompt_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v55)
				v55 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1659 = ProtoModule.readFixed32(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1659 = ProtoModule.readFixed64(Buf, v55)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module54:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module54:jsonDecode()
	-- upvalues: Module54 (copy)
	local NewModule = Module54.new()
	
	if self.prompt_id ~= nil then
		NewModule.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = self.promptType
	end
	return NewModule
end

Module54.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = Module54
TypeRegistryModule.default:register(t.SystemBannerInputData)
local Module55 = {}
Module55.__index = Module55

function Module55.new(p1)
	-- upvalues: Module55 (copy)
	return (setmetatable({
		upsell_prompt = if p1 == nil or p1.upsell_prompt == nil then "" else p1.upsell_prompt
	}, Module55))
end

function Module55:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.upsell_prompt)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module55.decode(Buf)
	-- upvalues: Module55 (copy), ProtoModule (copy)
	local NewModule = Module55.new()
	local v56 = 0
	while v56 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1676 = ProtoModule.readTag(Buf, v56)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1676 = ProtoModule.readVarInt(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1676 = ProtoModule.readBuffer(Buf, v56)
				NewModule.upsell_prompt = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v56)
				v56 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1676 = ProtoModule.readFixed32(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1676 = ProtoModule.readFixed64(Buf, v56)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module55:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function Module55:jsonDecode()
	-- upvalues: Module55 (copy)
	local NewModule = Module55.new()
	
	if self.upsell_prompt ~= nil then
		NewModule.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		NewModule.upsell_prompt = self.upsellPrompt
	end
	return NewModule
end

Module55.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = Module55
TypeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local Module56 = {}
Module56.__index = Module56

function Module56.new(p1)
	-- upvalues: Module56 (copy)
	return (setmetatable({
		modal_variant = if p1 == nil or p1.modal_variant == nil then "" else p1.modal_variant,
		modal_sequence = if p1 == nil or p1.modal_sequence == nil then "" else p1.modal_sequence,
		conversation_id = if p1 == nil or p1.conversation_id == nil then "" else p1.conversation_id,
		friend_id = if p1 == nil or p1.friend_id == nil then "" else p1.friend_id
	}, Module56))
end

function Module56:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.modal_variant)
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.modal_sequence)
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.conversation_id)
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.friend_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module56.decode(Buf)
	-- upvalues: Module56 (copy), ProtoModule (copy)
	local NewModule = Module56.new()
	local v57 = 0
	while v57 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1698 = ProtoModule.readTag(Buf, v57)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1698 = ProtoModule.readVarInt(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1698 = ProtoModule.readBuffer(Buf, v57)
				NewModule.modal_variant = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1698 = ProtoModule.readBuffer(Buf, v57)
				NewModule.modal_sequence = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1698 = ProtoModule.readBuffer(Buf, v57)
				NewModule.conversation_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1698 = ProtoModule.readBuffer(Buf, v57)
				NewModule.friend_id = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v57)
				v57 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1698 = ProtoModule.readFixed32(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1698 = ProtoModule.readFixed64(Buf, v57)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module56:jsonEncode()
	local t = {}
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		t.modalVariant = self.modal_variant
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		t.modalSequence = self.modal_sequence
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		t.conversationId = self.conversation_id
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		t.friendId = self.friend_id
	end
	return t
end

function Module56:jsonDecode()
	-- upvalues: Module56 (copy)
	local NewModule = Module56.new()
	
	if self.modal_variant ~= nil then
		NewModule.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		NewModule.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		NewModule.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		NewModule.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		NewModule.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		NewModule.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		NewModule.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		NewModule.friend_id = self.friendId
	end
	return NewModule
end

Module56.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = Module56
TypeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local Module57 = {}
Module57.__index = Module57

function Module57.new(p1)
	-- upvalues: Module57 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, Module57))
end

function Module57:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, value1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module57.decode(Buf)
	-- upvalues: Module57 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module57.new()
	local v58 = 0
	while v58 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1732 = ProtoModule.readTag(Buf, v58)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1732 = ProtoModule.readVarInt(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1732 = ProtoModule.readBuffer(Buf, v58)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1732 = ProtoModule.readBuffer(Buf, v58)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1732 = ProtoModule.readBuffer(Buf, v58)
				local DecodeResult = t.EventDetailsFeedInputData_EntryMapEntry.decode(Buffer3)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1732 = ProtoModule.readBuffer(Buf, v58)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer4))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v58)
				v58 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1732 = ProtoModule.readFixed32(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1732 = ProtoModule.readFixed64(Buf, v58)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module57:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	return t
end

function Module57:jsonDecode()
	-- upvalues: Module57 (copy), t (copy)
	local NewModule = Module57.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	return NewModule
end

Module57.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = Module57
TypeRegistryModule.default:register(t.EventDetailsFeedInputData)
local Module58 = {}
Module58.__index = Module58

function Module58.new(p1)
	-- upvalues: Module58 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module58))
end

function Module58:encode()
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

function Module58.decode(Buf)
	-- upvalues: Module58 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module58.new()
	local v59 = 0
	while v59 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1762 = ProtoModule.readTag(Buf, v59)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1762 = ProtoModule.readVarInt(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1762 = ProtoModule.readBuffer(Buf, v59)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1762 = ProtoModule.readBuffer(Buf, v59)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v59)
				v59 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1762 = ProtoModule.readFixed32(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1762 = ProtoModule.readFixed64(Buf, v59)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module58:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module58:jsonDecode()
	-- upvalues: Module58 (copy), t (copy)
	local NewModule = Module58.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module58.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = Module58
TypeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local Module59 = {}
Module59.__index = Module59

function Module59.new(p1)
	-- upvalues: Module59 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module59))
end

function Module59:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module59.decode(Buf)
	-- upvalues: Module59 (copy), ProtoModule (copy)
	local NewModule = Module59.new()
	local v60 = 0
	while v60 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1781 = ProtoModule.readTag(Buf, v60)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1781 = ProtoModule.readVarInt(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1781 = ProtoModule.readBuffer(Buf, v60)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1781 = ProtoModule.readBuffer(Buf, v60)
				NewModule.universe_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v60)
				v60 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1781 = ProtoModule.readFixed32(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1781 = ProtoModule.readFixed64(Buf, v60)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module59:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module59:jsonDecode()
	-- upvalues: Module59 (copy)
	local NewModule = Module59.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module59.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = Module59
TypeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local Module60 = {}
Module60.__index = Module60

function Module60.new(p1)
	-- upvalues: Module60 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module60))
end

function Module60:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module60.decode(Buf)
	-- upvalues: Module60 (copy), ProtoModule (copy)
	local NewModule = Module60.new()
	local v61 = 0
	while v61 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1798 = ProtoModule.readTag(Buf, v61)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1798 = ProtoModule.readVarInt(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1798 = ProtoModule.readBuffer(Buf, v61)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v61)
				v61 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1798 = ProtoModule.readFixed32(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1798 = ProtoModule.readFixed64(Buf, v61)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module60:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module60:jsonDecode()
	-- upvalues: Module60 (copy)
	local NewModule = Module60.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module60.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = Module60
TypeRegistryModule.default:register(t.EventDescriptionInputData)
local Module61 = {}
Module61.__index = Module61

function Module61.new(p1)
	-- upvalues: Module61 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module61))
end

function Module61:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module61.decode(Buf)
	-- upvalues: Module61 (copy), ProtoModule (copy)
	local NewModule = Module61.new()
	local v62 = 0
	while v62 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1816 = ProtoModule.readTag(Buf, v62)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1816 = ProtoModule.readVarInt(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1816 = ProtoModule.readBuffer(Buf, v62)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1816 = ProtoModule.readBuffer(Buf, v62)
				NewModule.universe_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v62)
				v62 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1816 = ProtoModule.readFixed32(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1816 = ProtoModule.readFixed64(Buf, v62)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module61:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module61:jsonDecode()
	-- upvalues: Module61 (copy)
	local NewModule = Module61.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module61.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = Module61
TypeRegistryModule.default:register(t.EventAttributionRowInputData)
local Module62 = {}
Module62.__index = Module62

function Module62.new(p1)
	-- upvalues: Module62 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module62))
end

function Module62:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module62.decode(Buf)
	-- upvalues: Module62 (copy), ProtoModule (copy)
	local NewModule = Module62.new()
	local v63 = 0
	while v63 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1833 = ProtoModule.readTag(Buf, v63)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1833 = ProtoModule.readVarInt(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1833 = ProtoModule.readBuffer(Buf, v63)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v63)
				v63 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1833 = ProtoModule.readFixed32(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1833 = ProtoModule.readFixed64(Buf, v63)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module62:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module62:jsonDecode()
	-- upvalues: Module62 (copy)
	local NewModule = Module62.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module62.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = Module62
TypeRegistryModule.default:register(t.EventInfoTableInputData)
local Module63 = {}
Module63.__index = Module63

function Module63.new(p1)
	-- upvalues: Module63 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module63))
end

function Module63:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module63.decode(Buf)
	-- upvalues: Module63 (copy), ProtoModule (copy)
	local NewModule = Module63.new()
	local v64 = 0
	while v64 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1849 = ProtoModule.readTag(Buf, v64)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1849 = ProtoModule.readVarInt(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1849 = ProtoModule.readBuffer(Buf, v64)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v64)
				v64 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1849 = ProtoModule.readFixed32(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1849 = ProtoModule.readFixed64(Buf, v64)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module63:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module63:jsonDecode()
	-- upvalues: Module63 (copy)
	local NewModule = Module63.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module63.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = Module63
TypeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local Module64 = {}
Module64.__index = Module64

function Module64.new(p1)
	-- upvalues: Module64 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module64))
end

function Module64:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.event_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module64.decode(Buf)
	-- upvalues: Module64 (copy), ProtoModule (copy)
	local NewModule = Module64.new()
	local v65 = 0
	while v65 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1867 = ProtoModule.readTag(Buf, v65)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1867 = ProtoModule.readVarInt(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1867 = ProtoModule.readBuffer(Buf, v65)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1867 = ProtoModule.readBuffer(Buf, v65)
				NewModule.universe_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v65)
				v65 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1867 = ProtoModule.readFixed32(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1867 = ProtoModule.readFixed64(Buf, v65)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module64:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module64:jsonDecode()
	-- upvalues: Module64 (copy)
	local NewModule = Module64.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module64.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = Module64
TypeRegistryModule.default:register(t.EventNotificationsModalInputData)
local Module65 = {}
Module65.__index = Module65

function Module65.new(p1)
	-- upvalues: Module65 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sticky_filter_pills = if p1 == nil or p1.sticky_filter_pills == nil then nil else p1.sticky_filter_pills,
		applied_filters = if p1 == nil or p1.applied_filters == nil then "" else p1.applied_filters
	}, Module65))
end

function Module65:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, value1)
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.next_page_token)
	end
	if self.sticky_filter_pills ~= nil then
		local EncodeResult = self.sticky_filter_pills:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.applied_filters)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module65.decode(Buf)
	-- upvalues: Module65 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module65.new()
	local v66 = 0
	while v66 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1902 = ProtoModule.readTag(Buf, v66)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1902 = ProtoModule.readVarInt(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1902 = ProtoModule.readBuffer(Buf, v66)
				local DecodeResult = t.ChartsFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1902 = ProtoModule.readBuffer(Buf, v66)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1902 = ProtoModule.readBuffer(Buf, v66)
				NewModule.next_page_token = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1902 = ProtoModule.readBuffer(Buf, v66)
				NewModule.sticky_filter_pills = t.FilterPillsInputData.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1902 = ProtoModule.readBuffer(Buf, v66)
				NewModule.applied_filters = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v66)
				v66 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1902 = ProtoModule.readFixed32(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1902 = ProtoModule.readFixed64(Buf, v66)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module65:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sticky_filter_pills ~= nil then
		t.stickyFilterPills = self.sticky_filter_pills:jsonEncode()
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function Module65:jsonDecode()
	-- upvalues: Module65 (copy), t (copy)
	local NewModule = Module65.new()
	
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	if self.next_page_token ~= nil then
		NewModule.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		NewModule.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		NewModule.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		NewModule.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		NewModule.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		NewModule.applied_filters = self.appliedFilters
	end
	return NewModule
end

Module65.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = Module65
TypeRegistryModule.default:register(t.ChartsFeedInputData)
local Module66 = {}
Module66.__index = Module66

function Module66.new(p1)
	-- upvalues: Module66 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module66))
end

function Module66:encode()
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

function Module66.decode(Buf)
	-- upvalues: Module66 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module66.new()
	local v67 = 0
	while v67 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1933 = ProtoModule.readTag(Buf, v67)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1933 = ProtoModule.readVarInt(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1933 = ProtoModule.readBuffer(Buf, v67)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1933 = ProtoModule.readBuffer(Buf, v67)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v67)
				v67 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1933 = ProtoModule.readFixed32(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1933 = ProtoModule.readFixed64(Buf, v67)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module66:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module66:jsonDecode()
	-- upvalues: Module66 (copy), t (copy)
	local NewModule = Module66.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module66.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = Module66
TypeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local Module67 = {}
Module67.__index = Module67

function Module67.new(p1)
	-- upvalues: Module67 (copy)
	return (setmetatable({
		filter_groups = if p1 == nil or p1.filter_groups == nil then {} else p1.filter_groups,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters
	}, Module67))
end

function Module67:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for _, filterGroup in self.filter_groups do
			local EncodeResult = filterGroup:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.sort_id)
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.secondary_sort_id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.title)
	end
	if self.primary_sort_id ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.primary_sort_id)
	end
	if self.applied_filters ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.applied_filters)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module67.decode(Buf)
	-- upvalues: Module67 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module67.new()
	local v68 = 0
	while v68 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1961 = ProtoModule.readTag(Buf, v68)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.secondary_sort_id, v1961 = ProtoModule.readVarIntI32(Buf, v68)
			elseif Tag == 5 then
				NewModule.primary_sort_id, v1961 = ProtoModule.readVarIntI32(Buf, v68)
			else
				local _
				_, v1961 = ProtoModule.readVarInt(Buf, v68)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1961 = ProtoModule.readBuffer(Buf, v68)
				table.insert(NewModule.filter_groups, t.FilterPillsInputData_FilterGroup.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1961 = ProtoModule.readBuffer(Buf, v68)
				NewModule.sort_id = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v1961 = ProtoModule.readBuffer(Buf, v68)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v1961 = ProtoModule.readBuffer(Buf, v68)
				NewModule.applied_filters = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v68)
				v68 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1961 = ProtoModule.readFixed32(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1961 = ProtoModule.readFixed64(Buf, v68)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module67:jsonEncode()
	local t = {}
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		local FilterGroups = {}
		
		for _, filterGroup in self.filter_groups do
			table.insert(FilterGroups, filterGroup:jsonEncode())
		end
		t.filterGroups = FilterGroups
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function Module67:jsonDecode()
	-- upvalues: Module67 (copy), t (copy)
	local NewModule = Module67.new()
	
	if self.filter_groups ~= nil then
		local Filter_groups = {}
		
		for _, filterGroup in self.filter_groups do
			table.insert(Filter_groups, t.FilterPillsInputData_FilterGroup.jsonDecode(filterGroup))
		end
		NewModule.filter_groups = Filter_groups
	end
	if self.filterGroups ~= nil then
		local Filter_groups = {}
		
		for _, filterGroup1 in self.filterGroups do
			table.insert(Filter_groups, t.FilterPillsInputData_FilterGroup.jsonDecode(filterGroup1))
		end
		NewModule.filter_groups = Filter_groups
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		NewModule.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		NewModule.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.primary_sort_id ~= nil then
		NewModule.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		NewModule.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		NewModule.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		NewModule.applied_filters = self.appliedFilters
	end
	return NewModule
end

Module67.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = Module67
TypeRegistryModule.default:register(t.FilterPillsInputData)
local Module68 = {}
Module68.__index = Module68

function Module68.new(p1)
	-- upvalues: Module68 (copy)
	return (setmetatable({
		filter_id = if p1 == nil or p1.filter_id == nil then "" else p1.filter_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		default_option_id = if p1 == nil or p1.default_option_id == nil then "" else p1.default_option_id,
		selected_option_id = if p1 == nil or p1.selected_option_id == nil then "" else p1.selected_option_id,
		filter_type = if p1 == nil or p1.filter_type == nil then "" else p1.filter_type,
		inactive_option_ids = if p1 == nil or p1.inactive_option_ids == nil then {} else p1.inactive_option_ids,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, Module68))
end

function Module68:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.filter_id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.default_option_id)
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.selected_option_id)
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.filter_type)
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for _, inactiveOptionId in self.inactive_option_ids do
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, inactiveOptionId)
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.info_text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module68.decode(Buf)
	-- upvalues: Module68 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module68.new()
	local v69 = 0
	while v69 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1998 = ProtoModule.readTag(Buf, v69)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1998 = ProtoModule.readVarInt(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.filter_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1998 = ProtoModule.readBuffer(Buf, v69)
				table.insert(NewModule.options, t.FilterPillsInputData_FilterOption.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.default_option_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.selected_option_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.filter_type = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1998 = ProtoModule.readBuffer(Buf, v69)
				table.insert(NewModule.inactive_option_ids, buffer.tostring(Buffer7))
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1998 = ProtoModule.readBuffer(Buf, v69)
				NewModule.info_text = buffer.tostring(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v69)
				v69 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1998 = ProtoModule.readFixed32(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1998 = ProtoModule.readFixed64(Buf, v69)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module68:jsonEncode()
	local t = {}
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		t.filterId = self.filter_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		t.defaultOptionId = self.default_option_id
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		t.selectedOptionId = self.selected_option_id
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		t.filterType = self.filter_type
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		local InactiveOptionIds = {}
		
		for _, inactiveOptionId in self.inactive_option_ids do
			table.insert(InactiveOptionIds, inactiveOptionId)
		end
		t.inactiveOptionIds = InactiveOptionIds
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function Module68:jsonDecode()
	-- upvalues: Module68 (copy), t (copy)
	local NewModule = Module68.new()
	
	if self.filter_id ~= nil then
		NewModule.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		NewModule.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.FilterPillsInputData_FilterOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	if self.default_option_id ~= nil then
		NewModule.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		NewModule.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		NewModule.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		NewModule.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		NewModule.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		NewModule.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local Inactive_option_ids = {}
		
		for _, inactiveOptionId in self.inactive_option_ids do
			table.insert(Inactive_option_ids, inactiveOptionId)
		end
		NewModule.inactive_option_ids = Inactive_option_ids
	end
	if self.inactiveOptionIds ~= nil then
		local Inactive_option_ids = {}
		
		for _, inactiveOptionId1 in self.inactiveOptionIds do
			table.insert(Inactive_option_ids, inactiveOptionId1)
		end
		NewModule.inactive_option_ids = Inactive_option_ids
	end
	if self.info_text ~= nil then
		NewModule.info_text = self.info_text
	end
	if self.infoText ~= nil then
		NewModule.info_text = self.infoText
	end
	return NewModule
end

Module68.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = Module68
TypeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local Module69 = {}
Module69.__index = Module69

function Module69.new(p1)
	-- upvalues: Module69 (copy)
	return (setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		option_context_tag = if p1 == nil or p1.option_context_tag == nil then "" else p1.option_context_tag
	}, Module69))
end

function Module69:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.option_id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.option_context_tag)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module69.decode(Buf)
	-- upvalues: Module69 (copy), ProtoModule (copy)
	local NewModule = Module69.new()
	local v70 = 0
	while v70 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2030 = ProtoModule.readTag(Buf, v70)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2030 = ProtoModule.readVarInt(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2030 = ProtoModule.readBuffer(Buf, v70)
				NewModule.option_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2030 = ProtoModule.readBuffer(Buf, v70)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2030 = ProtoModule.readBuffer(Buf, v70)
				NewModule.option_context_tag = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v70)
				v70 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2030 = ProtoModule.readFixed32(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2030 = ProtoModule.readFixed64(Buf, v70)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module69:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		t.optionContextTag = self.option_context_tag
	end
	return t
end

function Module69:jsonDecode()
	-- upvalues: Module69 (copy)
	local NewModule = Module69.new()
	
	if self.option_id ~= nil then
		NewModule.option_id = self.option_id
	end
	if self.optionId ~= nil then
		NewModule.option_id = self.optionId
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		NewModule.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		NewModule.option_context_tag = self.optionContextTag
	end
	return NewModule
end

Module69.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = Module69
TypeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local Module70 = {}
Module70.__index = Module70

function Module70.new(p1)
	-- upvalues: Module70 (copy)
	return (setmetatable({
		sort_options = if p1 == nil or p1.sort_options == nil then {} else p1.sort_options,
		selected_sort_id = if p1 == nil or p1.selected_sort_id == nil then "" else p1.selected_sort_id
	}, Module70))
end

function Module70:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for _, sortOption in self.sort_options do
			local EncodeResult = sortOption:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.selected_sort_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module70.decode(Buf)
	-- upvalues: Module70 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module70.new()
	local v71 = 0
	while v71 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2051 = ProtoModule.readTag(Buf, v71)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2051 = ProtoModule.readVarInt(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2051 = ProtoModule.readBuffer(Buf, v71)
				table.insert(NewModule.sort_options, t.SortSelectorInputData_SortOption.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2051 = ProtoModule.readBuffer(Buf, v71)
				NewModule.selected_sort_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v71)
				v71 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2051 = ProtoModule.readFixed32(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2051 = ProtoModule.readFixed64(Buf, v71)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module70:jsonEncode()
	local t = {}
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		local SortOptions = {}
		
		for _, sortOption in self.sort_options do
			table.insert(SortOptions, sortOption:jsonEncode())
		end
		t.sortOptions = SortOptions
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		t.selectedSortId = self.selected_sort_id
	end
	return t
end

function Module70:jsonDecode()
	-- upvalues: Module70 (copy), t (copy)
	local NewModule = Module70.new()
	
	if self.sort_options ~= nil then
		local Sort_options = {}
		
		for _, sortOption in self.sort_options do
			table.insert(Sort_options, t.SortSelectorInputData_SortOption.jsonDecode(sortOption))
		end
		NewModule.sort_options = Sort_options
	end
	if self.sortOptions ~= nil then
		local Sort_options = {}
		
		for _, sortOption1 in self.sortOptions do
			table.insert(Sort_options, t.SortSelectorInputData_SortOption.jsonDecode(sortOption1))
		end
		NewModule.sort_options = Sort_options
	end
	if self.selected_sort_id ~= nil then
		NewModule.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		NewModule.selected_sort_id = self.selectedSortId
	end
	return NewModule
end

Module70.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = Module70
TypeRegistryModule.default:register(t.SortSelectorInputData)
local Module71 = {}
Module71.__index = Module71

function Module71.new(p1)
	-- upvalues: Module71 (copy)
	return (setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type
	}, Module71))
end

function Module71:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.sort_id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.content_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module71.decode(Buf)
	-- upvalues: Module71 (copy), ProtoModule (copy)
	local NewModule = Module71.new()
	local v72 = 0
	while v72 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2075 = ProtoModule.readTag(Buf, v72)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2075 = ProtoModule.readVarInt(Buf, v72)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2075 = ProtoModule.readBuffer(Buf, v72)
				NewModule.sort_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2075 = ProtoModule.readBuffer(Buf, v72)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2075 = ProtoModule.readBuffer(Buf, v72)
				NewModule.content_type = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v72)
				v72 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2075 = ProtoModule.readFixed32(Buf, v72)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2075 = ProtoModule.readFixed64(Buf, v72)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module71:jsonEncode()
	local t = {}
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function Module71:jsonDecode()
	-- upvalues: Module71 (copy)
	local NewModule = Module71.new()
	
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.content_type ~= nil then
		NewModule.content_type = self.content_type
	end
	if self.contentType ~= nil then
		NewModule.content_type = self.contentType
	end
	return NewModule
end

Module71.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = Module71
TypeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local Module72 = {}
Module72.__index = Module72

function Module72.new(p1)
	-- upvalues: Module72 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		preview_rows = if p1 == nil or p1.preview_rows == nil then 0 else p1.preview_rows,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = p1 ~= nil and p1.see_all_button ~= nil and p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, Module72))
end

function Module72:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.preview_rows)
	end
	if self.widget_style ~= nil then
		local EncodeResult = self.widget_style:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.see_all_button then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.see_all_button then 1 else 0)
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.information_popover_text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module72.decode(Buf)
	-- upvalues: Module72 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module72.new()
	local v73 = 0
	while v73 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2102 = ProtoModule.readTag(Buf, v73)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				NewModule.preview_rows, v2102 = ProtoModule.readVarIntI64(Buf, v73)
			elseif Tag == 5 then
				local VarInt
				VarInt, v2102 = ProtoModule.readVarInt(Buf, v73)
				NewModule.see_all_button = VarInt ~= 0
			else
				local _
				_, v2102 = ProtoModule.readVarInt(Buf, v73)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2102 = ProtoModule.readBuffer(Buf, v73)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2102 = ProtoModule.readBuffer(Buf, v73)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer2)
			elseif Tag == 6 then
				local Buffer3
				Buffer3, v2102 = ProtoModule.readBuffer(Buf, v73)
				NewModule.information_popover_text = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v73)
				v73 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2102 = ProtoModule.readFixed32(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2102 = ProtoModule.readFixed64(Buf, v73)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module72:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		t.previewRows = self.preview_rows
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function Module72:jsonDecode()
	-- upvalues: Module72 (copy), t (copy)
	local NewModule = Module72.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.preview_rows ~= nil then
		NewModule.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		NewModule.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		NewModule.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		NewModule.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		NewModule.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		NewModule.information_popover_text = self.informationPopoverText
	end
	return NewModule
end

Module72.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = Module72
TypeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local Module73 = {}
Module73.__index = Module73

function Module73.new(p1)
	-- upvalues: Module73 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		num_items_to_show = if p1 == nil or p1.num_items_to_show == nil then 0 else p1.num_items_to_show,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = p1 ~= nil and p1.see_all_button ~= nil and p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, Module73))
end

function Module73:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.num_items_to_show)
	end
	if self.widget_style ~= nil then
		local EncodeResult = self.widget_style:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.see_all_button then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.see_all_button then 1 else 0)
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.information_popover_text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module73.decode(Buf)
	-- upvalues: Module73 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module73.new()
	local v74 = 0
	while v74 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2130 = ProtoModule.readTag(Buf, v74)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.num_items_to_show, v2130 = ProtoModule.readVarIntI64(Buf, v74)
			elseif Tag == 6 then
				local VarInt
				VarInt, v2130 = ProtoModule.readVarInt(Buf, v74)
				NewModule.see_all_button = VarInt ~= 0
			else
				local _
				_, v2130 = ProtoModule.readVarInt(Buf, v74)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2130 = ProtoModule.readBuffer(Buf, v74)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2130 = ProtoModule.readBuffer(Buf, v74)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer2)
			elseif Tag == 7 then
				local Buffer3
				Buffer3, v2130 = ProtoModule.readBuffer(Buf, v74)
				NewModule.information_popover_text = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v74)
				v74 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2130 = ProtoModule.readFixed32(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2130 = ProtoModule.readFixed64(Buf, v74)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module73:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		t.numItemsToShow = self.num_items_to_show
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function Module73:jsonDecode()
	-- upvalues: Module73 (copy), t (copy)
	local NewModule = Module73.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.num_items_to_show ~= nil then
		NewModule.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		NewModule.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		NewModule.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		NewModule.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		NewModule.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		NewModule.information_popover_text = self.informationPopoverText
	end
	return NewModule
end

Module73.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = Module73
TypeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local Module74 = {}
Module74.__index = Module74

function Module74.new(p1)
	-- upvalues: Module74 (copy)
	return (setmetatable({
		background_layers = if p1 == nil or p1.background_layers == nil then {} else p1.background_layers
	}, Module74))
end

function Module74:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for _, backgroundLayer in self.background_layers do
			local EncodeResult = backgroundLayer:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module74.decode(Buf)
	-- upvalues: Module74 (copy), ProtoModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module74.new()
	local v75 = 0
	while v75 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2150 = ProtoModule.readTag(Buf, v75)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2150 = ProtoModule.readVarInt(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2150 = ProtoModule.readBuffer(Buf, v75)
				table.insert(NewModule.background_layers, BackgroundLayerModule.BackgroundLayer.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v75)
				v75 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2150 = ProtoModule.readFixed32(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2150 = ProtoModule.readFixed64(Buf, v75)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module74:jsonEncode()
	local t = {}
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		local BackgroundLayers = {}
		
		for _, backgroundLayer in self.background_layers do
			table.insert(BackgroundLayers, backgroundLayer:jsonEncode())
		end
		t.backgroundLayers = BackgroundLayers
	end
	return t
end

function Module74:jsonDecode()
	-- upvalues: Module74 (copy), BackgroundLayerModule (copy)
	local NewModule = Module74.new()
	
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

Module74.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = Module74
TypeRegistryModule.default:register(t.WidgetStyleData)
local Module75 = {}
Module75.__index = Module75

function Module75.new(p1)
	-- upvalues: Module75 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		available_until = if p1 == nil or p1.available_until == nil then "" else p1.available_until,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style
	}, Module75))
end

function Module75:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.available_until)
	end
	if self.widget_style ~= nil then
		local EncodeResult = self.widget_style:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module75.decode(Buf)
	-- upvalues: Module75 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module75.new()
	local v76 = 0
	while v76 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2174 = ProtoModule.readTag(Buf, v76)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2174 = ProtoModule.readVarInt(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2174 = ProtoModule.readBuffer(Buf, v76)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2174 = ProtoModule.readBuffer(Buf, v76)
				NewModule.available_until = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2174 = ProtoModule.readBuffer(Buf, v76)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v76)
				v76 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2174 = ProtoModule.readFixed32(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2174 = ProtoModule.readFixed64(Buf, v76)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module75:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		t.availableUntil = self.available_until
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	return t
end

function Module75:jsonDecode()
	-- upvalues: Module75 (copy), t (copy)
	local NewModule = Module75.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.available_until ~= nil then
		NewModule.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		NewModule.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		NewModule.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return NewModule
end

Module75.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = Module75
TypeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local Module76 = {}
Module76.__index = Module76

function Module76.new(p1)
	-- upvalues: Module76 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, Module76))
end

function Module76:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, value1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module76.decode(Buf)
	-- upvalues: Module76 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module76.new()
	local v77 = 0
	while v77 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2203 = ProtoModule.readTag(Buf, v77)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2203 = ProtoModule.readVarInt(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2203 = ProtoModule.readBuffer(Buf, v77)
				local DecodeResult = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2203 = ProtoModule.readBuffer(Buf, v77)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v77)
				v77 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2203 = ProtoModule.readFixed32(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2203 = ProtoModule.readFixed64(Buf, v77)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module76:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	return t
end

function Module76:jsonDecode()
	-- upvalues: Module76 (copy), t (copy)
	local NewModule = Module76.new()
	
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	return NewModule
end

Module76.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = Module76
TypeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local Module77 = {}
Module77.__index = Module77

function Module77.new(p1)
	-- upvalues: Module77 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module77))
end

function Module77:encode()
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

function Module77.decode(Buf)
	-- upvalues: Module77 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module77.new()
	local v78 = 0
	while v78 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2231 = ProtoModule.readTag(Buf, v78)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2231 = ProtoModule.readVarInt(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2231 = ProtoModule.readBuffer(Buf, v78)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2231 = ProtoModule.readBuffer(Buf, v78)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v78)
				v78 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2231 = ProtoModule.readFixed32(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2231 = ProtoModule.readFixed64(Buf, v78)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module77:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module77:jsonDecode()
	-- upvalues: Module77 (copy), t (copy)
	local NewModule = Module77.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module77.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = Module77
TypeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local Module78 = {}
Module78.__index = Module78

function Module78.new(p1)
	-- upvalues: Module78 (copy)
	return (setmetatable({
		marketplace_catalog_category_items = if p1 == nil or p1.marketplace_catalog_category_items == nil then {} else p1.marketplace_catalog_category_items,
		active_category_id = if p1 == nil or p1.active_category_id == nil then "" else p1.active_category_id,
		active_tooltip_idx = if p1 == nil or p1.active_tooltip_idx == nil then 0 else p1.active_tooltip_idx
	}, Module78))
end

function Module78:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for _, marketplaceCatalogCategoryItem in self.marketplace_catalog_category_items do
			local EncodeResult = marketplaceCatalogCategoryItem:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.active_category_id)
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.active_tooltip_idx)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module78.decode(Buf)
	-- upvalues: Module78 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module78.new()
	local v79 = 0
	while v79 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2253 = ProtoModule.readTag(Buf, v79)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.active_tooltip_idx, v2253 = ProtoModule.readVarIntI64(Buf, v79)
			else
				local _
				_, v2253 = ProtoModule.readVarInt(Buf, v79)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2253 = ProtoModule.readBuffer(Buf, v79)
				table.insert(NewModule.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2253 = ProtoModule.readBuffer(Buf, v79)
				NewModule.active_category_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v79)
				v79 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2253 = ProtoModule.readFixed32(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2253 = ProtoModule.readFixed64(Buf, v79)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module78:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		local MarketplaceCatalogCategoryItems = {}
		
		for _, marketplaceCatalogCategoryItem in self.marketplace_catalog_category_items do
			table.insert(MarketplaceCatalogCategoryItems, marketplaceCatalogCategoryItem:jsonEncode())
		end
		t.marketplaceCatalogCategoryItems = MarketplaceCatalogCategoryItems
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		t.activeCategoryId = self.active_category_id
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		t.activeTooltipIdx = self.active_tooltip_idx
	end
	return t
end

function Module78:jsonDecode()
	-- upvalues: Module78 (copy), t (copy)
	local NewModule = Module78.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local Marketplace_catalog_category_items = {}
		
		for _, marketplaceCatalogCategoryItem in self.marketplace_catalog_category_items do
			table.insert(Marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(marketplaceCatalogCategoryItem))
		end
		NewModule.marketplace_catalog_category_items = Marketplace_catalog_category_items
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local Marketplace_catalog_category_items = {}
		
		for _, marketplaceCatalogCategoryItem1 in self.marketplaceCatalogCategoryItems do
			table.insert(Marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(marketplaceCatalogCategoryItem1))
		end
		NewModule.marketplace_catalog_category_items = Marketplace_catalog_category_items
	end
	if self.active_category_id ~= nil then
		NewModule.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		NewModule.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		NewModule.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		NewModule.active_tooltip_idx = self.activeTooltipIdx
	end
	return NewModule
end

Module78.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = Module78
TypeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local Module79 = {}
Module79.__index = Module79

function Module79.new(p1)
	-- upvalues: Module79 (copy)
	return (setmetatable({
		marketplace_catalog_category_item_id = if p1 == nil or p1.marketplace_catalog_category_item_id == nil then "" else p1.marketplace_catalog_category_item_id
	}, Module79))
end

function Module79:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.marketplace_catalog_category_item_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module79.decode(Buf)
	-- upvalues: Module79 (copy), ProtoModule (copy)
	local NewModule = Module79.new()
	local v80 = 0
	while v80 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2273 = ProtoModule.readTag(Buf, v80)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2273 = ProtoModule.readVarInt(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2273 = ProtoModule.readBuffer(Buf, v80)
				NewModule.marketplace_catalog_category_item_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v80)
				v80 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2273 = ProtoModule.readFixed32(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2273 = ProtoModule.readFixed64(Buf, v80)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module79:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function Module79:jsonDecode()
	-- upvalues: Module79 (copy)
	local NewModule = Module79.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		NewModule.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		NewModule.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return NewModule
end

Module79.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = Module79
TypeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local Module80 = {}
Module80.__index = Module80

function Module80.new(p1)
	-- upvalues: Module80 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		preview_columns = if p1 == nil or p1.preview_columns == nil then 0 else p1.preview_columns,
		impression_id = if p1 == nil or p1.impression_id == nil then "" else p1.impression_id
	}, Module80))
end

function Module80:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.preview_columns)
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.impression_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module80.decode(Buf)
	-- upvalues: Module80 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module80.new()
	local v81 = 0
	while v81 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2294 = ProtoModule.readTag(Buf, v81)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.preview_columns, v2294 = ProtoModule.readVarIntI32(Buf, v81)
			else
				local _
				_, v2294 = ProtoModule.readVarInt(Buf, v81)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2294 = ProtoModule.readBuffer(Buf, v81)
				table.insert(NewModule.items, t.CatalogItemGridInputData_CatalogItem.decode(Buffer1))
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2294 = ProtoModule.readBuffer(Buf, v81)
				NewModule.impression_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v81)
				v81 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2294 = ProtoModule.readFixed32(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2294 = ProtoModule.readFixed64(Buf, v81)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module80:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		t.previewColumns = self.preview_columns
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		t.impressionId = self.impression_id
	end
	return t
end

function Module80:jsonDecode()
	-- upvalues: Module80 (copy), t (copy)
	local NewModule = Module80.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.CatalogItemGridInputData_CatalogItem.jsonDecode(item))
		end
		NewModule.items = Items
	end
	if self.preview_columns ~= nil then
		NewModule.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		NewModule.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		NewModule.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		NewModule.impression_id = self.impressionId
	end
	return NewModule
end

Module80.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = Module80
TypeRegistryModule.default:register(t.CatalogItemGridInputData)
local Module81 = {}
Module81.__index = Module81

function Module81.new(p1)
	-- upvalues: Module81 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type
	}, Module81))
end

function Module81:encode()
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
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module81.decode(Buf)
	-- upvalues: Module81 (copy), ProtoModule (copy)
	local NewModule = Module81.new()
	local v82 = 0
	while v82 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2315 = ProtoModule.readTag(Buf, v82)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2315 = ProtoModule.readVarInt(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2315 = ProtoModule.readBuffer(Buf, v82)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2315 = ProtoModule.readBuffer(Buf, v82)
				NewModule.type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v82)
				v82 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2315 = ProtoModule.readFixed32(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2315 = ProtoModule.readFixed64(Buf, v82)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module81:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function Module81:jsonDecode()
	-- upvalues: Module81 (copy)
	local NewModule = Module81.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	return NewModule
end

Module81.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = Module81
TypeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local Module82 = {}
Module82.__index = Module82

function Module82.new(p1)
	-- upvalues: Module82 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools
	}, Module82))
end

function Module82:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, value1)
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i1, contentPool in self.content_pools do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, i1)
			local EncodeResult = contentPool:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module82.decode(Buf)
	-- upvalues: Module82 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module82.new()
	local v83 = 0
	while v83 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2354 = ProtoModule.readTag(Buf, v83)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2354 = ProtoModule.readVarInt(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2354 = ProtoModule.readBuffer(Buf, v83)
				local DecodeResult = t.SearchResultsFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2354 = ProtoModule.readBuffer(Buf, v83)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2354 = ProtoModule.readBuffer(Buf, v83)
				local DecodeResult = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(Buffer3)
				local NewResult = t.ContentPool.new()
				NewModule.content_pools[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v83)
				v83 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2354 = ProtoModule.readFixed32(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2354 = ProtoModule.readFixed64(Buf, v83)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module82:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local ContentPools = {}
		
		for i1, contentPool in self.content_pools do
			ContentPools[i1] = contentPool:jsonEncode()
		end
		t.contentPools = ContentPools
	end
	return t
end

function Module82:jsonDecode()
	-- upvalues: Module82 (copy), t (copy)
	local NewModule = Module82.new()
	
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	if self.content_pools ~= nil then
		local Content_pools = {}
		
		for i2, contentPool in self.content_pools do
			Content_pools[i2] = t.ContentPool.jsonDecode(contentPool)
		end
		NewModule.content_pools = Content_pools
	end
	if self.contentPools ~= nil then
		local Content_pools = {}
		
		for i3, contentPool1 in self.contentPools do
			Content_pools[i3] = t.ContentPool.jsonDecode(contentPool1)
		end
		NewModule.content_pools = Content_pools
	end
	return NewModule
end

Module82.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = Module82
TypeRegistryModule.default:register(t.SearchResultsFeedInputData)
local Module83 = {}
Module83.__index = Module83

function Module83.new(p1)
	-- upvalues: Module83 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module83))
end

function Module83:encode()
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

function Module83.decode(Buf)
	-- upvalues: Module83 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module83.new()
	local v84 = 0
	while v84 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2388 = ProtoModule.readTag(Buf, v84)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2388 = ProtoModule.readVarInt(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2388 = ProtoModule.readBuffer(Buf, v84)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2388 = ProtoModule.readBuffer(Buf, v84)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v84)
				v84 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2388 = ProtoModule.readFixed32(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2388 = ProtoModule.readFixed64(Buf, v84)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module83:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module83:jsonDecode()
	-- upvalues: Module83 (copy), t (copy)
	local NewModule = Module83.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module83.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = Module83
TypeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local Module84 = {}
Module84.__index = Module84

function Module84.new(p1)
	-- upvalues: Module84 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module84))
end

function Module84:encode()
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

function Module84.decode(Buf)
	-- upvalues: Module84 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module84.new()
	local v85 = 0
	while v85 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2408 = ProtoModule.readTag(Buf, v85)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2408 = ProtoModule.readVarInt(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2408 = ProtoModule.readBuffer(Buf, v85)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2408 = ProtoModule.readBuffer(Buf, v85)
				NewModule.value = t.ContentPool.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v85)
				v85 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2408 = ProtoModule.readFixed32(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2408 = ProtoModule.readFixed64(Buf, v85)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module84:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module84:jsonDecode()
	-- upvalues: Module84 (copy), t (copy)
	local NewModule = Module84.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.ContentPool.jsonDecode(self.value)
	end
	return NewModule
end

Module84.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = Module84
TypeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local Module85 = {}
Module85.__index = Module85

function Module85.new(p1)
	-- upvalues: Module85 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		is_content_locked = p1 ~= nil and p1.is_content_locked ~= nil and p1.is_content_locked
	}, Module85))
end

function Module85:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.is_content_locked then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_content_locked then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module85.decode(Buf)
	-- upvalues: Module85 (copy), ProtoModule (copy)
	local NewModule = Module85.new()
	local v86 = 0
	while v86 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2427 = ProtoModule.readTag(Buf, v86)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v2427 = ProtoModule.readVarInt(Buf, v86)
				NewModule.is_content_locked = VarInt ~= 0
			else
				local _
				_, v2427 = ProtoModule.readVarInt(Buf, v86)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2427 = ProtoModule.readBuffer(Buf, v86)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v86)
				v86 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2427 = ProtoModule.readFixed32(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2427 = ProtoModule.readFixed64(Buf, v86)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module85:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function Module85:jsonDecode()
	-- upvalues: Module85 (copy)
	local NewModule = Module85.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		NewModule.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		NewModule.is_content_locked = self.isContentLocked
	end
	return NewModule
end

Module85.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = Module85
TypeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local Module86 = {}
Module86.__index = Module86

function Module86.new(p1)
	-- upvalues: Module86 (copy)
	return (setmetatable({
		overview_rich_text = if p1 == nil or p1.overview_rich_text == nil then "" else p1.overview_rich_text,
		result_entry = if p1 == nil or p1.result_entry == nil then nil else p1.result_entry,
		follow_up_queries = if p1 == nil or p1.follow_up_queries == nil then {} else p1.follow_up_queries,
		show_loading = p1 ~= nil and p1.show_loading ~= nil and p1.show_loading,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query,
		search_session_id = if p1 == nil or p1.search_session_id == nil then "" else p1.search_session_id,
		universe_ids = if p1 == nil or p1.universe_ids == nil then "" else p1.universe_ids
	}, Module86))
end

function Module86:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.overview_rich_text)
	end
	if self.result_entry ~= nil then
		local EncodeResult = self.result_entry:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for _, followUpQuery in self.follow_up_queries do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, followUpQuery)
		end
	end
	if self.show_loading then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.show_loading then 1 else 0)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.title)
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.search_query)
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.search_session_id)
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.universe_ids)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module86.decode(Buf)
	-- upvalues: Module86 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module86.new()
	local v87 = 0
	while v87 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2459 = ProtoModule.readTag(Buf, v87)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v2459 = ProtoModule.readVarInt(Buf, v87)
				NewModule.show_loading = VarInt ~= 0
			else
				local _
				_, v2459 = ProtoModule.readVarInt(Buf, v87)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.overview_rich_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.result_entry = t.FeedEntry.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2459 = ProtoModule.readBuffer(Buf, v87)
				table.insert(NewModule.follow_up_queries, buffer.tostring(Buffer3))
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.search_query = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.search_session_id = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v2459 = ProtoModule.readBuffer(Buf, v87)
				NewModule.universe_ids = buffer.tostring(Buffer7)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v87)
				v87 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2459 = ProtoModule.readFixed32(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2459 = ProtoModule.readFixed64(Buf, v87)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module86:jsonEncode()
	local t = {}
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		t.overviewRichText = self.overview_rich_text
	end
	if self.result_entry ~= nil then
		t.resultEntry = self.result_entry:jsonEncode()
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		local FollowUpQueries = {}
		
		for _, followUpQuery in self.follow_up_queries do
			table.insert(FollowUpQueries, followUpQuery)
		end
		t.followUpQueries = FollowUpQueries
	end
	if self.show_loading then
		t.showLoading = self.show_loading
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		t.searchQuery = self.search_query
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		t.searchSessionId = self.search_session_id
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		t.universeIds = self.universe_ids
	end
	return t
end

function Module86:jsonDecode()
	-- upvalues: Module86 (copy), t (copy)
	local NewModule = Module86.new()
	
	if self.overview_rich_text ~= nil then
		NewModule.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		NewModule.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		NewModule.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		NewModule.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local Follow_up_queries = {}
		
		for _, followUpQuery in self.follow_up_queries do
			table.insert(Follow_up_queries, followUpQuery)
		end
		NewModule.follow_up_queries = Follow_up_queries
	end
	if self.followUpQueries ~= nil then
		local Follow_up_queries = {}
		
		for _, followUpQuery1 in self.followUpQueries do
			table.insert(Follow_up_queries, followUpQuery1)
		end
		NewModule.follow_up_queries = Follow_up_queries
	end
	if self.show_loading ~= nil then
		NewModule.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		NewModule.show_loading = self.showLoading
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.search_query ~= nil then
		NewModule.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		NewModule.search_query = self.searchQuery
	end
	if self.search_session_id ~= nil then
		NewModule.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		NewModule.search_session_id = self.searchSessionId
	end
	if self.universe_ids ~= nil then
		NewModule.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		NewModule.universe_ids = self.universeIds
	end
	return NewModule
end

Module86.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = Module86
TypeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local Module87 = {}
Module87.__index = Module87

function Module87.new(p1)
	-- upvalues: Module87 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_items = if p1 == nil or p1.user_items == nil then {} else p1.user_items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows
	}, Module87))
end

function Module87:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for _, userItem in self.user_items do
			local EncodeResult = userItem:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.max_visible_rows)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module87.decode(Buf)
	-- upvalues: Module87 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module87.new()
	local v88 = 0
	while v88 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2490 = ProtoModule.readTag(Buf, v88)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.max_visible_rows, v2490 = ProtoModule.readVarIntI32(Buf, v88)
			else
				local _
				_, v2490 = ProtoModule.readVarInt(Buf, v88)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2490 = ProtoModule.readBuffer(Buf, v88)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2490 = ProtoModule.readBuffer(Buf, v88)
				table.insert(NewModule.user_items, t.UserListInputData_UserItem.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v88)
				v88 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2490 = ProtoModule.readFixed32(Buf, v88)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2490 = ProtoModule.readFixed64(Buf, v88)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module87:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		local UserItems = {}
		
		for _, userItem in self.user_items do
			table.insert(UserItems, userItem:jsonEncode())
		end
		t.userItems = UserItems
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	return t
end

function Module87:jsonDecode()
	-- upvalues: Module87 (copy), t (copy)
	local NewModule = Module87.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.user_items ~= nil then
		local User_items = {}
		
		for _, userItem in self.user_items do
			table.insert(User_items, t.UserListInputData_UserItem.jsonDecode(userItem))
		end
		NewModule.user_items = User_items
	end
	if self.userItems ~= nil then
		local User_items = {}
		
		for _, userItem1 in self.userItems do
			table.insert(User_items, t.UserListInputData_UserItem.jsonDecode(userItem1))
		end
		NewModule.user_items = User_items
	end
	if self.max_visible_rows ~= nil then
		NewModule.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		NewModule.max_visible_rows = self.maxVisibleRows
	end
	return NewModule
end

Module87.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = Module87
TypeRegistryModule.default:register(t.UserListInputData)
local Module88 = {}
Module88.__index = Module88

function Module88.new(p1)
	-- upvalues: Module88 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, Module88))
end

function Module88:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module88.decode(Buf)
	-- upvalues: Module88 (copy), ProtoModule (copy)
	local NewModule = Module88.new()
	local v89 = 0
	while v89 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2510 = ProtoModule.readTag(Buf, v89)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2510 = ProtoModule.readVarInt(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2510 = ProtoModule.readBuffer(Buf, v89)
				NewModule.user_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v89)
				v89 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2510 = ProtoModule.readFixed32(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2510 = ProtoModule.readFixed64(Buf, v89)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module88:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function Module88:jsonDecode()
	-- upvalues: Module88 (copy)
	local NewModule = Module88.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	return NewModule
end

Module88.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = Module88
TypeRegistryModule.default:register(t.UserListInputData_UserItem)
local Module89 = {}
Module89.__index = Module89

function Module89.new(p1)
	-- upvalues: Module89 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows
	}, Module89))
end

function Module89:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.max_visible_rows)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module89.decode(Buf)
	-- upvalues: Module89 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module89.new()
	local v90 = 0
	while v90 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2531 = ProtoModule.readTag(Buf, v90)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.max_visible_rows, v2531 = ProtoModule.readVarIntI32(Buf, v90)
			else
				local _
				_, v2531 = ProtoModule.readVarInt(Buf, v90)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2531 = ProtoModule.readBuffer(Buf, v90)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2531 = ProtoModule.readBuffer(Buf, v90)
				table.insert(NewModule.items, t.CatalogItemListInputData_CatalogItem.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v90)
				v90 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2531 = ProtoModule.readFixed32(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2531 = ProtoModule.readFixed64(Buf, v90)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module89:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	return t
end

function Module89:jsonDecode()
	-- upvalues: Module89 (copy), t (copy)
	local NewModule = Module89.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.CatalogItemListInputData_CatalogItem.jsonDecode(item))
		end
		NewModule.items = Items
	end
	if self.max_visible_rows ~= nil then
		NewModule.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		NewModule.max_visible_rows = self.maxVisibleRows
	end
	return NewModule
end

Module89.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = Module89
TypeRegistryModule.default:register(t.CatalogItemListInputData)
local Module90 = {}
Module90.__index = Module90

function Module90.new(p1)
	-- upvalues: Module90 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, Module90))
end

function Module90:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.item_id)
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.item_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module90.decode(Buf)
	-- upvalues: Module90 (copy), ProtoModule (copy)
	local NewModule = Module90.new()
	local v91 = 0
	while v91 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2552 = ProtoModule.readTag(Buf, v91)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2552 = ProtoModule.readVarInt(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2552 = ProtoModule.readBuffer(Buf, v91)
				NewModule.item_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2552 = ProtoModule.readBuffer(Buf, v91)
				NewModule.item_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v91)
				v91 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2552 = ProtoModule.readFixed32(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2552 = ProtoModule.readFixed64(Buf, v91)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module90:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function Module90:jsonDecode()
	-- upvalues: Module90 (copy)
	local NewModule = Module90.new()
	
	if self.item_id ~= nil then
		NewModule.item_id = self.item_id
	end
	if self.itemId ~= nil then
		NewModule.item_id = self.itemId
	end
	if self.item_type ~= nil then
		NewModule.item_type = self.item_type
	end
	if self.itemType ~= nil then
		NewModule.item_type = self.itemType
	end
	return NewModule
end

Module90.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = Module90
TypeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local Module91 = {}
Module91.__index = Module91

function Module91.new(p1)
	-- upvalues: Module91 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module91))
end

function Module91:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module91.decode(Buf)
	-- upvalues: Module91 (copy), ProtoModule (copy)
	local NewModule = Module91.new()
	local v92 = 0
	while v92 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2569 = ProtoModule.readTag(Buf, v92)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2569 = ProtoModule.readVarInt(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2569 = ProtoModule.readBuffer(Buf, v92)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v92)
				v92 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2569 = ProtoModule.readFixed32(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2569 = ProtoModule.readFixed64(Buf, v92)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module91:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module91:jsonDecode()
	-- upvalues: Module91 (copy)
	local NewModule = Module91.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module91.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = Module91
TypeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local Module92 = {}
Module92.__index = Module92

function Module92.new(p1)
	-- upvalues: Module92 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		moment_items = if p1 == nil or p1.moment_items == nil then {} else p1.moment_items
	}, Module92))
end

function Module92:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.subtitle)
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for _, momentItem in self.moment_items do
			local EncodeResult = momentItem:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module92.decode(Buf)
	-- upvalues: Module92 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module92.new()
	local v93 = 0
	while v93 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2590 = ProtoModule.readTag(Buf, v93)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2590 = ProtoModule.readVarInt(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2590 = ProtoModule.readBuffer(Buf, v93)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2590 = ProtoModule.readBuffer(Buf, v93)
				NewModule.subtitle = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2590 = ProtoModule.readBuffer(Buf, v93)
				table.insert(NewModule.moment_items, t.MomentsCarouselInputData_MomentItem.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v93)
				v93 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2590 = ProtoModule.readFixed32(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2590 = ProtoModule.readFixed64(Buf, v93)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module92:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		local MomentItems = {}
		
		for _, momentItem in self.moment_items do
			table.insert(MomentItems, momentItem:jsonEncode())
		end
		t.momentItems = MomentItems
	end
	return t
end

function Module92:jsonDecode()
	-- upvalues: Module92 (copy), t (copy)
	local NewModule = Module92.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local Moment_items = {}
		
		for _, momentItem in self.moment_items do
			table.insert(Moment_items, t.MomentsCarouselInputData_MomentItem.jsonDecode(momentItem))
		end
		NewModule.moment_items = Moment_items
	end
	if self.momentItems ~= nil then
		local Moment_items = {}
		
		for _, momentItem1 in self.momentItems do
			table.insert(Moment_items, t.MomentsCarouselInputData_MomentItem.jsonDecode(momentItem1))
		end
		NewModule.moment_items = Moment_items
	end
	return NewModule
end

Module92.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = Module92
TypeRegistryModule.default:register(t.MomentsCarouselInputData)
local Module93 = {}
Module93.__index = Module93

function Module93.new(p1)
	-- upvalues: Module93 (copy)
	return (setmetatable({
		moment_id = if p1 == nil or p1.moment_id == nil then "" else p1.moment_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		target_universe_id = if p1 == nil or p1.target_universe_id == nil then "" else p1.target_universe_id,
		target_place_id = if p1 == nil or p1.target_place_id == nil then "" else p1.target_place_id,
		feed_item_id = if p1 == nil or p1.feed_item_id == nil then "" else p1.feed_item_id,
		capture_universe_id = if p1 == nil or p1.capture_universe_id == nil then "" else p1.capture_universe_id
	}, Module93))
end

function Module93:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.moment_id)
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.video_asset_id)
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.target_universe_id)
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.target_place_id)
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.feed_item_id)
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.capture_universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module93.decode(Buf)
	-- upvalues: Module93 (copy), ProtoModule (copy)
	local NewModule = Module93.new()
	local v94 = 0
	while v94 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2621 = ProtoModule.readTag(Buf, v94)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2621 = ProtoModule.readVarInt(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.moment_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.video_asset_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.target_universe_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.target_place_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.feed_item_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2621 = ProtoModule.readBuffer(Buf, v94)
				NewModule.capture_universe_id = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v94)
				v94 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2621 = ProtoModule.readFixed32(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2621 = ProtoModule.readFixed64(Buf, v94)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module93:jsonEncode()
	local t = {}
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		t.momentId = self.moment_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		t.targetUniverseId = self.target_universe_id
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		t.targetPlaceId = self.target_place_id
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		t.feedItemId = self.feed_item_id
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		t.captureUniverseId = self.capture_universe_id
	end
	return t
end

function Module93:jsonDecode()
	-- upvalues: Module93 (copy)
	local NewModule = Module93.new()
	
	if self.moment_id ~= nil then
		NewModule.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		NewModule.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		NewModule.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		NewModule.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		NewModule.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		NewModule.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		NewModule.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		NewModule.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		NewModule.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		NewModule.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		NewModule.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		NewModule.capture_universe_id = self.captureUniverseId
	end
	return NewModule
end

Module93.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = Module93
TypeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local Module94 = {}
Module94.__index = Module94

function Module94.new(p1)
	-- upvalues: Module94 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle
	}, Module94))
end

function Module94:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.subtitle)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module94.decode(Buf)
	-- upvalues: Module94 (copy), ProtoModule (copy)
	local NewModule = Module94.new()
	local v95 = 0
	while v95 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2644 = ProtoModule.readTag(Buf, v95)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2644 = ProtoModule.readVarInt(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2644 = ProtoModule.readBuffer(Buf, v95)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2644 = ProtoModule.readBuffer(Buf, v95)
				NewModule.subtitle = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v95)
				v95 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2644 = ProtoModule.readFixed32(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2644 = ProtoModule.readFixed64(Buf, v95)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module94:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function Module94:jsonDecode()
	-- upvalues: Module94 (copy)
	local NewModule = Module94.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	return NewModule
end

Module94.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = Module94
TypeRegistryModule.default:register(t.AttributionRowInputData)
local Module95 = {}
Module95.__index = Module95

function Module95.new(p1)
	-- upvalues: Module95 (copy)
	return (setmetatable({
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id
	}, Module95))
end

function Module95:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.image_asset_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module95.decode(Buf)
	-- upvalues: Module95 (copy), ProtoModule (copy)
	local NewModule = Module95.new()
	local v96 = 0
	while v96 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2661 = ProtoModule.readTag(Buf, v96)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2661 = ProtoModule.readVarInt(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2661 = ProtoModule.readBuffer(Buf, v96)
				NewModule.image_asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v96)
				v96 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2661 = ProtoModule.readFixed32(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2661 = ProtoModule.readFixed64(Buf, v96)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module95:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function Module95:jsonDecode()
	-- upvalues: Module95 (copy)
	local NewModule = Module95.new()
	
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = self.imageAssetId
	end
	return NewModule
end

Module95.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = Module95
TypeRegistryModule.default:register(t.ImageInputData)
local Module96 = {}
Module96.__index = Module96

function Module96.new(p1)
	-- upvalues: Module96 (copy)
	return (setmetatable({
		text = if p1 == nil or p1.text == nil then "" else p1.text,
		is_rendered_text = p1 ~= nil and p1.is_rendered_text ~= nil and p1.is_rendered_text
	}, Module96))
end

function Module96:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.text)
	end
	if self.is_rendered_text then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_rendered_text then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module96.decode(Buf)
	-- upvalues: Module96 (copy), ProtoModule (copy)
	local NewModule = Module96.new()
	local v97 = 0
	while v97 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2679 = ProtoModule.readTag(Buf, v97)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v2679 = ProtoModule.readVarInt(Buf, v97)
				NewModule.is_rendered_text = VarInt ~= 0
			else
				local _
				_, v2679 = ProtoModule.readVarInt(Buf, v97)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2679 = ProtoModule.readBuffer(Buf, v97)
				NewModule.text = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v97)
				v97 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2679 = ProtoModule.readFixed32(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2679 = ProtoModule.readFixed64(Buf, v97)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module96:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function Module96:jsonDecode()
	-- upvalues: Module96 (copy)
	local NewModule = Module96.new()
	
	if self.text ~= nil then
		NewModule.text = self.text
	end
	if self.is_rendered_text ~= nil then
		NewModule.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		NewModule.is_rendered_text = self.isRenderedText
	end
	return NewModule
end

Module96.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = Module96
TypeRegistryModule.default:register(t.TextInputData)
local Module97 = {}
Module97.__index = Module97

function Module97.new(p1)
	-- upvalues: Module97 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools
	}, Module97))
end

function Module97:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, value in self.entry_map do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for _, value1 in self.entry_order do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, value1)
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i2, value2 in self.entry_order_map do
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, i2)
			local EncodeResult = value2:encode()
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult3, WriteBufferResult2_2 = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, WriteBufferResult3, WriteBufferResult2_2)
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i1, contentPool in self.content_pools do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, i1)
			local EncodeResult = contentPool:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module97.decode(Buf)
	-- upvalues: Module97 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module97.new()
	local v98 = 0
	while v98 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2729 = ProtoModule.readTag(Buf, v98)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2729 = ProtoModule.readVarInt(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2729 = ProtoModule.readBuffer(Buf, v98)
				local DecodeResult = t.VerticalFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2729 = ProtoModule.readBuffer(Buf, v98)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2729 = ProtoModule.readBuffer(Buf, v98)
				local DecodeResult = t.VerticalFeedInputData_EntryOrderMapEntry.decode(Buffer3)
				local NewResult = t.EntryOrder.new()
				NewModule.entry_order_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2729 = ProtoModule.readBuffer(Buf, v98)
				local DecodeResult = t.VerticalFeedInputData_ContentPoolsEntry.decode(Buffer4)
				local NewResult = t.ContentPool.new()
				NewModule.content_pools[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v98)
				v98 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2729 = ProtoModule.readFixed32(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2729 = ProtoModule.readFixed64(Buf, v98)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module97:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local EntryMap = {}
		
		for i, value in self.entry_map do
			EntryMap[i] = value:jsonEncode()
		end
		t.entryMap = EntryMap
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local EntryOrder = {}
		
		for _, value1 in self.entry_order do
			table.insert(EntryOrder, value1)
		end
		t.entryOrder = EntryOrder
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local EntryOrderMap = {}
		
		for i1, value2 in self.entry_order_map do
			EntryOrderMap[i1] = value2:jsonEncode()
		end
		t.entryOrderMap = EntryOrderMap
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local ContentPools = {}
		
		for i2, contentPool in self.content_pools do
			ContentPools[i2] = contentPool:jsonEncode()
		end
		t.contentPools = ContentPools
	end
	return t
end

function Module97:jsonDecode()
	-- upvalues: Module97 (copy), t (copy)
	local NewModule = Module97.new()
	
	if self.entry_map ~= nil then
		local Entry_map = {}
		
		for i, value in self.entry_map do
			Entry_map[i] = t.FeedEntry.jsonDecode(value)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entryMap ~= nil then
		local Entry_map = {}
		
		for i1, value1 in self.entryMap do
			Entry_map[i1] = t.FeedEntry.jsonDecode(value1)
		end
		NewModule.entry_map = Entry_map
	end
	if self.entry_order ~= nil then
		local Entry_order = {}
		
		for _, value2 in self.entry_order do
			table.insert(Entry_order, value2)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entryOrder ~= nil then
		local Entry_order = {}
		
		for _, value3 in self.entryOrder do
			table.insert(Entry_order, value3)
		end
		NewModule.entry_order = Entry_order
	end
	if self.entry_order_map ~= nil then
		local Entry_order_map = {}
		
		for i2, value4 in self.entry_order_map do
			Entry_order_map[i2] = t.EntryOrder.jsonDecode(value4)
		end
		NewModule.entry_order_map = Entry_order_map
	end
	if self.entryOrderMap ~= nil then
		local Entry_order_map = {}
		
		for i3, value5 in self.entryOrderMap do
			Entry_order_map[i3] = t.EntryOrder.jsonDecode(value5)
		end
		NewModule.entry_order_map = Entry_order_map
	end
	if self.content_pools ~= nil then
		local Content_pools = {}
		
		for i4, contentPool in self.content_pools do
			Content_pools[i4] = t.ContentPool.jsonDecode(contentPool)
		end
		NewModule.content_pools = Content_pools
	end
	if self.contentPools ~= nil then
		local Content_pools = {}
		
		for i5, contentPool1 in self.contentPools do
			Content_pools[i5] = t.ContentPool.jsonDecode(contentPool1)
		end
		NewModule.content_pools = Content_pools
	end
	return NewModule
end

Module97.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = Module97
TypeRegistryModule.default:register(t.VerticalFeedInputData)
local Module98 = {}
Module98.__index = Module98

function Module98.new(p1)
	-- upvalues: Module98 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module98))
end

function Module98:encode()
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

function Module98.decode(Buf)
	-- upvalues: Module98 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module98.new()
	local v99 = 0
	while v99 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2769 = ProtoModule.readTag(Buf, v99)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2769 = ProtoModule.readVarInt(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2769 = ProtoModule.readBuffer(Buf, v99)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2769 = ProtoModule.readBuffer(Buf, v99)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v99)
				v99 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2769 = ProtoModule.readFixed32(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2769 = ProtoModule.readFixed64(Buf, v99)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module98:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module98:jsonDecode()
	-- upvalues: Module98 (copy), t (copy)
	local NewModule = Module98.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module98.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = Module98
TypeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local Module99 = {}
Module99.__index = Module99

function Module99.new(p1)
	-- upvalues: Module99 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module99))
end

function Module99:encode()
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

function Module99.decode(Buf)
	-- upvalues: Module99 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module99.new()
	local v100 = 0
	while v100 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2789 = ProtoModule.readTag(Buf, v100)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2789 = ProtoModule.readVarInt(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2789 = ProtoModule.readBuffer(Buf, v100)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2789 = ProtoModule.readBuffer(Buf, v100)
				NewModule.value = t.EntryOrder.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v100)
				v100 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2789 = ProtoModule.readFixed32(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2789 = ProtoModule.readFixed64(Buf, v100)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module99:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module99:jsonDecode()
	-- upvalues: Module99 (copy), t (copy)
	local NewModule = Module99.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.EntryOrder.jsonDecode(self.value)
	end
	return NewModule
end

Module99.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = Module99
TypeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local Module100 = {}
Module100.__index = Module100

function Module100.new(p1)
	-- upvalues: Module100 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module100))
end

function Module100:encode()
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

function Module100.decode(Buf)
	-- upvalues: Module100 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module100.new()
	local v101 = 0
	while v101 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2809 = ProtoModule.readTag(Buf, v101)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2809 = ProtoModule.readVarInt(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2809 = ProtoModule.readBuffer(Buf, v101)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2809 = ProtoModule.readBuffer(Buf, v101)
				NewModule.value = t.ContentPool.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v101)
				v101 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2809 = ProtoModule.readFixed32(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2809 = ProtoModule.readFixed64(Buf, v101)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module100:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module100:jsonDecode()
	-- upvalues: Module100 (copy), t (copy)
	local NewModule = Module100.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.ContentPool.jsonDecode(self.value)
	end
	return NewModule
end

Module100.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = Module100
TypeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local Module101 = {}
Module101.__index = Module101

function Module101.new(p1)
	-- upvalues: Module101 (copy)
	return (setmetatable({
		foreground_header_entry = if p1 == nil or p1.foreground_header_entry == nil then nil else p1.foreground_header_entry,
		background_header_entry = if p1 == nil or p1.background_header_entry == nil then nil else p1.background_header_entry
	}, Module101))
end

function Module101:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.foreground_header_entry ~= nil then
		local EncodeResult = self.foreground_header_entry:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.background_header_entry ~= nil then
		local EncodeResult = self.background_header_entry:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module101.decode(Buf)
	-- upvalues: Module101 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module101.new()
	local v102 = 0
	while v102 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2830 = ProtoModule.readTag(Buf, v102)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2830 = ProtoModule.readVarInt(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2830 = ProtoModule.readBuffer(Buf, v102)
				NewModule.foreground_header_entry = t.ForegroundHeaderEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2830 = ProtoModule.readBuffer(Buf, v102)
				NewModule.background_header_entry = t.BackgroundHeaderEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v102)
				v102 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2830 = ProtoModule.readFixed32(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2830 = ProtoModule.readFixed64(Buf, v102)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module101:jsonEncode()
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	return t
end

function Module101:jsonDecode()
	-- upvalues: Module101 (copy), t (copy)
	local NewModule = Module101.new()
	
	if self.foreground_header_entry ~= nil then
		NewModule.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		NewModule.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		NewModule.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		NewModule.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	return NewModule
end

Module101.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = Module101
TypeRegistryModule.default:register(t.PageHeaderInputData)
local Module102 = {}
Module102.__index = Module102

function Module102.new(p1)
	-- upvalues: Module102 (copy)
	return (setmetatable({
		selected_option = if p1 == nil or p1.selected_option == nil then "" else p1.selected_option,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		experience_carousel = if p1 == nil or p1.experience_carousel == nil then nil else p1.experience_carousel,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then "" else p1.feed_item_key
	}, Module102))
end

function Module102:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.selected_option)
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.sort_id)
	end
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.experience_carousel ~= nil then
		local EncodeResult = self.experience_carousel:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.feed_item_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module102.decode(Buf)
	-- upvalues: Module102 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module102.new()
	local v103 = 0
	while v103 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2857 = ProtoModule.readTag(Buf, v103)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2857 = ProtoModule.readVarInt(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2857 = ProtoModule.readBuffer(Buf, v103)
				NewModule.selected_option = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2857 = ProtoModule.readBuffer(Buf, v103)
				NewModule.sort_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2857 = ProtoModule.readBuffer(Buf, v103)
				table.insert(NewModule.options, t.SelectorOption.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2857 = ProtoModule.readBuffer(Buf, v103)
				NewModule.experience_carousel = t.ExperienceCarouselInputData.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2857 = ProtoModule.readBuffer(Buf, v103)
				NewModule.feed_item_key = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v103)
				v103 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2857 = ProtoModule.readFixed32(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2857 = ProtoModule.readFixed64(Buf, v103)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module102:jsonEncode()
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	if self.experience_carousel ~= nil then
		t.experienceCarousel = self.experience_carousel:jsonEncode()
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	return t
end

function Module102:jsonDecode()
	-- upvalues: Module102 (copy), t (copy)
	local NewModule = Module102.new()
	
	if self.selected_option ~= nil then
		NewModule.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		NewModule.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.SelectorOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	if self.experience_carousel ~= nil then
		NewModule.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		NewModule.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		NewModule.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		NewModule.feed_item_key = self.feedItemKey
	end
	return NewModule
end

Module102.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = Module102
TypeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local Module103 = {}
Module103.__index = Module103

function Module103.new(p1)
	-- upvalues: Module103 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		is_selected = p1 ~= nil and p1.is_selected ~= nil and p1.is_selected
	}, Module103))
end

function Module103:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.is_selected then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.is_selected then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module103.decode(Buf)
	-- upvalues: Module103 (copy), ProtoModule (copy)
	local NewModule = Module103.new()
	local v104 = 0
	while v104 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2883 = ProtoModule.readTag(Buf, v104)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v2883 = ProtoModule.readVarInt(Buf, v104)
				NewModule.is_selected = VarInt ~= 0
			else
				local _
				_, v2883 = ProtoModule.readVarInt(Buf, v104)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2883 = ProtoModule.readBuffer(Buf, v104)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2883 = ProtoModule.readBuffer(Buf, v104)
				NewModule.display_name = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v104)
				v104 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2883 = ProtoModule.readFixed32(Buf, v104)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2883 = ProtoModule.readFixed64(Buf, v104)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module103:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.is_selected then
		t.isSelected = self.is_selected
	end
	return t
end

function Module103:jsonDecode()
	-- upvalues: Module103 (copy)
	local NewModule = Module103.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		NewModule.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		NewModule.is_selected = self.isSelected
	end
	return NewModule
end

Module103.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = Module103
TypeRegistryModule.default:register(t.SelectorOption)
local Module104 = {}
Module104.__index = Module104

function Module104.new(p1)
	-- upvalues: Module104 (copy)
	return (setmetatable({
		layout = if p1 == nil or p1.layout == nil then nil else p1.layout,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module104))
end

function Module104:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.layout ~= nil then
		local EncodeResult = self.layout:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module104.decode(Buf)
	-- upvalues: Module104 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module104.new()
	local v105 = 0
	while v105 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2905 = ProtoModule.readTag(Buf, v105)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2905 = ProtoModule.readVarInt(Buf, v105)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2905 = ProtoModule.readBuffer(Buf, v105)
				NewModule.layout = t.ItemLayout.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2905 = ProtoModule.readBuffer(Buf, v105)
				NewModule.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v105)
				v105 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2905 = ProtoModule.readFixed32(Buf, v105)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2905 = ProtoModule.readFixed64(Buf, v105)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module104:jsonEncode()
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function Module104:jsonDecode()
	-- upvalues: Module104 (copy), t (copy)
	local NewModule = Module104.new()
	
	if self.layout ~= nil then
		NewModule.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		NewModule.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return NewModule
end

Module104.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = Module104
TypeRegistryModule.default:register(t.ItemWithLayout)
local Module105 = {}
Module105.__index = Module105

function Module105.new(p1)
	-- upvalues: Module105 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then nil else p1.collection_item_size
	}, Module105))
end

function Module105:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.collection_item_size ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.collection_item_size)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module105.decode(Buf)
	-- upvalues: Module105 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module105.new()
	local v106 = 0
	while v106 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2925 = ProtoModule.readTag(Buf, v106)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2925 = ProtoModule.readVarInt(Buf, v106)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2925 = ProtoModule.readBuffer(Buf, v106)
				table.insert(NewModule.items, t.ItemWithLayout.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2925 = ProtoModule.readBuffer(Buf, v106)
				NewModule.collection_item_size = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v106)
				v106 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2925 = ProtoModule.readFixed32(Buf, v106)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2925 = ProtoModule.readFixed64(Buf, v106)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module105:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	if self.collection_item_size ~= nil then
		t.collectionItemSize = self.collection_item_size
	end
	return t
end

function Module105:jsonDecode()
	-- upvalues: Module105 (copy), t (copy)
	local NewModule = Module105.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.ItemWithLayout.jsonDecode(item))
		end
		NewModule.items = Items
	end
	if self.collection_item_size ~= nil then
		NewModule.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		NewModule.collection_item_size = self.collectionItemSize
	end
	return NewModule
end

Module105.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = Module105
TypeRegistryModule.default:register(t.ContentPool)
local Module106 = {}
Module106.__index = Module106

function Module106.new(p1)
	-- upvalues: Module106 (copy)
	return (setmetatable({
		col_span = if p1 == nil or p1.col_span == nil then 0 else p1.col_span,
		row_span = if p1 == nil or p1.row_span == nil then 0 else p1.row_span,
		alignment_type = if p1 == nil or p1.alignment_type == nil then "" else p1.alignment_type,
		min_row_padding = if p1 == nil or p1.min_row_padding == nil then 0 else p1.min_row_padding
	}, Module106))
end

function Module106:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.col_span)
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.row_span)
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.alignment_type)
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.min_row_padding)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module106.decode(Buf)
	-- upvalues: Module106 (copy), ProtoModule (copy)
	local NewModule = Module106.new()
	local v107 = 0
	while v107 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2950 = ProtoModule.readTag(Buf, v107)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.col_span, v2950 = ProtoModule.readVarIntI32(Buf, v107)
			elseif Tag == 2 then
				NewModule.row_span, v2950 = ProtoModule.readVarIntI32(Buf, v107)
			elseif Tag == 4 then
				NewModule.min_row_padding, v2950 = ProtoModule.readVarIntI32(Buf, v107)
			else
				local _
				_, v2950 = ProtoModule.readVarInt(Buf, v107)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 3 then
				local Buffer1
				Buffer1, v2950 = ProtoModule.readBuffer(Buf, v107)
				NewModule.alignment_type = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v107)
				v107 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2950 = ProtoModule.readFixed32(Buf, v107)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2950 = ProtoModule.readFixed64(Buf, v107)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module106:jsonEncode()
	local t = {}
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		t.colSpan = self.col_span
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		t.rowSpan = self.row_span
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		t.alignmentType = self.alignment_type
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		t.minRowPadding = self.min_row_padding
	end
	return t
end

function Module106:jsonDecode()
	-- upvalues: Module106 (copy)
	local NewModule = Module106.new()
	
	if self.col_span ~= nil then
		NewModule.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		NewModule.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		NewModule.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		NewModule.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		NewModule.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		NewModule.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		NewModule.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		NewModule.min_row_padding = self.minRowPadding
	end
	return NewModule
end

Module106.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = Module106
TypeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p1)
		return if p1 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p1 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p1)
		return if p1 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p1
	end,
	fromName = function(p1)
		return if p1 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end
}

return {
	UniversalPageEntry = t.UniversalPageEntry,
	FeedEntry = t.FeedEntry,
	ForegroundHeaderEntry = t.ForegroundHeaderEntry,
	BackgroundHeaderEntry = t.BackgroundHeaderEntry,
	PageEntryInputData = t.PageEntryInputData,
	BadgesGridInputData = t.BadgesGridInputData,
	BadgesGridInputData_BadgeInputData = t.BadgesGridInputData_BadgeInputData,
	BadgeDetailsInputData = t.BadgeDetailsInputData,
	BadgeDetailsInputData_LocalizedLiterals = t.BadgeDetailsInputData_LocalizedLiterals,
	BadgeDetailsInputData_LocalizedLiterals_InfoTable = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable,
	BadgeDetailsInputData_LocalizedLiterals_ActionModule = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule,
	BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu,
	StaticInputData = t.StaticInputData,
	ExperienceDetailsFeedInputData = t.ExperienceDetailsFeedInputData,
	EntryOrder = t.EntryOrder,
	ExperienceDetailsActionBarInputData = t.ExperienceDetailsActionBarInputData,
	ExperienceDetailsBannerImageInputData = t.ExperienceDetailsBannerImageInputData,
	ExperienceDetailsStickyHeaderInputData = t.ExperienceDetailsStickyHeaderInputData,
	ExperienceAttributionRowInputData = t.ExperienceAttributionRowInputData,
	ExperienceActionModuleInputData = t.ExperienceActionModuleInputData,
	ExperienceActionModuleInputData_ConnectionPlayedUser = t.ExperienceActionModuleInputData_ConnectionPlayedUser,
	ExperienceMediaGalleryInputData = t.ExperienceMediaGalleryInputData,
	ExperienceMediaGalleryInputData_MediaItem = t.ExperienceMediaGalleryInputData_MediaItem,
	ExperienceDescriptionInputData = t.ExperienceDescriptionInputData,
	ExperienceStatRowInputData = t.ExperienceStatRowInputData,
	ExperienceInfoTableInputData = t.ExperienceInfoTableInputData,
	ExperienceContentRatingLabelInputData = t.ExperienceContentRatingLabelInputData,
	ExperienceRefundPolicyInputData = t.ExperienceRefundPolicyInputData,
	ExperiencePlayWithRewardInputData = t.ExperiencePlayWithRewardInputData,
	SocialLinkRowInputData = t.SocialLinkRowInputData,
	SocialLinkRowInputData_SocialLinkItem = t.SocialLinkRowInputData_SocialLinkItem,
	ExperienceCarouselInputData = t.ExperienceCarouselInputData,
	ExperienceCarouselInputData_UniverseItem = t.ExperienceCarouselInputData_UniverseItem,
	SongCarouselInputData = t.SongCarouselInputData,
	SongCarouselInputData_SongItem = t.SongCarouselInputData_SongItem,
	EventsCarouselInputData = t.EventsCarouselInputData,
	EventsCarouselInputData_EventItem = t.EventsCarouselInputData_EventItem,
	DevStoreFeedInputData = t.DevStoreFeedInputData,
	GamePassCollectionInputData = t.GamePassCollectionInputData,
	GamePassCollectionInputData_GamePassItem = t.GamePassCollectionInputData_GamePassItem,
	DeveloperProductCollectionInputData = t.DeveloperProductCollectionInputData,
	DeveloperProductCollectionInputData_DeveloperProductItem = t.DeveloperProductCollectionInputData_DeveloperProductItem,
	SubscriptionCollectionInputData = t.SubscriptionCollectionInputData,
	SubscriptionCollectionInputData_SubscriptionItem = t.SubscriptionCollectionInputData_SubscriptionItem,
	CardContainerCardInputData = t.CardContainerCardInputData,
	CardContainerInputData = t.CardContainerInputData,
	CardInputData = t.CardInputData,
	DialogInputData = t.DialogInputData,
	BannerInputData = t.BannerInputData,
	TooltipInputData = t.TooltipInputData,
	CoachmarkInputData = t.CoachmarkInputData,
	SystemBannerInputData = t.SystemBannerInputData,
	AgeCheckUpsellInputData = t.AgeCheckUpsellInputData,
	PartyChatConversationUpsellInputData = t.PartyChatConversationUpsellInputData,
	EventDetailsFeedInputData = t.EventDetailsFeedInputData,
	EventDetailsActionBarInputData = t.EventDetailsActionBarInputData,
	EventDescriptionInputData = t.EventDescriptionInputData,
	EventAttributionRowInputData = t.EventAttributionRowInputData,
	EventInfoTableInputData = t.EventInfoTableInputData,
	EventDetailsSheetFullBleedInputData = t.EventDetailsSheetFullBleedInputData,
	EventNotificationsModalInputData = t.EventNotificationsModalInputData,
	ChartsFeedInputData = t.ChartsFeedInputData,
	FilterPillsInputData = t.FilterPillsInputData,
	FilterPillsInputData_FilterGroup = t.FilterPillsInputData_FilterGroup,
	FilterPillsInputData_FilterOption = t.FilterPillsInputData_FilterOption,
	SortSelectorInputData = t.SortSelectorInputData,
	SortSelectorInputData_SortOption = t.SortSelectorInputData_SortOption,
	UAMarketplaceCatalogItemGroupInputData = t.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t.UAMarketplaceCatalogItemCarouselInputData,
	WidgetStyleData = t.WidgetStyleData,
	UAMarketplaceCatalogHeroUnitInputData = t.UAMarketplaceCatalogHeroUnitInputData,
	UAMarketplaceCatalogFeedInputData = t.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogCategoryMenuInputData = t.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
	CatalogItemGridInputData = t.CatalogItemGridInputData,
	CatalogItemGridInputData_CatalogItem = t.CatalogItemGridInputData_CatalogItem,
	SearchResultsFeedInputData = t.SearchResultsFeedInputData,
	ExperienceEmphasisTileInputData = t.ExperienceEmphasisTileInputData,
	PowerSearchAIOverviewInputData = t.PowerSearchAIOverviewInputData,
	UserListInputData = t.UserListInputData,
	UserListInputData_UserItem = t.UserListInputData_UserItem,
	CatalogItemListInputData = t.CatalogItemListInputData,
	CatalogItemListInputData_CatalogItem = t.CatalogItemListInputData_CatalogItem,
	ExperienceGuidelinesDialogInputData = t.ExperienceGuidelinesDialogInputData,
	MomentsCarouselInputData = t.MomentsCarouselInputData,
	MomentsCarouselInputData_MomentItem = t.MomentsCarouselInputData_MomentItem,
	AttributionRowInputData = t.AttributionRowInputData,
	ImageInputData = t.ImageInputData,
	TextInputData = t.TextInputData,
	VerticalFeedInputData = t.VerticalFeedInputData,
	PageHeaderInputData = t.PageHeaderInputData,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}