local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local StructModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local TimestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local BackgroundLayerModule = require(script.Parent.background_layer)
local ConfigDrivenFormDataModule = require(script.Parent.config_driven_form_data)
local CustomFormDataModule = require(script.Parent.custom_form_data)
local PageEntryModule = require(script.Parent.page_entry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 4846 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		page_entry = if p1 == nil or p1.page_entry == nil then nil else p1.page_entry,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, Module))
end

function Module:encode() --[[ Line: 4853 ]]
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

function Module.decode(Buf) --[[ Line: 4874 ]]
	-- upvalues: Module (copy), ProtoModule (copy), PageEntryModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v162 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v162 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v162 = ProtoModule.readBuffer(Buf, v1)
				NewModule.page_entry = PageEntryModule.PageEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v162 = ProtoModule.readBuffer(Buf, v1)
				NewModule.input_data = t.PageEntryInputData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v162 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v162 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 4922 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 4936 ]]
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

function Module1.new(p1) --[[ Line: 4972 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component
	}, Module1))
end

function Module1:encode() --[[ Line: 4979 ]]
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

function Module1.decode(Buf) --[[ Line: 4999 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v182 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v182 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v182 = ProtoModule.readBuffer(Buf, v2)
				NewModule.input_data = t.PageEntryInputData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v182 = ProtoModule.readBuffer(Buf, v2)
				NewModule.roblox_component = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v182 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v182 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 5047 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 5061 ]]
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

function Module2.new(p1) --[[ Line: 5097 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data,
		cta_buttons = if p1 == nil or p1.cta_buttons == nil then nil else p1.cta_buttons
	}, Module2))
end

function Module2:encode() --[[ Line: 5105 ]]
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
	if self.cta_buttons ~= nil then
		local EncodeResult = self.cta_buttons:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 5133 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v205 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v205 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v205 = ProtoModule.readBuffer(Buf, v3)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v205 = ProtoModule.readBuffer(Buf, v3)
				NewModule.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v205 = ProtoModule.readBuffer(Buf, v3)
				NewModule.cta_buttons = t.CtaButtonsInputData.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v205 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v205 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 5187 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		t.attributionRow = self.input_data.value:jsonEncode()
	end
	if self.cta_buttons ~= nil then
		t.ctaButtons = self.cta_buttons:jsonEncode()
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 5207 ]]
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
	if self.cta_buttons ~= nil then
		NewModule.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		NewModule.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
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

function Module3.new(p1) --[[ Line: 5253 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, Module3))
end

function Module3:encode() --[[ Line: 5260 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.roblox_component)
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local EncodeResult = self.input_data.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.input_data.type == "video" then
			local EncodeResult = self.input_data.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 5286 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v229 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v229 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v229 = ProtoModule.readBuffer(Buf, v4)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v229 = ProtoModule.readBuffer(Buf, v4)
				NewModule.input_data = { type = "image", value = t.ImageInputData.decode(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v229 = ProtoModule.readBuffer(Buf, v4)
				NewModule.input_data = { type = "video", value = t.VideoInputData.decode(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v229 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v229 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 5339 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			t.image = self.input_data.value:jsonEncode()
			
			return t
		end
		if self.input_data.type == "video" then
			t.video = self.input_data.value:jsonEncode()
		end
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 5357 ]]
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
	if self.video ~= nil then
		NewModule.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
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

function Module4.new(p1) --[[ Line: 5393 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module4))
end

function Module4:encode() --[[ Line: 5399 ]]
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
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_description" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_stat_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult16, WriteTagResult2_15, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_info_table" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "social_link_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult20, WriteTagResult2_19, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "song_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult22, WriteTagResult2_21, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "events_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult23, WriteTagResult2_22, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "game_pass_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult24, WriteTagResult2_23, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "developer_product_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult25, WriteTagResult2_24, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "subscription_collection" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dynamic_store_category" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult28, WriteTagResult2_27, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "card_container" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult29, WriteTagResult2_28, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "card" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dialog" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult34, WriteTagResult2_33 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult34, WriteTagResult2_33, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "banner" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "tooltip" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult35, WriteTagResult2_34 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult35, WriteTagResult2_34, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "coachmark" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult36, WriteTagResult2_35 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult36, WriteTagResult2_35, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "system_banner_prompt" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "age_check_upsell" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult37, WriteTagResult2_36 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult37, WriteTagResult2_36, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "catalog_item_list" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult21, WriteTagResult2_20, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "user_list" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult39, WriteTagResult2_38 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult39, WriteTagResult2_38, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_content_rating_label" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult40, WriteTagResult2_39 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult40, WriteTagResult2_39, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_refund_policy" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_play_with_reward" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult33, WriteTagResult2_32 = ProtoModule.writeTag(Buf, Count, 32, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult33, WriteTagResult2_32, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_guidelines_dialog" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult41, WriteTagResult2_40 = ProtoModule.writeTag(Buf, Count, 33, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult41, WriteTagResult2_40, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "community_section" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 35, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_leaderboard" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult42, WriteTagResult2_41 = ProtoModule.writeTag(Buf, Count, 36, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult42, WriteTagResult2_41, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "moments_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 34, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "text" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult44, WriteTagResult2_43 = ProtoModule.writeTag(Buf, Count, 40, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult44, WriteTagResult2_43, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "vertical_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult45, WriteTagResult2_44 = ProtoModule.writeTag(Buf, Count, 41, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult45, WriteTagResult2_44, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "page_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult46, WriteTagResult2_45 = ProtoModule.writeTag(Buf, Count, 42, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult46, WriteTagResult2_45, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "image_cta_section" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 43, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult26, WriteTagResult2_25, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "config_driven_form" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult47, WriteTagResult2_46 = ProtoModule.writeTag(Buf, Count, 44, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult47, WriteTagResult2_46, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "sandbox_content" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult38, WriteTagResult2_37 = ProtoModule.writeTag(Buf, Count, 50, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult38, WriteTagResult2_37, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult49, WriteTagResult2_48 = ProtoModule.writeTag(Buf, Count, 500, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult49, WriteTagResult2_48, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_action_bar" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult50, WriteTagResult2_49 = ProtoModule.writeTag(Buf, Count, 501, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult50, WriteTagResult2_49, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_banner_image" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 502, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_details_sticky_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult43, WriteTagResult2_42 = ProtoModule.writeTag(Buf, Count, 503, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult43, WriteTagResult2_42, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult51, WriteTagResult2_50 = ProtoModule.writeTag(Buf, Count, 600, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult51, WriteTagResult2_50, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_action_bar" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult52, WriteTagResult2_51 = ProtoModule.writeTag(Buf, Count, 601, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult52, WriteTagResult2_51, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_attribution_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 602, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_description" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult53, WriteTagResult2_52 = ProtoModule.writeTag(Buf, Count, 603, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult53, WriteTagResult2_52, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_info_table" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult54, WriteTagResult2_53 = ProtoModule.writeTag(Buf, Count, 604, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult54, WriteTagResult2_53, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult55, WriteTagResult2_54 = ProtoModule.writeTag(Buf, Count, 605, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult55, WriteTagResult2_54, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "event_notifications_modal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult56, WriteTagResult2_55 = ProtoModule.writeTag(Buf, Count, 606, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult56, WriteTagResult2_55, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dev_store_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 700, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult30, WriteTagResult2_29, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "charts_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult57, WriteTagResult2_56 = ProtoModule.writeTag(Buf, Count, 800, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult57, WriteTagResult2_56, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "filter_pills" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult58, WriteTagResult2_57 = ProtoModule.writeTag(Buf, Count, 801, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult58, WriteTagResult2_57, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "sort_selector" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult59, WriteTagResult2_58 = ProtoModule.writeTag(Buf, Count, 802, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult59, WriteTagResult2_58, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "genre_selector" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult48, WriteTagResult2_47 = ProtoModule.writeTag(Buf, Count, 803, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult48, WriteTagResult2_47, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult60, WriteTagResult2_59 = ProtoModule.writeTag(Buf, Count, 900, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult60, WriteTagResult2_59, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult61, WriteTagResult2_60 = ProtoModule.writeTag(Buf, Count, 901, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult61, WriteTagResult2_60, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult62, WriteTagResult2_61 = ProtoModule.writeTag(Buf, Count, 902, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult62, WriteTagResult2_61, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult64, WriteTagResult2_63 = ProtoModule.writeTag(Buf, Count, 903, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult64, WriteTagResult2_63, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult65, WriteTagResult2_64 = ProtoModule.writeTag(Buf, Count, 904, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult65, WriteTagResult2_64, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "catalog_item_grid" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult66, WriteTagResult2_65 = ProtoModule.writeTag(Buf, Count, 905, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult66, WriteTagResult2_65, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_offer_modal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult67, WriteTagResult2_66 = ProtoModule.writeTag(Buf, Count, 906, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult67, WriteTagResult2_66, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "marketplace_item_media_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 907, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "search_results_feed" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult68, WriteTagResult2_67 = ProtoModule.writeTag(Buf, Count, 1000, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult68, WriteTagResult2_67, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "power_search_ai_overview" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult69, WriteTagResult2_68 = ProtoModule.writeTag(Buf, Count, 1001, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult69, WriteTagResult2_68, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "experience_emphasis_tile" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult70, WriteTagResult2_69 = ProtoModule.writeTag(Buf, Count, 1002, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult70, WriteTagResult2_69, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "search_autocomplete" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult63, WriteTagResult2_62 = ProtoModule.writeTag(Buf, Count, 1003, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult63, WriteTagResult2_62, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "option_selector_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult71, WriteTagResult2_70 = ProtoModule.writeTag(Buf, Count, 1100, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult71, WriteTagResult2_70, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "game_items_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult72, WriteTagResult2_71 = ProtoModule.writeTag(Buf, Count, 1101, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult72, WriteTagResult2_71, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "hero_unit" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult73, WriteTagResult2_72 = ProtoModule.writeTag(Buf, Count, 1102, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult73, WriteTagResult2_72, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "friend_recommendation_carousel" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult74, WriteTagResult2_73 = ProtoModule.writeTag(Buf, Count, 1103, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult74, WriteTagResult2_73, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult75, WriteTagResult2_74 = ProtoModule.writeTag(Buf, Count, 1200, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult75, WriteTagResult2_74, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult76, WriteTagResult2_75 = ProtoModule.writeTag(Buf, Count, 1300, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult76, WriteTagResult2_75, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "community_announcement" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult77, WriteTagResult2_76 = ProtoModule.writeTag(Buf, Count, 1400, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult77, WriteTagResult2_76, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "group_announcement" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult78, WriteTagResult2_77 = ProtoModule.writeTag(Buf, Count, 1401, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult78, WriteTagResult2_77, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "settings_row" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 1500, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult31, WriteTagResult2_30, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "settings_toggle" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 1501, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult19, WriteTagResult2_18, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 5724 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), t (copy), ConfigDrivenFormDataModule (copy), StructModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v479 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v479 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(Buffer4)
				}
			elseif Tag == 4 then
				local Buffer5
				Buffer5, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(Buffer5)
				}
			elseif Tag == 5 then
				local Buffer6
				Buffer6, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(Buffer6)
				}
			elseif Tag == 6 then
				local Buffer8
				Buffer8, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(Buffer8)
				}
			elseif Tag == 7 then
				local Buffer11
				Buffer11, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(Buffer11)
				}
			elseif Tag == 8 then
				local Buffer14
				Buffer14, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(Buffer14)
				}
			elseif Tag == 9 then
				local Buffer15
				Buffer15, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(Buffer15)
				}
			elseif Tag == 10 then
				local Buffer16
				Buffer16, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(Buffer16)
				}
			elseif Tag == 11 then
				local Buffer17
				Buffer17, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(Buffer17)
				}
			elseif Tag == 12 then
				local Buffer18
				Buffer18, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(Buffer18)
				}
			elseif Tag == 13 then
				local Buffer19
				Buffer19, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(Buffer19)
				}
			elseif Tag == 14 then
				local Buffer20
				Buffer20, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(Buffer20)
				}
			elseif Tag == 15 then
				local Buffer21
				Buffer21, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(Buffer21)
				}
			elseif Tag == 16 then
				local Buffer24
				Buffer24, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(Buffer24)
				}
			elseif Tag == 17 then
				local Buffer26
				Buffer26, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(Buffer26)
				}
			elseif Tag == 20 then
				local Buffer28
				Buffer28, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(Buffer28)
				}
			elseif Tag == 21 then
				local Buffer31
				Buffer31, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = { type = "card", value = t.CardInputData.decode(Buffer31) }
			elseif Tag == 22 then
				local Buffer33
				Buffer33, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(Buffer33)
				}
			elseif Tag == 23 then
				local Buffer35
				Buffer35, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "banner",
					value = t.BannerInputData.decode(Buffer35)
				}
			elseif Tag == 24 then
				local Buffer36
				Buffer36, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(Buffer36)
				}
			elseif Tag == 25 then
				local Buffer37
				Buffer37, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(Buffer37)
				}
			elseif Tag == 26 then
				local Buffer38
				Buffer38, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(Buffer38)
				}
			elseif Tag == 27 then
				local Buffer39
				Buffer39, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(Buffer39)
				}
			elseif Tag == 28 then
				local Buffer40
				Buffer40, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(Buffer40)
				}
			elseif Tag == 29 then
				local Buffer43
				Buffer43, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(Buffer43)
				}
			elseif Tag == 30 then
				local Buffer45
				Buffer45, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(Buffer45)
				}
			elseif Tag == 31 then
				local Buffer46
				Buffer46, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(Buffer46)
				}
			elseif Tag == 32 then
				local Buffer47
				Buffer47, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(Buffer47)
				}
			elseif Tag == 33 then
				local Buffer49
				Buffer49, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(Buffer49)
				}
			elseif Tag == 34 then
				local Buffer50
				Buffer50, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(Buffer50)
				}
			elseif Tag == 35 then
				local Buffer51
				Buffer51, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(Buffer51)
				}
			elseif Tag == 36 then
				local Buffer52
				Buffer52, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_leaderboard",
					value = t.ExperienceLeaderboardInputData.decode(Buffer52)
				}
			elseif Tag == 40 then
				local Buffer53
				Buffer53, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = { type = "text", value = t.TextInputData.decode(Buffer53) }
			elseif Tag == 41 then
				local Buffer54
				Buffer54, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(Buffer54)
				}
			elseif Tag == 42 then
				local Buffer56
				Buffer56, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(Buffer56)
				}
			elseif Tag == 43 then
				local Buffer57
				Buffer57, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(Buffer57)
				}
			elseif Tag == 44 then
				local Buffer58
				Buffer58, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "config_driven_form",
					value = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.decode(Buffer58)
				}
			elseif Tag == 50 then
				local Buffer61
				Buffer61, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "sandbox_content",
					value = StructModule.Struct.decode(Buffer61)
				}
			elseif Tag == 500 then
				local Buffer63
				Buffer63, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(Buffer63)
				}
			elseif Tag == 501 then
				local Buffer27
				Buffer27, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(Buffer27)
				}
			elseif Tag == 502 then
				local Buffer22
				Buffer22, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(Buffer22)
				}
			elseif Tag == 503 then
				local Buffer25
				Buffer25, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(Buffer25)
				}
			elseif Tag == 600 then
				local Buffer34
				Buffer34, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(Buffer34)
				}
			elseif Tag == 601 then
				local Buffer23
				Buffer23, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(Buffer23)
				}
			elseif Tag == 602 then
				local Buffer32
				Buffer32, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(Buffer32)
				}
			elseif Tag == 603 then
				local Buffer65
				Buffer65, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(Buffer65)
				}
			elseif Tag == 604 then
				local Buffer30
				Buffer30, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(Buffer30)
				}
			elseif Tag == 605 then
				local Buffer66
				Buffer66, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(Buffer66)
				}
			elseif Tag == 606 then
				local Buffer67
				Buffer67, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(Buffer67)
				}
			elseif Tag == 700 then
				local Buffer68
				Buffer68, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(Buffer68)
				}
			elseif Tag == 800 then
				local Buffer10
				Buffer10, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(Buffer10)
				}
			elseif Tag == 801 then
				local Buffer3
				Buffer3, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(Buffer3)
				}
			elseif Tag == 802 then
				local Buffer9
				Buffer9, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(Buffer9)
				}
			elseif Tag == 803 then
				local Buffer12
				Buffer12, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(Buffer12)
				}
			elseif Tag == 900 then
				local Buffer7
				Buffer7, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(Buffer7)
				}
			elseif Tag == 901 then
				local Buffer69
				Buffer69, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(Buffer69)
				}
			elseif Tag == 902 then
				local Buffer70
				Buffer70, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(Buffer70)
				}
			elseif Tag == 903 then
				local Buffer71
				Buffer71, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(Buffer71)
				}
			elseif Tag == 904 then
				local Buffer72
				Buffer72, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(Buffer72)
				}
			elseif Tag == 905 then
				local Buffer73
				Buffer73, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(Buffer73)
				}
			elseif Tag == 906 then
				local Buffer74
				Buffer74, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(Buffer74)
				}
			elseif Tag == 907 then
				local Buffer55
				Buffer55, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "marketplace_item_media_header",
					value = t.MarketplaceItemMediaHeaderInputData.decode(Buffer55)
				}
			elseif Tag == 1000 then
				local Buffer13
				Buffer13, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(Buffer13)
				}
			elseif Tag == 1001 then
				local Buffer64
				Buffer64, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(Buffer64)
				}
			elseif Tag == 1002 then
				local Buffer59
				Buffer59, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(Buffer59)
				}
			elseif Tag == 1003 then
				local Buffer62
				Buffer62, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "search_autocomplete",
					value = t.SearchAutocompleteInputData.decode(Buffer62)
				}
			elseif Tag == 1100 then
				local Buffer75
				Buffer75, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(Buffer75)
				}
			elseif Tag == 1101 then
				local Buffer60
				Buffer60, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(Buffer60)
				}
			elseif Tag == 1102 then
				local Buffer76
				Buffer76, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(Buffer76)
				}
			elseif Tag == 1103 then
				local Buffer77
				Buffer77, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(Buffer77)
				}
			elseif Tag == 1200 then
				local Buffer78
				Buffer78, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(Buffer78)
				}
			elseif Tag == 1300 then
				local Buffer44
				Buffer44, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(Buffer44)
				}
			elseif Tag == 1400 then
				local Buffer41
				Buffer41, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "community_announcement",
					value = t.CommunityAnnouncementInputData.decode(Buffer41)
				}
			elseif Tag == 1401 then
				local Buffer29
				Buffer29, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "group_announcement",
					value = t.GroupAnnouncementInputData.decode(Buffer29)
				}
			elseif Tag == 1500 then
				local Buffer48
				Buffer48, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(Buffer48)
				}
			elseif Tag == 1501 then
				local Buffer42
				Buffer42, v479 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(Buffer42)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v479 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v479 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 6266 ]]
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
		if self.kind.type == "dynamic_store_category" then
			t.dynamicStoreCategory = self.kind.value:jsonEncode()
			
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
		if self.kind.type == "community_section" then
			t.communitySection = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "experience_leaderboard" then
			t.experienceLeaderboard = self.kind.value:jsonEncode()
			
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
		if self.kind.type == "image_cta_section" then
			t.imageCtaSection = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "config_driven_form" then
			t.configDrivenForm = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "sandbox_content" then
			t.sandboxContent = self.kind.value:jsonEncode()
			
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
		if self.kind.type == "genre_selector" then
			t.genreSelector = self.kind.value:jsonEncode()
			
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
		if self.kind.type == "marketplace_offer_modal" then
			t.marketplaceOfferModal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "marketplace_item_media_header" then
			t.marketplaceItemMediaHeader = self.kind.value:jsonEncode()
			
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
		if self.kind.type == "search_autocomplete" then
			t.searchAutocomplete = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "option_selector_carousel" then
			t.optionSelectorCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "game_items_carousel" then
			t.gameItemsCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "hero_unit" then
			t.heroUnit = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "friend_recommendation_carousel" then
			t.friendRecommendationCarousel = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "party_chat_conversation_upsell" then
			t.partyChatConversationUpsell = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "pre_auth_landing_sticky_header" then
			t.preAuthLandingStickyHeader = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "community_announcement" then
			t.communityAnnouncement = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "group_announcement" then
			t.groupAnnouncement = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "settings_row" then
			t.settingsRow = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "settings_toggle" then
			t.settingsToggle = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 6432 ]]
	-- upvalues: Module4 (copy), t (copy), ConfigDrivenFormDataModule (copy), StructModule (copy)
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
	if self.dynamic_store_category ~= nil then
		NewModule.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		NewModule.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
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
	if self.community_section ~= nil then
		NewModule.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		NewModule.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.experience_leaderboard ~= nil then
		NewModule.kind = {
			type = "experience_leaderboard",
			value = t.ExperienceLeaderboardInputData.jsonDecode(self.experience_leaderboard)
		}
	end
	if self.experienceLeaderboard ~= nil then
		NewModule.kind = {
			type = "experience_leaderboard",
			value = t.ExperienceLeaderboardInputData.jsonDecode(self.experienceLeaderboard)
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
	if self.image_cta_section ~= nil then
		NewModule.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		NewModule.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.config_driven_form ~= nil then
		NewModule.kind = {
			type = "config_driven_form",
			value = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.config_driven_form)
		}
	end
	if self.configDrivenForm ~= nil then
		NewModule.kind = {
			type = "config_driven_form",
			value = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.configDrivenForm)
		}
	end
	if self.sandbox_content ~= nil then
		NewModule.kind = {
			type = "sandbox_content",
			value = StructModule.Struct.jsonDecode(self.sandbox_content)
		}
	end
	if self.sandboxContent ~= nil then
		NewModule.kind = {
			type = "sandbox_content",
			value = StructModule.Struct.jsonDecode(self.sandboxContent)
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
	if self.genre_selector ~= nil then
		NewModule.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		NewModule.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
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
	if self.marketplace_offer_modal ~= nil then
		NewModule.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		NewModule.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.marketplace_item_media_header ~= nil then
		NewModule.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplace_item_media_header)
		}
	end
	if self.marketplaceItemMediaHeader ~= nil then
		NewModule.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplaceItemMediaHeader)
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
	if self.search_autocomplete ~= nil then
		NewModule.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.search_autocomplete)
		}
	end
	if self.searchAutocomplete ~= nil then
		NewModule.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.searchAutocomplete)
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
	if self.game_items_carousel ~= nil then
		NewModule.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		NewModule.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		NewModule.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		NewModule.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		NewModule.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		NewModule.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
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
	if self.pre_auth_landing_sticky_header ~= nil then
		NewModule.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		NewModule.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		NewModule.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		NewModule.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.group_announcement ~= nil then
		NewModule.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.group_announcement)
		}
	end
	if self.groupAnnouncement ~= nil then
		NewModule.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.groupAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		NewModule.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		NewModule.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		NewModule.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		NewModule.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
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

function Module5.new(p1) --[[ Line: 7412 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		badges = if p1 == nil or p1.badges == nil then {} else p1.badges,
		collection_id = if p1 == nil or p1.collection_id == nil then "" else p1.collection_id,
		collection_position = if p1 == nil or p1.collection_position == nil then "" else p1.collection_position,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module5))
end

function Module5:encode() --[[ Line: 7424 ]]
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

function Module5.decode(Buf) --[[ Line: 7461 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v581 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v581 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v581 = ProtoModule.readBuffer(Buf, v6)
				NewModule.section_title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v581 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.badges, t.BadgesGridInputData_BadgeInputData.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v581 = ProtoModule.readBuffer(Buf, v6)
				NewModule.collection_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v581 = ProtoModule.readBuffer(Buf, v6)
				NewModule.collection_position = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v581 = ProtoModule.readBuffer(Buf, v6)
				NewModule.universe_id = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v581 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v581 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 7524 ]]
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

function Module5:jsonDecode() --[[ Line: 7554 ]]
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

function Module6.new(p1) --[[ Line: 7615 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id
	}, Module6))
end

function Module6:encode() --[[ Line: 7623 ]]
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

function Module6.decode(Buf) --[[ Line: 7637 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v603 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v603 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v603 = ProtoModule.readBuffer(Buf, v7)
				NewModule.badge_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v603 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v603 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 7680 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 7690 ]]
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

function Module7.new(p1) --[[ Line: 7720 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		localized_literals = if p1 == nil or p1.localized_literals == nil then nil else p1.localized_literals,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module7))
end

function Module7:encode() --[[ Line: 7729 ]]
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

function Module7.decode(Buf) --[[ Line: 7759 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v626 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v626 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v626 = ProtoModule.readBuffer(Buf, v8)
				NewModule.badge_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v626 = ProtoModule.readBuffer(Buf, v8)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v626 = ProtoModule.readBuffer(Buf, v8)
				NewModule.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v626 = ProtoModule.readBuffer(Buf, v8)
				NewModule.creator_key = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v626 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v626 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 7817 ]]
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

function Module7:jsonDecode() --[[ Line: 7839 ]]
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

function Module8.new(p1) --[[ Line: 7893 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		info_table = if p1 == nil or p1.info_table == nil then nil else p1.info_table,
		action_module = if p1 == nil or p1.action_module == nil then nil else p1.action_module,
		overflow_menu = if p1 == nil or p1.overflow_menu == nil then nil else p1.overflow_menu
	}, Module8))
end

function Module8:encode() --[[ Line: 7903 ]]
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

function Module8.decode(Buf) --[[ Line: 7930 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v652 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v652 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v652 = ProtoModule.readBuffer(Buf, v9)
				NewModule.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v652 = ProtoModule.readBuffer(Buf, v9)
				NewModule.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v652 = ProtoModule.readBuffer(Buf, v9)
				NewModule.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v652 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v652 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 7983 ]]
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

function Module8:jsonDecode() --[[ Line: 8001 ]]
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

function Module9.new(p1) --[[ Line: 8052 ]]
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

function Module9:encode() --[[ Line: 8071 ]]
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

function Module9.decode(Buf) --[[ Line: 8117 ]]
	-- upvalues: Module9 (copy), ProtoModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v682 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v682 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.type_label = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.earned_label = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.updated_label = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.experience_label = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.rarity_label = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.won_yesterday_label = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v682 = ProtoModule.readBuffer(Buf, v10)
				NewModule.won_ever_label = buffer.tostring(Buffer7)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v682 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v682 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode() --[[ Line: 8192 ]]
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

function Module9:jsonDecode() --[[ Line: 8228 ]]
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

function Module10.new(p1) --[[ Line: 8308 ]]
	-- upvalues: Module10 (copy)
	return (setmetatable({
		share = if p1 == nil or p1.share == nil then "" else p1.share,
		report = if p1 == nil or p1.report == nil then "" else p1.report
	}, Module10))
end

function Module10:encode() --[[ Line: 8320 ]]
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

function Module10.decode(Buf) --[[ Line: 8341 ]]
	-- upvalues: Module10 (copy), ProtoModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v706 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v706 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v706 = ProtoModule.readBuffer(Buf, v11)
				NewModule.share = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v706 = ProtoModule.readBuffer(Buf, v11)
				NewModule.report = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v706 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v706 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode() --[[ Line: 8391 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function Module10:jsonDecode() --[[ Line: 8407 ]]
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

function Module11.new(p1) --[[ Line: 8439 ]]
	-- upvalues: Module11 (copy)
	return (setmetatable({
		report = if p1 == nil or p1.report == nil then "" else p1.report,
		remove = if p1 == nil or p1.remove == nil then "" else p1.remove
	}, Module11))
end

function Module11:encode() --[[ Line: 8451 ]]
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

function Module11.decode(Buf) --[[ Line: 8472 ]]
	-- upvalues: Module11 (copy), ProtoModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v725 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v725 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v725 = ProtoModule.readBuffer(Buf, v12)
				NewModule.report = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v725 = ProtoModule.readBuffer(Buf, v12)
				NewModule.remove = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v725 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v725 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode() --[[ Line: 8522 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function Module11:jsonDecode() --[[ Line: 8538 ]]
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

function Module12:new() --[[ Line: 8569 ]]
	-- upvalues: Module12 (copy)
	return (setmetatable({}, Module12))
end

function Module12:encode() --[[ Line: 8573 ]]
	local Buf = buffer.create(0)
	buffer.copy(Buf, 0, buffer.create(0), 0, 0)
	
	return Buf
end

function Module12.decode(Buf) --[[ Line: 8582 ]]
	-- upvalues: Module12 (copy), ProtoModule (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local _, Tag2
		_, Tag2, v739 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v739 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
			v13 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v739 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v739 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode() --[[ Line: 8620 ]]
	return {}
end

function Module12:jsonDecode() --[[ Line: 8626 ]]
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

function Module13.new(p1) --[[ Line: 8646 ]]
	-- upvalues: Module13 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map
	}, Module13))
end

function Module13:encode() --[[ Line: 8658 ]]
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

function Module13.decode(Buf) --[[ Line: 8712 ]]
	-- upvalues: Module13 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v778 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v778 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v778 = ProtoModule.readBuffer(Buf, v14)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v778 = ProtoModule.readBuffer(Buf, v14)
				NewModule.creator_key = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v778 = ProtoModule.readBuffer(Buf, v14)
				local DecodeResult = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(Buffer3)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v778 = ProtoModule.readBuffer(Buf, v14)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer4))
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v778 = ProtoModule.readBuffer(Buf, v14)
				local DecodeResult = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(Buffer5)
				local NewResult = t.EntryOrder.new()
				NewModule.entry_order_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v778 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v778 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode() --[[ Line: 8789 ]]
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

function Module13:jsonDecode() --[[ Line: 8827 ]]
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

function Module14.new(p1) --[[ Line: 8917 ]]
	-- upvalues: Module14 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module14))
end

function Module14:encode() --[[ Line: 8926 ]]
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

function Module14.decode(Buf) --[[ Line: 8948 ]]
	-- upvalues: Module14 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v814 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v814 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v814 = ProtoModule.readBuffer(Buf, v15)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v814 = ProtoModule.readBuffer(Buf, v15)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v814 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v814 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode() --[[ Line: 8998 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module14:jsonDecode() --[[ Line: 9014 ]]
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

function Module15.new(p1) --[[ Line: 9045 ]]
	-- upvalues: Module15 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module15))
end

function Module15:encode() --[[ Line: 9057 ]]
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

function Module15.decode(Buf) --[[ Line: 9079 ]]
	-- upvalues: Module15 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v834 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v834 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v834 = ProtoModule.readBuffer(Buf, v16)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v834 = ProtoModule.readBuffer(Buf, v16)
				NewModule.value = t.EntryOrder.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v834 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v834 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode() --[[ Line: 9129 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module15:jsonDecode() --[[ Line: 9145 ]]
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

function Module16.new(p1) --[[ Line: 9176 ]]
	-- upvalues: Module16 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module16))
end

function Module16:encode() --[[ Line: 9182 ]]
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

function Module16.decode(Buf) --[[ Line: 9198 ]]
	-- upvalues: Module16 (copy), ProtoModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v851 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v851 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v851 = ProtoModule.readBuffer(Buf, v17)
				table.insert(NewModule.items, buffer.tostring(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v851 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v851 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode() --[[ Line: 9241 ]]
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

function Module16:jsonDecode() --[[ Line: 9255 ]]
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

function Module17.new(p1) --[[ Line: 9284 ]]
	-- upvalues: Module17 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = p1 ~= nil and p1.user_owns_experience ~= nil and p1.user_owns_experience
	}, Module17))
end

function Module17:encode() --[[ Line: 9295 ]]
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

