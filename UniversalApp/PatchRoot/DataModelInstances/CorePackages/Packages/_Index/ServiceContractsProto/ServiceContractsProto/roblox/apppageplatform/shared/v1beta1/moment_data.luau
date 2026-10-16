local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 258 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		moment_id = if p1 == nil or p1.moment_id == nil then nil else p1.moment_id,
		asset_id = if p1 == nil or p1.asset_id == nil then nil else p1.asset_id,
		creator_id = if p1 == nil or p1.creator_id == nil then nil else p1.creator_id,
		status = if p1 == nil or p1.status == nil then nil else p1.status,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, Module))
end

function Module:encode() --[[ Line: 268 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.moment_id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.moment_id)
	end
	if self.asset_id ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.asset_id)
	end
	if self.creator_id ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.creator_id)
	end
	if self.status ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.status)
	end
	if self.metadata ~= nil then
		local EncodeResult = self.metadata:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 303 ]]
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v24 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v24 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v24 = ProtoModule.readBuffer(Buf, v1)
				NewModule.moment_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v24 = ProtoModule.readBuffer(Buf, v1)
				NewModule.asset_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v24 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v24 = ProtoModule.readBuffer(Buf, v1)
				NewModule.status = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v24 = ProtoModule.readBuffer(Buf, v1)
				NewModule.metadata = t.MomentData_MomentMetadata.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v24 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v24 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 366 ]]
	local t = {}
	
	if self.moment_id ~= nil then
		t.momentId = self.moment_id
	end
	if self.asset_id ~= nil then
		t.assetId = self.asset_id
	end
	if self.creator_id ~= nil then
		t.creatorId = self.creator_id
	end
	if self.status ~= nil then
		t.status = self.status
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 392 ]]
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.moment_id ~= nil then
		NewModule.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		NewModule.moment_id = self.momentId
	end
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.creator_id ~= nil then
		NewModule.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		NewModule.creator_id = self.creatorId
	end
	if self.status ~= nil then
		NewModule.status = self.status
	end
	if self.metadata ~= nil then
		NewModule.metadata = t.MomentData_MomentMetadata.jsonDecode(self.metadata)
	end
	return NewModule
end

Module.descriptor = {
	name = "MomentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentData"
}
t.MomentData = Module
TypeRegistryModule.default:register(t.MomentData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 444 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		asset_total_duration_seconds = if p1 == nil or p1.asset_total_duration_seconds == nil then nil else p1.asset_total_duration_seconds,
		capture_type = if p1 == nil or p1.capture_type == nil then nil else p1.capture_type,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		capture_universe_id = if p1 == nil or p1.capture_universe_id == nil then nil else p1.capture_universe_id,
		capture_place_id = if p1 == nil or p1.capture_place_id == nil then nil else p1.capture_place_id,
		edits = if p1 == nil or p1.edits == nil then nil else p1.edits
	}, Module1))
end

