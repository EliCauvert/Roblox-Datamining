local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		moment_id = if p1 == nil or p1.moment_id == nil then nil else p1.moment_id,
		asset_id = if p1 == nil or p1.asset_id == nil then nil else p1.asset_id,
		creator_id = if p1 == nil or p1.creator_id == nil then nil else p1.creator_id,
		status = if p1 == nil or p1.status == nil then nil else p1.status,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.moment_id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var13 = protoModule.writeString(var2, var3, self.moment_id)
		buff = var2
		var1 = var3
	end
	if self.asset_id ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var15 = protoModule.writeString(var4, var5, self.asset_id)
		buff = var4
		var1 = var5
	end
	if self.creator_id ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var17 = protoModule.writeString(var6, var7, self.creator_id)
		buff = var6
		var1 = var7
	end
	if self.status ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var19 = protoModule.writeString(var8, var9, self.status)
		buff = var8
		var1 = var9
	end
	if self.metadata ~= nil then
		local var10 = self.metadata:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var22 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.moment_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.asset_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.creator_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.status = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.metadata = t.MomentData_MomentMetadata.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var26 = t_1.new()
	
	if self.moment_id ~= nil then
		var26.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var26.moment_id = self.momentId
	end
	if self.asset_id ~= nil then
		var26.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var26.asset_id = self.assetId
	end
	if self.creator_id ~= nil then
		var26.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var26.creator_id = self.creatorId
	end
	if self.status ~= nil then
		var26.status = self.status
	end
	if self.metadata ~= nil then
		var26.metadata = t.MomentData_MomentMetadata.jsonDecode(self.metadata)
	end
	return var26
end