function Module17.decode(Buf) --[[ Line: 9314 ]]
	-- upvalues: Module17 (copy), ProtoModule (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v871 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v871 = ProtoModule.readVarInt(Buf, v18)
				NewModule.user_owns_experience = VarInt ~= 0
			else
				local _
				_, v871 = ProtoModule.readVarInt(Buf, v18)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v871 = ProtoModule.readBuffer(Buf, v18)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v871 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v871 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode() --[[ Line: 9362 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function Module17:jsonDecode() --[[ Line: 9376 ]]
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

function Module18.new(p1) --[[ Line: 9414 ]]
	-- upvalues: Module18 (copy)
	return (setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id
	}, Module18))
end

function Module18:encode() --[[ Line: 9422 ]]
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

function Module18.decode(Buf) --[[ Line: 9436 ]]
	-- upvalues: Module18 (copy), ProtoModule (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v888 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v888 = ProtoModule.readVarInt(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v888 = ProtoModule.readBuffer(Buf, v19)
				NewModule.media_asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v888 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v888 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode() --[[ Line: 9479 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function Module18:jsonDecode() --[[ Line: 9489 ]]
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

function Module19.new(p1) --[[ Line: 9519 ]]
	-- upvalues: Module19 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module19))
end

function Module19:encode() --[[ Line: 9527 ]]
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

function Module19.decode(Buf) --[[ Line: 9541 ]]
	-- upvalues: Module19 (copy), ProtoModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v904 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v904 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v904 = ProtoModule.readBuffer(Buf, v20)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v904 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v904 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode() --[[ Line: 9584 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module19:jsonDecode() --[[ Line: 9594 ]]
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

function Module20.new(p1) --[[ Line: 9624 ]]
	-- upvalues: Module20 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module20))
end

function Module20:encode() --[[ Line: 9633 ]]
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

function Module20.decode(Buf) --[[ Line: 9652 ]]
	-- upvalues: Module20 (copy), ProtoModule (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v922 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v922 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v922 = ProtoModule.readBuffer(Buf, v21)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v922 = ProtoModule.readBuffer(Buf, v21)
				NewModule.creator_key = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v922 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v922 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode() --[[ Line: 9700 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function Module20:jsonDecode() --[[ Line: 9714 ]]
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

function Module21.new(p1) --[[ Line: 9752 ]]
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

function Module21:encode() --[[ Line: 9774 ]]
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

function Module21.decode(Buf) --[[ Line: 9821 ]]
	-- upvalues: Module21 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v952 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				NewModule.connection_played_num_others, v952 = ProtoModule.readVarIntI32(Buf, v22)
			elseif Tag == 7 then
				NewModule.connection_played_total_count, v952 = ProtoModule.readVarIntI32(Buf, v22)
			else
				local _
				_, v952 = ProtoModule.readVarInt(Buf, v22)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v952 = ProtoModule.readBuffer(Buf, v22)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v952 = ProtoModule.readBuffer(Buf, v22)
				NewModule.root_place_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v952 = ProtoModule.readBuffer(Buf, v22)
				NewModule.connection_played_display_name = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v952 = ProtoModule.readBuffer(Buf, v22)
				NewModule.upsell_prompt = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v952 = ProtoModule.readBuffer(Buf, v22)
				table.insert(NewModule.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(Buffer5))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v952 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v952 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode() --[[ Line: 9897 ]]
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

function Module21:jsonDecode() --[[ Line: 9935 ]]
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

function Module22.new(p1) --[[ Line: 10022 ]]
	-- upvalues: Module22 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, Module22))
end

function Module22:encode() --[[ Line: 10033 ]]
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

function Module22.decode(Buf) --[[ Line: 10049 ]]
	-- upvalues: Module22 (copy), ProtoModule (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v975 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v975 = ProtoModule.readVarInt(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v975 = ProtoModule.readBuffer(Buf, v23)
				NewModule.user_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v975 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v975 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode() --[[ Line: 10094 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function Module22:jsonDecode() --[[ Line: 10106 ]]
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

function Module23.new(p1) --[[ Line: 10137 ]]
	-- upvalues: Module23 (copy)
	return (setmetatable({
		media_items = if p1 == nil or p1.media_items == nil then {} else p1.media_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, Module23))
end

function Module23:encode() --[[ Line: 10147 ]]
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

function Module23.decode(Buf) --[[ Line: 10174 ]]
	-- upvalues: Module23 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v996 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v996 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v996 = ProtoModule.readBuffer(Buf, v24)
				table.insert(NewModule.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v996 = ProtoModule.readBuffer(Buf, v24)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v996 = ProtoModule.readBuffer(Buf, v24)
				NewModule.place_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v996 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v996 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode() --[[ Line: 10227 ]]
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

function Module23:jsonDecode() --[[ Line: 10249 ]]
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

function Module24.new(p1) --[[ Line: 10303 ]]
	-- upvalues: Module24 (copy)
	return (setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id,
		moment_video_playback = if p1 == nil or p1.moment_video_playback == nil then nil else p1.moment_video_playback,
		attribution_user_id = if p1 == nil or p1.attribution_user_id == nil then "" else p1.attribution_user_id
	}, Module24))
end

function Module24:encode() --[[ Line: 10317 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.media_asset_id)
	end
	if self.moment_video_playback ~= nil then
		local EncodeResult = self.moment_video_playback:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.attribution_user_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf) --[[ Line: 10344 ]]
	-- upvalues: Module24 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1022 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1022 = ProtoModule.readVarInt(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1022 = ProtoModule.readBuffer(Buf, v25)
				NewModule.media_asset_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1022 = ProtoModule.readBuffer(Buf, v25)
				NewModule.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1022 = ProtoModule.readBuffer(Buf, v25)
				NewModule.attribution_user_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1022 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1022 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode() --[[ Line: 10400 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	if self.moment_video_playback ~= nil then
		t.momentVideoPlayback = self.moment_video_playback:jsonEncode()
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		t.attributionUserId = self.attribution_user_id
	end
	return t
end

function Module24:jsonDecode() --[[ Line: 10420 ]]
	-- upvalues: Module24 (copy), t (copy)
	local NewModule = Module24.new()
	
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	if self.moment_video_playback ~= nil then
		NewModule.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		NewModule.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.attribution_user_id ~= nil then
		NewModule.attribution_user_id = self.attribution_user_id
	end
	if self.attributionUserId ~= nil then
		NewModule.attribution_user_id = self.attributionUserId
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

function Module25.new(p1) --[[ Line: 10473 ]]
	-- upvalues: Module25 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then "" else p1.asset_id,
		asset_access_context = if p1 == nil or p1.asset_access_context == nil then "" else p1.asset_access_context
	}, Module25))
end

function Module25:encode() --[[ Line: 10487 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.asset_access_context)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module25.decode(Buf) --[[ Line: 10508 ]]
	-- upvalues: Module25 (copy), ProtoModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1042 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1042 = ProtoModule.readVarInt(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1042 = ProtoModule.readBuffer(Buf, v26)
				NewModule.asset_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1042 = ProtoModule.readBuffer(Buf, v26)
				NewModule.asset_access_context = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1042 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1042 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode() --[[ Line: 10558 ]]
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function Module25:jsonDecode() --[[ Line: 10574 ]]
	-- upvalues: Module25 (copy)
	local NewModule = Module25.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		NewModule.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		NewModule.asset_access_context = self.assetAccessContext
	end
	return NewModule
end

Module25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback = Module25
TypeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1) --[[ Line: 10613 ]]
	-- upvalues: Module26 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module26))
end

function Module26:encode() --[[ Line: 10621 ]]
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

function Module26.decode(Buf) --[[ Line: 10635 ]]
	-- upvalues: Module26 (copy), ProtoModule (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1059 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1059 = ProtoModule.readVarInt(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1059 = ProtoModule.readBuffer(Buf, v27)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1059 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1059 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode() --[[ Line: 10678 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module26:jsonDecode() --[[ Line: 10688 ]]
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
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = Module26
TypeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1) --[[ Line: 10716 ]]
	-- upvalues: Module27 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module27))
end

function Module27:encode() --[[ Line: 10724 ]]
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

function Module27.decode(Buf) --[[ Line: 10738 ]]
	-- upvalues: Module27 (copy), ProtoModule (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1075 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1075 = ProtoModule.readVarInt(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1075 = ProtoModule.readBuffer(Buf, v28)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1075 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1075 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode() --[[ Line: 10781 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module27:jsonDecode() --[[ Line: 10791 ]]
	-- upvalues: Module27 (copy)
	local NewModule = Module27.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = Module27
TypeRegistryModule.default:register(t.ExperienceStatRowInputData)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1) --[[ Line: 10819 ]]
	-- upvalues: Module28 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		has_store_items = p1 ~= nil and p1.has_store_items ~= nil and p1.has_store_items,
		has_badges = p1 ~= nil and p1.has_badges ~= nil and p1.has_badges,
		has_game_passes = p1 ~= nil and p1.has_game_passes ~= nil and p1.has_game_passes,
		community_id = if p1 == nil or p1.community_id == nil then "" else p1.community_id
	}, Module28))
end

function Module28:encode() --[[ Line: 10831 ]]
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
	if self.community_id ~= nil and self.community_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.community_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module28.decode(Buf) --[[ Line: 10865 ]]
	-- upvalues: Module28 (copy), ProtoModule (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1099 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v1099 = ProtoModule.readVarInt(Buf, v29)
				NewModule.has_store_items = VarInt ~= 0
			elseif Tag == 3 then
				local VarInt1
				VarInt1, v1099 = ProtoModule.readVarInt(Buf, v29)
				NewModule.has_badges = VarInt1 ~= 0
			elseif Tag == 4 then
				local VarInt2
				VarInt2, v1099 = ProtoModule.readVarInt(Buf, v29)
				NewModule.has_game_passes = VarInt2 ~= 0
			else
				local _
				_, v1099 = ProtoModule.readVarInt(Buf, v29)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1099 = ProtoModule.readBuffer(Buf, v29)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 5 then
				local Buffer2
				Buffer2, v1099 = ProtoModule.readBuffer(Buf, v29)
				NewModule.community_id = buffer.tostring(Buffer2)
			else
				local VarInt3, VarInt2_1 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2_1 + VarInt3
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1099 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1099 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode() --[[ Line: 10928 ]]
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
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function Module28:jsonDecode() --[[ Line: 10954 ]]
	-- upvalues: Module28 (copy)
	local NewModule = Module28.new()
	
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
	if self.community_id ~= nil then
		NewModule.community_id = self.community_id
	end
	if self.communityId ~= nil then
		NewModule.community_id = self.communityId
	end
	return NewModule
end

Module28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = Module28
TypeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1) --[[ Line: 11014 ]]
	-- upvalues: Module29 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module29))
end

function Module29:encode() --[[ Line: 11022 ]]
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

function Module29.decode(Buf) --[[ Line: 11036 ]]
	-- upvalues: Module29 (copy), ProtoModule (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1119 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1119 = ProtoModule.readVarInt(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1119 = ProtoModule.readBuffer(Buf, v30)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1119 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1119 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode() --[[ Line: 11079 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module29:jsonDecode() --[[ Line: 11089 ]]
	-- upvalues: Module29 (copy)
	local NewModule = Module29.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = Module29
TypeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1) --[[ Line: 11119 ]]
	-- upvalues: Module30 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = p1 ~= nil and p1.user_owns_experience ~= nil and p1.user_owns_experience
	}, Module30))
end

function Module30:encode() --[[ Line: 11130 ]]
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

function Module30.decode(Buf) --[[ Line: 11149 ]]
	-- upvalues: Module30 (copy), ProtoModule (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1137 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v1137 = ProtoModule.readVarInt(Buf, v31)
				NewModule.user_owns_experience = VarInt ~= 0
			else
				local _
				_, v1137 = ProtoModule.readVarInt(Buf, v31)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1137 = ProtoModule.readBuffer(Buf, v31)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1137 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1137 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode() --[[ Line: 11197 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function Module30:jsonDecode() --[[ Line: 11211 ]]
	-- upvalues: Module30 (copy)
	local NewModule = Module30.new()
	
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

Module30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = Module30
TypeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1) --[[ Line: 11247 ]]
	-- upvalues: Module31 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id,
		product_id = if p1 == nil or p1.product_id == nil then "" else p1.product_id,
		product_image_asset_id = if p1 == nil or p1.product_image_asset_id == nil then "" else p1.product_image_asset_id,
		product_name = if p1 == nil or p1.product_name == nil then "" else p1.product_name,
		variant_id = if p1 == nil or p1.variant_id == nil then "" else p1.variant_id
	}, Module31))
end

function Module31:encode() --[[ Line: 11262 ]]
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
	if self.product_id ~= nil and self.product_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.product_id)
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.product_image_asset_id)
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.product_name)
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.variant_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module31.decode(Buf) --[[ Line: 11301 ]]
	-- upvalues: Module31 (copy), ProtoModule (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1164 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1164 = ProtoModule.readVarInt(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.place_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.product_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.product_image_asset_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.product_name = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1164 = ProtoModule.readBuffer(Buf, v32)
				NewModule.variant_id = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1164 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1164 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode() --[[ Line: 11369 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		t.productId = self.product_id
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		t.productImageAssetId = self.product_image_asset_id
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		t.productName = self.product_name
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		t.variantId = self.variant_id
	end
	return t
end

function Module31:jsonDecode() --[[ Line: 11399 ]]
	-- upvalues: Module31 (copy)
	local NewModule = Module31.new()
	
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
	if self.product_id ~= nil then
		NewModule.product_id = self.product_id
	end
	if self.productId ~= nil then
		NewModule.product_id = self.productId
	end
	if self.product_image_asset_id ~= nil then
		NewModule.product_image_asset_id = self.product_image_asset_id
	end
	if self.productImageAssetId ~= nil then
		NewModule.product_image_asset_id = self.productImageAssetId
	end
	if self.product_name ~= nil then
		NewModule.product_name = self.product_name
	end
	if self.productName ~= nil then
		NewModule.product_name = self.productName
	end
	if self.variant_id ~= nil then
		NewModule.variant_id = self.variant_id
	end
	if self.variantId ~= nil then
		NewModule.variant_id = self.variantId
	end
	return NewModule
end

Module31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = Module31
TypeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local Module32 = {}
Module32.__index = Module32

function Module32.new(p1) --[[ Line: 11469 ]]
	-- upvalues: Module32 (copy)
	return (setmetatable({
		community_id = if p1 == nil or p1.community_id == nil then "" else p1.community_id
	}, Module32))
end

function Module32:encode() --[[ Line: 11477 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.community_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module32.decode(Buf) --[[ Line: 11491 ]]
	-- upvalues: Module32 (copy), ProtoModule (copy)
	local NewModule = Module32.new()
	local v33 = 0
	while v33 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1185 = ProtoModule.readTag(Buf, v33)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1185 = ProtoModule.readVarInt(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1185 = ProtoModule.readBuffer(Buf, v33)
				NewModule.community_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v33)
				v33 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1185 = ProtoModule.readFixed32(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1185 = ProtoModule.readFixed64(Buf, v33)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module32:jsonEncode() --[[ Line: 11534 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function Module32:jsonDecode() --[[ Line: 11544 ]]
	-- upvalues: Module32 (copy)
	local NewModule = Module32.new()
	
	if self.community_id ~= nil then
		NewModule.community_id = self.community_id
	end
	if self.communityId ~= nil then
		NewModule.community_id = self.communityId
	end
	return NewModule
end

Module32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = Module32
TypeRegistryModule.default:register(t.CommunitySectionInputData)
local Module33 = {}
Module33.__index = Module33

function Module33.new(p1) --[[ Line: 11572 ]]
	-- upvalues: Module33 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		friend_users = if p1 == nil or p1.friend_users == nil then {} else p1.friend_users,
		global_users = if p1 == nil or p1.global_users == nil then {} else p1.global_users,
		show_invite_view = p1 ~= nil and p1.show_invite_view ~= nil and p1.show_invite_view,
		num_friends = if p1 == nil or p1.num_friends == nil then 0 else p1.num_friends,
		global_next_cursor = if p1 == nil or p1.global_next_cursor == nil then "" else p1.global_next_cursor,
		friends_next_cursor = if p1 == nil or p1.friends_next_cursor == nil then "" else p1.friends_next_cursor,
		initial_tab = if p1 == nil or p1.initial_tab == nil then "" else p1.initial_tab,
		current_user = if p1 == nil or p1.current_user == nil then nil else p1.current_user,
		score_unit = if p1 == nil or p1.score_unit == nil then "" else p1.score_unit
	}, Module33))
end

function Module33:encode() --[[ Line: 11591 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.friend_users ~= nil and #self.friend_users > 0 then
		for _, friendUser in self.friend_users do
			local EncodeResult = friendUser:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.global_users ~= nil and #self.global_users > 0 then
		for _, globalUser in self.global_users do
			local EncodeResult = globalUser:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.show_invite_view then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.show_invite_view then 1 else 0)
	end
	if self.num_friends ~= nil and self.num_friends ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.num_friends)
	end
	if self.global_next_cursor ~= nil and self.global_next_cursor ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.global_next_cursor)
	end
	if self.friends_next_cursor ~= nil and self.friends_next_cursor ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.friends_next_cursor)
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.initial_tab)
	end
	if self.current_user ~= nil then
		local EncodeResult = self.current_user:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.score_unit ~= nil and self.score_unit ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.score_unit)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module33.decode(Buf) --[[ Line: 11657 ]]
	-- upvalues: Module33 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module33.new()
	local v34 = 0
	while v34 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1222 = ProtoModule.readTag(Buf, v34)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v1222 = ProtoModule.readVarInt(Buf, v34)
				NewModule.show_invite_view = VarInt ~= 0
			elseif Tag == 6 then
				NewModule.num_friends, v1222 = ProtoModule.readVarIntI32(Buf, v34)
			else
				local _
				_, v1222 = ProtoModule.readVarInt(Buf, v34)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1222 = ProtoModule.readBuffer(Buf, v34)
				table.insert(NewModule.friend_users, t.ExperienceLeaderboardInputData_UserItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1222 = ProtoModule.readBuffer(Buf, v34)
				table.insert(NewModule.global_users, t.ExperienceLeaderboardInputData_UserItem.decode(Buffer3))
			elseif Tag == 7 then
				local Buffer4
				Buffer4, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.global_next_cursor = buffer.tostring(Buffer4)
			elseif Tag == 8 then
				local Buffer5
				Buffer5, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.friends_next_cursor = buffer.tostring(Buffer5)
			elseif Tag == 9 then
				local Buffer6
				Buffer6, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.initial_tab = buffer.tostring(Buffer6)
			elseif Tag == 10 then
				local Buffer7
				Buffer7, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.decode(Buffer7)
			elseif Tag == 11 then
				local Buffer8
				Buffer8, v1222 = ProtoModule.readBuffer(Buf, v34)
				NewModule.score_unit = buffer.tostring(Buffer8)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v34)
				v34 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1222 = ProtoModule.readFixed32(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1222 = ProtoModule.readFixed64(Buf, v34)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module33:jsonEncode() --[[ Line: 11745 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.friend_users ~= nil and #self.friend_users > 0 then
		local FriendUsers = {}
		
		for _, friendUser in self.friend_users do
			table.insert(FriendUsers, friendUser:jsonEncode())
		end
		t.friendUsers = FriendUsers
	end
	if self.global_users ~= nil and #self.global_users > 0 then
		local GlobalUsers = {}
		
		for _, globalUser in self.global_users do
			table.insert(GlobalUsers, globalUser:jsonEncode())
		end
		t.globalUsers = GlobalUsers
	end
	if self.show_invite_view then
		t.showInviteView = self.show_invite_view
	end
	if self.num_friends ~= nil and self.num_friends ~= 0 then
		t.numFriends = self.num_friends
	end
	if self.global_next_cursor ~= nil and self.global_next_cursor ~= "" then
		t.globalNextCursor = self.global_next_cursor
	end
	if self.friends_next_cursor ~= nil and self.friends_next_cursor ~= "" then
		t.friendsNextCursor = self.friends_next_cursor
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		t.initialTab = self.initial_tab
	end
	if self.current_user ~= nil then
		t.currentUser = self.current_user:jsonEncode()
	end
	if self.score_unit ~= nil and self.score_unit ~= "" then
		t.scoreUnit = self.score_unit
	end
	return t
end

function Module33:jsonDecode() --[[ Line: 11799 ]]
	-- upvalues: Module33 (copy), t (copy)
	local NewModule = Module33.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.friend_users ~= nil then
		local Friend_users = {}
		
		for _, friendUser in self.friend_users do
			table.insert(Friend_users, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(friendUser))
		end
		NewModule.friend_users = Friend_users
	end
	if self.friendUsers ~= nil then
		local Friend_users = {}
		
		for _, friendUser1 in self.friendUsers do
			table.insert(Friend_users, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(friendUser1))
		end
		NewModule.friend_users = Friend_users
	end
	if self.global_users ~= nil then
		local Global_users = {}
		
		for _, globalUser in self.global_users do
			table.insert(Global_users, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(globalUser))
		end
		NewModule.global_users = Global_users
	end
	if self.globalUsers ~= nil then
		local Global_users = {}
		
		for _, globalUser1 in self.globalUsers do
			table.insert(Global_users, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(globalUser1))
		end
		NewModule.global_users = Global_users
	end
	if self.show_invite_view ~= nil then
		NewModule.show_invite_view = self.show_invite_view
	end
	if self.showInviteView ~= nil then
		NewModule.show_invite_view = self.showInviteView
	end
	if self.num_friends ~= nil then
		NewModule.num_friends = self.num_friends
	end
	if self.numFriends ~= nil then
		NewModule.num_friends = self.numFriends
	end
	if self.global_next_cursor ~= nil then
		NewModule.global_next_cursor = self.global_next_cursor
	end
	if self.globalNextCursor ~= nil then
		NewModule.global_next_cursor = self.globalNextCursor
	end
	if self.friends_next_cursor ~= nil then
		NewModule.friends_next_cursor = self.friends_next_cursor
	end
	if self.friendsNextCursor ~= nil then
		NewModule.friends_next_cursor = self.friendsNextCursor
	end
	if self.initial_tab ~= nil then
		NewModule.initial_tab = self.initial_tab
	end
	if self.initialTab ~= nil then
		NewModule.initial_tab = self.initialTab
	end
	if self.current_user ~= nil then
		NewModule.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.jsonDecode(self.current_user)
	end
	if self.currentUser ~= nil then
		NewModule.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.jsonDecode(self.currentUser)
	end
	if self.score_unit ~= nil then
		NewModule.score_unit = self.score_unit
	end
	if self.scoreUnit ~= nil then
		NewModule.score_unit = self.scoreUnit
	end
	return NewModule
end

Module33.descriptor = {
	name = "ExperienceLeaderboardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceLeaderboardInputData"
}
t.ExperienceLeaderboardInputData = Module33
TypeRegistryModule.default:register(t.ExperienceLeaderboardInputData)
local Module34 = {}
Module34.__index = Module34

function Module34.new(p1) --[[ Line: 11919 ]]
	-- upvalues: Module34 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		stats_id = if p1 == nil or p1.stats_id == nil then "" else p1.stats_id
	}, Module34))
end

function Module34:encode() --[[ Line: 11928 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	if self.stats_id ~= nil and self.stats_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.stats_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module34.decode(Buf) --[[ Line: 11947 ]]
	-- upvalues: Module34 (copy), ProtoModule (copy)
	local NewModule = Module34.new()
	local v35 = 0
	while v35 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1254 = ProtoModule.readTag(Buf, v35)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1254 = ProtoModule.readVarInt(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1254 = ProtoModule.readBuffer(Buf, v35)
				NewModule.user_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1254 = ProtoModule.readBuffer(Buf, v35)
				NewModule.stats_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v35)
				v35 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1254 = ProtoModule.readFixed32(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1254 = ProtoModule.readFixed64(Buf, v35)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module34:jsonEncode() --[[ Line: 11995 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.stats_id ~= nil and self.stats_id ~= "" then
		t.statsId = self.stats_id
	end
	return t
end

function Module34:jsonDecode() --[[ Line: 12009 ]]
	-- upvalues: Module34 (copy)
	local NewModule = Module34.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.stats_id ~= nil then
		NewModule.stats_id = self.stats_id
	end
	if self.statsId ~= nil then
		NewModule.stats_id = self.statsId
	end
	return NewModule
end

Module34.descriptor = {
	name = "ExperienceLeaderboardInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.ExperienceLeaderboardInputData_UserItem = Module34
TypeRegistryModule.default:register(t.ExperienceLeaderboardInputData_UserItem)
local Module35 = {}
Module35.__index = Module35

function Module35.new(p1) --[[ Line: 12047 ]]
	-- upvalues: Module35 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		friends_stats_id = if p1 == nil or p1.friends_stats_id == nil then "" else p1.friends_stats_id,
		global_stats_id = if p1 == nil or p1.global_stats_id == nil then "" else p1.global_stats_id
	}, Module35))
end

function Module35:encode() --[[ Line: 12057 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	if self.friends_stats_id ~= nil and self.friends_stats_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.friends_stats_id)
	end
	if self.global_stats_id ~= nil and self.global_stats_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.global_stats_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module35.decode(Buf) --[[ Line: 12083 ]]
	-- upvalues: Module35 (copy), ProtoModule (copy)
	local NewModule = Module35.new()
	local v36 = 0
	while v36 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1275 = ProtoModule.readTag(Buf, v36)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1275 = ProtoModule.readVarInt(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1275 = ProtoModule.readBuffer(Buf, v36)
				NewModule.user_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1275 = ProtoModule.readBuffer(Buf, v36)
				NewModule.friends_stats_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1275 = ProtoModule.readBuffer(Buf, v36)
				NewModule.global_stats_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v36)
				v36 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1275 = ProtoModule.readFixed32(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1275 = ProtoModule.readFixed64(Buf, v36)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module35:jsonEncode() --[[ Line: 12138 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.friends_stats_id ~= nil and self.friends_stats_id ~= "" then
		t.friendsStatsId = self.friends_stats_id
	end
	if self.global_stats_id ~= nil and self.global_stats_id ~= "" then
		t.globalStatsId = self.global_stats_id
	end
	return t
end

function Module35:jsonDecode() --[[ Line: 12158 ]]
	-- upvalues: Module35 (copy)
	local NewModule = Module35.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.friends_stats_id ~= nil then
		NewModule.friends_stats_id = self.friends_stats_id
	end
	if self.friendsStatsId ~= nil then
		NewModule.friends_stats_id = self.friendsStatsId
	end
	if self.global_stats_id ~= nil then
		NewModule.global_stats_id = self.global_stats_id
	end
	if self.globalStatsId ~= nil then
		NewModule.global_stats_id = self.globalStatsId
	end
	return NewModule
end

Module35.descriptor = {
	name = "ExperienceLeaderboardInputData_CurrentUserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CurrentUserItem"
}
t.ExperienceLeaderboardInputData_CurrentUserItem = Module35
TypeRegistryModule.default:register(t.ExperienceLeaderboardInputData_CurrentUserItem)
local Module36 = {}
Module36.__index = Module36

function Module36.new(p1) --[[ Line: 12204 ]]
	-- upvalues: Module36 (copy)
	return (setmetatable({
		social_link_items = if p1 == nil or p1.social_link_items == nil then {} else p1.social_link_items
	}, Module36))
end

function Module36:encode() --[[ Line: 12210 ]]
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

function Module36.decode(Buf) --[[ Line: 12227 ]]
	-- upvalues: Module36 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module36.new()
	local v37 = 0
	while v37 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1294 = ProtoModule.readTag(Buf, v37)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1294 = ProtoModule.readVarInt(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1294 = ProtoModule.readBuffer(Buf, v37)
				table.insert(NewModule.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v37)
				v37 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1294 = ProtoModule.readFixed32(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1294 = ProtoModule.readFixed64(Buf, v37)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module36:jsonEncode() --[[ Line: 12270 ]]
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

function Module36:jsonDecode() --[[ Line: 12284 ]]
	-- upvalues: Module36 (copy), t (copy)
	local NewModule = Module36.new()
	
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

Module36.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = Module36
TypeRegistryModule.default:register(t.SocialLinkRowInputData)
local Module37 = {}
Module37.__index = Module37

function Module37.new(p1) --[[ Line: 12322 ]]
	-- upvalues: Module37 (copy)
	return (setmetatable({
		social_link_id = if p1 == nil or p1.social_link_id == nil then "" else p1.social_link_id
	}, Module37))
end

function Module37:encode() --[[ Line: 12330 ]]
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

function Module37.decode(Buf) --[[ Line: 12344 ]]
	-- upvalues: Module37 (copy), ProtoModule (copy)
	local NewModule = Module37.new()
	local v38 = 0
	while v38 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1313 = ProtoModule.readTag(Buf, v38)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1313 = ProtoModule.readVarInt(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1313 = ProtoModule.readBuffer(Buf, v38)
				NewModule.social_link_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v38)
				v38 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1313 = ProtoModule.readFixed32(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1313 = ProtoModule.readFixed64(Buf, v38)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module37:jsonEncode() --[[ Line: 12387 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function Module37:jsonDecode() --[[ Line: 12397 ]]
	-- upvalues: Module37 (copy)
	local NewModule = Module37.new()
	
	if self.social_link_id ~= nil then
		NewModule.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		NewModule.social_link_id = self.socialLinkId
	end
	return NewModule
end

Module37.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = Module37
TypeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local Module38 = {}
Module38.__index = Module38

function Module38.new(p1) --[[ Line: 12427 ]]
	-- upvalues: Module38 (copy)
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
		pool_id = if p1 == nil or p1.pool_id == nil then nil else p1.pool_id,
		has_emphasized_tile = p1 ~= nil and p1.has_emphasized_tile ~= nil and p1.has_emphasized_tile,
		tile_activation_mode = if p1 == nil or p1.tile_activation_mode == nil then "" else p1.tile_activation_mode,
		initial_feed_visible_rows = if p1 == nil or p1.initial_feed_visible_rows == nil then nil else p1.initial_feed_visible_rows,
		visible_rows_per_reveal = if p1 == nil or p1.visible_rows_per_reveal == nil then nil else p1.visible_rows_per_reveal,
		sponsored_user_cohort = if p1 == nil or p1.sponsored_user_cohort == nil then nil else p1.sponsored_user_cohort,
		anchor_tag = if p1 == nil or p1.anchor_tag == nil then nil else p1.anchor_tag,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then nil else p1.collection_item_size,
		sort_sub_id = if p1 == nil or p1.sort_sub_id == nil then nil else p1.sort_sub_id,
		enable_game_tile_videos = p1 ~= nil and p1.enable_game_tile_videos ~= nil and p1.enable_game_tile_videos,
		continues_previous_section = if p1 == nil or p1.continues_previous_section == nil then nil else p1.continues_previous_section
	}, Module38))
end

function Module38:encode() --[[ Line: 12473 ]]
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
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.subtitle)
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.info_text)
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.subtitle_link_path)
	end
	if self.is_placeholder ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, if self.is_placeholder then 1 else 0)
	end
	if self.primary_sort_id ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult13, WriteTagResult2_12, self.primary_sort_id)
	end
	if self.applied_filters ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.applied_filters)
	end
	if self.pool_id ~= nil then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult15, WriteTagResult2_14, self.pool_id)
	end
	if self.has_emphasized_tile then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult16, WriteTagResult2_15, if self.has_emphasized_tile then 1 else 0)
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult19, WriteTagResult2_18, self.tile_activation_mode)
	end
	if self.initial_feed_visible_rows ~= nil then
		local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult21, WriteTagResult2_20, self.initial_feed_visible_rows)
	end
	if self.visible_rows_per_reveal ~= nil then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult18, WriteTagResult2_17, self.visible_rows_per_reveal)
	end
	if self.sponsored_user_cohort ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.sponsored_user_cohort)
	end
	if self.anchor_tag ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult17, WriteTagResult2_16, self.anchor_tag)
	end
	if self.collection_item_size ~= nil then
		local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult22, WriteTagResult2_21, self.collection_item_size)
	end
	if self.sort_sub_id ~= nil then
		local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult20, WriteTagResult2_19, self.sort_sub_id)
	end
	if self.enable_game_tile_videos then
		local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult23, WriteTagResult2_22, if self.enable_game_tile_videos then 1 else 0)
	end
	if self.continues_previous_section ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, if self.continues_previous_section then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module38.decode(Buf) --[[ Line: 12600 ]]
	-- upvalues: Module38 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module38.new()
	local v39 = 0
	while v39 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1374 = ProtoModule.readTag(Buf, v39)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.secondary_sort_id, v1374 = ProtoModule.readVarIntI32(Buf, v39)
			elseif Tag == 6 then
				NewModule.max_visible_rows, v1374 = ProtoModule.readVarIntI32(Buf, v39)
			elseif Tag == 10 then
				local VarInt1
				VarInt1, v1374 = ProtoModule.readVarInt(Buf, v39)
				NewModule.is_placeholder = VarInt1 ~= 0
			elseif Tag == 11 then
				NewModule.primary_sort_id, v1374 = ProtoModule.readVarIntI32(Buf, v39)
			elseif Tag == 14 then
				local VarInt3
				VarInt3, v1374 = ProtoModule.readVarInt(Buf, v39)
				NewModule.has_emphasized_tile = VarInt3 ~= 0
			elseif Tag == 16 then
				NewModule.initial_feed_visible_rows, v1374 = ProtoModule.readVarIntI32(Buf, v39)
			elseif Tag == 17 then
				NewModule.visible_rows_per_reveal, v1374 = ProtoModule.readVarIntI32(Buf, v39)
			elseif Tag == 22 then
				local VarInt4
				VarInt4, v1374 = ProtoModule.readVarInt(Buf, v39)
				NewModule.enable_game_tile_videos = VarInt4 ~= 0
			elseif Tag == 23 then
				local VarInt5
				VarInt5, v1374 = ProtoModule.readVarInt(Buf, v39)
				NewModule.continues_previous_section = VarInt5 ~= 0
			else
				local _
				_, v1374 = ProtoModule.readVarInt(Buf, v39)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer2
				Buffer2, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 2 then
				local Buffer3
				Buffer3, v1374 = ProtoModule.readBuffer(Buf, v39)
				table.insert(NewModule.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(Buffer3))
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.next_page_token = buffer.tostring(Buffer4)
			elseif Tag == 4 then
				local Buffer5
				Buffer5, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.sort_id = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.subtitle = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.info_text = buffer.tostring(Buffer7)
			elseif Tag == 9 then
				local Buffer8
				Buffer8, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.subtitle_link_path = buffer.tostring(Buffer8)
			elseif Tag == 12 then
				local Buffer9
				Buffer9, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.applied_filters = buffer.tostring(Buffer9)
			elseif Tag == 13 then
				local Buffer10
				Buffer10, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.pool_id = buffer.tostring(Buffer10)
			elseif Tag == 15 then
				local Buffer11
				Buffer11, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.tile_activation_mode = buffer.tostring(Buffer11)
			elseif Tag == 18 then
				local Buffer12
				Buffer12, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.sponsored_user_cohort = buffer.tostring(Buffer12)
			elseif Tag == 19 then
				local Buffer13
				Buffer13, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.anchor_tag = buffer.tostring(Buffer13)
			elseif Tag == 20 then
				local Buffer14
				Buffer14, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.collection_item_size = buffer.tostring(Buffer14)
			elseif Tag == 21 then
				local Buffer1
				Buffer1, v1374 = ProtoModule.readBuffer(Buf, v39)
				NewModule.sort_sub_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v39)
				v39 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1374 = ProtoModule.readFixed32(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1374 = ProtoModule.readFixed64(Buf, v39)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module38:jsonEncode() --[[ Line: 12753 ]]
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
	if self.has_emphasized_tile then
		t.hasEmphasizedTile = self.has_emphasized_tile
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		t.tileActivationMode = self.tile_activation_mode
	end
	if self.initial_feed_visible_rows ~= nil then
		t.initialFeedVisibleRows = self.initial_feed_visible_rows
	end
	if self.visible_rows_per_reveal ~= nil then
		t.visibleRowsPerReveal = self.visible_rows_per_reveal
	end
	if self.sponsored_user_cohort ~= nil then
		t.sponsoredUserCohort = self.sponsored_user_cohort
	end
	if self.anchor_tag ~= nil then
		t.anchorTag = self.anchor_tag
	end
	if self.collection_item_size ~= nil then
		t.collectionItemSize = self.collection_item_size
	end
	if self.sort_sub_id ~= nil then
		t.sortSubId = self.sort_sub_id
	end
	if self.enable_game_tile_videos then
		t.enableGameTileVideos = self.enable_game_tile_videos
	end
	if self.continues_previous_section ~= nil then
		t.continuesPreviousSection = self.continues_previous_section
	end
	return t
end

function Module38:jsonDecode() --[[ Line: 12855 ]]
	-- upvalues: Module38 (copy), t (copy)
	local NewModule = Module38.new()
	
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
	if self.has_emphasized_tile ~= nil then
		NewModule.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		NewModule.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		NewModule.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		NewModule.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		NewModule.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		NewModule.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		NewModule.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		NewModule.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		NewModule.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		NewModule.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		NewModule.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		NewModule.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		NewModule.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		NewModule.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		NewModule.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		NewModule.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		NewModule.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		NewModule.enable_game_tile_videos = self.enableGameTileVideos
	end
	if self.continues_previous_section ~= nil then
		NewModule.continues_previous_section = self.continues_previous_section
	end
	if self.continuesPreviousSection ~= nil then
		NewModule.continues_previous_section = self.continuesPreviousSection
	end
	return NewModule
end

Module38.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = Module38
TypeRegistryModule.default:register(t.ExperienceCarouselInputData)
local Module39 = {}
Module39.__index = Module39

function Module39.new(p1) --[[ Line: 13061 ]]
	-- upvalues: Module39 (copy)
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
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		rank = if p1 == nil or p1.rank == nil then nil else p1.rank,
		payer_name = if p1 == nil or p1.payer_name == nil then nil else p1.payer_name,
		logo_asset_id = if p1 == nil or p1.logo_asset_id == nil then nil else p1.logo_asset_id,
		logo_aspect_ratio = if p1 == nil or p1.logo_aspect_ratio == nil then nil else p1.logo_aspect_ratio,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		launch_data = if p1 == nil or p1.launch_data == nil then nil else p1.launch_data,
		tile_variant = if p1 == nil or p1.tile_variant == nil then nil else p1.tile_variant,
		cta_text = if p1 == nil or p1.cta_text == nil then nil else p1.cta_text,
		badge_analytics_id = if p1 == nil or p1.badge_analytics_id == nil then nil else p1.badge_analytics_id,
		game_items = if p1 == nil or p1.game_items == nil then {} else p1.game_items,
		attribution_thumbnail_asset_id = if p1 == nil or p1.attribution_thumbnail_asset_id == nil then nil else p1.attribution_thumbnail_asset_id,
		game_items_compact = if p1 == nil or p1.game_items_compact == nil then {} else p1.game_items_compact,
		source_sort_id = if p1 == nil or p1.source_sort_id == nil then nil else p1.source_sort_id,
		new_game_enum = if p1 == nil or p1.new_game_enum == nil then nil else p1.new_game_enum,
		moment_video_playback = if p1 == nil or p1.moment_video_playback == nil then nil else p1.moment_video_playback,
		thumbnail_list_id = if p1 == nil or p1.thumbnail_list_id == nil then nil else p1.thumbnail_list_id,
		sponsored_game_preview_video_eligible = if p1 == nil or p1.sponsored_game_preview_video_eligible == nil then nil else p1.sponsored_game_preview_video_eligible
	}, Module39))
