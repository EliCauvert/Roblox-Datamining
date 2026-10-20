local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Label = {}
local DurationModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.duration)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata,
		tracks = if p1 == nil or p1.tracks == nil then {} else p1.tracks
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.metadata ~= nil then
		local EncodeResult = self.metadata:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.tracks ~= nil and #self.tracks > 0 then
		for _, track in self.tracks do
			local EncodeResult = track:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v31 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v31 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v31 = ProtoModule.readBuffer(Buf, v1)
				NewModule.metadata = Label.PostMetadata.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v31 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.tracks, Label.Track.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v31 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v31 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	if self.tracks ~= nil and #self.tracks > 0 then
		local Tracks = {}
		
		for _, track in self.tracks do
			table.insert(Tracks, track:jsonEncode())
		end
		t.tracks = Tracks
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), Label (copy)
	local NewModule = Module.new()
	
	if self.metadata ~= nil then
		NewModule.metadata = Label.PostMetadata.jsonDecode(self.metadata)
	end
	if self.tracks ~= nil then
		local Tracks = {}
		
		for _, track in self.tracks do
			table.insert(Tracks, Label.Track.jsonDecode(track))
		end
		NewModule.tracks = Tracks
	end
	return NewModule
end

Module.descriptor = {
	name = "Post",
	fullName = "roblox.posts.postasset.v1.Post"
}
Label.Post = Module
TypeRegistryModule.default:register(Label.Post)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Label (copy), Module1 (copy)
	return (setmetatable({
		origin = if p1 == nil or p1.origin == nil then assert(Label.PostOrigin.fromNumber(0), "Enum has no 0 default") else p1.origin,
		caption = if p1 == nil or p1.caption == nil then "" else p1.caption,
		total_duration = if p1 == nil or p1.total_duration == nil then nil else p1.total_duration,
		content_language = if p1 == nil or p1.content_language == nil then "" else p1.content_language
	}, Module1))
end

function Module1:encode()
	-- upvalues: Label (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.origin ~= nil and (self.origin ~= nil and self.origin ~= 0 or self.origin ~= Label.PostOrigin.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.PostOrigin.toNumber(self.origin))
	end
	if self.caption ~= nil and self.caption ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.caption)
	end
	if self.total_duration ~= nil then
		local EncodeResult = self.total_duration:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.content_language ~= nil and self.content_language ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.content_language)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), Label (copy), DurationModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v57 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v57 = ProtoModule.readVarIntI32(Buf, v2)
				NewModule.origin = Label.PostOrigin.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v57 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v57 = ProtoModule.readBuffer(Buf, v2)
				NewModule.caption = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v57 = ProtoModule.readBuffer(Buf, v2)
				NewModule.total_duration = DurationModule.Duration.decode(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v57 = ProtoModule.readBuffer(Buf, v2)
				NewModule.content_language = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v57 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v57 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.origin ~= nil and (self.origin ~= nil and self.origin ~= 0 or self.origin ~= Label.PostOrigin.fromNumber(0)) then
		t.origin = if typeof(self.origin) == "number" then self.origin else Label.PostOrigin.toNumber(self.origin)
	end
	if self.caption ~= nil and self.caption ~= "" then
		t.caption = self.caption
	end
	if self.total_duration ~= nil then
		t.totalDuration = self.total_duration:jsonEncode()
	end
	if self.content_language ~= nil and self.content_language ~= "" then
		t.contentLanguage = self.content_language
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), Label (copy), DurationModule (copy)
	local NewModule = Module1.new()
	
	if self.origin ~= nil then
		NewModule.origin = (if typeof(self.origin) == "number" then Label.PostOrigin.fromNumber(self.origin) else Label.PostOrigin.fromName(self.origin)) or self.origin
	end
	if self.caption ~= nil then
		NewModule.caption = self.caption
	end
	if self.total_duration ~= nil then
		NewModule.total_duration = DurationModule.Duration.jsonDecode(self.total_duration)
	end
	if self.totalDuration ~= nil then
		NewModule.total_duration = DurationModule.Duration.jsonDecode(self.totalDuration)
	end
	if self.content_language ~= nil then
		NewModule.content_language = self.content_language
	end
	if self.contentLanguage ~= nil then
		NewModule.content_language = self.contentLanguage
	end
	return NewModule
end

Module1.descriptor = {
	name = "PostMetadata",
	fullName = "roblox.posts.postasset.v1.PostMetadata"
}
Label.PostMetadata = Module1
TypeRegistryModule.default:register(Label.PostMetadata)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Label (copy), Module2 (copy)
	return (setmetatable({
		type = if p1 == nil or p1.type == nil then assert(Label.TrackType.fromNumber(0), "Enum has no 0 default") else p1.type,
		slots = if p1 == nil or p1.slots == nil then {} else p1.slots
	}, Module2))
end

function Module2:encode()
	-- upvalues: Label (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= Label.TrackType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.TrackType.toNumber(self.type))
	end
	if self.slots ~= nil and #self.slots > 0 then
		for _, slot in self.slots do
			local EncodeResult = slot:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v79 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v79 = ProtoModule.readVarIntI32(Buf, v3)
				NewModule.type = Label.TrackType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v79 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v79 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.slots, Label.Slot.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v79 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v79 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= Label.TrackType.fromNumber(0)) then
		t.type = if typeof(self.type) == "number" then self.type else Label.TrackType.toNumber(self.type)
	end
	if self.slots ~= nil and #self.slots > 0 then
		local Slots = {}
		
		for _, slot in self.slots do
			table.insert(Slots, slot:jsonEncode())
		end
		t.slots = Slots
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), Label (copy)
	local NewModule = Module2.new()
	
	if self.type ~= nil then
		NewModule.type = (if typeof(self.type) == "number" then Label.TrackType.fromNumber(self.type) else Label.TrackType.fromName(self.type)) or self.type
	end
	if self.slots ~= nil then
		local Slots = {}
		
		for _, slot in self.slots do
			table.insert(Slots, Label.Slot.jsonDecode(slot))
		end
		NewModule.slots = Slots
	end
	return NewModule
end

