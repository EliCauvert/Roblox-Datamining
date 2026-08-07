-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:36 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 258 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		moment_id = if p0 == nil or p0.moment_id == nil then nil else p0.moment_id,
		asset_id = if p0 == nil or p0.asset_id == nil then nil else p0.asset_id,
		creator_id = if p0 == nil or p0.creator_id == nil then nil else p0.creator_id,
		status = if p0 == nil or p0.status == nil then nil else p0.status,
		metadata = if p0 == nil or p0.metadata == nil then nil else p0.metadata
	}, t_1)
end

function t_1:encode() --[[ line: 268 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.moment_id ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.moment_id)
		buff = var12
		var11 = var13
	end
	if self.asset_id ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var11, 2, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.asset_id)
		buff = var14
		var11 = var15
	end
	if self.creator_id ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var11, 3, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeString(var16, var17, self.creator_id)
		buff = var16
		var11 = var17
	end
	if self.status ~= nil then
		local var18, var19 = protoModule.writeTag(buff, var11, 4, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.status)
		buff = var18
		var11 = var19
	end
	if self.metadata ~= nil then
		local var20 = self.metadata:encode()
		local var21, var22 = protoModule.writeTag(buff, var11, 5, protoModule.wireTypes.lengthDelimited)
		var21, var22 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var11 = var22
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 303 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var24 = t_1.new()
	local var25 = 0
	while var25 < buffer.len(p1) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p1, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			local _ = nil
			local var31, var32 = protoModule.readVarInt(p1, var25)
			local _ = var31
			var25 = var32
			continue
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 1 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var25)
				var25 = var34
				var24.moment_id = buffer.tostring(var33)
			elseif var30 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var25)
				var25 = var36
				var24.asset_id = buffer.tostring(var35)
			elseif var30 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var25)
				var25 = var38
				var24.creator_id = buffer.tostring(var37)
			elseif var30 == 4 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var25)
				var25 = var40
				var24.status = buffer.tostring(var39)
			elseif var30 == 5 then
				local _ = nil
				local var41, var42 = protoModule.readBuffer(p1, var25)
				var25 = var42
				var24.metadata = t.MomentData_MomentMetadata.decode(var41)
			else
				local _ = nil
				local var43, var44 = protoModule.readVarInt(p1, var25)
				var25 = var44 + var43
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var45, var46 = protoModule.readFixed32(p1, var25)
			local _ = var45
			var25 = var46
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var47, var48 = protoModule.readFixed64(p1, var25)
			local _ = var47
			var25 = var48
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var24
end

function t_1:jsonEncode() --[[ line: 366 ]]
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