end

function Module39:encode() --[[ Line: 13104 ]]
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
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult13, WriteTagResult2_12, self.player_count)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult15, WriteTagResult2_14, self.creator_key)
	end
	if self.rank ~= nil then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult16, WriteTagResult2_15, self.rank)
	end
	if self.payer_name ~= nil then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult18, WriteTagResult2_17, self.payer_name)
	end
	if self.logo_asset_id ~= nil then
		local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult20, WriteTagResult2_19, self.logo_asset_id)
	end
	if self.logo_aspect_ratio ~= nil then
		local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult22, WriteTagResult2_21, self.logo_aspect_ratio)
	end
	if self.place_id ~= nil then
		local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult23, WriteTagResult2_22, self.place_id)
	end
	if self.launch_data ~= nil then
		local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult21, WriteTagResult2_20, self.launch_data)
	end
	if self.tile_variant ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.tile_variant)
	end
	if self.cta_text ~= nil then
		local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult24, WriteTagResult2_23, self.cta_text)
	end
	if self.badge_analytics_id ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult17, WriteTagResult2_16, self.badge_analytics_id)
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for _, gameItem in self.game_items do
			local EncodeResult = gameItem:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.attribution_thumbnail_asset_id)
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for _, value in self.game_items_compact do
			local EncodeResult = value:encode()
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult19, WriteTagResult2_18, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.source_sort_id ~= nil then
		local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult25, WriteTagResult2_24, self.source_sort_id)
	end
	if self.new_game_enum ~= nil then
		local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult26, WriteTagResult2_25, self.new_game_enum)
	end
	if self.moment_video_playback ~= nil then
		local EncodeResult = self.moment_video_playback:encode()
		local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, EncodeResult, buffer.len(EncodeResult))
	end
	if self.thumbnail_list_id ~= nil then
		local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult28, WriteTagResult2_27, self.thumbnail_list_id)
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult29, WriteTagResult2_28, if self.sponsored_game_preview_video_eligible then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module39.decode(Buf) --[[ Line: 13268 ]]
	-- upvalues: Module39 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module39.new()
	local v40 = 0
	while v40 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1469 = ProtoModule.readTag(Buf, v40)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v1469 = ProtoModule.readVarInt(Buf, v40)
				NewModule.is_sponsored = VarInt ~= 0
			elseif Tag == 5 then
				local VarInt1
				VarInt1, v1469 = ProtoModule.readVarInt(Buf, v40)
				NewModule.is_content_locked = VarInt1 ~= 0
			elseif Tag == 11 then
				NewModule.player_count, v1469 = ProtoModule.readVarIntI64(Buf, v40)
			elseif Tag == 13 then
				NewModule.rank, v1469 = ProtoModule.readVarIntI32(Buf, v40)
			elseif Tag == 26 then
				NewModule.new_game_enum, v1469 = ProtoModule.readVarIntI32(Buf, v40)
			elseif Tag == 29 then
				local VarInt2
				VarInt2, v1469 = ProtoModule.readVarInt(Buf, v40)
				NewModule.sponsored_game_preview_video_eligible = VarInt2 ~= 0
			else
				local _
				_, v1469 = ProtoModule.readVarInt(Buf, v40)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.roblox_component = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.native_ad_data = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.image_asset_id = buffer.tostring(Buffer6)
			elseif Tag == 9 then
				local Buffer7
				Buffer7, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.video_asset_id = buffer.tostring(Buffer7)
			elseif Tag == 10 then
				local Buffer8
				Buffer8, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.badge_text = buffer.tostring(Buffer8)
			elseif Tag == 12 then
				local Buffer9
				Buffer9, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.creator_key = buffer.tostring(Buffer9)
			elseif Tag == 14 then
				local Buffer10
				Buffer10, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.payer_name = buffer.tostring(Buffer10)
			elseif Tag == 15 then
				local Buffer11
				Buffer11, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.logo_asset_id = buffer.tostring(Buffer11)
			elseif Tag == 17 then
				local Buffer12
				Buffer12, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.place_id = buffer.tostring(Buffer12)
			elseif Tag == 18 then
				local Buffer13
				Buffer13, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.launch_data = buffer.tostring(Buffer13)
			elseif Tag == 19 then
				local Buffer14
				Buffer14, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.tile_variant = buffer.tostring(Buffer14)
			elseif Tag == 20 then
				local Buffer15
				Buffer15, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.cta_text = buffer.tostring(Buffer15)
			elseif Tag == 21 then
				local Buffer16
				Buffer16, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.badge_analytics_id = buffer.tostring(Buffer16)
			elseif Tag == 22 then
				local Buffer17
				Buffer17, v1469 = ProtoModule.readBuffer(Buf, v40)
				table.insert(NewModule.game_items, t.GameItemInputData.decode(Buffer17))
			elseif Tag == 23 then
				local Buffer18
				Buffer18, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.attribution_thumbnail_asset_id = buffer.tostring(Buffer18)
			elseif Tag == 24 then
				local Buffer19
				Buffer19, v1469 = ProtoModule.readBuffer(Buf, v40)
				table.insert(NewModule.game_items_compact, t.GameItemInputData.decode(Buffer19))
			elseif Tag == 25 then
				local Buffer20
				Buffer20, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.source_sort_id = buffer.tostring(Buffer20)
			elseif Tag == 27 then
				local Buffer21
				Buffer21, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(Buffer21)
			elseif Tag == 28 then
				local Buffer22
				Buffer22, v1469 = ProtoModule.readBuffer(Buf, v40)
				NewModule.thumbnail_list_id = buffer.tostring(Buffer22)
			else
				local VarInt3, VarInt2_1 = ProtoModule.readVarInt(Buf, v40)
				v40 = VarInt2_1 + VarInt3
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1469 = ProtoModule.readFixed32(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 16 then
				NewModule.logo_aspect_ratio, v1469 = ProtoModule.readDouble(Buf, v40)
			else
				local _
				_, v1469 = ProtoModule.readFixed64(Buf, v40)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module39:jsonEncode() --[[ Line: 13454 ]]
	-- upvalues: ProtoModule (copy)
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
	if self.rank ~= nil then
		t.rank = self.rank
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = ProtoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id
	end
	if self.launch_data ~= nil then
		t.launchData = self.launch_data
	end
	if self.tile_variant ~= nil then
		t.tileVariant = self.tile_variant
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		local GameItems = {}
		
		for _, gameItem in self.game_items do
			table.insert(GameItems, gameItem:jsonEncode())
		end
		t.gameItems = GameItems
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		t.attributionThumbnailAssetId = self.attribution_thumbnail_asset_id
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		local GameItemsCompact = {}
		
		for _, value in self.game_items_compact do
			table.insert(GameItemsCompact, value:jsonEncode())
		end
		t.gameItemsCompact = GameItemsCompact
	end
	if self.source_sort_id ~= nil then
		t.sourceSortId = self.source_sort_id
	end
	if self.new_game_enum ~= nil then
		t.newGameEnum = self.new_game_enum
	end
	if self.moment_video_playback ~= nil then
		t.momentVideoPlayback = self.moment_video_playback:jsonEncode()
	end
	if self.thumbnail_list_id ~= nil then
		t.thumbnailListId = self.thumbnail_list_id
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		t.sponsoredGamePreviewVideoEligible = self.sponsored_game_preview_video_eligible
	end
	return t
end

function Module39:jsonDecode() --[[ Line: 13586 ]]
	-- upvalues: Module39 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module39.new()
	
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
	if self.rank ~= nil then
		NewModule.rank = self.rank
	end
	if self.payer_name ~= nil then
		NewModule.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		NewModule.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		NewModule.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		NewModule.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		NewModule.logo_aspect_ratio = ProtoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		NewModule.logo_aspect_ratio = ProtoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		NewModule.place_id = self.place_id
	end
	if self.placeId ~= nil then
		NewModule.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		NewModule.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		NewModule.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		NewModule.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		NewModule.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		NewModule.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		NewModule.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		NewModule.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		NewModule.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local Game_items = {}
		
		for _, gameItem in self.game_items do
			table.insert(Game_items, t.GameItemInputData.jsonDecode(gameItem))
		end
		NewModule.game_items = Game_items
	end
	if self.gameItems ~= nil then
		local Game_items = {}
		
		for _, gameItem1 in self.gameItems do
			table.insert(Game_items, t.GameItemInputData.jsonDecode(gameItem1))
		end
		NewModule.game_items = Game_items
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		NewModule.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		NewModule.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local Game_items_compact = {}
		
		for _, value in self.game_items_compact do
			table.insert(Game_items_compact, t.GameItemInputData.jsonDecode(value))
		end
		NewModule.game_items_compact = Game_items_compact
	end
	if self.gameItemsCompact ~= nil then
		local Game_items_compact = {}
		
		for _, value1 in self.gameItemsCompact do
			table.insert(Game_items_compact, t.GameItemInputData.jsonDecode(value1))
		end
		NewModule.game_items_compact = Game_items_compact
	end
	if self.source_sort_id ~= nil then
		NewModule.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		NewModule.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		NewModule.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		NewModule.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		NewModule.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		NewModule.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.thumbnail_list_id ~= nil then
		NewModule.thumbnail_list_id = self.thumbnail_list_id
	end
	if self.thumbnailListId ~= nil then
		NewModule.thumbnail_list_id = self.thumbnailListId
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		NewModule.sponsored_game_preview_video_eligible = self.sponsored_game_preview_video_eligible
	end
	if self.sponsoredGamePreviewVideoEligible ~= nil then
		NewModule.sponsored_game_preview_video_eligible = self.sponsoredGamePreviewVideoEligible
	end
	return NewModule
end

Module39.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = Module39
TypeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local Module40 = {}
Module40.__index = Module40

function Module40.new(p1) --[[ Line: 13855 ]]
	-- upvalues: Module40 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then "" else p1.asset_id,
		asset_access_context = if p1 == nil or p1.asset_access_context == nil then "" else p1.asset_access_context
	}, Module40))
end

function Module40:encode() --[[ Line: 13869 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.asset_access_context)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module40.decode(Buf) --[[ Line: 13890 ]]
	-- upvalues: Module40 (copy), ProtoModule (copy)
	local NewModule = Module40.new()
	local v41 = 0
	while v41 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1517 = ProtoModule.readTag(Buf, v41)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1517 = ProtoModule.readVarInt(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1517 = ProtoModule.readBuffer(Buf, v41)
				NewModule.asset_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1517 = ProtoModule.readBuffer(Buf, v41)
				NewModule.asset_access_context = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v41)
				v41 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1517 = ProtoModule.readFixed32(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1517 = ProtoModule.readFixed64(Buf, v41)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module40:jsonEncode() --[[ Line: 13940 ]]
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function Module40:jsonDecode() --[[ Line: 13956 ]]
	-- upvalues: Module40 (copy)
	local NewModule = Module40.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		NewModule.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		NewModule.asset_access_context = self.assetAccessContext
	end
	return NewModule
end

Module40.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = Module40
TypeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback)
local Module41 = {}
Module41.__index = Module41

function Module41.new(p1) --[[ Line: 13995 ]]
	-- upvalues: Module41 (copy)
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
	}, Module41))
end

function Module41:encode() --[[ Line: 14011 ]]
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

function Module41.decode(Buf) --[[ Line: 14078 ]]
	-- upvalues: Module41 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module41.new()
	local v42 = 0
	while v42 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1555 = ProtoModule.readTag(Buf, v42)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.secondary_sort_id, v1555 = ProtoModule.readVarIntI32(Buf, v42)
			elseif Tag == 9 then
				local VarInt
				VarInt, v1555 = ProtoModule.readVarInt(Buf, v42)
				NewModule.is_placeholder = VarInt ~= 0
			elseif Tag == 10 then
				NewModule.primary_sort_id, v1555 = ProtoModule.readVarIntI32(Buf, v42)
			else
				local _
				_, v1555 = ProtoModule.readVarInt(Buf, v42)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1555 = ProtoModule.readBuffer(Buf, v42)
				table.insert(NewModule.song_items, t.SongCarouselInputData_SongItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.next_page_token = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.sort_id = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.info_text = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.subtitle_link_path = buffer.tostring(Buffer7)
			elseif Tag == 11 then
				local Buffer8
				Buffer8, v1555 = ProtoModule.readBuffer(Buf, v42)
				NewModule.applied_filters = buffer.tostring(Buffer8)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v42)
				v42 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1555 = ProtoModule.readFixed32(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1555 = ProtoModule.readFixed64(Buf, v42)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module41:jsonEncode() --[[ Line: 14171 ]]
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

function Module41:jsonDecode() --[[ Line: 14225 ]]
	-- upvalues: Module41 (copy), t (copy)
	local NewModule = Module41.new()
	
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

Module41.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = Module41
TypeRegistryModule.default:register(t.SongCarouselInputData)
local Module42 = {}
Module42.__index = Module42

function Module42.new(p1) --[[ Line: 14335 ]]
	-- upvalues: Module42 (copy)
	return (setmetatable({
		song_id = if p1 == nil or p1.song_id == nil then "" else p1.song_id
	}, Module42))
end

function Module42:encode() --[[ Line: 14343 ]]
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

function Module42.decode(Buf) --[[ Line: 14357 ]]
	-- upvalues: Module42 (copy), ProtoModule (copy)
	local NewModule = Module42.new()
	local v43 = 0
	while v43 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1582 = ProtoModule.readTag(Buf, v43)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1582 = ProtoModule.readVarInt(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1582 = ProtoModule.readBuffer(Buf, v43)
				NewModule.song_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v43)
				v43 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1582 = ProtoModule.readFixed32(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1582 = ProtoModule.readFixed64(Buf, v43)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module42:jsonEncode() --[[ Line: 14400 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function Module42:jsonDecode() --[[ Line: 14410 ]]
	-- upvalues: Module42 (copy)
	local NewModule = Module42.new()
	
	if self.song_id ~= nil then
		NewModule.song_id = self.song_id
	end
	if self.songId ~= nil then
		NewModule.song_id = self.songId
	end
	return NewModule
end

Module42.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = Module42
TypeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local Module43 = {}
Module43.__index = Module43

function Module43.new(p1) --[[ Line: 14438 ]]
	-- upvalues: Module43 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		event_items = if p1 == nil or p1.event_items == nil then {} else p1.event_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, Module43))
end

function Module43:encode() --[[ Line: 14449 ]]
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

function Module43.decode(Buf) --[[ Line: 14491 ]]
	-- upvalues: Module43 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module43.new()
	local v44 = 0
	while v44 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1609 = ProtoModule.readTag(Buf, v44)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1609 = ProtoModule.readVarInt(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1609 = ProtoModule.readBuffer(Buf, v44)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1609 = ProtoModule.readBuffer(Buf, v44)
				table.insert(NewModule.event_items, t.EventsCarouselInputData_EventItem.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1609 = ProtoModule.readBuffer(Buf, v44)
				NewModule.universe_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1609 = ProtoModule.readBuffer(Buf, v44)
				NewModule.sort_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1609 = ProtoModule.readBuffer(Buf, v44)
				NewModule.subtitle = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1609 = ProtoModule.readBuffer(Buf, v44)
				NewModule.info_text = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v44)
				v44 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1609 = ProtoModule.readFixed32(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1609 = ProtoModule.readFixed64(Buf, v44)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module43:jsonEncode() --[[ Line: 14559 ]]
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

function Module43:jsonDecode() --[[ Line: 14593 ]]
	-- upvalues: Module43 (copy), t (copy)
	local NewModule = Module43.new()
	
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

Module43.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = Module43
TypeRegistryModule.default:register(t.EventsCarouselInputData)
local Module44 = {}
Module44.__index = Module44

function Module44.new(p1) --[[ Line: 14663 ]]
	-- upvalues: Module44 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module44))
end

function Module44:encode() --[[ Line: 14671 ]]
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

function Module44.decode(Buf) --[[ Line: 14685 ]]
	-- upvalues: Module44 (copy), ProtoModule (copy)
	local NewModule = Module44.new()
	local v45 = 0
	while v45 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1633 = ProtoModule.readTag(Buf, v45)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1633 = ProtoModule.readVarInt(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1633 = ProtoModule.readBuffer(Buf, v45)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v45)
				v45 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1633 = ProtoModule.readFixed32(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1633 = ProtoModule.readFixed64(Buf, v45)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module44:jsonEncode() --[[ Line: 14728 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module44:jsonDecode() --[[ Line: 14738 ]]
	-- upvalues: Module44 (copy)
	local NewModule = Module44.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module44.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = Module44
TypeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local Module45 = {}
Module45.__index = Module45

function Module45.new(p1) --[[ Line: 14768 ]]
	-- upvalues: Module45 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		pill_tabs = if p1 == nil or p1.pill_tabs == nil then nil else p1.pill_tabs
	}, Module45))
end

function Module45:encode() --[[ Line: 14778 ]]
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
	if self.pill_tabs ~= nil then
		local EncodeResult = self.pill_tabs:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module45.decode(Buf) --[[ Line: 14824 ]]
	-- upvalues: Module45 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module45.new()
	local v46 = 0
	while v46 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1667 = ProtoModule.readTag(Buf, v46)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1667 = ProtoModule.readVarInt(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1667 = ProtoModule.readBuffer(Buf, v46)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1667 = ProtoModule.readBuffer(Buf, v46)
				local DecodeResult = t.DevStoreFeedInputData_EntryMapEntry.decode(Buffer2)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1667 = ProtoModule.readBuffer(Buf, v46)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1667 = ProtoModule.readBuffer(Buf, v46)
				NewModule.creator_key = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1667 = ProtoModule.readBuffer(Buf, v46)
				NewModule.pill_tabs = t.PillTabsInputData.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v46)
				v46 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1667 = ProtoModule.readFixed32(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1667 = ProtoModule.readFixed64(Buf, v46)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module45:jsonEncode() --[[ Line: 14894 ]]
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
	if self.pill_tabs ~= nil then
		t.pillTabs = self.pill_tabs:jsonEncode()
	end
	return t
end

function Module45:jsonDecode() --[[ Line: 14928 ]]
	-- upvalues: Module45 (copy), t (copy)
	local NewModule = Module45.new()
	
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
	if self.pill_tabs ~= nil then
		NewModule.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		NewModule.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return NewModule
end

Module45.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = Module45
TypeRegistryModule.default:register(t.DevStoreFeedInputData)
local Module46 = {}
Module46.__index = Module46

function Module46.new(p1) --[[ Line: 15008 ]]
	-- upvalues: Module46 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module46))
end

function Module46:encode() --[[ Line: 15017 ]]
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

function Module46.decode(Buf) --[[ Line: 15037 ]]
	-- upvalues: Module46 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module46.new()
	local v47 = 0
	while v47 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1698 = ProtoModule.readTag(Buf, v47)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1698 = ProtoModule.readVarInt(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1698 = ProtoModule.readBuffer(Buf, v47)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1698 = ProtoModule.readBuffer(Buf, v47)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v47)
				v47 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1698 = ProtoModule.readFixed32(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1698 = ProtoModule.readFixed64(Buf, v47)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module46:jsonEncode() --[[ Line: 15085 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module46:jsonDecode() --[[ Line: 15099 ]]
	-- upvalues: Module46 (copy), t (copy)
	local NewModule = Module46.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module46.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = Module46
TypeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local Module47 = {}
Module47.__index = Module47

function Module47.new(p1) --[[ Line: 15129 ]]
	-- upvalues: Module47 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		default_option_id = if p1 == nil or p1.default_option_id == nil then "" else p1.default_option_id
	}, Module47))
end

function Module47:encode() --[[ Line: 15136 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.default_option_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module47.decode(Buf) --[[ Line: 15158 ]]
	-- upvalues: Module47 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module47.new()
	local v48 = 0
	while v48 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1718 = ProtoModule.readTag(Buf, v48)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1718 = ProtoModule.readVarInt(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1718 = ProtoModule.readBuffer(Buf, v48)
				table.insert(NewModule.options, t.PillTabsInputData_PillTabOption.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1718 = ProtoModule.readBuffer(Buf, v48)
				NewModule.default_option_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v48)
				v48 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1718 = ProtoModule.readFixed32(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1718 = ProtoModule.readFixed64(Buf, v48)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module47:jsonEncode() --[[ Line: 15206 ]]
	local t = {}
	
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
	return t
end

function Module47:jsonDecode() --[[ Line: 15224 ]]
	-- upvalues: Module47 (copy), t (copy)
	local NewModule = Module47.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.PillTabsInputData_PillTabOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	if self.default_option_id ~= nil then
		NewModule.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		NewModule.default_option_id = self.defaultOptionId
	end
	return NewModule
end

Module47.descriptor = {
	name = "PillTabsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabsInputData"
}
t.PillTabsInputData = Module47
TypeRegistryModule.default:register(t.PillTabsInputData)
local Module48 = {}
Module48.__index = Module48

function Module48.new(p1) --[[ Line: 15261 ]]
	-- upvalues: Module48 (copy)
	return (setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name
	}, Module48))
end

function Module48:encode() --[[ Line: 15270 ]]
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
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module48.decode(Buf) --[[ Line: 15289 ]]
	-- upvalues: Module48 (copy), ProtoModule (copy)
	local NewModule = Module48.new()
	local v49 = 0
	while v49 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1739 = ProtoModule.readTag(Buf, v49)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1739 = ProtoModule.readVarInt(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1739 = ProtoModule.readBuffer(Buf, v49)
				NewModule.option_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1739 = ProtoModule.readBuffer(Buf, v49)
				NewModule.display_name = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v49)
				v49 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1739 = ProtoModule.readFixed32(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1739 = ProtoModule.readFixed64(Buf, v49)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module48:jsonEncode() --[[ Line: 15337 ]]
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	return t
end

function Module48:jsonDecode() --[[ Line: 15351 ]]
	-- upvalues: Module48 (copy)
	local NewModule = Module48.new()
	
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
	return NewModule
end

Module48.descriptor = {
	name = "PillTabsInputData_PillTabOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabOption"
}
t.PillTabsInputData_PillTabOption = Module48
TypeRegistryModule.default:register(t.PillTabsInputData_PillTabOption)
local Module49 = {}
Module49.__index = Module49

function Module49.new(p1) --[[ Line: 15387 ]]
	-- upvalues: Module49 (copy)
	return (setmetatable({
		game_passes = if p1 == nil or p1.game_passes == nil then {} else p1.game_passes
	}, Module49))
end

function Module49:encode() --[[ Line: 15395 ]]
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

function Module49.decode(Buf) --[[ Line: 15412 ]]
	-- upvalues: Module49 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module49.new()
	local v50 = 0
	while v50 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1757 = ProtoModule.readTag(Buf, v50)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1757 = ProtoModule.readVarInt(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1757 = ProtoModule.readBuffer(Buf, v50)
				table.insert(NewModule.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v50)
				v50 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1757 = ProtoModule.readFixed32(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1757 = ProtoModule.readFixed64(Buf, v50)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module49:jsonEncode() --[[ Line: 15455 ]]
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

function Module49:jsonDecode() --[[ Line: 15469 ]]
	-- upvalues: Module49 (copy), t (copy)
	local NewModule = Module49.new()
	
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

Module49.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = Module49
TypeRegistryModule.default:register(t.GamePassCollectionInputData)
local Module50 = {}
Module50.__index = Module50

function Module50.new(p1) --[[ Line: 15507 ]]
	-- upvalues: Module50 (copy)
	return (setmetatable({
		game_pass_id = if p1 == nil or p1.game_pass_id == nil then "" else p1.game_pass_id
	}, Module50))
end

function Module50:encode() --[[ Line: 15515 ]]
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

function Module50.decode(Buf) --[[ Line: 15531 ]]
	-- upvalues: Module50 (copy), ProtoModule (copy)
	local NewModule = Module50.new()
	local v51 = 0
	while v51 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1776 = ProtoModule.readTag(Buf, v51)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1776 = ProtoModule.readVarInt(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1776 = ProtoModule.readBuffer(Buf, v51)
				NewModule.game_pass_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v51)
				v51 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1776 = ProtoModule.readFixed32(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1776 = ProtoModule.readFixed64(Buf, v51)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module50:jsonEncode() --[[ Line: 15576 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function Module50:jsonDecode() --[[ Line: 15588 ]]
	-- upvalues: Module50 (copy)
	local NewModule = Module50.new()
	
	if self.game_pass_id ~= nil then
		NewModule.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		NewModule.game_pass_id = self.gamePassId
	end
	return NewModule
end

Module50.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = Module50
TypeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local Module51 = {}
Module51.__index = Module51

function Module51.new(p1) --[[ Line: 15618 ]]
	-- upvalues: Module51 (copy)
	return (setmetatable({
		developer_products = if p1 == nil or p1.developer_products == nil then {} else p1.developer_products
	}, Module51))
end

function Module51:encode() --[[ Line: 15626 ]]
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

function Module51.decode(Buf) --[[ Line: 15643 ]]
	-- upvalues: Module51 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module51.new()
	local v52 = 0
	while v52 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1793 = ProtoModule.readTag(Buf, v52)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1793 = ProtoModule.readVarInt(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1793 = ProtoModule.readBuffer(Buf, v52)
				table.insert(NewModule.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v52)
				v52 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1793 = ProtoModule.readFixed32(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1793 = ProtoModule.readFixed64(Buf, v52)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module51:jsonEncode() --[[ Line: 15689 ]]
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

function Module51:jsonDecode() --[[ Line: 15703 ]]
	-- upvalues: Module51 (copy), t (copy)
	local NewModule = Module51.new()
	
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

Module51.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = Module51
TypeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local Module52 = {}
Module52.__index = Module52

function Module52.new(p1) --[[ Line: 15750 ]]
	-- upvalues: Module52 (copy)
	return (setmetatable({
		developer_product_id = if p1 == nil or p1.developer_product_id == nil then "" else p1.developer_product_id
	}, Module52))
end

function Module52:encode() --[[ Line: 15763 ]]
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

function Module52.decode(Buf) --[[ Line: 15779 ]]
	-- upvalues: Module52 (copy), ProtoModule (copy)
	local NewModule = Module52.new()
	local v53 = 0
	while v53 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1812 = ProtoModule.readTag(Buf, v53)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1812 = ProtoModule.readVarInt(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1812 = ProtoModule.readBuffer(Buf, v53)
				NewModule.developer_product_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v53)
				v53 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1812 = ProtoModule.readFixed32(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1812 = ProtoModule.readFixed64(Buf, v53)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module52:jsonEncode() --[[ Line: 15824 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function Module52:jsonDecode() --[[ Line: 15836 ]]
	-- upvalues: Module52 (copy)
	local NewModule = Module52.new()
	
	if self.developer_product_id ~= nil then
		NewModule.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		NewModule.developer_product_id = self.developerProductId
	end
	return NewModule
end

Module52.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = Module52
TypeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local Module53 = {}
Module53.__index = Module53

function Module53.new(p1) --[[ Line: 15867 ]]
	-- upvalues: Module53 (copy)
	return (setmetatable({
		subscriptions = if p1 == nil or p1.subscriptions == nil then {} else p1.subscriptions
	}, Module53))
end

function Module53:encode() --[[ Line: 15875 ]]
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

function Module53.decode(Buf) --[[ Line: 15892 ]]
	-- upvalues: Module53 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module53.new()
	local v54 = 0
	while v54 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1829 = ProtoModule.readTag(Buf, v54)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1829 = ProtoModule.readVarInt(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1829 = ProtoModule.readBuffer(Buf, v54)
				table.insert(NewModule.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v54)
				v54 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1829 = ProtoModule.readFixed32(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1829 = ProtoModule.readFixed64(Buf, v54)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module53:jsonEncode() --[[ Line: 15938 ]]
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

function Module53:jsonDecode() --[[ Line: 15952 ]]
	-- upvalues: Module53 (copy), t (copy)
	local NewModule = Module53.new()
	
	if self.subscriptions ~= nil then
		local Subscriptions = {}
		
		for _, subscription in self.subscriptions do
			table.insert(Subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(subscription))
		end
		NewModule.subscriptions = Subscriptions
	end
	return NewModule
end

Module53.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = Module53
TypeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local Module54 = {}
Module54.__index = Module54

function Module54.new(p1) --[[ Line: 15982 ]]
	-- upvalues: Module54 (copy)
	return (setmetatable({
		subscription_id = if p1 == nil or p1.subscription_id == nil then "" else p1.subscription_id
	}, Module54))
end

function Module54:encode() --[[ Line: 15993 ]]
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

function Module54.decode(Buf) --[[ Line: 16009 ]]
	-- upvalues: Module54 (copy), ProtoModule (copy)
	local NewModule = Module54.new()
	local v55 = 0
	while v55 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1847 = ProtoModule.readTag(Buf, v55)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1847 = ProtoModule.readVarInt(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1847 = ProtoModule.readBuffer(Buf, v55)
				NewModule.subscription_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v55)
				v55 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1847 = ProtoModule.readFixed32(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1847 = ProtoModule.readFixed64(Buf, v55)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module54:jsonEncode() --[[ Line: 16054 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function Module54:jsonDecode() --[[ Line: 16066 ]]
	-- upvalues: Module54 (copy)
	local NewModule = Module54.new()
	
	if self.subscription_id ~= nil then
		NewModule.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		NewModule.subscription_id = self.subscriptionId
	end
	return NewModule
end

Module54.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = Module54
TypeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local Module55 = {}
Module55.__index = Module55

function Module55.new(p1) --[[ Line: 16097 ]]
	-- upvalues: Module55 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then "" else p1.collection_item_size,
		item_height_mode = if p1 == nil or p1.item_height_mode == nil then "" else p1.item_height_mode,
		experience_store_product_type = if p1 == nil or p1.experience_store_product_type == nil then "" else p1.experience_store_product_type,
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type,
		filter_category_id = if p1 == nil or p1.filter_category_id == nil then "" else p1.filter_category_id
	}, Module55))
end

function Module55:encode() --[[ Line: 16118 ]]
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
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.section_title)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.creator_key)
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.collection_item_size)
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.item_height_mode)
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.experience_store_product_type)
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.content_type)
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.item_type)
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.filter_category_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module55.decode(Buf) --[[ Line: 16180 ]]
	-- upvalues: Module55 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module55.new()
	local v56 = 0
	while v56 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1882 = ProtoModule.readTag(Buf, v56)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1882 = ProtoModule.readVarInt(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1882 = ProtoModule.readBuffer(Buf, v56)
				table.insert(NewModule.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.section_title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.creator_key = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.collection_item_size = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.item_height_mode = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.experience_store_product_type = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.content_type = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.item_type = buffer.tostring(Buffer9)
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v1882 = ProtoModule.readBuffer(Buf, v56)
				NewModule.filter_category_id = buffer.tostring(Buffer10)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v56)
				v56 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1882 = ProtoModule.readFixed32(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1882 = ProtoModule.readFixed64(Buf, v56)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module55:jsonEncode() --[[ Line: 16271 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		t.collectionItemSize = self.collection_item_size
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		t.itemHeightMode = self.item_height_mode
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		t.experienceStoreProductType = self.experience_store_product_type
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		t.filterCategoryId = self.filter_category_id
	end
	return t
end

function Module55:jsonDecode() --[[ Line: 16321 ]]
	-- upvalues: Module55 (copy), t (copy)
	local NewModule = Module55.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(item))
		end
		NewModule.items = Items
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		NewModule.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		NewModule.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		NewModule.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		NewModule.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		NewModule.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		NewModule.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		NewModule.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		NewModule.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		NewModule.content_type = self.content_type
	end
	if self.contentType ~= nil then
		NewModule.content_type = self.contentType
	end
	if self.item_type ~= nil then
		NewModule.item_type = self.item_type
	end
	if self.itemType ~= nil then
		NewModule.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		NewModule.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		NewModule.filter_category_id = self.filterCategoryId
	end
	return NewModule
end

Module55.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = Module55
TypeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local Module56 = {}
Module56.__index = Module56

function Module56.new(p1) --[[ Line: 16426 ]]
	-- upvalues: t (copy), Module56 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		identifier = if p1 == nil or p1.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p1.identifier
	}, Module56))
end

function Module56:encode() --[[ Line: 16443 ]]
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.item_id)
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module56.decode(Buf) --[[ Line: 16475 ]]
	-- upvalues: Module56 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module56.new()
	local v57 = 0
	while v57 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1911 = ProtoModule.readTag(Buf, v57)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v1911 = ProtoModule.readVarIntI32(Buf, v57)
				NewModule.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1911 = ProtoModule.readVarInt(Buf, v57)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1911 = ProtoModule.readBuffer(Buf, v57)
				NewModule.item_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v57)
				v57 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1911 = ProtoModule.readFixed32(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1911 = ProtoModule.readFixed64(Buf, v57)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module56:jsonEncode() --[[ Line: 16527 ]]
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t1.itemId = self.item_id
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		t1.identifier = if typeof(self.identifier) == "number" then self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier)
	end
	return t1
end

function Module56:jsonDecode() --[[ Line: 16554 ]]
	-- upvalues: Module56 (copy), t (copy)
	local NewModule = Module56.new()
	
	if self.item_id ~= nil then
		NewModule.item_id = self.item_id
	end
	if self.itemId ~= nil then
		NewModule.item_id = self.itemId
	end
	if self.identifier ~= nil then
		NewModule.identifier = (if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier)) or self.identifier
	end
	return NewModule
end

Module56.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = Module56
TypeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p1) --[[ Line: 16593 ]]
		return if p1 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p1 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p1 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p1 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p1) --[[ Line: 16607 ]]
		return if p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p1
	end,
	fromName = function(p1) --[[ Line: 16621 ]]
		return if p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local Module57 = {}
Module57.__index = Module57

function Module57.new(p1) --[[ Line: 16640 ]]
	-- upvalues: Module57 (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		identifier = if p1 == nil or p1.identifier == nil then "" else p1.identifier,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		entity_id = if p1 == nil or p1.entity_id == nil then "" else p1.entity_id
	}, Module57))
end

function Module57:encode() --[[ Line: 16656 ]]
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
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.entity_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module57.decode(Buf) --[[ Line: 16710 ]]
	-- upvalues: Module57 (copy), ProtoModule (copy)
	local NewModule = Module57.new()
	local v58 = 0
	while v58 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1944 = ProtoModule.readTag(Buf, v58)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1944 = ProtoModule.readVarInt(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.identifier = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.user_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.description = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.cta_text = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.prompt_id = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.prompt_type = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v1944 = ProtoModule.readBuffer(Buf, v58)
				NewModule.entity_id = buffer.tostring(Buffer9)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v58)
				v58 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1944 = ProtoModule.readFixed32(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1944 = ProtoModule.readFixed64(Buf, v58)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module57:jsonEncode() --[[ Line: 16793 ]]
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
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function Module57:jsonDecode() --[[ Line: 16835 ]]
	-- upvalues: Module57 (copy)
	local NewModule = Module57.new()
	
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
	if self.entity_id ~= nil then
		NewModule.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		NewModule.entity_id = self.entityId
	end
	return NewModule
end

Module57.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = Module57
TypeRegistryModule.default:register(t.CardContainerCardInputData)
local Module58 = {}
Module58.__index = Module58

function Module58.new(p1) --[[ Line: 16915 ]]
	-- upvalues: Module58 (copy)
	return (setmetatable({
		group_id = if p1 == nil or p1.group_id == nil then "" else p1.group_id,
		experience_id = if p1 == nil or p1.experience_id == nil then "" else p1.experience_id
	}, Module58))
end

function Module58:encode() --[[ Line: 16924 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.group_id)
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.experience_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module58.decode(Buf) --[[ Line: 16943 ]]
	-- upvalues: Module58 (copy), ProtoModule (copy)
	local NewModule = Module58.new()
	local v59 = 0
	while v59 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1970 = ProtoModule.readTag(Buf, v59)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1970 = ProtoModule.readVarInt(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1970 = ProtoModule.readBuffer(Buf, v59)
				NewModule.group_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1970 = ProtoModule.readBuffer(Buf, v59)
				NewModule.experience_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v59)
				v59 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1970 = ProtoModule.readFixed32(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1970 = ProtoModule.readFixed64(Buf, v59)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module58:jsonEncode() --[[ Line: 16991 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function Module58:jsonDecode() --[[ Line: 17005 ]]
	-- upvalues: Module58 (copy)
	local NewModule = Module58.new()
	
	if self.group_id ~= nil then
		NewModule.group_id = self.group_id
	end
	if self.groupId ~= nil then
		NewModule.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		NewModule.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		NewModule.experience_id = self.experienceId
	end
	return NewModule
end

Module58.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = Module58
TypeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local Module59 = {}
Module59.__index = Module59

function Module59.new(p1) --[[ Line: 17041 ]]
	-- upvalues: Module59 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		dismiss_text = if p1 == nil or p1.dismiss_text == nil then "" else p1.dismiss_text,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		cards = if p1 == nil or p1.cards == nil then {} else p1.cards,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then "" else p1.feed_item_key,
		client_attributes = if p1 == nil or p1.client_attributes == nil then nil else p1.client_attributes
	}, Module59))
end

function Module59:encode() --[[ Line: 17055 ]]
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
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.sort_id)
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.feed_item_key)
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local EncodeResult = self.client_attributes.value:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module59.decode(Buf) --[[ Line: 17115 ]]
	-- upvalues: Module59 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module59.new()
	local v60 = 0
	while v60 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2005 = ProtoModule.readTag(Buf, v60)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2005 = ProtoModule.readVarInt(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.dismiss_text = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.user_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2005 = ProtoModule.readBuffer(Buf, v60)
				table.insert(NewModule.cards, t.CardContainerCardInputData.decode(Buffer4))
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.sort_id = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.feed_item_key = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v2005 = ProtoModule.readBuffer(Buf, v60)
				NewModule.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(Buffer9)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v60)
				v60 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2005 = ProtoModule.readFixed32(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2005 = ProtoModule.readFixed64(Buf, v60)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module59:jsonEncode() --[[ Line: 17201 ]]
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
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		t.communitiesClientAttributes = self.client_attributes.value:jsonEncode()
	end
	return t
end

function Module59:jsonDecode() --[[ Line: 17249 ]]
	-- upvalues: Module59 (copy), t (copy)
	local NewModule = Module59.new()
	
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
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		NewModule.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		NewModule.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		NewModule.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		NewModule.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return NewModule
end

Module59.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = Module59
TypeRegistryModule.default:register(t.CardContainerInputData)
local Module60 = {}
Module60.__index = Module60

function Module60.new(p1) --[[ Line: 17344 ]]
	-- upvalues: Module60 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		entity_id = if p1 == nil or p1.entity_id == nil then "" else p1.entity_id
	}, Module60))