Module2.descriptor = {
	name = "Track",
	fullName = "roblox.posts.postasset.v1.Track"
}
Label.Track = Module2
TypeRegistryModule.default:register(Label.Track)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		slot_id = if p1 == nil or p1.slot_id == nil then "" else p1.slot_id,
		time_range = if p1 == nil or p1.time_range == nil then nil else p1.time_range,
		content = if p1 == nil or p1.content == nil then nil else p1.content
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.slot_id ~= nil and self.slot_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.slot_id)
	end
	if self.time_range ~= nil then
		local EncodeResult = self.time_range:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.content ~= nil then
		if self.content.type == "visual" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "audio" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "experience_annotation" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "avatar_annotation" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v113 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v113 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.slot_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.time_range = Label.TimeRange.decode(Buffer2)
			elseif Tag == 10 then
				local Buffer3
				Buffer3, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.content = {
					type = "visual",
					value = Label.VisualSlot.decode(Buffer3)
				}
			elseif Tag == 11 then
				local Buffer4
				Buffer4, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.content = { type = "audio", value = Label.AudioSlot.decode(Buffer4) }
			elseif Tag == 12 then
				local Buffer5
				Buffer5, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.content = {
					type = "experience_annotation",
					value = Label.ExperienceAnnotationSlot.decode(Buffer5)
				}
			elseif Tag == 13 then
				local Buffer6
				Buffer6, v113 = ProtoModule.readBuffer(Buf, v4)
				NewModule.content = {
					type = "avatar_annotation",
					value = Label.AvatarAnnotationSlot.decode(Buffer6)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v113 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v113 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
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
		end
		if self.content.type == "audio" then
			t.audio = self.content.value:jsonEncode()
			
			return t
		end
		if self.content.type == "experience_annotation" then
			t.experienceAnnotation = self.content.value:jsonEncode()
			
			return t
		end
		if self.content.type == "avatar_annotation" then
			t.avatarAnnotation = self.content.value:jsonEncode()
		end
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), Label (copy)
	local NewModule = Module3.new()
	
	if self.slot_id ~= nil then
		NewModule.slot_id = self.slot_id
	end
	if self.slotId ~= nil then
		NewModule.slot_id = self.slotId
	end
	if self.time_range ~= nil then
		NewModule.time_range = Label.TimeRange.jsonDecode(self.time_range)
	end
	if self.timeRange ~= nil then
		NewModule.time_range = Label.TimeRange.jsonDecode(self.timeRange)
	end
	if self.visual ~= nil then
		NewModule.content = {
			type = "visual",
			value = Label.VisualSlot.jsonDecode(self.visual)
		}
	end
	if self.audio ~= nil then
		NewModule.content = {
			type = "audio",
			value = Label.AudioSlot.jsonDecode(self.audio)
		}
	end
	if self.experience_annotation ~= nil then
		NewModule.content = {
			type = "experience_annotation",
			value = Label.ExperienceAnnotationSlot.jsonDecode(self.experience_annotation)
		}
	end
	if self.experienceAnnotation ~= nil then
		NewModule.content = {
			type = "experience_annotation",
			value = Label.ExperienceAnnotationSlot.jsonDecode(self.experienceAnnotation)
		}
	end
	if self.avatar_annotation ~= nil then
		NewModule.content = {
			type = "avatar_annotation",
			value = Label.AvatarAnnotationSlot.jsonDecode(self.avatar_annotation)
		}
	end
	if self.avatarAnnotation ~= nil then
		NewModule.content = {
			type = "avatar_annotation",
			value = Label.AvatarAnnotationSlot.jsonDecode(self.avatarAnnotation)
		}
	end
	return NewModule
end

Module3.descriptor = {
	name = "Slot",
	fullName = "roblox.posts.postasset.v1.Slot"
}
Label.Slot = Module3
TypeRegistryModule.default:register(Label.Slot)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		z_index = if p1 == nil or p1.z_index == nil then 0 else p1.z_index,
		transform = if p1 == nil or p1.transform == nil then nil else p1.transform,
		content = if p1 == nil or p1.content == nil then nil else p1.content
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.z_index ~= nil and self.z_index ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.z_index)
	end
	if self.transform ~= nil then
		local EncodeResult = self.transform:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.content ~= nil then
		if self.content.type == "video" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "image" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "text_label" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.content.type == "scene" then
			local EncodeResult = self.content.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v149 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.z_index, v149 = ProtoModule.readVarIntI32(Buf, v5)
			else
				local _
				_, v149 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.transform = Label.Transform.decode(Buffer1)
			elseif Tag == 10 then
				local Buffer2
				Buffer2, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.content = { type = "video", value = Label.VideoSlot.decode(Buffer2) }
			elseif Tag == 11 then
				local Buffer3
				Buffer3, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.content = { type = "image", value = Label.ImageSlot.decode(Buffer3) }
			elseif Tag == 12 then
				local Buffer4
				Buffer4, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.content = {
					type = "text_label",
					value = Label.TextLabelSlot.decode(Buffer4)
				}
			elseif Tag == 13 then
				local Buffer5
				Buffer5, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.content = { type = "scene", value = Label.SceneSlot.decode(Buffer5) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v149 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v149 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
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
		end
		if self.content.type == "image" then
			t.image = self.content.value:jsonEncode()
			
			return t
		end
		if self.content.type == "text_label" then
			t.textLabel = self.content.value:jsonEncode()
			
			return t
		end
		if self.content.type == "scene" then
			t.scene = self.content.value:jsonEncode()
		end
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), Label (copy)
	local NewModule = Module4.new()
	
	if self.z_index ~= nil then
		NewModule.z_index = self.z_index
	end
	if self.zIndex ~= nil then
		NewModule.z_index = self.zIndex
	end
	if self.transform ~= nil then
		NewModule.transform = Label.Transform.jsonDecode(self.transform)
	end
	if self.video ~= nil then
		NewModule.content = {
			type = "video",
			value = Label.VideoSlot.jsonDecode(self.video)
		}
	end
	if self.image ~= nil then
		NewModule.content = {
			type = "image",
			value = Label.ImageSlot.jsonDecode(self.image)
		}
	end
	if self.text_label ~= nil then
		NewModule.content = {
			type = "text_label",
			value = Label.TextLabelSlot.jsonDecode(self.text_label)
		}
	end
	if self.textLabel ~= nil then
		NewModule.content = {
			type = "text_label",
			value = Label.TextLabelSlot.jsonDecode(self.textLabel)
		}
	end
	if self.scene ~= nil then
		NewModule.content = {
			type = "scene",
			value = Label.SceneSlot.jsonDecode(self.scene)
		}
	end
	return NewModule
