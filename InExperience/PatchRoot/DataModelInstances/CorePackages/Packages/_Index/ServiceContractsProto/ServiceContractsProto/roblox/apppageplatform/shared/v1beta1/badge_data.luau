local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local timestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local _ = require(script.Parent.custom_options)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then 0 else p0.id,
		display_name = if p0 == nil or p0.display_name == nil then "" else p0.display_name,
		display_icon_image_id = if p0 == nil or p0.display_icon_image_id == nil then 0 else p0.display_icon_image_id,
		display_description = if p0 == nil or p0.display_description == nil then "" else p0.display_description,
		total_awarded_count = if p0 == nil or p0.total_awarded_count == nil then 0 else p0.total_awarded_count,
		past_day_awarded_count = if p0 == nil or p0.past_day_awarded_count == nil then 0 else p0.past_day_awarded_count,
		rarity = if p0 == nil or p0.rarity == nil then "" else p0.rarity,
		badge_type_label = if p0 == nil or p0.badge_type_label == nil then "" else p0.badge_type_label,
		created_time = if p0 == nil or p0.created_time == nil then nil else p0.created_time,
		updated_time = if p0 == nil or p0.updated_time == nil then nil else p0.updated_time,
		is_earned_by_user = if p0 == nil or p0.is_earned_by_user == nil then false else p0.is_earned_by_user,
		awarded_time = if p0 == nil or p0.awarded_time == nil then nil else p0.awarded_time
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.id ~= nil and self.id ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.varint)
		var7, var8 = protoModule.writeVarInt(var7, var8, self.id)
		buff = var7
		var6 = var8
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var9, var10 = protoModule.writeString(var9, var10, self.display_name)
		buff = var9
		var6 = var10
	end
	if self.display_icon_image_id ~= nil and self.display_icon_image_id ~= 0 then
		local var11, var12 = protoModule.writeTag(buff, var6, 3, protoModule.wireTypes.varint)
		var11, var12 = protoModule.writeVarInt(var11, var12, self.display_icon_image_id)
		buff = var11
		var6 = var12
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var6, 4, protoModule.wireTypes.lengthDelimited)
		var13, var14 = protoModule.writeString(var13, var14, self.display_description)
		buff = var13
		var6 = var14
	end
	if self.total_awarded_count ~= nil and self.total_awarded_count ~= 0 then
		local var15, var16 = protoModule.writeTag(buff, var6, 5, protoModule.wireTypes.varint)
		var15, var16 = protoModule.writeVarInt(var15, var16, self.total_awarded_count)
		buff = var15
		var6 = var16
	end
	if self.past_day_awarded_count ~= nil and self.past_day_awarded_count ~= 0 then
		local var17, var18 = protoModule.writeTag(buff, var6, 6, protoModule.wireTypes.varint)
		var17, var18 = protoModule.writeVarInt(var17, var18, self.past_day_awarded_count)
		buff = var17
		var6 = var18
	end
	if self.rarity ~= nil and self.rarity ~= "" then
		local var19, var20 = protoModule.writeTag(buff, var6, 7, protoModule.wireTypes.lengthDelimited)
		var19, var20 = protoModule.writeString(var19, var20, self.rarity)
		buff = var19
		var6 = var20
	end
	if self.badge_type_label ~= nil and self.badge_type_label ~= "" then
		local var21, var22 = protoModule.writeTag(buff, var6, 8, protoModule.wireTypes.lengthDelimited)
		var21, var22 = protoModule.writeString(var21, var22, self.badge_type_label)
		buff = var21
		var6 = var22
	end
	if self.created_time ~= nil then
		local var23 = self.created_time:encode()
		local var24, var25 = protoModule.writeTag(buff, var6, 9, protoModule.wireTypes.lengthDelimited)
		var24, var25 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var6 = var25
	end
	if self.updated_time ~= nil then
		local var26 = self.updated_time:encode()
		local var27, var28 = protoModule.writeTag(buff, var6, 10, protoModule.wireTypes.lengthDelimited)
		var27, var28 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var6 = var28
	end
	if self.is_earned_by_user then
		local var29, var30 = protoModule.writeTag(buff, var6, 11, protoModule.wireTypes.varint)
		var29, var30 = protoModule.writeVarInt(var29, var30, if self.is_earned_by_user then 1 else 0)
		buff = var29
		var6 = var30
	end
	if self.awarded_time ~= nil then
		local var31 = self.awarded_time:encode()
		local var32, var33 = protoModule.writeTag(buff, var6, 12, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
		buff = var32
		var6 = var33
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), timestampModule (ref)
	local var35 = t_1.new()
	local var36 = 0
	while var36 < buffer.len(p1) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p1, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			if var41 == 1 then
				local _ = nil
				local var42, var43 = protoModule.readVarIntI64(p1, var36)
				var36 = var43
				var35.id = var42
			elseif var41 == 3 then
				local _ = nil
				local var44, var45 = protoModule.readVarIntI64(p1, var36)
				var36 = var45
				var35.display_icon_image_id = var44
			elseif var41 == 5 then
				local _ = nil
				local var46, var47 = protoModule.readVarIntI64(p1, var36)
				var36 = var47
				var35.total_awarded_count = var46
			elseif var41 == 6 then
				local _ = nil
				local var48, var49 = protoModule.readVarIntI64(p1, var36)
				var36 = var49
				var35.past_day_awarded_count = var48
			elseif var41 == 11 then
				local _ = nil
				local var50, var51 = protoModule.readVarInt(p1, var36)
				var36 = var51
				var35.is_earned_by_user = var50 ~= 0
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p1, var36)
				local _ = var52
				var36 = var53
			end
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 2 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var36)
				var36 = var55
				var35.display_name = buffer.tostring(var54)
			elseif var41 == 4 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var36)
				var36 = var57
				var35.display_description = buffer.tostring(var56)
			elseif var41 == 7 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var36)
				var36 = var59
				var35.rarity = buffer.tostring(var58)
			elseif var41 == 8 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var36)
				var36 = var61
				var35.badge_type_label = buffer.tostring(var60)
			elseif var41 == 9 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var36)
				var36 = var63
				var35.created_time = timestampModule.Timestamp.decode(var62)
			elseif var41 == 10 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var36)
				var36 = var65
				var35.updated_time = timestampModule.Timestamp.decode(var64)
			elseif var41 == 12 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var36)
				var36 = var67
				var35.awarded_time = timestampModule.Timestamp.decode(var66)
			else
				local _ = nil
				local var68, var69 = protoModule.readVarInt(p1, var36)
				var36 = var69 + var68
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var70, var71 = protoModule.readFixed32(p1, var36)
			local _ = var70
			var36 = var71
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var72, var73 = protoModule.readFixed64(p1, var36)
			local _ = var72
			var36 = var73
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var35
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), timestampModule (ref)
	local var75 = t_1.new()
	
	if self.id ~= nil then
		var75.id = self.id
	end
	if self.display_name ~= nil then
		var75.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var75.display_name = self.displayName
	end
	if self.display_icon_image_id ~= nil then
		var75.display_icon_image_id = self.display_icon_image_id
	end
	if self.displayIconImageId ~= nil then
		var75.display_icon_image_id = self.displayIconImageId
	end
	if self.display_description ~= nil then
		var75.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		var75.display_description = self.displayDescription
	end
	if self.total_awarded_count ~= nil then
		var75.total_awarded_count = self.total_awarded_count
	end
	if self.totalAwardedCount ~= nil then
		var75.total_awarded_count = self.totalAwardedCount
	end
	if self.past_day_awarded_count ~= nil then
		var75.past_day_awarded_count = self.past_day_awarded_count
	end
	if self.pastDayAwardedCount ~= nil then
		var75.past_day_awarded_count = self.pastDayAwardedCount
	end
	if self.rarity ~= nil then
		var75.rarity = self.rarity
	end
	if self.badge_type_label ~= nil then
		var75.badge_type_label = self.badge_type_label
	end
	if self.badgeTypeLabel ~= nil then
		var75.badge_type_label = self.badgeTypeLabel
	end
	if self.created_time ~= nil then
		var75.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var75.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	if self.updated_time ~= nil then
		var75.updated_time = timestampModule.Timestamp.jsonDecode(self.updated_time)
	end
	if self.updatedTime ~= nil then
		var75.updated_time = timestampModule.Timestamp.jsonDecode(self.updatedTime)
	end
	if self.is_earned_by_user ~= nil then
		var75.is_earned_by_user = self.is_earned_by_user
	end
	if self.isEarnedByUser ~= nil then
		var75.is_earned_by_user = self.isEarnedByUser
	end
	if self.awarded_time ~= nil then
		var75.awarded_time = timestampModule.Timestamp.jsonDecode(self.awarded_time)
	end
	if self.awardedTime ~= nil then
		var75.awarded_time = timestampModule.Timestamp.jsonDecode(self.awardedTime)
	end
	return var75
end

t_1.descriptor = {
	name = "BadgeData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeData"
}
t.BadgeData = t_1
typeRegistryModule.default:register(t.BadgeData)

return { BadgeData = t.BadgeData }