end

function Module60:encode() --[[ Line: 17356 ]]
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
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.entity_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module60.decode(Buf) --[[ Line: 17400 ]]
	-- upvalues: Module60 (copy), ProtoModule (copy)
	local NewModule = Module60.new()
	local v61 = 0
	while v61 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2043 = ProtoModule.readTag(Buf, v61)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2043 = ProtoModule.readVarInt(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.user_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.cta_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2043 = ProtoModule.readBuffer(Buf, v61)
				NewModule.entity_id = buffer.tostring(Buffer7)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v61)
				v61 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2043 = ProtoModule.readFixed32(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2043 = ProtoModule.readFixed64(Buf, v61)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module60:jsonEncode() --[[ Line: 17473 ]]
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
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function Module60:jsonDecode() --[[ Line: 17507 ]]
	-- upvalues: Module60 (copy)
	local NewModule = Module60.new()
	
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
	if self.entity_id ~= nil then
		NewModule.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		NewModule.entity_id = self.entityId
	end
	return NewModule
end

Module60.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = Module60
TypeRegistryModule.default:register(t.CardInputData)
local Module61 = {}
Module61.__index = Module61

function Module61.new(p1) --[[ Line: 17575 ]]
	-- upvalues: Module61 (copy)
	return (setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		audit_data = if p1 == nil or p1.audit_data == nil then "" else p1.audit_data
	}, Module61))
end

function Module61:encode() --[[ Line: 17584 ]]
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

function Module61.decode(Buf) --[[ Line: 17613 ]]
	-- upvalues: Module61 (copy), ProtoModule (copy)
	local NewModule = Module61.new()
	local v62 = 0
	while v62 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2071 = ProtoModule.readTag(Buf, v62)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2071 = ProtoModule.readVarInt(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2071 = ProtoModule.readBuffer(Buf, v62)
				NewModule.prompt_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2071 = ProtoModule.readBuffer(Buf, v62)
				NewModule.prompt_type = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2071 = ProtoModule.readBuffer(Buf, v62)
				NewModule.user_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2071 = ProtoModule.readBuffer(Buf, v62)
				NewModule.audit_data = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v62)
				v62 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2071 = ProtoModule.readFixed32(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2071 = ProtoModule.readFixed64(Buf, v62)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module61:jsonEncode() --[[ Line: 17671 ]]
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

function Module61:jsonDecode() --[[ Line: 17693 ]]
	-- upvalues: Module61 (copy)
	local NewModule = Module61.new()
	
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

Module61.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = Module61
TypeRegistryModule.default:register(t.DialogInputData)
local Module62 = {}
Module62.__index = Module62

function Module62.new(p1) --[[ Line: 17745 ]]
	-- upvalues: Module62 (copy)
	return (setmetatable({
		sender_count = if p1 == nil or p1.sender_count == nil then 0 else p1.sender_count,
		total_robux_amount = if p1 == nil or p1.total_robux_amount == nil then 0 else p1.total_robux_amount
	}, Module62))
end

function Module62:encode() --[[ Line: 17752 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.sender_count)
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.total_robux_amount)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module62.decode(Buf) --[[ Line: 17771 ]]
	-- upvalues: Module62 (copy), ProtoModule (copy)
	local NewModule = Module62.new()
	local v63 = 0
	while v63 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2092 = ProtoModule.readTag(Buf, v63)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.sender_count, v2092 = ProtoModule.readVarIntI32(Buf, v63)
			elseif Tag == 2 then
				NewModule.total_robux_amount, v2092 = ProtoModule.readVarIntI64(Buf, v63)
			else
				local _
				_, v2092 = ProtoModule.readVarInt(Buf, v63)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v63)
			v63 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2092 = ProtoModule.readFixed32(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2092 = ProtoModule.readFixed64(Buf, v63)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module62:jsonEncode() --[[ Line: 17819 ]]
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function Module62:jsonDecode() --[[ Line: 17833 ]]
	-- upvalues: Module62 (copy)
	local NewModule = Module62.new()
	
	if self.sender_count ~= nil then
		NewModule.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		NewModule.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		NewModule.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		NewModule.total_robux_amount = self.totalRobuxAmount
	end
	return NewModule
end

Module62.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = Module62
TypeRegistryModule.default:register(t.IncomingTransferContent)
local Module63 = {}
Module63.__index = Module63

function Module63.new(p1) --[[ Line: 17869 ]]
	-- upvalues: Module63 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		primary_text = if p1 == nil or p1.primary_text == nil then "" else p1.primary_text,
		secondary_text = if p1 == nil or p1.secondary_text == nil then "" else p1.secondary_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		times_seen = if p1 == nil or p1.times_seen == nil then 0 else p1.times_seen,
		content = if p1 == nil or p1.content == nil then nil else p1.content,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, Module63))
end