end

Module4.descriptor = {
	name = "VisualSlot",
	fullName = "roblox.posts.postasset.v1.VisualSlot"
}
Label.VisualSlot = Module4
TypeRegistryModule.default:register(Label.VisualSlot)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then 0 else p1.asset_id,
		trim = if p1 == nil or p1.trim == nil then nil else p1.trim
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.trim ~= nil then
		local EncodeResult = self.trim:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v172 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.asset_id, v172 = ProtoModule.readVarIntI64(Buf, v6)
			else
				local _
				_, v172 = ProtoModule.readVarInt(Buf, v6)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v172 = ProtoModule.readBuffer(Buf, v6)
				NewModule.trim = Label.TimeRange.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v172 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v172 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	if self.trim ~= nil then
		t.trim = self.trim:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), Label (copy)
	local NewModule = Module5.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.trim ~= nil then
		NewModule.trim = Label.TimeRange.jsonDecode(self.trim)
	end
	return NewModule
end

Module5.descriptor = {
	name = "VideoSlot",
	fullName = "roblox.posts.postasset.v1.VideoSlot"
}
Label.VideoSlot = Module5
TypeRegistryModule.default:register(Label.VideoSlot)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then 0 else p1.asset_id
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.asset_id)
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
		Tag, Tag2, v188 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.asset_id, v188 = ProtoModule.readVarIntI64(Buf, v7)
			else
				local _
				_, v188 = ProtoModule.readVarInt(Buf, v7)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
			v7 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v188 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v188 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	return NewModule
end

Module6.descriptor = {
	name = "ImageSlot",
	fullName = "roblox.posts.postasset.v1.ImageSlot"
}
Label.ImageSlot = Module6
TypeRegistryModule.default:register(Label.ImageSlot)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Label (copy), Module7 (copy)
	return (setmetatable({
		text = if p1 == nil or p1.text == nil then "" else p1.text,
		font = if p1 == nil or p1.font == nil then nil else p1.font,
		text_x_alignment = if p1 == nil or p1.text_x_alignment == nil then assert(Label.TextXAlignment.fromNumber(0), "Enum has no 0 default") else p1.text_x_alignment,
		font_color = if p1 == nil or p1.font_color == nil then nil else p1.font_color,
		font_size = if p1 == nil or p1.font_size == nil then 0 else p1.font_size
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.text)
	end
	if self.font ~= nil then
		local EncodeResult = self.font:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.text_x_alignment ~= nil and (self.text_x_alignment ~= nil and self.text_x_alignment ~= 0 or self.text_x_alignment ~= Label.TextXAlignment.fromNumber(0)) then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, Label.TextXAlignment.toNumber(self.text_x_alignment))
	end
	if self.font_color ~= nil then
		local EncodeResult = self.font_color:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.font_size ~= nil and self.font_size ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult5, WriteTagResult2_4, self.font_size)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v213 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarIntI32
				VarIntI32, v213 = ProtoModule.readVarIntI32(Buf, v8)
				NewModule.text_x_alignment = Label.TextXAlignment.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v213 = ProtoModule.readVarInt(Buf, v8)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v213 = ProtoModule.readBuffer(Buf, v8)
				NewModule.text = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v213 = ProtoModule.readBuffer(Buf, v8)
				NewModule.font = Label.FontInfo.decode(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v213 = ProtoModule.readBuffer(Buf, v8)
				NewModule.font_color = Label.Color3.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 5 then
				NewModule.font_size, v213 = ProtoModule.readFloat(Buf, v8)
			else
				local _
				_, v213 = ProtoModule.readFixed32(Buf, v8)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v213 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	-- upvalues: Label (copy), ProtoModule (copy)
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.font ~= nil then
		t.font = self.font:jsonEncode()
	end
	if self.text_x_alignment ~= nil and (self.text_x_alignment ~= nil and self.text_x_alignment ~= 0 or self.text_x_alignment ~= Label.TextXAlignment.fromNumber(0)) then
		t.textXAlignment = if typeof(self.text_x_alignment) == "number" then self.text_x_alignment else Label.TextXAlignment.toNumber(self.text_x_alignment)
	end
	if self.font_color ~= nil then
		t.fontColor = self.font_color:jsonEncode()
	end
	if self.font_size ~= nil and self.font_size ~= 0 then
		t.fontSize = ProtoModule.json.serializeNumber(self.font_size)
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), Label (copy), ProtoModule (copy)
	local NewModule = Module7.new()
	
	if self.text ~= nil then
		NewModule.text = self.text
	end
	if self.font ~= nil then
		NewModule.font = Label.FontInfo.jsonDecode(self.font)
	end
	if self.text_x_alignment ~= nil then
		NewModule.text_x_alignment = (if typeof(self.text_x_alignment) == "number" then Label.TextXAlignment.fromNumber(self.text_x_alignment) else Label.TextXAlignment.fromName(self.text_x_alignment)) or self.text_x_alignment
	end
	if self.textXAlignment ~= nil then
		NewModule.text_x_alignment = (if typeof(self.textXAlignment) == "number" then Label.TextXAlignment.fromNumber(self.textXAlignment) else Label.TextXAlignment.fromName(self.textXAlignment)) or self.textXAlignment
	end
	if self.font_color ~= nil then
		NewModule.font_color = Label.Color3.jsonDecode(self.font_color)
	end
	if self.fontColor ~= nil then
		NewModule.font_color = Label.Color3.jsonDecode(self.fontColor)
	end
	if self.font_size ~= nil then
		NewModule.font_size = ProtoModule.json.deserializeNumber(self.font_size)
	end
	if self.fontSize ~= nil then
		NewModule.font_size = ProtoModule.json.deserializeNumber(self.fontSize)
	end
	return NewModule