t_1.descriptor = {
	name = "MomentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentData"
}
t.MomentData = t_1
typeRegistryModule.default:register(t.MomentData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
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

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var26 = 0
	
	if self.asset_total_duration_seconds ~= nil then
		local var27, var28 = protoModule.writeTag(buff, var26, 1, protoModule.wireTypes.i32)
		var27, var54 = protoModule.writeFloat(var27, var28, self.asset_total_duration_seconds)
		buff = var27
		var26 = var28
	end
	if self.capture_type ~= nil then
		local var29, var30 = protoModule.writeTag(buff, var26, 2, protoModule.wireTypes.lengthDelimited)
		var29, var56 = protoModule.writeString(var29, var30, self.capture_type)
		buff = var29
		var26 = var30
	end
	if self.description ~= nil then
		local var31, var32 = protoModule.writeTag(buff, var26, 3, protoModule.wireTypes.lengthDelimited)
		var31, var58 = protoModule.writeString(var31, var32, self.description)
		buff = var31
		var26 = var32
	end
	if self.capture_universe_id ~= nil then
		local var33, var34 = protoModule.writeTag(buff, var26, 4, protoModule.wireTypes.lengthDelimited)
		var33, var60 = protoModule.writeString(var33, var34, self.capture_universe_id)
		buff = var33
		var26 = var34
	end
	if self.capture_place_id ~= nil then
		local var35, var36 = protoModule.writeTag(buff, var26, 5, protoModule.wireTypes.lengthDelimited)
		var35, var62 = protoModule.writeString(var35, var36, self.capture_place_id)
		buff = var35
		var26 = var36
	end
	if self.edits ~= nil then
		local var37 = self.edits:encode()
		local var38, var39 = protoModule.writeTag(buff, var26, 6, protoModule.wireTypes.lengthDelimited)
		var38, var65 = protoModule.writeBuffer(var38, var39, var37, buffer.len(var37))
		buff = var38
		var26 = var39
	end
	local buff_1 = buffer.create(var26)
	buffer.copy(buff_1, 0, buff, 0, var26)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var26 = t_2.new()
	local var27 = 0
	while var27 < buffer.len(p2) do
		local _ = nil
		local var28 = nil
		local var29, var30, var31 = protoModule.readTag(p2, var27)
		local var32 = var29
		var28 = var30
		var27 = var31
		
		if var28 == protoModule.wireTypes.varint then
			local _ = nil
			local var33, var34 = protoModule.readVarInt(p2, var27)
			local _ = var33
			var27 = var34
			continue
		end
		if var28 == protoModule.wireTypes.lengthDelimited then
			if var32 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p2, var27)
				var27 = var36
				var26.capture_type = buffer.tostring(var35)
			elseif var32 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p2, var27)
				var27 = var38
				var26.description = buffer.tostring(var37)
			elseif var32 == 4 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p2, var27)
				var27 = var40
				var26.capture_universe_id = buffer.tostring(var39)
			elseif var32 == 5 then
				local _ = nil
				local var41, var42 = protoModule.readBuffer(p2, var27)
				var27 = var42
				var26.capture_place_id = buffer.tostring(var41)
			elseif var32 == 6 then
				local _ = nil
				local var43, var44 = protoModule.readBuffer(p2, var27)
				var27 = var44
				var26.edits = t.MomentData_MomentMetadata_MomentEdits.decode(var43)
			else
				local _ = nil
				local var45, var46 = protoModule.readVarInt(p2, var27)
				var27 = var46 + var45
			end
		elseif var28 == protoModule.wireTypes.i32 then
			if var32 == 1 then
				local _ = nil
				local var47, var48 = protoModule.readFloat(p2, var27)
				var27 = var48
				var26.asset_total_duration_seconds = var47
			else
				local _ = nil
				local var49, var50 = protoModule.readFixed32(p2, var27)
				local _ = var49
				var27 = var50
			end
		elseif var28 == protoModule.wireTypes.i64 then
			local _ = nil
			local var51, var52 = protoModule.readFixed64(p2, var27)
			local _ = var51
			var27 = var52
		else
			error("Unsupported wire type: " .. var69)
		end
	end
	return var26
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var53 = t_2.new()
	
	if self.asset_total_duration_seconds ~= nil then
		var53.asset_total_duration_seconds = protoModule.json.deserializeNumber(self.asset_total_duration_seconds)
	end
	if self.assetTotalDurationSeconds ~= nil then
		var53.asset_total_duration_seconds = protoModule.json.deserializeNumber(self.assetTotalDurationSeconds)
	end
	if self.capture_type ~= nil then
		var53.capture_type = self.capture_type
	end
	if self.captureType ~= nil then
		var53.capture_type = self.captureType
	end
	if self.description ~= nil then
		var53.description = self.description
	end
	if self.capture_universe_id ~= nil then
		var53.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var53.capture_universe_id = self.captureUniverseId
	end
	if self.capture_place_id ~= nil then
		var53.capture_place_id = self.capture_place_id
	end
	if self.capturePlaceId ~= nil then
		var53.capture_place_id = self.capturePlaceId
	end
	if self.edits ~= nil then
		var53.edits = t.MomentData_MomentMetadata_MomentEdits.jsonDecode(self.edits)
	end
	return var53
end