function t_1:jsonDecode() --[[ line: 392 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var50 = t_1.new()
	
	if self.moment_id ~= nil then
		var50.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var50.moment_id = self.momentId
	end
	if self.asset_id ~= nil then
		var50.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var50.asset_id = self.assetId
	end
	if self.creator_id ~= nil then
		var50.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var50.creator_id = self.creatorId
	end
	if self.status ~= nil then
		var50.status = self.status
	end
	if self.metadata ~= nil then
		var50.metadata = t.MomentData_MomentMetadata.jsonDecode(self.metadata)
	end
	return var50
end

t_1.descriptor = {
	name = "MomentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentData"
}
t.MomentData = t_1
typeRegistryModule.default:register(t.MomentData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 444 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		asset_total_duration_seconds = if p2 == nil or p2.asset_total_duration_seconds == nil then nil else p2.asset_total_duration_seconds,
		capture_type = if p2 == nil or p2.capture_type == nil then nil else p2.capture_type,
		description = if p2 == nil or p2.description == nil then nil else p2.description,
		capture_universe_id = if p2 == nil or p2.capture_universe_id == nil then nil else p2.capture_universe_id,
		capture_place_id = if p2 == nil or p2.capture_place_id == nil then nil else p2.capture_place_id,
		edits = if p2 == nil or p2.edits == nil then nil else p2.edits
	}, t_2)
end

function t_2:encode() --[[ line: 461 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var52 = 0
	
	if self.asset_total_duration_seconds ~= nil then
		local var53, var54 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.i32)
		var53, var54 = protoModule.writeFloat(var53, var54, self.asset_total_duration_seconds)
		buff = var53
		var52 = var54
	end
	if self.capture_type ~= nil then
		local var55, var56 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.lengthDelimited)
		var55, var56 = protoModule.writeString(var55, var56, self.capture_type)
		buff = var55
		var52 = var56
	end
	if self.description ~= nil then
		local var57, var58 = protoModule.writeTag(buff, var52, 3, protoModule.wireTypes.lengthDelimited)
		var57, var58 = protoModule.writeString(var57, var58, self.description)
		buff = var57
		var52 = var58
	end
	if self.capture_universe_id ~= nil then
		local var59, var60 = protoModule.writeTag(buff, var52, 4, protoModule.wireTypes.lengthDelimited)
		var59, var60 = protoModule.writeString(var59, var60, self.capture_universe_id)
		buff = var59
		var52 = var60
	end
	if self.capture_place_id ~= nil then
		local var61, var62 = protoModule.writeTag(buff, var52, 5, protoModule.wireTypes.lengthDelimited)
		var61, var62 = protoModule.writeString(var61, var62, self.capture_place_id)
		buff = var61
		var52 = var62
	end
	if self.edits ~= nil then
		local var63 = self.edits:encode()
		local var64, var65 = protoModule.writeTag(buff, var52, 6, protoModule.wireTypes.lengthDelimited)
		var64, var65 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
		buff = var64
		var52 = var65
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 501 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var67 = t_2.new()
	local var68 = 0
	while var68 < buffer.len(p3) do
		local _ = nil
		local var69 = nil
		local var70, var71, var72 = protoModule.readTag(p3, var68)
		local var73 = var70
		var69 = var71
		var68 = var72
		
		if var69 == protoModule.wireTypes.varint then
			local _ = nil
			local var74, var75 = protoModule.readVarInt(p3, var68)
			local _ = var74
			var68 = var75
			continue
		end
		if var69 == protoModule.wireTypes.lengthDelimited then
			if var73 == 2 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p3, var68)
				var68 = var77
				var67.capture_type = buffer.tostring(var76)
			elseif var73 == 3 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var68)
				var68 = var79
				var67.description = buffer.tostring(var78)
			elseif var73 == 4 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var68)
				var68 = var81
				var67.capture_universe_id = buffer.tostring(var80)
			elseif var73 == 5 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var68)
				var68 = var83
				var67.capture_place_id = buffer.tostring(var82)
			elseif var73 == 6 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var68)
				var68 = var85
				var67.edits = t.MomentData_MomentMetadata_MomentEdits.decode(var84)
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p3, var68)
				var68 = var87 + var86
			end
		elseif var69 == protoModule.wireTypes.i32 then
			if var73 == 1 then
				local _ = nil
				local var88, var89 = protoModule.readFloat(p3, var68)
				var68 = var89
				var67.asset_total_duration_seconds = var88
			else
				local _ = nil
				local var90, var91 = protoModule.readFixed32(p3, var68)
				local _ = var90
				var68 = var91
			end
		elseif var69 == protoModule.wireTypes.i64 then
			local _ = nil
			local var92, var93 = protoModule.readFixed64(p3, var68)
			local _ = var92
			var68 = var93
		else
			error("Unsupported wire type: " .. var69)
		end
	end
	return var67
end

function t_2:jsonEncode() --[[ line: 569 ]]
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.asset_total_duration_seconds ~= nil then
		t.assetTotalDurationSeconds = protoModule.json.serializeNumber(self.asset_total_duration_seconds)
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

