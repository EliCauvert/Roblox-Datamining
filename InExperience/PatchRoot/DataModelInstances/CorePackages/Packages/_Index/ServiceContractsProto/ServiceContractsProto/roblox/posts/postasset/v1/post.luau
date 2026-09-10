local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local durationModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.duration)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata,
		tracks = if p1 == nil or p1.tracks == nil then {} else p1.tracks
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.metadata ~= nil then
		local var2 = self.metadata:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var26 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.tracks ~= nil and #self.tracks > 0 then
		for i, v in self.tracks do
			local var5 = v:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var29 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var8 = t_1.new()
	local var9 = 0
	while var9 < buffer.len(p1) do
		local _ = nil
		local var10 = nil
		local var11, var12, var13 = protoModule.readTag(p1, var9)
		local var14 = var11
		var10 = var12
		var9 = var13
		
		if var10 == protoModule.wireTypes.varint then
			local _ = nil
			local var15, var16 = protoModule.readVarInt(p1, var9)
			local _ = var15
			var9 = var16
			continue
		end
		if var10 == protoModule.wireTypes.lengthDelimited then
			if var14 == 1 then
				local _ = nil
				local var17, var18 = protoModule.readBuffer(p1, var9)
				var9 = var18
				var8.metadata = t.PostMetadata.decode(var17)
			elseif var14 == 2 then
				local _ = nil
				local var19, var20 = protoModule.readBuffer(p1, var9)
				var9 = var20
				table.insert(var8.tracks, t.Track.decode(var19))
			else
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var9)
				var9 = var22 + var21
			end
		elseif var10 == protoModule.wireTypes.i32 then
			local _ = nil
			local var23, var24 = protoModule.readFixed32(p1, var9)
			local _ = var23
			var9 = var24
		elseif var10 == protoModule.wireTypes.i64 then
			local _ = nil
			local var25, var26 = protoModule.readFixed64(p1, var9)
			local _ = var25
			var9 = var26
		else
			error("Unsupported wire type: " .. var33)
		end
	end
	return var8
end

function t_1:jsonEncode()
	local t = {}
	
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	if self.tracks ~= nil and #self.tracks > 0 then
		local t_1 = {}
		
		for i, v in self.tracks do
			table.insert(t_1, v:jsonEncode())
		end
		t.tracks = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var27 = t_1.new()
	
	if self.metadata ~= nil then
		var27.metadata = t.PostMetadata.jsonDecode(self.metadata)
	end
	if self.tracks ~= nil then
		local t_2 = {}
		
		for i, v in self.tracks do
			table.insert(t_2, t.Track.jsonDecode(v))
		end
		var27.tracks = t_2
	end
	return var27
end

t_1.descriptor = {
	name = "Post",
	fullName = "roblox.posts.postasset.v1.Post"
}
t.Post = t_1
typeRegistryModule.default:register(t.Post)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t (ref), t_2 (ref)
	return setmetatable({
		origin = if p2 == nil or p2.origin == nil then assert(t.PostOrigin.fromNumber(0), "Enum has no 0 default") else p2.origin,
		caption = if p2 == nil or p2.caption == nil then "" else p2.caption,
		total_duration = if p2 == nil or p2.total_duration == nil then nil else p2.total_duration,
		content_language = if p2 == nil or p2.content_language == nil then "" else p2.content_language
	}, t_2)
end

function t_2:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var28 = 0
	
	if self.origin ~= nil and (self.origin ~= nil and self.origin ~= 0 or self.origin ~= t.PostOrigin.fromNumber(0)) then
		local var29, var30 = protoModule.writeTag(buff, var28, 1, protoModule.wireTypes.varint)
		var29, var57 = protoModule.writeVarInt(var29, var30, t.PostOrigin.toNumber(self.origin))
		buff = var29
		var28 = var30
	end
	if self.caption ~= nil and self.caption ~= "" then
		local var31, var32 = protoModule.writeTag(buff, var28, 2, protoModule.wireTypes.lengthDelimited)
		var31, var59 = protoModule.writeString(var31, var32, self.caption)
		buff = var31
		var28 = var32
	end
	if self.total_duration ~= nil then
		local var33 = self.total_duration:encode()
		local var34, var35 = protoModule.writeTag(buff, var28, 3, protoModule.wireTypes.lengthDelimited)
		var34, var62 = protoModule.writeBuffer(var34, var35, var33, buffer.len(var33))
		buff = var34
		var28 = var35
	end
	if self.content_language ~= nil and self.content_language ~= "" then
		local var36, var37 = protoModule.writeTag(buff, var28, 4, protoModule.wireTypes.lengthDelimited)
		var36, var64 = protoModule.writeString(var36, var37, self.content_language)
		buff = var36
		var28 = var37
	end
	local buff_1 = buffer.create(var28)
	buffer.copy(buff_1, 0, buff, 0, var28)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), durationModule (ref)
	local var28 = t_2.new()
	local var29 = 0
	while var29 < buffer.len(p2) do
		local _ = nil
		local var30 = nil
		local var31, var32, var33 = protoModule.readTag(p2, var29)
		local var34 = var31
		var30 = var32
		var29 = var33
		
		if var30 == protoModule.wireTypes.varint then
			if var34 == 1 then
				local _ = nil
				local var35, var36 = protoModule.readVarIntI32(p2, var29)
				local var37 = var35
				var29 = var36
				var28.origin = t.PostOrigin.fromNumber(var37) or var37
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p2, var29)
				local _ = var38
				var29 = var39
			end
		end
		if var30 == protoModule.wireTypes.lengthDelimited then
			if var34 == 2 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p2, var29)
				var29 = var41
				var28.caption = buffer.tostring(var40)
			elseif var34 == 3 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p2, var29)
				var29 = var43
				var28.total_duration = durationModule.Duration.decode(var42)
			elseif var34 == 4 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p2, var29)
				var29 = var45
				var28.content_language = buffer.tostring(var44)
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p2, var29)
				var29 = var47 + var46
			end
		elseif var30 == protoModule.wireTypes.i32 then
			local _ = nil
			local var48, var49 = protoModule.readFixed32(p2, var29)
			local _ = var48
			var29 = var49
		elseif var30 == protoModule.wireTypes.i64 then
			local _ = nil
			local var50, var51 = protoModule.readFixed64(p2, var29)
			local _ = var50
			var29 = var51
		else
			error("Unsupported wire type: " .. var68)
		end
	end
	return var28
end

function t_2:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.origin ~= nil and (self.origin ~= nil and self.origin ~= 0 or self.origin ~= t.PostOrigin.fromNumber(0)) then
		t_1.origin = if typeof(self.origin) == "number" then self.origin else t.PostOrigin.toNumber(self.origin)
	end
	if self.caption ~= nil and self.caption ~= "" then
		t_1.caption = self.caption
	end
	if self.total_duration ~= nil then
		t_1.totalDuration = self.total_duration:jsonEncode()
	end
	if self.content_language ~= nil and self.content_language ~= "" then
		t_1.contentLanguage = self.content_language
	end
	return t_1
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref), durationModule (ref)
	local var52 = t_2.new()
	
	if self.origin ~= nil then
		var52.origin = if typeof(self.origin) == "number" then t.PostOrigin.fromNumber(self.origin) or self.origin else t.PostOrigin.fromName(self.origin) or self.origin
	end
	if self.caption ~= nil then
		var52.caption = self.caption
	end
	if self.total_duration ~= nil then
		var52.total_duration = durationModule.Duration.jsonDecode(self.total_duration)
	end
	if self.totalDuration ~= nil then
		var52.total_duration = durationModule.Duration.jsonDecode(self.totalDuration)
	end
	if self.content_language ~= nil then
		var52.content_language = self.content_language
	end
	if self.contentLanguage ~= nil then
		var52.content_language = self.contentLanguage
	end
	return var52
end

t_2.descriptor = {
	name = "PostMetadata",
	fullName = "roblox.posts.postasset.v1.PostMetadata"
}
t.PostMetadata = t_2
typeRegistryModule.default:register(t.PostMetadata)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t (ref), t_3 (ref)
	return setmetatable({
		type = if p3 == nil or p3.type == nil then assert(t.TrackType.fromNumber(0), "Enum has no 0 default") else p3.type,
		slots = if p3 == nil or p3.slots == nil then {} else p3.slots
	}, t_3)
end

function t_3:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var52 = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.TrackType.fromNumber(0)) then
		local var53, var54 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.varint)
		var53, var95 = protoModule.writeVarInt(var53, var54, t.TrackType.toNumber(self.type))
		buff = var53
		var52 = var54
	end
	if self.slots ~= nil and #self.slots > 0 then
		for i, v in self.slots do
			local var55 = v:encode()
			local var56, var57 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.lengthDelimited)
			var56, var98 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
			buff = var56
			var52 = var57
		end
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var58 = t_3.new()
	local var59 = 0
	while var59 < buffer.len(p3) do
		local _ = nil
		local var60 = nil
		local var61, var62, var63 = protoModule.readTag(p3, var59)
		local var64 = var61
		var60 = var62
		var59 = var63
		
		if var60 == protoModule.wireTypes.varint then
			if var64 == 1 then
				local _ = nil
				local var65, var66 = protoModule.readVarIntI32(p3, var59)
				local var67 = var65
				var59 = var66
				var58.type = t.TrackType.fromNumber(var67) or var67
			else
				local _ = nil
				local var68, var69 = protoModule.readVarInt(p3, var59)
				local _ = var68
				var59 = var69
			end
		end
		if var60 == protoModule.wireTypes.lengthDelimited then
			if var64 == 2 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var59)
				var59 = var71
				table.insert(var58.slots, t.Slot.decode(var70))
			else
				local _ = nil
				local var72, var73 = protoModule.readVarInt(p3, var59)
				var59 = var73 + var72
			end
		elseif var60 == protoModule.wireTypes.i32 then
			local _ = nil
			local var74, var75 = protoModule.readFixed32(p3, var59)
			local _ = var74
			var59 = var75
		elseif var60 == protoModule.wireTypes.i64 then
			local _ = nil
			local var76, var77 = protoModule.readFixed64(p3, var59)
			local _ = var76
			var59 = var77
		else
			error("Unsupported wire type: " .. var102)
		end
	end
	return var58