function Module63:encode() --[[ Line: 17883 ]]
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
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local EncodeResult = self.content.value:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	if self.sort_id ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.sort_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module63.decode(Buf) --[[ Line: 17940 ]]
	-- upvalues: Module63 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module63.new()
	local v64 = 0
	while v64 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2124 = ProtoModule.readTag(Buf, v64)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 7 then
				NewModule.times_seen, v2124 = ProtoModule.readVarIntI32(Buf, v64)
			else
				local _
				_, v2124 = ProtoModule.readVarInt(Buf, v64)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.description = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.primary_text = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.secondary_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.prompt_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.prompt_type = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(Buffer7)
				}
			elseif Tag == 9 then
				local Buffer8
				Buffer8, v2124 = ProtoModule.readBuffer(Buf, v64)
				NewModule.sort_id = buffer.tostring(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v64)
				v64 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2124 = ProtoModule.readFixed32(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2124 = ProtoModule.readFixed64(Buf, v64)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module63:jsonEncode() --[[ Line: 18024 ]]
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
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		t.incomingTransferContent = self.content.value:jsonEncode()
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function Module63:jsonDecode() --[[ Line: 18068 ]]
	-- upvalues: Module63 (copy), t (copy)
	local NewModule = Module63.new()
	
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
	if self.incoming_transfer_content ~= nil then
		NewModule.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		NewModule.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	return NewModule
end

Module63.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = Module63
TypeRegistryModule.default:register(t.BannerInputData)
local Module64 = {}
Module64.__index = Module64

function Module64.new(p1) --[[ Line: 18158 ]]
	-- upvalues: Module64 (copy)
	return (setmetatable({
		tooltip_text = if p1 == nil or p1.tooltip_text == nil then "" else p1.tooltip_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module64))
end

function Module64:encode() --[[ Line: 18166 ]]
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

function Module64.decode(Buf) --[[ Line: 18190 ]]
	-- upvalues: Module64 (copy), ProtoModule (copy)
	local NewModule = Module64.new()
	local v65 = 0
	while v65 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2151 = ProtoModule.readTag(Buf, v65)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2151 = ProtoModule.readVarInt(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2151 = ProtoModule.readBuffer(Buf, v65)
				NewModule.tooltip_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2151 = ProtoModule.readBuffer(Buf, v65)
				NewModule.prompt_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2151 = ProtoModule.readBuffer(Buf, v65)
				NewModule.prompt_type = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v65)
				v65 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2151 = ProtoModule.readFixed32(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2151 = ProtoModule.readFixed64(Buf, v65)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module64:jsonEncode() --[[ Line: 18243 ]]
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

function Module64:jsonDecode() --[[ Line: 18261 ]]
	-- upvalues: Module64 (copy)
	local NewModule = Module64.new()
	
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

Module64.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = Module64
TypeRegistryModule.default:register(t.TooltipInputData)
local Module65 = {}
Module65.__index = Module65

function Module65.new(p1) --[[ Line: 18305 ]]
	-- upvalues: Module65 (copy)
	return (setmetatable({
		media_id = if p1 == nil or p1.media_id == nil then "" else p1.media_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		anchor_tag = if p1 == nil or p1.anchor_tag == nil then "" else p1.anchor_tag
	}, Module65))
end

function Module65:encode() --[[ Line: 18316 ]]
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

function Module65.decode(Buf) --[[ Line: 18355 ]]
	-- upvalues: Module65 (copy), ProtoModule (copy)
	local NewModule = Module65.new()
	local v66 = 0
	while v66 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2179 = ProtoModule.readTag(Buf, v66)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2179 = ProtoModule.readVarInt(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.media_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.prompt_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.prompt_type = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2179 = ProtoModule.readBuffer(Buf, v66)
				NewModule.anchor_tag = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v66)
				v66 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2179 = ProtoModule.readFixed32(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2179 = ProtoModule.readFixed64(Buf, v66)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module65:jsonEncode() --[[ Line: 18423 ]]
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

function Module65:jsonDecode() --[[ Line: 18453 ]]
	-- upvalues: Module65 (copy)
	local NewModule = Module65.new()
	
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

Module65.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = Module65
TypeRegistryModule.default:register(t.CoachmarkInputData)
local Module66 = {}
Module66.__index = Module66

function Module66.new(p1) --[[ Line: 18513 ]]
	-- upvalues: Module66 (copy)
	return (setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, Module66))
end

function Module66:encode() --[[ Line: 18520 ]]
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

function Module66.decode(Buf) --[[ Line: 18539 ]]
	-- upvalues: Module66 (copy), ProtoModule (copy)
	local NewModule = Module66.new()
	local v67 = 0
	while v67 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2202 = ProtoModule.readTag(Buf, v67)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2202 = ProtoModule.readVarInt(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2202 = ProtoModule.readBuffer(Buf, v67)
				NewModule.prompt_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2202 = ProtoModule.readBuffer(Buf, v67)
				NewModule.prompt_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v67)
				v67 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2202 = ProtoModule.readFixed32(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2202 = ProtoModule.readFixed64(Buf, v67)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module66:jsonEncode() --[[ Line: 18587 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function Module66:jsonDecode() --[[ Line: 18601 ]]
	-- upvalues: Module66 (copy)
	local NewModule = Module66.new()
	
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

Module66.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = Module66
TypeRegistryModule.default:register(t.SystemBannerInputData)
local Module67 = {}
Module67.__index = Module67

function Module67.new(p1) --[[ Line: 18637 ]]
	-- upvalues: Module67 (copy)
	return (setmetatable({
		upsell_prompt = if p1 == nil or p1.upsell_prompt == nil then "" else p1.upsell_prompt
	}, Module67))
end

function Module67:encode() --[[ Line: 18643 ]]
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

function Module67.decode(Buf) --[[ Line: 18657 ]]
	-- upvalues: Module67 (copy), ProtoModule (copy)
	local NewModule = Module67.new()
	local v68 = 0
	while v68 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2219 = ProtoModule.readTag(Buf, v68)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2219 = ProtoModule.readVarInt(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2219 = ProtoModule.readBuffer(Buf, v68)
				NewModule.upsell_prompt = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v68)
				v68 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2219 = ProtoModule.readFixed32(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2219 = ProtoModule.readFixed64(Buf, v68)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module67:jsonEncode() --[[ Line: 18700 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function Module67:jsonDecode() --[[ Line: 18710 ]]
	-- upvalues: Module67 (copy)
	local NewModule = Module67.new()
	
	if self.upsell_prompt ~= nil then
		NewModule.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		NewModule.upsell_prompt = self.upsellPrompt
	end
	return NewModule
end

Module67.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = Module67
TypeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local Module68 = {}
Module68.__index = Module68

function Module68.new(p1) --[[ Line: 18738 ]]
	-- upvalues: Module68 (copy)
	return (setmetatable({
		modal_variant = if p1 == nil or p1.modal_variant == nil then "" else p1.modal_variant,
		modal_sequence = if p1 == nil or p1.modal_sequence == nil then "" else p1.modal_sequence,
		conversation_id = if p1 == nil or p1.conversation_id == nil then "" else p1.conversation_id,
		friend_id = if p1 == nil or p1.friend_id == nil then "" else p1.friend_id
	}, Module68))
end

function Module68:encode() --[[ Line: 18749 ]]
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

function Module68.decode(Buf) --[[ Line: 18778 ]]
	-- upvalues: Module68 (copy), ProtoModule (copy)
	local NewModule = Module68.new()
	local v69 = 0
	while v69 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2241 = ProtoModule.readTag(Buf, v69)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2241 = ProtoModule.readVarInt(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2241 = ProtoModule.readBuffer(Buf, v69)
				NewModule.modal_variant = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2241 = ProtoModule.readBuffer(Buf, v69)
				NewModule.modal_sequence = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2241 = ProtoModule.readBuffer(Buf, v69)
				NewModule.conversation_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2241 = ProtoModule.readBuffer(Buf, v69)
				NewModule.friend_id = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v69)
				v69 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2241 = ProtoModule.readFixed32(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2241 = ProtoModule.readFixed64(Buf, v69)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module68:jsonEncode() --[[ Line: 18836 ]]
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

function Module68:jsonDecode() --[[ Line: 18858 ]]
	-- upvalues: Module68 (copy)
	local NewModule = Module68.new()
	
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

Module68.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = Module68
TypeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local Module69 = {}
Module69.__index = Module69

function Module69.new(p1) --[[ Line: 18912 ]]
	-- upvalues: Module69 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, Module69))
end

function Module69:encode() --[[ Line: 18923 ]]
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

function Module69.decode(Buf) --[[ Line: 18963 ]]
	-- upvalues: Module69 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module69.new()
	local v70 = 0
	while v70 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2275 = ProtoModule.readTag(Buf, v70)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2275 = ProtoModule.readVarInt(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2275 = ProtoModule.readBuffer(Buf, v70)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2275 = ProtoModule.readBuffer(Buf, v70)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2275 = ProtoModule.readBuffer(Buf, v70)
				local DecodeResult = t.EventDetailsFeedInputData_EntryMapEntry.decode(Buffer3)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2275 = ProtoModule.readBuffer(Buf, v70)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer4))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v70)
				v70 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2275 = ProtoModule.readFixed32(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2275 = ProtoModule.readFixed64(Buf, v70)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module69:jsonEncode() --[[ Line: 19028 ]]
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

function Module69:jsonDecode() --[[ Line: 19058 ]]
	-- upvalues: Module69 (copy), t (copy)
	local NewModule = Module69.new()
	
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

Module69.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = Module69
TypeRegistryModule.default:register(t.EventDetailsFeedInputData)
local Module70 = {}
Module70.__index = Module70

function Module70.new(p1) --[[ Line: 19130 ]]
	-- upvalues: Module70 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module70))
end

function Module70:encode() --[[ Line: 19139 ]]
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

function Module70.decode(Buf) --[[ Line: 19159 ]]
	-- upvalues: Module70 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module70.new()
	local v71 = 0
	while v71 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2305 = ProtoModule.readTag(Buf, v71)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2305 = ProtoModule.readVarInt(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2305 = ProtoModule.readBuffer(Buf, v71)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2305 = ProtoModule.readBuffer(Buf, v71)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v71)
				v71 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2305 = ProtoModule.readFixed32(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2305 = ProtoModule.readFixed64(Buf, v71)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module70:jsonEncode() --[[ Line: 19207 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module70:jsonDecode() --[[ Line: 19221 ]]
	-- upvalues: Module70 (copy), t (copy)
	local NewModule = Module70.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module70.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = Module70
TypeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local Module71 = {}
Module71.__index = Module71

function Module71.new(p1) --[[ Line: 19251 ]]
	-- upvalues: Module71 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module71))
end

function Module71:encode() --[[ Line: 19260 ]]
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

function Module71.decode(Buf) --[[ Line: 19279 ]]
	-- upvalues: Module71 (copy), ProtoModule (copy)
	local NewModule = Module71.new()
	local v72 = 0
	while v72 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2324 = ProtoModule.readTag(Buf, v72)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2324 = ProtoModule.readVarInt(Buf, v72)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2324 = ProtoModule.readBuffer(Buf, v72)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2324 = ProtoModule.readBuffer(Buf, v72)
				NewModule.universe_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v72)
				v72 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2324 = ProtoModule.readFixed32(Buf, v72)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2324 = ProtoModule.readFixed64(Buf, v72)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module71:jsonEncode() --[[ Line: 19327 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module71:jsonDecode() --[[ Line: 19341 ]]
	-- upvalues: Module71 (copy)
	local NewModule = Module71.new()
	
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

Module71.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = Module71
TypeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local Module72 = {}
Module72.__index = Module72

function Module72.new(p1) --[[ Line: 19377 ]]
	-- upvalues: Module72 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module72))
end

function Module72:encode() --[[ Line: 19385 ]]
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

function Module72.decode(Buf) --[[ Line: 19399 ]]
	-- upvalues: Module72 (copy), ProtoModule (copy)
	local NewModule = Module72.new()
	local v73 = 0
	while v73 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2341 = ProtoModule.readTag(Buf, v73)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2341 = ProtoModule.readVarInt(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2341 = ProtoModule.readBuffer(Buf, v73)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v73)
				v73 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2341 = ProtoModule.readFixed32(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2341 = ProtoModule.readFixed64(Buf, v73)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module72:jsonEncode() --[[ Line: 19442 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module72:jsonDecode() --[[ Line: 19452 ]]
	-- upvalues: Module72 (copy)
	local NewModule = Module72.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module72.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = Module72
TypeRegistryModule.default:register(t.EventDescriptionInputData)
local Module73 = {}
Module73.__index = Module73

function Module73.new(p1) --[[ Line: 19480 ]]
	-- upvalues: Module73 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		rsvp_users = if p1 == nil or p1.rsvp_users == nil then {} else p1.rsvp_users
	}, Module73))
end

function Module73:encode() --[[ Line: 19490 ]]
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
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for _, rsvpUser in self.rsvp_users do
			local EncodeResult = rsvpUser:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module73.decode(Buf) --[[ Line: 19517 ]]
	-- upvalues: Module73 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module73.new()
	local v74 = 0
	while v74 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2362 = ProtoModule.readTag(Buf, v74)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2362 = ProtoModule.readVarInt(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2362 = ProtoModule.readBuffer(Buf, v74)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2362 = ProtoModule.readBuffer(Buf, v74)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2362 = ProtoModule.readBuffer(Buf, v74)
				table.insert(NewModule.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v74)
				v74 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2362 = ProtoModule.readFixed32(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2362 = ProtoModule.readFixed64(Buf, v74)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module73:jsonEncode() --[[ Line: 19570 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		local RsvpUsers = {}
		
		for _, rsvpUser in self.rsvp_users do
			table.insert(RsvpUsers, rsvpUser:jsonEncode())
		end
		t.rsvpUsers = RsvpUsers
	end
	return t
end

function Module73:jsonDecode() --[[ Line: 19592 ]]
	-- upvalues: Module73 (copy), t (copy)
	local NewModule = Module73.new()
	
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
	if self.rsvp_users ~= nil then
		local Rsvp_users = {}
		
		for _, rsvpUser in self.rsvp_users do
			table.insert(Rsvp_users, t.EventAttributionRowInputData_RsvpUser.jsonDecode(rsvpUser))
		end
		NewModule.rsvp_users = Rsvp_users
	end
	if self.rsvpUsers ~= nil then
		local Rsvp_users = {}
		
		for _, rsvpUser1 in self.rsvpUsers do
			table.insert(Rsvp_users, t.EventAttributionRowInputData_RsvpUser.jsonDecode(rsvpUser1))
		end
		NewModule.rsvp_users = Rsvp_users
	end
	return NewModule
end

Module73.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = Module73
TypeRegistryModule.default:register(t.EventAttributionRowInputData)
local Module74 = {}
Module74.__index = Module74

function Module74.new(p1) --[[ Line: 19646 ]]
	-- upvalues: Module74 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id
	}, Module74))
end

function Module74:encode() --[[ Line: 19654 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.user_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module74.decode(Buf) --[[ Line: 19668 ]]
	-- upvalues: Module74 (copy), ProtoModule (copy)
	local NewModule = Module74.new()
	local v75 = 0
	while v75 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2383 = ProtoModule.readTag(Buf, v75)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.user_id, v2383 = ProtoModule.readVarIntI64(Buf, v75)
			else
				local _
				_, v2383 = ProtoModule.readVarInt(Buf, v75)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v75)
			v75 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2383 = ProtoModule.readFixed32(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2383 = ProtoModule.readFixed64(Buf, v75)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module74:jsonEncode() --[[ Line: 19711 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function Module74:jsonDecode() --[[ Line: 19721 ]]
	-- upvalues: Module74 (copy)
	local NewModule = Module74.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	return NewModule
end

Module74.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = Module74
TypeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local Module75 = {}
Module75.__index = Module75

function Module75.new(p1) --[[ Line: 19751 ]]
	-- upvalues: Module75 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module75))
end

function Module75:encode() --[[ Line: 19757 ]]
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

function Module75.decode(Buf) --[[ Line: 19771 ]]
	-- upvalues: Module75 (copy), ProtoModule (copy)
	local NewModule = Module75.new()
	local v76 = 0
	while v76 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2398 = ProtoModule.readTag(Buf, v76)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2398 = ProtoModule.readVarInt(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2398 = ProtoModule.readBuffer(Buf, v76)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v76)
				v76 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2398 = ProtoModule.readFixed32(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2398 = ProtoModule.readFixed64(Buf, v76)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module75:jsonEncode() --[[ Line: 19814 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module75:jsonDecode() --[[ Line: 19824 ]]
	-- upvalues: Module75 (copy)
	local NewModule = Module75.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module75.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = Module75
TypeRegistryModule.default:register(t.EventInfoTableInputData)
local Module76 = {}
Module76.__index = Module76

function Module76.new(p1) --[[ Line: 19852 ]]
	-- upvalues: Module76 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, Module76))
end

function Module76:encode() --[[ Line: 19860 ]]
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

function Module76.decode(Buf) --[[ Line: 19874 ]]
	-- upvalues: Module76 (copy), ProtoModule (copy)
	local NewModule = Module76.new()
	local v77 = 0
	while v77 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2414 = ProtoModule.readTag(Buf, v77)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2414 = ProtoModule.readVarInt(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2414 = ProtoModule.readBuffer(Buf, v77)
				NewModule.event_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v77)
				v77 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2414 = ProtoModule.readFixed32(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2414 = ProtoModule.readFixed64(Buf, v77)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module76:jsonEncode() --[[ Line: 19917 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function Module76:jsonDecode() --[[ Line: 19927 ]]
	-- upvalues: Module76 (copy)
	local NewModule = Module76.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = self.event_id
	end
	if self.eventId ~= nil then
		NewModule.event_id = self.eventId
	end
	return NewModule
end

Module76.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = Module76
TypeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local Module77 = {}
Module77.__index = Module77

function Module77.new(p1) --[[ Line: 19957 ]]
	-- upvalues: Module77 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module77))
end

function Module77:encode() --[[ Line: 19966 ]]
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

function Module77.decode(Buf) --[[ Line: 19985 ]]
	-- upvalues: Module77 (copy), ProtoModule (copy)
	local NewModule = Module77.new()
	local v78 = 0
	while v78 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2432 = ProtoModule.readTag(Buf, v78)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2432 = ProtoModule.readVarInt(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2432 = ProtoModule.readBuffer(Buf, v78)
				NewModule.event_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2432 = ProtoModule.readBuffer(Buf, v78)
				NewModule.universe_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v78)
				v78 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2432 = ProtoModule.readFixed32(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2432 = ProtoModule.readFixed64(Buf, v78)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module77:jsonEncode() --[[ Line: 20033 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module77:jsonDecode() --[[ Line: 20047 ]]
	-- upvalues: Module77 (copy)
	local NewModule = Module77.new()
	
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

Module77.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = Module77
TypeRegistryModule.default:register(t.EventNotificationsModalInputData)
local Module78 = {}
Module78.__index = Module78

function Module78.new(p1) --[[ Line: 20085 ]]
	-- upvalues: Module78 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sticky_filter_pills = if p1 == nil or p1.sticky_filter_pills == nil then nil else p1.sticky_filter_pills,
		applied_filters = if p1 == nil or p1.applied_filters == nil then "" else p1.applied_filters
	}, Module78))
end

function Module78:encode() --[[ Line: 20097 ]]
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

function Module78.decode(Buf) --[[ Line: 20143 ]]
	-- upvalues: Module78 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module78.new()
	local v79 = 0
	while v79 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2467 = ProtoModule.readTag(Buf, v79)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2467 = ProtoModule.readVarInt(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2467 = ProtoModule.readBuffer(Buf, v79)
				local DecodeResult = t.ChartsFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2467 = ProtoModule.readBuffer(Buf, v79)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2467 = ProtoModule.readBuffer(Buf, v79)
				NewModule.next_page_token = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2467 = ProtoModule.readBuffer(Buf, v79)
				NewModule.sticky_filter_pills = t.FilterPillsInputData.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2467 = ProtoModule.readBuffer(Buf, v79)
				NewModule.applied_filters = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v79)
				v79 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2467 = ProtoModule.readFixed32(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2467 = ProtoModule.readFixed64(Buf, v79)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module78:jsonEncode() --[[ Line: 20213 ]]
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

function Module78:jsonDecode() --[[ Line: 20247 ]]
	-- upvalues: Module78 (copy), t (copy)
	local NewModule = Module78.new()
	
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

Module78.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = Module78
TypeRegistryModule.default:register(t.ChartsFeedInputData)
local Module79 = {}
Module79.__index = Module79

function Module79.new(p1) --[[ Line: 20327 ]]
	-- upvalues: Module79 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module79))
end

function Module79:encode() --[[ Line: 20336 ]]
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

function Module79.decode(Buf) --[[ Line: 20356 ]]
	-- upvalues: Module79 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module79.new()
	local v80 = 0
	while v80 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2498 = ProtoModule.readTag(Buf, v80)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2498 = ProtoModule.readVarInt(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2498 = ProtoModule.readBuffer(Buf, v80)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2498 = ProtoModule.readBuffer(Buf, v80)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v80)
				v80 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2498 = ProtoModule.readFixed32(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2498 = ProtoModule.readFixed64(Buf, v80)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module79:jsonEncode() --[[ Line: 20404 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module79:jsonDecode() --[[ Line: 20418 ]]
	-- upvalues: Module79 (copy), t (copy)
	local NewModule = Module79.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module79.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = Module79
TypeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local Module80 = {}
Module80.__index = Module80

function Module80.new(p1) --[[ Line: 20448 ]]
	-- upvalues: Module80 (copy)
	return (setmetatable({
		filter_groups = if p1 == nil or p1.filter_groups == nil then {} else p1.filter_groups,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters
	}, Module80))
end

function Module80:encode() --[[ Line: 20459 ]]
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

function Module80.decode(Buf) --[[ Line: 20501 ]]
	-- upvalues: Module80 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module80.new()
	local v81 = 0
	while v81 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2526 = ProtoModule.readTag(Buf, v81)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.secondary_sort_id, v2526 = ProtoModule.readVarIntI32(Buf, v81)
			elseif Tag == 5 then
				NewModule.primary_sort_id, v2526 = ProtoModule.readVarIntI32(Buf, v81)
			else
				local _
				_, v2526 = ProtoModule.readVarInt(Buf, v81)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2526 = ProtoModule.readBuffer(Buf, v81)
				table.insert(NewModule.filter_groups, t.FilterPillsInputData_FilterGroup.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2526 = ProtoModule.readBuffer(Buf, v81)
				NewModule.sort_id = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v2526 = ProtoModule.readBuffer(Buf, v81)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v2526 = ProtoModule.readBuffer(Buf, v81)
				NewModule.applied_filters = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v81)
				v81 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2526 = ProtoModule.readFixed32(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2526 = ProtoModule.readFixed64(Buf, v81)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module80:jsonEncode() --[[ Line: 20569 ]]
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

function Module80:jsonDecode() --[[ Line: 20603 ]]
	-- upvalues: Module80 (copy), t (copy)
	local NewModule = Module80.new()
	
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

Module80.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = Module80
TypeRegistryModule.default:register(t.FilterPillsInputData)
local Module81 = {}
Module81.__index = Module81

function Module81.new(p1) --[[ Line: 20677 ]]
	-- upvalues: Module81 (copy)
	return (setmetatable({
		filter_id = if p1 == nil or p1.filter_id == nil then "" else p1.filter_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		default_option_id = if p1 == nil or p1.default_option_id == nil then "" else p1.default_option_id,
		selected_option_id = if p1 == nil or p1.selected_option_id == nil then "" else p1.selected_option_id,
		filter_type = if p1 == nil or p1.filter_type == nil then "" else p1.filter_type,
		inactive_option_ids = if p1 == nil or p1.inactive_option_ids == nil then {} else p1.inactive_option_ids,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, Module81))
end

function Module81:encode() --[[ Line: 20694 ]]
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

function Module81.decode(Buf) --[[ Line: 20748 ]]
	-- upvalues: Module81 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module81.new()
	local v82 = 0
	while v82 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2563 = ProtoModule.readTag(Buf, v82)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2563 = ProtoModule.readVarInt(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.filter_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2563 = ProtoModule.readBuffer(Buf, v82)
				table.insert(NewModule.options, t.FilterPillsInputData_FilterOption.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.default_option_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.selected_option_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.filter_type = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2563 = ProtoModule.readBuffer(Buf, v82)
				table.insert(NewModule.inactive_option_ids, buffer.tostring(Buffer7))
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v2563 = ProtoModule.readBuffer(Buf, v82)
				NewModule.info_text = buffer.tostring(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v82)
				v82 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2563 = ProtoModule.readFixed32(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2563 = ProtoModule.readFixed64(Buf, v82)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module81:jsonEncode() --[[ Line: 20826 ]]
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

function Module81:jsonDecode() --[[ Line: 20872 ]]
	-- upvalues: Module81 (copy), t (copy)
	local NewModule = Module81.new()
	
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

Module81.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = Module81
TypeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local Module82 = {}
Module82.__index = Module82

function Module82.new(p1) --[[ Line: 20969 ]]
	-- upvalues: Module82 (copy)
	return (setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		option_context_tag = if p1 == nil or p1.option_context_tag == nil then "" else p1.option_context_tag
	}, Module82))
end

function Module82:encode() --[[ Line: 20979 ]]
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

function Module82.decode(Buf) --[[ Line: 21003 ]]
	-- upvalues: Module82 (copy), ProtoModule (copy)
	local NewModule = Module82.new()
	local v83 = 0
	while v83 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2595 = ProtoModule.readTag(Buf, v83)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2595 = ProtoModule.readVarInt(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2595 = ProtoModule.readBuffer(Buf, v83)
				NewModule.option_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2595 = ProtoModule.readBuffer(Buf, v83)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2595 = ProtoModule.readBuffer(Buf, v83)
				NewModule.option_context_tag = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v83)
				v83 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2595 = ProtoModule.readFixed32(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2595 = ProtoModule.readFixed64(Buf, v83)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module82:jsonEncode() --[[ Line: 21056 ]]
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

function Module82:jsonDecode() --[[ Line: 21074 ]]
	-- upvalues: Module82 (copy)
	local NewModule = Module82.new()
	
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

Module82.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = Module82
TypeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local Module83 = {}
Module83.__index = Module83

function Module83.new(p1) --[[ Line: 21120 ]]
	-- upvalues: Module83 (copy)
	return (setmetatable({
		sort_options = if p1 == nil or p1.sort_options == nil then {} else p1.sort_options,
		selected_sort_id = if p1 == nil or p1.selected_sort_id == nil then "" else p1.selected_sort_id
	}, Module83))
end

function Module83:encode() --[[ Line: 21127 ]]
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

function Module83.decode(Buf) --[[ Line: 21149 ]]
	-- upvalues: Module83 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module83.new()
	local v84 = 0
	while v84 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2616 = ProtoModule.readTag(Buf, v84)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2616 = ProtoModule.readVarInt(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2616 = ProtoModule.readBuffer(Buf, v84)
				table.insert(NewModule.sort_options, t.SortSelectorInputData_SortOption.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2616 = ProtoModule.readBuffer(Buf, v84)
				NewModule.selected_sort_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v84)
				v84 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2616 = ProtoModule.readFixed32(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2616 = ProtoModule.readFixed64(Buf, v84)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module83:jsonEncode() --[[ Line: 21197 ]]
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

function Module83:jsonDecode() --[[ Line: 21215 ]]
	-- upvalues: Module83 (copy), t (copy)
	local NewModule = Module83.new()
	
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

Module83.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = Module83
TypeRegistryModule.default:register(t.SortSelectorInputData)
local Module84 = {}
Module84.__index = Module84

function Module84.new(p1) --[[ Line: 21261 ]]
	-- upvalues: Module84 (copy)
	return (setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type
	}, Module84))
end

function Module84:encode() --[[ Line: 21271 ]]
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

function Module84.decode(Buf) --[[ Line: 21295 ]]
	-- upvalues: Module84 (copy), ProtoModule (copy)
	local NewModule = Module84.new()
	local v85 = 0
	while v85 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2640 = ProtoModule.readTag(Buf, v85)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2640 = ProtoModule.readVarInt(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2640 = ProtoModule.readBuffer(Buf, v85)
				NewModule.sort_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2640 = ProtoModule.readBuffer(Buf, v85)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2640 = ProtoModule.readBuffer(Buf, v85)
				NewModule.content_type = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v85)
				v85 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2640 = ProtoModule.readFixed32(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2640 = ProtoModule.readFixed64(Buf, v85)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module84:jsonEncode() --[[ Line: 21348 ]]
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

function Module84:jsonDecode() --[[ Line: 21366 ]]
	-- upvalues: Module84 (copy)
	local NewModule = Module84.new()
	
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

Module84.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = Module84
TypeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local Module85 = {}
Module85.__index = Module85

function Module85.new(p1) --[[ Line: 21412 ]]
	-- upvalues: Module85 (copy)
	return (setmetatable({
		selected_option = if p1 == nil or p1.selected_option == nil then "" else p1.selected_option,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		experience_carousel = if p1 == nil or p1.experience_carousel == nil then nil else p1.experience_carousel
	}, Module85))
end

function Module85:encode() --[[ Line: 21424 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.selected_option)
	end
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.experience_carousel ~= nil then
		local EncodeResult = self.experience_carousel:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module85.decode(Buf) --[[ Line: 21452 ]]
	-- upvalues: Module85 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module85.new()
	local v86 = 0
	while v86 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2664 = ProtoModule.readTag(Buf, v86)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2664 = ProtoModule.readVarInt(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2664 = ProtoModule.readBuffer(Buf, v86)
				NewModule.selected_option = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2664 = ProtoModule.readBuffer(Buf, v86)
				table.insert(NewModule.options, t.SelectorOption.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2664 = ProtoModule.readBuffer(Buf, v86)
				NewModule.experience_carousel = t.ExperienceCarouselInputData.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v86)
				v86 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2664 = ProtoModule.readFixed32(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2664 = ProtoModule.readFixed64(Buf, v86)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module85:jsonEncode() --[[ Line: 21505 ]]
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
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
	return t
end

function Module85:jsonDecode() --[[ Line: 21527 ]]
	-- upvalues: Module85 (copy), t (copy)
	local NewModule = Module85.new()
	
	if self.selected_option ~= nil then
		NewModule.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		NewModule.selected_option = self.selectedOption
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
	return NewModule
end

Module85.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = Module85
TypeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local Module86 = {}
Module86.__index = Module86

function Module86.new(p1) --[[ Line: 21572 ]]
	-- upvalues: Module86 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		preview_rows = if p1 == nil or p1.preview_rows == nil then 0 else p1.preview_rows,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = p1 ~= nil and p1.see_all_button ~= nil and p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, Module86))
end

function Module86:encode() --[[ Line: 21586 ]]
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

function Module86.decode(Buf) --[[ Line: 21621 ]]
	-- upvalues: Module86 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module86.new()
	local v87 = 0
	while v87 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2693 = ProtoModule.readTag(Buf, v87)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				NewModule.preview_rows, v2693 = ProtoModule.readVarIntI64(Buf, v87)
			elseif Tag == 5 then
				local VarInt
				VarInt, v2693 = ProtoModule.readVarInt(Buf, v87)
				NewModule.see_all_button = VarInt ~= 0
			else
				local _
				_, v2693 = ProtoModule.readVarInt(Buf, v87)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2693 = ProtoModule.readBuffer(Buf, v87)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2693 = ProtoModule.readBuffer(Buf, v87)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer2)
			elseif Tag == 6 then
				local Buffer3
				Buffer3, v2693 = ProtoModule.readBuffer(Buf, v87)
				NewModule.information_popover_text = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v87)
				v87 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2693 = ProtoModule.readFixed32(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2693 = ProtoModule.readFixed64(Buf, v87)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module86:jsonEncode() --[[ Line: 21684 ]]
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

function Module86:jsonDecode() --[[ Line: 21710 ]]
	-- upvalues: Module86 (copy), t (copy)
	local NewModule = Module86.new()
	
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

Module86.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = Module86
TypeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local Module87 = {}
Module87.__index = Module87

function Module87.new(p1) --[[ Line: 21768 ]]
	-- upvalues: Module87 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		num_items_to_show = if p1 == nil or p1.num_items_to_show == nil then 0 else p1.num_items_to_show,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = p1 ~= nil and p1.see_all_button ~= nil and p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, Module87))
end

function Module87:encode() --[[ Line: 21782 ]]
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

function Module87.decode(Buf) --[[ Line: 21819 ]]
	-- upvalues: Module87 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module87.new()
	local v88 = 0
	while v88 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2721 = ProtoModule.readTag(Buf, v88)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.num_items_to_show, v2721 = ProtoModule.readVarIntI64(Buf, v88)
			elseif Tag == 6 then
				local VarInt
				VarInt, v2721 = ProtoModule.readVarInt(Buf, v88)
				NewModule.see_all_button = VarInt ~= 0
			else
				local _
				_, v2721 = ProtoModule.readVarInt(Buf, v88)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2721 = ProtoModule.readBuffer(Buf, v88)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2721 = ProtoModule.readBuffer(Buf, v88)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer2)
			elseif Tag == 7 then
				local Buffer3
				Buffer3, v2721 = ProtoModule.readBuffer(Buf, v88)
				NewModule.information_popover_text = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v88)
				v88 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2721 = ProtoModule.readFixed32(Buf, v88)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2721 = ProtoModule.readFixed64(Buf, v88)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module87:jsonEncode() --[[ Line: 21884 ]]
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

function Module87:jsonDecode() --[[ Line: 21912 ]]
	-- upvalues: Module87 (copy), t (copy)
	local NewModule = Module87.new()
	
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

Module87.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = Module87
TypeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local Module88 = {}
Module88.__index = Module88

function Module88.new(p1) --[[ Line: 21970 ]]
	-- upvalues: Module88 (copy)
	return (setmetatable({
		background_layers = if p1 == nil or p1.background_layers == nil then {} else p1.background_layers
	}, Module88))
end

function Module88:encode() --[[ Line: 21976 ]]
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

function Module88.decode(Buf) --[[ Line: 21993 ]]
	-- upvalues: Module88 (copy), ProtoModule (copy), BackgroundLayerModule (copy)
	local NewModule = Module88.new()
	local v89 = 0
	while v89 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2741 = ProtoModule.readTag(Buf, v89)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2741 = ProtoModule.readVarInt(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2741 = ProtoModule.readBuffer(Buf, v89)
				table.insert(NewModule.background_layers, BackgroundLayerModule.BackgroundLayer.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v89)
				v89 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2741 = ProtoModule.readFixed32(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2741 = ProtoModule.readFixed64(Buf, v89)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module88:jsonEncode() --[[ Line: 22039 ]]
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

function Module88:jsonDecode() --[[ Line: 22053 ]]
	-- upvalues: Module88 (copy), BackgroundLayerModule (copy)
	local NewModule = Module88.new()
	
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

Module88.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = Module88
TypeRegistryModule.default:register(t.WidgetStyleData)
local Module89 = {}
Module89.__index = Module89

function Module89.new(p1) --[[ Line: 22097 ]]
	-- upvalues: Module89 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		available_until = if p1 == nil or p1.available_until == nil then "" else p1.available_until,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style
	}, Module89))
end

function Module89:encode() --[[ Line: 22107 ]]
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

function Module89.decode(Buf) --[[ Line: 22132 ]]
	-- upvalues: Module89 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module89.new()
	local v90 = 0
	while v90 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2765 = ProtoModule.readTag(Buf, v90)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2765 = ProtoModule.readVarInt(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2765 = ProtoModule.readBuffer(Buf, v90)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2765 = ProtoModule.readBuffer(Buf, v90)
				NewModule.available_until = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2765 = ProtoModule.readBuffer(Buf, v90)
				NewModule.widget_style = t.WidgetStyleData.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v90)
				v90 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2765 = ProtoModule.readFixed32(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2765 = ProtoModule.readFixed64(Buf, v90)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module89:jsonEncode() --[[ Line: 22185 ]]
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

function Module89:jsonDecode() --[[ Line: 22203 ]]
	-- upvalues: Module89 (copy), t (copy)
	local NewModule = Module89.new()
	
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

Module89.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = Module89
TypeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local Module90 = {}
Module90.__index = Module90

function Module90.new(p1) --[[ Line: 22245 ]]
	-- upvalues: Module90 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, Module90))
end

function Module90:encode() --[[ Line: 22254 ]]
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

function Module90.decode(Buf) --[[ Line: 22284 ]]
	-- upvalues: Module90 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module90.new()
	local v91 = 0
	while v91 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2794 = ProtoModule.readTag(Buf, v91)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2794 = ProtoModule.readVarInt(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2794 = ProtoModule.readBuffer(Buf, v91)
				local DecodeResult = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2794 = ProtoModule.readBuffer(Buf, v91)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v91)
				v91 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2794 = ProtoModule.readFixed32(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2794 = ProtoModule.readFixed64(Buf, v91)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module90:jsonEncode() --[[ Line: 22339 ]]
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

function Module90:jsonDecode() --[[ Line: 22361 ]]
	-- upvalues: Module90 (copy), t (copy)
	local NewModule = Module90.new()
	
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

Module90.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = Module90
TypeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local Module91 = {}
Module91.__index = Module91

function Module91.new(p1) --[[ Line: 22419 ]]
	-- upvalues: Module91 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module91))
end

function Module91:encode() --[[ Line: 22428 ]]
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

function Module91.decode(Buf) --[[ Line: 22450 ]]
	-- upvalues: Module91 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module91.new()
	local v92 = 0
	while v92 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2822 = ProtoModule.readTag(Buf, v92)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2822 = ProtoModule.readVarInt(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2822 = ProtoModule.readBuffer(Buf, v92)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2822 = ProtoModule.readBuffer(Buf, v92)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v92)
				v92 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2822 = ProtoModule.readFixed32(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2822 = ProtoModule.readFixed64(Buf, v92)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module91:jsonEncode() --[[ Line: 22500 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module91:jsonDecode() --[[ Line: 22516 ]]
	-- upvalues: Module91 (copy), t (copy)
	local NewModule = Module91.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module91.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = Module91
TypeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local Module92 = {}
Module92.__index = Module92

function Module92.new(p1) --[[ Line: 22547 ]]
	-- upvalues: Module92 (copy)
	return (setmetatable({
		marketplace_catalog_category_items = if p1 == nil or p1.marketplace_catalog_category_items == nil then {} else p1.marketplace_catalog_category_items,
		active_category_id = if p1 == nil or p1.active_category_id == nil then "" else p1.active_category_id,
		active_tooltip_idx = if p1 == nil or p1.active_tooltip_idx == nil then 0 else p1.active_tooltip_idx
	}, Module92))
end

function Module92:encode() --[[ Line: 22560 ]]
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

function Module92.decode(Buf) --[[ Line: 22589 ]]
	-- upvalues: Module92 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module92.new()
	local v93 = 0
	while v93 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2844 = ProtoModule.readTag(Buf, v93)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.active_tooltip_idx, v2844 = ProtoModule.readVarIntI64(Buf, v93)
			else
				local _
				_, v2844 = ProtoModule.readVarInt(Buf, v93)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2844 = ProtoModule.readBuffer(Buf, v93)
				table.insert(NewModule.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2844 = ProtoModule.readBuffer(Buf, v93)
				NewModule.active_category_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v93)
				v93 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2844 = ProtoModule.readFixed32(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2844 = ProtoModule.readFixed64(Buf, v93)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module92:jsonEncode() --[[ Line: 22647 ]]
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

function Module92:jsonDecode() --[[ Line: 22671 ]]
	-- upvalues: Module92 (copy), t (copy)
	local NewModule = Module92.new()
	
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

Module92.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = Module92
TypeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local Module93 = {}
Module93.__index = Module93

function Module93.new(p1) --[[ Line: 22734 ]]
	-- upvalues: Module93 (copy)
	return (setmetatable({
		marketplace_catalog_category_item_id = if p1 == nil or p1.marketplace_catalog_category_item_id == nil then "" else p1.marketplace_catalog_category_item_id
	}, Module93))
end

function Module93:encode() --[[ Line: 22748 ]]
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

function Module93.decode(Buf) --[[ Line: 22764 ]]
	-- upvalues: Module93 (copy), ProtoModule (copy)
	local NewModule = Module93.new()
	local v94 = 0
	while v94 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2864 = ProtoModule.readTag(Buf, v94)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2864 = ProtoModule.readVarInt(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2864 = ProtoModule.readBuffer(Buf, v94)
				NewModule.marketplace_catalog_category_item_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v94)
				v94 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2864 = ProtoModule.readFixed32(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2864 = ProtoModule.readFixed64(Buf, v94)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module93:jsonEncode() --[[ Line: 22809 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function Module93:jsonDecode() --[[ Line: 22821 ]]
	-- upvalues: Module93 (copy)
	local NewModule = Module93.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		NewModule.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		NewModule.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return NewModule
end

Module93.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = Module93
TypeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local Module94 = {}
Module94.__index = Module94

function Module94.new(p1) --[[ Line: 22854 ]]
	-- upvalues: Module94 (copy)
	return (setmetatable({
		hero_icon = if p1 == nil or p1.hero_icon == nil then nil else p1.hero_icon,
		body_dismiss_button_text = if p1 == nil or p1.body_dismiss_button_text == nil then "" else p1.body_dismiss_button_text,
		body_title = if p1 == nil or p1.body_title == nil then "" else p1.body_title,
		body_rich_text = if p1 == nil or p1.body_rich_text == nil then "" else p1.body_rich_text,
		terms_link_text = if p1 == nil or p1.terms_link_text == nil then nil else p1.terms_link_text,
		terms_title = if p1 == nil or p1.terms_title == nil then nil else p1.terms_title,
		terms_body_rich_text = if p1 == nil or p1.terms_body_rich_text == nil then nil else p1.terms_body_rich_text,
		terms_dismiss_button_text = if p1 == nil or p1.terms_dismiss_button_text == nil then nil else p1.terms_dismiss_button_text,
		offer_id = if p1 == nil or p1.offer_id == nil then "" else p1.offer_id
	}, Module94))
end

function Module94:encode() --[[ Line: 22876 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.hero_icon ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.hero_icon)
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.body_dismiss_button_text)
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.body_title)
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.body_rich_text)
	end
	if self.terms_link_text ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.terms_link_text)
	end
	if self.terms_title ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.terms_title)
	end
	if self.terms_body_rich_text ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.terms_body_rich_text)
	end
	if self.terms_dismiss_button_text ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.terms_dismiss_button_text)
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.offer_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module94.decode(Buf) --[[ Line: 22930 ]]
	-- upvalues: Module94 (copy), ProtoModule (copy)
	local NewModule = Module94.new()
	local v95 = 0
	while v95 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2896 = ProtoModule.readTag(Buf, v95)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2896 = ProtoModule.readVarInt(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.hero_icon = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.body_dismiss_button_text = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.body_title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.body_rich_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.terms_link_text = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.terms_title = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.terms_body_rich_text = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.terms_dismiss_button_text = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v2896 = ProtoModule.readBuffer(Buf, v95)
				NewModule.offer_id = buffer.tostring(Buffer9)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v95)
				v95 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2896 = ProtoModule.readFixed32(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2896 = ProtoModule.readFixed64(Buf, v95)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module94:jsonEncode() --[[ Line: 23013 ]]
	local t = {}
	
	if self.hero_icon ~= nil then
		t.heroIcon = self.hero_icon
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		t.bodyDismissButtonText = self.body_dismiss_button_text
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		t.bodyTitle = self.body_title
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		t.bodyRichText = self.body_rich_text
	end
	if self.terms_link_text ~= nil then
		t.termsLinkText = self.terms_link_text
	end
	if self.terms_title ~= nil then
		t.termsTitle = self.terms_title
	end
	if self.terms_body_rich_text ~= nil then
		t.termsBodyRichText = self.terms_body_rich_text
	end
	if self.terms_dismiss_button_text ~= nil then
		t.termsDismissButtonText = self.terms_dismiss_button_text
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		t.offerId = self.offer_id
	end
	return t
end

function Module94:jsonDecode() --[[ Line: 23055 ]]
	-- upvalues: Module94 (copy)
	local NewModule = Module94.new()
	
	if self.hero_icon ~= nil then
		NewModule.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		NewModule.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		NewModule.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		NewModule.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		NewModule.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		NewModule.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		NewModule.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		NewModule.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		NewModule.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		NewModule.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		NewModule.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		NewModule.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		NewModule.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		NewModule.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		NewModule.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		NewModule.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		NewModule.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		NewModule.offer_id = self.offerId
	end
	return NewModule
end

Module94.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = Module94
TypeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local Module95 = {}
Module95.__index = Module95

function Module95.new(p1) --[[ Line: 23147 ]]
	-- upvalues: Module95 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type,
		prefer_three_dimensional = p1 ~= nil and p1.prefer_three_dimensional ~= nil and p1.prefer_three_dimensional,
		bundle_type = if p1 == nil or p1.bundle_type == nil then nil else p1.bundle_type,
		bundle_items = if p1 == nil or p1.bundle_items == nil then {} else p1.bundle_items
	}, Module95))
end

function Module95:encode() --[[ Line: 23161 ]]
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
	if self.prefer_three_dimensional then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.prefer_three_dimensional then 1 else 0)
	end
	if self.bundle_type ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.bundle_type)
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for _, bundleItem in self.bundle_items do
			local EncodeResult = bundleItem:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module95.decode(Buf) --[[ Line: 23198 ]]
	-- upvalues: Module95 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module95.new()
	local v96 = 0
	while v96 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2929 = ProtoModule.readTag(Buf, v96)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v2929 = ProtoModule.readVarInt(Buf, v96)
				NewModule.prefer_three_dimensional = VarInt ~= 0
			else
				local _
				_, v2929 = ProtoModule.readVarInt(Buf, v96)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2929 = ProtoModule.readBuffer(Buf, v96)
				NewModule.item_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2929 = ProtoModule.readBuffer(Buf, v96)
				NewModule.item_type = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v2929 = ProtoModule.readBuffer(Buf, v96)
				NewModule.bundle_type = buffer.tostring(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v2929 = ProtoModule.readBuffer(Buf, v96)
				table.insert(NewModule.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(Buffer4))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v96)
				v96 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2929 = ProtoModule.readFixed32(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2929 = ProtoModule.readFixed64(Buf, v96)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module95:jsonEncode() --[[ Line: 23264 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	if self.prefer_three_dimensional then
		t.preferThreeDimensional = self.prefer_three_dimensional
	end
	if self.bundle_type ~= nil then
		t.bundleType = self.bundle_type
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		local BundleItems = {}
		
		for _, bundleItem in self.bundle_items do
			table.insert(BundleItems, bundleItem:jsonEncode())
		end
		t.bundleItems = BundleItems
	end
	return t
end

function Module95:jsonDecode() --[[ Line: 23294 ]]
	-- upvalues: Module95 (copy), t (copy)
	local NewModule = Module95.new()
	
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
	if self.prefer_three_dimensional ~= nil then
		NewModule.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		NewModule.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		NewModule.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		NewModule.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local Bundle_items = {}
		
		for _, bundleItem in self.bundle_items do
			table.insert(Bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(bundleItem))
		end
		NewModule.bundle_items = Bundle_items
	end
	if self.bundleItems ~= nil then
		local Bundle_items = {}
		
		for _, bundleItem1 in self.bundleItems do
			table.insert(Bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(bundleItem1))
		end
		NewModule.bundle_items = Bundle_items
	end
	return NewModule
end

Module95.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceItemMediaHeaderInputData"
}
t.MarketplaceItemMediaHeaderInputData = Module95
TypeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData)
local Module96 = {}
Module96.__index = Module96

function Module96.new(p1) --[[ Line: 23366 ]]
	-- upvalues: Module96 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type
	}, Module96))
end

function Module96:encode() --[[ Line: 23375 ]]
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

function Module96.decode(Buf) --[[ Line: 23396 ]]
	-- upvalues: Module96 (copy), ProtoModule (copy)
	local NewModule = Module96.new()
	local v97 = 0
	while v97 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2954 = ProtoModule.readTag(Buf, v97)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2954 = ProtoModule.readVarInt(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2954 = ProtoModule.readBuffer(Buf, v97)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2954 = ProtoModule.readBuffer(Buf, v97)
				NewModule.type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v97)
				v97 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2954 = ProtoModule.readFixed32(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2954 = ProtoModule.readFixed64(Buf, v97)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module96:jsonEncode() --[[ Line: 23446 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function Module96:jsonDecode() --[[ Line: 23462 ]]
	-- upvalues: Module96 (copy)
	local NewModule = Module96.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	return NewModule
end

Module96.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData_BundleItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.BundleItem"
}
t.MarketplaceItemMediaHeaderInputData_BundleItem = Module96
TypeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData_BundleItem)
local Module97 = {}
Module97.__index = Module97

function Module97.new(p1) --[[ Line: 23492 ]]
	-- upvalues: Module97 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		preview_columns = if p1 == nil or p1.preview_columns == nil then 0 else p1.preview_columns,
		impression_id = if p1 == nil or p1.impression_id == nil then "" else p1.impression_id
	}, Module97))
end

function Module97:encode() --[[ Line: 23500 ]]
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

function Module97.decode(Buf) --[[ Line: 23527 ]]
	-- upvalues: Module97 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module97.new()
	local v98 = 0
	while v98 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2976 = ProtoModule.readTag(Buf, v98)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.preview_columns, v2976 = ProtoModule.readVarIntI32(Buf, v98)
			else
				local _
				_, v2976 = ProtoModule.readVarInt(Buf, v98)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2976 = ProtoModule.readBuffer(Buf, v98)
				table.insert(NewModule.items, t.CatalogItemGridInputData_CatalogItem.decode(Buffer1))
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2976 = ProtoModule.readBuffer(Buf, v98)
				NewModule.impression_id = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v98)
				v98 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2976 = ProtoModule.readFixed32(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2976 = ProtoModule.readFixed64(Buf, v98)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module97:jsonEncode() --[[ Line: 23580 ]]
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

function Module97:jsonDecode() --[[ Line: 23602 ]]
	-- upvalues: Module97 (copy), t (copy)
	local NewModule = Module97.new()
	
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

Module97.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = Module97
TypeRegistryModule.default:register(t.CatalogItemGridInputData)
local Module98 = {}
Module98.__index = Module98

function Module98.new(p1) --[[ Line: 23647 ]]
	-- upvalues: Module98 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type
	}, Module98))
end

function Module98:encode() --[[ Line: 23656 ]]
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

function Module98.decode(Buf) --[[ Line: 23675 ]]
	-- upvalues: Module98 (copy), ProtoModule (copy)
	local NewModule = Module98.new()
	local v99 = 0
	while v99 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2997 = ProtoModule.readTag(Buf, v99)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2997 = ProtoModule.readVarInt(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2997 = ProtoModule.readBuffer(Buf, v99)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2997 = ProtoModule.readBuffer(Buf, v99)
				NewModule.type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v99)
				v99 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2997 = ProtoModule.readFixed32(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2997 = ProtoModule.readFixed64(Buf, v99)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module98:jsonEncode() --[[ Line: 23723 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function Module98:jsonDecode() --[[ Line: 23737 ]]
	-- upvalues: Module98 (copy)
	local NewModule = Module98.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	return NewModule
end

Module98.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = Module98
TypeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local Module99 = {}
Module99.__index = Module99

function Module99.new(p1) --[[ Line: 23767 ]]
	-- upvalues: Module99 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools,
		search_session_id = if p1 == nil or p1.search_session_id == nil then "" else p1.search_session_id,
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query
	}, Module99))
end

function Module99:encode() --[[ Line: 23779 ]]
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
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.search_session_id)
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.search_query)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module99.decode(Buf) --[[ Line: 23833 ]]
	-- upvalues: Module99 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module99.new()
	local v100 = 0
	while v100 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3040 = ProtoModule.readTag(Buf, v100)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3040 = ProtoModule.readVarInt(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3040 = ProtoModule.readBuffer(Buf, v100)
				local DecodeResult = t.SearchResultsFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3040 = ProtoModule.readBuffer(Buf, v100)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3040 = ProtoModule.readBuffer(Buf, v100)
				local DecodeResult = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(Buffer3)
				local NewResult = t.ContentPool.new()
				NewModule.content_pools[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3040 = ProtoModule.readBuffer(Buf, v100)
				NewModule.search_session_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3040 = ProtoModule.readBuffer(Buf, v100)
				NewModule.search_query = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v100)
				v100 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3040 = ProtoModule.readFixed32(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3040 = ProtoModule.readFixed64(Buf, v100)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module99:jsonEncode() --[[ Line: 23910 ]]
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
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		t.searchSessionId = self.search_session_id
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		t.searchQuery = self.search_query
	end
	return t
end

function Module99:jsonDecode() --[[ Line: 23948 ]]
	-- upvalues: Module99 (copy), t (copy)
	local NewModule = Module99.new()
	
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
	if self.search_session_id ~= nil then
		NewModule.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		NewModule.search_session_id = self.searchSessionId
	end
	if self.search_query ~= nil then
		NewModule.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		NewModule.search_query = self.searchQuery
	end
	return NewModule
end

Module99.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = Module99
TypeRegistryModule.default:register(t.SearchResultsFeedInputData)
local Module100 = {}
Module100.__index = Module100

function Module100.new(p1) --[[ Line: 24038 ]]
	-- upvalues: Module100 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module100))
end

function Module100:encode() --[[ Line: 24047 ]]
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