function t_2:jsonDecode() --[[ line: 599 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var95 = t_2.new()
	
	if self.asset_total_duration_seconds ~= nil then
		var95.asset_total_duration_seconds = protoModule.json.deserializeNumber(self.asset_total_duration_seconds)
	end
	if self.assetTotalDurationSeconds ~= nil then
		var95.asset_total_duration_seconds = protoModule.json.deserializeNumber(self.assetTotalDurationSeconds)
	end
	if self.capture_type ~= nil then
		var95.capture_type = self.capture_type
	end
	if self.captureType ~= nil then
		var95.capture_type = self.captureType
	end
	if self.description ~= nil then
		var95.description = self.description
	end
	if self.capture_universe_id ~= nil then
		var95.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var95.capture_universe_id = self.captureUniverseId
	end
	if self.capture_place_id ~= nil then
		var95.capture_place_id = self.capture_place_id
	end
	if self.capturePlaceId ~= nil then
		var95.capture_place_id = self.capturePlaceId
	end
	if self.edits ~= nil then
		var95.edits = t.MomentData_MomentMetadata_MomentEdits.jsonDecode(self.edits)
	end
	return var95
end

t_2.descriptor = {
	name = "MomentData_MomentMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentMetadata"
}
t.MomentData_MomentMetadata = t_2
typeRegistryModule.default:register(t.MomentData_MomentMetadata)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 659 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		music = if p4 == nil or p4.music == nil then nil else p4.music,
		trim = if p4 == nil or p4.trim == nil then nil else p4.trim,
		text_overlays = if p4 == nil or p4.text_overlays == nil then {} else p4.text_overlays
	}, t_3)
end

function t_3:encode() --[[ line: 669 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var97 = 0
	
	if self.music ~= nil then
		local var98 = self.music:encode()
		local var99, var100 = protoModule.writeTag(buff, var97, 1, protoModule.wireTypes.lengthDelimited)
		var99, var100 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
		buff = var99
		var97 = var100
	end
	if self.trim ~= nil then
		local var101 = self.trim:encode()
		local var102, var103 = protoModule.writeTag(buff, var97, 2, protoModule.wireTypes.lengthDelimited)
		var102, var103 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
		buff = var102
		var97 = var103
	end
	if self.text_overlays ~= nil and #self.text_overlays > 0 then
		for i, v in self.text_overlays do
			local var104 = v:encode()
			local var105, var106 = protoModule.writeTag(buff, var97, 3, protoModule.wireTypes.lengthDelimited)
			var105, var106 = protoModule.writeBuffer(var105, var106, var104, buffer.len(var104))
			buff = var105
			var97 = var106
		end
	end
	local buff_1 = buffer.create(var97)
	buffer.copy(buff_1, 0, buff, 0, var97)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 698 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var108 = t_3.new()
	local var109 = 0
	while var109 < buffer.len(p5) do
		local _ = nil
		local var110 = nil
		local var111, var112, var113 = protoModule.readTag(p5, var109)
		local var114 = var111
		var110 = var112
		var109 = var113
		
		if var110 == protoModule.wireTypes.varint then
			local _ = nil
			local var115, var116 = protoModule.readVarInt(p5, var109)
			local _ = var115
			var109 = var116
			continue
		end
		if var110 == protoModule.wireTypes.lengthDelimited then
			if var114 == 1 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p5, var109)
				var109 = var118
				var108.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.decode(var117)
			elseif var114 == 2 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p5, var109)
				var109 = var120
				var108.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.decode(var119)
			elseif var114 == 3 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p5, var109)
				var109 = var122
				table.insert(var108.text_overlays, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.decode(var121))
			else
				local _ = nil
				local var123, var124 = protoModule.readVarInt(p5, var109)
				var109 = var124 + var123
			end
		elseif var110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var125, var126 = protoModule.readFixed32(p5, var109)
			local _ = var125
			var109 = var126
		elseif var110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var127, var128 = protoModule.readFixed64(p5, var109)
			local _ = var127
			var109 = var128
		else
			error("Unsupported wire type: " .. var110)
		end
	end
	return var108
end