end

function t_3:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.TrackType.fromNumber(0)) then
		t_1.type = if typeof(self.type) == "number" then self.type else t.TrackType.toNumber(self.type)
	end
	if self.slots ~= nil and #self.slots > 0 then
		local t_2 = {}
		
		for i, v in self.slots do
			table.insert(t_2, v:jsonEncode())
		end
		t_1.slots = t_2
	end
	return t_1
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var78 = t_3.new()
	
	if self.type ~= nil then
		var78.type = if typeof(self.type) == "number" then t.TrackType.fromNumber(self.type) or self.type else t.TrackType.fromName(self.type) or self.type
	end
	if self.slots ~= nil then
		local t_1 = {}
		
		for i, v in self.slots do
			table.insert(t_1, t.Slot.jsonDecode(v))
		end
		var78.slots = t_1
	end
	return var78
end

t_3.descriptor = {
	name = "Track",
	fullName = "roblox.posts.postasset.v1.Track"
}
t.Track = t_3
typeRegistryModule.default:register(t.Track)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		slot_id = if p4 == nil or p4.slot_id == nil then "" else p4.slot_id,
		time_range = if p4 == nil or p4.time_range == nil then nil else p4.time_range,
		content = if p4 == nil or p4.content == nil then nil else p4.content
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var79 = 0
	
	if self.slot_id ~= nil and self.slot_id ~= "" then
		local var80, var81 = protoModule.writeTag(buff, var79, 1, protoModule.wireTypes.lengthDelimited)
		var80, var127 = protoModule.writeString(var80, var81, self.slot_id)
		buff = var80
		var79 = var81
	end
	if self.time_range ~= nil then
		local var82 = self.time_range:encode()
		local var83, var84 = protoModule.writeTag(buff, var79, 2, protoModule.wireTypes.lengthDelimited)
		var83, var130 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
		buff = var83
		var79 = var84
	end
	if self.content ~= nil then
		if self.content.type == "visual" then
			local var85 = self.content.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var79, 10, protoModule.wireTypes.lengthDelimited)
			var86, var133 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var79 = var87
		elseif self.content.type == "audio" then
			local var88 = self.content.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var79, 11, protoModule.wireTypes.lengthDelimited)
			var89, var136 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var79 = var90
		elseif self.content.type == "experience_annotation" then
			local var91 = self.content.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var79, 12, protoModule.wireTypes.lengthDelimited)
			var92, var139 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var79 = var93
		elseif self.content.type == "avatar_annotation" then
			local var94 = self.content.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var79, 13, protoModule.wireTypes.lengthDelimited)
			var95, var142 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var79 = var96
		end
	end
	local buff_1 = buffer.create(var79)
	buffer.copy(buff_1, 0, buff, 0, var79)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var79 = t_4.new()
	local var80 = 0
	while var80 < buffer.len(p4) do
		local _ = nil
		local var81 = nil
		local var82, var83, var84 = protoModule.readTag(p4, var80)
		local var85 = var82
		var81 = var83
		var80 = var84
		
		if var81 == protoModule.wireTypes.varint then
			local _ = nil
			local var86, var87 = protoModule.readVarInt(p4, var80)
			local _ = var86
			var80 = var87
			continue
		end
		if var81 == protoModule.wireTypes.lengthDelimited then
			if var85 == 1 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p4, var80)
				var80 = var89
				var79.slot_id = buffer.tostring(var88)
			elseif var85 == 2 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p4, var80)
				var80 = var91
				var79.time_range = t.TimeRange.decode(var90)
			elseif var85 == 10 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p4, var80)
				var80 = var93
				var79.content = { type = "visual", value = t.VisualSlot.decode(var92) }
			elseif var85 == 11 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p4, var80)
				var80 = var95
				var79.content = { type = "audio", value = t.AudioSlot.decode(var94) }
			elseif var85 == 12 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p4, var80)
				var80 = var97
				var79.content = {
					type = "experience_annotation",
					value = t.ExperienceAnnotationSlot.decode(var96)
				}
			elseif var85 == 13 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p4, var80)
				var80 = var99
				var79.content = {
					type = "avatar_annotation",
					value = t.AvatarAnnotationSlot.decode(var98)
				}
			else
				local _ = nil
				local var100, var101 = protoModule.readVarInt(p4, var80)
				var80 = var101 + var100
			end
		elseif var81 == protoModule.wireTypes.i32 then
			local _ = nil
			local var102, var103 = protoModule.readFixed32(p4, var80)
			local _ = var102
			var80 = var103
		elseif var81 == protoModule.wireTypes.i64 then
			local _ = nil
			local var104, var105 = protoModule.readFixed64(p4, var80)
			local _ = var104
			var80 = var105
		else
			error("Unsupported wire type: " .. var146)
		end
	end
	return var79
end

function t_4:jsonEncode()
	local t = {}
	
	if self.slot_id ~= nil and self.slot_id ~= "" then
		t.slotId = self.slot_id
	end
	if self.time_range ~= nil then
		t.timeRange = self.time_range:jsonEncode()
	end
	if self.content ~= nil then
		if self.content.type == "visual" then
			t.visual = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "audio" then
			t.audio = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "experience_annotation" then
			t.experienceAnnotation = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "avatar_annotation" then
			t.avatarAnnotation = self.content.value:jsonEncode()
		end
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var106 = t_4.new()
	
	if self.slot_id ~= nil then
		var106.slot_id = self.slot_id
	end
	if self.slotId ~= nil then
		var106.slot_id = self.slotId
	end
	if self.time_range ~= nil then
		var106.time_range = t.TimeRange.jsonDecode(self.time_range)
	end
	if self.timeRange ~= nil then
		var106.time_range = t.TimeRange.jsonDecode(self.timeRange)
	end
	if self.visual ~= nil then
		var106.content = {
			type = "visual",
			value = t.VisualSlot.jsonDecode(self.visual)
		}
	end
	if self.audio ~= nil then
		var106.content = {
			type = "audio",
			value = t.AudioSlot.jsonDecode(self.audio)
		}
	end
	if self.experience_annotation ~= nil then
		var106.content = {
			type = "experience_annotation",
			value = t.ExperienceAnnotationSlot.jsonDecode(self.experience_annotation)
		}
	end
	if self.experienceAnnotation ~= nil then
		var106.content = {
			type = "experience_annotation",
			value = t.ExperienceAnnotationSlot.jsonDecode(self.experienceAnnotation)
		}
	end
	if self.avatar_annotation ~= nil then
		var106.content = {
			type = "avatar_annotation",
			value = t.AvatarAnnotationSlot.jsonDecode(self.avatar_annotation)
		}
	end
	if self.avatarAnnotation ~= nil then
		var106.content = {
			type = "avatar_annotation",
			value = t.AvatarAnnotationSlot.jsonDecode(self.avatarAnnotation)
		}
	end
	return var106
end

t_4.descriptor = {
	name = "Slot",
	fullName = "roblox.posts.postasset.v1.Slot"
}
t.Slot = t_4
typeRegistryModule.default:register(t.Slot)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		z_index = if p5 == nil or p5.z_index == nil then 0 else p5.z_index,
		transform = if p5 == nil or p5.transform == nil then nil else p5.transform,
		content = if p5 == nil or p5.content == nil then nil else p5.content
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var106 = 0
	
	if self.z_index ~= nil and self.z_index ~= 0 then
		local var107, var108 = protoModule.writeTag(buff, var106, 1, protoModule.wireTypes.varint)
		var107, var176 = protoModule.writeVarInt(var107, var108, self.z_index)
		buff = var107
		var106 = var108
	end
	if self.transform ~= nil then
		local var109 = self.transform:encode()
		local var110, var111 = protoModule.writeTag(buff, var106, 2, protoModule.wireTypes.lengthDelimited)
		var110, var179 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
		buff = var110
		var106 = var111
	end
	if self.content ~= nil then
		if self.content.type == "video" then
			local var112 = self.content.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var106, 10, protoModule.wireTypes.lengthDelimited)
			var113, var182 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var106 = var114
		elseif self.content.type == "image" then
			local var115 = self.content.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var106, 11, protoModule.wireTypes.lengthDelimited)
			var116, var185 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var106 = var117
		elseif self.content.type == "text_label" then
			local var118 = self.content.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var106, 12, protoModule.wireTypes.lengthDelimited)
			var119, var188 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var106 = var120
		elseif self.content.type == "scene" then
			local var121 = self.content.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var106, 13, protoModule.wireTypes.lengthDelimited)
			var122, var191 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var106 = var123
		end
	end
	local buff_1 = buffer.create(var106)
	buffer.copy(buff_1, 0, buff, 0, var106)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var106 = t_5.new()
	local var107 = 0
	while var107 < buffer.len(p5) do
		local _ = nil
		local var108 = nil
		local var109, var110, var111 = protoModule.readTag(p5, var107)
		local var112 = var109
		var108 = var110
		var107 = var111
		
		if var108 == protoModule.wireTypes.varint then
			if var112 == 1 then
				local _ = nil
				local var113, var114 = protoModule.readVarIntI32(p5, var107)
				var107 = var114
				var106.z_index = var113
			else
				local _ = nil
				local var115, var116 = protoModule.readVarInt(p5, var107)
				local _ = var115
				var107 = var116
			end
		end
		if var108 == protoModule.wireTypes.lengthDelimited then
			if var112 == 2 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p5, var107)
				var107 = var118
				var106.transform = t.Transform.decode(var117)
			elseif var112 == 10 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p5, var107)
				var107 = var120
				var106.content = { type = "video", value = t.VideoSlot.decode(var119) }
			elseif var112 == 11 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p5, var107)
				var107 = var122
				var106.content = { type = "image", value = t.ImageSlot.decode(var121) }
			elseif var112 == 12 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var107)
				var107 = var124
				var106.content = {
					type = "text_label",
					value = t.TextLabelSlot.decode(var123)
				}
			elseif var112 == 13 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var107)
				var107 = var126
				var106.content = { type = "scene", value = t.SceneSlot.decode(var125) }
			else
				local _ = nil
				local var127, var128 = protoModule.readVarInt(p5, var107)
				var107 = var128 + var127
			end
		elseif var108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var129, var130 = protoModule.readFixed32(p5, var107)
			local _ = var129
			var107 = var130
		elseif var108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var131, var132 = protoModule.readFixed64(p5, var107)
			local _ = var131
			var107 = var132
		else
			error("Unsupported wire type: " .. var195)
		end
	end
	return var106