end

Module7.descriptor = {
	name = "TextLabelSlot",
	fullName = "roblox.posts.postasset.v1.TextLabelSlot"
}
Label.TextLabelSlot = Module7
TypeRegistryModule.default:register(Label.TextLabelSlot)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then 0 else p1.asset_id,
		rbxm_data = if p1 == nil or p1.rbxm_data == nil then buffer.create(0) else p1.rbxm_data
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.rbxm_data ~= nil and buffer.len(self.rbxm_data) > 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, self.rbxm_data, buffer.len(self.rbxm_data))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v234 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.asset_id, v234 = ProtoModule.readVarIntI64(Buf, v9)
			else
				local _
				_, v234 = ProtoModule.readVarInt(Buf, v9)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				NewModule.rbxm_data, v234 = ProtoModule.readBuffer(Buf, v9)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v234 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v234 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	if self.rbxm_data ~= nil and buffer.len(self.rbxm_data) > 0 then
		t.rbxmData = ProtoModule.json.serializeBuffer(self.rbxm_data)
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), ProtoModule (copy)
	local NewModule = Module8.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.rbxm_data ~= nil then
		NewModule.rbxm_data = ProtoModule.json.deserializeBuffer(self.rbxm_data)
	end
	if self.rbxmData ~= nil then
		NewModule.rbxm_data = ProtoModule.json.deserializeBuffer(self.rbxmData)
	end
	return NewModule
end

Module8.descriptor = {
	name = "SceneSlot",
	fullName = "roblox.posts.postasset.v1.SceneSlot"
}
Label.SceneSlot = Module8
TypeRegistryModule.default:register(Label.SceneSlot)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Label (copy), Module9 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then 0 else p1.asset_id,
		trim = if p1 == nil or p1.trim == nil then nil else p1.trim,
		audio_type = if p1 == nil or p1.audio_type == nil then assert(Label.AudioType.fromNumber(0), "Enum has no 0 default") else p1.audio_type,
		context = if p1 == nil or p1.context == nil then nil else p1.context
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.trim ~= nil then
		local EncodeResult = self.trim:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.audio_type ~= nil and (self.audio_type ~= nil and self.audio_type ~= 0 or self.audio_type ~= Label.AudioType.fromNumber(0)) then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, Label.AudioType.toNumber(self.audio_type))
	end
	if self.context ~= nil and self.context.type == "tts" then
		local EncodeResult = self.context.value:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v257 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.asset_id, v257 = ProtoModule.readVarIntI64(Buf, v10)
			elseif Tag == 3 then
				local VarIntI32
				VarIntI32, v257 = ProtoModule.readVarIntI32(Buf, v10)
				NewModule.audio_type = Label.AudioType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v257 = ProtoModule.readVarInt(Buf, v10)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v257 = ProtoModule.readBuffer(Buf, v10)
				NewModule.trim = Label.TimeRange.decode(Buffer1)
			elseif Tag == 10 then
				local Buffer2
				Buffer2, v257 = ProtoModule.readBuffer(Buf, v10)
				NewModule.context = {
					type = "tts",
					value = Label.TtsAudioContext.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v257 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v257 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= 0 then
		t.assetId = self.asset_id
	end
	if self.trim ~= nil then
		t.trim = self.trim:jsonEncode()
	end
	if self.audio_type ~= nil and (self.audio_type ~= nil and self.audio_type ~= 0 or self.audio_type ~= Label.AudioType.fromNumber(0)) then
		t.audioType = if typeof(self.audio_type) == "number" then self.audio_type else Label.AudioType.toNumber(self.audio_type)
	end
	if self.context ~= nil and self.context.type == "tts" then
		t.tts = self.context.value:jsonEncode()
	end
	return t
end

function Module9:jsonDecode()
	-- upvalues: Module9 (copy), Label (copy)
	local NewModule = Module9.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.trim ~= nil then
		NewModule.trim = Label.TimeRange.jsonDecode(self.trim)
	end
	if self.audio_type ~= nil then
		NewModule.audio_type = (if typeof(self.audio_type) == "number" then Label.AudioType.fromNumber(self.audio_type) else Label.AudioType.fromName(self.audio_type)) or self.audio_type
	end
	if self.audioType ~= nil then
		NewModule.audio_type = (if typeof(self.audioType) == "number" then Label.AudioType.fromNumber(self.audioType) else Label.AudioType.fromName(self.audioType)) or self.audioType
	end
	if self.tts ~= nil then
		NewModule.context = {
			type = "tts",
			value = Label.TtsAudioContext.jsonDecode(self.tts)
		}
	end
	return NewModule
end

Module9.descriptor = {
	name = "AudioSlot",
	fullName = "roblox.posts.postasset.v1.AudioSlot"
}
Label.AudioSlot = Module9
TypeRegistryModule.default:register(Label.AudioSlot)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: Module10 (copy)
	return (setmetatable({
		text = if p1 == nil or p1.text == nil then "" else p1.text,
		voice_id = if p1 == nil or p1.voice_id == nil then 0 else p1.voice_id,
		pitch = if p1 == nil or p1.pitch == nil then 0 else p1.pitch,
		speed = if p1 == nil or p1.speed == nil then 0 else p1.speed
	}, Module10))
end

function Module10:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.text)
	end
	if self.voice_id ~= nil and self.voice_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.voice_id)
	end
	if self.pitch ~= nil and self.pitch ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult3, WriteTagResult2_2, self.pitch)
	end
	if self.speed ~= nil and self.speed ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult4, WriteTagResult2_3, self.speed)
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
		Tag, Tag2, v281 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.voice_id, v281 = ProtoModule.readVarIntI64(Buf, v11)
			else
				local _
				_, v281 = ProtoModule.readVarInt(Buf, v11)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v281 = ProtoModule.readBuffer(Buf, v11)
				NewModule.text = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v281 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 3 then
				NewModule.pitch, v281 = ProtoModule.readDouble(Buf, v11)
			elseif Tag == 4 then
				NewModule.speed, v281 = ProtoModule.readDouble(Buf, v11)
			else
				local _
				_, v281 = ProtoModule.readFixed64(Buf, v11)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.voice_id ~= nil and self.voice_id ~= 0 then
		t.voiceId = self.voice_id
	end
	if self.pitch ~= nil and self.pitch ~= 0 then
		t.pitch = ProtoModule.json.serializeNumber(self.pitch)
	end
	if self.speed ~= nil and self.speed ~= 0 then
		t.speed = ProtoModule.json.serializeNumber(self.speed)
	end
	return t
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy), ProtoModule (copy)
	local NewModule = Module10.new()
	
	if self.text ~= nil then
		NewModule.text = self.text
	end
	if self.voice_id ~= nil then
		NewModule.voice_id = self.voice_id
	end
	if self.voiceId ~= nil then
		NewModule.voice_id = self.voiceId
	end
	if self.pitch ~= nil then
		NewModule.pitch = ProtoModule.json.deserializeNumber(self.pitch)
	end
	if self.speed ~= nil then
		NewModule.speed = ProtoModule.json.deserializeNumber(self.speed)
	end
	return NewModule