function Module1:encode() --[[ Line: 461 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_total_duration_seconds ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult, WriteTagResult2, self.asset_total_duration_seconds)
	end
	if self.capture_type ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.capture_type)
	end
	if self.description ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.capture_universe_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.capture_universe_id)
	end
	if self.capture_place_id ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.capture_place_id)
	end
	if self.edits ~= nil then
		local EncodeResult = self.edits:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 501 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v55 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v55 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v55 = ProtoModule.readBuffer(Buf, v2)
				NewModule.capture_type = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v55 = ProtoModule.readBuffer(Buf, v2)
				NewModule.description = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v55 = ProtoModule.readBuffer(Buf, v2)
				NewModule.capture_universe_id = buffer.tostring(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v55 = ProtoModule.readBuffer(Buf, v2)
				NewModule.capture_place_id = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v55 = ProtoModule.readBuffer(Buf, v2)
				NewModule.edits = t.MomentData_MomentMetadata_MomentEdits.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 1 then
				NewModule.asset_total_duration_seconds, v55 = ProtoModule.readFloat(Buf, v2)
			else
				local _
				_, v55 = ProtoModule.readFixed32(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v55 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 569 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.asset_total_duration_seconds ~= nil then
		t.assetTotalDurationSeconds = ProtoModule.json.serializeNumber(self.asset_total_duration_seconds)
	end
	if self.capture_type ~= nil then
		t.captureType = self.capture_type
	end
	if self.description ~= nil then
		t.description = self.description
	end
	if self.capture_universe_id ~= nil then
		t.captureUniverseId = self.capture_universe_id
	end
	if self.capture_place_id ~= nil then
		t.capturePlaceId = self.capture_place_id
	end
	if self.edits ~= nil then
		t.edits = self.edits:jsonEncode()
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 599 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	
	if self.asset_total_duration_seconds ~= nil then
		NewModule.asset_total_duration_seconds = ProtoModule.json.deserializeNumber(self.asset_total_duration_seconds)
	end
	if self.assetTotalDurationSeconds ~= nil then
		NewModule.asset_total_duration_seconds = ProtoModule.json.deserializeNumber(self.assetTotalDurationSeconds)
	end
	if self.capture_type ~= nil then
		NewModule.capture_type = self.capture_type
	end
	if self.captureType ~= nil then
		NewModule.capture_type = self.captureType
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.capture_universe_id ~= nil then
		NewModule.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		NewModule.capture_universe_id = self.captureUniverseId
	end
	if self.capture_place_id ~= nil then
		NewModule.capture_place_id = self.capture_place_id
	end
	if self.capturePlaceId ~= nil then
		NewModule.capture_place_id = self.capturePlaceId
	end
	if self.edits ~= nil then
		NewModule.edits = t.MomentData_MomentMetadata_MomentEdits.jsonDecode(self.edits)
	end
	return NewModule
end

Module1.descriptor = {
	name = "MomentData_MomentMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentMetadata"
}
t.MomentData_MomentMetadata = Module1
TypeRegistryModule.default:register(t.MomentData_MomentMetadata)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 659 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		music = if p1 == nil or p1.music == nil then nil else p1.music,
		trim = if p1 == nil or p1.trim == nil then nil else p1.trim,
		text_overlays = if p1 == nil or p1.text_overlays == nil then {} else p1.text_overlays
	}, Module2))
end

function Module2:encode() --[[ Line: 669 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.music ~= nil then
		local EncodeResult = self.music:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.trim ~= nil then
		local EncodeResult = self.trim:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.text_overlays ~= nil and #self.text_overlays > 0 then
		for _, textOverlay in self.text_overlays do
			local EncodeResult = textOverlay:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 698 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v82 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v82 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v82 = ProtoModule.readBuffer(Buf, v3)
				NewModule.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v82 = ProtoModule.readBuffer(Buf, v3)
				NewModule.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v82 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.text_overlays, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v82 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v82 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 754 ]]
	local t = {}
	
	if self.music ~= nil then
		t.music = self.music:jsonEncode()
	end
	if self.trim ~= nil then
		t.trim = self.trim:jsonEncode()
	end
	if self.text_overlays ~= nil and #self.text_overlays > 0 then
		local TextOverlays = {}
		
		for _, textOverlay in self.text_overlays do
			table.insert(TextOverlays, textOverlay:jsonEncode())
		end
		t.textOverlays = TextOverlays
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 776 ]]
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.music ~= nil then
		NewModule.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.jsonDecode(self.music)
	end
	if self.trim ~= nil then
		NewModule.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.jsonDecode(self.trim)
	end
	if self.text_overlays ~= nil then
		local Text_overlays = {}
		
		for _, textOverlay in self.text_overlays do
			table.insert(Text_overlays, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(textOverlay))
		end
		NewModule.text_overlays = Text_overlays
	end
	if self.textOverlays ~= nil then
		local Text_overlays = {}
		
		for _, textOverlay1 in self.textOverlays do
			table.insert(Text_overlays, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(textOverlay1))
		end
		NewModule.text_overlays = Text_overlays
	end
	return NewModule
end