end

function t_5:jsonEncode()
	local t = {}
	
	if self.z_index ~= nil and self.z_index ~= 0 then
		t.zIndex = self.z_index
	end
	if self.transform ~= nil then
		t.transform = self.transform:jsonEncode()
	end
	if self.content ~= nil then
		if self.content.type == "video" then
			t.video = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "image" then
			t.image = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "text_label" then
			t.textLabel = self.content.value:jsonEncode()
			
			return t
		elseif self.content.type == "scene" then
			t.scene = self.content.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var133 = t_5.new()
	
	if self.z_index ~= nil then
		var133.z_index = self.z_index
	end
	if self.zIndex ~= nil then
		var133.z_index = self.zIndex
	end
	if self.transform ~= nil then
		var133.transform = t.Transform.jsonDecode(self.transform)
	end
	if self.video ~= nil then
		var133.content = {
			type = "video",
			value = t.VideoSlot.jsonDecode(self.video)
		}
	end
	if self.image ~= nil then
		var133.content = {
			type = "image",
			value = t.ImageSlot.jsonDecode(self.image)
		}
	end
	if self.text_label ~= nil then
		var133.content = {
			type = "text_label",
			value = t.TextLabelSlot.jsonDecode(self.text_label)
		}
	end
	if self.textLabel ~= nil then
		var133.content = {
			type = "text_label",
			value = t.TextLabelSlot.jsonDecode(self.textLabel)
		}
	end
	if self.scene ~= nil then
		var133.content = {
			type = "scene",
			value = t.SceneSlot.jsonDecode(self.scene)
		}
	end
	return var133
end

t_5.descriptor = {
	name = "VisualSlot",
	fullName = "roblox.posts.postasset.v1.VisualSlot"
}
t.VisualSlot = t_5
typeRegistryModule.default:register(t.VisualSlot)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		asset_id = if p6 == nil or p6.asset_id == nil then 0 else p6.asset_id,
		trim = if p6 == nil or p6.trim == nil then nil else p6.trim
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.varint)
		var134, var225 = protoModule.writeVarInt(var134, var135, self.asset_id)
		buff = var134
		var133 = var135
	end
	if self.trim ~= nil then
		local var136 = self.trim:encode()
		local var137, var138 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var137, var228 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
		buff = var137
		var133 = var138
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var133 = t_6.new()
	local var134 = 0
	while var134 < buffer.len(p6) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p6, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			if var139 == 1 then
				local _ = nil
				local var140, var141 = protoModule.readVarIntI64(p6, var134)
				var134 = var141
				var133.asset_id = var140
			else
				local _ = nil
				local var142, var143 = protoModule.readVarInt(p6, var134)
				local _ = var142
				var134 = var143
			end
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 2 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p6, var134)
				var134 = var145
				var133.trim = t.TimeRange.decode(var144)
			else
				local _ = nil
				local var146, var147 = protoModule.readVarInt(p6, var134)
				var134 = var147 + var146
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var148, var149 = protoModule.readFixed32(p6, var134)
			local _ = var148
			var134 = var149
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var150, var151 = protoModule.readFixed64(p6, var134)
			local _ = var150
			var134 = var151
		else
			error("Unsupported wire type: " .. var232)
		end
	end
	return var133
end

function t_6:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	if self.trim ~= nil then
		t.trim = self.trim:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var152 = t_6.new()
	
	if self.asset_id ~= nil then
		var152.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var152.asset_id = self.assetId
	end
	if self.trim ~= nil then
		var152.trim = t.TimeRange.jsonDecode(self.trim)
	end
	return var152
end

t_6.descriptor = {
	name = "VideoSlot",
	fullName = "roblox.posts.postasset.v1.VideoSlot"
}
t.VideoSlot = t_6
typeRegistryModule.default:register(t.VideoSlot)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		asset_id = if p7 == nil or p7.asset_id == nil then 0 else p7.asset_id
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var152 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local var153, var154 = protoModule.writeTag(buff, var152, 1, protoModule.wireTypes.varint)
		var153, var254 = protoModule.writeVarInt(var153, var154, self.asset_id)
		buff = var153
		var152 = var154
	end
	local buff_1 = buffer.create(var152)
	buffer.copy(buff_1, 0, buff, 0, var152)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var152 = t_7.new()
	local var153 = 0
	while var153 < buffer.len(p7) do
		local _ = nil
		local _ = nil
		local var154, var155, var156 = protoModule.readTag(p7, var153)
		local var157 = var154
		local var158 = var155
		var153 = var156
		
		if var158 == protoModule.wireTypes.varint then
			if var157 == 1 then
				local _ = nil
				local var159, var160 = protoModule.readVarIntI64(p7, var153)
				var153 = var160
				var152.asset_id = var159
			else
				local _ = nil
				local var161, var162 = protoModule.readVarInt(p7, var153)
				local _ = var161
				var153 = var162
			end
		elseif var158 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var163, var164 = protoModule.readVarInt(p7, var153)
			var153 = var164 + var163
		elseif var158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var165, var166 = protoModule.readFixed32(p7, var153)
			local _ = var165
			var153 = var166
		elseif var158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var167, var168 = protoModule.readFixed64(p7, var153)
			local _ = var167
			var153 = var168
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var152
end

function t_7:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var169 = t_7.new()
	
	if self.asset_id ~= nil then
		var169.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var169.asset_id = self.assetId
	end
	return var169
end