end

Module10.descriptor = {
	name = "TtsAudioContext",
	fullName = "roblox.posts.postasset.v1.TtsAudioContext"
}
Label.TtsAudioContext = Module10
TypeRegistryModule.default:register(Label.TtsAudioContext)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then 0 else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then 0 else p1.place_id
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.place_id ~= nil and self.place_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.place_id)
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
		Tag, Tag2, v299 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.universe_id, v299 = ProtoModule.readVarIntI64(Buf, v12)
			elseif Tag == 2 then
				NewModule.place_id, v299 = ProtoModule.readVarIntI64(Buf, v12)
			else
				local _
				_, v299 = ProtoModule.readVarInt(Buf, v12)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
			v12 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v299 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v299 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= 0 then
		t.placeId = self.place_id
	end
	return t
end

function Module11:jsonDecode()
	-- upvalues: Module11 (copy)
	local NewModule = Module11.new()
	
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

Module11.descriptor = {
	name = "ExperienceAnnotationSlot",
	fullName = "roblox.posts.postasset.v1.ExperienceAnnotationSlot"
}
Label.ExperienceAnnotationSlot = Module11
TypeRegistryModule.default:register(Label.ExperienceAnnotationSlot)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1)
	-- upvalues: Module12 (copy)
	return (setmetatable({
		outfit_id = if p1 == nil or p1.outfit_id == nil then 0 else p1.outfit_id
	}, Module12))
end

function Module12:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.outfit_id ~= nil and self.outfit_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.outfit_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v314 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.outfit_id, v314 = ProtoModule.readVarIntI64(Buf, v13)
			else
				local _
				_, v314 = ProtoModule.readVarInt(Buf, v13)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
			v13 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v314 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v314 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	local t = {}
	
	if self.outfit_id ~= nil and self.outfit_id ~= 0 then
		t.outfitId = self.outfit_id
	end
	return t
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy)
	local NewModule = Module12.new()
	
	if self.outfit_id ~= nil then
		NewModule.outfit_id = self.outfit_id
	end
	if self.outfitId ~= nil then
		NewModule.outfit_id = self.outfitId
	end
	return NewModule
end

Module12.descriptor = {
	name = "AvatarAnnotationSlot",
	fullName = "roblox.posts.postasset.v1.AvatarAnnotationSlot"
}
Label.AvatarAnnotationSlot = Module12
TypeRegistryModule.default:register(Label.AvatarAnnotationSlot)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		offset_duration = if p1 == nil or p1.offset_duration == nil then nil else p1.offset_duration,
		duration = if p1 == nil or p1.duration == nil then nil else p1.duration
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.offset_duration ~= nil then
		local EncodeResult = self.offset_duration:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.duration ~= nil then
		local EncodeResult = self.duration:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), DurationModule (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v333 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v333 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v333 = ProtoModule.readBuffer(Buf, v14)
				NewModule.offset_duration = DurationModule.Duration.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v333 = ProtoModule.readBuffer(Buf, v14)
				NewModule.duration = DurationModule.Duration.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v333 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v333 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
	local t = {}
	
	if self.offset_duration ~= nil then
		t.offsetDuration = self.offset_duration:jsonEncode()
	end
	if self.duration ~= nil then
		t.duration = self.duration:jsonEncode()
	end
	return t
end

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), DurationModule (copy)
	local NewModule = Module13.new()
	
	if self.offset_duration ~= nil then
		NewModule.offset_duration = DurationModule.Duration.jsonDecode(self.offset_duration)
	end
	if self.offsetDuration ~= nil then
		NewModule.offset_duration = DurationModule.Duration.jsonDecode(self.offsetDuration)
	end
	if self.duration ~= nil then
		NewModule.duration = DurationModule.Duration.jsonDecode(self.duration)
	end
	return NewModule
end

Module13.descriptor = {
	name = "TimeRange",
	fullName = "roblox.posts.postasset.v1.TimeRange"
}
Label.TimeRange = Module13
TypeRegistryModule.default:register(Label.TimeRange)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: Module14 (copy)
	return (setmetatable({
		position = if p1 == nil or p1.position == nil then nil else p1.position,
		rotation = if p1 == nil or p1.rotation == nil then 0 else p1.rotation,
		scale = if p1 == nil or p1.scale == nil then 0 else p1.scale
	}, Module14))
end