function t_3:jsonEncode() --[[ line: 754 ]]
	local t = {}
	
	if self.music ~= nil then
		t.music = self.music:jsonEncode()
	end
	if self.trim ~= nil then
		t.trim = self.trim:jsonEncode()
	end
	if self.text_overlays ~= nil and #self.text_overlays > 0 then
		local t_1 = {}
		
		for i, v in self.text_overlays do
			table.insert(t_1, v:jsonEncode())
		end
		t.textOverlays = t_1
	end
	return t
end

function t_3:jsonDecode() --[[ line: 776 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var131 = t_3.new()
	
	if self.music ~= nil then
		var131.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.jsonDecode(self.music)
	end
	if self.trim ~= nil then
		var131.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.jsonDecode(self.trim)
	end
	if self.text_overlays ~= nil then
		local t_1 = {}
		
		for i, v in self.text_overlays do
			table.insert(t_1, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(v))
		end
		var131.text_overlays = t_1
	end
	if self.textOverlays ~= nil then
		local t_1 = {}
		
		for i, v in self.textOverlays do
			table.insert(t_1, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(v))
		end
		var131.text_overlays = t_1
	end
	return var131
end

t_3.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEdits"
}
t.MomentData_MomentMetadata_MomentEdits = t_3
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 824 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		asset_id = if p6 == nil or p6.asset_id == nil then nil else p6.asset_id,
		start_time_seconds = if p6 == nil or p6.start_time_seconds == nil then nil else p6.start_time_seconds
	}, t_4)
end

function t_4:encode() --[[ line: 833 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var135 = 0
	
	if self.asset_id ~= nil then
		local var136, var137 = protoModule.writeTag(buff, var135, 1, protoModule.wireTypes.lengthDelimited)
		var136, var137 = protoModule.writeString(var136, var137, self.asset_id)
		buff = var136
		var135 = var137
	end
	if self.start_time_seconds ~= nil then
		local var138, var139 = protoModule.writeTag(buff, var135, 2, protoModule.wireTypes.i32)
		var138, var139 = protoModule.writeFloat(var138, var139, self.start_time_seconds)
		buff = var138
		var135 = var139
	end
	local buff_1 = buffer.create(var135)
	buffer.copy(buff_1, 0, buff, 0, var135)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 854 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var141 = t_4.new()
	local var142 = 0
	while var142 < buffer.len(p7) do
		local _ = nil
		local var143 = nil
		local var144, var145, var146 = protoModule.readTag(p7, var142)
		local var147 = var144
		var143 = var145
		var142 = var146
		
		if var143 == protoModule.wireTypes.varint then
			local _ = nil
			local var148, var149 = protoModule.readVarInt(p7, var142)
			local _ = var148
			var142 = var149
			continue
		end
		if var143 == protoModule.wireTypes.lengthDelimited then
			if var147 == 1 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p7, var142)
				var142 = var151
				var141.asset_id = buffer.tostring(var150)
			else
				local _ = nil
				local var152, var153 = protoModule.readVarInt(p7, var142)
				var142 = var153 + var152
			end
		elseif var143 == protoModule.wireTypes.i32 then
			if var147 == 2 then
				local _ = nil
				local var154, var155 = protoModule.readFloat(p7, var142)
				var142 = var155
				var141.start_time_seconds = var154
			else
				local _ = nil
				local var156, var157 = protoModule.readFixed32(p7, var142)
				local _ = var156
				var142 = var157
			end
		elseif var143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var158, var159 = protoModule.readFixed64(p7, var142)
			local _ = var158
			var142 = var159
		else
			error("Unsupported wire type: " .. var143)
		end
	end
	return var141
end

function t_4:jsonEncode() --[[ line: 904 ]]
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id
	end
	if self.start_time_seconds ~= nil then
		t.startTimeSeconds = protoModule.json.serializeNumber(self.start_time_seconds)
	end
	return t
end

function t_4:jsonDecode() --[[ line: 920 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var161 = t_4.new()
	
	if self.asset_id ~= nil then
		var161.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var161.asset_id = self.assetId
	end
	if self.start_time_seconds ~= nil then
		var161.start_time_seconds = protoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		var161.start_time_seconds = protoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	return var161
end

t_4.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_MusicEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.MusicEdit"
}
t.MomentData_MomentMetadata_MomentEdits_MusicEdit = t_4
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_MusicEdit)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 959 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		start_time_seconds = if p8 == nil or p8.start_time_seconds == nil then nil else p8.start_time_seconds,
		end_time_seconds = if p8 == nil or p8.end_time_seconds == nil then nil else p8.end_time_seconds
	}, t_5)