function Module100.decode(Buf) --[[ Line: 24069 ]]
	-- upvalues: Module100 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module100.new()
	local v101 = 0
	while v101 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3076 = ProtoModule.readTag(Buf, v101)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3076 = ProtoModule.readVarInt(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3076 = ProtoModule.readBuffer(Buf, v101)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3076 = ProtoModule.readBuffer(Buf, v101)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v101)
				v101 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3076 = ProtoModule.readFixed32(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3076 = ProtoModule.readFixed64(Buf, v101)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module100:jsonEncode() --[[ Line: 24119 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module100:jsonDecode() --[[ Line: 24135 ]]
	-- upvalues: Module100 (copy), t (copy)
	local NewModule = Module100.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module100.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = Module100
TypeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local Module101 = {}
Module101.__index = Module101

function Module101.new(p1) --[[ Line: 24165 ]]
	-- upvalues: Module101 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module101))
end

function Module101:encode() --[[ Line: 24174 ]]
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

function Module101.decode(Buf) --[[ Line: 24196 ]]
	-- upvalues: Module101 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module101.new()
	local v102 = 0
	while v102 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3096 = ProtoModule.readTag(Buf, v102)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3096 = ProtoModule.readVarInt(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3096 = ProtoModule.readBuffer(Buf, v102)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3096 = ProtoModule.readBuffer(Buf, v102)
				NewModule.value = t.ContentPool.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v102)
				v102 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3096 = ProtoModule.readFixed32(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3096 = ProtoModule.readFixed64(Buf, v102)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module101:jsonEncode() --[[ Line: 24246 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module101:jsonDecode() --[[ Line: 24262 ]]
	-- upvalues: Module101 (copy), t (copy)
	local NewModule = Module101.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.ContentPool.jsonDecode(self.value)
	end
	return NewModule
end

Module101.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = Module101
TypeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local Module102 = {}
Module102.__index = Module102

function Module102.new(p1) --[[ Line: 24292 ]]
	-- upvalues: Module102 (copy)
	return (setmetatable({
		prefix = if p1 == nil or p1.prefix == nil then "" else p1.prefix,
		algorithm_name = if p1 == nil or p1.algorithm_name == nil then "" else p1.algorithm_name,
		max_results = if p1 == nil or p1.max_results == nil then 0 else p1.max_results,
		suggestions = if p1 == nil or p1.suggestions == nil then {} else p1.suggestions
	}, Module102))
end

function Module102:encode() --[[ Line: 24303 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.prefix ~= nil and self.prefix ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.prefix)
	end
	if self.algorithm_name ~= nil and self.algorithm_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.algorithm_name)
	end
	if self.max_results ~= nil and self.max_results ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.max_results)
	end
	if self.suggestions ~= nil and #self.suggestions > 0 then
		for _, suggestion in self.suggestions do
			local EncodeResult = suggestion:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module102.decode(Buf) --[[ Line: 24335 ]]
	-- upvalues: Module102 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module102.new()
	local v103 = 0
	while v103 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3120 = ProtoModule.readTag(Buf, v103)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.max_results, v3120 = ProtoModule.readVarIntU32(Buf, v103)
			else
				local _
				_, v3120 = ProtoModule.readVarInt(Buf, v103)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3120 = ProtoModule.readBuffer(Buf, v103)
				NewModule.prefix = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3120 = ProtoModule.readBuffer(Buf, v103)
				NewModule.algorithm_name = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v3120 = ProtoModule.readBuffer(Buf, v103)
				table.insert(NewModule.suggestions, t.SearchAutocompleteInputData_Suggestion.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v103)
				v103 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3120 = ProtoModule.readFixed32(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3120 = ProtoModule.readFixed64(Buf, v103)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module102:jsonEncode() --[[ Line: 24393 ]]
	local t = {}
	
	if self.prefix ~= nil and self.prefix ~= "" then
		t.prefix = self.prefix
	end
	if self.algorithm_name ~= nil and self.algorithm_name ~= "" then
		t.algorithmName = self.algorithm_name
	end
	if self.max_results ~= nil and self.max_results ~= 0 then
		t.maxResults = self.max_results
	end
	if self.suggestions ~= nil and #self.suggestions > 0 then
		local Suggestions = {}
		
		for _, suggestion in self.suggestions do
			table.insert(Suggestions, suggestion:jsonEncode())
		end
		t.suggestions = Suggestions
	end
	return t
end

function Module102:jsonDecode() --[[ Line: 24419 ]]
	-- upvalues: Module102 (copy), t (copy)
	local NewModule = Module102.new()
	
	if self.prefix ~= nil then
		NewModule.prefix = self.prefix
	end
	if self.algorithm_name ~= nil then
		NewModule.algorithm_name = self.algorithm_name
	end
	if self.algorithmName ~= nil then
		NewModule.algorithm_name = self.algorithmName
	end
	if self.max_results ~= nil then
		NewModule.max_results = self.max_results
	end
	if self.maxResults ~= nil then
		NewModule.max_results = self.maxResults
	end
	if self.suggestions ~= nil then
		local Suggestions = {}
		
		for _, suggestion in self.suggestions do
			table.insert(Suggestions, t.SearchAutocompleteInputData_Suggestion.jsonDecode(suggestion))
		end
		NewModule.suggestions = Suggestions
	end
	return NewModule
end

Module102.descriptor = {
	name = "SearchAutocompleteInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchAutocompleteInputData"
}
t.SearchAutocompleteInputData = Module102
TypeRegistryModule.default:register(t.SearchAutocompleteInputData)
local Module103 = {}
Module103.__index = Module103

function Module103.new(p1) --[[ Line: 24468 ]]
	-- upvalues: t (copy), Module103 (copy)
	return (setmetatable({
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query,
		suggestion_type = if p1 == nil or p1.suggestion_type == nil then assert(t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0), "Enum has no 0 default") else p1.suggestion_type,
		score = if p1 == nil or p1.score == nil then 0 else p1.score,
		position = if p1 == nil or p1.position == nil then 0 else p1.position,
		canonical_title = if p1 == nil or p1.canonical_title == nil then "" else p1.canonical_title,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module103))
end

function Module103:encode() --[[ Line: 24486 ]]
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.search_query)
	end
	if self.suggestion_type ~= nil and (self.suggestion_type ~= nil and self.suggestion_type ~= 0 or self.suggestion_type ~= t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0)) then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, t.SearchAutocompleteInputData_Suggestion_SuggestionType.toNumber(self.suggestion_type))
	end
	if self.score ~= nil and self.score ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult3, WriteTagResult2_2, self.score)
	end
	if self.position ~= nil and self.position ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.position)
	end
	if self.canonical_title ~= nil and self.canonical_title ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.canonical_title)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module103.decode(Buf) --[[ Line: 24536 ]]
	-- upvalues: Module103 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module103.new()
	local v104 = 0
	while v104 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3150 = ProtoModule.readTag(Buf, v104)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v3150 = ProtoModule.readVarIntI32(Buf, v104)
				NewModule.suggestion_type = t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 4 then
				NewModule.position, v3150 = ProtoModule.readVarIntU32(Buf, v104)
			else
				local _
				_, v3150 = ProtoModule.readVarInt(Buf, v104)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3150 = ProtoModule.readBuffer(Buf, v104)
				NewModule.search_query = buffer.tostring(Buffer1)
			elseif Tag == 5 then
				local Buffer2
				Buffer2, v3150 = ProtoModule.readBuffer(Buf, v104)
				NewModule.canonical_title = buffer.tostring(Buffer2)
			elseif Tag == 6 then
				local Buffer3
				Buffer3, v3150 = ProtoModule.readBuffer(Buf, v104)
				NewModule.universe_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v104)
				v104 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3150 = ProtoModule.readFixed32(Buf, v104)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 3 then
				NewModule.score, v3150 = ProtoModule.readDouble(Buf, v104)
			else
				local _
				_, v3150 = ProtoModule.readFixed64(Buf, v104)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module103:jsonEncode() --[[ Line: 24606 ]]
	-- upvalues: t (copy), ProtoModule (copy)
	local t1 = {}
	
	if self.search_query ~= nil and self.search_query ~= "" then
		t1.searchQuery = self.search_query
	end
	if self.suggestion_type ~= nil and (self.suggestion_type ~= nil and self.suggestion_type ~= 0 or self.suggestion_type ~= t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0)) then
		t1.suggestionType = if typeof(self.suggestion_type) == "number" then self.suggestion_type else t.SearchAutocompleteInputData_Suggestion_SuggestionType.toNumber(self.suggestion_type)
	end
	if self.score ~= nil and self.score ~= 0 then
		t1.score = ProtoModule.json.serializeNumber(self.score)
	end
	if self.position ~= nil and self.position ~= 0 then
		t1.position = self.position
	end
	if self.canonical_title ~= nil and self.canonical_title ~= "" then
		t1.canonicalTitle = self.canonical_title
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t1.universeId = self.universe_id
	end
	return t1
end

function Module103:jsonDecode() --[[ Line: 24647 ]]
	-- upvalues: Module103 (copy), t (copy), ProtoModule (copy)
	local NewModule = Module103.new()
	
	if self.search_query ~= nil then
		NewModule.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		NewModule.search_query = self.searchQuery
	end
	if self.suggestion_type ~= nil then
		NewModule.suggestion_type = (if typeof(self.suggestion_type) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestion_type) else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestion_type)) or self.suggestion_type
	end
	if self.suggestionType ~= nil then
		NewModule.suggestion_type = (if typeof(self.suggestionType) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestionType) else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestionType)) or self.suggestionType
	end
	if self.score ~= nil then
		NewModule.score = ProtoModule.json.deserializeNumber(self.score)
	end
	if self.position ~= nil then
		NewModule.position = self.position
	end
	if self.canonical_title ~= nil then
		NewModule.canonical_title = self.canonical_title
	end
	if self.canonicalTitle ~= nil then
		NewModule.canonical_title = self.canonicalTitle
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module103.descriptor = {
	name = "SearchAutocompleteInputData_Suggestion",
	fullName = "roblox.apppageplatform.shared.v1beta1.Suggestion"
}
t.SearchAutocompleteInputData_Suggestion = Module103
TypeRegistryModule.default:register(t.SearchAutocompleteInputData_Suggestion)
t.SearchAutocompleteInputData_Suggestion_SuggestionType = {
	fromNumber = function(p1) --[[ Line: 24721 ]]
		return if p1 == 0 then "SUGGESTION_TYPE_INVALID" elseif p1 == 1 then "SUGGESTION_TYPE_QUERY" elseif p1 == 2 then "SUGGESTION_TYPE_RICH" elseif p1 == 3 then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end,
	toNumber = function(p1) --[[ Line: 24735 ]]
		return if p1 == "SUGGESTION_TYPE_INVALID" then 0 elseif p1 == "SUGGESTION_TYPE_QUERY" then 1 elseif p1 == "SUGGESTION_TYPE_RICH" then 2 elseif p1 == "SUGGESTION_TYPE_TRENDING_QUERY" then 3 else p1
	end,
	fromName = function(p1) --[[ Line: 24749 ]]
		return if p1 == "SUGGESTION_TYPE_INVALID" then "SUGGESTION_TYPE_INVALID" elseif p1 == "SUGGESTION_TYPE_QUERY" then "SUGGESTION_TYPE_QUERY" elseif p1 == "SUGGESTION_TYPE_RICH" then "SUGGESTION_TYPE_RICH" elseif p1 == "SUGGESTION_TYPE_TRENDING_QUERY" then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end
}
local Module104 = {}
Module104.__index = Module104

function Module104.new(p1) --[[ Line: 24768 ]]
	-- upvalues: Module104 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		is_content_locked = p1 ~= nil and p1.is_content_locked ~= nil and p1.is_content_locked
	}, Module104))
end

function Module104:encode() --[[ Line: 24777 ]]
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

function Module104.decode(Buf) --[[ Line: 24796 ]]
	-- upvalues: Module104 (copy), ProtoModule (copy)
	local NewModule = Module104.new()
	local v105 = 0
	while v105 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3171 = ProtoModule.readTag(Buf, v105)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v3171 = ProtoModule.readVarInt(Buf, v105)
				NewModule.is_content_locked = VarInt ~= 0
			else
				local _
				_, v3171 = ProtoModule.readVarInt(Buf, v105)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3171 = ProtoModule.readBuffer(Buf, v105)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v105)
				v105 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3171 = ProtoModule.readFixed32(Buf, v105)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3171 = ProtoModule.readFixed64(Buf, v105)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module104:jsonEncode() --[[ Line: 24844 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function Module104:jsonDecode() --[[ Line: 24858 ]]
	-- upvalues: Module104 (copy)
	local NewModule = Module104.new()
	
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

Module104.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = Module104
TypeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local Module105 = {}
Module105.__index = Module105

function Module105.new(p1) --[[ Line: 24894 ]]
	-- upvalues: Module105 (copy)
	return (setmetatable({
		overview_rich_text = if p1 == nil or p1.overview_rich_text == nil then "" else p1.overview_rich_text,
		result_entry = if p1 == nil or p1.result_entry == nil then nil else p1.result_entry,
		follow_up_queries = if p1 == nil or p1.follow_up_queries == nil then {} else p1.follow_up_queries,
		show_loading = p1 ~= nil and p1.show_loading ~= nil and p1.show_loading,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query,
		universe_ids = if p1 == nil or p1.universe_ids == nil then "" else p1.universe_ids
	}, Module105))
end

function Module105:encode() --[[ Line: 24908 ]]
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
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.universe_ids)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module105.decode(Buf) --[[ Line: 24955 ]]
	-- upvalues: Module105 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module105.new()
	local v106 = 0
	while v106 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3201 = ProtoModule.readTag(Buf, v106)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v3201 = ProtoModule.readVarInt(Buf, v106)
				NewModule.show_loading = VarInt ~= 0
			else
				local _
				_, v3201 = ProtoModule.readVarInt(Buf, v106)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3201 = ProtoModule.readBuffer(Buf, v106)
				NewModule.overview_rich_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3201 = ProtoModule.readBuffer(Buf, v106)
				NewModule.result_entry = t.FeedEntry.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3201 = ProtoModule.readBuffer(Buf, v106)
				table.insert(NewModule.follow_up_queries, buffer.tostring(Buffer3))
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v3201 = ProtoModule.readBuffer(Buf, v106)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v3201 = ProtoModule.readBuffer(Buf, v106)
				NewModule.search_query = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v3201 = ProtoModule.readBuffer(Buf, v106)
				NewModule.universe_ids = buffer.tostring(Buffer6)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v106)
				v106 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3201 = ProtoModule.readFixed32(Buf, v106)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3201 = ProtoModule.readFixed64(Buf, v106)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module105:jsonEncode() --[[ Line: 25028 ]]
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
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		t.universeIds = self.universe_ids
	end
	return t
end

function Module105:jsonDecode() --[[ Line: 25066 ]]
	-- upvalues: Module105 (copy), t (copy)
	local NewModule = Module105.new()
	
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
	if self.universe_ids ~= nil then
		NewModule.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		NewModule.universe_ids = self.universeIds
	end
	return NewModule
end

Module105.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = Module105
TypeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local Module106 = {}
Module106.__index = Module106

function Module106.new(p1) --[[ Line: 25148 ]]
	-- upvalues: Module106 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_items = if p1 == nil or p1.user_items == nil then {} else p1.user_items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, Module106))
end

function Module106:encode() --[[ Line: 25157 ]]
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
	if self.sort_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.sort_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module106.decode(Buf) --[[ Line: 25189 ]]
	-- upvalues: Module106 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module106.new()
	local v107 = 0
	while v107 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3233 = ProtoModule.readTag(Buf, v107)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.max_visible_rows, v3233 = ProtoModule.readVarIntI32(Buf, v107)
			else
				local _
				_, v3233 = ProtoModule.readVarInt(Buf, v107)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3233 = ProtoModule.readBuffer(Buf, v107)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3233 = ProtoModule.readBuffer(Buf, v107)
				table.insert(NewModule.user_items, t.UserListInputData_UserItem.decode(Buffer2))
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v3233 = ProtoModule.readBuffer(Buf, v107)
				NewModule.sort_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v107)
				v107 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3233 = ProtoModule.readFixed32(Buf, v107)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3233 = ProtoModule.readFixed64(Buf, v107)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module106:jsonEncode() --[[ Line: 25247 ]]
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
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function Module106:jsonDecode() --[[ Line: 25273 ]]
	-- upvalues: Module106 (copy), t (copy)
	local NewModule = Module106.new()
	
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
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	return NewModule
end

Module106.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = Module106
TypeRegistryModule.default:register(t.UserListInputData)
local Module107 = {}
Module107.__index = Module107

function Module107.new(p1) --[[ Line: 25331 ]]
	-- upvalues: Module107 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		previous_usernames = if p1 == nil or p1.previous_usernames == nil then {} else p1.previous_usernames
	}, Module107))
end

function Module107:encode() --[[ Line: 25340 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for _, previousUsername in self.previous_usernames do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, previousUsername)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module107.decode(Buf) --[[ Line: 25361 ]]
	-- upvalues: Module107 (copy), ProtoModule (copy)
	local NewModule = Module107.new()
	local v108 = 0
	while v108 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3256 = ProtoModule.readTag(Buf, v108)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3256 = ProtoModule.readVarInt(Buf, v108)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3256 = ProtoModule.readBuffer(Buf, v108)
				NewModule.user_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3256 = ProtoModule.readBuffer(Buf, v108)
				table.insert(NewModule.previous_usernames, buffer.tostring(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v108)
				v108 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3256 = ProtoModule.readFixed32(Buf, v108)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3256 = ProtoModule.readFixed64(Buf, v108)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module107:jsonEncode() --[[ Line: 25409 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		local PreviousUsernames = {}
		
		for _, previousUsername in self.previous_usernames do
			table.insert(PreviousUsernames, previousUsername)
		end
		t.previousUsernames = PreviousUsernames
	end
	return t
end

function Module107:jsonDecode() --[[ Line: 25427 ]]
	-- upvalues: Module107 (copy)
	local NewModule = Module107.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.previous_usernames ~= nil then
		local Previous_usernames = {}
		
		for _, previousUsername in self.previous_usernames do
			table.insert(Previous_usernames, previousUsername)
		end
		NewModule.previous_usernames = Previous_usernames
	end
	if self.previousUsernames ~= nil then
		local Previous_usernames = {}
		
		for _, previousUsername1 in self.previousUsernames do
			table.insert(Previous_usernames, previousUsername1)
		end
		NewModule.previous_usernames = Previous_usernames
	end
	return NewModule
end

Module107.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = Module107
TypeRegistryModule.default:register(t.UserListInputData_UserItem)
local Module108 = {}
Module108.__index = Module108

function Module108.new(p1) --[[ Line: 25473 ]]
	-- upvalues: Module108 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, Module108))
end

function Module108:encode() --[[ Line: 25482 ]]
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
	if self.sort_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.sort_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module108.decode(Buf) --[[ Line: 25514 ]]
	-- upvalues: Module108 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module108.new()
	local v109 = 0
	while v109 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3283 = ProtoModule.readTag(Buf, v109)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.max_visible_rows, v3283 = ProtoModule.readVarIntI32(Buf, v109)
			else
				local _
				_, v3283 = ProtoModule.readVarInt(Buf, v109)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3283 = ProtoModule.readBuffer(Buf, v109)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3283 = ProtoModule.readBuffer(Buf, v109)
				table.insert(NewModule.items, t.CatalogItemListInputData_CatalogItem.decode(Buffer2))
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v3283 = ProtoModule.readBuffer(Buf, v109)
				NewModule.sort_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v109)
				v109 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3283 = ProtoModule.readFixed32(Buf, v109)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3283 = ProtoModule.readFixed64(Buf, v109)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module108:jsonEncode() --[[ Line: 25572 ]]
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
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function Module108:jsonDecode() --[[ Line: 25598 ]]
	-- upvalues: Module108 (copy), t (copy)
	local NewModule = Module108.new()
	
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
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	return NewModule
end

Module108.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = Module108
TypeRegistryModule.default:register(t.CatalogItemListInputData)
local Module109 = {}
Module109.__index = Module109

function Module109.new(p1) --[[ Line: 25647 ]]
	-- upvalues: Module109 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, Module109))
end

function Module109:encode() --[[ Line: 25656 ]]
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

function Module109.decode(Buf) --[[ Line: 25675 ]]
	-- upvalues: Module109 (copy), ProtoModule (copy)
	local NewModule = Module109.new()
	local v110 = 0
	while v110 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3305 = ProtoModule.readTag(Buf, v110)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3305 = ProtoModule.readVarInt(Buf, v110)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3305 = ProtoModule.readBuffer(Buf, v110)
				NewModule.item_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3305 = ProtoModule.readBuffer(Buf, v110)
				NewModule.item_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v110)
				v110 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3305 = ProtoModule.readFixed32(Buf, v110)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3305 = ProtoModule.readFixed64(Buf, v110)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module109:jsonEncode() --[[ Line: 25723 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function Module109:jsonDecode() --[[ Line: 25737 ]]
	-- upvalues: Module109 (copy)
	local NewModule = Module109.new()
	
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

Module109.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = Module109
TypeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local Module110 = {}
Module110.__index = Module110

function Module110.new(p1) --[[ Line: 25775 ]]
	-- upvalues: Module110 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module110))
end

function Module110:encode() --[[ Line: 25783 ]]
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

function Module110.decode(Buf) --[[ Line: 25797 ]]
	-- upvalues: Module110 (copy), ProtoModule (copy)
	local NewModule = Module110.new()
	local v111 = 0
	while v111 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3322 = ProtoModule.readTag(Buf, v111)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3322 = ProtoModule.readVarInt(Buf, v111)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3322 = ProtoModule.readBuffer(Buf, v111)
				NewModule.universe_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v111)
				v111 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3322 = ProtoModule.readFixed32(Buf, v111)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3322 = ProtoModule.readFixed64(Buf, v111)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module110:jsonEncode() --[[ Line: 25840 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function Module110:jsonDecode() --[[ Line: 25850 ]]
	-- upvalues: Module110 (copy)
	local NewModule = Module110.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module110.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = Module110
TypeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local Module111 = {}
Module111.__index = Module111

function Module111.new(p1) --[[ Line: 25880 ]]
	-- upvalues: Module111 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		moment_items = if p1 == nil or p1.moment_items == nil then {} else p1.moment_items
	}, Module111))
end

function Module111:encode() --[[ Line: 25888 ]]
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

function Module111.decode(Buf) --[[ Line: 25915 ]]
	-- upvalues: Module111 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module111.new()
	local v112 = 0
	while v112 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3343 = ProtoModule.readTag(Buf, v112)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3343 = ProtoModule.readVarInt(Buf, v112)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3343 = ProtoModule.readBuffer(Buf, v112)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3343 = ProtoModule.readBuffer(Buf, v112)
				NewModule.subtitle = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3343 = ProtoModule.readBuffer(Buf, v112)
				table.insert(NewModule.moment_items, t.MomentsCarouselInputData_MomentItem.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v112)
				v112 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3343 = ProtoModule.readFixed32(Buf, v112)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3343 = ProtoModule.readFixed64(Buf, v112)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module111:jsonEncode() --[[ Line: 25968 ]]
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

function Module111:jsonDecode() --[[ Line: 25990 ]]
	-- upvalues: Module111 (copy), t (copy)
	local NewModule = Module111.new()
	
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

Module111.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = Module111
TypeRegistryModule.default:register(t.MomentsCarouselInputData)
local Module112 = {}
Module112.__index = Module112

function Module112.new(p1) --[[ Line: 26036 ]]
	-- upvalues: Module112 (copy)
	return (setmetatable({
		moment_id = if p1 == nil or p1.moment_id == nil then "" else p1.moment_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		target_universe_id = if p1 == nil or p1.target_universe_id == nil then "" else p1.target_universe_id,
		target_place_id = if p1 == nil or p1.target_place_id == nil then "" else p1.target_place_id,
		feed_item_id = if p1 == nil or p1.feed_item_id == nil then "" else p1.feed_item_id,
		capture_universe_id = if p1 == nil or p1.capture_universe_id == nil then "" else p1.capture_universe_id
	}, Module112))
end

function Module112:encode() --[[ Line: 26051 ]]
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

function Module112.decode(Buf) --[[ Line: 26090 ]]
	-- upvalues: Module112 (copy), ProtoModule (copy)
	local NewModule = Module112.new()
	local v113 = 0
	while v113 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3374 = ProtoModule.readTag(Buf, v113)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3374 = ProtoModule.readVarInt(Buf, v113)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.moment_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.video_asset_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.target_universe_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.target_place_id = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.feed_item_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v3374 = ProtoModule.readBuffer(Buf, v113)
				NewModule.capture_universe_id = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v113)
				v113 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3374 = ProtoModule.readFixed32(Buf, v113)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3374 = ProtoModule.readFixed64(Buf, v113)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module112:jsonEncode() --[[ Line: 26158 ]]
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

function Module112:jsonDecode() --[[ Line: 26188 ]]
	-- upvalues: Module112 (copy)
	local NewModule = Module112.new()
	
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

Module112.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = Module112
TypeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local Module113 = {}
Module113.__index = Module113

function Module113.new(p1) --[[ Line: 26258 ]]
	-- upvalues: Module113 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		show_download_button = p1 ~= nil and p1.show_download_button ~= nil and p1.show_download_button
	}, Module113))
end

function Module113:encode() --[[ Line: 26268 ]]
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
	if self.show_download_button then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.show_download_button then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module113.decode(Buf) --[[ Line: 26292 ]]
	-- upvalues: Module113 (copy), ProtoModule (copy)
	local NewModule = Module113.new()
	local v114 = 0
	while v114 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3399 = ProtoModule.readTag(Buf, v114)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v3399 = ProtoModule.readVarInt(Buf, v114)
				NewModule.show_download_button = VarInt ~= 0
			else
				local _
				_, v3399 = ProtoModule.readVarInt(Buf, v114)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3399 = ProtoModule.readBuffer(Buf, v114)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3399 = ProtoModule.readBuffer(Buf, v114)
				NewModule.subtitle = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v114)
				v114 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3399 = ProtoModule.readFixed32(Buf, v114)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3399 = ProtoModule.readFixed64(Buf, v114)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module113:jsonEncode() --[[ Line: 26345 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.show_download_button then
		t.showDownloadButton = self.show_download_button
	end
	return t
end

function Module113:jsonDecode() --[[ Line: 26363 ]]
	-- upvalues: Module113 (copy)
	local NewModule = Module113.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.show_download_button ~= nil then
		NewModule.show_download_button = self.show_download_button
	end
	if self.showDownloadButton ~= nil then
		NewModule.show_download_button = self.showDownloadButton
	end
	return NewModule
end

Module113.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = Module113
TypeRegistryModule.default:register(t.AttributionRowInputData)
local Module114 = {}
Module114.__index = Module114

function Module114.new(p1) --[[ Line: 26399 ]]
	-- upvalues: Module114 (copy)
	return (setmetatable({
		primary_cta_button_text = if p1 == nil or p1.primary_cta_button_text == nil then "" else p1.primary_cta_button_text,
		secondary_cta_button_text = if p1 == nil or p1.secondary_cta_button_text == nil then "" else p1.secondary_cta_button_text,
		primary_cta_type = if p1 == nil or p1.primary_cta_type == nil then "" else p1.primary_cta_type,
		secondary_cta_type = if p1 == nil or p1.secondary_cta_type == nil then "" else p1.secondary_cta_type
	}, Module114))
end

function Module114:encode() --[[ Line: 26412 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.primary_cta_button_text)
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.secondary_cta_button_text)
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.primary_cta_type)
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.secondary_cta_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module114.decode(Buf) --[[ Line: 26441 ]]
	-- upvalues: Module114 (copy), ProtoModule (copy)
	local NewModule = Module114.new()
	local v115 = 0
	while v115 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3423 = ProtoModule.readTag(Buf, v115)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3423 = ProtoModule.readVarInt(Buf, v115)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3423 = ProtoModule.readBuffer(Buf, v115)
				NewModule.primary_cta_button_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3423 = ProtoModule.readBuffer(Buf, v115)
				NewModule.secondary_cta_button_text = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3423 = ProtoModule.readBuffer(Buf, v115)
				NewModule.primary_cta_type = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3423 = ProtoModule.readBuffer(Buf, v115)
				NewModule.secondary_cta_type = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v115)
				v115 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3423 = ProtoModule.readFixed32(Buf, v115)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3423 = ProtoModule.readFixed64(Buf, v115)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module114:jsonEncode() --[[ Line: 26499 ]]
	local t = {}
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		t.primaryCtaButtonText = self.primary_cta_button_text
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		t.secondaryCtaButtonText = self.secondary_cta_button_text
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		t.primaryCtaType = self.primary_cta_type
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		t.secondaryCtaType = self.secondary_cta_type
	end
	return t
end

function Module114:jsonDecode() --[[ Line: 26521 ]]
	-- upvalues: Module114 (copy)
	local NewModule = Module114.new()
	
	if self.primary_cta_button_text ~= nil then
		NewModule.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		NewModule.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		NewModule.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		NewModule.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		NewModule.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		NewModule.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		NewModule.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		NewModule.secondary_cta_type = self.secondaryCtaType
	end
	return NewModule
end

Module114.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = Module114
TypeRegistryModule.default:register(t.CtaButtonsInputData)
local Module115 = {}
Module115.__index = Module115

function Module115.new(p1) --[[ Line: 26573 ]]
	-- upvalues: Module115 (copy)
	return (setmetatable({
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id
	}, Module115))
end

function Module115:encode() --[[ Line: 26579 ]]
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

function Module115.decode(Buf) --[[ Line: 26593 ]]
	-- upvalues: Module115 (copy), ProtoModule (copy)
	local NewModule = Module115.new()
	local v116 = 0
	while v116 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3442 = ProtoModule.readTag(Buf, v116)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3442 = ProtoModule.readVarInt(Buf, v116)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3442 = ProtoModule.readBuffer(Buf, v116)
				NewModule.image_asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v116)
				v116 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3442 = ProtoModule.readFixed32(Buf, v116)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3442 = ProtoModule.readFixed64(Buf, v116)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module115:jsonEncode() --[[ Line: 26636 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function Module115:jsonDecode() --[[ Line: 26646 ]]
	-- upvalues: Module115 (copy)
	local NewModule = Module115.new()
	
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = self.imageAssetId
	end
	return NewModule
end

Module115.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = Module115
TypeRegistryModule.default:register(t.ImageInputData)
local Module116 = {}
Module116.__index = Module116

function Module116.new(p1) --[[ Line: 26674 ]]
	-- upvalues: Module116 (copy)
	return (setmetatable({
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		loading_image_asset_id = if p1 == nil or p1.loading_image_asset_id == nil then "" else p1.loading_image_asset_id,
		max_quality = if p1 == nil or p1.max_quality == nil then "" else p1.max_quality,
		adaptive_resolution = p1 ~= nil and p1.adaptive_resolution ~= nil and p1.adaptive_resolution
	}, Module116))
end

function Module116:encode() --[[ Line: 26687 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.video_asset_id)
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.loading_image_asset_id)
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.max_quality)
	end
	if self.adaptive_resolution then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.adaptive_resolution then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module116.decode(Buf) --[[ Line: 26716 ]]
	-- upvalues: Module116 (copy), ProtoModule (copy)
	local NewModule = Module116.new()
	local v117 = 0
	while v117 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3464 = ProtoModule.readTag(Buf, v117)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v3464 = ProtoModule.readVarInt(Buf, v117)
				NewModule.adaptive_resolution = VarInt ~= 0
			else
				local _
				_, v3464 = ProtoModule.readVarInt(Buf, v117)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3464 = ProtoModule.readBuffer(Buf, v117)
				NewModule.video_asset_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3464 = ProtoModule.readBuffer(Buf, v117)
				NewModule.loading_image_asset_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3464 = ProtoModule.readBuffer(Buf, v117)
				NewModule.max_quality = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v117)
				v117 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3464 = ProtoModule.readFixed32(Buf, v117)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3464 = ProtoModule.readFixed64(Buf, v117)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module116:jsonEncode() --[[ Line: 26774 ]]
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		t.maxQuality = self.max_quality
	end
	if self.adaptive_resolution then
		t.adaptiveResolution = self.adaptive_resolution
	end
	return t
end

function Module116:jsonDecode() --[[ Line: 26796 ]]
	-- upvalues: Module116 (copy)
	local NewModule = Module116.new()
	
	if self.video_asset_id ~= nil then
		NewModule.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		NewModule.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		NewModule.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		NewModule.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		NewModule.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		NewModule.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		NewModule.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		NewModule.adaptive_resolution = self.adaptiveResolution
	end
	return NewModule
end

Module116.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = Module116
TypeRegistryModule.default:register(t.VideoInputData)
local Module117 = {}
Module117.__index = Module117

function Module117.new(p1) --[[ Line: 26848 ]]
	-- upvalues: Module117 (copy)
	return (setmetatable({
		text = if p1 == nil or p1.text == nil then "" else p1.text,
		is_rendered_text = p1 ~= nil and p1.is_rendered_text ~= nil and p1.is_rendered_text,
		url = if p1 == nil or p1.url == nil then "" else p1.url
	}, Module117))
end