function Module14:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.position ~= nil then
		local EncodeResult = self.position:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.rotation ~= nil and self.rotation ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.rotation)
	end
	if self.scale ~= nil and self.scale ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult3, WriteTagResult2_2, self.scale)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v355 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v355 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v355 = ProtoModule.readBuffer(Buf, v15)
				NewModule.position = Label.Vec2.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 2 then
				NewModule.rotation, v355 = ProtoModule.readFloat(Buf, v15)
			elseif Tag == 3 then
				NewModule.scale, v355 = ProtoModule.readFloat(Buf, v15)
			else
				local _
				_, v355 = ProtoModule.readFixed32(Buf, v15)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v355 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.position ~= nil then
		t.position = self.position:jsonEncode()
	end
	if self.rotation ~= nil and self.rotation ~= 0 then
		t.rotation = ProtoModule.json.serializeNumber(self.rotation)
	end
	if self.scale ~= nil and self.scale ~= 0 then
		t.scale = ProtoModule.json.serializeNumber(self.scale)
	end
	return t
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), Label (copy), ProtoModule (copy)
	local NewModule = Module14.new()
	
	if self.position ~= nil then
		NewModule.position = Label.Vec2.jsonDecode(self.position)
	end
	if self.rotation ~= nil then
		NewModule.rotation = ProtoModule.json.deserializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		NewModule.scale = ProtoModule.json.deserializeNumber(self.scale)
	end
	return NewModule
end

Module14.descriptor = {
	name = "Transform",
	fullName = "roblox.posts.postasset.v1.Transform"
}
Label.Transform = Module14
TypeRegistryModule.default:register(Label.Transform)
local Module15 = {}
Module15.__index = Module15

function Module15.new(Vector)
	-- upvalues: Module15 (copy)
	return (setmetatable({
		x = if Vector == nil or Vector.x == nil then 0 else Vector.x,
		y = if Vector == nil or Vector.y == nil then 0 else Vector.y
	}, Module15))
end

function Module15:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.x ~= nil and self.x ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult, WriteTagResult2, self.x)
	end
	if self.y ~= nil and self.y ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.y)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v373 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v373 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
			v16 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 1 then
				NewModule.x, v373 = ProtoModule.readFloat(Buf, v16)
			elseif Tag == 2 then
				NewModule.y, v373 = ProtoModule.readFloat(Buf, v16)
			else
				local _
				_, v373 = ProtoModule.readFixed32(Buf, v16)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v373 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.x ~= nil and self.x ~= 0 then
		t.x = ProtoModule.json.serializeNumber(self.x)
	end
	if self.y ~= nil and self.y ~= 0 then
		t.y = ProtoModule.json.serializeNumber(self.y)
	end
	return t
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy), ProtoModule (copy)
	local NewModule = Module15.new()
	
	if self.x ~= nil then
		NewModule.x = ProtoModule.json.deserializeNumber(self.x)
	end
	if self.y ~= nil then
		NewModule.y = ProtoModule.json.deserializeNumber(self.y)
	end
	return NewModule
end

Module15.descriptor = {
	name = "Vec2",
	fullName = "roblox.posts.postasset.v1.Vec2"
}
Label.Vec2 = Module15
TypeRegistryModule.default:register(Label.Vec2)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: Module16 (copy)
	return (setmetatable({
		r = if p1 == nil or p1.r == nil then 0 else p1.r,
		g = if p1 == nil or p1.g == nil then 0 else p1.g,
		b = if p1 == nil or p1.b == nil then 0 else p1.b
	}, Module16))
end

function Module16:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.r ~= nil and self.r ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult, WriteTagResult2, self.r)
	end
	if self.g ~= nil and self.g ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.g)
	end
	if self.b ~= nil and self.b ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult3, WriteTagResult2_2, self.b)
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
		Tag, Tag2, v392 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v392 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
			v17 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 1 then
				NewModule.r, v392 = ProtoModule.readFloat(Buf, v17)
			elseif Tag == 2 then
				NewModule.g, v392 = ProtoModule.readFloat(Buf, v17)
			elseif Tag == 3 then
				NewModule.b, v392 = ProtoModule.readFloat(Buf, v17)
			else
				local _
				_, v392 = ProtoModule.readFixed32(Buf, v17)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v392 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.r ~= nil and self.r ~= 0 then
		t.r = ProtoModule.json.serializeNumber(self.r)
	end
	if self.g ~= nil and self.g ~= 0 then
		t.g = ProtoModule.json.serializeNumber(self.g)
	end
	if self.b ~= nil and self.b ~= 0 then
		t.b = ProtoModule.json.serializeNumber(self.b)
	end
	return t
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy), ProtoModule (copy)
	local NewModule = Module16.new()
	
	if self.r ~= nil then
		NewModule.r = ProtoModule.json.deserializeNumber(self.r)
	end
	if self.g ~= nil then
		NewModule.g = ProtoModule.json.deserializeNumber(self.g)
	end
	if self.b ~= nil then
		NewModule.b = ProtoModule.json.deserializeNumber(self.b)
	end
	return NewModule
end

Module16.descriptor = {
	name = "Color3",
	fullName = "roblox.posts.postasset.v1.Color3"
}
Label.Color3 = Module16
TypeRegistryModule.default:register(Label.Color3)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1)
	-- upvalues: Module17 (copy)
	return (setmetatable({
		font_source = if p1 == nil or p1.font_source == nil then nil else p1.font_source
	}, Module17))
end

function Module17:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.font_source ~= nil then
		if self.font_source.type == "enumerated_font" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.EnumeratedFont.toNumber(self.font_source.value))
		elseif self.font_source.type == "family_asset_id" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.font_source.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v409 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v409 = ProtoModule.readVarIntI32(Buf, v18)
				NewModule.font_source = {
					type = "enumerated_font",
					value = Label.EnumeratedFont.fromNumber(VarIntI32) or VarIntI32
				}
			elseif Tag == 2 then
				local VarIntI64
				VarIntI64, v409 = ProtoModule.readVarIntI64(Buf, v18)
				NewModule.font_source = { type = "family_asset_id", value = VarIntI64 }
			else
				local _
				_, v409 = ProtoModule.readVarInt(Buf, v18)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
			v18 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v409 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v409 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.font_source ~= nil then
		if self.font_source.type == "enumerated_font" then
			t.enumeratedFont = if typeof(self.font_source.value) == "number" then self.font_source.value else Label.EnumeratedFont.toNumber(self.font_source.value)
			
			return t
		end
		if self.font_source.type == "family_asset_id" then
			t.familyAssetId = self.font_source.value
		end
	end
	return t
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy), Label (copy)
	local NewModule = Module17.new()
	
	if self.enumerated_font ~= nil then
		NewModule.font_source = {
			type = "enumerated_font",
			value = (if typeof(self.enumerated_font) == "number" then Label.EnumeratedFont.fromNumber(self.enumerated_font) else Label.EnumeratedFont.fromName(self.enumerated_font)) or self.enumerated_font
		}
	end
	if self.enumeratedFont ~= nil then
		NewModule.font_source = {
			type = "enumerated_font",
			value = (if typeof(self.enumeratedFont) == "number" then Label.EnumeratedFont.fromNumber(self.enumeratedFont) else Label.EnumeratedFont.fromName(self.enumeratedFont)) or self.enumeratedFont
		}
	end
	if self.family_asset_id ~= nil then
		NewModule.font_source = { type = "family_asset_id", value = self.family_asset_id }
	end
	if self.familyAssetId ~= nil then
		NewModule.font_source = { type = "family_asset_id", value = self.familyAssetId }
	end
	return NewModule