t_7.descriptor = {
	name = "ImageSlot",
	fullName = "roblox.posts.postasset.v1.ImageSlot"
}
t.ImageSlot = t_7
typeRegistryModule.default:register(t.ImageSlot)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t (ref), t_8 (ref)
	return setmetatable({
		text = if p8 == nil or p8.text == nil then "" else p8.text,
		font = if p8 == nil or p8.font == nil then nil else p8.font,
		text_x_alignment = if p8 == nil or p8.text_x_alignment == nil then assert(t.TextXAlignment.fromNumber(0), "Enum has no 0 default") else p8.text_x_alignment,
		font_color = if p8 == nil or p8.font_color == nil then nil else p8.font_color,
		font_size = if p8 == nil or p8.font_size == nil then 0 else p8.font_size
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var169 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var170, var171 = protoModule.writeTag(buff, var169, 1, protoModule.wireTypes.lengthDelimited)
		var170, var278 = protoModule.writeString(var170, var171, self.text)
		buff = var170
		var169 = var171
	end
	if self.font ~= nil then
		local var172 = self.font:encode()
		local var173, var174 = protoModule.writeTag(buff, var169, 2, protoModule.wireTypes.lengthDelimited)
		var173, var281 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
		buff = var173
		var169 = var174
	end
	if self.text_x_alignment ~= nil and (self.text_x_alignment ~= nil and self.text_x_alignment ~= 0 or self.text_x_alignment ~= t.TextXAlignment.fromNumber(0)) then
		local var175, var176 = protoModule.writeTag(buff, var169, 3, protoModule.wireTypes.varint)
		var175, var283 = protoModule.writeVarInt(var175, var176, t.TextXAlignment.toNumber(self.text_x_alignment))
		buff = var175
		var169 = var176
	end
	if self.font_color ~= nil then
		local var177 = self.font_color:encode()
		local var178, var179 = protoModule.writeTag(buff, var169, 4, protoModule.wireTypes.lengthDelimited)
		var178, var286 = protoModule.writeBuffer(var178, var179, var177, buffer.len(var177))
		buff = var178
		var169 = var179
	end
	if self.font_size ~= nil and self.font_size ~= 0 then
		local var180, var181 = protoModule.writeTag(buff, var169, 5, protoModule.wireTypes.i32)
		var180, var288 = protoModule.writeFloat(var180, var181, self.font_size)
		buff = var180
		var169 = var181
	end
	local buff_1 = buffer.create(var169)
	buffer.copy(buff_1, 0, buff, 0, var169)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var169 = t_8.new()
	local var170 = 0
	while var170 < buffer.len(p8) do
		local _ = nil
		local var171 = nil
		local var172, var173, var174 = protoModule.readTag(p8, var170)
		local var175 = var172
		var171 = var173
		var170 = var174
		
		if var171 == protoModule.wireTypes.varint then
			if var175 == 3 then
				local _ = nil
				local var176, var177 = protoModule.readVarIntI32(p8, var170)
				local var178 = var176
				var170 = var177
				var169.text_x_alignment = t.TextXAlignment.fromNumber(var178) or var178
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p8, var170)
				local _ = var179
				var170 = var180
			end
		end
		if var171 == protoModule.wireTypes.lengthDelimited then
			if var175 == 1 then
				local _ = nil
				local var181, var182 = protoModule.readBuffer(p8, var170)
				var170 = var182
				var169.text = buffer.tostring(var181)
			elseif var175 == 2 then
				local _ = nil
				local var183, var184 = protoModule.readBuffer(p8, var170)
				var170 = var184
				var169.font = t.FontInfo.decode(var183)
			elseif var175 == 4 then
				local _ = nil
				local var185, var186 = protoModule.readBuffer(p8, var170)
				var170 = var186
				var169.font_color = t.Color3.decode(var185)
			else
				local _ = nil
				local var187, var188 = protoModule.readVarInt(p8, var170)
				var170 = var188 + var187
			end
		elseif var171 == protoModule.wireTypes.i32 then
			if var175 == 5 then
				local _ = nil
				local var189, var190 = protoModule.readFloat(p8, var170)
				var170 = var190
				var169.font_size = var189
			else
				local _ = nil
				local var191, var192 = protoModule.readFixed32(p8, var170)
				local _ = var191
				var170 = var192
			end
		elseif var171 == protoModule.wireTypes.i64 then
			local _ = nil
			local var193, var194 = protoModule.readFixed64(p8, var170)
			local _ = var193
			var170 = var194
		else
			error("Unsupported wire type: " .. var292)
		end
	end
	return var169
end

function t_8:jsonEncode()
	-- upvalues: t (ref), protoModule (ref)
	local t_1 = {}
	
	if self.text ~= nil and self.text ~= "" then
		t_1.text = self.text
	end
	if self.font ~= nil then
		t_1.font = self.font:jsonEncode()
	end
	if self.text_x_alignment ~= nil and (self.text_x_alignment ~= nil and self.text_x_alignment ~= 0 or self.text_x_alignment ~= t.TextXAlignment.fromNumber(0)) then
		t_1.textXAlignment = if typeof(self.text_x_alignment) == "number" then self.text_x_alignment else t.TextXAlignment.toNumber(self.text_x_alignment)
	end
	if self.font_color ~= nil then
		t_1.fontColor = self.font_color:jsonEncode()
	end
	if self.font_size ~= nil and self.font_size ~= 0 then
		t_1.fontSize = protoModule.json.serializeNumber(self.font_size)
	end
	return t_1
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref), protoModule (ref)
	local var195 = t_8.new()
	
	if self.text ~= nil then
		var195.text = self.text
	end
	if self.font ~= nil then
		var195.font = t.FontInfo.jsonDecode(self.font)
	end
	if self.text_x_alignment ~= nil then
		var195.text_x_alignment = if typeof(self.text_x_alignment) == "number" then t.TextXAlignment.fromNumber(self.text_x_alignment) or self.text_x_alignment else t.TextXAlignment.fromName(self.text_x_alignment) or self.text_x_alignment
	end
	if self.textXAlignment ~= nil then
		var195.text_x_alignment = if typeof(self.textXAlignment) == "number" then t.TextXAlignment.fromNumber(self.textXAlignment) or self.textXAlignment else t.TextXAlignment.fromName(self.textXAlignment) or self.textXAlignment
	end
	if self.font_color ~= nil then
		var195.font_color = t.Color3.jsonDecode(self.font_color)
	end
	if self.fontColor ~= nil then
		var195.font_color = t.Color3.jsonDecode(self.fontColor)
	end
	if self.font_size ~= nil then
		var195.font_size = protoModule.json.deserializeNumber(self.font_size)
	end
	if self.fontSize ~= nil then
		var195.font_size = protoModule.json.deserializeNumber(self.fontSize)
	end
	return var195
end

t_8.descriptor = {
	name = "TextLabelSlot",
	fullName = "roblox.posts.postasset.v1.TextLabelSlot"
}
t.TextLabelSlot = t_8
typeRegistryModule.default:register(t.TextLabelSlot)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		asset_id = if p9 == nil or p9.asset_id == nil then 0 else p9.asset_id
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var195 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local var196, var197 = protoModule.writeTag(buff, var195, 1, protoModule.wireTypes.varint)
		var196, var321 = protoModule.writeVarInt(var196, var197, self.asset_id)
		buff = var196
		var195 = var197
	end
	local buff_1 = buffer.create(var195)
	buffer.copy(buff_1, 0, buff, 0, var195)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var195 = t_9.new()
	local var196 = 0
	while var196 < buffer.len(p9) do
		local _ = nil
		local _ = nil
		local var197, var198, var199 = protoModule.readTag(p9, var196)
		local var200 = var197
		local var201 = var198
		var196 = var199
		
		if var201 == protoModule.wireTypes.varint then
			if var200 == 1 then
				local _ = nil
				local var202, var203 = protoModule.readVarIntI64(p9, var196)
				var196 = var203
				var195.asset_id = var202
			else
				local _ = nil
				local var204, var205 = protoModule.readVarInt(p9, var196)
				local _ = var204
				var196 = var205
			end
		elseif var201 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var206, var207 = protoModule.readVarInt(p9, var196)
			var196 = var207 + var206
		elseif var201 == protoModule.wireTypes.i32 then
			local _ = nil
			local var208, var209 = protoModule.readFixed32(p9, var196)
			local _ = var208
			var196 = var209
		elseif var201 == protoModule.wireTypes.i64 then
			local _ = nil
			local var210, var211 = protoModule.readFixed64(p9, var196)
			local _ = var210
			var196 = var211
		else
			error("Unsupported wire type: " .. var329)
		end
	end
	return var195
end

function t_9:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref)
	local var212 = t_9.new()
	
	if self.asset_id ~= nil then
		var212.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var212.asset_id = self.assetId
	end
	return var212
end

t_9.descriptor = {
	name = "SceneSlot",
	fullName = "roblox.posts.postasset.v1.SceneSlot"
}
t.SceneSlot = t_9
typeRegistryModule.default:register(t.SceneSlot)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t (ref), t_10 (ref)
	return setmetatable({
		asset_id = if p10 == nil or p10.asset_id == nil then 0 else p10.asset_id,
		trim = if p10 == nil or p10.trim == nil then nil else p10.trim,
		audio_type = if p10 == nil or p10.audio_type == nil then assert(t.AudioType.fromNumber(0), "Enum has no 0 default") else p10.audio_type,
		context = if p10 == nil or p10.context == nil then nil else p10.context
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var212 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local var213, var214 = protoModule.writeTag(buff, var212, 1, protoModule.wireTypes.varint)
		var213, var345 = protoModule.writeVarInt(var213, var214, self.asset_id)
		buff = var213
		var212 = var214
	end
	if self.trim ~= nil then
		local var215 = self.trim:encode()
		local var216, var217 = protoModule.writeTag(buff, var212, 2, protoModule.wireTypes.lengthDelimited)
		var216, var348 = protoModule.writeBuffer(var216, var217, var215, buffer.len(var215))
		buff = var216
		var212 = var217
	end
	if self.audio_type ~= nil and (self.audio_type ~= nil and self.audio_type ~= 0 or self.audio_type ~= t.AudioType.fromNumber(0)) then
		local var218, var219 = protoModule.writeTag(buff, var212, 3, protoModule.wireTypes.varint)
		var218, var350 = protoModule.writeVarInt(var218, var219, t.AudioType.toNumber(self.audio_type))
		buff = var218
		var212 = var219
	end
	if self.context ~= nil and self.context.type == "tts" then
		local var220 = self.context.value:encode()
		local var221, var222 = protoModule.writeTag(buff, var212, 10, protoModule.wireTypes.lengthDelimited)
		var221, var353 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
		buff = var221
		var212 = var222
	end
	local buff_1 = buffer.create(var212)
	buffer.copy(buff_1, 0, buff, 0, var212)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var212 = t_10.new()
	local var213 = 0
	while var213 < buffer.len(p10) do
		local _ = nil
		local var214 = nil
		local var215, var216, var217 = protoModule.readTag(p10, var213)
		local var218 = var215
		var214 = var216
		var213 = var217
		
		if var214 == protoModule.wireTypes.varint then
			if var218 == 1 then
				local _ = nil
				local var219, var220 = protoModule.readVarIntI64(p10, var213)
				var213 = var220
				var212.asset_id = var219
			elseif var218 == 3 then
				local _ = nil
				local var221, var222 = protoModule.readVarIntI32(p10, var213)
				local var223 = var221
				var213 = var222
				var212.audio_type = t.AudioType.fromNumber(var223) or var223
			else
				local _ = nil
				local var224, var225 = protoModule.readVarInt(p10, var213)
				local _ = var224
				var213 = var225
			end
		end
		if var214 == protoModule.wireTypes.lengthDelimited then
			if var218 == 2 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p10, var213)
				var213 = var227
				var212.trim = t.TimeRange.decode(var226)
			elseif var218 == 10 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p10, var213)
				var213 = var229
				var212.context = { type = "tts", value = t.TtsAudioContext.decode(var228) }
			else
				local _ = nil
				local var230, var231 = protoModule.readVarInt(p10, var213)
				var213 = var231 + var230
			end
		elseif var214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var232, var233 = protoModule.readFixed32(p10, var213)
			local _ = var232
			var213 = var233
		elseif var214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var234, var235 = protoModule.readFixed64(p10, var213)
			local _ = var234
			var213 = var235
		else
			error("Unsupported wire type: " .. var357)
		end
	end
	return var212
