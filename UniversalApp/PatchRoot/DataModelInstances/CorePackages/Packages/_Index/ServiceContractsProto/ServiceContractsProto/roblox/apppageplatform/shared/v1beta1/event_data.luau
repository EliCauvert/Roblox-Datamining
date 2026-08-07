local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 57 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		title = if p0 == nil or p0.title == nil then "" else p0.title,
		subtitle = if p0 == nil or p0.subtitle == nil then "" else p0.subtitle,
		event_start = if p0 == nil or p0.event_start == nil then "" else p0.event_start,
		event_end = if p0 == nil or p0.event_end == nil then "" else p0.event_end,
		user_rsvp = if p0 == nil or p0.user_rsvp == nil then false else p0.user_rsvp,
		media_asset_id = if p0 == nil or p0.media_asset_id == nil then 0 else p0.media_asset_id,
		description = if p0 == nil or p0.description == nil then "" else p0.description,
		rsvp_count = if p0 == nil or p0.rsvp_count == nil then 0 else p0.rsvp_count,
		place_id = if p0 == nil or p0.place_id == nil then "" else p0.place_id
	}, t_1)
end

function t_1:encode() --[[ line: 72 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.title ~= nil and self.title ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.title)
		buff = var8
		var5 = var9
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.subtitle)
		buff = var10
		var5 = var11
	end
	if self.event_start ~= nil and self.event_start ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.event_start)
		buff = var12
		var5 = var13
	end
	if self.event_end ~= nil and self.event_end ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.event_end)
		buff = var14
		var5 = var15
	end
	if self.user_rsvp then
		local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, if self.user_rsvp then 1 else 0)
		buff = var16
		var5 = var17
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= 0 then
		local var18, var19 = protoModule.writeTag(buff, var5, 7, protoModule.wireTypes.varint)
		var18, var19 = protoModule.writeVarInt(var18, var19, self.media_asset_id)
		buff = var18
		var5 = var19
	end
	if self.description ~= nil and self.description ~= "" then
		local var20, var21 = protoModule.writeTag(buff, var5, 8, protoModule.wireTypes.lengthDelimited)
		var20, var21 = protoModule.writeString(var20, var21, self.description)
		buff = var20
		var5 = var21
	end
	if self.rsvp_count ~= nil and self.rsvp_count ~= 0 then
		local var22, var23 = protoModule.writeTag(buff, var5, 9, protoModule.wireTypes.varint)
		var22, var23 = protoModule.writeVarInt(var22, var23, self.rsvp_count)
		buff = var22
		var5 = var23
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var5, 10, protoModule.wireTypes.lengthDelimited)
		var24, var25 = protoModule.writeString(var24, var25, self.place_id)
		buff = var24
		var5 = var25
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 131 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var27 = t_1.new()
	local var28 = 0
	while var28 < buffer.len(p1) do
		local _ = nil
		local var29 = nil
		local var30, var31, var32 = protoModule.readTag(p1, var28)
		local var33 = var30
		var29 = var31
		var28 = var32
		
		if var29 == protoModule.wireTypes.varint then
			if var33 == 6 then
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var28)
				var28 = var35
				var27.user_rsvp = var34 ~= 0
			elseif var33 == 7 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI64(p1, var28)
				var28 = var37
				var27.media_asset_id = var36
			elseif var33 == 9 then
				local _ = nil
				local var38, var39 = protoModule.readVarIntI64(p1, var28)
				var28 = var39
				var27.rsvp_count = var38
			else
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p1, var28)
				local _ = var40
				var28 = var41
			end
		end
		if var29 == protoModule.wireTypes.lengthDelimited then
			if var33 == 1 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var28)
				var28 = var43
				var27.id = buffer.tostring(var42)
			elseif var33 == 2 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var28)
				var28 = var45
				var27.title = buffer.tostring(var44)
			elseif var33 == 3 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var28)
				var28 = var47
				var27.subtitle = buffer.tostring(var46)
			elseif var33 == 4 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var28)
				var28 = var49
				var27.event_start = buffer.tostring(var48)
			elseif var33 == 5 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var28)
				var28 = var51
				var27.event_end = buffer.tostring(var50)
			elseif var33 == 8 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var28)
				var28 = var53
				var27.description = buffer.tostring(var52)
			elseif var33 == 10 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var28)
				var28 = var55
				var27.place_id = buffer.tostring(var54)
			else
				local _ = nil
				local var56, var57 = protoModule.readVarInt(p1, var28)
				var28 = var57 + var56
			end
		elseif var29 == protoModule.wireTypes.i32 then
			local _ = nil
			local var58, var59 = protoModule.readFixed32(p1, var28)
			local _ = var58
			var28 = var59
		elseif var29 == protoModule.wireTypes.i64 then
			local _ = nil
			local var60, var61 = protoModule.readFixed64(p1, var28)
			local _ = var60
			var28 = var61
		else
			error("Unsupported wire type: " .. var29)
		end
	end
	return var27
end

function t_1:jsonEncode() --[[ line: 219 ]]
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

function t_1:jsonDecode() --[[ line: 265 ]]
	-- upvalues: t_1 (ref)
	local var63 = t_1.new()
	
	if self.id ~= nil then
		var63.id = self.id
	end
	if self.title ~= nil then
		var63.title = self.title
	end
	if self.subtitle ~= nil then
		var63.subtitle = self.subtitle
	end
	if self.event_start ~= nil then
		var63.event_start = self.event_start
	end
	if self.eventStart ~= nil then
		var63.event_start = self.eventStart
	end
	if self.event_end ~= nil then
		var63.event_end = self.event_end
	end
	if self.eventEnd ~= nil then
		var63.event_end = self.eventEnd
	end
	if self.user_rsvp ~= nil then
		var63.user_rsvp = self.user_rsvp
	end
	if self.userRsvp ~= nil then
		var63.user_rsvp = self.userRsvp
	end
	if self.media_asset_id ~= nil then
		var63.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var63.media_asset_id = self.mediaAssetId
	end
	if self.description ~= nil then
		var63.description = self.description
	end
	if self.rsvp_count ~= nil then
		var63.rsvp_count = self.rsvp_count
	end
	if self.rsvpCount ~= nil then
		var63.rsvp_count = self.rsvpCount
	end
	if self.place_id ~= nil then
		var63.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var63.place_id = self.placeId
	end
	return var63
end

t_1.descriptor = {
	name = "EventData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventData"
}
t.EventData = t_1
typeRegistryModule.default:register(t.EventData)

return { EventData = t.EventData }