end

Module17.descriptor = {
	name = "FontInfo",
	fullName = "roblox.posts.postasset.v1.FontInfo"
}
Label.FontInfo = Module17
TypeRegistryModule.default:register(Label.FontInfo)
Label.PostOrigin = {
	fromNumber = function(p1)
		return if p1 == 0 then "POST_ORIGIN_INVALID" elseif p1 == 1 then "POST_ORIGIN_CAPTURE_VIDEO" elseif p1 == 2 then "POST_ORIGIN_CAPTURE_SCREENSHOT" elseif p1 == 3 then "POST_ORIGIN_INFLUENCER_UPLOAD" elseif p1 == 4 then "POST_ORIGIN_AVATAR" else nil
	end,
	toNumber = function(p1)
		return if p1 == "POST_ORIGIN_INVALID" then 0 elseif p1 == "POST_ORIGIN_CAPTURE_VIDEO" then 1 elseif p1 == "POST_ORIGIN_CAPTURE_SCREENSHOT" then 2 elseif p1 == "POST_ORIGIN_INFLUENCER_UPLOAD" then 3 elseif p1 == "POST_ORIGIN_AVATAR" then 4 else p1
	end,
	fromName = function(p1)
		return if p1 == "POST_ORIGIN_INVALID" then "POST_ORIGIN_INVALID" elseif p1 == "POST_ORIGIN_CAPTURE_VIDEO" then "POST_ORIGIN_CAPTURE_VIDEO" elseif p1 == "POST_ORIGIN_CAPTURE_SCREENSHOT" then "POST_ORIGIN_CAPTURE_SCREENSHOT" elseif p1 == "POST_ORIGIN_INFLUENCER_UPLOAD" then "POST_ORIGIN_INFLUENCER_UPLOAD" elseif p1 == "POST_ORIGIN_AVATAR" then "POST_ORIGIN_AVATAR" else nil
	end
}
Label.TrackType = {
	fromNumber = function(p1)
		return if p1 == 0 then "TRACK_TYPE_INVALID" elseif p1 == 1 then "TRACK_TYPE_VISUAL" elseif p1 == 2 then "TRACK_TYPE_AUDIO" elseif p1 == 3 then "TRACK_TYPE_ANNOTATION" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TRACK_TYPE_INVALID" then 0 elseif p1 == "TRACK_TYPE_VISUAL" then 1 elseif p1 == "TRACK_TYPE_AUDIO" then 2 elseif p1 == "TRACK_TYPE_ANNOTATION" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TRACK_TYPE_INVALID" then "TRACK_TYPE_INVALID" elseif p1 == "TRACK_TYPE_VISUAL" then "TRACK_TYPE_VISUAL" elseif p1 == "TRACK_TYPE_AUDIO" then "TRACK_TYPE_AUDIO" elseif p1 == "TRACK_TYPE_ANNOTATION" then "TRACK_TYPE_ANNOTATION" else nil
	end
}
Label.AudioType = {
	fromNumber = function(p1)
		return if p1 == 0 then "AUDIO_TYPE_INVALID" elseif p1 == 1 then "AUDIO_TYPE_MUSIC" elseif p1 == 2 then "AUDIO_TYPE_TTS" elseif p1 == 3 then "AUDIO_TYPE_VOICE_OVER" else nil
	end,
	toNumber = function(p1)
		return if p1 == "AUDIO_TYPE_INVALID" then 0 elseif p1 == "AUDIO_TYPE_MUSIC" then 1 elseif p1 == "AUDIO_TYPE_TTS" then 2 elseif p1 == "AUDIO_TYPE_VOICE_OVER" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "AUDIO_TYPE_INVALID" then "AUDIO_TYPE_INVALID" elseif p1 == "AUDIO_TYPE_MUSIC" then "AUDIO_TYPE_MUSIC" elseif p1 == "AUDIO_TYPE_TTS" then "AUDIO_TYPE_TTS" elseif p1 == "AUDIO_TYPE_VOICE_OVER" then "AUDIO_TYPE_VOICE_OVER" else nil
	end
}
Label.EnumeratedFont = {
	fromNumber = function(p1)
		return if p1 == 0 then "ENUMERATED_FONT_INVALID" elseif p1 == 1 then "ENUMERATED_FONT_GOTHAM_BOLD" elseif p1 == 2 then "ENUMERATED_FONT_GOTHAM_BLACK" elseif p1 == 3 then "ENUMERATED_FONT_SOURCE_SANS" elseif p1 == 4 then "ENUMERATED_FONT_SOURCE_SANS_BOLD" elseif p1 == 5 then "ENUMERATED_FONT_FREDOKA_ONE" elseif p1 == 6 then "ENUMERATED_FONT_BANGERS" elseif p1 == 7 then "ENUMERATED_FONT_BUILDER_SANS_MEDIUM" elseif p1 == 8 then "ENUMERATED_FONT_LUCKIEST_GUY" elseif p1 == 9 then "ENUMERATED_FONT_PERMANENT_MARKER" elseif p1 == 10 then "ENUMERATED_FONT_CREEPSTER" elseif p1 == 11 then "ENUMERATED_FONT_ARCADE" elseif p1 == 12 then "ENUMERATED_FONT_SCI_FI" elseif p1 == 13 then "ENUMERATED_FONT_INDIE_FLOWER" elseif p1 == 14 then "ENUMERATED_FONT_GRENZE_GOTISCH" elseif p1 == 15 then "ENUMERATED_FONT_SPECIAL_ELITE" else nil
	end,
	toNumber = function(p1)
		return if p1 == "ENUMERATED_FONT_INVALID" then 0 elseif p1 == "ENUMERATED_FONT_GOTHAM_BOLD" then 1 elseif p1 == "ENUMERATED_FONT_GOTHAM_BLACK" then 2 elseif p1 == "ENUMERATED_FONT_SOURCE_SANS" then 3 elseif p1 == "ENUMERATED_FONT_SOURCE_SANS_BOLD" then 4 elseif p1 == "ENUMERATED_FONT_FREDOKA_ONE" then 5 elseif p1 == "ENUMERATED_FONT_BANGERS" then 6 elseif p1 == "ENUMERATED_FONT_BUILDER_SANS_MEDIUM" then 7 elseif p1 == "ENUMERATED_FONT_LUCKIEST_GUY" then 8 elseif p1 == "ENUMERATED_FONT_PERMANENT_MARKER" then 9 elseif p1 == "ENUMERATED_FONT_CREEPSTER" then 10 elseif p1 == "ENUMERATED_FONT_ARCADE" then 11 elseif p1 == "ENUMERATED_FONT_SCI_FI" then 12 elseif p1 == "ENUMERATED_FONT_INDIE_FLOWER" then 13 elseif p1 == "ENUMERATED_FONT_GRENZE_GOTISCH" then 14 elseif p1 == "ENUMERATED_FONT_SPECIAL_ELITE" then 15 else p1
	end,
	fromName = function(p1)
		return if p1 == "ENUMERATED_FONT_INVALID" then "ENUMERATED_FONT_INVALID" elseif p1 == "ENUMERATED_FONT_GOTHAM_BOLD" then "ENUMERATED_FONT_GOTHAM_BOLD" elseif p1 == "ENUMERATED_FONT_GOTHAM_BLACK" then "ENUMERATED_FONT_GOTHAM_BLACK" elseif p1 == "ENUMERATED_FONT_SOURCE_SANS" then "ENUMERATED_FONT_SOURCE_SANS" elseif p1 == "ENUMERATED_FONT_SOURCE_SANS_BOLD" then "ENUMERATED_FONT_SOURCE_SANS_BOLD" elseif p1 == "ENUMERATED_FONT_FREDOKA_ONE" then "ENUMERATED_FONT_FREDOKA_ONE" elseif p1 == "ENUMERATED_FONT_BANGERS" then "ENUMERATED_FONT_BANGERS" elseif p1 == "ENUMERATED_FONT_BUILDER_SANS_MEDIUM" then "ENUMERATED_FONT_BUILDER_SANS_MEDIUM" elseif p1 == "ENUMERATED_FONT_LUCKIEST_GUY" then "ENUMERATED_FONT_LUCKIEST_GUY" elseif p1 == "ENUMERATED_FONT_PERMANENT_MARKER" then "ENUMERATED_FONT_PERMANENT_MARKER" elseif p1 == "ENUMERATED_FONT_CREEPSTER" then "ENUMERATED_FONT_CREEPSTER" elseif p1 == "ENUMERATED_FONT_ARCADE" then "ENUMERATED_FONT_ARCADE" elseif p1 == "ENUMERATED_FONT_SCI_FI" then "ENUMERATED_FONT_SCI_FI" elseif p1 == "ENUMERATED_FONT_INDIE_FLOWER" then "ENUMERATED_FONT_INDIE_FLOWER" elseif p1 == "ENUMERATED_FONT_GRENZE_GOTISCH" then "ENUMERATED_FONT_GRENZE_GOTISCH" elseif p1 == "ENUMERATED_FONT_SPECIAL_ELITE" then "ENUMERATED_FONT_SPECIAL_ELITE" else nil
	end
}
Label.TextXAlignment = {
	fromNumber = function(p1)
		return if p1 == 0 then "TEXT_X_ALIGNMENT_INVALID" elseif p1 == 1 then "TEXT_X_ALIGNMENT_LEFT" elseif p1 == 2 then "TEXT_X_ALIGNMENT_CENTER" elseif p1 == 3 then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TEXT_X_ALIGNMENT_INVALID" then 0 elseif p1 == "TEXT_X_ALIGNMENT_LEFT" then 1 elseif p1 == "TEXT_X_ALIGNMENT_CENTER" then 2 elseif p1 == "TEXT_X_ALIGNMENT_RIGHT" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TEXT_X_ALIGNMENT_INVALID" then "TEXT_X_ALIGNMENT_INVALID" elseif p1 == "TEXT_X_ALIGNMENT_LEFT" then "TEXT_X_ALIGNMENT_LEFT" elseif p1 == "TEXT_X_ALIGNMENT_CENTER" then "TEXT_X_ALIGNMENT_CENTER" elseif p1 == "TEXT_X_ALIGNMENT_RIGHT" then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end
}

return {
	Post = Label.Post,
	PostMetadata = Label.PostMetadata,
	Track = Label.Track,
	Slot = Label.Slot,
	VisualSlot = Label.VisualSlot,
	VideoSlot = Label.VideoSlot,
	ImageSlot = Label.ImageSlot,
	TextLabelSlot = Label.TextLabelSlot,
	SceneSlot = Label.SceneSlot,
	AudioSlot = Label.AudioSlot,
	TtsAudioContext = Label.TtsAudioContext,
	ExperienceAnnotationSlot = Label.ExperienceAnnotationSlot,
	AvatarAnnotationSlot = Label.AvatarAnnotationSlot,
	TimeRange = Label.TimeRange,
	Transform = Label.Transform,
	Vec2 = Label.Vec2,
	Color3 = Label.Color3,
	FontInfo = Label.FontInfo,
	PostOrigin = Label.PostOrigin,
	TrackType = Label.TrackType,
	AudioType = Label.AudioType,
	EnumeratedFont = Label.EnumeratedFont,
	TextXAlignment = Label.TextXAlignment
}