function Module117:encode() --[[ Line: 26856 ]]
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
	if self.url ~= nil and self.url ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.url)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module117.decode(Buf) --[[ Line: 26880 ]]
	-- upvalues: Module117 (copy), ProtoModule (copy)
	local NewModule = Module117.new()
	local v118 = 0
	while v118 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3487 = ProtoModule.readTag(Buf, v118)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v3487 = ProtoModule.readVarInt(Buf, v118)
				NewModule.is_rendered_text = VarInt ~= 0
			else
				local _
				_, v3487 = ProtoModule.readVarInt(Buf, v118)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3487 = ProtoModule.readBuffer(Buf, v118)
				NewModule.text = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v3487 = ProtoModule.readBuffer(Buf, v118)
				NewModule.url = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v118)
				v118 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3487 = ProtoModule.readFixed32(Buf, v118)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3487 = ProtoModule.readFixed64(Buf, v118)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module117:jsonEncode() --[[ Line: 26933 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	if self.url ~= nil and self.url ~= "" then
		t.url = self.url
	end
	return t
end

function Module117:jsonDecode() --[[ Line: 26951 ]]
	-- upvalues: Module117 (copy)
	local NewModule = Module117.new()
	
	if self.text ~= nil then
		NewModule.text = self.text
	end
	if self.is_rendered_text ~= nil then
		NewModule.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		NewModule.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		NewModule.url = self.url
	end
	return NewModule
end

Module117.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = Module117
TypeRegistryModule.default:register(t.TextInputData)
local Module118 = {}
Module118.__index = Module118

function Module118.new(p1) --[[ Line: 26987 ]]
	-- upvalues: Module118 (copy)
	return (setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools
	}, Module118))
end

function Module118:encode() --[[ Line: 26996 ]]
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

function Module118.decode(Buf) --[[ Line: 27054 ]]
	-- upvalues: Module118 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module118.new()
	local v119 = 0
	while v119 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3538 = ProtoModule.readTag(Buf, v119)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3538 = ProtoModule.readVarInt(Buf, v119)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3538 = ProtoModule.readBuffer(Buf, v119)
				local DecodeResult = t.VerticalFeedInputData_EntryMapEntry.decode(Buffer1)
				local NewResult = t.FeedEntry.new()
				NewModule.entry_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3538 = ProtoModule.readBuffer(Buf, v119)
				table.insert(NewModule.entry_order, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3538 = ProtoModule.readBuffer(Buf, v119)
				local DecodeResult = t.VerticalFeedInputData_EntryOrderMapEntry.decode(Buffer3)
				local NewResult = t.EntryOrder.new()
				NewModule.entry_order_map[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3538 = ProtoModule.readBuffer(Buf, v119)
				local DecodeResult = t.VerticalFeedInputData_ContentPoolsEntry.decode(Buffer4)
				local NewResult = t.ContentPool.new()
				NewModule.content_pools[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v119)
				v119 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3538 = ProtoModule.readFixed32(Buf, v119)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3538 = ProtoModule.readFixed64(Buf, v119)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module118:jsonEncode() --[[ Line: 27133 ]]
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

function Module118:jsonDecode() --[[ Line: 27171 ]]
	-- upvalues: Module118 (copy), t (copy)
	local NewModule = Module118.new()
	
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

Module118.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = Module118
TypeRegistryModule.default:register(t.VerticalFeedInputData)
local Module119 = {}
Module119.__index = Module119

function Module119.new(p1) --[[ Line: 27263 ]]
	-- upvalues: Module119 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module119))
end

function Module119:encode() --[[ Line: 27272 ]]
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

function Module119.decode(Buf) --[[ Line: 27292 ]]
	-- upvalues: Module119 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module119.new()
	local v120 = 0
	while v120 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3578 = ProtoModule.readTag(Buf, v120)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3578 = ProtoModule.readVarInt(Buf, v120)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3578 = ProtoModule.readBuffer(Buf, v120)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3578 = ProtoModule.readBuffer(Buf, v120)
				NewModule.value = t.FeedEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v120)
				v120 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3578 = ProtoModule.readFixed32(Buf, v120)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3578 = ProtoModule.readFixed64(Buf, v120)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module119:jsonEncode() --[[ Line: 27340 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module119:jsonDecode() --[[ Line: 27354 ]]
	-- upvalues: Module119 (copy), t (copy)
	local NewModule = Module119.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.FeedEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module119.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = Module119
TypeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local Module120 = {}
Module120.__index = Module120

function Module120.new(p1) --[[ Line: 27384 ]]
	-- upvalues: Module120 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module120))
end

function Module120:encode() --[[ Line: 27393 ]]
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

function Module120.decode(Buf) --[[ Line: 27415 ]]
	-- upvalues: Module120 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module120.new()
	local v121 = 0
	while v121 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3598 = ProtoModule.readTag(Buf, v121)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3598 = ProtoModule.readVarInt(Buf, v121)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3598 = ProtoModule.readBuffer(Buf, v121)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3598 = ProtoModule.readBuffer(Buf, v121)
				NewModule.value = t.EntryOrder.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v121)
				v121 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3598 = ProtoModule.readFixed32(Buf, v121)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3598 = ProtoModule.readFixed64(Buf, v121)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module120:jsonEncode() --[[ Line: 27465 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module120:jsonDecode() --[[ Line: 27481 ]]
	-- upvalues: Module120 (copy), t (copy)
	local NewModule = Module120.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.EntryOrder.jsonDecode(self.value)
	end
	return NewModule
end

Module120.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = Module120
TypeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local Module121 = {}
Module121.__index = Module121

function Module121.new(p1) --[[ Line: 27511 ]]
	-- upvalues: Module121 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module121))
end

function Module121:encode() --[[ Line: 27520 ]]
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

function Module121.decode(Buf) --[[ Line: 27540 ]]
	-- upvalues: Module121 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module121.new()
	local v122 = 0
	while v122 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3618 = ProtoModule.readTag(Buf, v122)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3618 = ProtoModule.readVarInt(Buf, v122)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3618 = ProtoModule.readBuffer(Buf, v122)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3618 = ProtoModule.readBuffer(Buf, v122)
				NewModule.value = t.ContentPool.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v122)
				v122 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3618 = ProtoModule.readFixed32(Buf, v122)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3618 = ProtoModule.readFixed64(Buf, v122)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module121:jsonEncode() --[[ Line: 27588 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module121:jsonDecode() --[[ Line: 27602 ]]
	-- upvalues: Module121 (copy), t (copy)
	local NewModule = Module121.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.ContentPool.jsonDecode(self.value)
	end
	return NewModule
end

Module121.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = Module121
TypeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local Module122 = {}
Module122.__index = Module122

function Module122.new(p1) --[[ Line: 27632 ]]
	-- upvalues: Module122 (copy)
	return (setmetatable({
		foreground_header_entry = if p1 == nil or p1.foreground_header_entry == nil then nil else p1.foreground_header_entry,
		background_header_entry = if p1 == nil or p1.background_header_entry == nil then nil else p1.background_header_entry,
		layout_variant = if p1 == nil or p1.layout_variant == nil then "" else p1.layout_variant
	}, Module122))
end

function Module122:encode() --[[ Line: 27644 ]]
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
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.layout_variant)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module122.decode(Buf) --[[ Line: 27670 ]]
	-- upvalues: Module122 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module122.new()
	local v123 = 0
	while v123 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3641 = ProtoModule.readTag(Buf, v123)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3641 = ProtoModule.readVarInt(Buf, v123)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3641 = ProtoModule.readBuffer(Buf, v123)
				NewModule.foreground_header_entry = t.ForegroundHeaderEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3641 = ProtoModule.readBuffer(Buf, v123)
				NewModule.background_header_entry = t.BackgroundHeaderEntry.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3641 = ProtoModule.readBuffer(Buf, v123)
				NewModule.layout_variant = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v123)
				v123 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3641 = ProtoModule.readFixed32(Buf, v123)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3641 = ProtoModule.readFixed64(Buf, v123)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module122:jsonEncode() --[[ Line: 27723 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		t.layoutVariant = self.layout_variant
	end
	return t
end

function Module122:jsonDecode() --[[ Line: 27741 ]]
	-- upvalues: Module122 (copy), t (copy)
	local NewModule = Module122.new()
	
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
	if self.layout_variant ~= nil then
		NewModule.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		NewModule.layout_variant = self.layoutVariant
	end
	return NewModule
end

Module122.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = Module122
TypeRegistryModule.default:register(t.PageHeaderInputData)
local Module123 = {}
Module123.__index = Module123

function Module123.new(p1) --[[ Line: 27785 ]]
	-- upvalues: Module123 (copy)
	return (setmetatable({
		cta_button_text = if p1 == nil or p1.cta_button_text == nil then "" else p1.cta_button_text,
		cta_type = if p1 == nil or p1.cta_type == nil then "" else p1.cta_type
	}, Module123))
end

function Module123:encode() --[[ Line: 27794 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.cta_button_text)
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.cta_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module123.decode(Buf) --[[ Line: 27813 ]]
	-- upvalues: Module123 (copy), ProtoModule (copy)
	local NewModule = Module123.new()
	local v124 = 0
	while v124 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3661 = ProtoModule.readTag(Buf, v124)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3661 = ProtoModule.readVarInt(Buf, v124)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3661 = ProtoModule.readBuffer(Buf, v124)
				NewModule.cta_button_text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3661 = ProtoModule.readBuffer(Buf, v124)
				NewModule.cta_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v124)
				v124 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3661 = ProtoModule.readFixed32(Buf, v124)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3661 = ProtoModule.readFixed64(Buf, v124)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module123:jsonEncode() --[[ Line: 27861 ]]
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function Module123:jsonDecode() --[[ Line: 27875 ]]
	-- upvalues: Module123 (copy)
	local NewModule = Module123.new()
	
	if self.cta_button_text ~= nil then
		NewModule.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		NewModule.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		NewModule.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		NewModule.cta_type = self.ctaType
	end
	return NewModule
end

Module123.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = Module123
TypeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local Module124 = {}
Module124.__index = Module124

function Module124.new(p1) --[[ Line: 27913 ]]
	-- upvalues: Module124 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		cta_button_text = if p1 == nil or p1.cta_button_text == nil then "" else p1.cta_button_text,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id,
		cta_type = if p1 == nil or p1.cta_type == nil then "" else p1.cta_type
	}, Module124))
end

function Module124:encode() --[[ Line: 27922 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.cta_button_text)
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.image_asset_id)
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.cta_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module124.decode(Buf) --[[ Line: 27951 ]]
	-- upvalues: Module124 (copy), ProtoModule (copy)
	local NewModule = Module124.new()
	local v125 = 0
	while v125 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3684 = ProtoModule.readTag(Buf, v125)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3684 = ProtoModule.readVarInt(Buf, v125)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3684 = ProtoModule.readBuffer(Buf, v125)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3684 = ProtoModule.readBuffer(Buf, v125)
				NewModule.cta_button_text = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3684 = ProtoModule.readBuffer(Buf, v125)
				NewModule.image_asset_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3684 = ProtoModule.readBuffer(Buf, v125)
				NewModule.cta_type = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v125)
				v125 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3684 = ProtoModule.readFixed32(Buf, v125)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3684 = ProtoModule.readFixed64(Buf, v125)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module124:jsonEncode() --[[ Line: 28009 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function Module124:jsonDecode() --[[ Line: 28031 ]]
	-- upvalues: Module124 (copy)
	local NewModule = Module124.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.cta_button_text ~= nil then
		NewModule.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		NewModule.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		NewModule.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		NewModule.cta_type = self.ctaType
	end
	return NewModule
end

Module124.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = Module124
TypeRegistryModule.default:register(t.ImageCtaSectionInputData)
local Module125 = {}
Module125.__index = Module125

function Module125.new(p1) --[[ Line: 28079 ]]
	-- upvalues: Module125 (copy)
	return (setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		url = if p1 == nil or p1.url == nil then nil else p1.url,
		destination = if p1 == nil or p1.destination == nil then nil else p1.destination,
		row_id = if p1 == nil or p1.row_id == nil then "" else p1.row_id
	}, Module125))
end

function Module125:encode() --[[ Line: 28088 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.title)
	end
	if self.url ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.url)
	end
	if self.destination ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.destination)
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.row_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module125.decode(Buf) --[[ Line: 28117 ]]
	-- upvalues: Module125 (copy), ProtoModule (copy)
	local NewModule = Module125.new()
	local v126 = 0
	while v126 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3709 = ProtoModule.readTag(Buf, v126)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3709 = ProtoModule.readVarInt(Buf, v126)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3709 = ProtoModule.readBuffer(Buf, v126)
				NewModule.title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3709 = ProtoModule.readBuffer(Buf, v126)
				NewModule.url = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3709 = ProtoModule.readBuffer(Buf, v126)
				NewModule.destination = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3709 = ProtoModule.readBuffer(Buf, v126)
				NewModule.row_id = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v126)
				v126 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3709 = ProtoModule.readFixed32(Buf, v126)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3709 = ProtoModule.readFixed64(Buf, v126)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module125:jsonEncode() --[[ Line: 28175 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.url ~= nil then
		t.url = self.url
	end
	if self.destination ~= nil then
		t.destination = self.destination
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		t.rowId = self.row_id
	end
	return t
end

function Module125:jsonDecode() --[[ Line: 28197 ]]
	-- upvalues: Module125 (copy)
	local NewModule = Module125.new()
	
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.url ~= nil then
		NewModule.url = self.url
	end
	if self.destination ~= nil then
		NewModule.destination = self.destination
	end
	if self.row_id ~= nil then
		NewModule.row_id = self.row_id
	end
	if self.rowId ~= nil then
		NewModule.row_id = self.rowId
	end
	return NewModule
end

Module125.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = Module125
TypeRegistryModule.default:register(t.SettingsRowInputData)
local Module126 = {}
Module126.__index = Module126

function Module126.new(p1) --[[ Line: 28237 ]]
	-- upvalues: Module126 (copy)
	return (setmetatable({
		setting_key = if p1 == nil or p1.setting_key == nil then "" else p1.setting_key,
		label = if p1 == nil or p1.label == nil then "" else p1.label,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		is_checked = p1 ~= nil and p1.is_checked ~= nil and p1.is_checked,
		is_disabled = p1 ~= nil and p1.is_disabled ~= nil and p1.is_disabled,
		audit_data = if p1 == nil or p1.audit_data == nil then "" else p1.audit_data
	}, Module126))
end

function Module126:encode() --[[ Line: 28248 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.setting_key)
	end
	if self.label ~= nil and self.label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.label)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.is_checked then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.is_checked then 1 else 0)
	end
	if self.is_disabled then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.is_disabled then 1 else 0)
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.audit_data)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module126.decode(Buf) --[[ Line: 28287 ]]
	-- upvalues: Module126 (copy), ProtoModule (copy)
	local NewModule = Module126.new()
	local v127 = 0
	while v127 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3738 = ProtoModule.readTag(Buf, v127)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v3738 = ProtoModule.readVarInt(Buf, v127)
				NewModule.is_checked = VarInt ~= 0
			elseif Tag == 5 then
				local VarInt1
				VarInt1, v3738 = ProtoModule.readVarInt(Buf, v127)
				NewModule.is_disabled = VarInt1 ~= 0
			else
				local _
				_, v3738 = ProtoModule.readVarInt(Buf, v127)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3738 = ProtoModule.readBuffer(Buf, v127)
				NewModule.setting_key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3738 = ProtoModule.readBuffer(Buf, v127)
				NewModule.label = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3738 = ProtoModule.readBuffer(Buf, v127)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v3738 = ProtoModule.readBuffer(Buf, v127)
				NewModule.audit_data = buffer.tostring(Buffer4)
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v127)
				v127 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3738 = ProtoModule.readFixed32(Buf, v127)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3738 = ProtoModule.readFixed64(Buf, v127)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module126:jsonEncode() --[[ Line: 28355 ]]
	local t = {}
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		t.settingKey = self.setting_key
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.is_checked then
		t.isChecked = self.is_checked
	end
	if self.is_disabled then
		t.isDisabled = self.is_disabled
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		t.auditData = self.audit_data
	end
	return t
end

function Module126:jsonDecode() --[[ Line: 28385 ]]
	-- upvalues: Module126 (copy)
	local NewModule = Module126.new()
	
	if self.setting_key ~= nil then
		NewModule.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		NewModule.setting_key = self.settingKey
	end
	if self.label ~= nil then
		NewModule.label = self.label
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.is_checked ~= nil then
		NewModule.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		NewModule.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		NewModule.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		NewModule.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		NewModule.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		NewModule.audit_data = self.auditData
	end
	return NewModule
end

Module126.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = Module126
TypeRegistryModule.default:register(t.SettingsToggleInputData)
local Module127 = {}
Module127.__index = Module127

function Module127.new(p1) --[[ Line: 28445 ]]
	-- upvalues: Module127 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then nil else p1.subtitle,
		badge_text = if p1 == nil or p1.badge_text == nil then nil else p1.badge_text,
		foreground = if p1 == nil or p1.foreground == nil then nil else p1.foreground,
		background = if p1 == nil or p1.background == nil then nil else p1.background,
		title_image = if p1 == nil or p1.title_image == nil then nil else p1.title_image,
		asset_title = if p1 == nil or p1.asset_title == nil then nil else p1.asset_title,
		asset_subtitle = if p1 == nil or p1.asset_subtitle == nil then nil else p1.asset_subtitle,
		gradient = if p1 == nil or p1.gradient == nil then nil else p1.gradient,
		playable_text = if p1 == nil or p1.playable_text == nil then nil else p1.playable_text,
		collection_id = if p1 == nil or p1.collection_id == nil then nil else p1.collection_id,
		campaign_id = if p1 == nil or p1.campaign_id == nil then nil else p1.campaign_id,
		cohort_id = if p1 == nil or p1.cohort_id == nil then nil else p1.cohort_id,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id,
		hero_unit_id = if p1 == nil or p1.hero_unit_id == nil then nil else p1.hero_unit_id,
		analytics_id = if p1 == nil or p1.analytics_id == nil then nil else p1.analytics_id,
		is_sponsored = if p1 == nil or p1.is_sponsored == nil then nil else p1.is_sponsored
	}, Module127))
end

function Module127:encode() --[[ Line: 28468 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.title ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.subtitle ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.subtitle)
	end
	if self.badge_text ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.badge_text)
	end
	if self.foreground ~= nil then
		local EncodeResult = self.foreground:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.background ~= nil then
		local EncodeResult = self.background:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.title_image ~= nil then
		local EncodeResult = self.title_image:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.asset_title ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.asset_title)
	end
	if self.asset_subtitle ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.asset_subtitle)
	end
	if self.gradient ~= nil then
		local EncodeResult = self.gradient:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.playable_text ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.playable_text)
	end
	if self.collection_id ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.collection_id)
	end
	if self.campaign_id ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.campaign_id)
	end
	if self.cohort_id ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.cohort_id)
	end
	if self.sort_id ~= nil then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult15, WriteTagResult2_14, self.sort_id)
	end
	if self.hero_unit_id ~= nil then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult16, WriteTagResult2_15, self.hero_unit_id)
	end
	if self.analytics_id ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult17, WriteTagResult2_16, self.analytics_id)
	end
	if self.is_sponsored ~= nil then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult18, WriteTagResult2_17, if self.is_sponsored then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module127.decode(Buf) --[[ Line: 28571 ]]
	-- upvalues: Module127 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module127.new()
	local v128 = 0
	while v128 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3797 = ProtoModule.readTag(Buf, v128)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 18 then
				local VarInt
				VarInt, v3797 = ProtoModule.readVarInt(Buf, v128)
				NewModule.is_sponsored = VarInt ~= 0
			else
				local _
				_, v3797 = ProtoModule.readVarInt(Buf, v128)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.subtitle = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.badge_text = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.foreground = t.HeroUnitInputData_VisualAsset.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer8
				Buffer8, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.background = t.HeroUnitInputData_VisualAsset.decode(Buffer8)
			elseif Tag == 7 then
				local Buffer10
				Buffer10, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.title_image = t.HeroUnitInputData_VisualAsset.decode(Buffer10)
			elseif Tag == 8 then
				local Buffer12
				Buffer12, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.asset_title = buffer.tostring(Buffer12)
			elseif Tag == 9 then
				local Buffer13
				Buffer13, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.asset_subtitle = buffer.tostring(Buffer13)
			elseif Tag == 10 then
				local Buffer14
				Buffer14, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.gradient = t.HeroUnitInputData_Gradient.decode(Buffer14)
			elseif Tag == 11 then
				local Buffer6
				Buffer6, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.playable_text = buffer.tostring(Buffer6)
			elseif Tag == 12 then
				local Buffer7
				Buffer7, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.collection_id = buffer.tostring(Buffer7)
			elseif Tag == 13 then
				local Buffer9
				Buffer9, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.campaign_id = buffer.tostring(Buffer9)
			elseif Tag == 14 then
				local Buffer11
				Buffer11, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.cohort_id = buffer.tostring(Buffer11)
			elseif Tag == 15 then
				local Buffer16
				Buffer16, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.sort_id = buffer.tostring(Buffer16)
			elseif Tag == 16 then
				local Buffer17
				Buffer17, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.hero_unit_id = buffer.tostring(Buffer17)
			elseif Tag == 17 then
				local Buffer15
				Buffer15, v3797 = ProtoModule.readBuffer(Buf, v128)
				NewModule.analytics_id = buffer.tostring(Buffer15)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v128)
				v128 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3797 = ProtoModule.readFixed32(Buf, v128)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3797 = ProtoModule.readFixed64(Buf, v128)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module127:jsonEncode() --[[ Line: 28699 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.foreground ~= nil then
		t.foreground = self.foreground:jsonEncode()
	end
	if self.background ~= nil then
		t.background = self.background:jsonEncode()
	end
	if self.title_image ~= nil then
		t.titleImage = self.title_image:jsonEncode()
	end
	if self.asset_title ~= nil then
		t.assetTitle = self.asset_title
	end
	if self.asset_subtitle ~= nil then
		t.assetSubtitle = self.asset_subtitle
	end
	if self.gradient ~= nil then
		t.gradient = self.gradient:jsonEncode()
	end
	if self.playable_text ~= nil then
		t.playableText = self.playable_text
	end
	if self.collection_id ~= nil then
		t.collectionId = self.collection_id
	end
	if self.campaign_id ~= nil then
		t.campaignId = self.campaign_id
	end
	if self.cohort_id ~= nil then
		t.cohortId = self.cohort_id
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	if self.hero_unit_id ~= nil then
		t.heroUnitId = self.hero_unit_id
	end
	if self.analytics_id ~= nil then
		t.analyticsId = self.analytics_id
	end
	if self.is_sponsored ~= nil then
		t.isSponsored = self.is_sponsored
	end
	return t
end

function Module127:jsonDecode() --[[ Line: 28777 ]]
	-- upvalues: Module127 (copy), t (copy)
	local NewModule = Module127.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		NewModule.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		NewModule.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		NewModule.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		NewModule.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		NewModule.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		NewModule.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		NewModule.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		NewModule.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		NewModule.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		NewModule.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		NewModule.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		NewModule.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		NewModule.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		NewModule.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		NewModule.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		NewModule.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		NewModule.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		NewModule.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		NewModule.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		NewModule.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		NewModule.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		NewModule.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		NewModule.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		NewModule.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		NewModule.is_sponsored = self.isSponsored
	end
	return NewModule
end

Module127.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = Module127
TypeRegistryModule.default:register(t.HeroUnitInputData)
local Module128 = {}
Module128.__index = Module128

function Module128.new(p1) --[[ Line: 28921 ]]
	-- upvalues: Module128 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then "" else p1.asset_id,
		aspect_ratio = if p1 == nil or p1.aspect_ratio == nil then nil else p1.aspect_ratio,
		enable_animation = if p1 == nil or p1.enable_animation == nil then nil else p1.enable_animation
	}, Module128))
end

function Module128:encode() --[[ Line: 28931 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.aspect_ratio ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult1, WriteTagResult2_1, self.aspect_ratio)
	end
	if self.enable_animation ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.enable_animation then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module128.decode(Buf) --[[ Line: 28955 ]]
	-- upvalues: Module128 (copy), ProtoModule (copy)
	local NewModule = Module128.new()
	local v129 = 0
	while v129 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3834 = ProtoModule.readTag(Buf, v129)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v3834 = ProtoModule.readVarInt(Buf, v129)
				NewModule.enable_animation = VarInt ~= 0
			else
				local _
				_, v3834 = ProtoModule.readVarInt(Buf, v129)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3834 = ProtoModule.readBuffer(Buf, v129)
				NewModule.asset_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v129)
				v129 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3834 = ProtoModule.readFixed32(Buf, v129)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 2 then
				NewModule.aspect_ratio, v3834 = ProtoModule.readDouble(Buf, v129)
			else
				local _
				_, v3834 = ProtoModule.readFixed64(Buf, v129)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module128:jsonEncode() --[[ Line: 29008 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.aspect_ratio ~= nil then
		t.aspectRatio = ProtoModule.json.serializeNumber(self.aspect_ratio)
	end
	if self.enable_animation ~= nil then
		t.enableAnimation = self.enable_animation
	end
	return t
end

function Module128:jsonDecode() --[[ Line: 29026 ]]
	-- upvalues: Module128 (copy), ProtoModule (copy)
	local NewModule = Module128.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		NewModule.aspect_ratio = ProtoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		NewModule.aspect_ratio = ProtoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		NewModule.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		NewModule.enable_animation = self.enableAnimation
	end
	return NewModule
end

Module128.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = Module128
TypeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local Module129 = {}
Module129.__index = Module129

function Module129.new(p1) --[[ Line: 29070 ]]
	-- upvalues: Module129 (copy)
	return (setmetatable({
		start_color = if p1 == nil or p1.start_color == nil then nil else p1.start_color,
		end_color = if p1 == nil or p1.end_color == nil then nil else p1.end_color,
		start_opacity = if p1 == nil or p1.start_opacity == nil then nil else p1.start_opacity,
		end_opacity = if p1 == nil or p1.end_opacity == nil then nil else p1.end_opacity,
		degree = if p1 == nil or p1.degree == nil then nil else p1.degree
	}, Module129))
end

function Module129:encode() --[[ Line: 29082 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.start_color ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.start_color)
	end
	if self.end_color ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.end_color)
	end
	if self.start_opacity ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult3, WriteTagResult2_2, self.start_opacity)
	end
	if self.end_opacity ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult4, WriteTagResult2_3, self.end_opacity)
	end
	if self.degree ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult5, WriteTagResult2_4, self.degree)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module129.decode(Buf) --[[ Line: 29116 ]]
	-- upvalues: Module129 (copy), ProtoModule (copy)
	local NewModule = Module129.new()
	local v130 = 0
	while v130 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3859 = ProtoModule.readTag(Buf, v130)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3859 = ProtoModule.readVarInt(Buf, v130)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3859 = ProtoModule.readBuffer(Buf, v130)
				NewModule.start_color = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3859 = ProtoModule.readBuffer(Buf, v130)
				NewModule.end_color = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v130)
				v130 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3859 = ProtoModule.readFixed32(Buf, v130)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 3 then
				NewModule.start_opacity, v3859 = ProtoModule.readDouble(Buf, v130)
			elseif Tag == 4 then
				NewModule.end_opacity, v3859 = ProtoModule.readDouble(Buf, v130)
			elseif Tag == 5 then
				NewModule.degree, v3859 = ProtoModule.readDouble(Buf, v130)
			else
				local _
				_, v3859 = ProtoModule.readFixed64(Buf, v130)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module129:jsonEncode() --[[ Line: 29179 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.start_color ~= nil then
		t.startColor = self.start_color
	end
	if self.end_color ~= nil then
		t.endColor = self.end_color
	end
	if self.start_opacity ~= nil then
		t.startOpacity = ProtoModule.json.serializeNumber(self.start_opacity)
	end
	if self.end_opacity ~= nil then
		t.endOpacity = ProtoModule.json.serializeNumber(self.end_opacity)
	end
	if self.degree ~= nil then
		t.degree = ProtoModule.json.serializeNumber(self.degree)
	end
	return t
end

function Module129:jsonDecode() --[[ Line: 29205 ]]
	-- upvalues: Module129 (copy), ProtoModule (copy)
	local NewModule = Module129.new()
	
	if self.start_color ~= nil then
		NewModule.start_color = self.start_color
	end
	if self.startColor ~= nil then
		NewModule.start_color = self.startColor
	end
	if self.end_color ~= nil then
		NewModule.end_color = self.end_color
	end
	if self.endColor ~= nil then
		NewModule.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		NewModule.start_opacity = ProtoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		NewModule.start_opacity = ProtoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		NewModule.end_opacity = ProtoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		NewModule.end_opacity = ProtoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		NewModule.degree = ProtoModule.json.deserializeNumber(self.degree)
	end
	return NewModule
end

Module129.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = Module129
TypeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local Module130 = {}
Module130.__index = Module130

function Module130.new(p1) --[[ Line: 29261 ]]
	-- upvalues: Module130 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		recommendation_request_id = if p1 == nil or p1.recommendation_request_id == nil then "" else p1.recommendation_request_id
	}, Module130))
end

function Module130:encode() --[[ Line: 29273 ]]
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
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.sort_id)
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.recommendation_request_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module130.decode(Buf) --[[ Line: 29300 ]]
	-- upvalues: Module130 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module130.new()
	local v131 = 0
	while v131 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3881 = ProtoModule.readTag(Buf, v131)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3881 = ProtoModule.readVarInt(Buf, v131)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3881 = ProtoModule.readBuffer(Buf, v131)
				table.insert(NewModule.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3881 = ProtoModule.readBuffer(Buf, v131)
				NewModule.sort_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3881 = ProtoModule.readBuffer(Buf, v131)
				NewModule.recommendation_request_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v131)
				v131 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3881 = ProtoModule.readFixed32(Buf, v131)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3881 = ProtoModule.readFixed64(Buf, v131)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module130:jsonEncode() --[[ Line: 29356 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		t.recommendationRequestId = self.recommendation_request_id
	end
	return t
end

function Module130:jsonDecode() --[[ Line: 29378 ]]
	-- upvalues: Module130 (copy), t (copy)
	local NewModule = Module130.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(item))
		end
		NewModule.items = Items
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		NewModule.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		NewModule.recommendation_request_id = self.recommendationRequestId
	end
	return NewModule
end

Module130.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = Module130
TypeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local Module131 = {}
Module131.__index = Module131

function Module131.new(p1) --[[ Line: 29429 ]]
	-- upvalues: Module131 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		has_pending_friend_request = p1 ~= nil and p1.has_pending_friend_request ~= nil and p1.has_pending_friend_request
	}, Module131))
end

function Module131:encode() --[[ Line: 29443 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.item_id)
	end
	if self.has_pending_friend_request then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.has_pending_friend_request then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module131.decode(Buf) --[[ Line: 29464 ]]
	-- upvalues: Module131 (copy), ProtoModule (copy)
	local NewModule = Module131.new()
	local v132 = 0
	while v132 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3903 = ProtoModule.readTag(Buf, v132)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v3903 = ProtoModule.readVarInt(Buf, v132)
				NewModule.has_pending_friend_request = VarInt ~= 0
			else
				local _
				_, v3903 = ProtoModule.readVarInt(Buf, v132)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3903 = ProtoModule.readBuffer(Buf, v132)
				NewModule.item_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v132)
				v132 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3903 = ProtoModule.readFixed32(Buf, v132)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3903 = ProtoModule.readFixed64(Buf, v132)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module131:jsonEncode() --[[ Line: 29514 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function Module131:jsonDecode() --[[ Line: 29530 ]]
	-- upvalues: Module131 (copy)
	local NewModule = Module131.new()
	
	if self.item_id ~= nil then
		NewModule.item_id = self.item_id
	end
	if self.itemId ~= nil then
		NewModule.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		NewModule.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		NewModule.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return NewModule
end

Module131.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = Module131
TypeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local Module132 = {}
Module132.__index = Module132

function Module132.new(p1) --[[ Line: 29569 ]]
	-- upvalues: Module132 (copy)
	return (setmetatable({
		selected_option = if p1 == nil or p1.selected_option == nil then "" else p1.selected_option,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		experience_carousel = if p1 == nil or p1.experience_carousel == nil then nil else p1.experience_carousel,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then "" else p1.feed_item_key,
		title = if p1 == nil or p1.title == nil then "" else p1.title
	}, Module132))
end

function Module132:encode() --[[ Line: 29584 ]]
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
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.title)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module132.decode(Buf) --[[ Line: 29627 ]]
	-- upvalues: Module132 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module132.new()
	local v133 = 0
	while v133 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3932 = ProtoModule.readTag(Buf, v133)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3932 = ProtoModule.readVarInt(Buf, v133)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3932 = ProtoModule.readBuffer(Buf, v133)
				NewModule.selected_option = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3932 = ProtoModule.readBuffer(Buf, v133)
				NewModule.sort_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3932 = ProtoModule.readBuffer(Buf, v133)
				table.insert(NewModule.options, t.SelectorOption.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3932 = ProtoModule.readBuffer(Buf, v133)
				NewModule.experience_carousel = t.ExperienceCarouselInputData.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3932 = ProtoModule.readBuffer(Buf, v133)
				NewModule.feed_item_key = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v3932 = ProtoModule.readBuffer(Buf, v133)
				NewModule.title = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v133)
				v133 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3932 = ProtoModule.readFixed32(Buf, v133)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3932 = ProtoModule.readFixed64(Buf, v133)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module132:jsonEncode() --[[ Line: 29695 ]]
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
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	return t
end

function Module132:jsonDecode() --[[ Line: 29729 ]]
	-- upvalues: Module132 (copy), t (copy)
	local NewModule = Module132.new()
	
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
	if self.title ~= nil then
		NewModule.title = self.title
	end
	return NewModule
end

Module132.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = Module132
TypeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local Module133 = {}
Module133.__index = Module133

function Module133.new(p1) --[[ Line: 29794 ]]
	-- upvalues: Module133 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		is_selected = p1 ~= nil and p1.is_selected ~= nil and p1.is_selected,
		anchor_tag = if p1 == nil or p1.anchor_tag == nil then nil else p1.anchor_tag
	}, Module133))
end