Module2.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEdits"
}
t.MomentData_MomentMetadata_MomentEdits = Module2
TypeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 824 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then nil else p1.asset_id,
		start_time_seconds = if p1 == nil or p1.start_time_seconds == nil then nil else p1.start_time_seconds
	}, Module3))
end

function Module3:encode() --[[ Line: 833 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.asset_id)
	end
	if self.start_time_seconds ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.start_time_seconds)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 854 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v105 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v105 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v105 = ProtoModule.readBuffer(Buf, v4)
				NewModule.asset_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 2 then
				NewModule.start_time_seconds, v105 = ProtoModule.readFloat(Buf, v4)
			else
				local _
				_, v105 = ProtoModule.readFixed32(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v105 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 904 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id
	end
	if self.start_time_seconds ~= nil then
		t.startTimeSeconds = ProtoModule.json.serializeNumber(self.start_time_seconds)
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 920 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		NewModule.asset_id = self.assetId
	end
	if self.start_time_seconds ~= nil then
		NewModule.start_time_seconds = ProtoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		NewModule.start_time_seconds = ProtoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	return NewModule
end

Module3.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_MusicEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.MusicEdit"
}
t.MomentData_MomentMetadata_MomentEdits_MusicEdit = Module3
TypeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_MusicEdit)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 959 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		start_time_seconds = if p1 == nil or p1.start_time_seconds == nil then nil else p1.start_time_seconds,
		end_time_seconds = if p1 == nil or p1.end_time_seconds == nil then nil else p1.end_time_seconds
	}, Module4))
end

function Module4:encode() --[[ Line: 968 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.start_time_seconds ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult, WriteTagResult2, self.start_time_seconds)
	end
	if self.end_time_seconds ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.end_time_seconds)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 989 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v123 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v123 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
			v5 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 1 then
				NewModule.start_time_seconds, v123 = ProtoModule.readFloat(Buf, v5)
			elseif Tag == 2 then
				NewModule.end_time_seconds, v123 = ProtoModule.readFloat(Buf, v5)
			else
				local _
				_, v123 = ProtoModule.readFixed32(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v123 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1039 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.start_time_seconds ~= nil then
		t.startTimeSeconds = ProtoModule.json.serializeNumber(self.start_time_seconds)
	end
	if self.end_time_seconds ~= nil then
		t.endTimeSeconds = ProtoModule.json.serializeNumber(self.end_time_seconds)
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1055 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	
	if self.start_time_seconds ~= nil then
		NewModule.start_time_seconds = ProtoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		NewModule.start_time_seconds = ProtoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	if self.end_time_seconds ~= nil then
		NewModule.end_time_seconds = ProtoModule.json.deserializeNumber(self.end_time_seconds)
	end
	if self.endTimeSeconds ~= nil then
		NewModule.end_time_seconds = ProtoModule.json.deserializeNumber(self.endTimeSeconds)
	end
	return NewModule
end

Module4.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TrimEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.TrimEdit"
}
t.MomentData_MomentMetadata_MomentEdits_TrimEdit = Module4
TypeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TrimEdit)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1094 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		position = if p1 == nil or p1.position == nil then {} else p1.position,
		rotation = if p1 == nil or p1.rotation == nil then nil else p1.rotation,
		scale = if p1 == nil or p1.scale == nil then nil else p1.scale,
		text = if p1 == nil or p1.text == nil then nil else p1.text,
		style = if p1 == nil or p1.style == nil then nil else p1.style,
		z_index = if p1 == nil or p1.z_index == nil then nil else p1.z_index
	}, Module5))
end

function Module5:encode() --[[ Line: 1110 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.position ~= nil and #self.position > 0 then
		local Buf1 = buffer.create(0)
		local v6 = 0
		
		for _, value in self.position do
			Buf1, v135 = ProtoModule.writeFloat(Buf1, v6, value)
		end
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, Buf1, v6)
	end
	if self.rotation ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.rotation)
	end
	if self.scale ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult3, WriteTagResult2_2, self.scale)
	end
	if self.text ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.text)
	end
	if self.style ~= nil then
		local EncodeResult = self.style:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.z_index ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.z_index)
	end
	local Buf2 = buffer.create(Count)
	buffer.copy(Buf2, 0, Buf, 0, Count)
	
	return Buf2
