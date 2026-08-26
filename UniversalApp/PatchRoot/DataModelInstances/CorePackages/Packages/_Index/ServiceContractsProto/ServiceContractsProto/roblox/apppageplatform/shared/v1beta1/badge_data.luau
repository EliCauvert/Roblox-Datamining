local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local timestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
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
		is_earned_by_user = if p1 == nil or p1.is_earned_by_user == nil then false else p1.is_earned_by_user,
		awarded_time = if p1 == nil or p1.awarded_time == nil then nil else p1.awarded_time
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var8 = protoModule.writeVarInt(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var10 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.display_icon_image_id ~= nil and self.display_icon_image_id ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var12 = protoModule.writeVarInt(var6, var7, self.display_icon_image_id)
		buff = var6
		var1 = var7
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var14 = protoModule.writeString(var8, var9, self.display_description)
		buff = var8
		var1 = var9
	end
	if self.total_awarded_count ~= nil and self.total_awarded_count ~= 0 then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var16 = protoModule.writeVarInt(var10, var11, self.total_awarded_count)
		buff = var10
		var1 = var11
	end
	if self.past_day_awarded_count ~= nil and self.past_day_awarded_count ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var18 = protoModule.writeVarInt(var12, var13, self.past_day_awarded_count)
		buff = var12
		var1 = var13
	end
	if self.rarity ~= nil and self.rarity ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var20 = protoModule.writeString(var14, var15, self.rarity)
		buff = var14
		var1 = var15
	end
	if self.badge_type_label ~= nil and self.badge_type_label ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var22 = protoModule.writeString(var16, var17, self.badge_type_label)
		buff = var16
		var1 = var17
	end
	if self.created_time ~= nil then
		local var18 = self.created_time:encode()
		local var19, var20 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var19, var25 = protoModule.writeBuffer(var19, var20, var18, buffer.len(var18))
		buff = var19
		var1 = var20
	end
	if self.updated_time ~= nil then
		local var21 = self.updated_time:encode()
		local var22, var23 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var22, var28 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var1 = var23
	end
	if self.is_earned_by_user then
		local var24, var25 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.varint)
		var24, var30 = protoModule.writeVarInt(var24, var25, if self.is_earned_by_user then 1 else 0)
		buff = var24
		var1 = var25
	end
	if self.awarded_time ~= nil then
		local var26 = self.awarded_time:encode()
		local var27, var28 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var27, var33 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var1 = var28
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), timestampModule (ref)
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
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.id = var8
			elseif var7 == 3 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.display_icon_image_id = var10
			elseif var7 == 5 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI64(p1, var2)
				var2 = var13
				var1.total_awarded_count = var12
			elseif var7 == 6 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI64(p1, var2)
				var2 = var15
				var1.past_day_awarded_count = var14
			elseif var7 == 11 then
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17
				var1.is_earned_by_user = var16 ~= 0
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				local _ = var18
				var2 = var19
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.display_name = buffer.tostring(var20)
			elseif var7 == 4 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.display_description = buffer.tostring(var22)
			elseif var7 == 7 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.rarity = buffer.tostring(var24)
			elseif var7 == 8 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.badge_type_label = buffer.tostring(var26)
			elseif var7 == 9 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.created_time = timestampModule.Timestamp.decode(var28)
			elseif var7 == 10 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.updated_time = timestampModule.Timestamp.decode(var30)
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.awarded_time = timestampModule.Timestamp.decode(var32)
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var2)
				var2 = var35 + var34
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var36, var37 = protoModule.readFixed32(p1, var2)
			local _ = var36
			var2 = var37
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var38, var39 = protoModule.readFixed64(p1, var2)
			local _ = var38
			var2 = var39
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var1
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
	local var40 = t_1.new()
	
	if self.id ~= nil then
		var40.id = self.id
	end
	if self.display_name ~= nil then
		var40.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var40.display_name = self.displayName
	end
	if self.display_icon_image_id ~= nil then
		var40.display_icon_image_id = self.display_icon_image_id
	end
	if self.displayIconImageId ~= nil then
		var40.display_icon_image_id = self.displayIconImageId
	end
	if self.display_description ~= nil then
		var40.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		var40.display_description = self.displayDescription
	end
	if self.total_awarded_count ~= nil then
		var40.total_awarded_count = self.total_awarded_count
	end
	if self.totalAwardedCount ~= nil then
		var40.total_awarded_count = self.totalAwardedCount
	end
	if self.past_day_awarded_count ~= nil then
		var40.past_day_awarded_count = self.past_day_awarded_count
	end
	if self.pastDayAwardedCount ~= nil then
		var40.past_day_awarded_count = self.pastDayAwardedCount
	end
	if self.rarity ~= nil then
		var40.rarity = self.rarity
	end
	if self.badge_type_label ~= nil then
		var40.badge_type_label = self.badge_type_label
	end
	if self.badgeTypeLabel ~= nil then
		var40.badge_type_label = self.badgeTypeLabel
	end
	if self.created_time ~= nil then
		var40.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var40.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	if self.updated_time ~= nil then
		var40.updated_time = timestampModule.Timestamp.jsonDecode(self.updated_time)
	end
	if self.updatedTime ~= nil then
		var40.updated_time = timestampModule.Timestamp.jsonDecode(self.updatedTime)
	end
	if self.is_earned_by_user ~= nil then
		var40.is_earned_by_user = self.is_earned_by_user
	end
	if self.isEarnedByUser ~= nil then
		var40.is_earned_by_user = self.isEarnedByUser
	end
	if self.awarded_time ~= nil then
		var40.awarded_time = timestampModule.Timestamp.jsonDecode(self.awarded_time)
	end
	if self.awardedTime ~= nil then
		var40.awarded_time = timestampModule.Timestamp.jsonDecode(self.awardedTime)
	end
	return var40
end

t_1.descriptor = {
	name = "BadgeData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeData"
}
t.BadgeData = t_1
typeRegistryModule.default:register(t.BadgeData)

return { BadgeData = t.BadgeData }