end

function t_10:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t_1.assetId = self.asset_id
	end
	if self.trim ~= nil then
		t_1.trim = self.trim:jsonEncode()
	end
	if self.audio_type ~= nil and (self.audio_type ~= nil and self.audio_type ~= 0 or self.audio_type ~= t.AudioType.fromNumber(0)) then
		t_1.audioType = if typeof(self.audio_type) == "number" then self.audio_type else t.AudioType.toNumber(self.audio_type)
	end
	if self.context ~= nil and self.context.type == "tts" then
		t_1.tts = self.context.value:jsonEncode()
	end
	return t_1
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), t (ref)
	local var236 = t_10.new()
	
	if self.asset_id ~= nil then
		var236.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var236.asset_id = self.assetId
	end
	if self.trim ~= nil then
		var236.trim = t.TimeRange.jsonDecode(self.trim)
	end
	if self.audio_type ~= nil then
		var236.audio_type = if typeof(self.audio_type) == "number" then t.AudioType.fromNumber(self.audio_type) or self.audio_type else t.AudioType.fromName(self.audio_type) or self.audio_type
	end
	if self.audioType ~= nil then
		var236.audio_type = if typeof(self.audioType) == "number" then t.AudioType.fromNumber(self.audioType) or self.audioType else t.AudioType.fromName(self.audioType) or self.audioType
	end
	if self.tts ~= nil then
		var236.context = {
			type = "tts",
			value = t.TtsAudioContext.jsonDecode(self.tts)
		}
	end
	return var236
end

t_10.descriptor = {
	name = "AudioSlot",
	fullName = "roblox.posts.postasset.v1.AudioSlot"
}
t.AudioSlot = t_10
typeRegistryModule.default:register(t.AudioSlot)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		text = if p11 == nil or p11.text == nil then "" else p11.text,
		voice_id = if p11 == nil or p11.voice_id == nil then 0 else p11.voice_id,
		pitch = if p11 == nil or p11.pitch == nil then 0 else p11.pitch,
		speed = if p11 == nil or p11.speed == nil then 0 else p11.speed
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var236 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var237, var238 = protoModule.writeTag(buff, var236, 1, protoModule.wireTypes.lengthDelimited)
		var237, var384 = protoModule.writeString(var237, var238, self.text)
		buff = var237
		var236 = var238
	end
	if self.voice_id ~= nil and self.voice_id ~= 0 then
		local var239, var240 = protoModule.writeTag(buff, var236, 2, protoModule.wireTypes.varint)
		var239, var386 = protoModule.writeVarInt(var239, var240, self.voice_id)
		buff = var239
		var236 = var240
	end
	if self.pitch ~= nil and self.pitch ~= 0 then
		local var241, var242 = protoModule.writeTag(buff, var236, 3, protoModule.wireTypes.i64)
		var241, var388 = protoModule.writeDouble(var241, var242, self.pitch)
		buff = var241
		var236 = var242
	end
	if self.speed ~= nil and self.speed ~= 0 then
		local var243, var244 = protoModule.writeTag(buff, var236, 4, protoModule.wireTypes.i64)
		var243, var390 = protoModule.writeDouble(var243, var244, self.speed)
		buff = var243
		var236 = var244
	end
	local buff_1 = buffer.create(var236)
	buffer.copy(buff_1, 0, buff, 0, var236)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var236 = t_11.new()
	local var237 = 0
	while var237 < buffer.len(p11) do
		local _ = nil
		local var238 = nil
		local var239, var240, var241 = protoModule.readTag(p11, var237)
		local var242 = var239
		var238 = var240
		var237 = var241
		
		if var238 == protoModule.wireTypes.varint then
			if var242 == 2 then
				local _ = nil
				local var243, var244 = protoModule.readVarIntI64(p11, var237)
				var237 = var244
				var236.voice_id = var243
			else
				local _ = nil
				local var245, var246 = protoModule.readVarInt(p11, var237)
				local _ = var245
				var237 = var246
			end
		end
		if var238 == protoModule.wireTypes.lengthDelimited then
			if var242 == 1 then
				local _ = nil
				local var247, var248 = protoModule.readBuffer(p11, var237)
				var237 = var248
				var236.text = buffer.tostring(var247)
			else
				local _ = nil
				local var249, var250 = protoModule.readVarInt(p11, var237)
				var237 = var250 + var249
			end
		elseif var238 == protoModule.wireTypes.i32 then
			local _ = nil
			local var251, var252 = protoModule.readFixed32(p11, var237)
			local _ = var251
			var237 = var252
		elseif var238 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var394)
		elseif var242 == 3 then
			local _ = nil
			local var253, var254 = protoModule.readDouble(p11, var237)
			var237 = var254
			var236.pitch = var253
		elseif var242 == 4 then
			local _ = nil
			local var255, var256 = protoModule.readDouble(p11, var237)
			var237 = var256
			var236.speed = var255
		else
			local _ = nil
			local var257, var258 = protoModule.readFixed64(p11, var237)
			local _ = var257
			var237 = var258
		end
	end
	return var236
end

function t_11:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.voice_id ~= nil and self.voice_id ~= 0 then
		t.voiceId = self.voice_id
	end
	if self.pitch ~= nil and self.pitch ~= 0 then
		t.pitch = protoModule.json.serializeNumber(self.pitch)
	end
	if self.speed ~= nil and self.speed ~= 0 then
		t.speed = protoModule.json.serializeNumber(self.speed)
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), protoModule (ref)
	local var259 = t_11.new()
	
	if self.text ~= nil then
		var259.text = self.text
	end
	if self.voice_id ~= nil then
		var259.voice_id = self.voice_id
	end
	if self.voiceId ~= nil then
		var259.voice_id = self.voiceId
	end
	if self.pitch ~= nil then
		var259.pitch = protoModule.json.deserializeNumber(self.pitch)
	end
	if self.speed ~= nil then
		var259.speed = protoModule.json.deserializeNumber(self.speed)
	end
	return var259
end

t_11.descriptor = {
	name = "TtsAudioContext",
	fullName = "roblox.posts.postasset.v1.TtsAudioContext"
}
t.TtsAudioContext = t_11
typeRegistryModule.default:register(t.TtsAudioContext)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		universe_id = if p12 == nil or p12.universe_id == nil then 0 else p12.universe_id,
		place_id = if p12 == nil or p12.place_id == nil then 0 else p12.place_id
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var259 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local var260, var261 = protoModule.writeTag(buff, var259, 1, protoModule.wireTypes.varint)
		var260, var420 = protoModule.writeVarInt(var260, var261, self.universe_id)
		buff = var260
		var259 = var261
	end
	if self.place_id ~= nil and self.place_id ~= 0 then
		local var262, var263 = protoModule.writeTag(buff, var259, 2, protoModule.wireTypes.varint)
		var262, var422 = protoModule.writeVarInt(var262, var263, self.place_id)
		buff = var262
		var259 = var263
	end
	local buff_1 = buffer.create(var259)
	buffer.copy(buff_1, 0, buff, 0, var259)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var259 = t_12.new()
	local var260 = 0
	while var260 < buffer.len(p12) do
		local _ = nil
		local _ = nil
		local var261, var262, var263 = protoModule.readTag(p12, var260)
		local var264 = var261
		local var265 = var262
		var260 = var263
		
		if var265 == protoModule.wireTypes.varint then
			if var264 == 1 then
				local _ = nil
				local var266, var267 = protoModule.readVarIntI64(p12, var260)
				var260 = var267
				var259.universe_id = var266
			elseif var264 == 2 then
				local _ = nil
				local var268, var269 = protoModule.readVarIntI64(p12, var260)
				var260 = var269
				var259.place_id = var268
			else
				local _ = nil
				local var270, var271 = protoModule.readVarInt(p12, var260)
				local _ = var270
				var260 = var271
			end
		elseif var265 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var272, var273 = protoModule.readVarInt(p12, var260)
			var260 = var273 + var272
		elseif var265 == protoModule.wireTypes.i32 then
			local _ = nil
			local var274, var275 = protoModule.readFixed32(p12, var260)
			local _ = var274
			var260 = var275
		elseif var265 == protoModule.wireTypes.i64 then
			local _ = nil
			local var276, var277 = protoModule.readFixed64(p12, var260)
			local _ = var276
			var260 = var277
		else
			error("Unsupported wire type: " .. var430)
		end
	end
	return var259
end

function t_12:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= 0 then
		t.placeId = self.place_id
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref)
	local var278 = t_12.new()
	
	if self.universe_id ~= nil then
		var278.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var278.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var278.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var278.place_id = self.placeId
	end
	return var278
end