end

function t_5:encode() --[[ line: 968 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var163 = 0
	
	if self.start_time_seconds ~= nil then
		local var164, var165 = protoModule.writeTag(buff, var163, 1, protoModule.wireTypes.i32)
		var164, var165 = protoModule.writeFloat(var164, var165, self.start_time_seconds)
		buff = var164
		var163 = var165
	end
	if self.end_time_seconds ~= nil then
		local var166, var167 = protoModule.writeTag(buff, var163, 2, protoModule.wireTypes.i32)
		var166, var167 = protoModule.writeFloat(var166, var167, self.end_time_seconds)
		buff = var166
		var163 = var167
	end
	local buff_1 = buffer.create(var163)
	buffer.copy(buff_1, 0, buff, 0, var163)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 989 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var169 = t_5.new()
	local var170 = 0
	while var170 < buffer.len(p9) do
		local _ = nil
		local _ = nil
		local var171, var172, var173 = protoModule.readTag(p9, var170)
		local var174 = var171
		local var175 = var172
		var170 = var173
		
		if var175 == protoModule.wireTypes.varint then
			local _ = nil
			local var176, var177 = protoModule.readVarInt(p9, var170)
			local _ = var176
			var170 = var177
		elseif var175 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var178, var179 = protoModule.readVarInt(p9, var170)
			var170 = var179 + var178
		elseif var175 == protoModule.wireTypes.i32 then
			if var174 == 1 then
				local _ = nil
				local var180, var181 = protoModule.readFloat(p9, var170)
				var170 = var181
				var169.start_time_seconds = var180
			elseif var174 == 2 then
				local _ = nil
				local var182, var183 = protoModule.readFloat(p9, var170)
				var170 = var183
				var169.end_time_seconds = var182
			else
				local _ = nil
				local var184, var185 = protoModule.readFixed32(p9, var170)
				local _ = var184
				var170 = var185
			end
		elseif var175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var186, var187 = protoModule.readFixed64(p9, var170)
			local _ = var186
			var170 = var187
		else
			error("Unsupported wire type: " .. var175)
		end
	end
	return var169
end

function t_5:jsonEncode() --[[ line: 1039 ]]
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.start_time_seconds ~= nil then
		t.startTimeSeconds = protoModule.json.serializeNumber(self.start_time_seconds)
	end
	if self.end_time_seconds ~= nil then
		t.endTimeSeconds = protoModule.json.serializeNumber(self.end_time_seconds)
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1055 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var189 = t_5.new()
	
	if self.start_time_seconds ~= nil then
		var189.start_time_seconds = protoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		var189.start_time_seconds = protoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	if self.end_time_seconds ~= nil then
		var189.end_time_seconds = protoModule.json.deserializeNumber(self.end_time_seconds)
	end
	if self.endTimeSeconds ~= nil then
		var189.end_time_seconds = protoModule.json.deserializeNumber(self.endTimeSeconds)
	end
	return var189
end

t_5.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TrimEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.TrimEdit"
}
t.MomentData_MomentMetadata_MomentEdits_TrimEdit = t_5
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TrimEdit)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1094 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		position = if p10 == nil or p10.position == nil then {} else p10.position,
		rotation = if p10 == nil or p10.rotation == nil then nil else p10.rotation,
		scale = if p10 == nil or p10.scale == nil then nil else p10.scale,
		text = if p10 == nil or p10.text == nil then nil else p10.text,
		style = if p10 == nil or p10.style == nil then nil else p10.style,
		z_index = if p10 == nil or p10.z_index == nil then nil else p10.z_index
	}, t_6)