function Module133:encode() --[[ Line: 29803 ]]
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
	if self.anchor_tag ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.anchor_tag)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module133.decode(Buf) --[[ Line: 29832 ]]
	-- upvalues: Module133 (copy), ProtoModule (copy)
	local NewModule = Module133.new()
	local v134 = 0
	while v134 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3961 = ProtoModule.readTag(Buf, v134)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v3961 = ProtoModule.readVarInt(Buf, v134)
				NewModule.is_selected = VarInt ~= 0
			else
				local _
				_, v3961 = ProtoModule.readVarInt(Buf, v134)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3961 = ProtoModule.readBuffer(Buf, v134)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3961 = ProtoModule.readBuffer(Buf, v134)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v3961 = ProtoModule.readBuffer(Buf, v134)
				NewModule.anchor_tag = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v134)
				v134 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3961 = ProtoModule.readFixed32(Buf, v134)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3961 = ProtoModule.readFixed64(Buf, v134)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module133:jsonEncode() --[[ Line: 29890 ]]
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
	if self.anchor_tag ~= nil then
		t.anchorTag = self.anchor_tag
	end
	return t
end

function Module133:jsonDecode() --[[ Line: 29912 ]]
	-- upvalues: Module133 (copy)
	local NewModule = Module133.new()
	
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
	if self.anchor_tag ~= nil then
		NewModule.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		NewModule.anchor_tag = self.anchorTag
	end
	return NewModule
end

Module133.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = Module133
TypeRegistryModule.default:register(t.SelectorOption)
local Module134 = {}
Module134.__index = Module134

function Module134.new(p1) --[[ Line: 29960 ]]
	-- upvalues: Module134 (copy)
	return (setmetatable({
		cards = if p1 == nil or p1.cards == nil then {} else p1.cards,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, Module134))
end

function Module134:encode() --[[ Line: 29970 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for _, card in self.cards do
			local EncodeResult = card:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.sort_id ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.sort_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module134.decode(Buf) --[[ Line: 29997 ]]
	-- upvalues: Module134 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module134.new()
	local v135 = 0
	while v135 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3985 = ProtoModule.readTag(Buf, v135)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3985 = ProtoModule.readVarInt(Buf, v135)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3985 = ProtoModule.readBuffer(Buf, v135)
				table.insert(NewModule.cards, t.GameItemsCardInputData.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3985 = ProtoModule.readBuffer(Buf, v135)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3985 = ProtoModule.readBuffer(Buf, v135)
				NewModule.sort_id = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v135)
				v135 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3985 = ProtoModule.readFixed32(Buf, v135)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3985 = ProtoModule.readFixed64(Buf, v135)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module134:jsonEncode() --[[ Line: 30050 ]]
	local t = {}
	
	if self.cards ~= nil and #self.cards > 0 then
		local Cards = {}
		
		for _, card in self.cards do
			table.insert(Cards, card:jsonEncode())
		end
		t.cards = Cards
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function Module134:jsonDecode() --[[ Line: 30072 ]]
	-- upvalues: Module134 (copy), t (copy)
	local NewModule = Module134.new()
	
	if self.cards ~= nil then
		local Cards = {}
		
		for _, card in self.cards do
			table.insert(Cards, t.GameItemsCardInputData.jsonDecode(card))
		end
		NewModule.cards = Cards
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	return NewModule
end

Module134.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = Module134
TypeRegistryModule.default:register(t.GameItemsCarouselInputData)
local Module135 = {}
Module135.__index = Module135

function Module135.new(p1) --[[ Line: 30113 ]]
	-- upvalues: Module135 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module135))
end

function Module135:encode() --[[ Line: 30120 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module135.decode(Buf) --[[ Line: 30142 ]]
	-- upvalues: Module135 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module135.new()
	local v136 = 0
	while v136 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4008 = ProtoModule.readTag(Buf, v136)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4008 = ProtoModule.readVarInt(Buf, v136)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4008 = ProtoModule.readBuffer(Buf, v136)
				NewModule.universe_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4008 = ProtoModule.readBuffer(Buf, v136)
				table.insert(NewModule.items, t.GameItemInputData.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v136)
				v136 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4008 = ProtoModule.readFixed32(Buf, v136)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4008 = ProtoModule.readFixed64(Buf, v136)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module135:jsonEncode() --[[ Line: 30190 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	return t
end

function Module135:jsonDecode() --[[ Line: 30208 ]]
	-- upvalues: Module135 (copy), t (copy)
	local NewModule = Module135.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, t.GameItemInputData.jsonDecode(item))
		end
		NewModule.items = Items
	end
	return NewModule
end

Module135.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = Module135
TypeRegistryModule.default:register(t.GameItemsCardInputData)
local Module136 = {}
Module136.__index = Module136

function Module136.new(p1) --[[ Line: 30245 ]]
	-- upvalues: Module136 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, Module136))
end

function Module136:encode() --[[ Line: 30252 ]]
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

function Module136.decode(Buf) --[[ Line: 30271 ]]
	-- upvalues: Module136 (copy), ProtoModule (copy)
	local NewModule = Module136.new()
	local v137 = 0
	while v137 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4029 = ProtoModule.readTag(Buf, v137)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4029 = ProtoModule.readVarInt(Buf, v137)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4029 = ProtoModule.readBuffer(Buf, v137)
				NewModule.item_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4029 = ProtoModule.readBuffer(Buf, v137)
				NewModule.item_type = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v137)
				v137 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4029 = ProtoModule.readFixed32(Buf, v137)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4029 = ProtoModule.readFixed64(Buf, v137)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module136:jsonEncode() --[[ Line: 30319 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function Module136:jsonDecode() --[[ Line: 30333 ]]
	-- upvalues: Module136 (copy)
	local NewModule = Module136.new()
	
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

Module136.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = Module136
TypeRegistryModule.default:register(t.GameItemInputData)
local Module137 = {}
Module137.__index = Module137

function Module137.new(p1) --[[ Line: 30369 ]]
	-- upvalues: Module137 (copy)
	return (setmetatable({
		clickout_url = if p1 == nil or p1.clickout_url == nil then "" else p1.clickout_url,
		native_ad_data = if p1 == nil or p1.native_ad_data == nil then "" else p1.native_ad_data,
		payer_name = if p1 == nil or p1.payer_name == nil then nil else p1.payer_name,
		logo_asset_id = if p1 == nil or p1.logo_asset_id == nil then nil else p1.logo_asset_id,
		logo_aspect_ratio = if p1 == nil or p1.logo_aspect_ratio == nil then nil else p1.logo_aspect_ratio,
		cta_text = if p1 == nil or p1.cta_text == nil then nil else p1.cta_text,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then nil else p1.subtitle,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then nil else p1.image_asset_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then nil else p1.video_asset_id,
		badge_text = if p1 == nil or p1.badge_text == nil then nil else p1.badge_text,
		badge_analytics_id = if p1 == nil or p1.badge_analytics_id == nil then nil else p1.badge_analytics_id,
		roblox_component = if p1 == nil or p1.roblox_component == nil then nil else p1.roblox_component,
		attribution_thumbnail_asset_id = if p1 == nil or p1.attribution_thumbnail_asset_id == nil then nil else p1.attribution_thumbnail_asset_id
	}, Module137))
end

function Module137:encode() --[[ Line: 30390 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.clickout_url)
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.native_ad_data)
	end
	if self.payer_name ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.payer_name)
	end
	if self.logo_asset_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.logo_asset_id)
	end
	if self.logo_aspect_ratio ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult5, WriteTagResult2_4, self.logo_aspect_ratio)
	end
	if self.cta_text ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.cta_text)
	end
	if self.title ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.title)
	end
	if self.subtitle ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.subtitle)
	end
	if self.image_asset_id ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.image_asset_id)
	end
	if self.video_asset_id ~= nil then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.video_asset_id)
	end
	if self.badge_text ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.badge_text)
	end
	if self.badge_analytics_id ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.badge_analytics_id)
	end
	if self.roblox_component ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.roblox_component)
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.attribution_thumbnail_asset_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module137.decode(Buf) --[[ Line: 30469 ]]
	-- upvalues: Module137 (copy), ProtoModule (copy)
	local NewModule = Module137.new()
	local v138 = 0
	while v138 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4072 = ProtoModule.readTag(Buf, v138)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4072 = ProtoModule.readVarInt(Buf, v138)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.clickout_url = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.native_ad_data = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.payer_name = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.logo_asset_id = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.cta_text = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.title = buffer.tostring(Buffer6)
			elseif Tag == 8 then
				local Buffer7
				Buffer7, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.subtitle = buffer.tostring(Buffer7)
			elseif Tag == 9 then
				local Buffer8
				Buffer8, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.image_asset_id = buffer.tostring(Buffer8)
			elseif Tag == 10 then
				local Buffer9
				Buffer9, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.video_asset_id = buffer.tostring(Buffer9)
			elseif Tag == 11 then
				local Buffer10
				Buffer10, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.badge_text = buffer.tostring(Buffer10)
			elseif Tag == 12 then
				local Buffer11
				Buffer11, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.badge_analytics_id = buffer.tostring(Buffer11)
			elseif Tag == 13 then
				local Buffer12
				Buffer12, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.roblox_component = buffer.tostring(Buffer12)
			elseif Tag == 14 then
				local Buffer13
				Buffer13, v4072 = ProtoModule.readBuffer(Buf, v138)
				NewModule.attribution_thumbnail_asset_id = buffer.tostring(Buffer13)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v138)
				v138 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4072 = ProtoModule.readFixed32(Buf, v138)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 5 then
				NewModule.logo_aspect_ratio, v4072 = ProtoModule.readDouble(Buf, v138)
			else
				local _
				_, v4072 = ProtoModule.readFixed64(Buf, v138)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module137:jsonEncode() --[[ Line: 30577 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		t.clickoutUrl = self.clickout_url
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = ProtoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	if self.roblox_component ~= nil then
		t.robloxComponent = self.roblox_component
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		t.attributionThumbnailAssetId = self.attribution_thumbnail_asset_id
	end
	return t
end

function Module137:jsonDecode() --[[ Line: 30639 ]]
	-- upvalues: Module137 (copy), ProtoModule (copy)
	local NewModule = Module137.new()
	
	if self.clickout_url ~= nil then
		NewModule.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		NewModule.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		NewModule.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		NewModule.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		NewModule.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		NewModule.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		NewModule.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		NewModule.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		NewModule.logo_aspect_ratio = ProtoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		NewModule.logo_aspect_ratio = ProtoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		NewModule.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		NewModule.cta_text = self.ctaText
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
	if self.badge_analytics_id ~= nil then
		NewModule.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		NewModule.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		NewModule.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		NewModule.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return NewModule
end

Module137.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = Module137
TypeRegistryModule.default:register(t.AdLinkItem)
local Module138 = {}
Module138.__index = Module138

function Module138.new(p1) --[[ Line: 30763 ]]
	-- upvalues: Module138 (copy)
	return (setmetatable({
		layout = if p1 == nil or p1.layout == nil then nil else p1.layout,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module138))
end

function Module138:encode() --[[ Line: 30770 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.layout ~= nil then
		local EncodeResult = self.layout:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "ad_link" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module138.decode(Buf) --[[ Line: 30797 ]]
	-- upvalues: Module138 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module138.new()
	local v139 = 0
	while v139 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4107 = ProtoModule.readTag(Buf, v139)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4107 = ProtoModule.readVarInt(Buf, v139)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4107 = ProtoModule.readBuffer(Buf, v139)
				NewModule.layout = t.ItemLayout.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4107 = ProtoModule.readBuffer(Buf, v139)
				NewModule.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v4107 = ProtoModule.readBuffer(Buf, v139)
				NewModule.kind = { type = "ad_link", value = t.AdLinkItem.decode(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v139)
				v139 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4107 = ProtoModule.readFixed32(Buf, v139)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4107 = ProtoModule.readFixed64(Buf, v139)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module138:jsonEncode() --[[ Line: 30851 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			t.universe = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "ad_link" then
			t.adLink = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module138:jsonDecode() --[[ Line: 30869 ]]
	-- upvalues: Module138 (copy), t (copy)
	local NewModule = Module138.new()
	
	if self.layout ~= nil then
		NewModule.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		NewModule.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		NewModule.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		NewModule.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return NewModule
end

Module138.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = Module138
TypeRegistryModule.default:register(t.ItemWithLayout)
local Module139 = {}
Module139.__index = Module139

function Module139.new(p1) --[[ Line: 30908 ]]
	-- upvalues: Module139 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then nil else p1.collection_item_size
	}, Module139))
end

function Module139:encode() --[[ Line: 30917 ]]
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

function Module139.decode(Buf) --[[ Line: 30939 ]]
	-- upvalues: Module139 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module139.new()
	local v140 = 0
	while v140 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4128 = ProtoModule.readTag(Buf, v140)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4128 = ProtoModule.readVarInt(Buf, v140)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4128 = ProtoModule.readBuffer(Buf, v140)
				table.insert(NewModule.items, t.ItemWithLayout.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4128 = ProtoModule.readBuffer(Buf, v140)
				NewModule.collection_item_size = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v140)
				v140 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4128 = ProtoModule.readFixed32(Buf, v140)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4128 = ProtoModule.readFixed64(Buf, v140)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module139:jsonEncode() --[[ Line: 30987 ]]
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

function Module139:jsonDecode() --[[ Line: 31005 ]]
	-- upvalues: Module139 (copy), t (copy)
	local NewModule = Module139.new()
	
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

Module139.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = Module139
TypeRegistryModule.default:register(t.ContentPool)
local Module140 = {}
Module140.__index = Module140

function Module140.new(p1) --[[ Line: 31042 ]]
	-- upvalues: Module140 (copy)
	return (setmetatable({
		col_span = if p1 == nil or p1.col_span == nil then 0 else p1.col_span,
		row_span = if p1 == nil or p1.row_span == nil then 0 else p1.row_span,
		alignment_type = if p1 == nil or p1.alignment_type == nil then "" else p1.alignment_type,
		min_row_padding = if p1 == nil or p1.min_row_padding == nil then 0 else p1.min_row_padding
	}, Module140))
end

function Module140:encode() --[[ Line: 31051 ]]
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

function Module140.decode(Buf) --[[ Line: 31080 ]]
	-- upvalues: Module140 (copy), ProtoModule (copy)
	local NewModule = Module140.new()
	local v141 = 0
	while v141 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4153 = ProtoModule.readTag(Buf, v141)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.col_span, v4153 = ProtoModule.readVarIntI32(Buf, v141)
			elseif Tag == 2 then
				NewModule.row_span, v4153 = ProtoModule.readVarIntI32(Buf, v141)
			elseif Tag == 4 then
				NewModule.min_row_padding, v4153 = ProtoModule.readVarIntI32(Buf, v141)
			else
				local _
				_, v4153 = ProtoModule.readVarInt(Buf, v141)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 3 then
				local Buffer1
				Buffer1, v4153 = ProtoModule.readBuffer(Buf, v141)
				NewModule.alignment_type = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v141)
				v141 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4153 = ProtoModule.readFixed32(Buf, v141)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4153 = ProtoModule.readFixed64(Buf, v141)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module140:jsonEncode() --[[ Line: 31138 ]]
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

function Module140:jsonDecode() --[[ Line: 31160 ]]
	-- upvalues: Module140 (copy)
	local NewModule = Module140.new()
	
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

Module140.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = Module140
TypeRegistryModule.default:register(t.ItemLayout)
local Module141 = {}
Module141.__index = Module141

function Module141.new(p1) --[[ Line: 31212 ]]
	-- upvalues: Module141 (copy)
	return (setmetatable({
		community_id = if p1 == nil or p1.community_id == nil then "" else p1.community_id,
		announcement_id = if p1 == nil or p1.announcement_id == nil then "" else p1.announcement_id,
		message_id = if p1 == nil or p1.message_id == nil then "" else p1.message_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		body = if p1 == nil or p1.body == nil then "" else p1.body,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		creator_role_name = if p1 == nil or p1.creator_role_name == nil then nil else p1.creator_role_name,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then nil else p1.media_asset_id,
		created_time = if p1 == nil or p1.created_time == nil then nil else p1.created_time
	}, Module141))
end

function Module141:encode() --[[ Line: 31228 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.community_id)
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.announcement_id)
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.message_id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.title)
	end
	if self.body ~= nil and self.body ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.body)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.creator_key)
	end
	if self.creator_role_name ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.creator_role_name)
	end
	if self.media_asset_id ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.media_asset_id)
	end
	if self.created_time ~= nil then
		local EncodeResult = self.created_time:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module141.decode(Buf) --[[ Line: 31283 ]]
	-- upvalues: Module141 (copy), ProtoModule (copy), TimestampModule (copy)
	local NewModule = Module141.new()
	local v142 = 0
	while v142 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4186 = ProtoModule.readTag(Buf, v142)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v4186 = ProtoModule.readVarInt(Buf, v142)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.community_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.announcement_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.message_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.body = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.creator_key = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.creator_role_name = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.media_asset_id = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v4186 = ProtoModule.readBuffer(Buf, v142)
				NewModule.created_time = TimestampModule.Timestamp.decode(Buffer9)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v142)
				v142 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4186 = ProtoModule.readFixed32(Buf, v142)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4186 = ProtoModule.readFixed64(Buf, v142)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module141:jsonEncode() --[[ Line: 31366 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		t.announcementId = self.announcement_id
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		t.messageId = self.message_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.body ~= nil and self.body ~= "" then
		t.body = self.body
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.creator_role_name ~= nil then
		t.creatorRoleName = self.creator_role_name
	end
	if self.media_asset_id ~= nil then
		t.mediaAssetId = self.media_asset_id
	end
	if self.created_time ~= nil then
		t.createdTime = self.created_time:jsonEncode()
	end
	return t
end

function Module141:jsonDecode() --[[ Line: 31408 ]]
	-- upvalues: Module141 (copy), TimestampModule (copy)
	local NewModule = Module141.new()
	
	if self.community_id ~= nil then
		NewModule.community_id = self.community_id
	end
	if self.communityId ~= nil then
		NewModule.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		NewModule.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		NewModule.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		NewModule.message_id = self.message_id
	end
	if self.messageId ~= nil then
		NewModule.message_id = self.messageId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.body ~= nil then
		NewModule.body = self.body
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		NewModule.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		NewModule.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return NewModule
end

Module141.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = Module141
TypeRegistryModule.default:register(t.CommunityAnnouncementInputData)
local Module142 = {}
Module142.__index = Module142

function Module142.new(p1) --[[ Line: 31492 ]]
	-- upvalues: Module142 (copy)
	return (setmetatable({
		reaction_type = if p1 == nil or p1.reaction_type == nil then "" else p1.reaction_type,
		reaction_count = if p1 == nil or p1.reaction_count == nil then nil else p1.reaction_count,
		emote_id = if p1 == nil or p1.emote_id == nil then "" else p1.emote_id,
		has_user_applied_reaction = p1 ~= nil and p1.has_user_applied_reaction ~= nil and p1.has_user_applied_reaction
	}, Module142))
end

function Module142:encode() --[[ Line: 31503 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.reaction_type ~= nil and self.reaction_type ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.reaction_type)
	end
	if self.reaction_count ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.reaction_count)
	end
	if self.emote_id ~= nil and self.emote_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.emote_id)
	end
	if self.has_user_applied_reaction then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.has_user_applied_reaction then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module142.decode(Buf) --[[ Line: 31532 ]]
	-- upvalues: Module142 (copy), ProtoModule (copy)
	local NewModule = Module142.new()
	local v143 = 0
	while v143 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4216 = ProtoModule.readTag(Buf, v143)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.reaction_count, v4216 = ProtoModule.readVarIntI32(Buf, v143)
			elseif Tag == 4 then
				local VarInt
				VarInt, v4216 = ProtoModule.readVarInt(Buf, v143)
				NewModule.has_user_applied_reaction = VarInt ~= 0
			else
				local _
				_, v4216 = ProtoModule.readVarInt(Buf, v143)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4216 = ProtoModule.readBuffer(Buf, v143)
				NewModule.reaction_type = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v4216 = ProtoModule.readBuffer(Buf, v143)
				NewModule.emote_id = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v143)
				v143 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4216 = ProtoModule.readFixed32(Buf, v143)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4216 = ProtoModule.readFixed64(Buf, v143)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module142:jsonEncode() --[[ Line: 31590 ]]
	local t = {}
	
	if self.reaction_type ~= nil and self.reaction_type ~= "" then
		t.reactionType = self.reaction_type
	end
	if self.reaction_count ~= nil then
		t.reactionCount = self.reaction_count
	end
	if self.emote_id ~= nil and self.emote_id ~= "" then
		t.emoteId = self.emote_id
	end
	if self.has_user_applied_reaction then
		t.hasUserAppliedReaction = self.has_user_applied_reaction
	end
	return t
end

function Module142:jsonDecode() --[[ Line: 31612 ]]
	-- upvalues: Module142 (copy)
	local NewModule = Module142.new()
	
	if self.reaction_type ~= nil then
		NewModule.reaction_type = self.reaction_type
	end
	if self.reactionType ~= nil then
		NewModule.reaction_type = self.reactionType
	end
	if self.reaction_count ~= nil then
		NewModule.reaction_count = self.reaction_count
	end
	if self.reactionCount ~= nil then
		NewModule.reaction_count = self.reactionCount
	end
	if self.emote_id ~= nil then
		NewModule.emote_id = self.emote_id
	end
	if self.emoteId ~= nil then
		NewModule.emote_id = self.emoteId
	end
	if self.has_user_applied_reaction ~= nil then
		NewModule.has_user_applied_reaction = self.has_user_applied_reaction
	end
	if self.hasUserAppliedReaction ~= nil then
		NewModule.has_user_applied_reaction = self.hasUserAppliedReaction
	end
	return NewModule
end

Module142.descriptor = {
	name = "ReactionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReactionInputData"
}
t.ReactionInputData = Module142
TypeRegistryModule.default:register(t.ReactionInputData)
local Module143 = {}
Module143.__index = Module143

function Module143.new(p1) --[[ Line: 31664 ]]
	-- upvalues: Module143 (copy)
	return (setmetatable({
		group_id = if p1 == nil or p1.group_id == nil then "" else p1.group_id,
		announcement_id = if p1 == nil or p1.announcement_id == nil then "" else p1.announcement_id,
		message_id = if p1 == nil or p1.message_id == nil then "" else p1.message_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		body = if p1 == nil or p1.body == nil then "" else p1.body,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		creator_role_name = if p1 == nil or p1.creator_role_name == nil then nil else p1.creator_role_name,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then nil else p1.media_asset_id,
		created_time = if p1 == nil or p1.created_time == nil then nil else p1.created_time,
		custom_form = if p1 == nil or p1.custom_form == nil then nil else p1.custom_form,
		reactions = if p1 == nil or p1.reactions == nil then {} else p1.reactions,
		are_reaction_counts_visible = p1 ~= nil and p1.are_reaction_counts_visible ~= nil and p1.are_reaction_counts_visible
	}, Module143))
end

function Module143:encode() --[[ Line: 31685 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.group_id)
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.announcement_id)
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.message_id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.title)
	end
	if self.body ~= nil and self.body ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.body)
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.creator_key)
	end
	if self.creator_role_name ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.creator_role_name)
	end
	if self.media_asset_id ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.media_asset_id)
	end
	if self.created_time ~= nil then
		local EncodeResult = self.created_time:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.custom_form ~= nil then
		local EncodeResult = self.custom_form:encode()
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
	end
	if self.reactions ~= nil and #self.reactions > 0 then
		for _, reaction in self.reactions do
			local EncodeResult = reaction:encode()
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.are_reaction_counts_visible then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, if self.are_reaction_counts_visible then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module143.decode(Buf) --[[ Line: 31759 ]]
	-- upvalues: Module143 (copy), ProtoModule (copy), TimestampModule (copy), CustomFormDataModule (copy), t (copy)
	local NewModule = Module143.new()
	local v144 = 0
	while v144 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v4259 = ProtoModule.readTag(Buf, v144)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 12 then
				local VarInt
				VarInt, v4259 = ProtoModule.readVarInt(Buf, v144)
				NewModule.are_reaction_counts_visible = VarInt ~= 0
			else
				local _
				_, v4259 = ProtoModule.readVarInt(Buf, v144)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.group_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.announcement_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.message_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.title = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.body = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.creator_key = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.creator_role_name = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.media_asset_id = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.created_time = TimestampModule.Timestamp.decode(Buffer9)
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v4259 = ProtoModule.readBuffer(Buf, v144)
				NewModule.custom_form = CustomFormDataModule.CustomFormData.decode(Buffer10)
			elseif Tag == 11 then
				local Buffer11
				Buffer11, v4259 = ProtoModule.readBuffer(Buf, v144)
				table.insert(NewModule.reactions, t.ReactionInputData.decode(Buffer11))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v144)
				v144 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v4259 = ProtoModule.readFixed32(Buf, v144)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v4259 = ProtoModule.readFixed64(Buf, v144)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module143:jsonEncode() --[[ Line: 31858 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		t.announcementId = self.announcement_id
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		t.messageId = self.message_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.body ~= nil and self.body ~= "" then
		t.body = self.body
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.creator_role_name ~= nil then
		t.creatorRoleName = self.creator_role_name
	end
	if self.media_asset_id ~= nil then
		t.mediaAssetId = self.media_asset_id
	end
	if self.created_time ~= nil then
		t.createdTime = self.created_time:jsonEncode()
	end
	if self.custom_form ~= nil then
		t.customForm = self.custom_form:jsonEncode()
	end
	if self.reactions ~= nil and #self.reactions > 0 then
		local Reactions = {}
		
		for _, reaction in self.reactions do
			table.insert(Reactions, reaction:jsonEncode())
		end
		t.reactions = Reactions
	end
	if self.are_reaction_counts_visible then
		t.areReactionCountsVisible = self.are_reaction_counts_visible
	end
	return t
end

function Module143:jsonDecode() --[[ Line: 31916 ]]
	-- upvalues: Module143 (copy), TimestampModule (copy), CustomFormDataModule (copy), t (copy)
	local NewModule = Module143.new()
	
	if self.group_id ~= nil then
		NewModule.group_id = self.group_id
	end
	if self.groupId ~= nil then
		NewModule.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		NewModule.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		NewModule.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		NewModule.message_id = self.message_id
	end
	if self.messageId ~= nil then
		NewModule.message_id = self.messageId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.body ~= nil then
		NewModule.body = self.body
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		NewModule.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		NewModule.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	if self.custom_form ~= nil then
		NewModule.custom_form = CustomFormDataModule.CustomFormData.jsonDecode(self.custom_form)
	end
	if self.customForm ~= nil then
		NewModule.custom_form = CustomFormDataModule.CustomFormData.jsonDecode(self.customForm)
	end
	if self.reactions ~= nil then
		local Reactions = {}
		
		for _, reaction in self.reactions do
			table.insert(Reactions, t.ReactionInputData.jsonDecode(reaction))
		end
		NewModule.reactions = Reactions
	end
	if self.are_reaction_counts_visible ~= nil then
		NewModule.are_reaction_counts_visible = self.are_reaction_counts_visible
	end
	if self.areReactionCountsVisible ~= nil then
		NewModule.are_reaction_counts_visible = self.areReactionCountsVisible
	end
	return NewModule
end

Module143.descriptor = {
	name = "GroupAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GroupAnnouncementInputData"
}
t.GroupAnnouncementInputData = Module143
TypeRegistryModule.default:register(t.GroupAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p1) --[[ Line: 32024 ]]
		return if p1 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p1 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p1) --[[ Line: 32034 ]]
		return if p1 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p1
	end,
	fromName = function(p1) --[[ Line: 32044 ]]
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
	ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback,
	ExperienceDescriptionInputData = t.ExperienceDescriptionInputData,
	ExperienceStatRowInputData = t.ExperienceStatRowInputData,
	ExperienceInfoTableInputData = t.ExperienceInfoTableInputData,
	ExperienceContentRatingLabelInputData = t.ExperienceContentRatingLabelInputData,
	ExperienceRefundPolicyInputData = t.ExperienceRefundPolicyInputData,
	ExperiencePlayWithRewardInputData = t.ExperiencePlayWithRewardInputData,
	CommunitySectionInputData = t.CommunitySectionInputData,
	ExperienceLeaderboardInputData = t.ExperienceLeaderboardInputData,
	ExperienceLeaderboardInputData_UserItem = t.ExperienceLeaderboardInputData_UserItem,
	ExperienceLeaderboardInputData_CurrentUserItem = t.ExperienceLeaderboardInputData_CurrentUserItem,
	SocialLinkRowInputData = t.SocialLinkRowInputData,
	SocialLinkRowInputData_SocialLinkItem = t.SocialLinkRowInputData_SocialLinkItem,
	ExperienceCarouselInputData = t.ExperienceCarouselInputData,
	ExperienceCarouselInputData_UniverseItem = t.ExperienceCarouselInputData_UniverseItem,
	ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback,
	SongCarouselInputData = t.SongCarouselInputData,
	SongCarouselInputData_SongItem = t.SongCarouselInputData_SongItem,
	EventsCarouselInputData = t.EventsCarouselInputData,
	EventsCarouselInputData_EventItem = t.EventsCarouselInputData_EventItem,
	DevStoreFeedInputData = t.DevStoreFeedInputData,
	PillTabsInputData = t.PillTabsInputData,
	PillTabsInputData_PillTabOption = t.PillTabsInputData_PillTabOption,
	GamePassCollectionInputData = t.GamePassCollectionInputData,
	GamePassCollectionInputData_GamePassItem = t.GamePassCollectionInputData_GamePassItem,
	DeveloperProductCollectionInputData = t.DeveloperProductCollectionInputData,
	DeveloperProductCollectionInputData_DeveloperProductItem = t.DeveloperProductCollectionInputData_DeveloperProductItem,
	SubscriptionCollectionInputData = t.SubscriptionCollectionInputData,
	SubscriptionCollectionInputData_SubscriptionItem = t.SubscriptionCollectionInputData_SubscriptionItem,
	DynamicStoreCategoryInputData = t.DynamicStoreCategoryInputData,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType,
	CardContainerCardInputData = t.CardContainerCardInputData,
	CommunitiesCardClientAttributes = t.CommunitiesCardClientAttributes,
	CardContainerInputData = t.CardContainerInputData,
	CardInputData = t.CardInputData,
	DialogInputData = t.DialogInputData,
	IncomingTransferContent = t.IncomingTransferContent,
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
	EventAttributionRowInputData_RsvpUser = t.EventAttributionRowInputData_RsvpUser,
	EventInfoTableInputData = t.EventInfoTableInputData,
	EventDetailsSheetFullBleedInputData = t.EventDetailsSheetFullBleedInputData,
	EventNotificationsModalInputData = t.EventNotificationsModalInputData,
	ChartsFeedInputData = t.ChartsFeedInputData,
	FilterPillsInputData = t.FilterPillsInputData,
	FilterPillsInputData_FilterGroup = t.FilterPillsInputData_FilterGroup,
	FilterPillsInputData_FilterOption = t.FilterPillsInputData_FilterOption,
	SortSelectorInputData = t.SortSelectorInputData,
	SortSelectorInputData_SortOption = t.SortSelectorInputData_SortOption,
	ChartsGenreSelectorInputData = t.ChartsGenreSelectorInputData,
	UAMarketplaceCatalogItemGroupInputData = t.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t.UAMarketplaceCatalogItemCarouselInputData,
	WidgetStyleData = t.WidgetStyleData,
	UAMarketplaceCatalogHeroUnitInputData = t.UAMarketplaceCatalogHeroUnitInputData,
	UAMarketplaceCatalogFeedInputData = t.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogCategoryMenuInputData = t.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
	MarketplaceOfferModalInputData = t.MarketplaceOfferModalInputData,
	MarketplaceItemMediaHeaderInputData = t.MarketplaceItemMediaHeaderInputData,
	MarketplaceItemMediaHeaderInputData_BundleItem = t.MarketplaceItemMediaHeaderInputData_BundleItem,
	CatalogItemGridInputData = t.CatalogItemGridInputData,
	CatalogItemGridInputData_CatalogItem = t.CatalogItemGridInputData_CatalogItem,
	SearchResultsFeedInputData = t.SearchResultsFeedInputData,
	SearchAutocompleteInputData = t.SearchAutocompleteInputData,
	SearchAutocompleteInputData_Suggestion = t.SearchAutocompleteInputData_Suggestion,
	SearchAutocompleteInputData_Suggestion_SuggestionType = t.SearchAutocompleteInputData_Suggestion_SuggestionType,
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
	CtaButtonsInputData = t.CtaButtonsInputData,
	ImageInputData = t.ImageInputData,
	VideoInputData = t.VideoInputData,
	TextInputData = t.TextInputData,
	VerticalFeedInputData = t.VerticalFeedInputData,
	PageHeaderInputData = t.PageHeaderInputData,
	PreAuthLandingStickyHeaderInputData = t.PreAuthLandingStickyHeaderInputData,
	ImageCtaSectionInputData = t.ImageCtaSectionInputData,
	SettingsRowInputData = t.SettingsRowInputData,
	SettingsToggleInputData = t.SettingsToggleInputData,
	HeroUnitInputData = t.HeroUnitInputData,
	HeroUnitInputData_VisualAsset = t.HeroUnitInputData_VisualAsset,
	HeroUnitInputData_Gradient = t.HeroUnitInputData_Gradient,
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_RecommendationItem = t.FriendRecommendationCarouselInputData_RecommendationItem,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	GameItemsCarouselInputData = t.GameItemsCarouselInputData,
	GameItemsCardInputData = t.GameItemsCardInputData,
	GameItemInputData = t.GameItemInputData,
	AdLinkItem = t.AdLinkItem,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	CommunityAnnouncementInputData = t.CommunityAnnouncementInputData,
	ReactionInputData = t.ReactionInputData,
	GroupAnnouncementInputData = t.GroupAnnouncementInputData,
	PageEntryFormat = t.PageEntryFormat
}