t_12.descriptor = {
	name = "ExperienceAnnotationSlot",
	fullName = "roblox.posts.postasset.v1.ExperienceAnnotationSlot"
}
t.ExperienceAnnotationSlot = t_12
typeRegistryModule.default:register(t.ExperienceAnnotationSlot)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t_13 (ref)
	return setmetatable({
		outfit_id = if p13 == nil or p13.outfit_id == nil then 0 else p13.outfit_id
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var278 = 0
	
	if self.outfit_id ~= nil and self.outfit_id ~= 0 then
		local var279, var280 = protoModule.writeTag(buff, var278, 1, protoModule.wireTypes.varint)
		var279, var448 = protoModule.writeVarInt(var279, var280, self.outfit_id)
		buff = var279
		var278 = var280
	end
	local buff_1 = buffer.create(var278)
	buffer.copy(buff_1, 0, buff, 0, var278)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref)
	local var278 = t_13.new()
	local var279 = 0
	while var279 < buffer.len(p13) do
		local _ = nil
		local _ = nil
		local var280, var281, var282 = protoModule.readTag(p13, var279)
		local var283 = var280
		local var284 = var281
		var279 = var282
		
		if var284 == protoModule.wireTypes.varint then
			if var283 == 1 then
				local _ = nil
				local var285, var286 = protoModule.readVarIntI64(p13, var279)
				var279 = var286
				var278.outfit_id = var285
			else
				local _ = nil
				local var287, var288 = protoModule.readVarInt(p13, var279)
				local _ = var287
				var279 = var288
			end
		elseif var284 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var289, var290 = protoModule.readVarInt(p13, var279)
			var279 = var290 + var289
		elseif var284 == protoModule.wireTypes.i32 then
			local _ = nil
			local var291, var292 = protoModule.readFixed32(p13, var279)
			local _ = var291
			var279 = var292
		elseif var284 == protoModule.wireTypes.i64 then
			local _ = nil
			local var293, var294 = protoModule.readFixed64(p13, var279)
			local _ = var293
			var279 = var294
		else
			error("Unsupported wire type: " .. var456)
		end
	end
	return var278
end

function t_13:jsonEncode()
	local t = {}
	
	if self.outfit_id ~= nil and self.outfit_id ~= 0 then
		t.outfitId = self.outfit_id
	end
	return t
end

function t_13:jsonDecode()
	-- upvalues: t_13 (ref)
	local var295 = t_13.new()
	
	if self.outfit_id ~= nil then
		var295.outfit_id = self.outfit_id
	end
	if self.outfitId ~= nil then
		var295.outfit_id = self.outfitId
	end
	return var295
end

t_13.descriptor = {
	name = "AvatarAnnotationSlot",
	fullName = "roblox.posts.postasset.v1.AvatarAnnotationSlot"
}
t.AvatarAnnotationSlot = t_13
typeRegistryModule.default:register(t.AvatarAnnotationSlot)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		offset_duration = if p14 == nil or p14.offset_duration == nil then nil else p14.offset_duration,
		duration = if p14 == nil or p14.duration == nil then nil else p14.duration
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var295 = 0
	
	if self.offset_duration ~= nil then
		local var296 = self.offset_duration:encode()
		local var297, var298 = protoModule.writeTag(buff, var295, 1, protoModule.wireTypes.lengthDelimited)
		var297, var473 = protoModule.writeBuffer(var297, var298, var296, buffer.len(var296))
		buff = var297
		var295 = var298
	end
	if self.duration ~= nil then
		local var299 = self.duration:encode()
		local var300, var301 = protoModule.writeTag(buff, var295, 2, protoModule.wireTypes.lengthDelimited)
		var300, var476 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
		buff = var300
		var295 = var301
	end
	local buff_1 = buffer.create(var295)
	buffer.copy(buff_1, 0, buff, 0, var295)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), durationModule (ref)
	local var295 = t_14.new()
	local var296 = 0
	while var296 < buffer.len(p14) do
		local _ = nil
		local var297 = nil
		local var298, var299, var300 = protoModule.readTag(p14, var296)
		local var301 = var298
		var297 = var299
		var296 = var300
		
		if var297 == protoModule.wireTypes.varint then
			local _ = nil
			local var302, var303 = protoModule.readVarInt(p14, var296)
			local _ = var302
			var296 = var303
			continue
		end
		if var297 == protoModule.wireTypes.lengthDelimited then
			if var301 == 1 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p14, var296)
				var296 = var305
				var295.offset_duration = durationModule.Duration.decode(var304)
			elseif var301 == 2 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p14, var296)
				var296 = var307
				var295.duration = durationModule.Duration.decode(var306)
			else
				local _ = nil
				local var308, var309 = protoModule.readVarInt(p14, var296)
				var296 = var309 + var308
			end
		elseif var297 == protoModule.wireTypes.i32 then
			local _ = nil
			local var310, var311 = protoModule.readFixed32(p14, var296)
			local _ = var310
			var296 = var311
		elseif var297 == protoModule.wireTypes.i64 then
			local _ = nil
			local var312, var313 = protoModule.readFixed64(p14, var296)
			local _ = var312
			var296 = var313
		else
			error("Unsupported wire type: " .. var480)
		end
	end
	return var295
end

function t_14:jsonEncode()
	local t = {}
	
	if self.offset_duration ~= nil then
		t.offsetDuration = self.offset_duration:jsonEncode()
	end
	if self.duration ~= nil then
		t.duration = self.duration:jsonEncode()
	end
	return t
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), durationModule (ref)
	local var314 = t_14.new()
	
	if self.offset_duration ~= nil then
		var314.offset_duration = durationModule.Duration.jsonDecode(self.offset_duration)
	end
	if self.offsetDuration ~= nil then
		var314.offset_duration = durationModule.Duration.jsonDecode(self.offsetDuration)
	end
	if self.duration ~= nil then
		var314.duration = durationModule.Duration.jsonDecode(self.duration)
	end
	return var314
end

t_14.descriptor = {
	name = "TimeRange",
	fullName = "roblox.posts.postasset.v1.TimeRange"
}
t.TimeRange = t_14
typeRegistryModule.default:register(t.TimeRange)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t_15 (ref)
	return setmetatable({
		position = if p15 == nil or p15.position == nil then nil else p15.position,
		rotation = if p15 == nil or p15.rotation == nil then 0 else p15.rotation,
		scale = if p15 == nil or p15.scale == nil then 0 else p15.scale
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var314 = 0
	
	if self.position ~= nil then
		local var315 = self.position:encode()
		local var316, var317 = protoModule.writeTag(buff, var314, 1, protoModule.wireTypes.lengthDelimited)
		var316, var503 = protoModule.writeBuffer(var316, var317, var315, buffer.len(var315))
		buff = var316
		var314 = var317
	end
	if self.rotation ~= nil and self.rotation ~= 0 then
		local var318, var319 = protoModule.writeTag(buff, var314, 2, protoModule.wireTypes.i32)
		var318, var505 = protoModule.writeFloat(var318, var319, self.rotation)
		buff = var318
		var314 = var319
	end
	if self.scale ~= nil and self.scale ~= 0 then
		local var320, var321 = protoModule.writeTag(buff, var314, 3, protoModule.wireTypes.i32)
		var320, var507 = protoModule.writeFloat(var320, var321, self.scale)
		buff = var320
		var314 = var321
	end
	local buff_1 = buffer.create(var314)
	buffer.copy(buff_1, 0, buff, 0, var314)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var314 = t_15.new()
	local var315 = 0
	while var315 < buffer.len(p15) do
		local _ = nil
		local var316 = nil
		local var317, var318, var319 = protoModule.readTag(p15, var315)
		local var320 = var317
		var316 = var318
		var315 = var319
		
		if var316 == protoModule.wireTypes.varint then
			local _ = nil
			local var321, var322 = protoModule.readVarInt(p15, var315)
			local _ = var321
			var315 = var322
			continue
		end
		if var316 == protoModule.wireTypes.lengthDelimited then
			if var320 == 1 then
				local _ = nil
				local var323, var324 = protoModule.readBuffer(p15, var315)
				var315 = var324
				var314.position = t.Vec2.decode(var323)
			else
				local _ = nil
				local var325, var326 = protoModule.readVarInt(p15, var315)
				var315 = var326 + var325
			end
		elseif var316 == protoModule.wireTypes.i32 then
			if var320 == 2 then
				local _ = nil
				local var327, var328 = protoModule.readFloat(p15, var315)
				var315 = var328
				var314.rotation = var327
			elseif var320 == 3 then
				local _ = nil
				local var329, var330 = protoModule.readFloat(p15, var315)
				var315 = var330
				var314.scale = var329
			else
				local _ = nil
				local var331, var332 = protoModule.readFixed32(p15, var315)
				local _ = var331
				var315 = var332
			end
		elseif var316 == protoModule.wireTypes.i64 then
			local _ = nil
			local var333, var334 = protoModule.readFixed64(p15, var315)
			local _ = var333
			var315 = var334
		else
			error("Unsupported wire type: " .. var511)
		end
	end
	return var314
end

function t_15:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.position ~= nil then
		t.position = self.position:jsonEncode()
	end
	if self.rotation ~= nil and self.rotation ~= 0 then
		t.rotation = protoModule.json.serializeNumber(self.rotation)
	end
	if self.scale ~= nil and self.scale ~= 0 then
		t.scale = protoModule.json.serializeNumber(self.scale)
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref), protoModule (ref)
	local var335 = t_15.new()
	
	if self.position ~= nil then
		var335.position = t.Vec2.jsonDecode(self.position)
	end
	if self.rotation ~= nil then
		var335.rotation = protoModule.json.deserializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		var335.scale = protoModule.json.deserializeNumber(self.scale)
	end
	return var335
end

t_15.descriptor = {
	name = "Transform",
	fullName = "roblox.posts.postasset.v1.Transform"
}
t.Transform = t_15
typeRegistryModule.default:register(t.Transform)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		x = if p16 == nil or p16.x == nil then 0 else p16.x,
		y = if p16 == nil or p16.y == nil then 0 else p16.y
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var335 = 0
	
	if self.x ~= nil and self.x ~= 0 then
		local var336, var337 = protoModule.writeTag(buff, var335, 1, protoModule.wireTypes.i32)
		var336, var535 = protoModule.writeFloat(var336, var337, self.x)
		buff = var336
		var335 = var337
	end
	if self.y ~= nil and self.y ~= 0 then
		local var338, var339 = protoModule.writeTag(buff, var335, 2, protoModule.wireTypes.i32)
		var338, var537 = protoModule.writeFloat(var338, var339, self.y)
		buff = var338
		var335 = var339
	end
	local buff_1 = buffer.create(var335)
	buffer.copy(buff_1, 0, buff, 0, var335)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref)
	local var335 = t_16.new()
	local var336 = 0
	while var336 < buffer.len(p16) do
		local _ = nil
		local _ = nil
		local var337, var338, var339 = protoModule.readTag(p16, var336)
		local var340 = var337
		local var341 = var338
		var336 = var339
		
		if var341 == protoModule.wireTypes.varint then
			local _ = nil
			local var342, var343 = protoModule.readVarInt(p16, var336)
			local _ = var342
			var336 = var343
		elseif var341 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var344, var345 = protoModule.readVarInt(p16, var336)
			var336 = var345 + var344
		elseif var341 == protoModule.wireTypes.i32 then
			if var340 == 1 then
				local _ = nil
				local var346, var347 = protoModule.readFloat(p16, var336)
				var336 = var347
				var335.x = var346
			elseif var340 == 2 then
				local _ = nil
				local var348, var349 = protoModule.readFloat(p16, var336)
				var336 = var349
				var335.y = var348
			else
				local _ = nil
				local var350, var351 = protoModule.readFixed32(p16, var336)
				local _ = var350
				var336 = var351
			end
		elseif var341 == protoModule.wireTypes.i64 then
			local _ = nil
			local var352, var353 = protoModule.readFixed64(p16, var336)
			local _ = var352
			var336 = var353
		else
			error("Unsupported wire type: " .. var545)
		end
	end
	return var335