end

function t_6:encode() --[[ line: 1110 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var191 = 0
	
	if self.position ~= nil and #self.position > 0 then
		local buff_1 = buffer.create(0)
		local var193 = 0
		
		for i, v in self.position do
			local var196, var197 = protoModule.writeFloat(buff_1, var193, v)
			buff_1 = var196
			var193 = var197
		end
		local var194, var195 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.lengthDelimited)
		var194, var195 = protoModule.writeBuffer(var194, var195, buff_1, var193)
		buff = var194
		var191 = var195
	end
	if self.rotation ~= nil then
		local var198, var199 = protoModule.writeTag(buff, var191, 2, protoModule.wireTypes.i32)
		var198, var199 = protoModule.writeFloat(var198, var199, self.rotation)
		buff = var198
		var191 = var199
	end
	if self.scale ~= nil then
		local var200, var201 = protoModule.writeTag(buff, var191, 3, protoModule.wireTypes.i32)
		var200, var201 = protoModule.writeFloat(var200, var201, self.scale)
		buff = var200
		var191 = var201
	end
	if self.text ~= nil then
		local var202, var203 = protoModule.writeTag(buff, var191, 4, protoModule.wireTypes.lengthDelimited)
		var202, var203 = protoModule.writeString(var202, var203, self.text)
		buff = var202
		var191 = var203
	end
	if self.style ~= nil then
		local var204 = self.style:encode()
		local var205, var206 = protoModule.writeTag(buff, var191, 5, protoModule.wireTypes.lengthDelimited)
		var205, var206 = protoModule.writeBuffer(var205, var206, var204, buffer.len(var204))
		buff = var205
		var191 = var206
	end
	if self.z_index ~= nil then
		local var207, var208 = protoModule.writeTag(buff, var191, 6, protoModule.wireTypes.varint)
		var207, var208 = protoModule.writeVarInt(var207, var208, self.z_index)
		buff = var207
		var191 = var208
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1159 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var210 = t_6.new()
	local var211 = 0
	while var211 < buffer.len(p11) do
		local _ = nil
		local var212 = nil
		local var213, var214, var215 = protoModule.readTag(p11, var211)
		local var216 = var213
		var212 = var214
		var211 = var215
		
		if var212 == protoModule.wireTypes.varint then
			if var216 == 6 then
				local _ = nil
				local var217, var218 = protoModule.readVarIntI32(p11, var211)
				var211 = var218
				var210.z_index = var217
			else
				local _ = nil
				local var219, var220 = protoModule.readVarInt(p11, var211)
				local _ = var219
				var211 = var220
			end
		end
		if var212 == protoModule.wireTypes.lengthDelimited then
			if var216 == 1 then
				local _ = nil
				local var221, var222 = protoModule.readVarInt(p11, var211)
				var211 = var222
				var221 = var211 + var221
				while var211 < var221 do
					local _ = nil
					local var223, var224 = protoModule.readFloat(p11, var211)
					var211 = var224
					table.insert(var210.position, var223)
				end
			elseif var216 == 4 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p11, var211)
				var211 = var226
				var210.text = buffer.tostring(var225)
			elseif var216 == 5 then
				local _ = nil
				local var227, var228 = protoModule.readBuffer(p11, var211)
				var211 = var228
				var210.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.decode(var227)
			else
				local _ = nil
				local var229, var230 = protoModule.readVarInt(p11, var211)
				var211 = var230 + var229
			end
		elseif var212 == protoModule.wireTypes.i32 then
			if var216 == 1 then
				local _ = nil
				local var231, var232 = protoModule.readFloat(p11, var211)
				var211 = var232
				table.insert(var210.position, var231)
			elseif var216 == 2 then
				local _ = nil
				local var233, var234 = protoModule.readFloat(p11, var211)
				var211 = var234
				var210.rotation = var233
			elseif var216 == 3 then
				local _ = nil
				local var235, var236 = protoModule.readFloat(p11, var211)
				var211 = var236
				var210.scale = var235
			else
				local _ = nil
				local var237, var238 = protoModule.readFixed32(p11, var211)
				local _ = var237
				var211 = var238
			end
		elseif var212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var239, var240 = protoModule.readFixed64(p11, var211)
			local _ = var239
			var211 = var240
		else
			error("Unsupported wire type: " .. var212)
		end
	end
	return var210