t_2.descriptor = {
	name = "MomentData_MomentMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentMetadata"
}
t.MomentData_MomentMetadata = t_2
typeRegistryModule.default:register(t.MomentData_MomentMetadata)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		music = if p3 == nil or p3.music == nil then nil else p3.music,
		trim = if p3 == nil or p3.trim == nil then nil else p3.trim,
		text_overlays = if p3 == nil or p3.text_overlays == nil then {} else p3.text_overlays
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var53 = 0
	
	if self.music ~= nil then
		local var54 = self.music:encode()
		local var55, var56 = protoModule.writeTag(buff, var53, 1, protoModule.wireTypes.lengthDelimited)
		var55, var100 = protoModule.writeBuffer(var55, var56, var54, buffer.len(var54))
		buff = var55
		var53 = var56
	end
	if self.trim ~= nil then
		local var57 = self.trim:encode()
		local var58, var59 = protoModule.writeTag(buff, var53, 2, protoModule.wireTypes.lengthDelimited)
		var58, var103 = protoModule.writeBuffer(var58, var59, var57, buffer.len(var57))
		buff = var58
		var53 = var59
	end
	if self.text_overlays ~= nil and #self.text_overlays > 0 then
		for i, v in self.text_overlays do
			local var60 = v:encode()
			local var61, var62 = protoModule.writeTag(buff, var53, 3, protoModule.wireTypes.lengthDelimited)
			var61, var106 = protoModule.writeBuffer(var61, var62, var60, buffer.len(var60))
			buff = var61
			var53 = var62
		end
	end
	local buff_1 = buffer.create(var53)
	buffer.copy(buff_1, 0, buff, 0, var53)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var63 = t_3.new()
	local var64 = 0
	while var64 < buffer.len(p3) do
		local _ = nil
		local var65 = nil
		local var66, var67, var68 = protoModule.readTag(p3, var64)
		local var69 = var66
		var65 = var67
		var64 = var68
		
		if var65 == protoModule.wireTypes.varint then
			local _ = nil
			local var70, var71 = protoModule.readVarInt(p3, var64)
			local _ = var70
			var64 = var71
			continue
		end
		if var65 == protoModule.wireTypes.lengthDelimited then
			if var69 == 1 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var64)
				var64 = var73
				var63.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.decode(var72)
			elseif var69 == 2 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p3, var64)
				var64 = var75
				var63.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.decode(var74)
			elseif var69 == 3 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p3, var64)
				var64 = var77
				table.insert(var63.text_overlays, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.decode(var76))
			else
				local _ = nil
				local var78, var79 = protoModule.readVarInt(p3, var64)
				var64 = var79 + var78
			end
		elseif var65 == protoModule.wireTypes.i32 then
			local _ = nil
			local var80, var81 = protoModule.readFixed32(p3, var64)
			local _ = var80
			var64 = var81
		elseif var65 == protoModule.wireTypes.i64 then
			local _ = nil
			local var82, var83 = protoModule.readFixed64(p3, var64)
			local _ = var82
			var64 = var83
		else
			error("Unsupported wire type: " .. var110)
		end
	end
	return var63
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var84 = t_3.new()
	
	if self.music ~= nil then
		var84.music = t.MomentData_MomentMetadata_MomentEdits_MusicEdit.jsonDecode(self.music)
	end
	if self.trim ~= nil then
		var84.trim = t.MomentData_MomentMetadata_MomentEdits_TrimEdit.jsonDecode(self.trim)
	end
	if self.text_overlays ~= nil then
		local t_1 = {}
		
		for i, v in self.text_overlays do
			table.insert(t_1, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(v))
		end
		var84.text_overlays = t_1
	end
	if self.textOverlays ~= nil then
		local t_1 = {}
		
		for i, v in self.textOverlays do
			table.insert(t_1, t.MomentData_MomentMetadata_MomentEdits_TextOverlay.jsonDecode(v))
		end
		var84.text_overlays = t_1
	end
	return var84
end

