local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local TimestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local _ = require(script.Parent.custom_options)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then 0 else p1.id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		display_icon_image_id = if p1 == nil or p1.display_icon_image_id == nil then 0 else p1.display_icon_image_id,
		display_description = if p1 == nil or p1.display_description == nil then "" else p1.display_description,
		total_awarded_count = if p1 == nil or p1.total_awarded_count == nil then 0 else p1.total_awarded_count,
		past_day_awarded_count = if p1 == nil or p1.past_day_awarded_count == nil then 0 else p1.past_day_awarded_count,
		rarity = if p1 == nil or p1.rarity == nil then "" else p1.rarity,
		badge_type_label = if p1 == nil or p1.badge_type_label == nil then "" else p1.badge_type_label,
		created_time = if p1 == nil or p1.created_time == nil then nil else p1.created_time,
		updated_time = if p1 == nil or p1.updated_time == nil then nil else p1.updated_time,
		is_earned_by_user = p1 ~= nil and p1.is_earned_by_user ~= nil and p1.is_earned_by_user,
		awarded_time = if p1 == nil or p1.awarded_time == nil then nil else p1.awarded_time
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.display_icon_image_id ~= nil and self.display_icon_image_id ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.display_icon_image_id)
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.display_description)
	end
	if self.total_awarded_count ~= nil and self.total_awarded_count ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.total_awarded_count)
	end
	if self.past_day_awarded_count ~= nil and self.past_day_awarded_count ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.past_day_awarded_count)
	end
	if self.rarity ~= nil and self.rarity ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.rarity)
	end
	if self.badge_type_label ~= nil and self.badge_type_label ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.badge_type_label)
	end
	if self.created_time ~= nil then
		local EncodeResult = self.created_time:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	if self.updated_time ~= nil then
		local EncodeResult = self.updated_time:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_earned_by_user then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, if self.is_earned_by_user then 1 else 0)
	end
	if self.awarded_time ~= nil then
		local EncodeResult = self.awarded_time:encode()
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), TimestampModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v36 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.id, v36 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				NewModule.display_icon_image_id, v36 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 5 then
				NewModule.total_awarded_count, v36 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 6 then
				NewModule.past_day_awarded_count, v36 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 11 then
				local VarInt
				VarInt, v36 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_earned_by_user = VarInt ~= 0
			else
				local _
				_, v36 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_name = buffer.tostring(Buffer1)
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_description = buffer.tostring(Buffer2)
			elseif Tag == 7 then
				local Buffer3
				Buffer3, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.rarity = buffer.tostring(Buffer3)
			elseif Tag == 8 then
				local Buffer4
				Buffer4, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.badge_type_label = buffer.tostring(Buffer4)
			elseif Tag == 9 then
				local Buffer5
				Buffer5, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.created_time = TimestampModule.Timestamp.decode(Buffer5)
			elseif Tag == 10 then
				local Buffer6
				Buffer6, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.updated_time = TimestampModule.Timestamp.decode(Buffer6)
			elseif Tag == 12 then
				local Buffer7
				Buffer7, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.awarded_time = TimestampModule.Timestamp.decode(Buffer7)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v36 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v36 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= 0 then
		t.id = self.id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.display_icon_image_id ~= nil and self.display_icon_image_id ~= 0 then
		t.displayIconImageId = self.display_icon_image_id
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		t.displayDescription = self.display_description
	end
	if self.total_awarded_count ~= nil and self.total_awarded_count ~= 0 then
		t.totalAwardedCount = self.total_awarded_count
	end
	if self.past_day_awarded_count ~= nil and self.past_day_awarded_count ~= 0 then
		t.pastDayAwardedCount = self.past_day_awarded_count
	end
	if self.rarity ~= nil and self.rarity ~= "" then
		t.rarity = self.rarity
	end
	if self.badge_type_label ~= nil and self.badge_type_label ~= "" then
		t.badgeTypeLabel = self.badge_type_label
	end
	if self.created_time ~= nil then
		t.createdTime = self.created_time:jsonEncode()
	end
	if self.updated_time ~= nil then
		t.updatedTime = self.updated_time:jsonEncode()
	end
	if self.is_earned_by_user then
		t.isEarnedByUser = self.is_earned_by_user
	end
	if self.awarded_time ~= nil then
		t.awardedTime = self.awarded_time:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), TimestampModule (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.display_icon_image_id ~= nil then
		NewModule.display_icon_image_id = self.display_icon_image_id
	end
	if self.displayIconImageId ~= nil then
		NewModule.display_icon_image_id = self.displayIconImageId
	end
	if self.display_description ~= nil then
		NewModule.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		NewModule.display_description = self.displayDescription
	end
	if self.total_awarded_count ~= nil then
		NewModule.total_awarded_count = self.total_awarded_count
	end
	if self.totalAwardedCount ~= nil then
		NewModule.total_awarded_count = self.totalAwardedCount
	end
	if self.past_day_awarded_count ~= nil then
		NewModule.past_day_awarded_count = self.past_day_awarded_count
	end
	if self.pastDayAwardedCount ~= nil then
		NewModule.past_day_awarded_count = self.pastDayAwardedCount
	end
	if self.rarity ~= nil then
		NewModule.rarity = self.rarity
	end
	if self.badge_type_label ~= nil then
		NewModule.badge_type_label = self.badge_type_label
	end
	if self.badgeTypeLabel ~= nil then
		NewModule.badge_type_label = self.badgeTypeLabel
	end
	if self.created_time ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		NewModule.created_time = TimestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	if self.updated_time ~= nil then
		NewModule.updated_time = TimestampModule.Timestamp.jsonDecode(self.updated_time)
	end
	if self.updatedTime ~= nil then
		NewModule.updated_time = TimestampModule.Timestamp.jsonDecode(self.updatedTime)
	end
	if self.is_earned_by_user ~= nil then
		NewModule.is_earned_by_user = self.is_earned_by_user
	end
	if self.isEarnedByUser ~= nil then
		NewModule.is_earned_by_user = self.isEarnedByUser
	end
	if self.awarded_time ~= nil then
		NewModule.awarded_time = TimestampModule.Timestamp.jsonDecode(self.awarded_time)
	end
	if self.awardedTime ~= nil then
		NewModule.awarded_time = TimestampModule.Timestamp.jsonDecode(self.awardedTime)
	end
	return NewModule
end

Module.descriptor = {
	name = "BadgeData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeData"
}
local config = { BadgeData = Module }
TypeRegistryModule.default:register(config.BadgeData)

return { BadgeData = config.BadgeData }