end

function t_6:jsonEncode() --[[ line: 1242 ]]
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.position ~= nil and #self.position > 0 then
		local t_1 = {}
		
		for i, v in self.position do
			table.insert(t_1, protoModule.json.serializeNumber(v))
		end
		t.position = t_1
	end
	if self.rotation ~= nil then
		t.rotation = protoModule.json.serializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		t.scale = protoModule.json.serializeNumber(self.scale)
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

function t_6:jsonDecode() --[[ line: 1278 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var243 = t_6.new()
	
	if self.position ~= nil then
		local t_1 = {}
		
		for i, v in self.position do
			table.insert(t_1, protoModule.json.deserializeNumber(v))
		end
		var243.position = t_1
	end
	if self.rotation ~= nil then
		var243.rotation = protoModule.json.deserializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		var243.scale = protoModule.json.deserializeNumber(self.scale)
	end
	if self.text ~= nil then
		var243.text = self.text
	end
	if self.style ~= nil then
		var243.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.jsonDecode(self.style)
	end
	if self.z_index ~= nil then
		var243.z_index = self.z_index
	end
	if self.zIndex ~= nil then
		var243.z_index = self.zIndex
	end
	return var243
end

t_6.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TextOverlay",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextOverlay"
}
t.MomentData_MomentMetadata_MomentEdits_TextOverlay = t_6
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TextOverlay)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1335 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		font = if p12 == nil or p12.font == nil then nil else p12.font,
		font_color = if p12 == nil or p12.font_color == nil then {} else p12.font_color,
		font_size = if p12 == nil or p12.font_size == nil then nil else p12.font_size,
		text_x_alignment = if p12 == nil or p12.text_x_alignment == nil then nil else p12.text_x_alignment
	}, t_7)
end

function t_7:encode() --[[ line: 1349 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var246 = 0
	
	if self.font ~= nil then
		local var247, var248 = protoModule.writeTag(buff, var246, 1, protoModule.wireTypes.lengthDelimited)
		var247, var248 = protoModule.writeString(var247, var248, self.font)
		buff = var247
		var246 = var248
	end
	if self.font_color ~= nil and #self.font_color > 0 then
		local buff_1 = buffer.create(0)
		local var250 = 0
		
		for i, v in self.font_color do
			local var253, var254 = protoModule.writeFloat(buff_1, var250, v)
			buff_1 = var253
			var250 = var254
		end
		local var251, var252 = protoModule.writeTag(buff, var246, 2, protoModule.wireTypes.lengthDelimited)
		var251, var252 = protoModule.writeBuffer(var251, var252, buff_1, var250)
		buff = var251
		var246 = var252
	end
	if self.font_size ~= nil then
		local var255, var256 = protoModule.writeTag(buff, var246, 3, protoModule.wireTypes.i32)
		var255, var256 = protoModule.writeFloat(var255, var256, self.font_size)
		buff = var255
		var246 = var256
	end
	if self.text_x_alignment ~= nil then
		local var257, var258 = protoModule.writeTag(buff, var246, 4, protoModule.wireTypes.lengthDelimited)
		var257, var258 = protoModule.writeString(var257, var258, self.text_x_alignment)
		buff = var257
		var246 = var258
	end
	local buff_1 = buffer.create(var246)
	buffer.copy(buff_1, 0, buff, 0, var246)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1387 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var260 = t_7.new()
	local var261 = 0
	while var261 < buffer.len(p13) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p13, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p13, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p13, var261)
				var261 = var270
				var260.font = buffer.tostring(var269)
			elseif var266 == 2 then
				local _ = nil
				local var271, var272 = protoModule.readVarInt(p13, var261)
				var261 = var272
				var271 = var261 + var271
				while var261 < var271 do
					local _ = nil
					local var273, var274 = protoModule.readFloat(p13, var261)
					var261 = var274
					table.insert(var260.font_color, var273)
				end
			elseif var266 == 4 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p13, var261)
				var261 = var276
				var260.text_x_alignment = buffer.tostring(var275)
			else
				local _ = nil
				local var277, var278 = protoModule.readVarInt(p13, var261)
				var261 = var278 + var277
			end
		elseif var262 == protoModule.wireTypes.i32 then
			if var266 == 2 then
				local _ = nil
				local var279, var280 = protoModule.readFloat(p13, var261)
				var261 = var280
				table.insert(var260.font_color, var279)
			elseif var266 == 3 then
				local _ = nil
				local var281, var282 = protoModule.readFloat(p13, var261)
				var261 = var282
				var260.font_size = var281
			else
				local _ = nil
				local var283, var284 = protoModule.readFixed32(p13, var261)
				local _ = var283
				var261 = var284
			end
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var285, var286 = protoModule.readFixed64(p13, var261)
			local _ = var285
			var261 = var286
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var260
end

