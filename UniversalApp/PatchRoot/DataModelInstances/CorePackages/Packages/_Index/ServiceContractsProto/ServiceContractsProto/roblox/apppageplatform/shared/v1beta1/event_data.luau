local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		event_start = if p1 == nil or p1.event_start == nil then "" else p1.event_start,
		event_end = if p1 == nil or p1.event_end == nil then "" else p1.event_end,
		user_rsvp = if p1 == nil or p1.user_rsvp == nil then false else p1.user_rsvp,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then 0 else p1.media_asset_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		rsvp_count = if p1 == nil or p1.rsvp_count == nil then 0 else p1.rsvp_count,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.title ~= nil and self.title ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.title)
		buff = var4
		var1 = var5
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.subtitle)
		buff = var6
		var1 = var7
	end
	if self.event_start ~= nil and self.event_start ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.event_start)
		buff = var8
		var1 = var9
	end
	if self.event_end ~= nil and self.event_end ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.event_end)
		buff = var10
		var1 = var11
	end
	if self.user_rsvp then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var17 = protoModule.writeVarInt(var12, var13, if self.user_rsvp then 1 else 0)
		buff = var12
		var1 = var13
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= 0 then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var14, var19 = protoModule.writeVarInt(var14, var15, self.media_asset_id)
		buff = var14
		var1 = var15
	end
	if self.description ~= nil and self.description ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var21 = protoModule.writeString(var16, var17, self.description)
		buff = var16
		var1 = var17
	end
	if self.rsvp_count ~= nil and self.rsvp_count ~= 0 then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.varint)
		var18, var23 = protoModule.writeVarInt(var18, var19, self.rsvp_count)
		buff = var18
		var1 = var19
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var20, var25 = protoModule.writeString(var20, var21, self.place_id)
		buff = var20
		var1 = var21
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
			if var7 == 6 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.user_rsvp = var8 ~= 0
			elseif var7 == 7 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.media_asset_id = var10
			elseif var7 == 9 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI64(p1, var2)
				var2 = var13
				var1.rsvp_count = var12
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				local _ = var14
				var2 = var15
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.id = buffer.tostring(var16)
			elseif var7 == 2 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.title = buffer.tostring(var18)
			elseif var7 == 3 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.subtitle = buffer.tostring(var20)
			elseif var7 == 4 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.event_start = buffer.tostring(var22)
			elseif var7 == 5 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.event_end = buffer.tostring(var24)
			elseif var7 == 8 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.description = buffer.tostring(var26)
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.place_id = buffer.tostring(var28)
			else
				local _ = nil
				local var30, var31 = protoModule.readVarInt(p1, var2)
				var2 = var31 + var30
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var32, var33 = protoModule.readFixed32(p1, var2)
			local _ = var32
			var2 = var33
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var34, var35 = protoModule.readFixed64(p1, var2)
			local _ = var34
			var2 = var35
		else
			error("Unsupported wire type: " .. var29)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var1 = t_1.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.event_start ~= nil then
		var1.event_start = self.event_start
	end
	if self.eventStart ~= nil then
		var1.event_start = self.eventStart
	end
	if self.event_end ~= nil then
		var1.event_end = self.event_end
	end
	if self.eventEnd ~= nil then
		var1.event_end = self.eventEnd
	end
	if self.user_rsvp ~= nil then
		var1.user_rsvp = self.user_rsvp
	end
	if self.userRsvp ~= nil then
		var1.user_rsvp = self.userRsvp
	end
	if self.media_asset_id ~= nil then
		var1.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1.media_asset_id = self.mediaAssetId
	end
	if self.description ~= nil then
		var1.description = self.description
	end
	if self.rsvp_count ~= nil then
		var1.rsvp_count = self.rsvp_count
	end
	if self.rsvpCount ~= nil then
		var1.rsvp_count = self.rsvpCount
	end
	if self.place_id ~= nil then
		var1.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1.place_id = self.placeId
	end
	return var1
end

t_1.descriptor = {
	name = "EventData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventData"
}
t.EventData = t_1
typeRegistryModule.default:register(t.EventData)

return { EventData = t.EventData }