end

function Module5.decode(Buf) --[[ Line: 1159 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v151 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				NewModule.z_index, v151 = ProtoModule.readVarIntI32(Buf, v7)
			else
				local _
				_, v151 = ProtoModule.readVarInt(Buf, v7)
			end
		else
			if Tag2 == ProtoModule.wireTypes.lengthDelimited then
				if Tag == 1 then
					local VarInt
					VarInt, v151 = ProtoModule.readVarInt(Buf, v7)
					local NewVarInt = v7 + VarInt
					while v7 < NewVarInt do
						local Float
						Float, v151 = ProtoModule.readFloat(Buf, v7)
						table.insert(NewModule.position, Float)
					end
				elseif Tag == 4 then
					local Buffer1
					Buffer1, v151 = ProtoModule.readBuffer(Buf, v7)
					NewModule.text = buffer.tostring(Buffer1)
				elseif Tag == 5 then
					local Buffer2
					Buffer2, v151 = ProtoModule.readBuffer(Buf, v7)
					NewModule.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.decode(Buffer2)
				else
					local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v7)
					v7 = VarInt2 + VarInt1
				end
			elseif Tag2 == ProtoModule.wireTypes.i32 then
				if Tag == 1 then
					local Float1
					Float1, v151 = ProtoModule.readFloat(Buf, v7)
					table.insert(NewModule.position, Float1)
				elseif Tag == 2 then
					NewModule.rotation, v151 = ProtoModule.readFloat(Buf, v7)
				elseif Tag == 3 then
					NewModule.scale, v151 = ProtoModule.readFloat(Buf, v7)
				else
					local _
					_, v151 = ProtoModule.readFixed32(Buf, v7)
				end
			elseif Tag2 == ProtoModule.wireTypes.i64 then
				local _
				_, v151 = ProtoModule.readFixed64(Buf, v7)
			else
				error("Unsupported wire type: " .. Tag2)
			end
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1242 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.position ~= nil and #self.position > 0 then
		local Position = {}
		
		for _, value in self.position do
			table.insert(Position, ProtoModule.json.serializeNumber(value))
		end
		t.position = Position
	end
	if self.rotation ~= nil then
		t.rotation = ProtoModule.json.serializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		t.scale = ProtoModule.json.serializeNumber(self.scale)
	end
	if self.text ~= nil then
		t.text = self.text
	end
	if self.style ~= nil then
		t.style = self.style:jsonEncode()
	end
	if self.z_index ~= nil then
		t.zIndex = self.z_index
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1278 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.position ~= nil then
		local Position = {}
		
		for _, value in self.position do
			table.insert(Position, ProtoModule.json.deserializeNumber(value))
		end
		NewModule.position = Position
	end
	if self.rotation ~= nil then
		NewModule.rotation = ProtoModule.json.deserializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		NewModule.scale = ProtoModule.json.deserializeNumber(self.scale)
	end
	if self.text ~= nil then
		NewModule.text = self.text
	end
	if self.style ~= nil then
		NewModule.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.jsonDecode(self.style)
	end
	if self.z_index ~= nil then
		NewModule.z_index = self.z_index
	end
	if self.zIndex ~= nil then
		NewModule.z_index = self.zIndex
	end
	return NewModule
end

Module5.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TextOverlay",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextOverlay"
}
t.MomentData_MomentMetadata_MomentEdits_TextOverlay = Module5
TypeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TextOverlay)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1335 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		font = if p1 == nil or p1.font == nil then nil else p1.font,
		font_color = if p1 == nil or p1.font_color == nil then {} else p1.font_color,
		font_size = if p1 == nil or p1.font_size == nil then nil else p1.font_size,
		text_x_alignment = if p1 == nil or p1.text_x_alignment == nil then nil else p1.text_x_alignment
	}, Module6))
end