t_3.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEdits"
}
t.MomentData_MomentMetadata_MomentEdits = t_3
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		asset_id = if p4 == nil or p4.asset_id == nil then nil else p4.asset_id,
		start_time_seconds = if p4 == nil or p4.start_time_seconds == nil then nil else p4.start_time_seconds
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var85 = 0
	
	if self.asset_id ~= nil then
		local var86, var87 = protoModule.writeTag(buff, var85, 1, protoModule.wireTypes.lengthDelimited)
		var86, var137 = protoModule.writeString(var86, var87, self.asset_id)
		buff = var86
		var85 = var87
	end
	if self.start_time_seconds ~= nil then
		local var88, var89 = protoModule.writeTag(buff, var85, 2, protoModule.wireTypes.i32)
		var88, var139 = protoModule.writeFloat(var88, var89, self.start_time_seconds)
		buff = var88
		var85 = var89
	end
	local buff_1 = buffer.create(var85)
	buffer.copy(buff_1, 0, buff, 0, var85)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var85 = t_4.new()
	local var86 = 0
	while var86 < buffer.len(p4) do
		local _ = nil
		local var87 = nil
		local var88, var89, var90 = protoModule.readTag(p4, var86)
		local var91 = var88
		var87 = var89
		var86 = var90
		
		if var87 == protoModule.wireTypes.varint then
			local _ = nil
			local var92, var93 = protoModule.readVarInt(p4, var86)
			local _ = var92
			var86 = var93
			continue
		end
		if var87 == protoModule.wireTypes.lengthDelimited then
			if var91 == 1 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p4, var86)
				var86 = var95
				var85.asset_id = buffer.tostring(var94)
			else
				local _ = nil
				local var96, var97 = protoModule.readVarInt(p4, var86)
				var86 = var97 + var96
			end
		elseif var87 == protoModule.wireTypes.i32 then
			if var91 == 2 then
				local _ = nil
				local var98, var99 = protoModule.readFloat(p4, var86)
				var86 = var99
				var85.start_time_seconds = var98
			else
				local _ = nil
				local var100, var101 = protoModule.readFixed32(p4, var86)
				local _ = var100
				var86 = var101
			end
		elseif var87 == protoModule.wireTypes.i64 then
			local _ = nil
			local var102, var103 = protoModule.readFixed64(p4, var86)
			local _ = var102
			var86 = var103
		else
			error("Unsupported wire type: " .. var143)
		end
	end
	return var85
end

function t_4:jsonEncode()
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), protoModule (ref)
	local var104 = t_4.new()
	
	if self.asset_id ~= nil then
		var104.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var104.asset_id = self.assetId
	end
	if self.start_time_seconds ~= nil then
		var104.start_time_seconds = protoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		var104.start_time_seconds = protoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	return var104
end

t_4.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_MusicEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.MusicEdit"
}
t.MomentData_MomentMetadata_MomentEdits_MusicEdit = t_4
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_MusicEdit)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		start_time_seconds = if p5 == nil or p5.start_time_seconds == nil then nil else p5.start_time_seconds,
		end_time_seconds = if p5 == nil or p5.end_time_seconds == nil then nil else p5.end_time_seconds
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var104 = 0
	
	if self.start_time_seconds ~= nil then
		local var105, var106 = protoModule.writeTag(buff, var104, 1, protoModule.wireTypes.i32)
		var105, var165 = protoModule.writeFloat(var105, var106, self.start_time_seconds)
		buff = var105
		var104 = var106
	end
	if self.end_time_seconds ~= nil then
		local var107, var108 = protoModule.writeTag(buff, var104, 2, protoModule.wireTypes.i32)
		var107, var167 = protoModule.writeFloat(var107, var108, self.end_time_seconds)
		buff = var107
		var104 = var108
	end
	local buff_1 = buffer.create(var104)
	buffer.copy(buff_1, 0, buff, 0, var104)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var104 = t_5.new()
	local var105 = 0
	while var105 < buffer.len(p5) do
		local _ = nil
		local _ = nil
		local var106, var107, var108 = protoModule.readTag(p5, var105)
		local var109 = var106
		local var110 = var107
		var105 = var108
		
		if var110 == protoModule.wireTypes.varint then
			local _ = nil
			local var111, var112 = protoModule.readVarInt(p5, var105)
			local _ = var111
			var105 = var112
		elseif var110 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var113, var114 = protoModule.readVarInt(p5, var105)
			var105 = var114 + var113
		elseif var110 == protoModule.wireTypes.i32 then
			if var109 == 1 then
				local _ = nil
				local var115, var116 = protoModule.readFloat(p5, var105)
				var105 = var116
				var104.start_time_seconds = var115
			elseif var109 == 2 then
				local _ = nil
				local var117, var118 = protoModule.readFloat(p5, var105)
				var105 = var118
				var104.end_time_seconds = var117
			else
				local _ = nil
				local var119, var120 = protoModule.readFixed32(p5, var105)
				local _ = var119
				var105 = var120
			end
		elseif var110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var121, var122 = protoModule.readFixed64(p5, var105)
			local _ = var121
			var105 = var122
		else
			error("Unsupported wire type: " .. var175)
		end
	end
	return var104