function t_7:jsonEncode() --[[ line: 1460 ]]
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.font ~= nil then
		t.font = self.font
	end
	if self.font_color ~= nil and #self.font_color > 0 then
		local t_1 = {}
		
		for i, v in self.font_color do
			table.insert(t_1, protoModule.json.serializeNumber(v))
		end
		t.fontColor = t_1
	end
	if self.font_size ~= nil then
		t.fontSize = protoModule.json.serializeNumber(self.font_size)
	end
	if self.text_x_alignment ~= nil then
		t.textXAlignment = self.text_x_alignment
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1488 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var289 = t_7.new()
	
	if self.font ~= nil then
		var289.font = self.font
	end
	if self.font_color ~= nil then
		local t = {}
		
		for i, v in self.font_color do
			table.insert(t, protoModule.json.deserializeNumber(v))
		end
		var289.font_color = t
	end
	if self.fontColor ~= nil then
		local t = {}
		
		for i, v in self.fontColor do
			table.insert(t, protoModule.json.deserializeNumber(v))
		end
		var289.font_color = t
	end
	if self.font_size ~= nil then
		var289.font_size = protoModule.json.deserializeNumber(self.font_size)
	end
	if self.fontSize ~= nil then
		var289.font_size = protoModule.json.deserializeNumber(self.fontSize)
	end
	if self.text_x_alignment ~= nil then
		var289.text_x_alignment = self.text_x_alignment
	end
	if self.textXAlignment ~= nil then
		var289.text_x_alignment = self.textXAlignment
	end
	return var289
end

t_7.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TextOverlay_Style",
	fullName = "roblox.apppageplatform.shared.v1beta1.Style"
}
t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style = t_7
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style)

return {
	MomentData = t.MomentData,
	MomentData_MomentMetadata = t.MomentData_MomentMetadata,
	MomentData_MomentMetadata_MomentEdits = t.MomentData_MomentMetadata_MomentEdits,
	MomentData_MomentMetadata_MomentEdits_MusicEdit = t.MomentData_MomentMetadata_MomentEdits_MusicEdit,
	MomentData_MomentMetadata_MomentEdits_TrimEdit = t.MomentData_MomentMetadata_MomentEdits_TrimEdit,
	MomentData_MomentMetadata_MomentEdits_TextOverlay = t.MomentData_MomentMetadata_MomentEdits_TextOverlay,
	MomentData_MomentMetadata_MomentEdits_TextOverlay_Style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style
}