function Module6:encode() --[[ Line: 1349 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.font ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.font)
	end
	if self.font_color ~= nil and #self.font_color > 0 then
		local Buf1 = buffer.create(0)
		local v8 = 0
		
		for _, value in self.font_color do
			Buf1, v173 = ProtoModule.writeFloat(Buf1, v8, value)
		end
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, Buf1, v8)
	end
	if self.font_size ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult3, WriteTagResult2_2, self.font_size)
	end
	if self.text_x_alignment ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.text_x_alignment)
	end
	local Buf2 = buffer.create(Count)
	buffer.copy(Buf2, 0, Buf, 0, Count)
	
	return Buf2
end

function Module6.decode(Buf) --[[ Line: 1387 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v182 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v182 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v182 = ProtoModule.readBuffer(Buf, v9)
				NewModule.font = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local VarInt
				VarInt, v182 = ProtoModule.readVarInt(Buf, v9)
				local NewVarInt = v9 + VarInt
				while v9 < NewVarInt do
					local Float
					Float, v182 = ProtoModule.readFloat(Buf, v9)
					table.insert(NewModule.font_color, Float)
				end
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v182 = ProtoModule.readBuffer(Buf, v9)
				NewModule.text_x_alignment = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 2 then
				local Float1
				Float1, v182 = ProtoModule.readFloat(Buf, v9)
				table.insert(NewModule.font_color, Float1)
			elseif Tag == 3 then
				NewModule.font_size, v182 = ProtoModule.readFloat(Buf, v9)
			else
				local _
				_, v182 = ProtoModule.readFixed32(Buf, v9)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v182 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1460 ]]
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.font ~= nil then
		t.font = self.font
	end
	if self.font_color ~= nil and #self.font_color > 0 then
		local FontColor = {}
		
		for _, value in self.font_color do
			table.insert(FontColor, ProtoModule.json.serializeNumber(value))
		end
		t.fontColor = FontColor
	end
	if self.font_size ~= nil then
		t.fontSize = ProtoModule.json.serializeNumber(self.font_size)
	end
	if self.text_x_alignment ~= nil then
		t.textXAlignment = self.text_x_alignment
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1488 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	
	if self.font ~= nil then
		NewModule.font = self.font
	end
	if self.font_color ~= nil then
		local Font_color = {}
		
		for _, value in self.font_color do
			table.insert(Font_color, ProtoModule.json.deserializeNumber(value))
		end
		NewModule.font_color = Font_color
	end
	if self.fontColor ~= nil then
		local Font_color = {}
		
		for _, value1 in self.fontColor do
			table.insert(Font_color, ProtoModule.json.deserializeNumber(value1))
		end
		NewModule.font_color = Font_color
	end
	if self.font_size ~= nil then
		NewModule.font_size = ProtoModule.json.deserializeNumber(self.font_size)
	end
	if self.fontSize ~= nil then
		NewModule.font_size = ProtoModule.json.deserializeNumber(self.fontSize)
	end
	if self.text_x_alignment ~= nil then
		NewModule.text_x_alignment = self.text_x_alignment
	end
	if self.textXAlignment ~= nil then
		NewModule.text_x_alignment = self.textXAlignment
	end
	return NewModule
end

Module6.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TextOverlay_Style",
	fullName = "roblox.apppageplatform.shared.v1beta1.Style"
}
t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style = Module6
TypeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style)

return {
	MomentData = t.MomentData,
	MomentData_MomentMetadata = t.MomentData_MomentMetadata,
	MomentData_MomentMetadata_MomentEdits = t.MomentData_MomentMetadata_MomentEdits,
	MomentData_MomentMetadata_MomentEdits_MusicEdit = t.MomentData_MomentMetadata_MomentEdits_MusicEdit,
	MomentData_MomentMetadata_MomentEdits_TrimEdit = t.MomentData_MomentMetadata_MomentEdits_TrimEdit,
	MomentData_MomentMetadata_MomentEdits_TextOverlay = t.MomentData_MomentMetadata_MomentEdits_TextOverlay,
	MomentData_MomentMetadata_MomentEdits_TextOverlay_Style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style
}