end

function t_5:jsonEncode()
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), protoModule (ref)
	local var123 = t_5.new()
	
	if self.start_time_seconds ~= nil then
		var123.start_time_seconds = protoModule.json.deserializeNumber(self.start_time_seconds)
	end
	if self.startTimeSeconds ~= nil then
		var123.start_time_seconds = protoModule.json.deserializeNumber(self.startTimeSeconds)
	end
	if self.end_time_seconds ~= nil then
		var123.end_time_seconds = protoModule.json.deserializeNumber(self.end_time_seconds)
	end
	if self.endTimeSeconds ~= nil then
		var123.end_time_seconds = protoModule.json.deserializeNumber(self.endTimeSeconds)
	end
	return var123
end

t_5.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TrimEdit",
	fullName = "roblox.apppageplatform.shared.v1beta1.TrimEdit"
}
t.MomentData_MomentMetadata_MomentEdits_TrimEdit = t_5
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TrimEdit)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		position = if p6 == nil or p6.position == nil then {} else p6.position,
		rotation = if p6 == nil or p6.rotation == nil then nil else p6.rotation,
		scale = if p6 == nil or p6.scale == nil then nil else p6.scale,
		text = if p6 == nil or p6.text == nil then nil else p6.text,
		style = if p6 == nil or p6.style == nil then nil else p6.style,
		z_index = if p6 == nil or p6.z_index == nil then nil else p6.z_index
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var123 = 0
	
	if self.position ~= nil and #self.position > 0 then
		local buff_1 = buffer.create(0)
		local var124 = 0
		
		for i, v in self.position do
			local var125, var126 = protoModule.writeFloat(buff_1, var124, v)
			buff_1 = var125
			var124 = var126
		end
		local var127, var128 = protoModule.writeTag(buff, var123, 1, protoModule.wireTypes.lengthDelimited)
		var127, var195 = protoModule.writeBuffer(var127, var128, buff_1, var124)
		buff = var127
		var123 = var128
	end
	if self.rotation ~= nil then
		local var129, var130 = protoModule.writeTag(buff, var123, 2, protoModule.wireTypes.i32)
		var129, var199 = protoModule.writeFloat(var129, var130, self.rotation)
		buff = var129
		var123 = var130
	end
	if self.scale ~= nil then
		local var131, var132 = protoModule.writeTag(buff, var123, 3, protoModule.wireTypes.i32)
		var131, var201 = protoModule.writeFloat(var131, var132, self.scale)
		buff = var131
		var123 = var132
	end
	if self.text ~= nil then
		local var133, var134 = protoModule.writeTag(buff, var123, 4, protoModule.wireTypes.lengthDelimited)
		var133, var203 = protoModule.writeString(var133, var134, self.text)
		buff = var133
		var123 = var134
	end
	if self.style ~= nil then
		local var135 = self.style:encode()
		local var136, var137 = protoModule.writeTag(buff, var123, 5, protoModule.wireTypes.lengthDelimited)
		var136, var206 = protoModule.writeBuffer(var136, var137, var135, buffer.len(var135))
		buff = var136
		var123 = var137
	end
	if self.z_index ~= nil then
		local var138, var139 = protoModule.writeTag(buff, var123, 6, protoModule.wireTypes.varint)
		var138, var208 = protoModule.writeVarInt(var138, var139, self.z_index)
		buff = var138
		var123 = var139
	end
	local buff_1 = buffer.create(var123)
	buffer.copy(buff_1, 0, buff, 0, var123)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var140 = t_6.new()
	local var141 = 0
	while var141 < buffer.len(p6) do
		local _ = nil
		local var142 = nil
		local var143, var144, var145 = protoModule.readTag(p6, var141)
		local var146 = var143
		var142 = var144
		var141 = var145
		
		if var142 == protoModule.wireTypes.varint then
			if var146 == 6 then
				local _ = nil
				local var147, var148 = protoModule.readVarIntI32(p6, var141)
				var141 = var148
				var140.z_index = var147
			else
				local _ = nil
				local var149, var150 = protoModule.readVarInt(p6, var141)
				local _ = var149
				var141 = var150
			end
		end
		if var142 == protoModule.wireTypes.lengthDelimited then
			if var146 == 1 then
				local _ = nil
				local var151, var152 = protoModule.readVarInt(p6, var141)
				var141 = var152
				var151 = var141 + var151
				while var141 < var151 do
					local _ = nil
					local var153, var154 = protoModule.readFloat(p6, var141)
					var141 = var154
					table.insert(var140.position, var153)
				end
			elseif var146 == 4 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p6, var141)
				var141 = var156
				var140.text = buffer.tostring(var155)
			elseif var146 == 5 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p6, var141)
				var141 = var158
				var140.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.decode(var157)
			else
				local _ = nil
				local var159, var160 = protoModule.readVarInt(p6, var141)
				var141 = var160 + var159
			end
		elseif var142 == protoModule.wireTypes.i32 then
			if var146 == 1 then
				local _ = nil
				local var161, var162 = protoModule.readFloat(p6, var141)
				var141 = var162
				table.insert(var140.position, var161)
			elseif var146 == 2 then
				local _ = nil
				local var163, var164 = protoModule.readFloat(p6, var141)
				var141 = var164
				var140.rotation = var163
			elseif var146 == 3 then
				local _ = nil
				local var165, var166 = protoModule.readFloat(p6, var141)
				var141 = var166
				var140.scale = var165
			else
				local _ = nil
				local var167, var168 = protoModule.readFixed32(p6, var141)
				local _ = var167
				var141 = var168
			end
		elseif var142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var169, var170 = protoModule.readFixed64(p6, var141)
			local _ = var169
			var141 = var170
		else
			error("Unsupported wire type: " .. var212)
		end
	end
	return var140
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var171 = t_6.new()
	
	if self.position ~= nil then
		local t_1 = {}
		
		for i, v in self.position do
			table.insert(t_1, protoModule.json.deserializeNumber(v))
		end
		var171.position = t_1
	end
	if self.rotation ~= nil then
		var171.rotation = protoModule.json.deserializeNumber(self.rotation)
	end
	if self.scale ~= nil then
		var171.scale = protoModule.json.deserializeNumber(self.scale)
	end
	if self.text ~= nil then
		var171.text = self.text
	end
	if self.style ~= nil then
		var171.style = t.MomentData_MomentMetadata_MomentEdits_TextOverlay_Style.jsonDecode(self.style)
	end
	if self.z_index ~= nil then
		var171.z_index = self.z_index
	end
	if self.zIndex ~= nil then
		var171.z_index = self.zIndex
	end
	return var171