end

function t_16:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.x ~= nil and self.x ~= 0 then
		t.x = protoModule.json.serializeNumber(self.x)
	end
	if self.y ~= nil and self.y ~= 0 then
		t.y = protoModule.json.serializeNumber(self.y)
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), protoModule (ref)
	local var354 = t_16.new()
	
	if self.x ~= nil then
		var354.x = protoModule.json.deserializeNumber(self.x)
	end
	if self.y ~= nil then
		var354.y = protoModule.json.deserializeNumber(self.y)
	end
	return var354
end

t_16.descriptor = {
	name = "Vec2",
	fullName = "roblox.posts.postasset.v1.Vec2"
}
t.Vec2 = t_16
typeRegistryModule.default:register(t.Vec2)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		r = if p17 == nil or p17.r == nil then 0 else p17.r,
		g = if p17 == nil or p17.g == nil then 0 else p17.g,
		b = if p17 == nil or p17.b == nil then 0 else p17.b
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var354 = 0
	
	if self.r ~= nil and self.r ~= 0 then
		local var355, var356 = protoModule.writeTag(buff, var354, 1, protoModule.wireTypes.i32)
		var355, var563 = protoModule.writeFloat(var355, var356, self.r)
		buff = var355
		var354 = var356
	end
	if self.g ~= nil and self.g ~= 0 then
		local var357, var358 = protoModule.writeTag(buff, var354, 2, protoModule.wireTypes.i32)
		var357, var565 = protoModule.writeFloat(var357, var358, self.g)
		buff = var357
		var354 = var358
	end
	if self.b ~= nil and self.b ~= 0 then
		local var359, var360 = protoModule.writeTag(buff, var354, 3, protoModule.wireTypes.i32)
		var359, var567 = protoModule.writeFloat(var359, var360, self.b)
		buff = var359
		var354 = var360
	end
	local buff_1 = buffer.create(var354)
	buffer.copy(buff_1, 0, buff, 0, var354)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var354 = t_17.new()
	local var355 = 0
	while var355 < buffer.len(p17) do
		local _ = nil
		local _ = nil
		local var356, var357, var358 = protoModule.readTag(p17, var355)
		local var359 = var356
		local var360 = var357
		var355 = var358
		
		if var360 == protoModule.wireTypes.varint then
			local _ = nil
			local var361, var362 = protoModule.readVarInt(p17, var355)
			local _ = var361
			var355 = var362
		elseif var360 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var363, var364 = protoModule.readVarInt(p17, var355)
			var355 = var364 + var363
		elseif var360 == protoModule.wireTypes.i32 then
			if var359 == 1 then
				local _ = nil
				local var365, var366 = protoModule.readFloat(p17, var355)
				var355 = var366
				var354.r = var365
			elseif var359 == 2 then
				local _ = nil
				local var367, var368 = protoModule.readFloat(p17, var355)
				var355 = var368
				var354.g = var367
			elseif var359 == 3 then
				local _ = nil
				local var369, var370 = protoModule.readFloat(p17, var355)
				var355 = var370
				var354.b = var369
			else
				local _ = nil
				local var371, var372 = protoModule.readFixed32(p17, var355)
				local _ = var371
				var355 = var372
			end
		elseif var360 == protoModule.wireTypes.i64 then
			local _ = nil
			local var373, var374 = protoModule.readFixed64(p17, var355)
			local _ = var373
			var355 = var374
		else
			error("Unsupported wire type: " .. var575)
		end
	end
	return var354
end

function t_17:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.r ~= nil and self.r ~= 0 then
		t.r = protoModule.json.serializeNumber(self.r)
	end
	if self.g ~= nil and self.g ~= 0 then
		t.g = protoModule.json.serializeNumber(self.g)
	end
	if self.b ~= nil and self.b ~= 0 then
		t.b = protoModule.json.serializeNumber(self.b)
	end
	return t
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), protoModule (ref)
	local var375 = t_17.new()
	
	if self.r ~= nil then
		var375.r = protoModule.json.deserializeNumber(self.r)
	end
	if self.g ~= nil then
		var375.g = protoModule.json.deserializeNumber(self.g)
	end
	if self.b ~= nil then
		var375.b = protoModule.json.deserializeNumber(self.b)
	end
	return var375
end

t_17.descriptor = {
	name = "Color3",
	fullName = "roblox.posts.postasset.v1.Color3"
}
t.Color3 = t_17
typeRegistryModule.default:register(t.Color3)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		font_source = if p18 == nil or p18.font_source == nil then nil else p18.font_source
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var375 = 0
	
	if self.font_source ~= nil then
		if self.font_source.type == "enumerated_font" then
			local var376, var377 = protoModule.writeTag(buff, var375, 1, protoModule.wireTypes.varint)
			var376, var595 = protoModule.writeVarInt(var376, var377, t.EnumeratedFont.toNumber(self.font_source.value))
			buff = var376
			var375 = var377
		elseif self.font_source.type == "family_asset_id" then
			local var378, var379 = protoModule.writeTag(buff, var375, 2, protoModule.wireTypes.varint)
			var378, var597 = protoModule.writeVarInt(var378, var379, self.font_source.value)
			buff = var378
			var375 = var379
		end
	end
	local buff_1 = buffer.create(var375)
	buffer.copy(buff_1, 0, buff, 0, var375)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var375 = t_18.new()
	local var376 = 0
	while var376 < buffer.len(p18) do
		local _ = nil
		local _ = nil
		local var377, var378, var379 = protoModule.readTag(p18, var376)
		local var380 = var377
		local var381 = var378
		var376 = var379
		
		if var381 == protoModule.wireTypes.varint then
			if var380 == 1 then
				local _ = nil
				local var382, var383 = protoModule.readVarIntI32(p18, var376)
				local var384 = var382
				var376 = var383
				var375.font_source = {
					type = "enumerated_font",
					value = t.EnumeratedFont.fromNumber(var384) or var384
				}
			elseif var380 == 2 then
				local _ = nil
				local var385, var386 = protoModule.readVarIntI64(p18, var376)
				var376 = var386
				var375.font_source = { type = "family_asset_id", value = var385 }
			else
				local _ = nil
				local var387, var388 = protoModule.readVarInt(p18, var376)
				local _ = var387
				var376 = var388
			end
		elseif var381 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var389, var390 = protoModule.readVarInt(p18, var376)
			var376 = var390 + var389
		elseif var381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var391, var392 = protoModule.readFixed32(p18, var376)
			local _ = var391
			var376 = var392
		elseif var381 == protoModule.wireTypes.i64 then
			local _ = nil
			local var393, var394 = protoModule.readFixed64(p18, var376)
			local _ = var393
			var376 = var394
		else
			error("Unsupported wire type: " .. var605)
		end
	end
	return var375
end

