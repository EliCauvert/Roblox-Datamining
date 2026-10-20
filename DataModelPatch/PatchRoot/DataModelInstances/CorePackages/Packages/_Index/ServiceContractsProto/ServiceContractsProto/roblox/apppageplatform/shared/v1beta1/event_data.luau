local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		event_start = if p1 == nil or p1.event_start == nil then "" else p1.event_start,
		event_end = if p1 == nil or p1.event_end == nil then "" else p1.event_end,
		user_rsvp = p1 ~= nil and p1.user_rsvp ~= nil and p1.user_rsvp,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then 0 else p1.media_asset_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		rsvp_count = if p1 == nil or p1.rsvp_count == nil then 0 else p1.rsvp_count,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.subtitle)
	end
	if self.event_start ~= nil and self.event_start ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.event_start)
	end
	if self.event_end ~= nil and self.event_end ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.event_end)
	end
	if self.user_rsvp then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, if self.user_rsvp then 1 else 0)
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= 0 then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, self.media_asset_id)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.description)
	end
	if self.rsvp_count ~= nil and self.rsvp_count ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.rsvp_count)
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.place_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v27 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				local VarInt
				VarInt, v27 = ProtoModule.readVarInt(Buf, v1)
				NewModule.user_rsvp = VarInt ~= 0
			elseif Tag == 7 then
				NewModule.media_asset_id, v27 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 9 then
				NewModule.rsvp_count, v27 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v27 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.subtitle = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.event_start = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.event_end = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer6)
			elseif Tag == 10 then
				local Buffer7
				Buffer7, v27 = ProtoModule.readBuffer(Buf, v1)
				NewModule.place_id = buffer.tostring(Buffer7)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v27 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v27 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.event_start ~= nil and self.event_start ~= "" then
		t.eventStart = self.event_start
	end
	if self.event_end ~= nil and self.event_end ~= "" then
		t.eventEnd = self.event_end
	end
	if self.user_rsvp then
		t.userRsvp = self.user_rsvp
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= 0 then
		t.mediaAssetId = self.media_asset_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.rsvp_count ~= nil and self.rsvp_count ~= 0 then
		t.rsvpCount = self.rsvp_count
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.subtitle ~= nil then
		NewModule.subtitle = self.subtitle
	end
	if self.event_start ~= nil then
		NewModule.event_start = self.event_start
	end
	if self.eventStart ~= nil then
		NewModule.event_start = self.eventStart
	end
	if self.event_end ~= nil then
		NewModule.event_end = self.event_end
	end
	if self.eventEnd ~= nil then
		NewModule.event_end = self.eventEnd
	end
	if self.user_rsvp ~= nil then
		NewModule.user_rsvp = self.user_rsvp
	end
	if self.userRsvp ~= nil then
		NewModule.user_rsvp = self.userRsvp
	end
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.rsvp_count ~= nil then
		NewModule.rsvp_count = self.rsvp_count
	end
	if self.rsvpCount ~= nil then
		NewModule.rsvp_count = self.rsvpCount
	end
	if self.place_id ~= nil then
		NewModule.place_id = self.place_id
	end
	if self.placeId ~= nil then
		NewModule.place_id = self.placeId
	end
	return NewModule
end

Module.descriptor = {
	name = "EventData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventData"
}
local config = { EventData = Module }
TypeRegistryModule.default:register(config.EventData)

return { EventData = config.EventData }