end

t_6.descriptor = {
	name = "MomentData_MomentMetadata_MomentEdits_TextOverlay",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextOverlay"
}
t.MomentData_MomentMetadata_MomentEdits_TextOverlay = t_6
typeRegistryModule.default:register(t.MomentData_MomentMetadata_MomentEdits_TextOverlay)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		font = if p7 == nil or p7.font == nil then nil else p7.font,
		font_color = if p7 == nil or p7.font_color == nil then {} else p7.font_color,
		font_size = if p7 == nil or p7.font_size == nil then nil else p7.font_size,
		text_x_alignment = if p7 == nil or p7.text_x_alignment == nil then nil else p7.text_x_alignment
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var172 = 0
	
	if self.font ~= nil then
		local var173, var174 = protoModule.writeTag(buff, var172, 1, protoModule.wireTypes.lengthDelimited)
		var173, var248 = protoModule.writeString(var173, var174, self.font)
		buff = var173
		var172 = var174
	end
	if self.font_color ~= nil and #self.font_color > 0 then
		local buff_1 = buffer.create(0)
		local var175 = 0
		
		for i, v in self.font_color do
			local var176, var177 = protoModule.writeFloat(buff_1, var175, v)
			buff_1 = var176
			var175 = var177
		end
		local var178, var179 = protoModule.writeTag(buff, var172, 2, protoModule.wireTypes.lengthDelimited)
		var178, var252 = protoModule.writeBuffer(var178, var179, buff_1, var175)
		buff = var178
		var172 = var179
	end
	if self.font_size ~= nil then
		local var180, var181 = protoModule.writeTag(buff, var172, 3, protoModule.wireTypes.i32)
		var180, var256 = protoModule.writeFloat(var180, var181, self.font_size)
		buff = var180
		var172 = var181
	end
	if self.text_x_alignment ~= nil then
		local var182, var183 = protoModule.writeTag(buff, var172, 4, protoModule.wireTypes.lengthDelimited)
		var182, var258 = protoModule.writeString(var182, var183, self.text_x_alignment)
		buff = var182
		var172 = var183
	end
	local buff_1 = buffer.create(var172)
	buffer.copy(buff_1, 0, buff, 0, var172)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var184 = t_7.new()
	local var185 = 0
	while var185 < buffer.len(p7) do
		local _ = nil
		local var186 = nil
		local var187, var188, var189 = protoModule.readTag(p7, var185)
		local var190 = var187
		var186 = var188
		var185 = var189
		
		if var186 == protoModule.wireTypes.varint then
			local _ = nil
			local var191, var192 = protoModule.readVarInt(p7, var185)
			local _ = var191
			var185 = var192
			continue
		end
		if var186 == protoModule.wireTypes.lengthDelimited then
			if var190 == 1 then
				local _ = nil
				local var193, var194 = protoModule.readBuffer(p7, var185)
				var185 = var194
				var184.font = buffer.tostring(var193)
			elseif var190 == 2 then
				local _ = nil
				local var195, var196 = protoModule.readVarInt(p7, var185)
				var185 = var196
				var195 = var185 + var195
				while var185 < var195 do
					local _ = nil
					local var197, var198 = protoModule.readFloat(p7, var185)
					var185 = var198
					table.insert(var184.font_color, var197)
				end
			elseif var190 == 4 then
				local _ = nil
				local var199, var200 = protoModule.readBuffer(p7, var185)
				var185 = var200
				var184.text_x_alignment = buffer.tostring(var199)
			else
				local _ = nil
				local var201, var202 = protoModule.readVarInt(p7, var185)
				var185 = var202 + var201
			end
		elseif var186 == protoModule.wireTypes.i32 then
			if var190 == 2 then
				local _ = nil
				local var203, var204 = protoModule.readFloat(p7, var185)
				var185 = var204
				table.insert(var184.font_color, var203)
			elseif var190 == 3 then
				local _ = nil
				local var205, var206 = protoModule.readFloat(p7, var185)
				var185 = var206
				var184.font_size = var205
			else
				local _ = nil
				local var207, var208 = protoModule.readFixed32(p7, var185)
				local _ = var207
				var185 = var208
			end
		elseif var186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var209, var210 = protoModule.readFixed64(p7, var185)
			local _ = var209
			var185 = var210
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var184
end

function t_7:jsonEncode()
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

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), protoModule (ref)
	local var211 = t_7.new()
	
	if self.font ~= nil then
		var211.font = self.font
	end
	if self.font_color ~= nil then
		local t = {}
		
		for i, v in self.font_color do
			table.insert(t, protoModule.json.deserializeNumber(v))
		end
		var211.font_color = t
	end
	if self.fontColor ~= nil then
		local t = {}
		
		for i, v in self.fontColor do
			table.insert(t, protoModule.json.deserializeNumber(v))
		end
		var211.font_color = t
	end
	if self.font_size ~= nil then
		var211.font_size = protoModule.json.deserializeNumber(self.font_size)
	end
	if self.fontSize ~= nil then
		var211.font_size = protoModule.json.deserializeNumber(self.fontSize)
	end
	if self.text_x_alignment ~= nil then
		var211.text_x_alignment = self.text_x_alignment
	end
	if self.textXAlignment ~= nil then
		var211.text_x_alignment = self.textXAlignment
	end
	return var211
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