function t_18:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.font_source ~= nil then
		if self.font_source.type == "enumerated_font" then
			t_1.enumeratedFont = if typeof(self.font_source.value) == "number" then self.font_source.value else t.EnumeratedFont.toNumber(self.font_source.value)
			
			return t_1
		elseif self.font_source.type == "family_asset_id" then
			t_1.familyAssetId = self.font_source.value
		end
	end
	return t_1
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref), t (ref)
	local var395 = t_18.new()
	
	if self.enumerated_font ~= nil then
		var395.font_source = {
			type = "enumerated_font",
			value = if typeof(self.enumerated_font) == "number" then t.EnumeratedFont.fromNumber(self.enumerated_font) or self.enumerated_font else t.EnumeratedFont.fromName(self.enumerated_font) or self.enumerated_font
		}
	end
	if self.enumeratedFont ~= nil then
		var395.font_source = {
			type = "enumerated_font",
			value = if typeof(self.enumeratedFont) == "number" then t.EnumeratedFont.fromNumber(self.enumeratedFont) or self.enumeratedFont else t.EnumeratedFont.fromName(self.enumeratedFont) or self.enumeratedFont
		}
	end
	if self.family_asset_id ~= nil then
		var395.font_source = { type = "family_asset_id", value = self.family_asset_id }
	end
	if self.familyAssetId ~= nil then
		var395.font_source = { type = "family_asset_id", value = self.familyAssetId }
	end
	return var395
end

t_18.descriptor = {
	name = "FontInfo",
	fullName = "roblox.posts.postasset.v1.FontInfo"
}
t.FontInfo = t_18
typeRegistryModule.default:register(t.FontInfo)
t.PostOrigin = {
	fromNumber = function(p19)
		return if p19 == 0 then "POST_ORIGIN_INVALID" elseif p19 == 1 then "POST_ORIGIN_CAPTURE_VIDEO" elseif p19 == 2 then "POST_ORIGIN_CAPTURE_SCREENSHOT" elseif p19 == 3 then "POST_ORIGIN_INFLUENCER_UPLOAD" elseif p19 == 4 then "POST_ORIGIN_AVATAR" else nil
	end,
	toNumber = function(p19)
		return if p19 == "POST_ORIGIN_INVALID" then 0 elseif p19 == "POST_ORIGIN_CAPTURE_VIDEO" then 1 elseif p19 == "POST_ORIGIN_CAPTURE_SCREENSHOT" then 2 elseif p19 == "POST_ORIGIN_INFLUENCER_UPLOAD" then 3 elseif p19 == "POST_ORIGIN_AVATAR" then 4 else p19
	end,
	fromName = function(p19)
		return if p19 == "POST_ORIGIN_INVALID" then "POST_ORIGIN_INVALID" elseif p19 == "POST_ORIGIN_CAPTURE_VIDEO" then "POST_ORIGIN_CAPTURE_VIDEO" elseif p19 == "POST_ORIGIN_CAPTURE_SCREENSHOT" then "POST_ORIGIN_CAPTURE_SCREENSHOT" elseif p19 == "POST_ORIGIN_INFLUENCER_UPLOAD" then "POST_ORIGIN_INFLUENCER_UPLOAD" elseif p19 == "POST_ORIGIN_AVATAR" then "POST_ORIGIN_AVATAR" else nil
	end
}
t.TrackType = {
	fromNumber = function(p19)
		return if p19 == 0 then "TRACK_TYPE_INVALID" elseif p19 == 1 then "TRACK_TYPE_VISUAL" elseif p19 == 2 then "TRACK_TYPE_AUDIO" elseif p19 == 3 then "TRACK_TYPE_ANNOTATION" else nil
	end,
	toNumber = function(p19)
		return if p19 == "TRACK_TYPE_INVALID" then 0 elseif p19 == "TRACK_TYPE_VISUAL" then 1 elseif p19 == "TRACK_TYPE_AUDIO" then 2 elseif p19 == "TRACK_TYPE_ANNOTATION" then 3 else p19
	end,
	fromName = function(p19)
		return if p19 == "TRACK_TYPE_INVALID" then "TRACK_TYPE_INVALID" elseif p19 == "TRACK_TYPE_VISUAL" then "TRACK_TYPE_VISUAL" elseif p19 == "TRACK_TYPE_AUDIO" then "TRACK_TYPE_AUDIO" elseif p19 == "TRACK_TYPE_ANNOTATION" then "TRACK_TYPE_ANNOTATION" else nil
	end
}
t.AudioType = {
	fromNumber = function(p19)
		return if p19 == 0 then "AUDIO_TYPE_INVALID" elseif p19 == 1 then "AUDIO_TYPE_MUSIC" elseif p19 == 2 then "AUDIO_TYPE_TTS" elseif p19 == 3 then "AUDIO_TYPE_VOICE_OVER" else nil
	end,
	toNumber = function(p19)
		return if p19 == "AUDIO_TYPE_INVALID" then 0 elseif p19 == "AUDIO_TYPE_MUSIC" then 1 elseif p19 == "AUDIO_TYPE_TTS" then 2 elseif p19 == "AUDIO_TYPE_VOICE_OVER" then 3 else p19
	end,
	fromName = function(p19)
		return if p19 == "AUDIO_TYPE_INVALID" then "AUDIO_TYPE_INVALID" elseif p19 == "AUDIO_TYPE_MUSIC" then "AUDIO_TYPE_MUSIC" elseif p19 == "AUDIO_TYPE_TTS" then "AUDIO_TYPE_TTS" elseif p19 == "AUDIO_TYPE_VOICE_OVER" then "AUDIO_TYPE_VOICE_OVER" else nil
	end
}
t.EnumeratedFont = {
	fromNumber = function(p19)
		return if p19 == 0 then "ENUMERATED_FONT_INVALID" elseif p19 == 1 then "ENUMERATED_FONT_GOTHAM_BOLD" elseif p19 == 2 then "ENUMERATED_FONT_GOTHAM_BLACK" elseif p19 == 3 then "ENUMERATED_FONT_SOURCE_SANS" elseif p19 == 4 then "ENUMERATED_FONT_SOURCE_SANS_BOLD" elseif p19 == 5 then "ENUMERATED_FONT_FREDOKA_ONE" elseif p19 == 6 then "ENUMERATED_FONT_BANGERS" else nil
	end,
	toNumber = function(p19)
		return if p19 == "ENUMERATED_FONT_INVALID" then 0 elseif p19 == "ENUMERATED_FONT_GOTHAM_BOLD" then 1 elseif p19 == "ENUMERATED_FONT_GOTHAM_BLACK" then 2 elseif p19 == "ENUMERATED_FONT_SOURCE_SANS" then 3 elseif p19 == "ENUMERATED_FONT_SOURCE_SANS_BOLD" then 4 elseif p19 == "ENUMERATED_FONT_FREDOKA_ONE" then 5 elseif p19 == "ENUMERATED_FONT_BANGERS" then 6 else p19
	end,
	fromName = function(p19)
		return if p19 == "ENUMERATED_FONT_INVALID" then "ENUMERATED_FONT_INVALID" elseif p19 == "ENUMERATED_FONT_GOTHAM_BOLD" then "ENUMERATED_FONT_GOTHAM_BOLD" elseif p19 == "ENUMERATED_FONT_GOTHAM_BLACK" then "ENUMERATED_FONT_GOTHAM_BLACK" elseif p19 == "ENUMERATED_FONT_SOURCE_SANS" then "ENUMERATED_FONT_SOURCE_SANS" elseif p19 == "ENUMERATED_FONT_SOURCE_SANS_BOLD" then "ENUMERATED_FONT_SOURCE_SANS_BOLD" elseif p19 == "ENUMERATED_FONT_FREDOKA_ONE" then "ENUMERATED_FONT_FREDOKA_ONE" elseif p19 == "ENUMERATED_FONT_BANGERS" then "ENUMERATED_FONT_BANGERS" else nil
	end
}
t.TextXAlignment = {
	fromNumber = function(p19)
		return if p19 == 0 then "TEXT_X_ALIGNMENT_INVALID" elseif p19 == 1 then "TEXT_X_ALIGNMENT_LEFT" elseif p19 == 2 then "TEXT_X_ALIGNMENT_CENTER" elseif p19 == 3 then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p19)
		return if p19 == "TEXT_X_ALIGNMENT_INVALID" then 0 elseif p19 == "TEXT_X_ALIGNMENT_LEFT" then 1 elseif p19 == "TEXT_X_ALIGNMENT_CENTER" then 2 elseif p19 == "TEXT_X_ALIGNMENT_RIGHT" then 3 else p19
	end,
	fromName = function(p19)
		return if p19 == "TEXT_X_ALIGNMENT_INVALID" then "TEXT_X_ALIGNMENT_INVALID" elseif p19 == "TEXT_X_ALIGNMENT_LEFT" then "TEXT_X_ALIGNMENT_LEFT" elseif p19 == "TEXT_X_ALIGNMENT_CENTER" then "TEXT_X_ALIGNMENT_CENTER" elseif p19 == "TEXT_X_ALIGNMENT_RIGHT" then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end
}

return {
	Post = t.Post,
	PostMetadata = t.PostMetadata,
	Track = t.Track,
	Slot = t.Slot,
	VisualSlot = t.VisualSlot,
	VideoSlot = t.VideoSlot,
	ImageSlot = t.ImageSlot,
	TextLabelSlot = t.TextLabelSlot,
	SceneSlot = t.SceneSlot,
	AudioSlot = t.AudioSlot,
	TtsAudioContext = t.TtsAudioContext,
	ExperienceAnnotationSlot = t.ExperienceAnnotationSlot,
	AvatarAnnotationSlot = t.AvatarAnnotationSlot,
	TimeRange = t.TimeRange,
	Transform = t.Transform,
	Vec2 = t.Vec2,
	Color3 = t.Color3,
	FontInfo = t.FontInfo,
	PostOrigin = t.PostOrigin,
	TrackType = t.TrackType,
	AudioType = t.AudioType,
	EnumeratedFont = t.EnumeratedFont,
	TextXAlignment = t.TextXAlignment
}