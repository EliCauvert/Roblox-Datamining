local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local timestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p1 == nil or p1.page_entry == nil then nil else p1.page_entry,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.page_entry ~= nil then
		local var2 = self.page_entry:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var151 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var154 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
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
				var1.page_entry = pageEntryModule.PageEntry.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.input_data = t.PageEntryInputData.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var158)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var20 = t_1.new()
	
	if self.page_entry ~= nil then
		var20.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var20.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var20.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var20.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var20
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var20 = 0
	
	if self.input_data ~= nil then
		local var21 = self.input_data:encode()
		local var22, var23 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.lengthDelimited)
		var22, var181 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var183 = protoModule.writeString(var24, var25, self.roblox_component)
		buff = var24
		var20 = var25
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var20 = t_2.new()
	local var21 = 0
	while var21 < buffer.len(p2) do
		local _ = nil
		local var22 = nil
		local var23, var24, var25 = protoModule.readTag(p2, var21)
		local var26 = var23
		var22 = var24
		var21 = var25
		
		if var22 == protoModule.wireTypes.varint then
			local _ = nil
			local var27, var28 = protoModule.readVarInt(p2, var21)
			local _ = var27
			var21 = var28
			continue
		end
		if var22 == protoModule.wireTypes.lengthDelimited then
			if var26 == 1 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p2, var21)
				var21 = var30
				var20.input_data = t.PageEntryInputData.decode(var29)
			elseif var26 == 2 then
				local _ = nil
				local var31, var32 = protoModule.readBuffer(p2, var21)
				var21 = var32
				var20.roblox_component = buffer.tostring(var31)
			else
				local _ = nil
				local var33, var34 = protoModule.readVarInt(p2, var21)
				var21 = var34 + var33
			end
		elseif var22 == protoModule.wireTypes.i32 then
			local _ = nil
			local var35, var36 = protoModule.readFixed32(p2, var21)
			local _ = var35
			var21 = var36
		elseif var22 == protoModule.wireTypes.i64 then
			local _ = nil
			local var37, var38 = protoModule.readFixed64(p2, var21)
			local _ = var37
			var21 = var38
		else
			error("Unsupported wire type: " .. var187)
		end
	end
	return var20
end

function t_2:jsonEncode()
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var39 = t_2.new()
	
	if self.input_data ~= nil then
		var39.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var39.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var39.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var39.roblox_component = self.robloxComponent
	end
	return var39
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p3 == nil or p3.roblox_component == nil then "" else p3.roblox_component,
		input_data = if p3 == nil or p3.input_data == nil then nil else p3.input_data,
		cta_buttons = if p3 == nil or p3.cta_buttons == nil then nil else p3.cta_buttons
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var39 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var40, var41 = protoModule.writeTag(buff, var39, 1, protoModule.wireTypes.lengthDelimited)
		var40, var209 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var212 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var215 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
		buff = var46
		var39 = var47
	end
	local buff_1 = buffer.create(var39)
	buffer.copy(buff_1, 0, buff, 0, var39)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var39 = t_3.new()
	local var40 = 0
	while var40 < buffer.len(p3) do
		local _ = nil
		local var41 = nil
		local var42, var43, var44 = protoModule.readTag(p3, var40)
		local var45 = var42
		var41 = var43
		var40 = var44
		
		if var41 == protoModule.wireTypes.varint then
			local _ = nil
			local var46, var47 = protoModule.readVarInt(p3, var40)
			local _ = var46
			var40 = var47
			continue
		end
		if var41 == protoModule.wireTypes.lengthDelimited then
			if var45 == 1 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p3, var40)
				var40 = var49
				var39.roblox_component = buffer.tostring(var48)
			elseif var45 == 2 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p3, var40)
				var40 = var51
				var39.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var50)
				}
			elseif var45 == 3 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p3, var40)
				var40 = var53
				var39.cta_buttons = t.CtaButtonsInputData.decode(var52)
			else
				local _ = nil
				local var54, var55 = protoModule.readVarInt(p3, var40)
				var40 = var55 + var54
			end
		elseif var41 == protoModule.wireTypes.i32 then
			local _ = nil
			local var56, var57 = protoModule.readFixed32(p3, var40)
			local _ = var56
			var40 = var57
		elseif var41 == protoModule.wireTypes.i64 then
			local _ = nil
			local var58, var59 = protoModule.readFixed64(p3, var40)
			local _ = var58
			var40 = var59
		else
			error("Unsupported wire type: " .. var219)
		end
	end
	return var39
end

function t_3:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		t.attributionRow = self.input_data.value:jsonEncode()
	end
	if self.cta_buttons ~= nil then
		t.ctaButtons = self.cta_buttons:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var60 = t_3.new()
	
	if self.roblox_component ~= nil then
		var60.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var60.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var60.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var60.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var60.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var60.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var60
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var60 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var61, var62 = protoModule.writeTag(buff, var60, 1, protoModule.wireTypes.lengthDelimited)
		var61, var243 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var246 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var249 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
			buff = var67
			var60 = var68
		end
	end
	local buff_1 = buffer.create(var60)
	buffer.copy(buff_1, 0, buff, 0, var60)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var60 = t_4.new()
	local var61 = 0
	while var61 < buffer.len(p4) do
		local _ = nil
		local var62 = nil
		local var63, var64, var65 = protoModule.readTag(p4, var61)
		local var66 = var63
		var62 = var64
		var61 = var65
		
		if var62 == protoModule.wireTypes.varint then
			local _ = nil
			local var67, var68 = protoModule.readVarInt(p4, var61)
			local _ = var67
			var61 = var68
			continue
		end
		if var62 == protoModule.wireTypes.lengthDelimited then
			if var66 == 1 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p4, var61)
				var61 = var70
				var60.roblox_component = buffer.tostring(var69)
			elseif var66 == 2 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p4, var61)
				var61 = var72
				var60.input_data = { type = "image", value = t.ImageInputData.decode(var71) }
			elseif var66 == 3 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p4, var61)
				var61 = var74
				var60.input_data = { type = "video", value = t.VideoInputData.decode(var73) }
			else
				local _ = nil
				local var75, var76 = protoModule.readVarInt(p4, var61)
				var61 = var76 + var75
			end
		elseif var62 == protoModule.wireTypes.i32 then
			local _ = nil
			local var77, var78 = protoModule.readFixed32(p4, var61)
			local _ = var77
			var61 = var78
		elseif var62 == protoModule.wireTypes.i64 then
			local _ = nil
			local var79, var80 = protoModule.readFixed64(p4, var61)
			local _ = var79
			var61 = var80
		else
			error("Unsupported wire type: " .. var253)
		end
	end
	return var60
end

function t_4:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			t.image = self.input_data.value:jsonEncode()
			
			return t
		elseif self.input_data.type == "video" then
			t.video = self.input_data.value:jsonEncode()
		end
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var81 = t_4.new()
	
	if self.roblox_component ~= nil then
		var81.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var81.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var81.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var81.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var81
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p5 == nil or p5.kind == nil then nil else p5.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var81 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var82 = self.kind.value:encode()
			local var83, var84 = protoModule.writeTag(buff, var81, 1, protoModule.wireTypes.lengthDelimited)
			var83, var278 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var281 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var284 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var287 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var290 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var293 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var296 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var299 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var302 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var305 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var308 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var311 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var314 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var317 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var320 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var323 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var326 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var329 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var332 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var335 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var338 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var341 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var344 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var347 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var350 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var353 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var356 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var359 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var362 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var365 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var368 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var371 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var374 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var377 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var380 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var383 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var386 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "sandbox_content" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 50, protoModule.wireTypes.lengthDelimited)
			var194, var389 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_feed" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var197, var392 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_action_bar" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var200, var395 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_banner_image" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var203, var398 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "experience_details_sticky_header" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var206, var401 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_feed" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var209, var404 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_details_action_bar" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var212, var407 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_attribution_row" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var215, var410 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_description" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var218, var413 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_info_table" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var221, var416 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var224, var419 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "event_notifications_modal" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var227, var422 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "dev_store_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var230, var425 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "charts_feed" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var233, var428 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "filter_pills" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var236, var431 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "sort_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var239, var434 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "genre_selector" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var242, var437 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var245, var440 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var248, var443 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var251, var446 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var254, var449 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var257, var452 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "catalog_item_grid" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var260, var455 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "marketplace_offer_modal" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var263, var458 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "marketplace_item_media_header" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 907, protoModule.wireTypes.lengthDelimited)
			var266, var461 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "search_results_feed" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var269, var464 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "power_search_ai_overview" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var272, var467 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "experience_emphasis_tile" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var275, var470 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "search_autocomplete" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1003, protoModule.wireTypes.lengthDelimited)
			var278, var473 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "option_selector_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var281, var476 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "game_items_carousel" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var284, var479 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "hero_unit" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var287, var482 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var290, var485 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var293, var488 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var296, var491 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
		elseif self.kind.type == "community_announcement" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var299, var494 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var81 = var300
		elseif self.kind.type == "group_announcement" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var81, 1401, protoModule.wireTypes.lengthDelimited)
			var302, var497 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var81 = var303
		elseif self.kind.type == "settings_row" then
			local var304 = self.kind.value:encode()
			local var305, var306 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var305, var500 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
			buff = var305
			var81 = var306
		elseif self.kind.type == "settings_toggle" then
			local var307 = self.kind.value:encode()
			local var308, var309 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var308, var503 = protoModule.writeBuffer(var308, var309, var307, buffer.len(var307))
			buff = var308
			var81 = var309
		end
	end
	local buff_1 = buffer.create(var81)
	buffer.copy(buff_1, 0, buff, 0, var81)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref), structModule (ref)
	local var81 = t_5.new()
	local var82 = 0
	while var82 < buffer.len(p5) do
		local _ = nil
		local var83 = nil
		local var84, var85, var86 = protoModule.readTag(p5, var82)
		local var87 = var84
		var83 = var85
		var82 = var86
		
		if var83 == protoModule.wireTypes.varint then
			local _ = nil
			local var88, var89 = protoModule.readVarInt(p5, var82)
			local _ = var88
			var82 = var89
			continue
		end
		if var83 == protoModule.wireTypes.lengthDelimited then
			if var87 == 1 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p5, var82)
				var82 = var91
				var81.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var90)
				}
			elseif var87 == 2 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p5, var82)
				var82 = var93
				var81.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var92)
				}
			elseif var87 == 3 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p5, var82)
				var82 = var95
				var81.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var94)
				}
			elseif var87 == 4 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p5, var82)
				var82 = var97
				var81.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var96)
				}
			elseif var87 == 5 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p5, var82)
				var82 = var99
				var81.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var98)
				}
			elseif var87 == 6 then
				local _ = nil
				local var100, var101 = protoModule.readBuffer(p5, var82)
				var82 = var101
				var81.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var100)
				}
			elseif var87 == 7 then
				local _ = nil
				local var102, var103 = protoModule.readBuffer(p5, var82)
				var82 = var103
				var81.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var102)
				}
			elseif var87 == 8 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p5, var82)
				var82 = var105
				var81.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var104)
				}
			elseif var87 == 9 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p5, var82)
				var82 = var107
				var81.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var106)
				}
			elseif var87 == 10 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p5, var82)
				var82 = var109
				var81.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var108)
				}
			elseif var87 == 11 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p5, var82)
				var82 = var111
				var81.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var110)
				}
			elseif var87 == 12 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p5, var82)
				var82 = var113
				var81.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var112)
				}
			elseif var87 == 13 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p5, var82)
				var82 = var115
				var81.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var114)
				}
			elseif var87 == 14 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p5, var82)
				var82 = var117
				var81.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var116)
				}
			elseif var87 == 15 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p5, var82)
				var82 = var119
				var81.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var118)
				}
			elseif var87 == 16 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p5, var82)
				var82 = var121
				var81.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var120)
				}
			elseif var87 == 17 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p5, var82)
				var82 = var123
				var81.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var122)
				}
			elseif var87 == 20 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p5, var82)
				var82 = var125
				var81.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var124)
				}
			elseif var87 == 21 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p5, var82)
				var82 = var127
				var81.kind = { type = "card", value = t.CardInputData.decode(var126) }
			elseif var87 == 22 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p5, var82)
				var82 = var129
				var81.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var128)
				}
			elseif var87 == 23 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p5, var82)
				var82 = var131
				var81.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var130)
				}
			elseif var87 == 24 then
				local _ = nil
				local var132, var133 = protoModule.readBuffer(p5, var82)
				var82 = var133
				var81.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var132)
				}
			elseif var87 == 25 then
				local _ = nil
				local var134, var135 = protoModule.readBuffer(p5, var82)
				var82 = var135
				var81.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var134)
				}
			elseif var87 == 26 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p5, var82)
				var82 = var137
				var81.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var136)
				}
			elseif var87 == 27 then
				local _ = nil
				local var138, var139 = protoModule.readBuffer(p5, var82)
				var82 = var139
				var81.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var138)
				}
			elseif var87 == 28 then
				local _ = nil
				local var140, var141 = protoModule.readBuffer(p5, var82)
				var82 = var141
				var81.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var140)
				}
			elseif var87 == 29 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p5, var82)
				var82 = var143
				var81.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var142)
				}
			elseif var87 == 30 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p5, var82)
				var82 = var145
				var81.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var144)
				}
			elseif var87 == 31 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p5, var82)
				var82 = var147
				var81.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var146)
				}
			elseif var87 == 32 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p5, var82)
				var82 = var149
				var81.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var148)
				}
			elseif var87 == 33 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p5, var82)
				var82 = var151
				var81.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var150)
				}
			elseif var87 == 34 then
				local _ = nil
				local var152, var153 = protoModule.readBuffer(p5, var82)
				var82 = var153
				var81.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var152)
				}
			elseif var87 == 35 then
				local _ = nil
				local var154, var155 = protoModule.readBuffer(p5, var82)
				var82 = var155
				var81.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var154)
				}
			elseif var87 == 40 then
				local _ = nil
				local var156, var157 = protoModule.readBuffer(p5, var82)
				var82 = var157
				var81.kind = { type = "text", value = t.TextInputData.decode(var156) }
			elseif var87 == 41 then
				local _ = nil
				local var158, var159 = protoModule.readBuffer(p5, var82)
				var82 = var159
				var81.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var158)
				}
			elseif var87 == 42 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p5, var82)
				var82 = var161
				var81.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var160)
				}
			elseif var87 == 43 then
				local _ = nil
				local var162, var163 = protoModule.readBuffer(p5, var82)
				var82 = var163
				var81.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var162)
				}
			elseif var87 == 50 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p5, var82)
				var82 = var165
				var81.kind = {
					type = "sandbox_content",
					value = structModule.Struct.decode(var164)
				}
			elseif var87 == 500 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p5, var82)
				var82 = var167
				var81.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var166)
				}
			elseif var87 == 501 then
				local _ = nil
				local var168, var169 = protoModule.readBuffer(p5, var82)
				var82 = var169
				var81.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var168)
				}
			elseif var87 == 502 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p5, var82)
				var82 = var171
				var81.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var170)
				}
			elseif var87 == 503 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p5, var82)
				var82 = var173
				var81.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var172)
				}
			elseif var87 == 600 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p5, var82)
				var82 = var175
				var81.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var174)
				}
			elseif var87 == 601 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p5, var82)
				var82 = var177
				var81.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var176)
				}
			elseif var87 == 602 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p5, var82)
				var82 = var179
				var81.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var178)
				}
			elseif var87 == 603 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p5, var82)
				var82 = var181
				var81.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var180)
				}
			elseif var87 == 604 then
				local _ = nil
				local var182, var183 = protoModule.readBuffer(p5, var82)
				var82 = var183
				var81.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var182)
				}
			elseif var87 == 605 then
				local _ = nil
				local var184, var185 = protoModule.readBuffer(p5, var82)
				var82 = var185
				var81.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var184)
				}
			elseif var87 == 606 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p5, var82)
				var82 = var187
				var81.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var186)
				}
			elseif var87 == 700 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p5, var82)
				var82 = var189
				var81.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var188)
				}
			elseif var87 == 800 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p5, var82)
				var82 = var191
				var81.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var190)
				}
			elseif var87 == 801 then
				local _ = nil
				local var192, var193 = protoModule.readBuffer(p5, var82)
				var82 = var193
				var81.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var192)
				}
			elseif var87 == 802 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p5, var82)
				var82 = var195
				var81.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var194)
				}
			elseif var87 == 803 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p5, var82)
				var82 = var197
				var81.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var196)
				}
			elseif var87 == 900 then
				local _ = nil
				local var198, var199 = protoModule.readBuffer(p5, var82)
				var82 = var199
				var81.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var198)
				}
			elseif var87 == 901 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p5, var82)
				var82 = var201
				var81.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var200)
				}
			elseif var87 == 902 then
				local _ = nil
				local var202, var203 = protoModule.readBuffer(p5, var82)
				var82 = var203
				var81.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var202)
				}
			elseif var87 == 903 then
				local _ = nil
				local var204, var205 = protoModule.readBuffer(p5, var82)
				var82 = var205
				var81.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var204)
				}
			elseif var87 == 904 then
				local _ = nil
				local var206, var207 = protoModule.readBuffer(p5, var82)
				var82 = var207
				var81.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var206)
				}
			elseif var87 == 905 then
				local _ = nil
				local var208, var209 = protoModule.readBuffer(p5, var82)
				var82 = var209
				var81.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var208)
				}
			elseif var87 == 906 then
				local _ = nil
				local var210, var211 = protoModule.readBuffer(p5, var82)
				var82 = var211
				var81.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var210)
				}
			elseif var87 == 907 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p5, var82)
				var82 = var213
				var81.kind = {
					type = "marketplace_item_media_header",
					value = t.MarketplaceItemMediaHeaderInputData.decode(var212)
				}
			elseif var87 == 1000 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p5, var82)
				var82 = var215
				var81.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var214)
				}
			elseif var87 == 1001 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p5, var82)
				var82 = var217
				var81.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var216)
				}
			elseif var87 == 1002 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p5, var82)
				var82 = var219
				var81.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var218)
				}
			elseif var87 == 1003 then
				local _ = nil
				local var220, var221 = protoModule.readBuffer(p5, var82)
				var82 = var221
				var81.kind = {
					type = "search_autocomplete",
					value = t.SearchAutocompleteInputData.decode(var220)
				}
			elseif var87 == 1100 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p5, var82)
				var82 = var223
				var81.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var222)
				}
			elseif var87 == 1101 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p5, var82)
				var82 = var225
				var81.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var224)
				}
			elseif var87 == 1102 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p5, var82)
				var82 = var227
				var81.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var226)
				}
			elseif var87 == 1103 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p5, var82)
				var82 = var229
				var81.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var228)
				}
			elseif var87 == 1200 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p5, var82)
				var82 = var231
				var81.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var230)
				}
			elseif var87 == 1300 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p5, var82)
				var82 = var233
				var81.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var232)
				}
			elseif var87 == 1400 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p5, var82)
				var82 = var235
				var81.kind = {
					type = "community_announcement",
					value = t.CommunityAnnouncementInputData.decode(var234)
				}
			elseif var87 == 1401 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p5, var82)
				var82 = var237
				var81.kind = {
					type = "group_announcement",
					value = t.GroupAnnouncementInputData.decode(var236)
				}
			elseif var87 == 1500 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p5, var82)
				var82 = var239
				var81.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(var238)
				}
			elseif var87 == 1501 then
				local _ = nil
				local var240, var241 = protoModule.readBuffer(p5, var82)
				var82 = var241
				var81.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(var240)
				}
			else
				local _ = nil
				local var242, var243 = protoModule.readVarInt(p5, var82)
				var82 = var243 + var242
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var244, var245 = protoModule.readFixed32(p5, var82)
			local _ = var244
			var82 = var245
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var246, var247 = protoModule.readFixed64(p5, var82)
			local _ = var246
			var82 = var247
		else
			error("Unsupported wire type: " .. var507)
		end
	end
	return var81
end

function t_5:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			t.badgesGrid = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "badge_details" then
			t.badgeDetails = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "static_content" then
			t.staticContent = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_attribution_row" then
			t.experienceAttributionRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_action_module" then
			t.experienceActionModule = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_media_gallery" then
			t.experienceMediaGallery = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_description" then
			t.experienceDescription = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_stat_row" then
			t.experienceStatRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_info_table" then
			t.experienceInfoTable = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "social_link_row" then
			t.socialLinkRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_carousel" then
			t.experienceCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "song_carousel" then
			t.songCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "events_carousel" then
			t.eventsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "game_pass_collection" then
			t.gamePassCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "developer_product_collection" then
			t.developerProductCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "subscription_collection" then
			t.subscriptionCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dynamic_store_category" then
			t.dynamicStoreCategory = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "card_container" then
			t.cardContainer = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "card" then
			t.card = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dialog" then
			t.dialog = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "banner" then
			t.banner = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "tooltip" then
			t.tooltip = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "coachmark" then
			t.coachmark = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "system_banner_prompt" then
			t.systemBannerPrompt = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "age_check_upsell" then
			t.ageCheckUpsell = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "catalog_item_list" then
			t.catalogItemList = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "user_list" then
			t.userList = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_content_rating_label" then
			t.experienceContentRatingLabel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_refund_policy" then
			t.experienceRefundPolicy = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_play_with_reward" then
			t.experiencePlayWithReward = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_guidelines_dialog" then
			t.experienceGuidelinesDialog = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "community_section" then
			t.communitySection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "moments_carousel" then
			t.momentsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "text" then
			t.text = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "vertical_feed" then
			t.verticalFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "page_header" then
			t.pageHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "image_cta_section" then
			t.imageCtaSection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "sandbox_content" then
			t.sandboxContent = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_feed" then
			t.experienceDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_action_bar" then
			t.experienceDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_banner_image" then
			t.experienceDetailsBannerImage = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_sticky_header" then
			t.experienceDetailsStickyHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_feed" then
			t.eventDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_action_bar" then
			t.eventDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_attribution_row" then
			t.eventAttributionRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_description" then
			t.eventDescription = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_info_table" then
			t.eventInfoTable = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			t.eventDetailsSheetFullBleed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_notifications_modal" then
			t.eventNotificationsModal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dev_store_feed" then
			t.devStoreFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "charts_feed" then
			t.chartsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "filter_pills" then
			t.filterPills = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "sort_selector" then
			t.sortSelector = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "genre_selector" then
			t.genreSelector = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_feed" then
			t.marketplaceCatalogFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			t.marketplaceCatalogCategoryMenu = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_item_group" then
			t.marketplaceCatalogItemGroup = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			t.marketplaceCatalogItemCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			t.marketplaceCatalogHeroUnit = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "catalog_item_grid" then
			t.catalogItemGrid = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_offer_modal" then
			t.marketplaceOfferModal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_item_media_header" then
			t.marketplaceItemMediaHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "search_results_feed" then
			t.searchResultsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "power_search_ai_overview" then
			t.powerSearchAiOverview = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_emphasis_tile" then
			t.experienceEmphasisTile = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "search_autocomplete" then
			t.searchAutocomplete = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "option_selector_carousel" then
			t.optionSelectorCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "game_items_carousel" then
			t.gameItemsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "hero_unit" then
			t.heroUnit = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "friend_recommendation_carousel" then
			t.friendRecommendationCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "party_chat_conversation_upsell" then
			t.partyChatConversationUpsell = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			t.preAuthLandingStickyHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "community_announcement" then
			t.communityAnnouncement = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "group_announcement" then
			t.groupAnnouncement = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "settings_row" then
			t.settingsRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "settings_toggle" then
			t.settingsToggle = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref), structModule (ref)
	local var248 = t_5.new()
	
	if self.badges_grid ~= nil then
		var248.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var248.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var248.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var248.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var248.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var248.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var248.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var248.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var248.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var248.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var248.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var248.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var248.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var248.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var248.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var248.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var248.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var248.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var248.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var248.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var248.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var248.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var248.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var248.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var248.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var248.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var248.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var248.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var248.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var248.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var248.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var248.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var248.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var248.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var248.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var248.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var248.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var248.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var248.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var248.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var248.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var248.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var248.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var248.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var248.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var248.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var248.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var248.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var248.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var248.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var248.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var248.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var248.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var248.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var248.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var248.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var248.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var248.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var248.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var248.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var248.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var248.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var248.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var248.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var248.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var248.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var248.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var248.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.sandbox_content ~= nil then
		var248.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandbox_content)
		}
	end
	if self.sandboxContent ~= nil then
		var248.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandboxContent)
		}
	end
	if self.experience_details_feed ~= nil then
		var248.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var248.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var248.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var248.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var248.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var248.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var248.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var248.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var248.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var248.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var248.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var248.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var248.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var248.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var248.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var248.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var248.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var248.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var248.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var248.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var248.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var248.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var248.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var248.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var248.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var248.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var248.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var248.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var248.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var248.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var248.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var248.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var248.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var248.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var248.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var248.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var248.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var248.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var248.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var248.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var248.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var248.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var248.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var248.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var248.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var248.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.marketplace_item_media_header ~= nil then
		var248.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplace_item_media_header)
		}
	end
	if self.marketplaceItemMediaHeader ~= nil then
		var248.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplaceItemMediaHeader)
		}
	end
	if self.search_results_feed ~= nil then
		var248.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var248.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var248.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var248.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var248.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var248.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.search_autocomplete ~= nil then
		var248.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.search_autocomplete)
		}
	end
	if self.searchAutocomplete ~= nil then
		var248.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.searchAutocomplete)
		}
	end
	if self.option_selector_carousel ~= nil then
		var248.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var248.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var248.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var248.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var248.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var248.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var248.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var248.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var248.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var248.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var248.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var248.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var248.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var248.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.group_announcement ~= nil then
		var248.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.group_announcement)
		}
	end
	if self.groupAnnouncement ~= nil then
		var248.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.groupAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var248.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var248.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		var248.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		var248.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
		}
	end
	return var248
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p6 == nil or p6.section_title == nil then "" else p6.section_title,
		badges = if p6 == nil or p6.badges == nil then {} else p6.badges,
		collection_id = if p6 == nil or p6.collection_id == nil then "" else p6.collection_id,
		collection_position = if p6 == nil or p6.collection_position == nil then "" else p6.collection_position,
		universe_id = if p6 == nil or p6.universe_id == nil then "" else p6.universe_id
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var248 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var249, var250 = protoModule.writeTag(buff, var248, 1, protoModule.wireTypes.lengthDelimited)
		var249, var677 = protoModule.writeString(var249, var250, self.section_title)
		buff = var249
		var248 = var250
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var251 = v:encode()
			local var252, var253 = protoModule.writeTag(buff, var248, 2, protoModule.wireTypes.lengthDelimited)
			var252, var680 = protoModule.writeBuffer(var252, var253, var251, buffer.len(var251))
			buff = var252
			var248 = var253
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var254, var255 = protoModule.writeTag(buff, var248, 3, protoModule.wireTypes.lengthDelimited)
		var254, var682 = protoModule.writeString(var254, var255, self.collection_id)
		buff = var254
		var248 = var255
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var256, var257 = protoModule.writeTag(buff, var248, 4, protoModule.wireTypes.lengthDelimited)
		var256, var684 = protoModule.writeString(var256, var257, self.collection_position)
		buff = var256
		var248 = var257
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var258, var259 = protoModule.writeTag(buff, var248, 5, protoModule.wireTypes.lengthDelimited)
		var258, var686 = protoModule.writeString(var258, var259, self.universe_id)
		buff = var258
		var248 = var259
	end
	local buff_1 = buffer.create(var248)
	buffer.copy(buff_1, 0, buff, 0, var248)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var260 = t_6.new()
	local var261 = 0
	while var261 < buffer.len(p6) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p6, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p6, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p6, var261)
				var261 = var270
				var260.section_title = buffer.tostring(var269)
			elseif var266 == 2 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p6, var261)
				var261 = var272
				table.insert(var260.badges, t.BadgesGridInputData_BadgeInputData.decode(var271))
			elseif var266 == 3 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p6, var261)
				var261 = var274
				var260.collection_id = buffer.tostring(var273)
			elseif var266 == 4 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p6, var261)
				var261 = var276
				var260.collection_position = buffer.tostring(var275)
			elseif var266 == 5 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p6, var261)
				var261 = var278
				var260.universe_id = buffer.tostring(var277)
			else
				local _ = nil
				local var279, var280 = protoModule.readVarInt(p6, var261)
				var261 = var280 + var279
			end
		elseif var262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var281, var282 = protoModule.readFixed32(p6, var261)
			local _ = var281
			var261 = var282
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var283, var284 = protoModule.readFixed64(p6, var261)
			local _ = var283
			var261 = var284
		else
			error("Unsupported wire type: " .. var690)
		end
	end
	return var260
end

function t_6:jsonEncode()
	local t = {}
	
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.badges ~= nil and #self.badges > 0 then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, v:jsonEncode())
		end
		t.badges = t_1
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		t.collectionId = self.collection_id
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		t.collectionPosition = self.collection_position
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var285 = t_6.new()
	
	if self.section_title ~= nil then
		var285.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var285.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var285.badges = t_1
	end
	if self.collection_id ~= nil then
		var285.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var285.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var285.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var285.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var285.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var285.universe_id = self.universeId
	end
	return var285
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p7 == nil or p7.badge_id == nil then "" else p7.badge_id
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var286 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var287, var288 = protoModule.writeTag(buff, var286, 1, protoModule.wireTypes.lengthDelimited)
		var287, var720 = protoModule.writeString(var287, var288, self.badge_id)
		buff = var287
		var286 = var288
	end
	local buff_1 = buffer.create(var286)
	buffer.copy(buff_1, 0, buff, 0, var286)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var286 = t_7.new()
	local var287 = 0
	while var287 < buffer.len(p7) do
		local _ = nil
		local var288 = nil
		local var289, var290, var291 = protoModule.readTag(p7, var287)
		local var292 = var289
		var288 = var290
		var287 = var291
		
		if var288 == protoModule.wireTypes.varint then
			local _ = nil
			local var293, var294 = protoModule.readVarInt(p7, var287)
			local _ = var293
			var287 = var294
			continue
		end
		if var288 == protoModule.wireTypes.lengthDelimited then
			if var292 == 1 then
				local _ = nil
				local var295, var296 = protoModule.readBuffer(p7, var287)
				var287 = var296
				var286.badge_id = buffer.tostring(var295)
			else
				local _ = nil
				local var297, var298 = protoModule.readVarInt(p7, var287)
				var287 = var298 + var297
			end
		elseif var288 == protoModule.wireTypes.i32 then
			local _ = nil
			local var299, var300 = protoModule.readFixed32(p7, var287)
			local _ = var299
			var287 = var300
		elseif var288 == protoModule.wireTypes.i64 then
			local _ = nil
			local var301, var302 = protoModule.readFixed64(p7, var287)
			local _ = var301
			var287 = var302
		else
			error("Unsupported wire type: " .. var724)
		end
	end
	return var286
end

function t_7:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var303 = t_7.new()
	
	if self.badge_id ~= nil then
		var303.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var303.badge_id = self.badgeId
	end
	return var303
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p8 == nil or p8.badge_id == nil then "" else p8.badge_id,
		universe_id = if p8 == nil or p8.universe_id == nil then "" else p8.universe_id,
		localized_literals = if p8 == nil or p8.localized_literals == nil then nil else p8.localized_literals,
		creator_key = if p8 == nil or p8.creator_key == nil then "" else p8.creator_key
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var303 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var304, var305 = protoModule.writeTag(buff, var303, 1, protoModule.wireTypes.lengthDelimited)
		var304, var744 = protoModule.writeString(var304, var305, self.badge_id)
		buff = var304
		var303 = var305
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var306, var307 = protoModule.writeTag(buff, var303, 2, protoModule.wireTypes.lengthDelimited)
		var306, var746 = protoModule.writeString(var306, var307, self.universe_id)
		buff = var306
		var303 = var307
	end
	if self.localized_literals ~= nil then
		local var308 = self.localized_literals:encode()
		local var309, var310 = protoModule.writeTag(buff, var303, 3, protoModule.wireTypes.lengthDelimited)
		var309, var749 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
		buff = var309
		var303 = var310
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var311, var312 = protoModule.writeTag(buff, var303, 4, protoModule.wireTypes.lengthDelimited)
		var311, var751 = protoModule.writeString(var311, var312, self.creator_key)
		buff = var311
		var303 = var312
	end
	local buff_1 = buffer.create(var303)
	buffer.copy(buff_1, 0, buff, 0, var303)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var303 = t_8.new()
	local var304 = 0
	while var304 < buffer.len(p8) do
		local _ = nil
		local var305 = nil
		local var306, var307, var308 = protoModule.readTag(p8, var304)
		local var309 = var306
		var305 = var307
		var304 = var308
		
		if var305 == protoModule.wireTypes.varint then
			local _ = nil
			local var310, var311 = protoModule.readVarInt(p8, var304)
			local _ = var310
			var304 = var311
			continue
		end
		if var305 == protoModule.wireTypes.lengthDelimited then
			if var309 == 1 then
				local _ = nil
				local var312, var313 = protoModule.readBuffer(p8, var304)
				var304 = var313
				var303.badge_id = buffer.tostring(var312)
			elseif var309 == 2 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p8, var304)
				var304 = var315
				var303.universe_id = buffer.tostring(var314)
			elseif var309 == 3 then
				local _ = nil
				local var316, var317 = protoModule.readBuffer(p8, var304)
				var304 = var317
				var303.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var316)
			elseif var309 == 4 then
				local _ = nil
				local var318, var319 = protoModule.readBuffer(p8, var304)
				var304 = var319
				var303.creator_key = buffer.tostring(var318)
			else
				local _ = nil
				local var320, var321 = protoModule.readVarInt(p8, var304)
				var304 = var321 + var320
			end
		elseif var305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var322, var323 = protoModule.readFixed32(p8, var304)
			local _ = var322
			var304 = var323
		elseif var305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var324, var325 = protoModule.readFixed64(p8, var304)
			local _ = var324
			var304 = var325
		else
			error("Unsupported wire type: " .. var755)
		end
	end
	return var303
end

function t_8:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.localized_literals ~= nil then
		t.localizedLiterals = self.localized_literals:jsonEncode()
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var326 = t_8.new()
	
	if self.badge_id ~= nil then
		var326.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var326.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var326.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var326.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var326.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var326.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var326.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var326.creator_key = self.creatorKey
	end
	return var326
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p9 == nil or p9.info_table == nil then nil else p9.info_table,
		action_module = if p9 == nil or p9.action_module == nil then nil else p9.action_module,
		overflow_menu = if p9 == nil or p9.overflow_menu == nil then nil else p9.overflow_menu
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var326 = 0
	
	if self.info_table ~= nil then
		local var327 = self.info_table:encode()
		local var328, var329 = protoModule.writeTag(buff, var326, 1, protoModule.wireTypes.lengthDelimited)
		var328, var782 = protoModule.writeBuffer(var328, var329, var327, buffer.len(var327))
		buff = var328
		var326 = var329
	end
	if self.action_module ~= nil then
		local var330 = self.action_module:encode()
		local var331, var332 = protoModule.writeTag(buff, var326, 2, protoModule.wireTypes.lengthDelimited)
		var331, var785 = protoModule.writeBuffer(var331, var332, var330, buffer.len(var330))
		buff = var331
		var326 = var332
	end
	if self.overflow_menu ~= nil then
		local var333 = self.overflow_menu:encode()
		local var334, var335 = protoModule.writeTag(buff, var326, 3, protoModule.wireTypes.lengthDelimited)
		var334, var788 = protoModule.writeBuffer(var334, var335, var333, buffer.len(var333))
		buff = var334
		var326 = var335
	end
	local buff_1 = buffer.create(var326)
	buffer.copy(buff_1, 0, buff, 0, var326)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var326 = t_9.new()
	local var327 = 0
	while var327 < buffer.len(p9) do
		local _ = nil
		local var328 = nil
		local var329, var330, var331 = protoModule.readTag(p9, var327)
		local var332 = var329
		var328 = var330
		var327 = var331
		
		if var328 == protoModule.wireTypes.varint then
			local _ = nil
			local var333, var334 = protoModule.readVarInt(p9, var327)
			local _ = var333
			var327 = var334
			continue
		end
		if var328 == protoModule.wireTypes.lengthDelimited then
			if var332 == 1 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p9, var327)
				var327 = var336
				var326.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var335)
			elseif var332 == 2 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p9, var327)
				var327 = var338
				var326.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var337)
			elseif var332 == 3 then
				local _ = nil
				local var339, var340 = protoModule.readBuffer(p9, var327)
				var327 = var340
				var326.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var339)
			else
				local _ = nil
				local var341, var342 = protoModule.readVarInt(p9, var327)
				var327 = var342 + var341
			end
		elseif var328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var343, var344 = protoModule.readFixed32(p9, var327)
			local _ = var343
			var327 = var344
		elseif var328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var345, var346 = protoModule.readFixed64(p9, var327)
			local _ = var345
			var327 = var346
		else
			error("Unsupported wire type: " .. var792)
		end
	end
	return var326
end

function t_9:jsonEncode()
	local t = {}
	
	if self.info_table ~= nil then
		t.infoTable = self.info_table:jsonEncode()
	end
	if self.action_module ~= nil then
		t.actionModule = self.action_module:jsonEncode()
	end
	if self.overflow_menu ~= nil then
		t.overflowMenu = self.overflow_menu:jsonEncode()
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var347 = t_9.new()
	
	if self.info_table ~= nil then
		var347.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var347.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var347.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var347.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var347.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var347.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var347
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		type_label = if p10 == nil or p10.type_label == nil then "" else p10.type_label,
		earned_label = if p10 == nil or p10.earned_label == nil then "" else p10.earned_label,
		updated_label = if p10 == nil or p10.updated_label == nil then "" else p10.updated_label,
		experience_label = if p10 == nil or p10.experience_label == nil then "" else p10.experience_label,
		rarity_label = if p10 == nil or p10.rarity_label == nil then "" else p10.rarity_label,
		won_yesterday_label = if p10 == nil or p10.won_yesterday_label == nil then "" else p10.won_yesterday_label,
		won_ever_label = if p10 == nil or p10.won_ever_label == nil then "" else p10.won_ever_label
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var347 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var347, 1, protoModule.wireTypes.lengthDelimited)
		var348, var816 = protoModule.writeString(var348, var349, self.type_label)
		buff = var348
		var347 = var349
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var347, 2, protoModule.wireTypes.lengthDelimited)
		var350, var818 = protoModule.writeString(var350, var351, self.earned_label)
		buff = var350
		var347 = var351
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var347, 3, protoModule.wireTypes.lengthDelimited)
		var352, var820 = protoModule.writeString(var352, var353, self.updated_label)
		buff = var352
		var347 = var353
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var354, var355 = protoModule.writeTag(buff, var347, 4, protoModule.wireTypes.lengthDelimited)
		var354, var822 = protoModule.writeString(var354, var355, self.experience_label)
		buff = var354
		var347 = var355
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var347, 5, protoModule.wireTypes.lengthDelimited)
		var356, var824 = protoModule.writeString(var356, var357, self.rarity_label)
		buff = var356
		var347 = var357
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var358, var359 = protoModule.writeTag(buff, var347, 6, protoModule.wireTypes.lengthDelimited)
		var358, var826 = protoModule.writeString(var358, var359, self.won_yesterday_label)
		buff = var358
		var347 = var359
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var360, var361 = protoModule.writeTag(buff, var347, 7, protoModule.wireTypes.lengthDelimited)
		var360, var828 = protoModule.writeString(var360, var361, self.won_ever_label)
		buff = var360
		var347 = var361
	end
	local buff_1 = buffer.create(var347)
	buffer.copy(buff_1, 0, buff, 0, var347)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var347 = t_10.new()
	local var348 = 0
	while var348 < buffer.len(p10) do
		local _ = nil
		local var349 = nil
		local var350, var351, var352 = protoModule.readTag(p10, var348)
		local var353 = var350
		var349 = var351
		var348 = var352
		
		if var349 == protoModule.wireTypes.varint then
			local _ = nil
			local var354, var355 = protoModule.readVarInt(p10, var348)
			local _ = var354
			var348 = var355
			continue
		end
		if var349 == protoModule.wireTypes.lengthDelimited then
			if var353 == 1 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var348)
				var348 = var357
				var347.type_label = buffer.tostring(var356)
			elseif var353 == 2 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var348)
				var348 = var359
				var347.earned_label = buffer.tostring(var358)
			elseif var353 == 3 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var348)
				var348 = var361
				var347.updated_label = buffer.tostring(var360)
			elseif var353 == 4 then
				local _ = nil
				local var362, var363 = protoModule.readBuffer(p10, var348)
				var348 = var363
				var347.experience_label = buffer.tostring(var362)
			elseif var353 == 5 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p10, var348)
				var348 = var365
				var347.rarity_label = buffer.tostring(var364)
			elseif var353 == 6 then
				local _ = nil
				local var366, var367 = protoModule.readBuffer(p10, var348)
				var348 = var367
				var347.won_yesterday_label = buffer.tostring(var366)
			elseif var353 == 7 then
				local _ = nil
				local var368, var369 = protoModule.readBuffer(p10, var348)
				var348 = var369
				var347.won_ever_label = buffer.tostring(var368)
			else
				local _ = nil
				local var370, var371 = protoModule.readVarInt(p10, var348)
				var348 = var371 + var370
			end
		elseif var349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var372, var373 = protoModule.readFixed32(p10, var348)
			local _ = var372
			var348 = var373
		elseif var349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var374, var375 = protoModule.readFixed64(p10, var348)
			local _ = var374
			var348 = var375
		else
			error("Unsupported wire type: " .. var832)
		end
	end
	return var347
end

function t_10:jsonEncode()
	local t = {}
	
	if self.type_label ~= nil and self.type_label ~= "" then
		t.typeLabel = self.type_label
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		t.earnedLabel = self.earned_label
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		t.updatedLabel = self.updated_label
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		t.experienceLabel = self.experience_label
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		t.rarityLabel = self.rarity_label
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		t.wonYesterdayLabel = self.won_yesterday_label
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		t.wonEverLabel = self.won_ever_label
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref)
	local var376 = t_10.new()
	
	if self.type_label ~= nil then
		var376.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var376.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var376.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var376.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var376.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var376.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var376.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var376.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var376.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var376.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var376.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var376.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var376.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var376.won_ever_label = self.wonEverLabel
	end
	return var376
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p11 == nil or p11.share == nil then "" else p11.share,
		report = if p11 == nil or p11.report == nil then "" else p11.report
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var376 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var377, var378 = protoModule.writeTag(buff, var376, 1, protoModule.wireTypes.lengthDelimited)
		var377, var864 = protoModule.writeString(var377, var378, self.share)
		buff = var377
		var376 = var378
	end
	if self.report ~= nil and self.report ~= "" then
		local var379, var380 = protoModule.writeTag(buff, var376, 2, protoModule.wireTypes.lengthDelimited)
		var379, var866 = protoModule.writeString(var379, var380, self.report)
		buff = var379
		var376 = var380
	end
	local buff_1 = buffer.create(var376)
	buffer.copy(buff_1, 0, buff, 0, var376)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var376 = t_11.new()
	local var377 = 0
	while var377 < buffer.len(p11) do
		local _ = nil
		local var378 = nil
		local var379, var380, var381 = protoModule.readTag(p11, var377)
		local var382 = var379
		var378 = var380
		var377 = var381
		
		if var378 == protoModule.wireTypes.varint then
			local _ = nil
			local var383, var384 = protoModule.readVarInt(p11, var377)
			local _ = var383
			var377 = var384
			continue
		end
		if var378 == protoModule.wireTypes.lengthDelimited then
			if var382 == 1 then
				local _ = nil
				local var385, var386 = protoModule.readBuffer(p11, var377)
				var377 = var386
				var376.share = buffer.tostring(var385)
			elseif var382 == 2 then
				local _ = nil
				local var387, var388 = protoModule.readBuffer(p11, var377)
				var377 = var388
				var376.report = buffer.tostring(var387)
			else
				local _ = nil
				local var389, var390 = protoModule.readVarInt(p11, var377)
				var377 = var390 + var389
			end
		elseif var378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var391, var392 = protoModule.readFixed32(p11, var377)
			local _ = var391
			var377 = var392
		elseif var378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var393, var394 = protoModule.readFixed64(p11, var377)
			local _ = var393
			var377 = var394
		else
			error("Unsupported wire type: " .. var870)
		end
	end
	return var376
end

function t_11:jsonEncode()
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref)
	local var395 = t_11.new()
	
	if self.share ~= nil then
		var395.share = self.share
	end
	if self.report ~= nil then
		var395.report = self.report
	end
	return var395
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p12 == nil or p12.report == nil then "" else p12.report,
		remove = if p12 == nil or p12.remove == nil then "" else p12.remove
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var395 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var396, var397 = protoModule.writeTag(buff, var395, 1, protoModule.wireTypes.lengthDelimited)
		var396, var892 = protoModule.writeString(var396, var397, self.report)
		buff = var396
		var395 = var397
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var398, var399 = protoModule.writeTag(buff, var395, 2, protoModule.wireTypes.lengthDelimited)
		var398, var894 = protoModule.writeString(var398, var399, self.remove)
		buff = var398
		var395 = var399
	end
	local buff_1 = buffer.create(var395)
	buffer.copy(buff_1, 0, buff, 0, var395)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var395 = t_12.new()
	local var396 = 0
	while var396 < buffer.len(p12) do
		local _ = nil
		local var397 = nil
		local var398, var399, var400 = protoModule.readTag(p12, var396)
		local var401 = var398
		var397 = var399
		var396 = var400
		
		if var397 == protoModule.wireTypes.varint then
			local _ = nil
			local var402, var403 = protoModule.readVarInt(p12, var396)
			local _ = var402
			var396 = var403
			continue
		end
		if var397 == protoModule.wireTypes.lengthDelimited then
			if var401 == 1 then
				local _ = nil
				local var404, var405 = protoModule.readBuffer(p12, var396)
				var396 = var405
				var395.report = buffer.tostring(var404)
			elseif var401 == 2 then
				local _ = nil
				local var406, var407 = protoModule.readBuffer(p12, var396)
				var396 = var407
				var395.remove = buffer.tostring(var406)
			else
				local _ = nil
				local var408, var409 = protoModule.readVarInt(p12, var396)
				var396 = var409 + var408
			end
		elseif var397 == protoModule.wireTypes.i32 then
			local _ = nil
			local var410, var411 = protoModule.readFixed32(p12, var396)
			local _ = var410
			var396 = var411
		elseif var397 == protoModule.wireTypes.i64 then
			local _ = nil
			local var412, var413 = protoModule.readFixed64(p12, var396)
			local _ = var412
			var396 = var413
		else
			error("Unsupported wire type: " .. var898)
		end
	end
	return var395
end

function t_12:jsonEncode()
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref)
	local var414 = t_12.new()
	
	if self.report ~= nil then
		var414.report = self.report
	end
	if self.remove ~= nil then
		var414.remove = self.remove
	end
	return var414
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_)
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_)
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref)
	local var414 = t_13.new()
	local var415 = 0
	while var415 < buffer.len(p13) do
		local var416 = nil
		local _ = nil
		local var417, var418, var419 = protoModule.readTag(p13, var415)
		var416 = var417
		local var420 = var418
		var415 = var419
		
		if var420 == protoModule.wireTypes.varint then
			local _ = nil
			local var421, var422 = protoModule.readVarInt(p13, var415)
			local _ = var421
			var415 = var422
		elseif var420 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var423, var424 = protoModule.readVarInt(p13, var415)
			var415 = var424 + var423
		elseif var420 == protoModule.wireTypes.i32 then
			local _ = nil
			local var425, var426 = protoModule.readFixed32(p13, var415)
			local _ = var425
			var415 = var426
		elseif var420 == protoModule.wireTypes.i64 then
			local _ = nil
			local var427, var428 = protoModule.readFixed64(p13, var415)
			local _ = var427
			var415 = var428
		else
			error("Unsupported wire type: " .. var924)
		end
	end
	return var414
end

function t_13.jsonEncode(_)
	return {}
end

function t_13.jsonDecode(_)
	-- upvalues: t_13 (ref)
	return t_13.new()
end

t_13.descriptor = {
	name = "StaticInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
}
t.StaticInputData = t_13
typeRegistryModule.default:register(t.StaticInputData)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key,
		entry_map = if p14 == nil or p14.entry_map == nil then {} else p14.entry_map,
		entry_order = if p14 == nil or p14.entry_order == nil then {} else p14.entry_order,
		entry_order_map = if p14 == nil or p14.entry_order_map == nil then {} else p14.entry_order_map
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var429 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var430, var431 = protoModule.writeTag(buff, var429, 1, protoModule.wireTypes.lengthDelimited)
		var430, var936 = protoModule.writeString(var430, var431, self.universe_id)
		buff = var430
		var429 = var431
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var432, var433 = protoModule.writeTag(buff, var429, 2, protoModule.wireTypes.lengthDelimited)
		var432, var938 = protoModule.writeString(var432, var433, self.creator_key)
		buff = var432
		var429 = var433
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var434, var435 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var434, var940 = protoModule.writeString(var434, var435, i)
			local var436 = v:encode()
			var435, var942 = protoModule.writeTag(var434, var435, 2, protoModule.wireTypes.lengthDelimited)
			var435, var942 = protoModule.writeBuffer(var435, var942, var436, buffer.len(var436))
			local var437 = var435
			local var438 = var942
			local var439, var440 = protoModule.writeTag(buff, var429, 3, protoModule.wireTypes.lengthDelimited)
			var439, var946 = protoModule.writeBuffer(var439, var440, var437, var438)
			buff = var439
			var429 = var440
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var441, var442 = protoModule.writeTag(buff, var429, 4, protoModule.wireTypes.lengthDelimited)
			var441, var948 = protoModule.writeString(var441, var442, v)
			buff = var441
			var429 = var442
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var443, var444 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var443, var950 = protoModule.writeString(var443, var444, i)
			local var445 = v:encode()
			var444, var952 = protoModule.writeTag(var443, var444, 2, protoModule.wireTypes.lengthDelimited)
			var444, var952 = protoModule.writeBuffer(var444, var952, var445, buffer.len(var445))
			local var446 = var444
			local var447 = var952
			local var448, var449 = protoModule.writeTag(buff, var429, 5, protoModule.wireTypes.lengthDelimited)
			var448, var956 = protoModule.writeBuffer(var448, var449, var446, var447)
			buff = var448
			var429 = var449
		end
	end
	local buff_1 = buffer.create(var429)
	buffer.copy(buff_1, 0, buff, 0, var429)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var450 = t_14.new()
	local var451 = 0
	while var451 < buffer.len(p14) do
		local _ = nil
		local var452 = nil
		local var453, var454, var455 = protoModule.readTag(p14, var451)
		local var456 = var453
		var452 = var454
		var451 = var455
		
		if var452 == protoModule.wireTypes.varint then
			local _ = nil
			local var457, var458 = protoModule.readVarInt(p14, var451)
			local _ = var457
			var451 = var458
			continue
		end
		if var452 == protoModule.wireTypes.lengthDelimited then
			if var456 == 1 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p14, var451)
				var451 = var460
				var450.universe_id = buffer.tostring(var459)
			elseif var456 == 2 then
				local _ = nil
				local var461, var462 = protoModule.readBuffer(p14, var451)
				var451 = var462
				var450.creator_key = buffer.tostring(var461)
			elseif var456 == 3 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p14, var451)
				var451 = var464
				var463 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var463)
				var450.entry_map[var463.key or ""] = var463.value or t.FeedEntry.new()
			elseif var456 == 4 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p14, var451)
				var451 = var466
				table.insert(var450.entry_order, buffer.tostring(var465))
			elseif var456 == 5 then
				local _ = nil
				local var467, var468 = protoModule.readBuffer(p14, var451)
				var451 = var468
				var467 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var467)
				var450.entry_order_map[var467.key or ""] = var467.value or t.EntryOrder.new()
			else
				local _ = nil
				local var469, var470 = protoModule.readVarInt(p14, var451)
				var451 = var470 + var469
			end
		elseif var452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var471, var472 = protoModule.readFixed32(p14, var451)
			local _ = var471
			var451 = var472
		elseif var452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var473, var474 = protoModule.readFixed64(p14, var451)
			local _ = var473
			var451 = var474
		else
			error("Unsupported wire type: " .. var960)
		end
	end
	return var450
end

function t_14:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryOrderMap = t_1
	end
	return t
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), t (ref)
	local var475 = t_14.new()
	
	if self.universe_id ~= nil then
		var475.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var475.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var475.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var475.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var475.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var475.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var475.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var475.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var475.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var475.entry_order_map = t_1
	end
	return var475
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p15 == nil or p15.key == nil then "" else p15.key,
		value = if p15 == nil or p15.value == nil then nil else p15.value
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var476 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var477, var478 = protoModule.writeTag(buff, var476, 1, protoModule.wireTypes.lengthDelimited)
		var477, var997 = protoModule.writeString(var477, var478, self.key)
		buff = var477
		var476 = var478
	end
	if self.value ~= nil then
		local var479 = self.value:encode()
		local var480, var481 = protoModule.writeTag(buff, var476, 2, protoModule.wireTypes.lengthDelimited)
		var480, var1000 = protoModule.writeBuffer(var480, var481, var479, buffer.len(var479))
		buff = var480
		var476 = var481
	end
	local buff_1 = buffer.create(var476)
	buffer.copy(buff_1, 0, buff, 0, var476)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var476 = t_15.new()
	local var477 = 0
	while var477 < buffer.len(p15) do
		local _ = nil
		local var478 = nil
		local var479, var480, var481 = protoModule.readTag(p15, var477)
		local var482 = var479
		var478 = var480
		var477 = var481
		
		if var478 == protoModule.wireTypes.varint then
			local _ = nil
			local var483, var484 = protoModule.readVarInt(p15, var477)
			local _ = var483
			var477 = var484
			continue
		end
		if var478 == protoModule.wireTypes.lengthDelimited then
			if var482 == 1 then
				local _ = nil
				local var485, var486 = protoModule.readBuffer(p15, var477)
				var477 = var486
				var476.key = buffer.tostring(var485)
			elseif var482 == 2 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p15, var477)
				var477 = var488
				var476.value = t.FeedEntry.decode(var487)
			else
				local _ = nil
				local var489, var490 = protoModule.readVarInt(p15, var477)
				var477 = var490 + var489
			end
		elseif var478 == protoModule.wireTypes.i32 then
			local _ = nil
			local var491, var492 = protoModule.readFixed32(p15, var477)
			local _ = var491
			var477 = var492
		elseif var478 == protoModule.wireTypes.i64 then
			local _ = nil
			local var493, var494 = protoModule.readFixed64(p15, var477)
			local _ = var493
			var477 = var494
		else
			error("Unsupported wire type: " .. var1004)
		end
	end
	return var476
end

function t_15:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref)
	local var495 = t_15.new()
	
	if self.key ~= nil then
		var495.key = self.key
	end
	if self.value ~= nil then
		var495.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var495
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p16 == nil or p16.key == nil then "" else p16.key,
		value = if p16 == nil or p16.value == nil then nil else p16.value
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var495 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var496, var497 = protoModule.writeTag(buff, var495, 1, protoModule.wireTypes.lengthDelimited)
		var496, var1026 = protoModule.writeString(var496, var497, self.key)
		buff = var496
		var495 = var497
	end
	if self.value ~= nil then
		local var498 = self.value:encode()
		local var499, var500 = protoModule.writeTag(buff, var495, 2, protoModule.wireTypes.lengthDelimited)
		var499, var1029 = protoModule.writeBuffer(var499, var500, var498, buffer.len(var498))
		buff = var499
		var495 = var500
	end
	local buff_1 = buffer.create(var495)
	buffer.copy(buff_1, 0, buff, 0, var495)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var495 = t_16.new()
	local var496 = 0
	while var496 < buffer.len(p16) do
		local _ = nil
		local var497 = nil
		local var498, var499, var500 = protoModule.readTag(p16, var496)
		local var501 = var498
		var497 = var499
		var496 = var500
		
		if var497 == protoModule.wireTypes.varint then
			local _ = nil
			local var502, var503 = protoModule.readVarInt(p16, var496)
			local _ = var502
			var496 = var503
			continue
		end
		if var497 == protoModule.wireTypes.lengthDelimited then
			if var501 == 1 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p16, var496)
				var496 = var505
				var495.key = buffer.tostring(var504)
			elseif var501 == 2 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p16, var496)
				var496 = var507
				var495.value = t.EntryOrder.decode(var506)
			else
				local _ = nil
				local var508, var509 = protoModule.readVarInt(p16, var496)
				var496 = var509 + var508
			end
		elseif var497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var510, var511 = protoModule.readFixed32(p16, var496)
			local _ = var510
			var496 = var511
		elseif var497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var512, var513 = protoModule.readFixed64(p16, var496)
			local _ = var512
			var496 = var513
		else
			error("Unsupported wire type: " .. var1033)
		end
	end
	return var495
end

function t_16:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), t (ref)
	local var514 = t_16.new()
	
	if self.key ~= nil then
		var514.key = self.key
	end
	if self.value ~= nil then
		var514.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var514
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p17 == nil or p17.items == nil then {} else p17.items
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var514 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var515, var516 = protoModule.writeTag(buff, var514, 1, protoModule.wireTypes.lengthDelimited)
			var515, var1055 = protoModule.writeString(var515, var516, v)
			buff = var515
			var514 = var516
		end
	end
	local buff_1 = buffer.create(var514)
	buffer.copy(buff_1, 0, buff, 0, var514)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var517 = t_17.new()
	local var518 = 0
	while var518 < buffer.len(p17) do
		local _ = nil
		local var519 = nil
		local var520, var521, var522 = protoModule.readTag(p17, var518)
		local var523 = var520
		var519 = var521
		var518 = var522
		
		if var519 == protoModule.wireTypes.varint then
			local _ = nil
			local var524, var525 = protoModule.readVarInt(p17, var518)
			local _ = var524
			var518 = var525
			continue
		end
		if var519 == protoModule.wireTypes.lengthDelimited then
			if var523 == 1 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p17, var518)
				var518 = var527
				table.insert(var517.items, buffer.tostring(var526))
			else
				local _ = nil
				local var528, var529 = protoModule.readVarInt(p17, var518)
				var518 = var529 + var528
			end
		elseif var519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var530, var531 = protoModule.readFixed32(p17, var518)
			local _ = var530
			var518 = var531
		elseif var519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var532, var533 = protoModule.readFixed64(p17, var518)
			local _ = var532
			var518 = var533
		else
			error("Unsupported wire type: " .. var1059)
		end
	end
	return var517
end

function t_17:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v)
		end
		t.items = t_1
	end
	return t
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref)
	local var534 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var534.items = t
	end
	return var534
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p18 == nil or p18.universe_id == nil then "" else p18.universe_id,
		user_owns_experience = if p18 == nil or p18.user_owns_experience == nil then false else p18.user_owns_experience
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var535 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var536, var537 = protoModule.writeTag(buff, var535, 1, protoModule.wireTypes.lengthDelimited)
		var536, var1081 = protoModule.writeString(var536, var537, self.universe_id)
		buff = var536
		var535 = var537
	end
	if self.user_owns_experience then
		local var538, var539 = protoModule.writeTag(buff, var535, 2, protoModule.wireTypes.varint)
		var538, var1083 = protoModule.writeVarInt(var538, var539, if self.user_owns_experience then 1 else 0)
		buff = var538
		var535 = var539
	end
	local buff_1 = buffer.create(var535)
	buffer.copy(buff_1, 0, buff, 0, var535)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var535 = t_18.new()
	local var536 = 0
	while var536 < buffer.len(p18) do
		local _ = nil
		local var537 = nil
		local var538, var539, var540 = protoModule.readTag(p18, var536)
		local var541 = var538
		var537 = var539
		var536 = var540
		
		if var537 == protoModule.wireTypes.varint then
			if var541 == 2 then
				local _ = nil
				local var542, var543 = protoModule.readVarInt(p18, var536)
				var536 = var543
				var535.user_owns_experience = var542 ~= 0
			else
				local _ = nil
				local var544, var545 = protoModule.readVarInt(p18, var536)
				local _ = var544
				var536 = var545
			end
		end
		if var537 == protoModule.wireTypes.lengthDelimited then
			if var541 == 1 then
				local _ = nil
				local var546, var547 = protoModule.readBuffer(p18, var536)
				var536 = var547
				var535.universe_id = buffer.tostring(var546)
			else
				local _ = nil
				local var548, var549 = protoModule.readVarInt(p18, var536)
				var536 = var549 + var548
			end
		elseif var537 == protoModule.wireTypes.i32 then
			local _ = nil
			local var550, var551 = protoModule.readFixed32(p18, var536)
			local _ = var550
			var536 = var551
		elseif var537 == protoModule.wireTypes.i64 then
			local _ = nil
			local var552, var553 = protoModule.readFixed64(p18, var536)
			local _ = var552
			var536 = var553
		else
			error("Unsupported wire type: " .. var1087)
		end
	end
	return var535
end

function t_18:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref)
	local var554 = t_18.new()
	
	if self.universe_id ~= nil then
		var554.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var554.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var554.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var554.user_owns_experience = self.userOwnsExperience
	end
	return var554
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p19)
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p19 == nil or p19.media_asset_id == nil then "" else p19.media_asset_id
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var554 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var555, var556 = protoModule.writeTag(buff, var554, 1, protoModule.wireTypes.lengthDelimited)
		var555, var1109 = protoModule.writeString(var555, var556, self.media_asset_id)
		buff = var555
		var554 = var556
	end
	local buff_1 = buffer.create(var554)
	buffer.copy(buff_1, 0, buff, 0, var554)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var554 = t_19.new()
	local var555 = 0
	while var555 < buffer.len(p19) do
		local _ = nil
		local var556 = nil
		local var557, var558, var559 = protoModule.readTag(p19, var555)
		local var560 = var557
		var556 = var558
		var555 = var559
		
		if var556 == protoModule.wireTypes.varint then
			local _ = nil
			local var561, var562 = protoModule.readVarInt(p19, var555)
			local _ = var561
			var555 = var562
			continue
		end
		if var556 == protoModule.wireTypes.lengthDelimited then
			if var560 == 1 then
				local _ = nil
				local var563, var564 = protoModule.readBuffer(p19, var555)
				var555 = var564
				var554.media_asset_id = buffer.tostring(var563)
			else
				local _ = nil
				local var565, var566 = protoModule.readVarInt(p19, var555)
				var555 = var566 + var565
			end
		elseif var556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var567, var568 = protoModule.readFixed32(p19, var555)
			local _ = var567
			var555 = var568
		elseif var556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var569, var570 = protoModule.readFixed64(p19, var555)
			local _ = var569
			var555 = var570
		else
			error("Unsupported wire type: " .. var1113)
		end
	end
	return var554
end

function t_19:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref)
	local var571 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var571.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var571.media_asset_id = self.mediaAssetId
	end
	return var571
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p20 == nil or p20.universe_id == nil then "" else p20.universe_id
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var571 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var572, var573 = protoModule.writeTag(buff, var571, 1, protoModule.wireTypes.lengthDelimited)
		var572, var1133 = protoModule.writeString(var572, var573, self.universe_id)
		buff = var572
		var571 = var573
	end
	local buff_1 = buffer.create(var571)
	buffer.copy(buff_1, 0, buff, 0, var571)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var571 = t_20.new()
	local var572 = 0
	while var572 < buffer.len(p20) do
		local _ = nil
		local var573 = nil
		local var574, var575, var576 = protoModule.readTag(p20, var572)
		local var577 = var574
		var573 = var575
		var572 = var576
		
		if var573 == protoModule.wireTypes.varint then
			local _ = nil
			local var578, var579 = protoModule.readVarInt(p20, var572)
			local _ = var578
			var572 = var579
			continue
		end
		if var573 == protoModule.wireTypes.lengthDelimited then
			if var577 == 1 then
				local _ = nil
				local var580, var581 = protoModule.readBuffer(p20, var572)
				var572 = var581
				var571.universe_id = buffer.tostring(var580)
			else
				local _ = nil
				local var582, var583 = protoModule.readVarInt(p20, var572)
				var572 = var583 + var582
			end
		elseif var573 == protoModule.wireTypes.i32 then
			local _ = nil
			local var584, var585 = protoModule.readFixed32(p20, var572)
			local _ = var584
			var572 = var585
		elseif var573 == protoModule.wireTypes.i64 then
			local _ = nil
			local var586, var587 = protoModule.readFixed64(p20, var572)
			local _ = var586
			var572 = var587
		else
			error("Unsupported wire type: " .. var1137)
		end
	end
	return var571
end

function t_20:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref)
	local var588 = t_20.new()
	
	if self.universe_id ~= nil then
		var588.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var588.universe_id = self.universeId
	end
	return var588
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p21 == nil or p21.universe_id == nil then "" else p21.universe_id,
		creator_key = if p21 == nil or p21.creator_key == nil then "" else p21.creator_key
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var588 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var589, var590 = protoModule.writeTag(buff, var588, 1, protoModule.wireTypes.lengthDelimited)
		var589, var1157 = protoModule.writeString(var589, var590, self.universe_id)
		buff = var589
		var588 = var590
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var591, var592 = protoModule.writeTag(buff, var588, 2, protoModule.wireTypes.lengthDelimited)
		var591, var1159 = protoModule.writeString(var591, var592, self.creator_key)
		buff = var591
		var588 = var592
	end
	local buff_1 = buffer.create(var588)
	buffer.copy(buff_1, 0, buff, 0, var588)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var588 = t_21.new()
	local var589 = 0
	while var589 < buffer.len(p21) do
		local _ = nil
		local var590 = nil
		local var591, var592, var593 = protoModule.readTag(p21, var589)
		local var594 = var591
		var590 = var592
		var589 = var593
		
		if var590 == protoModule.wireTypes.varint then
			local _ = nil
			local var595, var596 = protoModule.readVarInt(p21, var589)
			local _ = var595
			var589 = var596
			continue
		end
		if var590 == protoModule.wireTypes.lengthDelimited then
			if var594 == 1 then
				local _ = nil
				local var597, var598 = protoModule.readBuffer(p21, var589)
				var589 = var598
				var588.universe_id = buffer.tostring(var597)
			elseif var594 == 2 then
				local _ = nil
				local var599, var600 = protoModule.readBuffer(p21, var589)
				var589 = var600
				var588.creator_key = buffer.tostring(var599)
			else
				local _ = nil
				local var601, var602 = protoModule.readVarInt(p21, var589)
				var589 = var602 + var601
			end
		elseif var590 == protoModule.wireTypes.i32 then
			local _ = nil
			local var603, var604 = protoModule.readFixed32(p21, var589)
			local _ = var603
			var589 = var604
		elseif var590 == protoModule.wireTypes.i64 then
			local _ = nil
			local var605, var606 = protoModule.readFixed64(p21, var589)
			local _ = var605
			var589 = var606
		else
			error("Unsupported wire type: " .. var1163)
		end
	end
	return var588
end

function t_21:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode()
	-- upvalues: t_21 (ref)
	local var607 = t_21.new()
	
	if self.universe_id ~= nil then
		var607.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var607.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var607.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var607.creator_key = self.creatorKey
	end
	return var607
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		universe_id = if p22 == nil or p22.universe_id == nil then "" else p22.universe_id,
		root_place_id = if p22 == nil or p22.root_place_id == nil then "" else p22.root_place_id,
		connection_played_display_name = if p22 == nil or p22.connection_played_display_name == nil then "" else p22.connection_played_display_name,
		upsell_prompt = if p22 == nil or p22.upsell_prompt == nil then "" else p22.upsell_prompt,
		connection_played_users = if p22 == nil or p22.connection_played_users == nil then {} else p22.connection_played_users,
		connection_played_num_others = if p22 == nil or p22.connection_played_num_others == nil then 0 else p22.connection_played_num_others,
		connection_played_total_count = if p22 == nil or p22.connection_played_total_count == nil then 0 else p22.connection_played_total_count
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var607 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var608, var609 = protoModule.writeTag(buff, var607, 1, protoModule.wireTypes.lengthDelimited)
		var608, var1185 = protoModule.writeString(var608, var609, self.universe_id)
		buff = var608
		var607 = var609
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var610, var611 = protoModule.writeTag(buff, var607, 2, protoModule.wireTypes.lengthDelimited)
		var610, var1187 = protoModule.writeString(var610, var611, self.root_place_id)
		buff = var610
		var607 = var611
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var607, 3, protoModule.wireTypes.lengthDelimited)
		var612, var1189 = protoModule.writeString(var612, var613, self.connection_played_display_name)
		buff = var612
		var607 = var613
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var614, var615 = protoModule.writeTag(buff, var607, 4, protoModule.wireTypes.lengthDelimited)
		var614, var1191 = protoModule.writeString(var614, var615, self.upsell_prompt)
		buff = var614
		var607 = var615
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var616 = v:encode()
			local var617, var618 = protoModule.writeTag(buff, var607, 5, protoModule.wireTypes.lengthDelimited)
			var617, var1194 = protoModule.writeBuffer(var617, var618, var616, buffer.len(var616))
			buff = var617
			var607 = var618
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var619, var620 = protoModule.writeTag(buff, var607, 6, protoModule.wireTypes.varint)
		var619, var1196 = protoModule.writeVarInt(var619, var620, self.connection_played_num_others)
		buff = var619
		var607 = var620
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var621, var622 = protoModule.writeTag(buff, var607, 7, protoModule.wireTypes.varint)
		var621, var1198 = protoModule.writeVarInt(var621, var622, self.connection_played_total_count)
		buff = var621
		var607 = var622
	end
	local buff_1 = buffer.create(var607)
	buffer.copy(buff_1, 0, buff, 0, var607)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var623 = t_22.new()
	local var624 = 0
	while var624 < buffer.len(p22) do
		local _ = nil
		local var625 = nil
		local var626, var627, var628 = protoModule.readTag(p22, var624)
		local var629 = var626
		var625 = var627
		var624 = var628
		
		if var625 == protoModule.wireTypes.varint then
			if var629 == 6 then
				local _ = nil
				local var630, var631 = protoModule.readVarIntI32(p22, var624)
				var624 = var631
				var623.connection_played_num_others = var630
			elseif var629 == 7 then
				local _ = nil
				local var632, var633 = protoModule.readVarIntI32(p22, var624)
				var624 = var633
				var623.connection_played_total_count = var632
			else
				local _ = nil
				local var634, var635 = protoModule.readVarInt(p22, var624)
				local _ = var634
				var624 = var635
			end
		end
		if var625 == protoModule.wireTypes.lengthDelimited then
			if var629 == 1 then
				local _ = nil
				local var636, var637 = protoModule.readBuffer(p22, var624)
				var624 = var637
				var623.universe_id = buffer.tostring(var636)
			elseif var629 == 2 then
				local _ = nil
				local var638, var639 = protoModule.readBuffer(p22, var624)
				var624 = var639
				var623.root_place_id = buffer.tostring(var638)
			elseif var629 == 3 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p22, var624)
				var624 = var641
				var623.connection_played_display_name = buffer.tostring(var640)
			elseif var629 == 4 then
				local _ = nil
				local var642, var643 = protoModule.readBuffer(p22, var624)
				var624 = var643
				var623.upsell_prompt = buffer.tostring(var642)
			elseif var629 == 5 then
				local _ = nil
				local var644, var645 = protoModule.readBuffer(p22, var624)
				var624 = var645
				table.insert(var623.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var644))
			else
				local _ = nil
				local var646, var647 = protoModule.readVarInt(p22, var624)
				var624 = var647 + var646
			end
		elseif var625 == protoModule.wireTypes.i32 then
			local _ = nil
			local var648, var649 = protoModule.readFixed32(p22, var624)
			local _ = var648
			var624 = var649
		elseif var625 == protoModule.wireTypes.i64 then
			local _ = nil
			local var650, var651 = protoModule.readFixed64(p22, var624)
			local _ = var650
			var624 = var651
		else
			error("Unsupported wire type: " .. var1202)
		end
	end
	return var623
end

function t_22:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		t.rootPlaceId = self.root_place_id
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		t.connectionPlayedDisplayName = self.connection_played_display_name
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.connectionPlayedUsers = t_1
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		t.connectionPlayedNumOthers = self.connection_played_num_others
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		t.connectionPlayedTotalCount = self.connection_played_total_count
	end
	return t
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), t (ref)
	local var652 = t_22.new()
	
	if self.universe_id ~= nil then
		var652.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var652.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var652.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var652.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var652.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var652.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var652.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var652.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var652.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var652.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var652.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var652.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var652.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var652.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var652
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p23)
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p23 == nil or p23.user_id == nil then "" else p23.user_id
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var653 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var654, var655 = protoModule.writeTag(buff, var653, 1, protoModule.wireTypes.lengthDelimited)
		var654, var1237 = protoModule.writeString(var654, var655, self.user_id)
		buff = var654
		var653 = var655
	end
	local buff_1 = buffer.create(var653)
	buffer.copy(buff_1, 0, buff, 0, var653)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var653 = t_23.new()
	local var654 = 0
	while var654 < buffer.len(p23) do
		local _ = nil
		local var655 = nil
		local var656, var657, var658 = protoModule.readTag(p23, var654)
		local var659 = var656
		var655 = var657
		var654 = var658
		
		if var655 == protoModule.wireTypes.varint then
			local _ = nil
			local var660, var661 = protoModule.readVarInt(p23, var654)
			local _ = var660
			var654 = var661
			continue
		end
		if var655 == protoModule.wireTypes.lengthDelimited then
			if var659 == 1 then
				local _ = nil
				local var662, var663 = protoModule.readBuffer(p23, var654)
				var654 = var663
				var653.user_id = buffer.tostring(var662)
			else
				local _ = nil
				local var664, var665 = protoModule.readVarInt(p23, var654)
				var654 = var665 + var664
			end
		elseif var655 == protoModule.wireTypes.i32 then
			local _ = nil
			local var666, var667 = protoModule.readFixed32(p23, var654)
			local _ = var666
			var654 = var667
		elseif var655 == protoModule.wireTypes.i64 then
			local _ = nil
			local var668, var669 = protoModule.readFixed64(p23, var654)
			local _ = var668
			var654 = var669
		else
			error("Unsupported wire type: " .. var1241)
		end
	end
	return var653
end

function t_23:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode()
	-- upvalues: t_23 (ref)
	local var670 = t_23.new()
	
	if self.user_id ~= nil then
		var670.user_id = self.user_id
	end
	if self.userId ~= nil then
		var670.user_id = self.userId
	end
	return var670
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p24)
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p24 == nil or p24.media_items == nil then {} else p24.media_items,
		universe_id = if p24 == nil or p24.universe_id == nil then "" else p24.universe_id,
		place_id = if p24 == nil or p24.place_id == nil then "" else p24.place_id
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var670 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var671 = v:encode()
			local var672, var673 = protoModule.writeTag(buff, var670, 1, protoModule.wireTypes.lengthDelimited)
			var672, var1262 = protoModule.writeBuffer(var672, var673, var671, buffer.len(var671))
			buff = var672
			var670 = var673
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var674, var675 = protoModule.writeTag(buff, var670, 2, protoModule.wireTypes.lengthDelimited)
		var674, var1264 = protoModule.writeString(var674, var675, self.universe_id)
		buff = var674
		var670 = var675
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var676, var677 = protoModule.writeTag(buff, var670, 3, protoModule.wireTypes.lengthDelimited)
		var676, var1266 = protoModule.writeString(var676, var677, self.place_id)
		buff = var676
		var670 = var677
	end
	local buff_1 = buffer.create(var670)
	buffer.copy(buff_1, 0, buff, 0, var670)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var678 = t_24.new()
	local var679 = 0
	while var679 < buffer.len(p24) do
		local _ = nil
		local var680 = nil
		local var681, var682, var683 = protoModule.readTag(p24, var679)
		local var684 = var681
		var680 = var682
		var679 = var683
		
		if var680 == protoModule.wireTypes.varint then
			local _ = nil
			local var685, var686 = protoModule.readVarInt(p24, var679)
			local _ = var685
			var679 = var686
			continue
		end
		if var680 == protoModule.wireTypes.lengthDelimited then
			if var684 == 1 then
				local _ = nil
				local var687, var688 = protoModule.readBuffer(p24, var679)
				var679 = var688
				table.insert(var678.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var687))
			elseif var684 == 2 then
				local _ = nil
				local var689, var690 = protoModule.readBuffer(p24, var679)
				var679 = var690
				var678.universe_id = buffer.tostring(var689)
			elseif var684 == 3 then
				local _ = nil
				local var691, var692 = protoModule.readBuffer(p24, var679)
				var679 = var692
				var678.place_id = buffer.tostring(var691)
			else
				local _ = nil
				local var693, var694 = protoModule.readVarInt(p24, var679)
				var679 = var694 + var693
			end
		elseif var680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var695, var696 = protoModule.readFixed32(p24, var679)
			local _ = var695
			var679 = var696
		elseif var680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var697, var698 = protoModule.readFixed64(p24, var679)
			local _ = var697
			var679 = var698
		else
			error("Unsupported wire type: " .. var1270)
		end
	end
	return var678
end

function t_24:jsonEncode()
	local t = {}
	
	if self.media_items ~= nil and #self.media_items > 0 then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.mediaItems = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), t (ref)
	local var699 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var699.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var699.media_items = t_1
	end
	if self.universe_id ~= nil then
		var699.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var699.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var699.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var699.place_id = self.placeId
	end
	return var699
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p25)
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p25 == nil or p25.media_asset_id == nil then "" else p25.media_asset_id,
		moment_video_playback = if p25 == nil or p25.moment_video_playback == nil then nil else p25.moment_video_playback,
		attribution_user_id = if p25 == nil or p25.attribution_user_id == nil then "" else p25.attribution_user_id
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var700 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var701, var702 = protoModule.writeTag(buff, var700, 1, protoModule.wireTypes.lengthDelimited)
		var701, var1297 = protoModule.writeString(var701, var702, self.media_asset_id)
		buff = var701
		var700 = var702
	end
	if self.moment_video_playback ~= nil then
		local var703 = self.moment_video_playback:encode()
		local var704, var705 = protoModule.writeTag(buff, var700, 2, protoModule.wireTypes.lengthDelimited)
		var704, var1300 = protoModule.writeBuffer(var704, var705, var703, buffer.len(var703))
		buff = var704
		var700 = var705
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		local var706, var707 = protoModule.writeTag(buff, var700, 3, protoModule.wireTypes.lengthDelimited)
		var706, var1302 = protoModule.writeString(var706, var707, self.attribution_user_id)
		buff = var706
		var700 = var707
	end
	local buff_1 = buffer.create(var700)
	buffer.copy(buff_1, 0, buff, 0, var700)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var700 = t_25.new()
	local var701 = 0
	while var701 < buffer.len(p25) do
		local _ = nil
		local var702 = nil
		local var703, var704, var705 = protoModule.readTag(p25, var701)
		local var706 = var703
		var702 = var704
		var701 = var705
		
		if var702 == protoModule.wireTypes.varint then
			local _ = nil
			local var707, var708 = protoModule.readVarInt(p25, var701)
			local _ = var707
			var701 = var708
			continue
		end
		if var702 == protoModule.wireTypes.lengthDelimited then
			if var706 == 1 then
				local _ = nil
				local var709, var710 = protoModule.readBuffer(p25, var701)
				var701 = var710
				var700.media_asset_id = buffer.tostring(var709)
			elseif var706 == 2 then
				local _ = nil
				local var711, var712 = protoModule.readBuffer(p25, var701)
				var701 = var712
				var700.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.decode(var711)
			elseif var706 == 3 then
				local _ = nil
				local var713, var714 = protoModule.readBuffer(p25, var701)
				var701 = var714
				var700.attribution_user_id = buffer.tostring(var713)
			else
				local _ = nil
				local var715, var716 = protoModule.readVarInt(p25, var701)
				var701 = var716 + var715
			end
		elseif var702 == protoModule.wireTypes.i32 then
			local _ = nil
			local var717, var718 = protoModule.readFixed32(p25, var701)
			local _ = var717
			var701 = var718
		elseif var702 == protoModule.wireTypes.i64 then
			local _ = nil
			local var719, var720 = protoModule.readFixed64(p25, var701)
			local _ = var719
			var701 = var720
		else
			error("Unsupported wire type: " .. var1306)
		end
	end
	return var700
end

function t_25:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	if self.moment_video_playback ~= nil then
		t.momentVideoPlayback = self.moment_video_playback:jsonEncode()
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		t.attributionUserId = self.attribution_user_id
	end
	return t
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref), t (ref)
	local var721 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var721.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var721.media_asset_id = self.mediaAssetId
	end
	if self.moment_video_playback ~= nil then
		var721.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var721.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.attribution_user_id ~= nil then
		var721.attribution_user_id = self.attribution_user_id
	end
	if self.attributionUserId ~= nil then
		var721.attribution_user_id = self.attributionUserId
	end
	return var721
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p26)
	-- upvalues: t_26 (ref)
	return setmetatable({
		asset_id = if p26 == nil or p26.asset_id == nil then "" else p26.asset_id,
		asset_access_context = if p26 == nil or p26.asset_access_context == nil then "" else p26.asset_access_context
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var721 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var722, var723 = protoModule.writeTag(buff, var721, 1, protoModule.wireTypes.lengthDelimited)
		var722, var1330 = protoModule.writeString(var722, var723, self.asset_id)
		buff = var722
		var721 = var723
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var724, var725 = protoModule.writeTag(buff, var721, 2, protoModule.wireTypes.lengthDelimited)
		var724, var1332 = protoModule.writeString(var724, var725, self.asset_access_context)
		buff = var724
		var721 = var725
	end
	local buff_1 = buffer.create(var721)
	buffer.copy(buff_1, 0, buff, 0, var721)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var721 = t_26.new()
	local var722 = 0
	while var722 < buffer.len(p26) do
		local _ = nil
		local var723 = nil
		local var724, var725, var726 = protoModule.readTag(p26, var722)
		local var727 = var724
		var723 = var725
		var722 = var726
		
		if var723 == protoModule.wireTypes.varint then
			local _ = nil
			local var728, var729 = protoModule.readVarInt(p26, var722)
			local _ = var728
			var722 = var729
			continue
		end
		if var723 == protoModule.wireTypes.lengthDelimited then
			if var727 == 1 then
				local _ = nil
				local var730, var731 = protoModule.readBuffer(p26, var722)
				var722 = var731
				var721.asset_id = buffer.tostring(var730)
			elseif var727 == 2 then
				local _ = nil
				local var732, var733 = protoModule.readBuffer(p26, var722)
				var722 = var733
				var721.asset_access_context = buffer.tostring(var732)
			else
				local _ = nil
				local var734, var735 = protoModule.readVarInt(p26, var722)
				var722 = var735 + var734
			end
		elseif var723 == protoModule.wireTypes.i32 then
			local _ = nil
			local var736, var737 = protoModule.readFixed32(p26, var722)
			local _ = var736
			var722 = var737
		elseif var723 == protoModule.wireTypes.i64 then
			local _ = nil
			local var738, var739 = protoModule.readFixed64(p26, var722)
			local _ = var738
			var722 = var739
		else
			error("Unsupported wire type: " .. var1336)
		end
	end
	return var721
end

function t_26:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref)
	local var740 = t_26.new()
	
	if self.asset_id ~= nil then
		var740.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var740.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var740.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var740.asset_access_context = self.assetAccessContext
	end
	return var740
end

t_26.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback = t_26
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p27)
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p27 == nil or p27.universe_id == nil then "" else p27.universe_id
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var740 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var741, var742 = protoModule.writeTag(buff, var740, 1, protoModule.wireTypes.lengthDelimited)
		var741, var1358 = protoModule.writeString(var741, var742, self.universe_id)
		buff = var741
		var740 = var742
	end
	local buff_1 = buffer.create(var740)
	buffer.copy(buff_1, 0, buff, 0, var740)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var740 = t_27.new()
	local var741 = 0
	while var741 < buffer.len(p27) do
		local _ = nil
		local var742 = nil
		local var743, var744, var745 = protoModule.readTag(p27, var741)
		local var746 = var743
		var742 = var744
		var741 = var745
		
		if var742 == protoModule.wireTypes.varint then
			local _ = nil
			local var747, var748 = protoModule.readVarInt(p27, var741)
			local _ = var747
			var741 = var748
			continue
		end
		if var742 == protoModule.wireTypes.lengthDelimited then
			if var746 == 1 then
				local _ = nil
				local var749, var750 = protoModule.readBuffer(p27, var741)
				var741 = var750
				var740.universe_id = buffer.tostring(var749)
			else
				local _ = nil
				local var751, var752 = protoModule.readVarInt(p27, var741)
				var741 = var752 + var751
			end
		elseif var742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var753, var754 = protoModule.readFixed32(p27, var741)
			local _ = var753
			var741 = var754
		elseif var742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var755, var756 = protoModule.readFixed64(p27, var741)
			local _ = var755
			var741 = var756
		else
			error("Unsupported wire type: " .. var1362)
		end
	end
	return var740
end

function t_27:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode()
	-- upvalues: t_27 (ref)
	local var757 = t_27.new()
	
	if self.universe_id ~= nil then
		var757.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var757.universe_id = self.universeId
	end
	return var757
end

t_27.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_27
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p28 == nil or p28.universe_id == nil then "" else p28.universe_id
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var757 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var758, var759 = protoModule.writeTag(buff, var757, 1, protoModule.wireTypes.lengthDelimited)
		var758, var1382 = protoModule.writeString(var758, var759, self.universe_id)
		buff = var758
		var757 = var759
	end
	local buff_1 = buffer.create(var757)
	buffer.copy(buff_1, 0, buff, 0, var757)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var757 = t_28.new()
	local var758 = 0
	while var758 < buffer.len(p28) do
		local _ = nil
		local var759 = nil
		local var760, var761, var762 = protoModule.readTag(p28, var758)
		local var763 = var760
		var759 = var761
		var758 = var762
		
		if var759 == protoModule.wireTypes.varint then
			local _ = nil
			local var764, var765 = protoModule.readVarInt(p28, var758)
			local _ = var764
			var758 = var765
			continue
		end
		if var759 == protoModule.wireTypes.lengthDelimited then
			if var763 == 1 then
				local _ = nil
				local var766, var767 = protoModule.readBuffer(p28, var758)
				var758 = var767
				var757.universe_id = buffer.tostring(var766)
			else
				local _ = nil
				local var768, var769 = protoModule.readVarInt(p28, var758)
				var758 = var769 + var768
			end
		elseif var759 == protoModule.wireTypes.i32 then
			local _ = nil
			local var770, var771 = protoModule.readFixed32(p28, var758)
			local _ = var770
			var758 = var771
		elseif var759 == protoModule.wireTypes.i64 then
			local _ = nil
			local var772, var773 = protoModule.readFixed64(p28, var758)
			local _ = var772
			var758 = var773
		else
			error("Unsupported wire type: " .. var1386)
		end
	end
	return var757
end

function t_28:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_28:jsonDecode()
	-- upvalues: t_28 (ref)
	local var774 = t_28.new()
	
	if self.universe_id ~= nil then
		var774.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var774.universe_id = self.universeId
	end
	return var774
end

t_28.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_28
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p29 == nil or p29.universe_id == nil then "" else p29.universe_id,
		has_store_items = if p29 == nil or p29.has_store_items == nil then false else p29.has_store_items,
		has_badges = if p29 == nil or p29.has_badges == nil then false else p29.has_badges,
		has_game_passes = if p29 == nil or p29.has_game_passes == nil then false else p29.has_game_passes,
		community_id = if p29 == nil or p29.community_id == nil then "" else p29.community_id
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var774 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var775, var776 = protoModule.writeTag(buff, var774, 1, protoModule.wireTypes.lengthDelimited)
		var775, var1406 = protoModule.writeString(var775, var776, self.universe_id)
		buff = var775
		var774 = var776
	end
	if self.has_store_items then
		local var777, var778 = protoModule.writeTag(buff, var774, 2, protoModule.wireTypes.varint)
		var777, var1408 = protoModule.writeVarInt(var777, var778, if self.has_store_items then 1 else 0)
		buff = var777
		var774 = var778
	end
	if self.has_badges then
		local var779, var780 = protoModule.writeTag(buff, var774, 3, protoModule.wireTypes.varint)
		var779, var1410 = protoModule.writeVarInt(var779, var780, if self.has_badges then 1 else 0)
		buff = var779
		var774 = var780
	end
	if self.has_game_passes then
		local var781, var782 = protoModule.writeTag(buff, var774, 4, protoModule.wireTypes.varint)
		var781, var1412 = protoModule.writeVarInt(var781, var782, if self.has_game_passes then 1 else 0)
		buff = var781
		var774 = var782
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var783, var784 = protoModule.writeTag(buff, var774, 5, protoModule.wireTypes.lengthDelimited)
		var783, var1414 = protoModule.writeString(var783, var784, self.community_id)
		buff = var783
		var774 = var784
	end
	local buff_1 = buffer.create(var774)
	buffer.copy(buff_1, 0, buff, 0, var774)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var774 = t_29.new()
	local var775 = 0
	while var775 < buffer.len(p29) do
		local _ = nil
		local var776 = nil
		local var777, var778, var779 = protoModule.readTag(p29, var775)
		local var780 = var777
		var776 = var778
		var775 = var779
		
		if var776 == protoModule.wireTypes.varint then
			if var780 == 2 then
				local _ = nil
				local var781, var782 = protoModule.readVarInt(p29, var775)
				var775 = var782
				var774.has_store_items = var781 ~= 0
			elseif var780 == 3 then
				local _ = nil
				local var783, var784 = protoModule.readVarInt(p29, var775)
				var775 = var784
				var774.has_badges = var783 ~= 0
			elseif var780 == 4 then
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p29, var775)
				var775 = var786
				var774.has_game_passes = var785 ~= 0
			else
				local _ = nil
				local var787, var788 = protoModule.readVarInt(p29, var775)
				local _ = var787
				var775 = var788
			end
		end
		if var776 == protoModule.wireTypes.lengthDelimited then
			if var780 == 1 then
				local _ = nil
				local var789, var790 = protoModule.readBuffer(p29, var775)
				var775 = var790
				var774.universe_id = buffer.tostring(var789)
			elseif var780 == 5 then
				local _ = nil
				local var791, var792 = protoModule.readBuffer(p29, var775)
				var775 = var792
				var774.community_id = buffer.tostring(var791)
			else
				local _ = nil
				local var793, var794 = protoModule.readVarInt(p29, var775)
				var775 = var794 + var793
			end
		elseif var776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var795, var796 = protoModule.readFixed32(p29, var775)
			local _ = var795
			var775 = var796
		elseif var776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var797, var798 = protoModule.readFixed64(p29, var775)
			local _ = var797
			var775 = var798
		else
			error("Unsupported wire type: " .. var1418)
		end
	end
	return var774
end

function t_29:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.has_store_items then
		t.hasStoreItems = self.has_store_items
	end
	if self.has_badges then
		t.hasBadges = self.has_badges
	end
	if self.has_game_passes then
		t.hasGamePasses = self.has_game_passes
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref)
	local var799 = t_29.new()
	
	if self.universe_id ~= nil then
		var799.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var799.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var799.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var799.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var799.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var799.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var799.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var799.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var799.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var799.community_id = self.communityId
	end
	return var799
end

t_29.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_29
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p30 == nil or p30.universe_id == nil then "" else p30.universe_id
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var799 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var800, var801 = protoModule.writeTag(buff, var799, 1, protoModule.wireTypes.lengthDelimited)
		var800, var1446 = protoModule.writeString(var800, var801, self.universe_id)
		buff = var800
		var799 = var801
	end
	local buff_1 = buffer.create(var799)
	buffer.copy(buff_1, 0, buff, 0, var799)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var799 = t_30.new()
	local var800 = 0
	while var800 < buffer.len(p30) do
		local _ = nil
		local var801 = nil
		local var802, var803, var804 = protoModule.readTag(p30, var800)
		local var805 = var802
		var801 = var803
		var800 = var804
		
		if var801 == protoModule.wireTypes.varint then
			local _ = nil
			local var806, var807 = protoModule.readVarInt(p30, var800)
			local _ = var806
			var800 = var807
			continue
		end
		if var801 == protoModule.wireTypes.lengthDelimited then
			if var805 == 1 then
				local _ = nil
				local var808, var809 = protoModule.readBuffer(p30, var800)
				var800 = var809
				var799.universe_id = buffer.tostring(var808)
			else
				local _ = nil
				local var810, var811 = protoModule.readVarInt(p30, var800)
				var800 = var811 + var810
			end
		elseif var801 == protoModule.wireTypes.i32 then
			local _ = nil
			local var812, var813 = protoModule.readFixed32(p30, var800)
			local _ = var812
			var800 = var813
		elseif var801 == protoModule.wireTypes.i64 then
			local _ = nil
			local var814, var815 = protoModule.readFixed64(p30, var800)
			local _ = var814
			var800 = var815
		else
			error("Unsupported wire type: " .. var1450)
		end
	end
	return var799
end

function t_30:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_30:jsonDecode()
	-- upvalues: t_30 (ref)
	local var816 = t_30.new()
	
	if self.universe_id ~= nil then
		var816.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var816.universe_id = self.universeId
	end
	return var816
end

t_30.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_30
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p31 == nil or p31.universe_id == nil then "" else p31.universe_id,
		user_owns_experience = if p31 == nil or p31.user_owns_experience == nil then false else p31.user_owns_experience
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var816 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var817, var818 = protoModule.writeTag(buff, var816, 1, protoModule.wireTypes.lengthDelimited)
		var817, var1470 = protoModule.writeString(var817, var818, self.universe_id)
		buff = var817
		var816 = var818
	end
	if self.user_owns_experience then
		local var819, var820 = protoModule.writeTag(buff, var816, 2, protoModule.wireTypes.varint)
		var819, var1472 = protoModule.writeVarInt(var819, var820, if self.user_owns_experience then 1 else 0)
		buff = var819
		var816 = var820
	end
	local buff_1 = buffer.create(var816)
	buffer.copy(buff_1, 0, buff, 0, var816)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var816 = t_31.new()
	local var817 = 0
	while var817 < buffer.len(p31) do
		local _ = nil
		local var818 = nil
		local var819, var820, var821 = protoModule.readTag(p31, var817)
		local var822 = var819
		var818 = var820
		var817 = var821
		
		if var818 == protoModule.wireTypes.varint then
			if var822 == 2 then
				local _ = nil
				local var823, var824 = protoModule.readVarInt(p31, var817)
				var817 = var824
				var816.user_owns_experience = var823 ~= 0
			else
				local _ = nil
				local var825, var826 = protoModule.readVarInt(p31, var817)
				local _ = var825
				var817 = var826
			end
		end
		if var818 == protoModule.wireTypes.lengthDelimited then
			if var822 == 1 then
				local _ = nil
				local var827, var828 = protoModule.readBuffer(p31, var817)
				var817 = var828
				var816.universe_id = buffer.tostring(var827)
			else
				local _ = nil
				local var829, var830 = protoModule.readVarInt(p31, var817)
				var817 = var830 + var829
			end
		elseif var818 == protoModule.wireTypes.i32 then
			local _ = nil
			local var831, var832 = protoModule.readFixed32(p31, var817)
			local _ = var831
			var817 = var832
		elseif var818 == protoModule.wireTypes.i64 then
			local _ = nil
			local var833, var834 = protoModule.readFixed64(p31, var817)
			local _ = var833
			var817 = var834
		else
			error("Unsupported wire type: " .. var1476)
		end
	end
	return var816
end

function t_31:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref)
	local var835 = t_31.new()
	
	if self.universe_id ~= nil then
		var835.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var835.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var835.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var835.user_owns_experience = self.userOwnsExperience
	end
	return var835
end

t_31.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_31
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t_32 (ref)
	return setmetatable({
		universe_id = if p32 == nil or p32.universe_id == nil then "" else p32.universe_id,
		place_id = if p32 == nil or p32.place_id == nil then "" else p32.place_id,
		product_id = if p32 == nil or p32.product_id == nil then "" else p32.product_id,
		product_image_asset_id = if p32 == nil or p32.product_image_asset_id == nil then "" else p32.product_image_asset_id,
		product_name = if p32 == nil or p32.product_name == nil then "" else p32.product_name,
		variant_id = if p32 == nil or p32.variant_id == nil then "" else p32.variant_id
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var835 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var836, var837 = protoModule.writeTag(buff, var835, 1, protoModule.wireTypes.lengthDelimited)
		var836, var1498 = protoModule.writeString(var836, var837, self.universe_id)
		buff = var836
		var835 = var837
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var838, var839 = protoModule.writeTag(buff, var835, 2, protoModule.wireTypes.lengthDelimited)
		var838, var1500 = protoModule.writeString(var838, var839, self.place_id)
		buff = var838
		var835 = var839
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		local var840, var841 = protoModule.writeTag(buff, var835, 3, protoModule.wireTypes.lengthDelimited)
		var840, var1502 = protoModule.writeString(var840, var841, self.product_id)
		buff = var840
		var835 = var841
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		local var842, var843 = protoModule.writeTag(buff, var835, 4, protoModule.wireTypes.lengthDelimited)
		var842, var1504 = protoModule.writeString(var842, var843, self.product_image_asset_id)
		buff = var842
		var835 = var843
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		local var844, var845 = protoModule.writeTag(buff, var835, 5, protoModule.wireTypes.lengthDelimited)
		var844, var1506 = protoModule.writeString(var844, var845, self.product_name)
		buff = var844
		var835 = var845
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		local var846, var847 = protoModule.writeTag(buff, var835, 6, protoModule.wireTypes.lengthDelimited)
		var846, var1508 = protoModule.writeString(var846, var847, self.variant_id)
		buff = var846
		var835 = var847
	end
	local buff_1 = buffer.create(var835)
	buffer.copy(buff_1, 0, buff, 0, var835)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var835 = t_32.new()
	local var836 = 0
	while var836 < buffer.len(p32) do
		local _ = nil
		local var837 = nil
		local var838, var839, var840 = protoModule.readTag(p32, var836)
		local var841 = var838
		var837 = var839
		var836 = var840
		
		if var837 == protoModule.wireTypes.varint then
			local _ = nil
			local var842, var843 = protoModule.readVarInt(p32, var836)
			local _ = var842
			var836 = var843
			continue
		end
		if var837 == protoModule.wireTypes.lengthDelimited then
			if var841 == 1 then
				local _ = nil
				local var844, var845 = protoModule.readBuffer(p32, var836)
				var836 = var845
				var835.universe_id = buffer.tostring(var844)
			elseif var841 == 2 then
				local _ = nil
				local var846, var847 = protoModule.readBuffer(p32, var836)
				var836 = var847
				var835.place_id = buffer.tostring(var846)
			elseif var841 == 3 then
				local _ = nil
				local var848, var849 = protoModule.readBuffer(p32, var836)
				var836 = var849
				var835.product_id = buffer.tostring(var848)
			elseif var841 == 4 then
				local _ = nil
				local var850, var851 = protoModule.readBuffer(p32, var836)
				var836 = var851
				var835.product_image_asset_id = buffer.tostring(var850)
			elseif var841 == 5 then
				local _ = nil
				local var852, var853 = protoModule.readBuffer(p32, var836)
				var836 = var853
				var835.product_name = buffer.tostring(var852)
			elseif var841 == 6 then
				local _ = nil
				local var854, var855 = protoModule.readBuffer(p32, var836)
				var836 = var855
				var835.variant_id = buffer.tostring(var854)
			else
				local _ = nil
				local var856, var857 = protoModule.readVarInt(p32, var836)
				var836 = var857 + var856
			end
		elseif var837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var858, var859 = protoModule.readFixed32(p32, var836)
			local _ = var858
			var836 = var859
		elseif var837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var860, var861 = protoModule.readFixed64(p32, var836)
			local _ = var860
			var836 = var861
		else
			error("Unsupported wire type: " .. var1512)
		end
	end
	return var835
end

function t_32:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		t.productId = self.product_id
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		t.productImageAssetId = self.product_image_asset_id
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		t.productName = self.product_name
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		t.variantId = self.variant_id
	end
	return t
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref)
	local var862 = t_32.new()
	
	if self.universe_id ~= nil then
		var862.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var862.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var862.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var862.place_id = self.placeId
	end
	if self.product_id ~= nil then
		var862.product_id = self.product_id
	end
	if self.productId ~= nil then
		var862.product_id = self.productId
	end
	if self.product_image_asset_id ~= nil then
		var862.product_image_asset_id = self.product_image_asset_id
	end
	if self.productImageAssetId ~= nil then
		var862.product_image_asset_id = self.productImageAssetId
	end
	if self.product_name ~= nil then
		var862.product_name = self.product_name
	end
	if self.productName ~= nil then
		var862.product_name = self.productName
	end
	if self.variant_id ~= nil then
		var862.variant_id = self.variant_id
	end
	if self.variantId ~= nil then
		var862.variant_id = self.variantId
	end
	return var862
end

t_32.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_32
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p33)
	-- upvalues: t_33 (ref)
	return setmetatable({
		community_id = if p33 == nil or p33.community_id == nil then "" else p33.community_id
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var862 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var863, var864 = protoModule.writeTag(buff, var862, 1, protoModule.wireTypes.lengthDelimited)
		var863, var1542 = protoModule.writeString(var863, var864, self.community_id)
		buff = var863
		var862 = var864
	end
	local buff_1 = buffer.create(var862)
	buffer.copy(buff_1, 0, buff, 0, var862)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref)
	local var862 = t_33.new()
	local var863 = 0
	while var863 < buffer.len(p33) do
		local _ = nil
		local var864 = nil
		local var865, var866, var867 = protoModule.readTag(p33, var863)
		local var868 = var865
		var864 = var866
		var863 = var867
		
		if var864 == protoModule.wireTypes.varint then
			local _ = nil
			local var869, var870 = protoModule.readVarInt(p33, var863)
			local _ = var869
			var863 = var870
			continue
		end
		if var864 == protoModule.wireTypes.lengthDelimited then
			if var868 == 1 then
				local _ = nil
				local var871, var872 = protoModule.readBuffer(p33, var863)
				var863 = var872
				var862.community_id = buffer.tostring(var871)
			else
				local _ = nil
				local var873, var874 = protoModule.readVarInt(p33, var863)
				var863 = var874 + var873
			end
		elseif var864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var875, var876 = protoModule.readFixed32(p33, var863)
			local _ = var875
			var863 = var876
		elseif var864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var877, var878 = protoModule.readFixed64(p33, var863)
			local _ = var877
			var863 = var878
		else
			error("Unsupported wire type: " .. var1546)
		end
	end
	return var862
end

function t_33:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_33:jsonDecode()
	-- upvalues: t_33 (ref)
	local var879 = t_33.new()
	
	if self.community_id ~= nil then
		var879.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var879.community_id = self.communityId
	end
	return var879
end

t_33.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_33
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p34)
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_items = if p34 == nil or p34.social_link_items == nil then {} else p34.social_link_items
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var879 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var880 = v:encode()
			local var881, var882 = protoModule.writeTag(buff, var879, 1, protoModule.wireTypes.lengthDelimited)
			var881, var1567 = protoModule.writeBuffer(var881, var882, var880, buffer.len(var880))
			buff = var881
			var879 = var882
		end
	end
	local buff_1 = buffer.create(var879)
	buffer.copy(buff_1, 0, buff, 0, var879)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var883 = t_34.new()
	local var884 = 0
	while var884 < buffer.len(p34) do
		local _ = nil
		local var885 = nil
		local var886, var887, var888 = protoModule.readTag(p34, var884)
		local var889 = var886
		var885 = var887
		var884 = var888
		
		if var885 == protoModule.wireTypes.varint then
			local _ = nil
			local var890, var891 = protoModule.readVarInt(p34, var884)
			local _ = var890
			var884 = var891
			continue
		end
		if var885 == protoModule.wireTypes.lengthDelimited then
			if var889 == 1 then
				local _ = nil
				local var892, var893 = protoModule.readBuffer(p34, var884)
				var884 = var893
				table.insert(var883.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var892))
			else
				local _ = nil
				local var894, var895 = protoModule.readVarInt(p34, var884)
				var884 = var895 + var894
			end
		elseif var885 == protoModule.wireTypes.i32 then
			local _ = nil
			local var896, var897 = protoModule.readFixed32(p34, var884)
			local _ = var896
			var884 = var897
		elseif var885 == protoModule.wireTypes.i64 then
			local _ = nil
			local var898, var899 = protoModule.readFixed64(p34, var884)
			local _ = var898
			var884 = var899
		else
			error("Unsupported wire type: " .. var1571)
		end
	end
	return var883
end

function t_34:jsonEncode()
	local t = {}
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.socialLinkItems = t_1
	end
	return t
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref), t (ref)
	local var900 = t_34.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var900.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var900.social_link_items = t_1
	end
	return var900
end

t_34.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		social_link_id = if p35 == nil or p35.social_link_id == nil then "" else p35.social_link_id
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var901 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var902, var903 = protoModule.writeTag(buff, var901, 1, protoModule.wireTypes.lengthDelimited)
		var902, var1594 = protoModule.writeString(var902, var903, self.social_link_id)
		buff = var902
		var901 = var903
	end
	local buff_1 = buffer.create(var901)
	buffer.copy(buff_1, 0, buff, 0, var901)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref)
	local var901 = t_35.new()
	local var902 = 0
	while var902 < buffer.len(p35) do
		local _ = nil
		local var903 = nil
		local var904, var905, var906 = protoModule.readTag(p35, var902)
		local var907 = var904
		var903 = var905
		var902 = var906
		
		if var903 == protoModule.wireTypes.varint then
			local _ = nil
			local var908, var909 = protoModule.readVarInt(p35, var902)
			local _ = var908
			var902 = var909
			continue
		end
		if var903 == protoModule.wireTypes.lengthDelimited then
			if var907 == 1 then
				local _ = nil
				local var910, var911 = protoModule.readBuffer(p35, var902)
				var902 = var911
				var901.social_link_id = buffer.tostring(var910)
			else
				local _ = nil
				local var912, var913 = protoModule.readVarInt(p35, var902)
				var902 = var913 + var912
			end
		elseif var903 == protoModule.wireTypes.i32 then
			local _ = nil
			local var914, var915 = protoModule.readFixed32(p35, var902)
			local _ = var914
			var902 = var915
		elseif var903 == protoModule.wireTypes.i64 then
			local _ = nil
			local var916, var917 = protoModule.readFixed64(p35, var902)
			local _ = var916
			var902 = var917
		else
			error("Unsupported wire type: " .. var1598)
		end
	end
	return var901
end

function t_35:jsonEncode()
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref)
	local var918 = t_35.new()
	
	if self.social_link_id ~= nil then
		var918.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var918.social_link_id = self.socialLinkId
	end
	return var918
end

t_35.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_35
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t_36 (ref)
	return setmetatable({
		title = if p36 == nil or p36.title == nil then "" else p36.title,
		universe_items = if p36 == nil or p36.universe_items == nil then {} else p36.universe_items,
		next_page_token = if p36 == nil or p36.next_page_token == nil then "" else p36.next_page_token,
		sort_id = if p36 == nil or p36.sort_id == nil then "" else p36.sort_id,
		secondary_sort_id = if p36 == nil or p36.secondary_sort_id == nil then 0 else p36.secondary_sort_id,
		max_visible_rows = if p36 == nil or p36.max_visible_rows == nil then 0 else p36.max_visible_rows,
		subtitle = if p36 == nil or p36.subtitle == nil then "" else p36.subtitle,
		info_text = if p36 == nil or p36.info_text == nil then "" else p36.info_text,
		subtitle_link_path = if p36 == nil or p36.subtitle_link_path == nil then "" else p36.subtitle_link_path,
		is_placeholder = if p36 == nil or p36.is_placeholder == nil then nil else p36.is_placeholder,
		primary_sort_id = if p36 == nil or p36.primary_sort_id == nil then nil else p36.primary_sort_id,
		applied_filters = if p36 == nil or p36.applied_filters == nil then nil else p36.applied_filters,
		pool_id = if p36 == nil or p36.pool_id == nil then nil else p36.pool_id,
		has_emphasized_tile = if p36 == nil or p36.has_emphasized_tile == nil then false else p36.has_emphasized_tile,
		tile_activation_mode = if p36 == nil or p36.tile_activation_mode == nil then "" else p36.tile_activation_mode,
		initial_feed_visible_rows = if p36 == nil or p36.initial_feed_visible_rows == nil then nil else p36.initial_feed_visible_rows,
		visible_rows_per_reveal = if p36 == nil or p36.visible_rows_per_reveal == nil then nil else p36.visible_rows_per_reveal,
		sponsored_user_cohort = if p36 == nil or p36.sponsored_user_cohort == nil then nil else p36.sponsored_user_cohort,
		anchor_tag = if p36 == nil or p36.anchor_tag == nil then nil else p36.anchor_tag,
		collection_item_size = if p36 == nil or p36.collection_item_size == nil then nil else p36.collection_item_size,
		sort_sub_id = if p36 == nil or p36.sort_sub_id == nil then nil else p36.sort_sub_id,
		enable_game_tile_videos = if p36 == nil or p36.enable_game_tile_videos == nil then false else p36.enable_game_tile_videos,
		continues_previous_section = if p36 == nil or p36.continues_previous_section == nil then nil else p36.continues_previous_section
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var918 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var919, var920 = protoModule.writeTag(buff, var918, 1, protoModule.wireTypes.lengthDelimited)
		var919, var1618 = protoModule.writeString(var919, var920, self.title)
		buff = var919
		var918 = var920
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var921 = v:encode()
			local var922, var923 = protoModule.writeTag(buff, var918, 2, protoModule.wireTypes.lengthDelimited)
			var922, var1621 = protoModule.writeBuffer(var922, var923, var921, buffer.len(var921))
			buff = var922
			var918 = var923
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var924, var925 = protoModule.writeTag(buff, var918, 3, protoModule.wireTypes.lengthDelimited)
		var924, var1623 = protoModule.writeString(var924, var925, self.next_page_token)
		buff = var924
		var918 = var925
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var926, var927 = protoModule.writeTag(buff, var918, 4, protoModule.wireTypes.lengthDelimited)
		var926, var1625 = protoModule.writeString(var926, var927, self.sort_id)
		buff = var926
		var918 = var927
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var928, var929 = protoModule.writeTag(buff, var918, 5, protoModule.wireTypes.varint)
		var928, var1627 = protoModule.writeVarInt(var928, var929, self.secondary_sort_id)
		buff = var928
		var918 = var929
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var930, var931 = protoModule.writeTag(buff, var918, 6, protoModule.wireTypes.varint)
		var930, var1629 = protoModule.writeVarInt(var930, var931, self.max_visible_rows)
		buff = var930
		var918 = var931
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var932, var933 = protoModule.writeTag(buff, var918, 7, protoModule.wireTypes.lengthDelimited)
		var932, var1631 = protoModule.writeString(var932, var933, self.subtitle)
		buff = var932
		var918 = var933
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var934, var935 = protoModule.writeTag(buff, var918, 8, protoModule.wireTypes.lengthDelimited)
		var934, var1633 = protoModule.writeString(var934, var935, self.info_text)
		buff = var934
		var918 = var935
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var936, var937 = protoModule.writeTag(buff, var918, 9, protoModule.wireTypes.lengthDelimited)
		var936, var1635 = protoModule.writeString(var936, var937, self.subtitle_link_path)
		buff = var936
		var918 = var937
	end
	if self.is_placeholder ~= nil then
		local var938, var939 = protoModule.writeTag(buff, var918, 10, protoModule.wireTypes.varint)
		var938, var1637 = protoModule.writeVarInt(var938, var939, if self.is_placeholder then 1 else 0)
		buff = var938
		var918 = var939
	end
	if self.primary_sort_id ~= nil then
		local var940, var941 = protoModule.writeTag(buff, var918, 11, protoModule.wireTypes.varint)
		var940, var1639 = protoModule.writeVarInt(var940, var941, self.primary_sort_id)
		buff = var940
		var918 = var941
	end
	if self.applied_filters ~= nil then
		local var942, var943 = protoModule.writeTag(buff, var918, 12, protoModule.wireTypes.lengthDelimited)
		var942, var1641 = protoModule.writeString(var942, var943, self.applied_filters)
		buff = var942
		var918 = var943
	end
	if self.pool_id ~= nil then
		local var944, var945 = protoModule.writeTag(buff, var918, 13, protoModule.wireTypes.lengthDelimited)
		var944, var1643 = protoModule.writeString(var944, var945, self.pool_id)
		buff = var944
		var918 = var945
	end
	if self.has_emphasized_tile then
		local var946, var947 = protoModule.writeTag(buff, var918, 14, protoModule.wireTypes.varint)
		var946, var1645 = protoModule.writeVarInt(var946, var947, if self.has_emphasized_tile then 1 else 0)
		buff = var946
		var918 = var947
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var948, var949 = protoModule.writeTag(buff, var918, 15, protoModule.wireTypes.lengthDelimited)
		var948, var1647 = protoModule.writeString(var948, var949, self.tile_activation_mode)
		buff = var948
		var918 = var949
	end
	if self.initial_feed_visible_rows ~= nil then
		local var950, var951 = protoModule.writeTag(buff, var918, 16, protoModule.wireTypes.varint)
		var950, var1649 = protoModule.writeVarInt(var950, var951, self.initial_feed_visible_rows)
		buff = var950
		var918 = var951
	end
	if self.visible_rows_per_reveal ~= nil then
		local var952, var953 = protoModule.writeTag(buff, var918, 17, protoModule.wireTypes.varint)
		var952, var1651 = protoModule.writeVarInt(var952, var953, self.visible_rows_per_reveal)
		buff = var952
		var918 = var953
	end
	if self.sponsored_user_cohort ~= nil then
		local var954, var955 = protoModule.writeTag(buff, var918, 18, protoModule.wireTypes.lengthDelimited)
		var954, var1653 = protoModule.writeString(var954, var955, self.sponsored_user_cohort)
		buff = var954
		var918 = var955
	end
	if self.anchor_tag ~= nil then
		local var956, var957 = protoModule.writeTag(buff, var918, 19, protoModule.wireTypes.lengthDelimited)
		var956, var1655 = protoModule.writeString(var956, var957, self.anchor_tag)
		buff = var956
		var918 = var957
	end
	if self.collection_item_size ~= nil then
		local var958, var959 = protoModule.writeTag(buff, var918, 20, protoModule.wireTypes.lengthDelimited)
		var958, var1657 = protoModule.writeString(var958, var959, self.collection_item_size)
		buff = var958
		var918 = var959
	end
	if self.sort_sub_id ~= nil then
		local var960, var961 = protoModule.writeTag(buff, var918, 21, protoModule.wireTypes.lengthDelimited)
		var960, var1659 = protoModule.writeString(var960, var961, self.sort_sub_id)
		buff = var960
		var918 = var961
	end
	if self.enable_game_tile_videos then
		local var962, var963 = protoModule.writeTag(buff, var918, 22, protoModule.wireTypes.varint)
		var962, var1661 = protoModule.writeVarInt(var962, var963, if self.enable_game_tile_videos then 1 else 0)
		buff = var962
		var918 = var963
	end
	if self.continues_previous_section ~= nil then
		local var964, var965 = protoModule.writeTag(buff, var918, 23, protoModule.wireTypes.varint)
		var964, var1663 = protoModule.writeVarInt(var964, var965, if self.continues_previous_section then 1 else 0)
		buff = var964
		var918 = var965
	end
	local buff_1 = buffer.create(var918)
	buffer.copy(buff_1, 0, buff, 0, var918)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var966 = t_36.new()
	local var967 = 0
	while var967 < buffer.len(p36) do
		local _ = nil
		local var968 = nil
		local var969, var970, var971 = protoModule.readTag(p36, var967)
		local var972 = var969
		var968 = var970
		var967 = var971
		
		if var968 == protoModule.wireTypes.varint then
			if var972 == 5 then
				local _ = nil
				local var973, var974 = protoModule.readVarIntI32(p36, var967)
				var967 = var974
				var966.secondary_sort_id = var973
			elseif var972 == 6 then
				local _ = nil
				local var975, var976 = protoModule.readVarIntI32(p36, var967)
				var967 = var976
				var966.max_visible_rows = var975
			elseif var972 == 10 then
				local _ = nil
				local var977, var978 = protoModule.readVarInt(p36, var967)
				var967 = var978
				var966.is_placeholder = var977 ~= 0
			elseif var972 == 11 then
				local _ = nil
				local var979, var980 = protoModule.readVarIntI32(p36, var967)
				var967 = var980
				var966.primary_sort_id = var979
			elseif var972 == 14 then
				local _ = nil
				local var981, var982 = protoModule.readVarInt(p36, var967)
				var967 = var982
				var966.has_emphasized_tile = var981 ~= 0
			elseif var972 == 16 then
				local _ = nil
				local var983, var984 = protoModule.readVarIntI32(p36, var967)
				var967 = var984
				var966.initial_feed_visible_rows = var983
			elseif var972 == 17 then
				local _ = nil
				local var985, var986 = protoModule.readVarIntI32(p36, var967)
				var967 = var986
				var966.visible_rows_per_reveal = var985
			elseif var972 == 22 then
				local _ = nil
				local var987, var988 = protoModule.readVarInt(p36, var967)
				var967 = var988
				var966.enable_game_tile_videos = var987 ~= 0
			elseif var972 == 23 then
				local _ = nil
				local var989, var990 = protoModule.readVarInt(p36, var967)
				var967 = var990
				var966.continues_previous_section = var989 ~= 0
			else
				local _ = nil
				local var991, var992 = protoModule.readVarInt(p36, var967)
				local _ = var991
				var967 = var992
			end
		end
		if var968 == protoModule.wireTypes.lengthDelimited then
			if var972 == 1 then
				local _ = nil
				local var993, var994 = protoModule.readBuffer(p36, var967)
				var967 = var994
				var966.title = buffer.tostring(var993)
			elseif var972 == 2 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p36, var967)
				var967 = var996
				table.insert(var966.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var995))
			elseif var972 == 3 then
				local _ = nil
				local var997, var998 = protoModule.readBuffer(p36, var967)
				var967 = var998
				var966.next_page_token = buffer.tostring(var997)
			elseif var972 == 4 then
				local _ = nil
				local var999, var1000 = protoModule.readBuffer(p36, var967)
				var967 = var1000
				var966.sort_id = buffer.tostring(var999)
			elseif var972 == 7 then
				local _ = nil
				local var1001, var1002 = protoModule.readBuffer(p36, var967)
				var967 = var1002
				var966.subtitle = buffer.tostring(var1001)
			elseif var972 == 8 then
				local _ = nil
				local var1003, var1004 = protoModule.readBuffer(p36, var967)
				var967 = var1004
				var966.info_text = buffer.tostring(var1003)
			elseif var972 == 9 then
				local _ = nil
				local var1005, var1006 = protoModule.readBuffer(p36, var967)
				var967 = var1006
				var966.subtitle_link_path = buffer.tostring(var1005)
			elseif var972 == 12 then
				local _ = nil
				local var1007, var1008 = protoModule.readBuffer(p36, var967)
				var967 = var1008
				var966.applied_filters = buffer.tostring(var1007)
			elseif var972 == 13 then
				local _ = nil
				local var1009, var1010 = protoModule.readBuffer(p36, var967)
				var967 = var1010
				var966.pool_id = buffer.tostring(var1009)
			elseif var972 == 15 then
				local _ = nil
				local var1011, var1012 = protoModule.readBuffer(p36, var967)
				var967 = var1012
				var966.tile_activation_mode = buffer.tostring(var1011)
			elseif var972 == 18 then
				local _ = nil
				local var1013, var1014 = protoModule.readBuffer(p36, var967)
				var967 = var1014
				var966.sponsored_user_cohort = buffer.tostring(var1013)
			elseif var972 == 19 then
				local _ = nil
				local var1015, var1016 = protoModule.readBuffer(p36, var967)
				var967 = var1016
				var966.anchor_tag = buffer.tostring(var1015)
			elseif var972 == 20 then
				local _ = nil
				local var1017, var1018 = protoModule.readBuffer(p36, var967)
				var967 = var1018
				var966.collection_item_size = buffer.tostring(var1017)
			elseif var972 == 21 then
				local _ = nil
				local var1019, var1020 = protoModule.readBuffer(p36, var967)
				var967 = var1020
				var966.sort_sub_id = buffer.tostring(var1019)
			else
				local _ = nil
				local var1021, var1022 = protoModule.readVarInt(p36, var967)
				var967 = var1022 + var1021
			end
		elseif var968 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1023, var1024 = protoModule.readFixed32(p36, var967)
			local _ = var1023
			var967 = var1024
		elseif var968 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1025, var1026 = protoModule.readFixed64(p36, var967)
			local _ = var1025
			var967 = var1026
		else
			error("Unsupported wire type: " .. var1667)
		end
	end
	return var966
end

function t_36:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.universeItems = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	if self.pool_id ~= nil then
		t.poolId = self.pool_id
	end
	if self.has_emphasized_tile then
		t.hasEmphasizedTile = self.has_emphasized_tile
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		t.tileActivationMode = self.tile_activation_mode
	end
	if self.initial_feed_visible_rows ~= nil then
		t.initialFeedVisibleRows = self.initial_feed_visible_rows
	end
	if self.visible_rows_per_reveal ~= nil then
		t.visibleRowsPerReveal = self.visible_rows_per_reveal
	end
	if self.sponsored_user_cohort ~= nil then
		t.sponsoredUserCohort = self.sponsored_user_cohort
	end
	if self.anchor_tag ~= nil then
		t.anchorTag = self.anchor_tag
	end
	if self.collection_item_size ~= nil then
		t.collectionItemSize = self.collection_item_size
	end
	if self.sort_sub_id ~= nil then
		t.sortSubId = self.sort_sub_id
	end
	if self.enable_game_tile_videos then
		t.enableGameTileVideos = self.enable_game_tile_videos
	end
	if self.continues_previous_section ~= nil then
		t.continuesPreviousSection = self.continues_previous_section
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), t (ref)
	local var1027 = t_36.new()
	
	if self.title ~= nil then
		var1027.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1027.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1027.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1027.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1027.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1027.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1027.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1027.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1027.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1027.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1027.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1027.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1027.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1027.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1027.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1027.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1027.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1027.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1027.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1027.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1027.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1027.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1027.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1027.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1027.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1027.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1027.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1027.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var1027.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var1027.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var1027.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var1027.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var1027.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1027.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var1027.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1027.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var1027.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1027.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var1027.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var1027.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var1027.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var1027.enable_game_tile_videos = self.enableGameTileVideos
	end
	if self.continues_previous_section ~= nil then
		var1027.continues_previous_section = self.continues_previous_section
	end
	if self.continuesPreviousSection ~= nil then
		var1027.continues_previous_section = self.continuesPreviousSection
	end
	return var1027
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p37)
	-- upvalues: t_37 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id,
		is_sponsored = if p37 == nil or p37.is_sponsored == nil then false else p37.is_sponsored,
		roblox_component = if p37 == nil or p37.roblox_component == nil then "" else p37.roblox_component,
		native_ad_data = if p37 == nil or p37.native_ad_data == nil then "" else p37.native_ad_data,
		is_content_locked = if p37 == nil or p37.is_content_locked == nil then false else p37.is_content_locked,
		title = if p37 == nil or p37.title == nil then "" else p37.title,
		subtitle = if p37 == nil or p37.subtitle == nil then "" else p37.subtitle,
		image_asset_id = if p37 == nil or p37.image_asset_id == nil then "" else p37.image_asset_id,
		video_asset_id = if p37 == nil or p37.video_asset_id == nil then "" else p37.video_asset_id,
		badge_text = if p37 == nil or p37.badge_text == nil then "" else p37.badge_text,
		player_count = if p37 == nil or p37.player_count == nil then nil else p37.player_count,
		creator_key = if p37 == nil or p37.creator_key == nil then "" else p37.creator_key,
		rank = if p37 == nil or p37.rank == nil then nil else p37.rank,
		payer_name = if p37 == nil or p37.payer_name == nil then nil else p37.payer_name,
		logo_asset_id = if p37 == nil or p37.logo_asset_id == nil then nil else p37.logo_asset_id,
		logo_aspect_ratio = if p37 == nil or p37.logo_aspect_ratio == nil then nil else p37.logo_aspect_ratio,
		place_id = if p37 == nil or p37.place_id == nil then nil else p37.place_id,
		launch_data = if p37 == nil or p37.launch_data == nil then nil else p37.launch_data,
		tile_variant = if p37 == nil or p37.tile_variant == nil then nil else p37.tile_variant,
		cta_text = if p37 == nil or p37.cta_text == nil then nil else p37.cta_text,
		badge_analytics_id = if p37 == nil or p37.badge_analytics_id == nil then nil else p37.badge_analytics_id,
		game_items = if p37 == nil or p37.game_items == nil then {} else p37.game_items,
		attribution_thumbnail_asset_id = if p37 == nil or p37.attribution_thumbnail_asset_id == nil then nil else p37.attribution_thumbnail_asset_id,
		game_items_compact = if p37 == nil or p37.game_items_compact == nil then {} else p37.game_items_compact,
		source_sort_id = if p37 == nil or p37.source_sort_id == nil then nil else p37.source_sort_id,
		new_game_enum = if p37 == nil or p37.new_game_enum == nil then nil else p37.new_game_enum,
		moment_video_playback = if p37 == nil or p37.moment_video_playback == nil then nil else p37.moment_video_playback
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1028 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1029, var1030 = protoModule.writeTag(buff, var1028, 1, protoModule.wireTypes.lengthDelimited)
		var1029, var1734 = protoModule.writeString(var1029, var1030, self.universe_id)
		buff = var1029
		var1028 = var1030
	end
	if self.is_sponsored then
		local var1031, var1032 = protoModule.writeTag(buff, var1028, 2, protoModule.wireTypes.varint)
		var1031, var1736 = protoModule.writeVarInt(var1031, var1032, if self.is_sponsored then 1 else 0)
		buff = var1031
		var1028 = var1032
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1033, var1034 = protoModule.writeTag(buff, var1028, 3, protoModule.wireTypes.lengthDelimited)
		var1033, var1738 = protoModule.writeString(var1033, var1034, self.roblox_component)
		buff = var1033
		var1028 = var1034
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1035, var1036 = protoModule.writeTag(buff, var1028, 4, protoModule.wireTypes.lengthDelimited)
		var1035, var1740 = protoModule.writeString(var1035, var1036, self.native_ad_data)
		buff = var1035
		var1028 = var1036
	end
	if self.is_content_locked then
		local var1037, var1038 = protoModule.writeTag(buff, var1028, 5, protoModule.wireTypes.varint)
		var1037, var1742 = protoModule.writeVarInt(var1037, var1038, if self.is_content_locked then 1 else 0)
		buff = var1037
		var1028 = var1038
	end
	if self.title ~= nil and self.title ~= "" then
		local var1039, var1040 = protoModule.writeTag(buff, var1028, 6, protoModule.wireTypes.lengthDelimited)
		var1039, var1744 = protoModule.writeString(var1039, var1040, self.title)
		buff = var1039
		var1028 = var1040
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1041, var1042 = protoModule.writeTag(buff, var1028, 7, protoModule.wireTypes.lengthDelimited)
		var1041, var1746 = protoModule.writeString(var1041, var1042, self.subtitle)
		buff = var1041
		var1028 = var1042
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1043, var1044 = protoModule.writeTag(buff, var1028, 8, protoModule.wireTypes.lengthDelimited)
		var1043, var1748 = protoModule.writeString(var1043, var1044, self.image_asset_id)
		buff = var1043
		var1028 = var1044
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1045, var1046 = protoModule.writeTag(buff, var1028, 9, protoModule.wireTypes.lengthDelimited)
		var1045, var1750 = protoModule.writeString(var1045, var1046, self.video_asset_id)
		buff = var1045
		var1028 = var1046
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1047, var1048 = protoModule.writeTag(buff, var1028, 10, protoModule.wireTypes.lengthDelimited)
		var1047, var1752 = protoModule.writeString(var1047, var1048, self.badge_text)
		buff = var1047
		var1028 = var1048
	end
	if self.player_count ~= nil then
		local var1049, var1050 = protoModule.writeTag(buff, var1028, 11, protoModule.wireTypes.varint)
		var1049, var1754 = protoModule.writeVarInt(var1049, var1050, self.player_count)
		buff = var1049
		var1028 = var1050
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1051, var1052 = protoModule.writeTag(buff, var1028, 12, protoModule.wireTypes.lengthDelimited)
		var1051, var1756 = protoModule.writeString(var1051, var1052, self.creator_key)
		buff = var1051
		var1028 = var1052
	end
	if self.rank ~= nil then
		local var1053, var1054 = protoModule.writeTag(buff, var1028, 13, protoModule.wireTypes.varint)
		var1053, var1758 = protoModule.writeVarInt(var1053, var1054, self.rank)
		buff = var1053
		var1028 = var1054
	end
	if self.payer_name ~= nil then
		local var1055, var1056 = protoModule.writeTag(buff, var1028, 14, protoModule.wireTypes.lengthDelimited)
		var1055, var1760 = protoModule.writeString(var1055, var1056, self.payer_name)
		buff = var1055
		var1028 = var1056
	end
	if self.logo_asset_id ~= nil then
		local var1057, var1058 = protoModule.writeTag(buff, var1028, 15, protoModule.wireTypes.lengthDelimited)
		var1057, var1762 = protoModule.writeString(var1057, var1058, self.logo_asset_id)
		buff = var1057
		var1028 = var1058
	end
	if self.logo_aspect_ratio ~= nil then
		local var1059, var1060 = protoModule.writeTag(buff, var1028, 16, protoModule.wireTypes.i64)
		var1059, var1764 = protoModule.writeDouble(var1059, var1060, self.logo_aspect_ratio)
		buff = var1059
		var1028 = var1060
	end
	if self.place_id ~= nil then
		local var1061, var1062 = protoModule.writeTag(buff, var1028, 17, protoModule.wireTypes.lengthDelimited)
		var1061, var1766 = protoModule.writeString(var1061, var1062, self.place_id)
		buff = var1061
		var1028 = var1062
	end
	if self.launch_data ~= nil then
		local var1063, var1064 = protoModule.writeTag(buff, var1028, 18, protoModule.wireTypes.lengthDelimited)
		var1063, var1768 = protoModule.writeString(var1063, var1064, self.launch_data)
		buff = var1063
		var1028 = var1064
	end
	if self.tile_variant ~= nil then
		local var1065, var1066 = protoModule.writeTag(buff, var1028, 19, protoModule.wireTypes.lengthDelimited)
		var1065, var1770 = protoModule.writeString(var1065, var1066, self.tile_variant)
		buff = var1065
		var1028 = var1066
	end
	if self.cta_text ~= nil then
		local var1067, var1068 = protoModule.writeTag(buff, var1028, 20, protoModule.wireTypes.lengthDelimited)
		var1067, var1772 = protoModule.writeString(var1067, var1068, self.cta_text)
		buff = var1067
		var1028 = var1068
	end
	if self.badge_analytics_id ~= nil then
		local var1069, var1070 = protoModule.writeTag(buff, var1028, 21, protoModule.wireTypes.lengthDelimited)
		var1069, var1774 = protoModule.writeString(var1069, var1070, self.badge_analytics_id)
		buff = var1069
		var1028 = var1070
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1071 = v:encode()
			local var1072, var1073 = protoModule.writeTag(buff, var1028, 22, protoModule.wireTypes.lengthDelimited)
			var1072, var1777 = protoModule.writeBuffer(var1072, var1073, var1071, buffer.len(var1071))
			buff = var1072
			var1028 = var1073
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1074, var1075 = protoModule.writeTag(buff, var1028, 23, protoModule.wireTypes.lengthDelimited)
		var1074, var1779 = protoModule.writeString(var1074, var1075, self.attribution_thumbnail_asset_id)
		buff = var1074
		var1028 = var1075
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1076 = v:encode()
			local var1077, var1078 = protoModule.writeTag(buff, var1028, 24, protoModule.wireTypes.lengthDelimited)
			var1077, var1782 = protoModule.writeBuffer(var1077, var1078, var1076, buffer.len(var1076))
			buff = var1077
			var1028 = var1078
		end
	end
	if self.source_sort_id ~= nil then
		local var1079, var1080 = protoModule.writeTag(buff, var1028, 25, protoModule.wireTypes.lengthDelimited)
		var1079, var1784 = protoModule.writeString(var1079, var1080, self.source_sort_id)
		buff = var1079
		var1028 = var1080
	end
	if self.new_game_enum ~= nil then
		local var1081, var1082 = protoModule.writeTag(buff, var1028, 26, protoModule.wireTypes.varint)
		var1081, var1786 = protoModule.writeVarInt(var1081, var1082, self.new_game_enum)
		buff = var1081
		var1028 = var1082
	end
	if self.moment_video_playback ~= nil then
		local var1083 = self.moment_video_playback:encode()
		local var1084, var1085 = protoModule.writeTag(buff, var1028, 27, protoModule.wireTypes.lengthDelimited)
		var1084, var1789 = protoModule.writeBuffer(var1084, var1085, var1083, buffer.len(var1083))
		buff = var1084
		var1028 = var1085
	end
	local buff_1 = buffer.create(var1028)
	buffer.copy(buff_1, 0, buff, 0, var1028)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1086 = t_37.new()
	local var1087 = 0
	while var1087 < buffer.len(p37) do
		local _ = nil
		local var1088 = nil
		local var1089, var1090, var1091 = protoModule.readTag(p37, var1087)
		local var1092 = var1089
		var1088 = var1090
		var1087 = var1091
		
		if var1088 == protoModule.wireTypes.varint then
			if var1092 == 2 then
				local _ = nil
				local var1093, var1094 = protoModule.readVarInt(p37, var1087)
				var1087 = var1094
				var1086.is_sponsored = var1093 ~= 0
			elseif var1092 == 5 then
				local _ = nil
				local var1095, var1096 = protoModule.readVarInt(p37, var1087)
				var1087 = var1096
				var1086.is_content_locked = var1095 ~= 0
			elseif var1092 == 11 then
				local _ = nil
				local var1097, var1098 = protoModule.readVarIntI64(p37, var1087)
				var1087 = var1098
				var1086.player_count = var1097
			elseif var1092 == 13 then
				local _ = nil
				local var1099, var1100 = protoModule.readVarIntI32(p37, var1087)
				var1087 = var1100
				var1086.rank = var1099
			elseif var1092 == 26 then
				local _ = nil
				local var1101, var1102 = protoModule.readVarIntI32(p37, var1087)
				var1087 = var1102
				var1086.new_game_enum = var1101
			else
				local _ = nil
				local var1103, var1104 = protoModule.readVarInt(p37, var1087)
				local _ = var1103
				var1087 = var1104
			end
		end
		if var1088 == protoModule.wireTypes.lengthDelimited then
			if var1092 == 1 then
				local _ = nil
				local var1105, var1106 = protoModule.readBuffer(p37, var1087)
				var1087 = var1106
				var1086.universe_id = buffer.tostring(var1105)
			elseif var1092 == 3 then
				local _ = nil
				local var1107, var1108 = protoModule.readBuffer(p37, var1087)
				var1087 = var1108
				var1086.roblox_component = buffer.tostring(var1107)
			elseif var1092 == 4 then
				local _ = nil
				local var1109, var1110 = protoModule.readBuffer(p37, var1087)
				var1087 = var1110
				var1086.native_ad_data = buffer.tostring(var1109)
			elseif var1092 == 6 then
				local _ = nil
				local var1111, var1112 = protoModule.readBuffer(p37, var1087)
				var1087 = var1112
				var1086.title = buffer.tostring(var1111)
			elseif var1092 == 7 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p37, var1087)
				var1087 = var1114
				var1086.subtitle = buffer.tostring(var1113)
			elseif var1092 == 8 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p37, var1087)
				var1087 = var1116
				var1086.image_asset_id = buffer.tostring(var1115)
			elseif var1092 == 9 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p37, var1087)
				var1087 = var1118
				var1086.video_asset_id = buffer.tostring(var1117)
			elseif var1092 == 10 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p37, var1087)
				var1087 = var1120
				var1086.badge_text = buffer.tostring(var1119)
			elseif var1092 == 12 then
				local _ = nil
				local var1121, var1122 = protoModule.readBuffer(p37, var1087)
				var1087 = var1122
				var1086.creator_key = buffer.tostring(var1121)
			elseif var1092 == 14 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p37, var1087)
				var1087 = var1124
				var1086.payer_name = buffer.tostring(var1123)
			elseif var1092 == 15 then
				local _ = nil
				local var1125, var1126 = protoModule.readBuffer(p37, var1087)
				var1087 = var1126
				var1086.logo_asset_id = buffer.tostring(var1125)
			elseif var1092 == 17 then
				local _ = nil
				local var1127, var1128 = protoModule.readBuffer(p37, var1087)
				var1087 = var1128
				var1086.place_id = buffer.tostring(var1127)
			elseif var1092 == 18 then
				local _ = nil
				local var1129, var1130 = protoModule.readBuffer(p37, var1087)
				var1087 = var1130
				var1086.launch_data = buffer.tostring(var1129)
			elseif var1092 == 19 then
				local _ = nil
				local var1131, var1132 = protoModule.readBuffer(p37, var1087)
				var1087 = var1132
				var1086.tile_variant = buffer.tostring(var1131)
			elseif var1092 == 20 then
				local _ = nil
				local var1133, var1134 = protoModule.readBuffer(p37, var1087)
				var1087 = var1134
				var1086.cta_text = buffer.tostring(var1133)
			elseif var1092 == 21 then
				local _ = nil
				local var1135, var1136 = protoModule.readBuffer(p37, var1087)
				var1087 = var1136
				var1086.badge_analytics_id = buffer.tostring(var1135)
			elseif var1092 == 22 then
				local _ = nil
				local var1137, var1138 = protoModule.readBuffer(p37, var1087)
				var1087 = var1138
				table.insert(var1086.game_items, t.GameItemInputData.decode(var1137))
			elseif var1092 == 23 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p37, var1087)
				var1087 = var1140
				var1086.attribution_thumbnail_asset_id = buffer.tostring(var1139)
			elseif var1092 == 24 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p37, var1087)
				var1087 = var1142
				table.insert(var1086.game_items_compact, t.GameItemInputData.decode(var1141))
			elseif var1092 == 25 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p37, var1087)
				var1087 = var1144
				var1086.source_sort_id = buffer.tostring(var1143)
			elseif var1092 == 27 then
				local _ = nil
				local var1145, var1146 = protoModule.readBuffer(p37, var1087)
				var1087 = var1146
				var1086.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1145)
			else
				local _ = nil
				local var1147, var1148 = protoModule.readVarInt(p37, var1087)
				var1087 = var1148 + var1147
			end
		elseif var1088 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1149, var1150 = protoModule.readFixed32(p37, var1087)
			local _ = var1149
			var1087 = var1150
		elseif var1088 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1793)
		elseif var1092 == 16 then
			local _ = nil
			local var1151, var1152 = protoModule.readDouble(p37, var1087)
			var1087 = var1152
			var1086.logo_aspect_ratio = var1151
		else
			local _ = nil
			local var1153, var1154 = protoModule.readFixed64(p37, var1087)
			local _ = var1153
			var1087 = var1154
		end
	end
	return var1086
end

function t_37:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_sponsored then
		t.isSponsored = self.is_sponsored
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		t.badgeText = self.badge_text
	end
	if self.player_count ~= nil then
		t.playerCount = self.player_count
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.rank ~= nil then
		t.rank = self.rank
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = protoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id
	end
	if self.launch_data ~= nil then
		t.launchData = self.launch_data
	end
	if self.tile_variant ~= nil then
		t.tileVariant = self.tile_variant
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.gameItems = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		t.attributionThumbnailAssetId = self.attribution_thumbnail_asset_id
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, v:jsonEncode())
		end
		t.gameItemsCompact = t_1
	end
	if self.source_sort_id ~= nil then
		t.sourceSortId = self.source_sort_id
	end
	if self.new_game_enum ~= nil then
		t.newGameEnum = self.new_game_enum
	end
	if self.moment_video_playback ~= nil then
		t.momentVideoPlayback = self.moment_video_playback:jsonEncode()
	end
	return t
end

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1155 = t_37.new()
	
	if self.universe_id ~= nil then
		var1155.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1155.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1155.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1155.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1155.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1155.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1155.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1155.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1155.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1155.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1155.title = self.title
	end
	if self.subtitle ~= nil then
		var1155.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1155.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1155.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1155.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1155.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1155.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1155.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1155.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1155.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1155.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1155.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1155.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1155.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1155.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1155.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1155.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1155.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1155.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1155.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1155.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1155.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1155.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1155.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1155.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1155.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1155.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1155.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1155.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1155.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1155.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1155.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1155.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1155.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1155.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1155.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1155.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1155.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1155.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1155.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1155.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	return var1155
end

t_37.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_37
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t_38 (ref)
	return setmetatable({
		asset_id = if p38 == nil or p38.asset_id == nil then "" else p38.asset_id,
		asset_access_context = if p38 == nil or p38.asset_access_context == nil then "" else p38.asset_access_context
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1156 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1157, var1158 = protoModule.writeTag(buff, var1156, 1, protoModule.wireTypes.lengthDelimited)
		var1157, var1871 = protoModule.writeString(var1157, var1158, self.asset_id)
		buff = var1157
		var1156 = var1158
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1159, var1160 = protoModule.writeTag(buff, var1156, 2, protoModule.wireTypes.lengthDelimited)
		var1159, var1873 = protoModule.writeString(var1159, var1160, self.asset_access_context)
		buff = var1159
		var1156 = var1160
	end
	local buff_1 = buffer.create(var1156)
	buffer.copy(buff_1, 0, buff, 0, var1156)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1156 = t_38.new()
	local var1157 = 0
	while var1157 < buffer.len(p38) do
		local _ = nil
		local var1158 = nil
		local var1159, var1160, var1161 = protoModule.readTag(p38, var1157)
		local var1162 = var1159
		var1158 = var1160
		var1157 = var1161
		
		if var1158 == protoModule.wireTypes.varint then
			local _ = nil
			local var1163, var1164 = protoModule.readVarInt(p38, var1157)
			local _ = var1163
			var1157 = var1164
			continue
		end
		if var1158 == protoModule.wireTypes.lengthDelimited then
			if var1162 == 1 then
				local _ = nil
				local var1165, var1166 = protoModule.readBuffer(p38, var1157)
				var1157 = var1166
				var1156.asset_id = buffer.tostring(var1165)
			elseif var1162 == 2 then
				local _ = nil
				local var1167, var1168 = protoModule.readBuffer(p38, var1157)
				var1157 = var1168
				var1156.asset_access_context = buffer.tostring(var1167)
			else
				local _ = nil
				local var1169, var1170 = protoModule.readVarInt(p38, var1157)
				var1157 = var1170 + var1169
			end
		elseif var1158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1171, var1172 = protoModule.readFixed32(p38, var1157)
			local _ = var1171
			var1157 = var1172
		elseif var1158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1173, var1174 = protoModule.readFixed64(p38, var1157)
			local _ = var1173
			var1157 = var1174
		else
			error("Unsupported wire type: " .. var1877)
		end
	end
	return var1156
end

function t_38:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function t_38:jsonDecode()
	-- upvalues: t_38 (ref)
	local var1175 = t_38.new()
	
	if self.asset_id ~= nil then
		var1175.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1175.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1175.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1175.asset_access_context = self.assetAccessContext
	end
	return var1175
end

t_38.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = t_38
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		title = if p39 == nil or p39.title == nil then "" else p39.title,
		song_items = if p39 == nil or p39.song_items == nil then {} else p39.song_items,
		next_page_token = if p39 == nil or p39.next_page_token == nil then "" else p39.next_page_token,
		sort_id = if p39 == nil or p39.sort_id == nil then "" else p39.sort_id,
		secondary_sort_id = if p39 == nil or p39.secondary_sort_id == nil then 0 else p39.secondary_sort_id,
		subtitle = if p39 == nil or p39.subtitle == nil then "" else p39.subtitle,
		info_text = if p39 == nil or p39.info_text == nil then "" else p39.info_text,
		subtitle_link_path = if p39 == nil or p39.subtitle_link_path == nil then "" else p39.subtitle_link_path,
		is_placeholder = if p39 == nil or p39.is_placeholder == nil then nil else p39.is_placeholder,
		primary_sort_id = if p39 == nil or p39.primary_sort_id == nil then nil else p39.primary_sort_id,
		applied_filters = if p39 == nil or p39.applied_filters == nil then nil else p39.applied_filters
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1175 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1176, var1177 = protoModule.writeTag(buff, var1175, 1, protoModule.wireTypes.lengthDelimited)
		var1176, var1899 = protoModule.writeString(var1176, var1177, self.title)
		buff = var1176
		var1175 = var1177
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1178 = v:encode()
			local var1179, var1180 = protoModule.writeTag(buff, var1175, 2, protoModule.wireTypes.lengthDelimited)
			var1179, var1902 = protoModule.writeBuffer(var1179, var1180, var1178, buffer.len(var1178))
			buff = var1179
			var1175 = var1180
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1181, var1182 = protoModule.writeTag(buff, var1175, 3, protoModule.wireTypes.lengthDelimited)
		var1181, var1904 = protoModule.writeString(var1181, var1182, self.next_page_token)
		buff = var1181
		var1175 = var1182
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1183, var1184 = protoModule.writeTag(buff, var1175, 4, protoModule.wireTypes.lengthDelimited)
		var1183, var1906 = protoModule.writeString(var1183, var1184, self.sort_id)
		buff = var1183
		var1175 = var1184
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1185, var1186 = protoModule.writeTag(buff, var1175, 5, protoModule.wireTypes.varint)
		var1185, var1908 = protoModule.writeVarInt(var1185, var1186, self.secondary_sort_id)
		buff = var1185
		var1175 = var1186
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1187, var1188 = protoModule.writeTag(buff, var1175, 6, protoModule.wireTypes.lengthDelimited)
		var1187, var1910 = protoModule.writeString(var1187, var1188, self.subtitle)
		buff = var1187
		var1175 = var1188
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1189, var1190 = protoModule.writeTag(buff, var1175, 7, protoModule.wireTypes.lengthDelimited)
		var1189, var1912 = protoModule.writeString(var1189, var1190, self.info_text)
		buff = var1189
		var1175 = var1190
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1191, var1192 = protoModule.writeTag(buff, var1175, 8, protoModule.wireTypes.lengthDelimited)
		var1191, var1914 = protoModule.writeString(var1191, var1192, self.subtitle_link_path)
		buff = var1191
		var1175 = var1192
	end
	if self.is_placeholder ~= nil then
		local var1193, var1194 = protoModule.writeTag(buff, var1175, 9, protoModule.wireTypes.varint)
		var1193, var1916 = protoModule.writeVarInt(var1193, var1194, if self.is_placeholder then 1 else 0)
		buff = var1193
		var1175 = var1194
	end
	if self.primary_sort_id ~= nil then
		local var1195, var1196 = protoModule.writeTag(buff, var1175, 10, protoModule.wireTypes.varint)
		var1195, var1918 = protoModule.writeVarInt(var1195, var1196, self.primary_sort_id)
		buff = var1195
		var1175 = var1196
	end
	if self.applied_filters ~= nil then
		local var1197, var1198 = protoModule.writeTag(buff, var1175, 11, protoModule.wireTypes.lengthDelimited)
		var1197, var1920 = protoModule.writeString(var1197, var1198, self.applied_filters)
		buff = var1197
		var1175 = var1198
	end
	local buff_1 = buffer.create(var1175)
	buffer.copy(buff_1, 0, buff, 0, var1175)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1199 = t_39.new()
	local var1200 = 0
	while var1200 < buffer.len(p39) do
		local _ = nil
		local var1201 = nil
		local var1202, var1203, var1204 = protoModule.readTag(p39, var1200)
		local var1205 = var1202
		var1201 = var1203
		var1200 = var1204
		
		if var1201 == protoModule.wireTypes.varint then
			if var1205 == 5 then
				local _ = nil
				local var1206, var1207 = protoModule.readVarIntI32(p39, var1200)
				var1200 = var1207
				var1199.secondary_sort_id = var1206
			elseif var1205 == 9 then
				local _ = nil
				local var1208, var1209 = protoModule.readVarInt(p39, var1200)
				var1200 = var1209
				var1199.is_placeholder = var1208 ~= 0
			elseif var1205 == 10 then
				local _ = nil
				local var1210, var1211 = protoModule.readVarIntI32(p39, var1200)
				var1200 = var1211
				var1199.primary_sort_id = var1210
			else
				local _ = nil
				local var1212, var1213 = protoModule.readVarInt(p39, var1200)
				local _ = var1212
				var1200 = var1213
			end
		end
		if var1201 == protoModule.wireTypes.lengthDelimited then
			if var1205 == 1 then
				local _ = nil
				local var1214, var1215 = protoModule.readBuffer(p39, var1200)
				var1200 = var1215
				var1199.title = buffer.tostring(var1214)
			elseif var1205 == 2 then
				local _ = nil
				local var1216, var1217 = protoModule.readBuffer(p39, var1200)
				var1200 = var1217
				table.insert(var1199.song_items, t.SongCarouselInputData_SongItem.decode(var1216))
			elseif var1205 == 3 then
				local _ = nil
				local var1218, var1219 = protoModule.readBuffer(p39, var1200)
				var1200 = var1219
				var1199.next_page_token = buffer.tostring(var1218)
			elseif var1205 == 4 then
				local _ = nil
				local var1220, var1221 = protoModule.readBuffer(p39, var1200)
				var1200 = var1221
				var1199.sort_id = buffer.tostring(var1220)
			elseif var1205 == 6 then
				local _ = nil
				local var1222, var1223 = protoModule.readBuffer(p39, var1200)
				var1200 = var1223
				var1199.subtitle = buffer.tostring(var1222)
			elseif var1205 == 7 then
				local _ = nil
				local var1224, var1225 = protoModule.readBuffer(p39, var1200)
				var1200 = var1225
				var1199.info_text = buffer.tostring(var1224)
			elseif var1205 == 8 then
				local _ = nil
				local var1226, var1227 = protoModule.readBuffer(p39, var1200)
				var1200 = var1227
				var1199.subtitle_link_path = buffer.tostring(var1226)
			elseif var1205 == 11 then
				local _ = nil
				local var1228, var1229 = protoModule.readBuffer(p39, var1200)
				var1200 = var1229
				var1199.applied_filters = buffer.tostring(var1228)
			else
				local _ = nil
				local var1230, var1231 = protoModule.readVarInt(p39, var1200)
				var1200 = var1231 + var1230
			end
		elseif var1201 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1232, var1233 = protoModule.readFixed32(p39, var1200)
			local _ = var1232
			var1200 = var1233
		elseif var1201 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1234, var1235 = protoModule.readFixed64(p39, var1200)
			local _ = var1234
			var1200 = var1235
		else
			error("Unsupported wire type: " .. var1924)
		end
	end
	return var1199
end

function t_39:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.songItems = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), t (ref)
	local var1236 = t_39.new()
	
	if self.title ~= nil then
		var1236.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1236.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1236.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1236.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1236.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1236.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1236.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1236.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1236.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1236.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1236.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1236.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1236.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1236.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1236.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1236.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1236.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1236.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1236.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1236.applied_filters = self.appliedFilters
	end
	return var1236
end

t_39.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_39
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t_40 (ref)
	return setmetatable({
		song_id = if p40 == nil or p40.song_id == nil then "" else p40.song_id
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1237 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1238, var1239 = protoModule.writeTag(buff, var1237, 1, protoModule.wireTypes.lengthDelimited)
		var1238, var1967 = protoModule.writeString(var1238, var1239, self.song_id)
		buff = var1238
		var1237 = var1239
	end
	local buff_1 = buffer.create(var1237)
	buffer.copy(buff_1, 0, buff, 0, var1237)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1237 = t_40.new()
	local var1238 = 0
	while var1238 < buffer.len(p40) do
		local _ = nil
		local var1239 = nil
		local var1240, var1241, var1242 = protoModule.readTag(p40, var1238)
		local var1243 = var1240
		var1239 = var1241
		var1238 = var1242
		
		if var1239 == protoModule.wireTypes.varint then
			local _ = nil
			local var1244, var1245 = protoModule.readVarInt(p40, var1238)
			local _ = var1244
			var1238 = var1245
			continue
		end
		if var1239 == protoModule.wireTypes.lengthDelimited then
			if var1243 == 1 then
				local _ = nil
				local var1246, var1247 = protoModule.readBuffer(p40, var1238)
				var1238 = var1247
				var1237.song_id = buffer.tostring(var1246)
			else
				local _ = nil
				local var1248, var1249 = protoModule.readVarInt(p40, var1238)
				var1238 = var1249 + var1248
			end
		elseif var1239 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1250, var1251 = protoModule.readFixed32(p40, var1238)
			local _ = var1250
			var1238 = var1251
		elseif var1239 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1252, var1253 = protoModule.readFixed64(p40, var1238)
			local _ = var1252
			var1238 = var1253
		else
			error("Unsupported wire type: " .. var1971)
		end
	end
	return var1237
end

function t_40:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_40:jsonDecode()
	-- upvalues: t_40 (ref)
	local var1254 = t_40.new()
	
	if self.song_id ~= nil then
		var1254.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1254.song_id = self.songId
	end
	return var1254
end

t_40.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_40
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		title = if p41 == nil or p41.title == nil then "" else p41.title,
		event_items = if p41 == nil or p41.event_items == nil then {} else p41.event_items,
		universe_id = if p41 == nil or p41.universe_id == nil then "" else p41.universe_id,
		sort_id = if p41 == nil or p41.sort_id == nil then "" else p41.sort_id,
		subtitle = if p41 == nil or p41.subtitle == nil then "" else p41.subtitle,
		info_text = if p41 == nil or p41.info_text == nil then "" else p41.info_text
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1254 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1255, var1256 = protoModule.writeTag(buff, var1254, 1, protoModule.wireTypes.lengthDelimited)
		var1255, var1991 = protoModule.writeString(var1255, var1256, self.title)
		buff = var1255
		var1254 = var1256
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1257 = v:encode()
			local var1258, var1259 = protoModule.writeTag(buff, var1254, 2, protoModule.wireTypes.lengthDelimited)
			var1258, var1994 = protoModule.writeBuffer(var1258, var1259, var1257, buffer.len(var1257))
			buff = var1258
			var1254 = var1259
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1260, var1261 = protoModule.writeTag(buff, var1254, 3, protoModule.wireTypes.lengthDelimited)
		var1260, var1996 = protoModule.writeString(var1260, var1261, self.universe_id)
		buff = var1260
		var1254 = var1261
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1262, var1263 = protoModule.writeTag(buff, var1254, 4, protoModule.wireTypes.lengthDelimited)
		var1262, var1998 = protoModule.writeString(var1262, var1263, self.sort_id)
		buff = var1262
		var1254 = var1263
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1264, var1265 = protoModule.writeTag(buff, var1254, 5, protoModule.wireTypes.lengthDelimited)
		var1264, var2000 = protoModule.writeString(var1264, var1265, self.subtitle)
		buff = var1264
		var1254 = var1265
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1266, var1267 = protoModule.writeTag(buff, var1254, 6, protoModule.wireTypes.lengthDelimited)
		var1266, var2002 = protoModule.writeString(var1266, var1267, self.info_text)
		buff = var1266
		var1254 = var1267
	end
	local buff_1 = buffer.create(var1254)
	buffer.copy(buff_1, 0, buff, 0, var1254)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1268 = t_41.new()
	local var1269 = 0
	while var1269 < buffer.len(p41) do
		local _ = nil
		local var1270 = nil
		local var1271, var1272, var1273 = protoModule.readTag(p41, var1269)
		local var1274 = var1271
		var1270 = var1272
		var1269 = var1273
		
		if var1270 == protoModule.wireTypes.varint then
			local _ = nil
			local var1275, var1276 = protoModule.readVarInt(p41, var1269)
			local _ = var1275
			var1269 = var1276
			continue
		end
		if var1270 == protoModule.wireTypes.lengthDelimited then
			if var1274 == 1 then
				local _ = nil
				local var1277, var1278 = protoModule.readBuffer(p41, var1269)
				var1269 = var1278
				var1268.title = buffer.tostring(var1277)
			elseif var1274 == 2 then
				local _ = nil
				local var1279, var1280 = protoModule.readBuffer(p41, var1269)
				var1269 = var1280
				table.insert(var1268.event_items, t.EventsCarouselInputData_EventItem.decode(var1279))
			elseif var1274 == 3 then
				local _ = nil
				local var1281, var1282 = protoModule.readBuffer(p41, var1269)
				var1269 = var1282
				var1268.universe_id = buffer.tostring(var1281)
			elseif var1274 == 4 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p41, var1269)
				var1269 = var1284
				var1268.sort_id = buffer.tostring(var1283)
			elseif var1274 == 5 then
				local _ = nil
				local var1285, var1286 = protoModule.readBuffer(p41, var1269)
				var1269 = var1286
				var1268.subtitle = buffer.tostring(var1285)
			elseif var1274 == 6 then
				local _ = nil
				local var1287, var1288 = protoModule.readBuffer(p41, var1269)
				var1269 = var1288
				var1268.info_text = buffer.tostring(var1287)
			else
				local _ = nil
				local var1289, var1290 = protoModule.readVarInt(p41, var1269)
				var1269 = var1290 + var1289
			end
		elseif var1270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1291, var1292 = protoModule.readFixed32(p41, var1269)
			local _ = var1291
			var1269 = var1292
		elseif var1270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1293, var1294 = protoModule.readFixed64(p41, var1269)
			local _ = var1293
			var1269 = var1294
		else
			error("Unsupported wire type: " .. var2006)
		end
	end
	return var1268
end

function t_41:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.eventItems = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), t (ref)
	local var1295 = t_41.new()
	
	if self.title ~= nil then
		var1295.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1295.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1295.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1295.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1295.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1295.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1295.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1295.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1295.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1295.info_text = self.infoText
	end
	return var1295
end

t_41.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_41
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t_42 (ref)
	return setmetatable({
		event_id = if p42 == nil or p42.event_id == nil then "" else p42.event_id
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1296 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1297, var1298 = protoModule.writeTag(buff, var1296, 1, protoModule.wireTypes.lengthDelimited)
		var1297, var2039 = protoModule.writeString(var1297, var1298, self.event_id)
		buff = var1297
		var1296 = var1298
	end
	local buff_1 = buffer.create(var1296)
	buffer.copy(buff_1, 0, buff, 0, var1296)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref)
	local var1296 = t_42.new()
	local var1297 = 0
	while var1297 < buffer.len(p42) do
		local _ = nil
		local var1298 = nil
		local var1299, var1300, var1301 = protoModule.readTag(p42, var1297)
		local var1302 = var1299
		var1298 = var1300
		var1297 = var1301
		
		if var1298 == protoModule.wireTypes.varint then
			local _ = nil
			local var1303, var1304 = protoModule.readVarInt(p42, var1297)
			local _ = var1303
			var1297 = var1304
			continue
		end
		if var1298 == protoModule.wireTypes.lengthDelimited then
			if var1302 == 1 then
				local _ = nil
				local var1305, var1306 = protoModule.readBuffer(p42, var1297)
				var1297 = var1306
				var1296.event_id = buffer.tostring(var1305)
			else
				local _ = nil
				local var1307, var1308 = protoModule.readVarInt(p42, var1297)
				var1297 = var1308 + var1307
			end
		elseif var1298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1309, var1310 = protoModule.readFixed32(p42, var1297)
			local _ = var1309
			var1297 = var1310
		elseif var1298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1311, var1312 = protoModule.readFixed64(p42, var1297)
			local _ = var1311
			var1297 = var1312
		else
			error("Unsupported wire type: " .. var2043)
		end
	end
	return var1296
end

function t_42:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_42:jsonDecode()
	-- upvalues: t_42 (ref)
	local var1313 = t_42.new()
	
	if self.event_id ~= nil then
		var1313.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1313.event_id = self.eventId
	end
	return var1313
end

t_42.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_42
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		universe_id = if p43 == nil or p43.universe_id == nil then "" else p43.universe_id,
		entry_map = if p43 == nil or p43.entry_map == nil then {} else p43.entry_map,
		entry_order = if p43 == nil or p43.entry_order == nil then {} else p43.entry_order,
		creator_key = if p43 == nil or p43.creator_key == nil then "" else p43.creator_key,
		pill_tabs = if p43 == nil or p43.pill_tabs == nil then nil else p43.pill_tabs
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1313 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1314, var1315 = protoModule.writeTag(buff, var1313, 1, protoModule.wireTypes.lengthDelimited)
		var1314, var2063 = protoModule.writeString(var1314, var1315, self.universe_id)
		buff = var1314
		var1313 = var1315
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1316, var1317 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1316, var2065 = protoModule.writeString(var1316, var1317, i)
			local var1318 = v:encode()
			var1317, var2067 = protoModule.writeTag(var1316, var1317, 2, protoModule.wireTypes.lengthDelimited)
			var1317, var2067 = protoModule.writeBuffer(var1317, var2067, var1318, buffer.len(var1318))
			local var1319 = var1317
			local var1320 = var2067
			local var1321, var1322 = protoModule.writeTag(buff, var1313, 2, protoModule.wireTypes.lengthDelimited)
			var1321, var2071 = protoModule.writeBuffer(var1321, var1322, var1319, var1320)
			buff = var1321
			var1313 = var1322
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1323, var1324 = protoModule.writeTag(buff, var1313, 3, protoModule.wireTypes.lengthDelimited)
			var1323, var2073 = protoModule.writeString(var1323, var1324, v)
			buff = var1323
			var1313 = var1324
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1325, var1326 = protoModule.writeTag(buff, var1313, 4, protoModule.wireTypes.lengthDelimited)
		var1325, var2075 = protoModule.writeString(var1325, var1326, self.creator_key)
		buff = var1325
		var1313 = var1326
	end
	if self.pill_tabs ~= nil then
		local var1327 = self.pill_tabs:encode()
		local var1328, var1329 = protoModule.writeTag(buff, var1313, 5, protoModule.wireTypes.lengthDelimited)
		var1328, var2078 = protoModule.writeBuffer(var1328, var1329, var1327, buffer.len(var1327))
		buff = var1328
		var1313 = var1329
	end
	local buff_1 = buffer.create(var1313)
	buffer.copy(buff_1, 0, buff, 0, var1313)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1330 = t_43.new()
	local var1331 = 0
	while var1331 < buffer.len(p43) do
		local _ = nil
		local var1332 = nil
		local var1333, var1334, var1335 = protoModule.readTag(p43, var1331)
		local var1336 = var1333
		var1332 = var1334
		var1331 = var1335
		
		if var1332 == protoModule.wireTypes.varint then
			local _ = nil
			local var1337, var1338 = protoModule.readVarInt(p43, var1331)
			local _ = var1337
			var1331 = var1338
			continue
		end
		if var1332 == protoModule.wireTypes.lengthDelimited then
			if var1336 == 1 then
				local _ = nil
				local var1339, var1340 = protoModule.readBuffer(p43, var1331)
				var1331 = var1340
				var1330.universe_id = buffer.tostring(var1339)
			elseif var1336 == 2 then
				local _ = nil
				local var1341, var1342 = protoModule.readBuffer(p43, var1331)
				var1331 = var1342
				var1341 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1341)
				var1330.entry_map[var1341.key or ""] = var1341.value or t.FeedEntry.new()
			elseif var1336 == 3 then
				local _ = nil
				local var1343, var1344 = protoModule.readBuffer(p43, var1331)
				var1331 = var1344
				table.insert(var1330.entry_order, buffer.tostring(var1343))
			elseif var1336 == 4 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p43, var1331)
				var1331 = var1346
				var1330.creator_key = buffer.tostring(var1345)
			elseif var1336 == 5 then
				local _ = nil
				local var1347, var1348 = protoModule.readBuffer(p43, var1331)
				var1331 = var1348
				var1330.pill_tabs = t.PillTabsInputData.decode(var1347)
			else
				local _ = nil
				local var1349, var1350 = protoModule.readVarInt(p43, var1331)
				var1331 = var1350 + var1349
			end
		elseif var1332 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1351, var1352 = protoModule.readFixed32(p43, var1331)
			local _ = var1351
			var1331 = var1352
		elseif var1332 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1353, var1354 = protoModule.readFixed64(p43, var1331)
			local _ = var1353
			var1331 = var1354
		else
			error("Unsupported wire type: " .. var2082)
		end
	end
	return var1330
end

function t_43:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.pill_tabs ~= nil then
		t.pillTabs = self.pill_tabs:jsonEncode()
	end
	return t
end

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var1355 = t_43.new()
	
	if self.universe_id ~= nil then
		var1355.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1355.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1355.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1355.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1355.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1355.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1355.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1355.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1355.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1355.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1355
end

t_43.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_43
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		key = if p44 == nil or p44.key == nil then "" else p44.key,
		value = if p44 == nil or p44.value == nil then nil else p44.value
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1356 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1357, var1358 = protoModule.writeTag(buff, var1356, 1, protoModule.wireTypes.lengthDelimited)
		var1357, var2116 = protoModule.writeString(var1357, var1358, self.key)
		buff = var1357
		var1356 = var1358
	end
	if self.value ~= nil then
		local var1359 = self.value:encode()
		local var1360, var1361 = protoModule.writeTag(buff, var1356, 2, protoModule.wireTypes.lengthDelimited)
		var1360, var2119 = protoModule.writeBuffer(var1360, var1361, var1359, buffer.len(var1359))
		buff = var1360
		var1356 = var1361
	end
	local buff_1 = buffer.create(var1356)
	buffer.copy(buff_1, 0, buff, 0, var1356)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1356 = t_44.new()
	local var1357 = 0
	while var1357 < buffer.len(p44) do
		local _ = nil
		local var1358 = nil
		local var1359, var1360, var1361 = protoModule.readTag(p44, var1357)
		local var1362 = var1359
		var1358 = var1360
		var1357 = var1361
		
		if var1358 == protoModule.wireTypes.varint then
			local _ = nil
			local var1363, var1364 = protoModule.readVarInt(p44, var1357)
			local _ = var1363
			var1357 = var1364
			continue
		end
		if var1358 == protoModule.wireTypes.lengthDelimited then
			if var1362 == 1 then
				local _ = nil
				local var1365, var1366 = protoModule.readBuffer(p44, var1357)
				var1357 = var1366
				var1356.key = buffer.tostring(var1365)
			elseif var1362 == 2 then
				local _ = nil
				local var1367, var1368 = protoModule.readBuffer(p44, var1357)
				var1357 = var1368
				var1356.value = t.FeedEntry.decode(var1367)
			else
				local _ = nil
				local var1369, var1370 = protoModule.readVarInt(p44, var1357)
				var1357 = var1370 + var1369
			end
		elseif var1358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1371, var1372 = protoModule.readFixed32(p44, var1357)
			local _ = var1371
			var1357 = var1372
		elseif var1358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1373, var1374 = protoModule.readFixed64(p44, var1357)
			local _ = var1373
			var1357 = var1374
		else
			error("Unsupported wire type: " .. var2123)
		end
	end
	return var1356
end

function t_44:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_44:jsonDecode()
	-- upvalues: t_44 (ref), t (ref)
	local var1375 = t_44.new()
	
	if self.key ~= nil then
		var1375.key = self.key
	end
	if self.value ~= nil then
		var1375.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1375
end

t_44.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_44
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		options = if p45 == nil or p45.options == nil then {} else p45.options,
		default_option_id = if p45 == nil or p45.default_option_id == nil then "" else p45.default_option_id
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1375 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1376 = v:encode()
			local var1377, var1378 = protoModule.writeTag(buff, var1375, 1, protoModule.wireTypes.lengthDelimited)
			var1377, var2146 = protoModule.writeBuffer(var1377, var1378, var1376, buffer.len(var1376))
			buff = var1377
			var1375 = var1378
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1379, var1380 = protoModule.writeTag(buff, var1375, 2, protoModule.wireTypes.lengthDelimited)
		var1379, var2148 = protoModule.writeString(var1379, var1380, self.default_option_id)
		buff = var1379
		var1375 = var1380
	end
	local buff_1 = buffer.create(var1375)
	buffer.copy(buff_1, 0, buff, 0, var1375)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1381 = t_45.new()
	local var1382 = 0
	while var1382 < buffer.len(p45) do
		local _ = nil
		local var1383 = nil
		local var1384, var1385, var1386 = protoModule.readTag(p45, var1382)
		local var1387 = var1384
		var1383 = var1385
		var1382 = var1386
		
		if var1383 == protoModule.wireTypes.varint then
			local _ = nil
			local var1388, var1389 = protoModule.readVarInt(p45, var1382)
			local _ = var1388
			var1382 = var1389
			continue
		end
		if var1383 == protoModule.wireTypes.lengthDelimited then
			if var1387 == 1 then
				local _ = nil
				local var1390, var1391 = protoModule.readBuffer(p45, var1382)
				var1382 = var1391
				table.insert(var1381.options, t.PillTabsInputData_PillTabOption.decode(var1390))
			elseif var1387 == 2 then
				local _ = nil
				local var1392, var1393 = protoModule.readBuffer(p45, var1382)
				var1382 = var1393
				var1381.default_option_id = buffer.tostring(var1392)
			else
				local _ = nil
				local var1394, var1395 = protoModule.readVarInt(p45, var1382)
				var1382 = var1395 + var1394
			end
		elseif var1383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed32(p45, var1382)
			local _ = var1396
			var1382 = var1397
		elseif var1383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed64(p45, var1382)
			local _ = var1398
			var1382 = var1399
		else
			error("Unsupported wire type: " .. var2152)
		end
	end
	return var1381
end

function t_45:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		t.defaultOptionId = self.default_option_id
	end
	return t
end

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), t (ref)
	local var1400 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1400.options = t_1
	end
	if self.default_option_id ~= nil then
		var1400.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1400.default_option_id = self.defaultOptionId
	end
	return var1400
end

t_45.descriptor = {
	name = "PillTabsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabsInputData"
}
t.PillTabsInputData = t_45
typeRegistryModule.default:register(t.PillTabsInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		option_id = if p46 == nil or p46.option_id == nil then "" else p46.option_id,
		display_name = if p46 == nil or p46.display_name == nil then "" else p46.display_name
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1401 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1402, var1403 = protoModule.writeTag(buff, var1401, 1, protoModule.wireTypes.lengthDelimited)
		var1402, var2176 = protoModule.writeString(var1402, var1403, self.option_id)
		buff = var1402
		var1401 = var1403
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1404, var1405 = protoModule.writeTag(buff, var1401, 2, protoModule.wireTypes.lengthDelimited)
		var1404, var2178 = protoModule.writeString(var1404, var1405, self.display_name)
		buff = var1404
		var1401 = var1405
	end
	local buff_1 = buffer.create(var1401)
	buffer.copy(buff_1, 0, buff, 0, var1401)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1401 = t_46.new()
	local var1402 = 0
	while var1402 < buffer.len(p46) do
		local _ = nil
		local var1403 = nil
		local var1404, var1405, var1406 = protoModule.readTag(p46, var1402)
		local var1407 = var1404
		var1403 = var1405
		var1402 = var1406
		
		if var1403 == protoModule.wireTypes.varint then
			local _ = nil
			local var1408, var1409 = protoModule.readVarInt(p46, var1402)
			local _ = var1408
			var1402 = var1409
			continue
		end
		if var1403 == protoModule.wireTypes.lengthDelimited then
			if var1407 == 1 then
				local _ = nil
				local var1410, var1411 = protoModule.readBuffer(p46, var1402)
				var1402 = var1411
				var1401.option_id = buffer.tostring(var1410)
			elseif var1407 == 2 then
				local _ = nil
				local var1412, var1413 = protoModule.readBuffer(p46, var1402)
				var1402 = var1413
				var1401.display_name = buffer.tostring(var1412)
			else
				local _ = nil
				local var1414, var1415 = protoModule.readVarInt(p46, var1402)
				var1402 = var1415 + var1414
			end
		elseif var1403 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1416, var1417 = protoModule.readFixed32(p46, var1402)
			local _ = var1416
			var1402 = var1417
		elseif var1403 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1418, var1419 = protoModule.readFixed64(p46, var1402)
			local _ = var1418
			var1402 = var1419
		else
			error("Unsupported wire type: " .. var2182)
		end
	end
	return var1401
end

function t_46:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	return t
end

function t_46:jsonDecode()
	-- upvalues: t_46 (ref)
	local var1420 = t_46.new()
	
	if self.option_id ~= nil then
		var1420.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1420.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1420.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1420.display_name = self.displayName
	end
	return var1420
end

t_46.descriptor = {
	name = "PillTabsInputData_PillTabOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabOption"
}
t.PillTabsInputData_PillTabOption = t_46
typeRegistryModule.default:register(t.PillTabsInputData_PillTabOption)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		game_passes = if p47 == nil or p47.game_passes == nil then {} else p47.game_passes
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1420 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1421 = v:encode()
			local var1422, var1423 = protoModule.writeTag(buff, var1420, 1, protoModule.wireTypes.lengthDelimited)
			var1422, var2205 = protoModule.writeBuffer(var1422, var1423, var1421, buffer.len(var1421))
			buff = var1422
			var1420 = var1423
		end
	end
	local buff_1 = buffer.create(var1420)
	buffer.copy(buff_1, 0, buff, 0, var1420)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1424 = t_47.new()
	local var1425 = 0
	while var1425 < buffer.len(p47) do
		local _ = nil
		local var1426 = nil
		local var1427, var1428, var1429 = protoModule.readTag(p47, var1425)
		local var1430 = var1427
		var1426 = var1428
		var1425 = var1429
		
		if var1426 == protoModule.wireTypes.varint then
			local _ = nil
			local var1431, var1432 = protoModule.readVarInt(p47, var1425)
			local _ = var1431
			var1425 = var1432
			continue
		end
		if var1426 == protoModule.wireTypes.lengthDelimited then
			if var1430 == 1 then
				local _ = nil
				local var1433, var1434 = protoModule.readBuffer(p47, var1425)
				var1425 = var1434
				table.insert(var1424.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1433))
			else
				local _ = nil
				local var1435, var1436 = protoModule.readVarInt(p47, var1425)
				var1425 = var1436 + var1435
			end
		elseif var1426 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed32(p47, var1425)
			local _ = var1437
			var1425 = var1438
		elseif var1426 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1439, var1440 = protoModule.readFixed64(p47, var1425)
			local _ = var1439
			var1425 = var1440
		else
			error("Unsupported wire type: " .. var2209)
		end
	end
	return var1424
end

function t_47:jsonEncode()
	local t = {}
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, v:jsonEncode())
		end
		t.gamePasses = t_1
	end
	return t
end

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), t (ref)
	local var1441 = t_47.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1441.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1441.game_passes = t_1
	end
	return var1441
end

t_47.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_47
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		game_pass_id = if p48 == nil or p48.game_pass_id == nil then "" else p48.game_pass_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1442 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1443, var1444 = protoModule.writeTag(buff, var1442, 1, protoModule.wireTypes.lengthDelimited)
		var1443, var2232 = protoModule.writeString(var1443, var1444, self.game_pass_id)
		buff = var1443
		var1442 = var1444
	end
	local buff_1 = buffer.create(var1442)
	buffer.copy(buff_1, 0, buff, 0, var1442)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1442 = t_48.new()
	local var1443 = 0
	while var1443 < buffer.len(p48) do
		local _ = nil
		local var1444 = nil
		local var1445, var1446, var1447 = protoModule.readTag(p48, var1443)
		local var1448 = var1445
		var1444 = var1446
		var1443 = var1447
		
		if var1444 == protoModule.wireTypes.varint then
			local _ = nil
			local var1449, var1450 = protoModule.readVarInt(p48, var1443)
			local _ = var1449
			var1443 = var1450
			continue
		end
		if var1444 == protoModule.wireTypes.lengthDelimited then
			if var1448 == 1 then
				local _ = nil
				local var1451, var1452 = protoModule.readBuffer(p48, var1443)
				var1443 = var1452
				var1442.game_pass_id = buffer.tostring(var1451)
			else
				local _ = nil
				local var1453, var1454 = protoModule.readVarInt(p48, var1443)
				var1443 = var1454 + var1453
			end
		elseif var1444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed32(p48, var1443)
			local _ = var1455
			var1443 = var1456
		elseif var1444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1457, var1458 = protoModule.readFixed64(p48, var1443)
			local _ = var1457
			var1443 = var1458
		else
			error("Unsupported wire type: " .. var2236)
		end
	end
	return var1442
end

function t_48:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_48:jsonDecode()
	-- upvalues: t_48 (ref)
	local var1459 = t_48.new()
	
	if self.game_pass_id ~= nil then
		var1459.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1459.game_pass_id = self.gamePassId
	end
	return var1459
end

t_48.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_48
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		developer_products = if p49 == nil or p49.developer_products == nil then {} else p49.developer_products
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1459 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1460 = v:encode()
			local var1461, var1462 = protoModule.writeTag(buff, var1459, 1, protoModule.wireTypes.lengthDelimited)
			var1461, var2257 = protoModule.writeBuffer(var1461, var1462, var1460, buffer.len(var1460))
			buff = var1461
			var1459 = var1462
		end
	end
	local buff_1 = buffer.create(var1459)
	buffer.copy(buff_1, 0, buff, 0, var1459)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1463 = t_49.new()
	local var1464 = 0
	while var1464 < buffer.len(p49) do
		local _ = nil
		local var1465 = nil
		local var1466, var1467, var1468 = protoModule.readTag(p49, var1464)
		local var1469 = var1466
		var1465 = var1467
		var1464 = var1468
		
		if var1465 == protoModule.wireTypes.varint then
			local _ = nil
			local var1470, var1471 = protoModule.readVarInt(p49, var1464)
			local _ = var1470
			var1464 = var1471
			continue
		end
		if var1465 == protoModule.wireTypes.lengthDelimited then
			if var1469 == 1 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p49, var1464)
				var1464 = var1473
				table.insert(var1463.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1472))
			else
				local _ = nil
				local var1474, var1475 = protoModule.readVarInt(p49, var1464)
				var1464 = var1475 + var1474
			end
		elseif var1465 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1476, var1477 = protoModule.readFixed32(p49, var1464)
			local _ = var1476
			var1464 = var1477
		elseif var1465 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1478, var1479 = protoModule.readFixed64(p49, var1464)
			local _ = var1478
			var1464 = var1479
		else
			error("Unsupported wire type: " .. var2261)
		end
	end
	return var1463
end

function t_49:jsonEncode()
	local t = {}
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, v:jsonEncode())
		end
		t.developerProducts = t_1
	end
	return t
end

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), t (ref)
	local var1480 = t_49.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1480.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1480.developer_products = t_1
	end
	return var1480
end

t_49.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_49
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t_50 (ref)
	return setmetatable({
		developer_product_id = if p50 == nil or p50.developer_product_id == nil then "" else p50.developer_product_id
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1481 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1482, var1483 = protoModule.writeTag(buff, var1481, 1, protoModule.wireTypes.lengthDelimited)
		var1482, var2284 = protoModule.writeString(var1482, var1483, self.developer_product_id)
		buff = var1482
		var1481 = var1483
	end
	local buff_1 = buffer.create(var1481)
	buffer.copy(buff_1, 0, buff, 0, var1481)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1481 = t_50.new()
	local var1482 = 0
	while var1482 < buffer.len(p50) do
		local _ = nil
		local var1483 = nil
		local var1484, var1485, var1486 = protoModule.readTag(p50, var1482)
		local var1487 = var1484
		var1483 = var1485
		var1482 = var1486
		
		if var1483 == protoModule.wireTypes.varint then
			local _ = nil
			local var1488, var1489 = protoModule.readVarInt(p50, var1482)
			local _ = var1488
			var1482 = var1489
			continue
		end
		if var1483 == protoModule.wireTypes.lengthDelimited then
			if var1487 == 1 then
				local _ = nil
				local var1490, var1491 = protoModule.readBuffer(p50, var1482)
				var1482 = var1491
				var1481.developer_product_id = buffer.tostring(var1490)
			else
				local _ = nil
				local var1492, var1493 = protoModule.readVarInt(p50, var1482)
				var1482 = var1493 + var1492
			end
		elseif var1483 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed32(p50, var1482)
			local _ = var1494
			var1482 = var1495
		elseif var1483 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed64(p50, var1482)
			local _ = var1496
			var1482 = var1497
		else
			error("Unsupported wire type: " .. var2288)
		end
	end
	return var1481
end

function t_50:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_50:jsonDecode()
	-- upvalues: t_50 (ref)
	local var1498 = t_50.new()
	
	if self.developer_product_id ~= nil then
		var1498.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1498.developer_product_id = self.developerProductId
	end
	return var1498
end

t_50.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_50
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		subscriptions = if p51 == nil or p51.subscriptions == nil then {} else p51.subscriptions
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1498 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1499 = v:encode()
			local var1500, var1501 = protoModule.writeTag(buff, var1498, 1, protoModule.wireTypes.lengthDelimited)
			var1500, var2309 = protoModule.writeBuffer(var1500, var1501, var1499, buffer.len(var1499))
			buff = var1500
			var1498 = var1501
		end
	end
	local buff_1 = buffer.create(var1498)
	buffer.copy(buff_1, 0, buff, 0, var1498)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1502 = t_51.new()
	local var1503 = 0
	while var1503 < buffer.len(p51) do
		local _ = nil
		local var1504 = nil
		local var1505, var1506, var1507 = protoModule.readTag(p51, var1503)
		local var1508 = var1505
		var1504 = var1506
		var1503 = var1507
		
		if var1504 == protoModule.wireTypes.varint then
			local _ = nil
			local var1509, var1510 = protoModule.readVarInt(p51, var1503)
			local _ = var1509
			var1503 = var1510
			continue
		end
		if var1504 == protoModule.wireTypes.lengthDelimited then
			if var1508 == 1 then
				local _ = nil
				local var1511, var1512 = protoModule.readBuffer(p51, var1503)
				var1503 = var1512
				table.insert(var1502.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1511))
			else
				local _ = nil
				local var1513, var1514 = protoModule.readVarInt(p51, var1503)
				var1503 = var1514 + var1513
			end
		elseif var1504 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1515, var1516 = protoModule.readFixed32(p51, var1503)
			local _ = var1515
			var1503 = var1516
		elseif var1504 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1517, var1518 = protoModule.readFixed64(p51, var1503)
			local _ = var1517
			var1503 = var1518
		else
			error("Unsupported wire type: " .. var2313)
		end
	end
	return var1502
end

function t_51:jsonEncode()
	local t = {}
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, v:jsonEncode())
		end
		t.subscriptions = t_1
	end
	return t
end

function t_51:jsonDecode()
	-- upvalues: t_51 (ref), t (ref)
	local var1519 = t_51.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1519.subscriptions = t_1
	end
	return var1519
end

t_51.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_51
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t_52 (ref)
	return setmetatable({
		subscription_id = if p52 == nil or p52.subscription_id == nil then "" else p52.subscription_id
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1520 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1521, var1522 = protoModule.writeTag(buff, var1520, 1, protoModule.wireTypes.lengthDelimited)
		var1521, var2335 = protoModule.writeString(var1521, var1522, self.subscription_id)
		buff = var1521
		var1520 = var1522
	end
	local buff_1 = buffer.create(var1520)
	buffer.copy(buff_1, 0, buff, 0, var1520)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1520 = t_52.new()
	local var1521 = 0
	while var1521 < buffer.len(p52) do
		local _ = nil
		local var1522 = nil
		local var1523, var1524, var1525 = protoModule.readTag(p52, var1521)
		local var1526 = var1523
		var1522 = var1524
		var1521 = var1525
		
		if var1522 == protoModule.wireTypes.varint then
			local _ = nil
			local var1527, var1528 = protoModule.readVarInt(p52, var1521)
			local _ = var1527
			var1521 = var1528
			continue
		end
		if var1522 == protoModule.wireTypes.lengthDelimited then
			if var1526 == 1 then
				local _ = nil
				local var1529, var1530 = protoModule.readBuffer(p52, var1521)
				var1521 = var1530
				var1520.subscription_id = buffer.tostring(var1529)
			else
				local _ = nil
				local var1531, var1532 = protoModule.readVarInt(p52, var1521)
				var1521 = var1532 + var1531
			end
		elseif var1522 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1533, var1534 = protoModule.readFixed32(p52, var1521)
			local _ = var1533
			var1521 = var1534
		elseif var1522 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1535, var1536 = protoModule.readFixed64(p52, var1521)
			local _ = var1535
			var1521 = var1536
		else
			error("Unsupported wire type: " .. var2339)
		end
	end
	return var1520
end

function t_52:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_52:jsonDecode()
	-- upvalues: t_52 (ref)
	local var1537 = t_52.new()
	
	if self.subscription_id ~= nil then
		var1537.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1537.subscription_id = self.subscriptionId
	end
	return var1537
end

t_52.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_52
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		items = if p53 == nil or p53.items == nil then {} else p53.items,
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		section_title = if p53 == nil or p53.section_title == nil then "" else p53.section_title,
		creator_key = if p53 == nil or p53.creator_key == nil then "" else p53.creator_key,
		collection_item_size = if p53 == nil or p53.collection_item_size == nil then "" else p53.collection_item_size,
		item_height_mode = if p53 == nil or p53.item_height_mode == nil then "" else p53.item_height_mode,
		experience_store_product_type = if p53 == nil or p53.experience_store_product_type == nil then "" else p53.experience_store_product_type,
		content_type = if p53 == nil or p53.content_type == nil then "" else p53.content_type,
		item_type = if p53 == nil or p53.item_type == nil then "" else p53.item_type,
		filter_category_id = if p53 == nil or p53.filter_category_id == nil then "" else p53.filter_category_id
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1537 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1538 = v:encode()
			local var1539, var1540 = protoModule.writeTag(buff, var1537, 1, protoModule.wireTypes.lengthDelimited)
			var1539, var2360 = protoModule.writeBuffer(var1539, var1540, var1538, buffer.len(var1538))
			buff = var1539
			var1537 = var1540
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1541, var1542 = protoModule.writeTag(buff, var1537, 2, protoModule.wireTypes.lengthDelimited)
		var1541, var2362 = protoModule.writeString(var1541, var1542, self.universe_id)
		buff = var1541
		var1537 = var1542
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1543, var1544 = protoModule.writeTag(buff, var1537, 3, protoModule.wireTypes.lengthDelimited)
		var1543, var2364 = protoModule.writeString(var1543, var1544, self.section_title)
		buff = var1543
		var1537 = var1544
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1545, var1546 = protoModule.writeTag(buff, var1537, 4, protoModule.wireTypes.lengthDelimited)
		var1545, var2366 = protoModule.writeString(var1545, var1546, self.creator_key)
		buff = var1545
		var1537 = var1546
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1547, var1548 = protoModule.writeTag(buff, var1537, 5, protoModule.wireTypes.lengthDelimited)
		var1547, var2368 = protoModule.writeString(var1547, var1548, self.collection_item_size)
		buff = var1547
		var1537 = var1548
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1549, var1550 = protoModule.writeTag(buff, var1537, 6, protoModule.wireTypes.lengthDelimited)
		var1549, var2370 = protoModule.writeString(var1549, var1550, self.item_height_mode)
		buff = var1549
		var1537 = var1550
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1551, var1552 = protoModule.writeTag(buff, var1537, 7, protoModule.wireTypes.lengthDelimited)
		var1551, var2372 = protoModule.writeString(var1551, var1552, self.experience_store_product_type)
		buff = var1551
		var1537 = var1552
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1553, var1554 = protoModule.writeTag(buff, var1537, 8, protoModule.wireTypes.lengthDelimited)
		var1553, var2374 = protoModule.writeString(var1553, var1554, self.content_type)
		buff = var1553
		var1537 = var1554
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1555, var1556 = protoModule.writeTag(buff, var1537, 9, protoModule.wireTypes.lengthDelimited)
		var1555, var2376 = protoModule.writeString(var1555, var1556, self.item_type)
		buff = var1555
		var1537 = var1556
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1557, var1558 = protoModule.writeTag(buff, var1537, 10, protoModule.wireTypes.lengthDelimited)
		var1557, var2378 = protoModule.writeString(var1557, var1558, self.filter_category_id)
		buff = var1557
		var1537 = var1558
	end
	local buff_1 = buffer.create(var1537)
	buffer.copy(buff_1, 0, buff, 0, var1537)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1559 = t_53.new()
	local var1560 = 0
	while var1560 < buffer.len(p53) do
		local _ = nil
		local var1561 = nil
		local var1562, var1563, var1564 = protoModule.readTag(p53, var1560)
		local var1565 = var1562
		var1561 = var1563
		var1560 = var1564
		
		if var1561 == protoModule.wireTypes.varint then
			local _ = nil
			local var1566, var1567 = protoModule.readVarInt(p53, var1560)
			local _ = var1566
			var1560 = var1567
			continue
		end
		if var1561 == protoModule.wireTypes.lengthDelimited then
			if var1565 == 1 then
				local _ = nil
				local var1568, var1569 = protoModule.readBuffer(p53, var1560)
				var1560 = var1569
				table.insert(var1559.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1568))
			elseif var1565 == 2 then
				local _ = nil
				local var1570, var1571 = protoModule.readBuffer(p53, var1560)
				var1560 = var1571
				var1559.universe_id = buffer.tostring(var1570)
			elseif var1565 == 3 then
				local _ = nil
				local var1572, var1573 = protoModule.readBuffer(p53, var1560)
				var1560 = var1573
				var1559.section_title = buffer.tostring(var1572)
			elseif var1565 == 4 then
				local _ = nil
				local var1574, var1575 = protoModule.readBuffer(p53, var1560)
				var1560 = var1575
				var1559.creator_key = buffer.tostring(var1574)
			elseif var1565 == 5 then
				local _ = nil
				local var1576, var1577 = protoModule.readBuffer(p53, var1560)
				var1560 = var1577
				var1559.collection_item_size = buffer.tostring(var1576)
			elseif var1565 == 6 then
				local _ = nil
				local var1578, var1579 = protoModule.readBuffer(p53, var1560)
				var1560 = var1579
				var1559.item_height_mode = buffer.tostring(var1578)
			elseif var1565 == 7 then
				local _ = nil
				local var1580, var1581 = protoModule.readBuffer(p53, var1560)
				var1560 = var1581
				var1559.experience_store_product_type = buffer.tostring(var1580)
			elseif var1565 == 8 then
				local _ = nil
				local var1582, var1583 = protoModule.readBuffer(p53, var1560)
				var1560 = var1583
				var1559.content_type = buffer.tostring(var1582)
			elseif var1565 == 9 then
				local _ = nil
				local var1584, var1585 = protoModule.readBuffer(p53, var1560)
				var1560 = var1585
				var1559.item_type = buffer.tostring(var1584)
			elseif var1565 == 10 then
				local _ = nil
				local var1586, var1587 = protoModule.readBuffer(p53, var1560)
				var1560 = var1587
				var1559.filter_category_id = buffer.tostring(var1586)
			else
				local _ = nil
				local var1588, var1589 = protoModule.readVarInt(p53, var1560)
				var1560 = var1589 + var1588
			end
		elseif var1561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1590, var1591 = protoModule.readFixed32(p53, var1560)
			local _ = var1590
			var1560 = var1591
		elseif var1561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1592, var1593 = protoModule.readFixed64(p53, var1560)
			local _ = var1592
			var1560 = var1593
		else
			error("Unsupported wire type: " .. var2382)
		end
	end
	return var1559
end

function t_53:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		t.collectionItemSize = self.collection_item_size
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		t.itemHeightMode = self.item_height_mode
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		t.experienceStoreProductType = self.experience_store_product_type
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		t.filterCategoryId = self.filter_category_id
	end
	return t
end

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), t (ref)
	local var1594 = t_53.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1594.items = t_1
	end
	if self.universe_id ~= nil then
		var1594.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1594.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1594.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1594.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1594.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1594.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1594.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1594.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1594.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1594.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1594.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1594.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1594.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1594.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1594.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1594.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1594.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1594.filter_category_id = self.filterCategoryId
	end
	return var1594
end

t_53.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_53
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t (ref), t_54 (ref)
	return setmetatable({
		item_id = if p54 == nil or p54.item_id == nil then "" else p54.item_id,
		identifier = if p54 == nil or p54.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p54.identifier
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1595 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1596, var1597 = protoModule.writeTag(buff, var1595, 1, protoModule.wireTypes.lengthDelimited)
		var1596, var2422 = protoModule.writeString(var1596, var1597, self.item_id)
		buff = var1596
		var1595 = var1597
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1598, var1599 = protoModule.writeTag(buff, var1595, 2, protoModule.wireTypes.varint)
		var1598, var2424 = protoModule.writeVarInt(var1598, var1599, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1598
		var1595 = var1599
	end
	local buff_1 = buffer.create(var1595)
	buffer.copy(buff_1, 0, buff, 0, var1595)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1595 = t_54.new()
	local var1596 = 0
	while var1596 < buffer.len(p54) do
		local _ = nil
		local var1597 = nil
		local var1598, var1599, var1600 = protoModule.readTag(p54, var1596)
		local var1601 = var1598
		var1597 = var1599
		var1596 = var1600
		
		if var1597 == protoModule.wireTypes.varint then
			if var1601 == 2 then
				local _ = nil
				local var1602, var1603 = protoModule.readVarIntI32(p54, var1596)
				local var1604 = var1602
				var1596 = var1603
				var1595.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1604) or var1604
			else
				local _ = nil
				local var1605, var1606 = protoModule.readVarInt(p54, var1596)
				local _ = var1605
				var1596 = var1606
			end
		end
		if var1597 == protoModule.wireTypes.lengthDelimited then
			if var1601 == 1 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p54, var1596)
				var1596 = var1608
				var1595.item_id = buffer.tostring(var1607)
			else
				local _ = nil
				local var1609, var1610 = protoModule.readVarInt(p54, var1596)
				var1596 = var1610 + var1609
			end
		elseif var1597 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1611, var1612 = protoModule.readFixed32(p54, var1596)
			local _ = var1611
			var1596 = var1612
		elseif var1597 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1613, var1614 = protoModule.readFixed64(p54, var1596)
			local _ = var1613
			var1596 = var1614
		else
			error("Unsupported wire type: " .. var2428)
		end
	end
	return var1595
end

function t_54:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t_1.itemId = self.item_id
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		t_1.identifier = if typeof(self.identifier) == "number" then self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier)
	end
	return t_1
end

function t_54:jsonDecode()
	-- upvalues: t_54 (ref), t (ref)
	local var1615 = t_54.new()
	
	if self.item_id ~= nil then
		var1615.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1615.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1615.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1615
end

t_54.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_54
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p55)
		return if p55 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p55 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p55 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p55 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p55)
		return if p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p55
	end,
	fromName = function(p55)
		return if p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p55 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		roblox_component = if p55 == nil or p55.roblox_component == nil then "" else p55.roblox_component,
		identifier = if p55 == nil or p55.identifier == nil then "" else p55.identifier,
		title = if p55 == nil or p55.title == nil then "" else p55.title,
		user_id = if p55 == nil or p55.user_id == nil then "" else p55.user_id,
		description = if p55 == nil or p55.description == nil then "" else p55.description,
		cta_text = if p55 == nil or p55.cta_text == nil then "" else p55.cta_text,
		prompt_id = if p55 == nil or p55.prompt_id == nil then "" else p55.prompt_id,
		prompt_type = if p55 == nil or p55.prompt_type == nil then "" else p55.prompt_type,
		entity_id = if p55 == nil or p55.entity_id == nil then "" else p55.entity_id
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1615 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1616, var1617 = protoModule.writeTag(buff, var1615, 1, protoModule.wireTypes.lengthDelimited)
		var1616, var2451 = protoModule.writeString(var1616, var1617, self.roblox_component)
		buff = var1616
		var1615 = var1617
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1618, var1619 = protoModule.writeTag(buff, var1615, 2, protoModule.wireTypes.lengthDelimited)
		var1618, var2453 = protoModule.writeString(var1618, var1619, self.identifier)
		buff = var1618
		var1615 = var1619
	end
	if self.title ~= nil and self.title ~= "" then
		local var1620, var1621 = protoModule.writeTag(buff, var1615, 3, protoModule.wireTypes.lengthDelimited)
		var1620, var2455 = protoModule.writeString(var1620, var1621, self.title)
		buff = var1620
		var1615 = var1621
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1622, var1623 = protoModule.writeTag(buff, var1615, 4, protoModule.wireTypes.lengthDelimited)
		var1622, var2457 = protoModule.writeString(var1622, var1623, self.user_id)
		buff = var1622
		var1615 = var1623
	end
	if self.description ~= nil and self.description ~= "" then
		local var1624, var1625 = protoModule.writeTag(buff, var1615, 5, protoModule.wireTypes.lengthDelimited)
		var1624, var2459 = protoModule.writeString(var1624, var1625, self.description)
		buff = var1624
		var1615 = var1625
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1626, var1627 = protoModule.writeTag(buff, var1615, 6, protoModule.wireTypes.lengthDelimited)
		var1626, var2461 = protoModule.writeString(var1626, var1627, self.cta_text)
		buff = var1626
		var1615 = var1627
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1628, var1629 = protoModule.writeTag(buff, var1615, 7, protoModule.wireTypes.lengthDelimited)
		var1628, var2463 = protoModule.writeString(var1628, var1629, self.prompt_id)
		buff = var1628
		var1615 = var1629
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1630, var1631 = protoModule.writeTag(buff, var1615, 8, protoModule.wireTypes.lengthDelimited)
		var1630, var2465 = protoModule.writeString(var1630, var1631, self.prompt_type)
		buff = var1630
		var1615 = var1631
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1632, var1633 = protoModule.writeTag(buff, var1615, 9, protoModule.wireTypes.lengthDelimited)
		var1632, var2467 = protoModule.writeString(var1632, var1633, self.entity_id)
		buff = var1632
		var1615 = var1633
	end
	local buff_1 = buffer.create(var1615)
	buffer.copy(buff_1, 0, buff, 0, var1615)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1615 = t_55.new()
	local var1616 = 0
	while var1616 < buffer.len(p55) do
		local _ = nil
		local var1617 = nil
		local var1618, var1619, var1620 = protoModule.readTag(p55, var1616)
		local var1621 = var1618
		var1617 = var1619
		var1616 = var1620
		
		if var1617 == protoModule.wireTypes.varint then
			local _ = nil
			local var1622, var1623 = protoModule.readVarInt(p55, var1616)
			local _ = var1622
			var1616 = var1623
			continue
		end
		if var1617 == protoModule.wireTypes.lengthDelimited then
			if var1621 == 1 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p55, var1616)
				var1616 = var1625
				var1615.roblox_component = buffer.tostring(var1624)
			elseif var1621 == 2 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p55, var1616)
				var1616 = var1627
				var1615.identifier = buffer.tostring(var1626)
			elseif var1621 == 3 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p55, var1616)
				var1616 = var1629
				var1615.title = buffer.tostring(var1628)
			elseif var1621 == 4 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p55, var1616)
				var1616 = var1631
				var1615.user_id = buffer.tostring(var1630)
			elseif var1621 == 5 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p55, var1616)
				var1616 = var1633
				var1615.description = buffer.tostring(var1632)
			elseif var1621 == 6 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p55, var1616)
				var1616 = var1635
				var1615.cta_text = buffer.tostring(var1634)
			elseif var1621 == 7 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p55, var1616)
				var1616 = var1637
				var1615.prompt_id = buffer.tostring(var1636)
			elseif var1621 == 8 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p55, var1616)
				var1616 = var1639
				var1615.prompt_type = buffer.tostring(var1638)
			elseif var1621 == 9 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p55, var1616)
				var1616 = var1641
				var1615.entity_id = buffer.tostring(var1640)
			else
				local _ = nil
				local var1642, var1643 = protoModule.readVarInt(p55, var1616)
				var1616 = var1643 + var1642
			end
		elseif var1617 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1644, var1645 = protoModule.readFixed32(p55, var1616)
			local _ = var1644
			var1616 = var1645
		elseif var1617 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1646, var1647 = protoModule.readFixed64(p55, var1616)
			local _ = var1646
			var1616 = var1647
		else
			error("Unsupported wire type: " .. var2471)
		end
	end
	return var1615
end

function t_55:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function t_55:jsonDecode()
	-- upvalues: t_55 (ref)
	local var1648 = t_55.new()
	
	if self.roblox_component ~= nil then
		var1648.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1648.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1648.identifier = self.identifier
	end
	if self.title ~= nil then
		var1648.title = self.title
	end
	if self.user_id ~= nil then
		var1648.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1648.user_id = self.userId
	end
	if self.description ~= nil then
		var1648.description = self.description
	end
	if self.cta_text ~= nil then
		var1648.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1648.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1648.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1648.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1648.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1648.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1648.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1648.entity_id = self.entityId
	end
	return var1648
end

t_55.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_55
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		group_id = if p56 == nil or p56.group_id == nil then "" else p56.group_id,
		experience_id = if p56 == nil or p56.experience_id == nil then "" else p56.experience_id
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1648 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1649, var1650 = protoModule.writeTag(buff, var1648, 1, protoModule.wireTypes.lengthDelimited)
		var1649, var2507 = protoModule.writeString(var1649, var1650, self.group_id)
		buff = var1649
		var1648 = var1650
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1651, var1652 = protoModule.writeTag(buff, var1648, 2, protoModule.wireTypes.lengthDelimited)
		var1651, var2509 = protoModule.writeString(var1651, var1652, self.experience_id)
		buff = var1651
		var1648 = var1652
	end
	local buff_1 = buffer.create(var1648)
	buffer.copy(buff_1, 0, buff, 0, var1648)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1648 = t_56.new()
	local var1649 = 0
	while var1649 < buffer.len(p56) do
		local _ = nil
		local var1650 = nil
		local var1651, var1652, var1653 = protoModule.readTag(p56, var1649)
		local var1654 = var1651
		var1650 = var1652
		var1649 = var1653
		
		if var1650 == protoModule.wireTypes.varint then
			local _ = nil
			local var1655, var1656 = protoModule.readVarInt(p56, var1649)
			local _ = var1655
			var1649 = var1656
			continue
		end
		if var1650 == protoModule.wireTypes.lengthDelimited then
			if var1654 == 1 then
				local _ = nil
				local var1657, var1658 = protoModule.readBuffer(p56, var1649)
				var1649 = var1658
				var1648.group_id = buffer.tostring(var1657)
			elseif var1654 == 2 then
				local _ = nil
				local var1659, var1660 = protoModule.readBuffer(p56, var1649)
				var1649 = var1660
				var1648.experience_id = buffer.tostring(var1659)
			else
				local _ = nil
				local var1661, var1662 = protoModule.readVarInt(p56, var1649)
				var1649 = var1662 + var1661
			end
		elseif var1650 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1663, var1664 = protoModule.readFixed32(p56, var1649)
			local _ = var1663
			var1649 = var1664
		elseif var1650 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1665, var1666 = protoModule.readFixed64(p56, var1649)
			local _ = var1665
			var1649 = var1666
		else
			error("Unsupported wire type: " .. var2513)
		end
	end
	return var1648
end

function t_56:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_56:jsonDecode()
	-- upvalues: t_56 (ref)
	local var1667 = t_56.new()
	
	if self.group_id ~= nil then
		var1667.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1667.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1667.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1667.experience_id = self.experienceId
	end
	return var1667
end

t_56.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_56
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		title = if p57 == nil or p57.title == nil then "" else p57.title,
		dismiss_text = if p57 == nil or p57.dismiss_text == nil then "" else p57.dismiss_text,
		user_id = if p57 == nil or p57.user_id == nil then "" else p57.user_id,
		cards = if p57 == nil or p57.cards == nil then {} else p57.cards,
		prompt_id = if p57 == nil or p57.prompt_id == nil then "" else p57.prompt_id,
		prompt_type = if p57 == nil or p57.prompt_type == nil then "" else p57.prompt_type,
		sort_id = if p57 == nil or p57.sort_id == nil then "" else p57.sort_id,
		feed_item_key = if p57 == nil or p57.feed_item_key == nil then "" else p57.feed_item_key,
		client_attributes = if p57 == nil or p57.client_attributes == nil then nil else p57.client_attributes
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1667 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1668, var1669 = protoModule.writeTag(buff, var1667, 1, protoModule.wireTypes.lengthDelimited)
		var1668, var2535 = protoModule.writeString(var1668, var1669, self.title)
		buff = var1668
		var1667 = var1669
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1670, var1671 = protoModule.writeTag(buff, var1667, 2, protoModule.wireTypes.lengthDelimited)
		var1670, var2537 = protoModule.writeString(var1670, var1671, self.dismiss_text)
		buff = var1670
		var1667 = var1671
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1672, var1673 = protoModule.writeTag(buff, var1667, 3, protoModule.wireTypes.lengthDelimited)
		var1672, var2539 = protoModule.writeString(var1672, var1673, self.user_id)
		buff = var1672
		var1667 = var1673
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1674 = v:encode()
			local var1675, var1676 = protoModule.writeTag(buff, var1667, 4, protoModule.wireTypes.lengthDelimited)
			var1675, var2542 = protoModule.writeBuffer(var1675, var1676, var1674, buffer.len(var1674))
			buff = var1675
			var1667 = var1676
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1677, var1678 = protoModule.writeTag(buff, var1667, 5, protoModule.wireTypes.lengthDelimited)
		var1677, var2544 = protoModule.writeString(var1677, var1678, self.prompt_id)
		buff = var1677
		var1667 = var1678
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1679, var1680 = protoModule.writeTag(buff, var1667, 6, protoModule.wireTypes.lengthDelimited)
		var1679, var2546 = protoModule.writeString(var1679, var1680, self.prompt_type)
		buff = var1679
		var1667 = var1680
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1681, var1682 = protoModule.writeTag(buff, var1667, 7, protoModule.wireTypes.lengthDelimited)
		var1681, var2548 = protoModule.writeString(var1681, var1682, self.sort_id)
		buff = var1681
		var1667 = var1682
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1683, var1684 = protoModule.writeTag(buff, var1667, 8, protoModule.wireTypes.lengthDelimited)
		var1683, var2550 = protoModule.writeString(var1683, var1684, self.feed_item_key)
		buff = var1683
		var1667 = var1684
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1685 = self.client_attributes.value:encode()
		local var1686, var1687 = protoModule.writeTag(buff, var1667, 9, protoModule.wireTypes.lengthDelimited)
		var1686, var2553 = protoModule.writeBuffer(var1686, var1687, var1685, buffer.len(var1685))
		buff = var1686
		var1667 = var1687
	end
	local buff_1 = buffer.create(var1667)
	buffer.copy(buff_1, 0, buff, 0, var1667)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1688 = t_57.new()
	local var1689 = 0
	while var1689 < buffer.len(p57) do
		local _ = nil
		local var1690 = nil
		local var1691, var1692, var1693 = protoModule.readTag(p57, var1689)
		local var1694 = var1691
		var1690 = var1692
		var1689 = var1693
		
		if var1690 == protoModule.wireTypes.varint then
			local _ = nil
			local var1695, var1696 = protoModule.readVarInt(p57, var1689)
			local _ = var1695
			var1689 = var1696
			continue
		end
		if var1690 == protoModule.wireTypes.lengthDelimited then
			if var1694 == 1 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p57, var1689)
				var1689 = var1698
				var1688.title = buffer.tostring(var1697)
			elseif var1694 == 2 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p57, var1689)
				var1689 = var1700
				var1688.dismiss_text = buffer.tostring(var1699)
			elseif var1694 == 3 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p57, var1689)
				var1689 = var1702
				var1688.user_id = buffer.tostring(var1701)
			elseif var1694 == 4 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p57, var1689)
				var1689 = var1704
				table.insert(var1688.cards, t.CardContainerCardInputData.decode(var1703))
			elseif var1694 == 5 then
				local _ = nil
				local var1705, var1706 = protoModule.readBuffer(p57, var1689)
				var1689 = var1706
				var1688.prompt_id = buffer.tostring(var1705)
			elseif var1694 == 6 then
				local _ = nil
				local var1707, var1708 = protoModule.readBuffer(p57, var1689)
				var1689 = var1708
				var1688.prompt_type = buffer.tostring(var1707)
			elseif var1694 == 7 then
				local _ = nil
				local var1709, var1710 = protoModule.readBuffer(p57, var1689)
				var1689 = var1710
				var1688.sort_id = buffer.tostring(var1709)
			elseif var1694 == 8 then
				local _ = nil
				local var1711, var1712 = protoModule.readBuffer(p57, var1689)
				var1689 = var1712
				var1688.feed_item_key = buffer.tostring(var1711)
			elseif var1694 == 9 then
				local _ = nil
				local var1713, var1714 = protoModule.readBuffer(p57, var1689)
				var1689 = var1714
				var1688.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1713)
				}
			else
				local _ = nil
				local var1715, var1716 = protoModule.readVarInt(p57, var1689)
				var1689 = var1716 + var1715
			end
		elseif var1690 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1717, var1718 = protoModule.readFixed32(p57, var1689)
			local _ = var1717
			var1689 = var1718
		elseif var1690 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1719, var1720 = protoModule.readFixed64(p57, var1689)
			local _ = var1719
			var1689 = var1720
		else
			error("Unsupported wire type: " .. var2557)
		end
	end
	return var1688
end

function t_57:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		t.dismissText = self.dismiss_text
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.cards ~= nil and #self.cards > 0 then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, v:jsonEncode())
		end
		t.cards = t_1
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		t.communitiesClientAttributes = self.client_attributes.value:jsonEncode()
	end
	return t
end

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), t (ref)
	local var1721 = t_57.new()
	
	if self.title ~= nil then
		var1721.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1721.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1721.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1721.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1721.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1721.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1721.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1721.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1721.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1721.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1721.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1721.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1721.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1721.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1721.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1721.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1721
end

t_57.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_57
typeRegistryModule.default:register(t.CardContainerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		title = if p58 == nil or p58.title == nil then "" else p58.title,
		user_id = if p58 == nil or p58.user_id == nil then "" else p58.user_id,
		description = if p58 == nil or p58.description == nil then "" else p58.description,
		cta_text = if p58 == nil or p58.cta_text == nil then "" else p58.cta_text,
		prompt_id = if p58 == nil or p58.prompt_id == nil then "" else p58.prompt_id,
		prompt_type = if p58 == nil or p58.prompt_type == nil then "" else p58.prompt_type,
		entity_id = if p58 == nil or p58.entity_id == nil then "" else p58.entity_id
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1722 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1723, var1724 = protoModule.writeTag(buff, var1722, 1, protoModule.wireTypes.lengthDelimited)
		var1723, var2595 = protoModule.writeString(var1723, var1724, self.title)
		buff = var1723
		var1722 = var1724
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1725, var1726 = protoModule.writeTag(buff, var1722, 2, protoModule.wireTypes.lengthDelimited)
		var1725, var2597 = protoModule.writeString(var1725, var1726, self.user_id)
		buff = var1725
		var1722 = var1726
	end
	if self.description ~= nil and self.description ~= "" then
		local var1727, var1728 = protoModule.writeTag(buff, var1722, 3, protoModule.wireTypes.lengthDelimited)
		var1727, var2599 = protoModule.writeString(var1727, var1728, self.description)
		buff = var1727
		var1722 = var1728
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1722, 4, protoModule.wireTypes.lengthDelimited)
		var1729, var2601 = protoModule.writeString(var1729, var1730, self.cta_text)
		buff = var1729
		var1722 = var1730
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1722, 5, protoModule.wireTypes.lengthDelimited)
		var1731, var2603 = protoModule.writeString(var1731, var1732, self.prompt_id)
		buff = var1731
		var1722 = var1732
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1722, 6, protoModule.wireTypes.lengthDelimited)
		var1733, var2605 = protoModule.writeString(var1733, var1734, self.prompt_type)
		buff = var1733
		var1722 = var1734
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1735, var1736 = protoModule.writeTag(buff, var1722, 7, protoModule.wireTypes.lengthDelimited)
		var1735, var2607 = protoModule.writeString(var1735, var1736, self.entity_id)
		buff = var1735
		var1722 = var1736
	end
	local buff_1 = buffer.create(var1722)
	buffer.copy(buff_1, 0, buff, 0, var1722)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1722 = t_58.new()
	local var1723 = 0
	while var1723 < buffer.len(p58) do
		local _ = nil
		local var1724 = nil
		local var1725, var1726, var1727 = protoModule.readTag(p58, var1723)
		local var1728 = var1725
		var1724 = var1726
		var1723 = var1727
		
		if var1724 == protoModule.wireTypes.varint then
			local _ = nil
			local var1729, var1730 = protoModule.readVarInt(p58, var1723)
			local _ = var1729
			var1723 = var1730
			continue
		end
		if var1724 == protoModule.wireTypes.lengthDelimited then
			if var1728 == 1 then
				local _ = nil
				local var1731, var1732 = protoModule.readBuffer(p58, var1723)
				var1723 = var1732
				var1722.title = buffer.tostring(var1731)
			elseif var1728 == 2 then
				local _ = nil
				local var1733, var1734 = protoModule.readBuffer(p58, var1723)
				var1723 = var1734
				var1722.user_id = buffer.tostring(var1733)
			elseif var1728 == 3 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p58, var1723)
				var1723 = var1736
				var1722.description = buffer.tostring(var1735)
			elseif var1728 == 4 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p58, var1723)
				var1723 = var1738
				var1722.cta_text = buffer.tostring(var1737)
			elseif var1728 == 5 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p58, var1723)
				var1723 = var1740
				var1722.prompt_id = buffer.tostring(var1739)
			elseif var1728 == 6 then
				local _ = nil
				local var1741, var1742 = protoModule.readBuffer(p58, var1723)
				var1723 = var1742
				var1722.prompt_type = buffer.tostring(var1741)
			elseif var1728 == 7 then
				local _ = nil
				local var1743, var1744 = protoModule.readBuffer(p58, var1723)
				var1723 = var1744
				var1722.entity_id = buffer.tostring(var1743)
			else
				local _ = nil
				local var1745, var1746 = protoModule.readVarInt(p58, var1723)
				var1723 = var1746 + var1745
			end
		elseif var1724 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1747, var1748 = protoModule.readFixed32(p58, var1723)
			local _ = var1747
			var1723 = var1748
		elseif var1724 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1749, var1750 = protoModule.readFixed64(p58, var1723)
			local _ = var1749
			var1723 = var1750
		else
			error("Unsupported wire type: " .. var2611)
		end
	end
	return var1722
end

function t_58:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var1751 = t_58.new()
	
	if self.title ~= nil then
		var1751.title = self.title
	end
	if self.user_id ~= nil then
		var1751.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1751.user_id = self.userId
	end
	if self.description ~= nil then
		var1751.description = self.description
	end
	if self.cta_text ~= nil then
		var1751.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1751.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1751.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1751.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1751.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1751.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1751.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1751.entity_id = self.entityId
	end
	return var1751
end

t_58.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_58
typeRegistryModule.default:register(t.CardInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		prompt_id = if p59 == nil or p59.prompt_id == nil then "" else p59.prompt_id,
		prompt_type = if p59 == nil or p59.prompt_type == nil then "" else p59.prompt_type,
		user_id = if p59 == nil or p59.user_id == nil then "" else p59.user_id,
		audit_data = if p59 == nil or p59.audit_data == nil then "" else p59.audit_data
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1751 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1752, var1753 = protoModule.writeTag(buff, var1751, 1, protoModule.wireTypes.lengthDelimited)
		var1752, var2643 = protoModule.writeString(var1752, var1753, self.prompt_id)
		buff = var1752
		var1751 = var1753
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1754, var1755 = protoModule.writeTag(buff, var1751, 2, protoModule.wireTypes.lengthDelimited)
		var1754, var2645 = protoModule.writeString(var1754, var1755, self.prompt_type)
		buff = var1754
		var1751 = var1755
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1756, var1757 = protoModule.writeTag(buff, var1751, 3, protoModule.wireTypes.lengthDelimited)
		var1756, var2647 = protoModule.writeString(var1756, var1757, self.user_id)
		buff = var1756
		var1751 = var1757
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1758, var1759 = protoModule.writeTag(buff, var1751, 4, protoModule.wireTypes.lengthDelimited)
		var1758, var2649 = protoModule.writeString(var1758, var1759, self.audit_data)
		buff = var1758
		var1751 = var1759
	end
	local buff_1 = buffer.create(var1751)
	buffer.copy(buff_1, 0, buff, 0, var1751)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1751 = t_59.new()
	local var1752 = 0
	while var1752 < buffer.len(p59) do
		local _ = nil
		local var1753 = nil
		local var1754, var1755, var1756 = protoModule.readTag(p59, var1752)
		local var1757 = var1754
		var1753 = var1755
		var1752 = var1756
		
		if var1753 == protoModule.wireTypes.varint then
			local _ = nil
			local var1758, var1759 = protoModule.readVarInt(p59, var1752)
			local _ = var1758
			var1752 = var1759
			continue
		end
		if var1753 == protoModule.wireTypes.lengthDelimited then
			if var1757 == 1 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p59, var1752)
				var1752 = var1761
				var1751.prompt_id = buffer.tostring(var1760)
			elseif var1757 == 2 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p59, var1752)
				var1752 = var1763
				var1751.prompt_type = buffer.tostring(var1762)
			elseif var1757 == 3 then
				local _ = nil
				local var1764, var1765 = protoModule.readBuffer(p59, var1752)
				var1752 = var1765
				var1751.user_id = buffer.tostring(var1764)
			elseif var1757 == 4 then
				local _ = nil
				local var1766, var1767 = protoModule.readBuffer(p59, var1752)
				var1752 = var1767
				var1751.audit_data = buffer.tostring(var1766)
			else
				local _ = nil
				local var1768, var1769 = protoModule.readVarInt(p59, var1752)
				var1752 = var1769 + var1768
			end
		elseif var1753 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1770, var1771 = protoModule.readFixed32(p59, var1752)
			local _ = var1770
			var1752 = var1771
		elseif var1753 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1772, var1773 = protoModule.readFixed64(p59, var1752)
			local _ = var1772
			var1752 = var1773
		else
			error("Unsupported wire type: " .. var2653)
		end
	end
	return var1751
end

function t_59:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		t.auditData = self.audit_data
	end
	return t
end

function t_59:jsonDecode()
	-- upvalues: t_59 (ref)
	local var1774 = t_59.new()
	
	if self.prompt_id ~= nil then
		var1774.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1774.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1774.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1774.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1774.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1774.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1774.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1774.audit_data = self.auditData
	end
	return var1774
end

t_59.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_59
typeRegistryModule.default:register(t.DialogInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		sender_count = if p60 == nil or p60.sender_count == nil then 0 else p60.sender_count,
		total_robux_amount = if p60 == nil or p60.total_robux_amount == nil then 0 else p60.total_robux_amount
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1774 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1775, var1776 = protoModule.writeTag(buff, var1774, 1, protoModule.wireTypes.varint)
		var1775, var2679 = protoModule.writeVarInt(var1775, var1776, self.sender_count)
		buff = var1775
		var1774 = var1776
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1777, var1778 = protoModule.writeTag(buff, var1774, 2, protoModule.wireTypes.varint)
		var1777, var2681 = protoModule.writeVarInt(var1777, var1778, self.total_robux_amount)
		buff = var1777
		var1774 = var1778
	end
	local buff_1 = buffer.create(var1774)
	buffer.copy(buff_1, 0, buff, 0, var1774)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1774 = t_60.new()
	local var1775 = 0
	while var1775 < buffer.len(p60) do
		local _ = nil
		local _ = nil
		local var1776, var1777, var1778 = protoModule.readTag(p60, var1775)
		local var1779 = var1776
		local var1780 = var1777
		var1775 = var1778
		
		if var1780 == protoModule.wireTypes.varint then
			if var1779 == 1 then
				local _ = nil
				local var1781, var1782 = protoModule.readVarIntI32(p60, var1775)
				var1775 = var1782
				var1774.sender_count = var1781
			elseif var1779 == 2 then
				local _ = nil
				local var1783, var1784 = protoModule.readVarIntI64(p60, var1775)
				var1775 = var1784
				var1774.total_robux_amount = var1783
			else
				local _ = nil
				local var1785, var1786 = protoModule.readVarInt(p60, var1775)
				local _ = var1785
				var1775 = var1786
			end
		elseif var1780 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1787, var1788 = protoModule.readVarInt(p60, var1775)
			var1775 = var1788 + var1787
		elseif var1780 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed32(p60, var1775)
			local _ = var1789
			var1775 = var1790
		elseif var1780 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1791, var1792 = protoModule.readFixed64(p60, var1775)
			local _ = var1791
			var1775 = var1792
		else
			error("Unsupported wire type: " .. var2689)
		end
	end
	return var1774
end

function t_60:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_60:jsonDecode()
	-- upvalues: t_60 (ref)
	local var1793 = t_60.new()
	
	if self.sender_count ~= nil then
		var1793.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1793.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1793.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1793.total_robux_amount = self.totalRobuxAmount
	end
	return var1793
end

t_60.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_60
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		title = if p61 == nil or p61.title == nil then "" else p61.title,
		description = if p61 == nil or p61.description == nil then "" else p61.description,
		primary_text = if p61 == nil or p61.primary_text == nil then "" else p61.primary_text,
		secondary_text = if p61 == nil or p61.secondary_text == nil then "" else p61.secondary_text,
		prompt_id = if p61 == nil or p61.prompt_id == nil then "" else p61.prompt_id,
		prompt_type = if p61 == nil or p61.prompt_type == nil then "" else p61.prompt_type,
		times_seen = if p61 == nil or p61.times_seen == nil then 0 else p61.times_seen,
		content = if p61 == nil or p61.content == nil then nil else p61.content,
		sort_id = if p61 == nil or p61.sort_id == nil then nil else p61.sort_id
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1793 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1794, var1795 = protoModule.writeTag(buff, var1793, 1, protoModule.wireTypes.lengthDelimited)
		var1794, var2707 = protoModule.writeString(var1794, var1795, self.title)
		buff = var1794
		var1793 = var1795
	end
	if self.description ~= nil and self.description ~= "" then
		local var1796, var1797 = protoModule.writeTag(buff, var1793, 2, protoModule.wireTypes.lengthDelimited)
		var1796, var2709 = protoModule.writeString(var1796, var1797, self.description)
		buff = var1796
		var1793 = var1797
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1798, var1799 = protoModule.writeTag(buff, var1793, 3, protoModule.wireTypes.lengthDelimited)
		var1798, var2711 = protoModule.writeString(var1798, var1799, self.primary_text)
		buff = var1798
		var1793 = var1799
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1800, var1801 = protoModule.writeTag(buff, var1793, 4, protoModule.wireTypes.lengthDelimited)
		var1800, var2713 = protoModule.writeString(var1800, var1801, self.secondary_text)
		buff = var1800
		var1793 = var1801
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1802, var1803 = protoModule.writeTag(buff, var1793, 5, protoModule.wireTypes.lengthDelimited)
		var1802, var2715 = protoModule.writeString(var1802, var1803, self.prompt_id)
		buff = var1802
		var1793 = var1803
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1804, var1805 = protoModule.writeTag(buff, var1793, 6, protoModule.wireTypes.lengthDelimited)
		var1804, var2717 = protoModule.writeString(var1804, var1805, self.prompt_type)
		buff = var1804
		var1793 = var1805
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1806, var1807 = protoModule.writeTag(buff, var1793, 7, protoModule.wireTypes.varint)
		var1806, var2719 = protoModule.writeVarInt(var1806, var1807, self.times_seen)
		buff = var1806
		var1793 = var1807
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1808 = self.content.value:encode()
		local var1809, var1810 = protoModule.writeTag(buff, var1793, 8, protoModule.wireTypes.lengthDelimited)
		var1809, var2722 = protoModule.writeBuffer(var1809, var1810, var1808, buffer.len(var1808))
		buff = var1809
		var1793 = var1810
	end
	if self.sort_id ~= nil then
		local var1811, var1812 = protoModule.writeTag(buff, var1793, 9, protoModule.wireTypes.lengthDelimited)
		var1811, var2724 = protoModule.writeString(var1811, var1812, self.sort_id)
		buff = var1811
		var1793 = var1812
	end
	local buff_1 = buffer.create(var1793)
	buffer.copy(buff_1, 0, buff, 0, var1793)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var1793 = t_61.new()
	local var1794 = 0
	while var1794 < buffer.len(p61) do
		local _ = nil
		local var1795 = nil
		local var1796, var1797, var1798 = protoModule.readTag(p61, var1794)
		local var1799 = var1796
		var1795 = var1797
		var1794 = var1798
		
		if var1795 == protoModule.wireTypes.varint then
			if var1799 == 7 then
				local _ = nil
				local var1800, var1801 = protoModule.readVarIntI32(p61, var1794)
				var1794 = var1801
				var1793.times_seen = var1800
			else
				local _ = nil
				local var1802, var1803 = protoModule.readVarInt(p61, var1794)
				local _ = var1802
				var1794 = var1803
			end
		end
		if var1795 == protoModule.wireTypes.lengthDelimited then
			if var1799 == 1 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p61, var1794)
				var1794 = var1805
				var1793.title = buffer.tostring(var1804)
			elseif var1799 == 2 then
				local _ = nil
				local var1806, var1807 = protoModule.readBuffer(p61, var1794)
				var1794 = var1807
				var1793.description = buffer.tostring(var1806)
			elseif var1799 == 3 then
				local _ = nil
				local var1808, var1809 = protoModule.readBuffer(p61, var1794)
				var1794 = var1809
				var1793.primary_text = buffer.tostring(var1808)
			elseif var1799 == 4 then
				local _ = nil
				local var1810, var1811 = protoModule.readBuffer(p61, var1794)
				var1794 = var1811
				var1793.secondary_text = buffer.tostring(var1810)
			elseif var1799 == 5 then
				local _ = nil
				local var1812, var1813 = protoModule.readBuffer(p61, var1794)
				var1794 = var1813
				var1793.prompt_id = buffer.tostring(var1812)
			elseif var1799 == 6 then
				local _ = nil
				local var1814, var1815 = protoModule.readBuffer(p61, var1794)
				var1794 = var1815
				var1793.prompt_type = buffer.tostring(var1814)
			elseif var1799 == 8 then
				local _ = nil
				local var1816, var1817 = protoModule.readBuffer(p61, var1794)
				var1794 = var1817
				var1793.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1816)
				}
			elseif var1799 == 9 then
				local _ = nil
				local var1818, var1819 = protoModule.readBuffer(p61, var1794)
				var1794 = var1819
				var1793.sort_id = buffer.tostring(var1818)
			else
				local _ = nil
				local var1820, var1821 = protoModule.readVarInt(p61, var1794)
				var1794 = var1821 + var1820
			end
		elseif var1795 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1822, var1823 = protoModule.readFixed32(p61, var1794)
			local _ = var1822
			var1794 = var1823
		elseif var1795 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1824, var1825 = protoModule.readFixed64(p61, var1794)
			local _ = var1824
			var1794 = var1825
		else
			error("Unsupported wire type: " .. var2728)
		end
	end
	return var1793
end

function t_61:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		t.primaryText = self.primary_text
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		t.secondaryText = self.secondary_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		t.timesSeen = self.times_seen
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		t.incomingTransferContent = self.content.value:jsonEncode()
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_61:jsonDecode()
	-- upvalues: t_61 (ref), t (ref)
	local var1826 = t_61.new()
	
	if self.title ~= nil then
		var1826.title = self.title
	end
	if self.description ~= nil then
		var1826.description = self.description
	end
	if self.primary_text ~= nil then
		var1826.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1826.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1826.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1826.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1826.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1826.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1826.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1826.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1826.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1826.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1826.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1826.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1826.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1826.sort_id = self.sortId
	end
	return var1826
end

t_61.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_61
typeRegistryModule.default:register(t.BannerInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		tooltip_text = if p62 == nil or p62.tooltip_text == nil then "" else p62.tooltip_text,
		prompt_id = if p62 == nil or p62.prompt_id == nil then "" else p62.prompt_id,
		prompt_type = if p62 == nil or p62.prompt_type == nil then "" else p62.prompt_type
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1826 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1827, var1828 = protoModule.writeTag(buff, var1826, 1, protoModule.wireTypes.lengthDelimited)
		var1827, var2764 = protoModule.writeString(var1827, var1828, self.tooltip_text)
		buff = var1827
		var1826 = var1828
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1829, var1830 = protoModule.writeTag(buff, var1826, 2, protoModule.wireTypes.lengthDelimited)
		var1829, var2766 = protoModule.writeString(var1829, var1830, self.prompt_id)
		buff = var1829
		var1826 = var1830
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1831, var1832 = protoModule.writeTag(buff, var1826, 3, protoModule.wireTypes.lengthDelimited)
		var1831, var2768 = protoModule.writeString(var1831, var1832, self.prompt_type)
		buff = var1831
		var1826 = var1832
	end
	local buff_1 = buffer.create(var1826)
	buffer.copy(buff_1, 0, buff, 0, var1826)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1826 = t_62.new()
	local var1827 = 0
	while var1827 < buffer.len(p62) do
		local _ = nil
		local var1828 = nil
		local var1829, var1830, var1831 = protoModule.readTag(p62, var1827)
		local var1832 = var1829
		var1828 = var1830
		var1827 = var1831
		
		if var1828 == protoModule.wireTypes.varint then
			local _ = nil
			local var1833, var1834 = protoModule.readVarInt(p62, var1827)
			local _ = var1833
			var1827 = var1834
			continue
		end
		if var1828 == protoModule.wireTypes.lengthDelimited then
			if var1832 == 1 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p62, var1827)
				var1827 = var1836
				var1826.tooltip_text = buffer.tostring(var1835)
			elseif var1832 == 2 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p62, var1827)
				var1827 = var1838
				var1826.prompt_id = buffer.tostring(var1837)
			elseif var1832 == 3 then
				local _ = nil
				local var1839, var1840 = protoModule.readBuffer(p62, var1827)
				var1827 = var1840
				var1826.prompt_type = buffer.tostring(var1839)
			else
				local _ = nil
				local var1841, var1842 = protoModule.readVarInt(p62, var1827)
				var1827 = var1842 + var1841
			end
		elseif var1828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed32(p62, var1827)
			local _ = var1843
			var1827 = var1844
		elseif var1828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1845, var1846 = protoModule.readFixed64(p62, var1827)
			local _ = var1845
			var1827 = var1846
		else
			error("Unsupported wire type: " .. var2772)
		end
	end
	return var1826
end

function t_62:jsonEncode()
	local t = {}
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		t.tooltipText = self.tooltip_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_62:jsonDecode()
	-- upvalues: t_62 (ref)
	local var1847 = t_62.new()
	
	if self.tooltip_text ~= nil then
		var1847.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1847.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1847.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1847.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1847.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1847.prompt_type = self.promptType
	end
	return var1847
end

t_62.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_62
typeRegistryModule.default:register(t.TooltipInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		media_id = if p63 == nil or p63.media_id == nil then "" else p63.media_id,
		title = if p63 == nil or p63.title == nil then "" else p63.title,
		description = if p63 == nil or p63.description == nil then "" else p63.description,
		prompt_id = if p63 == nil or p63.prompt_id == nil then "" else p63.prompt_id,
		prompt_type = if p63 == nil or p63.prompt_type == nil then "" else p63.prompt_type,
		anchor_tag = if p63 == nil or p63.anchor_tag == nil then "" else p63.anchor_tag
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1847 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1848, var1849 = protoModule.writeTag(buff, var1847, 1, protoModule.wireTypes.lengthDelimited)
		var1848, var2796 = protoModule.writeString(var1848, var1849, self.media_id)
		buff = var1848
		var1847 = var1849
	end
	if self.title ~= nil and self.title ~= "" then
		local var1850, var1851 = protoModule.writeTag(buff, var1847, 2, protoModule.wireTypes.lengthDelimited)
		var1850, var2798 = protoModule.writeString(var1850, var1851, self.title)
		buff = var1850
		var1847 = var1851
	end
	if self.description ~= nil and self.description ~= "" then
		local var1852, var1853 = protoModule.writeTag(buff, var1847, 3, protoModule.wireTypes.lengthDelimited)
		var1852, var2800 = protoModule.writeString(var1852, var1853, self.description)
		buff = var1852
		var1847 = var1853
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1854, var1855 = protoModule.writeTag(buff, var1847, 4, protoModule.wireTypes.lengthDelimited)
		var1854, var2802 = protoModule.writeString(var1854, var1855, self.prompt_id)
		buff = var1854
		var1847 = var1855
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1856, var1857 = protoModule.writeTag(buff, var1847, 5, protoModule.wireTypes.lengthDelimited)
		var1856, var2804 = protoModule.writeString(var1856, var1857, self.prompt_type)
		buff = var1856
		var1847 = var1857
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1858, var1859 = protoModule.writeTag(buff, var1847, 6, protoModule.wireTypes.lengthDelimited)
		var1858, var2806 = protoModule.writeString(var1858, var1859, self.anchor_tag)
		buff = var1858
		var1847 = var1859
	end
	local buff_1 = buffer.create(var1847)
	buffer.copy(buff_1, 0, buff, 0, var1847)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1847 = t_63.new()
	local var1848 = 0
	while var1848 < buffer.len(p63) do
		local _ = nil
		local var1849 = nil
		local var1850, var1851, var1852 = protoModule.readTag(p63, var1848)
		local var1853 = var1850
		var1849 = var1851
		var1848 = var1852
		
		if var1849 == protoModule.wireTypes.varint then
			local _ = nil
			local var1854, var1855 = protoModule.readVarInt(p63, var1848)
			local _ = var1854
			var1848 = var1855
			continue
		end
		if var1849 == protoModule.wireTypes.lengthDelimited then
			if var1853 == 1 then
				local _ = nil
				local var1856, var1857 = protoModule.readBuffer(p63, var1848)
				var1848 = var1857
				var1847.media_id = buffer.tostring(var1856)
			elseif var1853 == 2 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p63, var1848)
				var1848 = var1859
				var1847.title = buffer.tostring(var1858)
			elseif var1853 == 3 then
				local _ = nil
				local var1860, var1861 = protoModule.readBuffer(p63, var1848)
				var1848 = var1861
				var1847.description = buffer.tostring(var1860)
			elseif var1853 == 4 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p63, var1848)
				var1848 = var1863
				var1847.prompt_id = buffer.tostring(var1862)
			elseif var1853 == 5 then
				local _ = nil
				local var1864, var1865 = protoModule.readBuffer(p63, var1848)
				var1848 = var1865
				var1847.prompt_type = buffer.tostring(var1864)
			elseif var1853 == 6 then
				local _ = nil
				local var1866, var1867 = protoModule.readBuffer(p63, var1848)
				var1848 = var1867
				var1847.anchor_tag = buffer.tostring(var1866)
			else
				local _ = nil
				local var1868, var1869 = protoModule.readVarInt(p63, var1848)
				var1848 = var1869 + var1868
			end
		elseif var1849 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1870, var1871 = protoModule.readFixed32(p63, var1848)
			local _ = var1870
			var1848 = var1871
		elseif var1849 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1872, var1873 = protoModule.readFixed64(p63, var1848)
			local _ = var1872
			var1848 = var1873
		else
			error("Unsupported wire type: " .. var2810)
		end
	end
	return var1847
end

function t_63:jsonEncode()
	local t = {}
	
	if self.media_id ~= nil and self.media_id ~= "" then
		t.mediaId = self.media_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		t.anchorTag = self.anchor_tag
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref)
	local var1874 = t_63.new()
	
	if self.media_id ~= nil then
		var1874.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1874.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1874.title = self.title
	end
	if self.description ~= nil then
		var1874.description = self.description
	end
	if self.prompt_id ~= nil then
		var1874.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1874.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1874.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1874.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1874.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1874.anchor_tag = self.anchorTag
	end
	return var1874
end

t_63.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_63
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		prompt_id = if p64 == nil or p64.prompt_id == nil then "" else p64.prompt_id,
		prompt_type = if p64 == nil or p64.prompt_type == nil then "" else p64.prompt_type
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1874 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1875, var1876 = protoModule.writeTag(buff, var1874, 1, protoModule.wireTypes.lengthDelimited)
		var1875, var2840 = protoModule.writeString(var1875, var1876, self.prompt_id)
		buff = var1875
		var1874 = var1876
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1877, var1878 = protoModule.writeTag(buff, var1874, 2, protoModule.wireTypes.lengthDelimited)
		var1877, var2842 = protoModule.writeString(var1877, var1878, self.prompt_type)
		buff = var1877
		var1874 = var1878
	end
	local buff_1 = buffer.create(var1874)
	buffer.copy(buff_1, 0, buff, 0, var1874)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1874 = t_64.new()
	local var1875 = 0
	while var1875 < buffer.len(p64) do
		local _ = nil
		local var1876 = nil
		local var1877, var1878, var1879 = protoModule.readTag(p64, var1875)
		local var1880 = var1877
		var1876 = var1878
		var1875 = var1879
		
		if var1876 == protoModule.wireTypes.varint then
			local _ = nil
			local var1881, var1882 = protoModule.readVarInt(p64, var1875)
			local _ = var1881
			var1875 = var1882
			continue
		end
		if var1876 == protoModule.wireTypes.lengthDelimited then
			if var1880 == 1 then
				local _ = nil
				local var1883, var1884 = protoModule.readBuffer(p64, var1875)
				var1875 = var1884
				var1874.prompt_id = buffer.tostring(var1883)
			elseif var1880 == 2 then
				local _ = nil
				local var1885, var1886 = protoModule.readBuffer(p64, var1875)
				var1875 = var1886
				var1874.prompt_type = buffer.tostring(var1885)
			else
				local _ = nil
				local var1887, var1888 = protoModule.readVarInt(p64, var1875)
				var1875 = var1888 + var1887
			end
		elseif var1876 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1889, var1890 = protoModule.readFixed32(p64, var1875)
			local _ = var1889
			var1875 = var1890
		elseif var1876 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1891, var1892 = protoModule.readFixed64(p64, var1875)
			local _ = var1891
			var1875 = var1892
		else
			error("Unsupported wire type: " .. var2846)
		end
	end
	return var1874
end

function t_64:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_64:jsonDecode()
	-- upvalues: t_64 (ref)
	local var1893 = t_64.new()
	
	if self.prompt_id ~= nil then
		var1893.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1893.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1893.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1893.prompt_type = self.promptType
	end
	return var1893
end

t_64.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_64
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		upsell_prompt = if p65 == nil or p65.upsell_prompt == nil then "" else p65.upsell_prompt
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1893 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1894, var1895 = protoModule.writeTag(buff, var1893, 1, protoModule.wireTypes.lengthDelimited)
		var1894, var2868 = protoModule.writeString(var1894, var1895, self.upsell_prompt)
		buff = var1894
		var1893 = var1895
	end
	local buff_1 = buffer.create(var1893)
	buffer.copy(buff_1, 0, buff, 0, var1893)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1893 = t_65.new()
	local var1894 = 0
	while var1894 < buffer.len(p65) do
		local _ = nil
		local var1895 = nil
		local var1896, var1897, var1898 = protoModule.readTag(p65, var1894)
		local var1899 = var1896
		var1895 = var1897
		var1894 = var1898
		
		if var1895 == protoModule.wireTypes.varint then
			local _ = nil
			local var1900, var1901 = protoModule.readVarInt(p65, var1894)
			local _ = var1900
			var1894 = var1901
			continue
		end
		if var1895 == protoModule.wireTypes.lengthDelimited then
			if var1899 == 1 then
				local _ = nil
				local var1902, var1903 = protoModule.readBuffer(p65, var1894)
				var1894 = var1903
				var1893.upsell_prompt = buffer.tostring(var1902)
			else
				local _ = nil
				local var1904, var1905 = protoModule.readVarInt(p65, var1894)
				var1894 = var1905 + var1904
			end
		elseif var1895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1906, var1907 = protoModule.readFixed32(p65, var1894)
			local _ = var1906
			var1894 = var1907
		elseif var1895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1908, var1909 = protoModule.readFixed64(p65, var1894)
			local _ = var1908
			var1894 = var1909
		else
			error("Unsupported wire type: " .. var2872)
		end
	end
	return var1893
end

function t_65:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_65:jsonDecode()
	-- upvalues: t_65 (ref)
	local var1910 = t_65.new()
	
	if self.upsell_prompt ~= nil then
		var1910.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1910.upsell_prompt = self.upsellPrompt
	end
	return var1910
end

t_65.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_65
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		modal_variant = if p66 == nil or p66.modal_variant == nil then "" else p66.modal_variant,
		modal_sequence = if p66 == nil or p66.modal_sequence == nil then "" else p66.modal_sequence,
		conversation_id = if p66 == nil or p66.conversation_id == nil then "" else p66.conversation_id,
		friend_id = if p66 == nil or p66.friend_id == nil then "" else p66.friend_id
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1910 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1911, var1912 = protoModule.writeTag(buff, var1910, 1, protoModule.wireTypes.lengthDelimited)
		var1911, var2892 = protoModule.writeString(var1911, var1912, self.modal_variant)
		buff = var1911
		var1910 = var1912
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1913, var1914 = protoModule.writeTag(buff, var1910, 2, protoModule.wireTypes.lengthDelimited)
		var1913, var2894 = protoModule.writeString(var1913, var1914, self.modal_sequence)
		buff = var1913
		var1910 = var1914
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1915, var1916 = protoModule.writeTag(buff, var1910, 3, protoModule.wireTypes.lengthDelimited)
		var1915, var2896 = protoModule.writeString(var1915, var1916, self.conversation_id)
		buff = var1915
		var1910 = var1916
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1917, var1918 = protoModule.writeTag(buff, var1910, 4, protoModule.wireTypes.lengthDelimited)
		var1917, var2898 = protoModule.writeString(var1917, var1918, self.friend_id)
		buff = var1917
		var1910 = var1918
	end
	local buff_1 = buffer.create(var1910)
	buffer.copy(buff_1, 0, buff, 0, var1910)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1910 = t_66.new()
	local var1911 = 0
	while var1911 < buffer.len(p66) do
		local _ = nil
		local var1912 = nil
		local var1913, var1914, var1915 = protoModule.readTag(p66, var1911)
		local var1916 = var1913
		var1912 = var1914
		var1911 = var1915
		
		if var1912 == protoModule.wireTypes.varint then
			local _ = nil
			local var1917, var1918 = protoModule.readVarInt(p66, var1911)
			local _ = var1917
			var1911 = var1918
			continue
		end
		if var1912 == protoModule.wireTypes.lengthDelimited then
			if var1916 == 1 then
				local _ = nil
				local var1919, var1920 = protoModule.readBuffer(p66, var1911)
				var1911 = var1920
				var1910.modal_variant = buffer.tostring(var1919)
			elseif var1916 == 2 then
				local _ = nil
				local var1921, var1922 = protoModule.readBuffer(p66, var1911)
				var1911 = var1922
				var1910.modal_sequence = buffer.tostring(var1921)
			elseif var1916 == 3 then
				local _ = nil
				local var1923, var1924 = protoModule.readBuffer(p66, var1911)
				var1911 = var1924
				var1910.conversation_id = buffer.tostring(var1923)
			elseif var1916 == 4 then
				local _ = nil
				local var1925, var1926 = protoModule.readBuffer(p66, var1911)
				var1911 = var1926
				var1910.friend_id = buffer.tostring(var1925)
			else
				local _ = nil
				local var1927, var1928 = protoModule.readVarInt(p66, var1911)
				var1911 = var1928 + var1927
			end
		elseif var1912 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1929, var1930 = protoModule.readFixed32(p66, var1911)
			local _ = var1929
			var1911 = var1930
		elseif var1912 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1931, var1932 = protoModule.readFixed64(p66, var1911)
			local _ = var1931
			var1911 = var1932
		else
			error("Unsupported wire type: " .. var2902)
		end
	end
	return var1910
end

function t_66:jsonEncode()
	local t = {}
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		t.modalVariant = self.modal_variant
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		t.modalSequence = self.modal_sequence
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		t.conversationId = self.conversation_id
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		t.friendId = self.friend_id
	end
	return t
end

function t_66:jsonDecode()
	-- upvalues: t_66 (ref)
	local var1933 = t_66.new()
	
	if self.modal_variant ~= nil then
		var1933.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1933.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1933.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1933.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1933.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1933.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1933.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1933.friend_id = self.friendId
	end
	return var1933
end

t_66.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_66
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p67 == nil or p67.event_id == nil then "" else p67.event_id,
		universe_id = if p67 == nil or p67.universe_id == nil then "" else p67.universe_id,
		entry_map = if p67 == nil or p67.entry_map == nil then {} else p67.entry_map,
		entry_order = if p67 == nil or p67.entry_order == nil then {} else p67.entry_order
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1933 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1934, var1935 = protoModule.writeTag(buff, var1933, 1, protoModule.wireTypes.lengthDelimited)
		var1934, var2928 = protoModule.writeString(var1934, var1935, self.event_id)
		buff = var1934
		var1933 = var1935
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1936, var1937 = protoModule.writeTag(buff, var1933, 2, protoModule.wireTypes.lengthDelimited)
		var1936, var2930 = protoModule.writeString(var1936, var1937, self.universe_id)
		buff = var1936
		var1933 = var1937
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1938, var1939 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1938, var2932 = protoModule.writeString(var1938, var1939, i)
			local var1940 = v:encode()
			var1939, var2934 = protoModule.writeTag(var1938, var1939, 2, protoModule.wireTypes.lengthDelimited)
			var1939, var2934 = protoModule.writeBuffer(var1939, var2934, var1940, buffer.len(var1940))
			local var1941 = var1939
			local var1942 = var2934
			local var1943, var1944 = protoModule.writeTag(buff, var1933, 3, protoModule.wireTypes.lengthDelimited)
			var1943, var2938 = protoModule.writeBuffer(var1943, var1944, var1941, var1942)
			buff = var1943
			var1933 = var1944
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1945, var1946 = protoModule.writeTag(buff, var1933, 4, protoModule.wireTypes.lengthDelimited)
			var1945, var2940 = protoModule.writeString(var1945, var1946, v)
			buff = var1945
			var1933 = var1946
		end
	end
	local buff_1 = buffer.create(var1933)
	buffer.copy(buff_1, 0, buff, 0, var1933)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1947 = t_67.new()
	local var1948 = 0
	while var1948 < buffer.len(p67) do
		local _ = nil
		local var1949 = nil
		local var1950, var1951, var1952 = protoModule.readTag(p67, var1948)
		local var1953 = var1950
		var1949 = var1951
		var1948 = var1952
		
		if var1949 == protoModule.wireTypes.varint then
			local _ = nil
			local var1954, var1955 = protoModule.readVarInt(p67, var1948)
			local _ = var1954
			var1948 = var1955
			continue
		end
		if var1949 == protoModule.wireTypes.lengthDelimited then
			if var1953 == 1 then
				local _ = nil
				local var1956, var1957 = protoModule.readBuffer(p67, var1948)
				var1948 = var1957
				var1947.event_id = buffer.tostring(var1956)
			elseif var1953 == 2 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p67, var1948)
				var1948 = var1959
				var1947.universe_id = buffer.tostring(var1958)
			elseif var1953 == 3 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p67, var1948)
				var1948 = var1961
				var1960 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1960)
				var1947.entry_map[var1960.key or ""] = var1960.value or t.FeedEntry.new()
			elseif var1953 == 4 then
				local _ = nil
				local var1962, var1963 = protoModule.readBuffer(p67, var1948)
				var1948 = var1963
				table.insert(var1947.entry_order, buffer.tostring(var1962))
			else
				local _ = nil
				local var1964, var1965 = protoModule.readVarInt(p67, var1948)
				var1948 = var1965 + var1964
			end
		elseif var1949 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1966, var1967 = protoModule.readFixed32(p67, var1948)
			local _ = var1966
			var1948 = var1967
		elseif var1949 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1968, var1969 = protoModule.readFixed64(p67, var1948)
			local _ = var1968
			var1948 = var1969
		else
			error("Unsupported wire type: " .. var2944)
		end
	end
	return var1947
end

function t_67:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), t (ref)
	local var1970 = t_67.new()
	
	if self.event_id ~= nil then
		var1970.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1970.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1970.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1970.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1970.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1970.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1970.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1970.entry_order = t_1
	end
	return var1970
end

t_67.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_67
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		key = if p68 == nil or p68.key == nil then "" else p68.key,
		value = if p68 == nil or p68.value == nil then nil else p68.value
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1971 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1972, var1973 = protoModule.writeTag(buff, var1971, 1, protoModule.wireTypes.lengthDelimited)
		var1972, var2976 = protoModule.writeString(var1972, var1973, self.key)
		buff = var1972
		var1971 = var1973
	end
	if self.value ~= nil then
		local var1974 = self.value:encode()
		local var1975, var1976 = protoModule.writeTag(buff, var1971, 2, protoModule.wireTypes.lengthDelimited)
		var1975, var2979 = protoModule.writeBuffer(var1975, var1976, var1974, buffer.len(var1974))
		buff = var1975
		var1971 = var1976
	end
	local buff_1 = buffer.create(var1971)
	buffer.copy(buff_1, 0, buff, 0, var1971)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1971 = t_68.new()
	local var1972 = 0
	while var1972 < buffer.len(p68) do
		local _ = nil
		local var1973 = nil
		local var1974, var1975, var1976 = protoModule.readTag(p68, var1972)
		local var1977 = var1974
		var1973 = var1975
		var1972 = var1976
		
		if var1973 == protoModule.wireTypes.varint then
			local _ = nil
			local var1978, var1979 = protoModule.readVarInt(p68, var1972)
			local _ = var1978
			var1972 = var1979
			continue
		end
		if var1973 == protoModule.wireTypes.lengthDelimited then
			if var1977 == 1 then
				local _ = nil
				local var1980, var1981 = protoModule.readBuffer(p68, var1972)
				var1972 = var1981
				var1971.key = buffer.tostring(var1980)
			elseif var1977 == 2 then
				local _ = nil
				local var1982, var1983 = protoModule.readBuffer(p68, var1972)
				var1972 = var1983
				var1971.value = t.FeedEntry.decode(var1982)
			else
				local _ = nil
				local var1984, var1985 = protoModule.readVarInt(p68, var1972)
				var1972 = var1985 + var1984
			end
		elseif var1973 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1986, var1987 = protoModule.readFixed32(p68, var1972)
			local _ = var1986
			var1972 = var1987
		elseif var1973 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed64(p68, var1972)
			local _ = var1988
			var1972 = var1989
		else
			error("Unsupported wire type: " .. var2983)
		end
	end
	return var1971
end

function t_68:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref), t (ref)
	local var1990 = t_68.new()
	
	if self.key ~= nil then
		var1990.key = self.key
	end
	if self.value ~= nil then
		var1990.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1990
end

t_68.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_68
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p69 == nil or p69.event_id == nil then "" else p69.event_id,
		universe_id = if p69 == nil or p69.universe_id == nil then "" else p69.universe_id
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1990 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1991, var1992 = protoModule.writeTag(buff, var1990, 1, protoModule.wireTypes.lengthDelimited)
		var1991, var3005 = protoModule.writeString(var1991, var1992, self.event_id)
		buff = var1991
		var1990 = var1992
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1993, var1994 = protoModule.writeTag(buff, var1990, 2, protoModule.wireTypes.lengthDelimited)
		var1993, var3007 = protoModule.writeString(var1993, var1994, self.universe_id)
		buff = var1993
		var1990 = var1994
	end
	local buff_1 = buffer.create(var1990)
	buffer.copy(buff_1, 0, buff, 0, var1990)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1990 = t_69.new()
	local var1991 = 0
	while var1991 < buffer.len(p69) do
		local _ = nil
		local var1992 = nil
		local var1993, var1994, var1995 = protoModule.readTag(p69, var1991)
		local var1996 = var1993
		var1992 = var1994
		var1991 = var1995
		
		if var1992 == protoModule.wireTypes.varint then
			local _ = nil
			local var1997, var1998 = protoModule.readVarInt(p69, var1991)
			local _ = var1997
			var1991 = var1998
			continue
		end
		if var1992 == protoModule.wireTypes.lengthDelimited then
			if var1996 == 1 then
				local _ = nil
				local var1999, var2000 = protoModule.readBuffer(p69, var1991)
				var1991 = var2000
				var1990.event_id = buffer.tostring(var1999)
			elseif var1996 == 2 then
				local _ = nil
				local var2001, var2002 = protoModule.readBuffer(p69, var1991)
				var1991 = var2002
				var1990.universe_id = buffer.tostring(var2001)
			else
				local _ = nil
				local var2003, var2004 = protoModule.readVarInt(p69, var1991)
				var1991 = var2004 + var2003
			end
		elseif var1992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed32(p69, var1991)
			local _ = var2005
			var1991 = var2006
		elseif var1992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2007, var2008 = protoModule.readFixed64(p69, var1991)
			local _ = var2007
			var1991 = var2008
		else
			error("Unsupported wire type: " .. var3011)
		end
	end
	return var1990
end

function t_69:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_69:jsonDecode()
	-- upvalues: t_69 (ref)
	local var2009 = t_69.new()
	
	if self.event_id ~= nil then
		var2009.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2009.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2009.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2009.universe_id = self.universeId
	end
	return var2009
end

t_69.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_69
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p70 == nil or p70.event_id == nil then "" else p70.event_id
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2009 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2010, var2011 = protoModule.writeTag(buff, var2009, 1, protoModule.wireTypes.lengthDelimited)
		var2010, var3033 = protoModule.writeString(var2010, var2011, self.event_id)
		buff = var2010
		var2009 = var2011
	end
	local buff_1 = buffer.create(var2009)
	buffer.copy(buff_1, 0, buff, 0, var2009)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2009 = t_70.new()
	local var2010 = 0
	while var2010 < buffer.len(p70) do
		local _ = nil
		local var2011 = nil
		local var2012, var2013, var2014 = protoModule.readTag(p70, var2010)
		local var2015 = var2012
		var2011 = var2013
		var2010 = var2014
		
		if var2011 == protoModule.wireTypes.varint then
			local _ = nil
			local var2016, var2017 = protoModule.readVarInt(p70, var2010)
			local _ = var2016
			var2010 = var2017
			continue
		end
		if var2011 == protoModule.wireTypes.lengthDelimited then
			if var2015 == 1 then
				local _ = nil
				local var2018, var2019 = protoModule.readBuffer(p70, var2010)
				var2010 = var2019
				var2009.event_id = buffer.tostring(var2018)
			else
				local _ = nil
				local var2020, var2021 = protoModule.readVarInt(p70, var2010)
				var2010 = var2021 + var2020
			end
		elseif var2011 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed32(p70, var2010)
			local _ = var2022
			var2010 = var2023
		elseif var2011 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2024, var2025 = protoModule.readFixed64(p70, var2010)
			local _ = var2024
			var2010 = var2025
		else
			error("Unsupported wire type: " .. var3037)
		end
	end
	return var2009
end

function t_70:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_70:jsonDecode()
	-- upvalues: t_70 (ref)
	local var2026 = t_70.new()
	
	if self.event_id ~= nil then
		var2026.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2026.event_id = self.eventId
	end
	return var2026
end

t_70.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_70
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p71 == nil or p71.event_id == nil then "" else p71.event_id,
		universe_id = if p71 == nil or p71.universe_id == nil then "" else p71.universe_id,
		rsvp_users = if p71 == nil or p71.rsvp_users == nil then {} else p71.rsvp_users
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2026 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2027, var2028 = protoModule.writeTag(buff, var2026, 1, protoModule.wireTypes.lengthDelimited)
		var2027, var3057 = protoModule.writeString(var2027, var2028, self.event_id)
		buff = var2027
		var2026 = var2028
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2029, var2030 = protoModule.writeTag(buff, var2026, 2, protoModule.wireTypes.lengthDelimited)
		var2029, var3059 = protoModule.writeString(var2029, var2030, self.universe_id)
		buff = var2029
		var2026 = var2030
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2031 = v:encode()
			local var2032, var2033 = protoModule.writeTag(buff, var2026, 3, protoModule.wireTypes.lengthDelimited)
			var2032, var3062 = protoModule.writeBuffer(var2032, var2033, var2031, buffer.len(var2031))
			buff = var2032
			var2026 = var2033
		end
	end
	local buff_1 = buffer.create(var2026)
	buffer.copy(buff_1, 0, buff, 0, var2026)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2034 = t_71.new()
	local var2035 = 0
	while var2035 < buffer.len(p71) do
		local _ = nil
		local var2036 = nil
		local var2037, var2038, var2039 = protoModule.readTag(p71, var2035)
		local var2040 = var2037
		var2036 = var2038
		var2035 = var2039
		
		if var2036 == protoModule.wireTypes.varint then
			local _ = nil
			local var2041, var2042 = protoModule.readVarInt(p71, var2035)
			local _ = var2041
			var2035 = var2042
			continue
		end
		if var2036 == protoModule.wireTypes.lengthDelimited then
			if var2040 == 1 then
				local _ = nil
				local var2043, var2044 = protoModule.readBuffer(p71, var2035)
				var2035 = var2044
				var2034.event_id = buffer.tostring(var2043)
			elseif var2040 == 2 then
				local _ = nil
				local var2045, var2046 = protoModule.readBuffer(p71, var2035)
				var2035 = var2046
				var2034.universe_id = buffer.tostring(var2045)
			elseif var2040 == 3 then
				local _ = nil
				local var2047, var2048 = protoModule.readBuffer(p71, var2035)
				var2035 = var2048
				table.insert(var2034.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2047))
			else
				local _ = nil
				local var2049, var2050 = protoModule.readVarInt(p71, var2035)
				var2035 = var2050 + var2049
			end
		elseif var2036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2051, var2052 = protoModule.readFixed32(p71, var2035)
			local _ = var2051
			var2035 = var2052
		elseif var2036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2053, var2054 = protoModule.readFixed64(p71, var2035)
			local _ = var2053
			var2035 = var2054
		else
			error("Unsupported wire type: " .. var3066)
		end
	end
	return var2034
end

function t_71:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.rsvpUsers = t_1
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref), t (ref)
	local var2055 = t_71.new()
	
	if self.event_id ~= nil then
		var2055.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2055.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2055.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2055.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2055.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2055.rsvp_users = t_1
	end
	return var2055
end

t_71.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_71
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t_72 (ref)
	return setmetatable({
		user_id = if p72 == nil or p72.user_id == nil then 0 else p72.user_id
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2056 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2057, var2058 = protoModule.writeTag(buff, var2056, 1, protoModule.wireTypes.varint)
		var2057, var3093 = protoModule.writeVarInt(var2057, var2058, self.user_id)
		buff = var2057
		var2056 = var2058
	end
	local buff_1 = buffer.create(var2056)
	buffer.copy(buff_1, 0, buff, 0, var2056)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2056 = t_72.new()
	local var2057 = 0
	while var2057 < buffer.len(p72) do
		local _ = nil
		local _ = nil
		local var2058, var2059, var2060 = protoModule.readTag(p72, var2057)
		local var2061 = var2058
		local var2062 = var2059
		var2057 = var2060
		
		if var2062 == protoModule.wireTypes.varint then
			if var2061 == 1 then
				local _ = nil
				local var2063, var2064 = protoModule.readVarIntI64(p72, var2057)
				var2057 = var2064
				var2056.user_id = var2063
			else
				local _ = nil
				local var2065, var2066 = protoModule.readVarInt(p72, var2057)
				local _ = var2065
				var2057 = var2066
			end
		elseif var2062 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2067, var2068 = protoModule.readVarInt(p72, var2057)
			var2057 = var2068 + var2067
		elseif var2062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2069, var2070 = protoModule.readFixed32(p72, var2057)
			local _ = var2069
			var2057 = var2070
		elseif var2062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2071, var2072 = protoModule.readFixed64(p72, var2057)
			local _ = var2071
			var2057 = var2072
		else
			error("Unsupported wire type: " .. var3101)
		end
	end
	return var2056
end

function t_72:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_72:jsonDecode()
	-- upvalues: t_72 (ref)
	local var2073 = t_72.new()
	
	if self.user_id ~= nil then
		var2073.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2073.user_id = self.userId
	end
	return var2073
end

t_72.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_72
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p73 == nil or p73.event_id == nil then "" else p73.event_id
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2073 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2074, var2075 = protoModule.writeTag(buff, var2073, 1, protoModule.wireTypes.lengthDelimited)
		var2074, var3117 = protoModule.writeString(var2074, var2075, self.event_id)
		buff = var2074
		var2073 = var2075
	end
	local buff_1 = buffer.create(var2073)
	buffer.copy(buff_1, 0, buff, 0, var2073)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2073 = t_73.new()
	local var2074 = 0
	while var2074 < buffer.len(p73) do
		local _ = nil
		local var2075 = nil
		local var2076, var2077, var2078 = protoModule.readTag(p73, var2074)
		local var2079 = var2076
		var2075 = var2077
		var2074 = var2078
		
		if var2075 == protoModule.wireTypes.varint then
			local _ = nil
			local var2080, var2081 = protoModule.readVarInt(p73, var2074)
			local _ = var2080
			var2074 = var2081
			continue
		end
		if var2075 == protoModule.wireTypes.lengthDelimited then
			if var2079 == 1 then
				local _ = nil
				local var2082, var2083 = protoModule.readBuffer(p73, var2074)
				var2074 = var2083
				var2073.event_id = buffer.tostring(var2082)
			else
				local _ = nil
				local var2084, var2085 = protoModule.readVarInt(p73, var2074)
				var2074 = var2085 + var2084
			end
		elseif var2075 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed32(p73, var2074)
			local _ = var2086
			var2074 = var2087
		elseif var2075 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2088, var2089 = protoModule.readFixed64(p73, var2074)
			local _ = var2088
			var2074 = var2089
		else
			error("Unsupported wire type: " .. var3121)
		end
	end
	return var2073
end

function t_73:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref)
	local var2090 = t_73.new()
	
	if self.event_id ~= nil then
		var2090.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2090.event_id = self.eventId
	end
	return var2090
end

t_73.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_73
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		event_id = if p74 == nil or p74.event_id == nil then "" else p74.event_id
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2090 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2091, var2092 = protoModule.writeTag(buff, var2090, 1, protoModule.wireTypes.lengthDelimited)
		var2091, var3141 = protoModule.writeString(var2091, var2092, self.event_id)
		buff = var2091
		var2090 = var2092
	end
	local buff_1 = buffer.create(var2090)
	buffer.copy(buff_1, 0, buff, 0, var2090)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref)
	local var2090 = t_74.new()
	local var2091 = 0
	while var2091 < buffer.len(p74) do
		local _ = nil
		local var2092 = nil
		local var2093, var2094, var2095 = protoModule.readTag(p74, var2091)
		local var2096 = var2093
		var2092 = var2094
		var2091 = var2095
		
		if var2092 == protoModule.wireTypes.varint then
			local _ = nil
			local var2097, var2098 = protoModule.readVarInt(p74, var2091)
			local _ = var2097
			var2091 = var2098
			continue
		end
		if var2092 == protoModule.wireTypes.lengthDelimited then
			if var2096 == 1 then
				local _ = nil
				local var2099, var2100 = protoModule.readBuffer(p74, var2091)
				var2091 = var2100
				var2090.event_id = buffer.tostring(var2099)
			else
				local _ = nil
				local var2101, var2102 = protoModule.readVarInt(p74, var2091)
				var2091 = var2102 + var2101
			end
		elseif var2092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed32(p74, var2091)
			local _ = var2103
			var2091 = var2104
		elseif var2092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2105, var2106 = protoModule.readFixed64(p74, var2091)
			local _ = var2105
			var2091 = var2106
		else
			error("Unsupported wire type: " .. var3145)
		end
	end
	return var2090
end

function t_74:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_74:jsonDecode()
	-- upvalues: t_74 (ref)
	local var2107 = t_74.new()
	
	if self.event_id ~= nil then
		var2107.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2107.event_id = self.eventId
	end
	return var2107
end

t_74.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_74
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		event_id = if p75 == nil or p75.event_id == nil then "" else p75.event_id,
		universe_id = if p75 == nil or p75.universe_id == nil then "" else p75.universe_id
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2107 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2108, var2109 = protoModule.writeTag(buff, var2107, 1, protoModule.wireTypes.lengthDelimited)
		var2108, var3165 = protoModule.writeString(var2108, var2109, self.event_id)
		buff = var2108
		var2107 = var2109
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2110, var2111 = protoModule.writeTag(buff, var2107, 2, protoModule.wireTypes.lengthDelimited)
		var2110, var3167 = protoModule.writeString(var2110, var2111, self.universe_id)
		buff = var2110
		var2107 = var2111
	end
	local buff_1 = buffer.create(var2107)
	buffer.copy(buff_1, 0, buff, 0, var2107)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref)
	local var2107 = t_75.new()
	local var2108 = 0
	while var2108 < buffer.len(p75) do
		local _ = nil
		local var2109 = nil
		local var2110, var2111, var2112 = protoModule.readTag(p75, var2108)
		local var2113 = var2110
		var2109 = var2111
		var2108 = var2112
		
		if var2109 == protoModule.wireTypes.varint then
			local _ = nil
			local var2114, var2115 = protoModule.readVarInt(p75, var2108)
			local _ = var2114
			var2108 = var2115
			continue
		end
		if var2109 == protoModule.wireTypes.lengthDelimited then
			if var2113 == 1 then
				local _ = nil
				local var2116, var2117 = protoModule.readBuffer(p75, var2108)
				var2108 = var2117
				var2107.event_id = buffer.tostring(var2116)
			elseif var2113 == 2 then
				local _ = nil
				local var2118, var2119 = protoModule.readBuffer(p75, var2108)
				var2108 = var2119
				var2107.universe_id = buffer.tostring(var2118)
			else
				local _ = nil
				local var2120, var2121 = protoModule.readVarInt(p75, var2108)
				var2108 = var2121 + var2120
			end
		elseif var2109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2122, var2123 = protoModule.readFixed32(p75, var2108)
			local _ = var2122
			var2108 = var2123
		elseif var2109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2124, var2125 = protoModule.readFixed64(p75, var2108)
			local _ = var2124
			var2108 = var2125
		else
			error("Unsupported wire type: " .. var3171)
		end
	end
	return var2107
end

function t_75:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref)
	local var2126 = t_75.new()
	
	if self.event_id ~= nil then
		var2126.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2126.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2126.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2126.universe_id = self.universeId
	end
	return var2126
end

t_75.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_75
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		entry_map = if p76 == nil or p76.entry_map == nil then {} else p76.entry_map,
		entry_order = if p76 == nil or p76.entry_order == nil then {} else p76.entry_order,
		next_page_token = if p76 == nil or p76.next_page_token == nil then "" else p76.next_page_token,
		sticky_filter_pills = if p76 == nil or p76.sticky_filter_pills == nil then nil else p76.sticky_filter_pills,
		applied_filters = if p76 == nil or p76.applied_filters == nil then "" else p76.applied_filters
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2126 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2127, var2128 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2127, var3193 = protoModule.writeString(var2127, var2128, i)
			local var2129 = v:encode()
			var2128, var3195 = protoModule.writeTag(var2127, var2128, 2, protoModule.wireTypes.lengthDelimited)
			var2128, var3195 = protoModule.writeBuffer(var2128, var3195, var2129, buffer.len(var2129))
			local var2130 = var2128
			local var2131 = var3195
			local var2132, var2133 = protoModule.writeTag(buff, var2126, 1, protoModule.wireTypes.lengthDelimited)
			var2132, var3199 = protoModule.writeBuffer(var2132, var2133, var2130, var2131)
			buff = var2132
			var2126 = var2133
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2134, var2135 = protoModule.writeTag(buff, var2126, 2, protoModule.wireTypes.lengthDelimited)
			var2134, var3201 = protoModule.writeString(var2134, var2135, v)
			buff = var2134
			var2126 = var2135
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2136, var2137 = protoModule.writeTag(buff, var2126, 3, protoModule.wireTypes.lengthDelimited)
		var2136, var3203 = protoModule.writeString(var2136, var2137, self.next_page_token)
		buff = var2136
		var2126 = var2137
	end
	if self.sticky_filter_pills ~= nil then
		local var2138 = self.sticky_filter_pills:encode()
		local var2139, var2140 = protoModule.writeTag(buff, var2126, 4, protoModule.wireTypes.lengthDelimited)
		var2139, var3206 = protoModule.writeBuffer(var2139, var2140, var2138, buffer.len(var2138))
		buff = var2139
		var2126 = var2140
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2141, var2142 = protoModule.writeTag(buff, var2126, 5, protoModule.wireTypes.lengthDelimited)
		var2141, var3208 = protoModule.writeString(var2141, var2142, self.applied_filters)
		buff = var2141
		var2126 = var2142
	end
	local buff_1 = buffer.create(var2126)
	buffer.copy(buff_1, 0, buff, 0, var2126)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2143 = t_76.new()
	local var2144 = 0
	while var2144 < buffer.len(p76) do
		local _ = nil
		local var2145 = nil
		local var2146, var2147, var2148 = protoModule.readTag(p76, var2144)
		local var2149 = var2146
		var2145 = var2147
		var2144 = var2148
		
		if var2145 == protoModule.wireTypes.varint then
			local _ = nil
			local var2150, var2151 = protoModule.readVarInt(p76, var2144)
			local _ = var2150
			var2144 = var2151
			continue
		end
		if var2145 == protoModule.wireTypes.lengthDelimited then
			if var2149 == 1 then
				local _ = nil
				local var2152, var2153 = protoModule.readBuffer(p76, var2144)
				var2144 = var2153
				var2152 = t.ChartsFeedInputData_EntryMapEntry.decode(var2152)
				var2143.entry_map[var2152.key or ""] = var2152.value or t.FeedEntry.new()
			elseif var2149 == 2 then
				local _ = nil
				local var2154, var2155 = protoModule.readBuffer(p76, var2144)
				var2144 = var2155
				table.insert(var2143.entry_order, buffer.tostring(var2154))
			elseif var2149 == 3 then
				local _ = nil
				local var2156, var2157 = protoModule.readBuffer(p76, var2144)
				var2144 = var2157
				var2143.next_page_token = buffer.tostring(var2156)
			elseif var2149 == 4 then
				local _ = nil
				local var2158, var2159 = protoModule.readBuffer(p76, var2144)
				var2144 = var2159
				var2143.sticky_filter_pills = t.FilterPillsInputData.decode(var2158)
			elseif var2149 == 5 then
				local _ = nil
				local var2160, var2161 = protoModule.readBuffer(p76, var2144)
				var2144 = var2161
				var2143.applied_filters = buffer.tostring(var2160)
			else
				local _ = nil
				local var2162, var2163 = protoModule.readVarInt(p76, var2144)
				var2144 = var2163 + var2162
			end
		elseif var2145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2164, var2165 = protoModule.readFixed32(p76, var2144)
			local _ = var2164
			var2144 = var2165
		elseif var2145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2166, var2167 = protoModule.readFixed64(p76, var2144)
			local _ = var2166
			var2144 = var2167
		else
			error("Unsupported wire type: " .. var3212)
		end
	end
	return var2143
end

function t_76:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sticky_filter_pills ~= nil then
		t.stickyFilterPills = self.sticky_filter_pills:jsonEncode()
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_76:jsonDecode()
	-- upvalues: t_76 (ref), t (ref)
	local var2168 = t_76.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2168.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2168.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2168.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2168.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2168.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2168.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2168.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2168.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2168.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2168.applied_filters = self.appliedFilters
	end
	return var2168
end

t_76.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_76
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		key = if p77 == nil or p77.key == nil then "" else p77.key,
		value = if p77 == nil or p77.value == nil then nil else p77.value
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2169 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2170, var2171 = protoModule.writeTag(buff, var2169, 1, protoModule.wireTypes.lengthDelimited)
		var2170, var3246 = protoModule.writeString(var2170, var2171, self.key)
		buff = var2170
		var2169 = var2171
	end
	if self.value ~= nil then
		local var2172 = self.value:encode()
		local var2173, var2174 = protoModule.writeTag(buff, var2169, 2, protoModule.wireTypes.lengthDelimited)
		var2173, var3249 = protoModule.writeBuffer(var2173, var2174, var2172, buffer.len(var2172))
		buff = var2173
		var2169 = var2174
	end
	local buff_1 = buffer.create(var2169)
	buffer.copy(buff_1, 0, buff, 0, var2169)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2169 = t_77.new()
	local var2170 = 0
	while var2170 < buffer.len(p77) do
		local _ = nil
		local var2171 = nil
		local var2172, var2173, var2174 = protoModule.readTag(p77, var2170)
		local var2175 = var2172
		var2171 = var2173
		var2170 = var2174
		
		if var2171 == protoModule.wireTypes.varint then
			local _ = nil
			local var2176, var2177 = protoModule.readVarInt(p77, var2170)
			local _ = var2176
			var2170 = var2177
			continue
		end
		if var2171 == protoModule.wireTypes.lengthDelimited then
			if var2175 == 1 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p77, var2170)
				var2170 = var2179
				var2169.key = buffer.tostring(var2178)
			elseif var2175 == 2 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p77, var2170)
				var2170 = var2181
				var2169.value = t.FeedEntry.decode(var2180)
			else
				local _ = nil
				local var2182, var2183 = protoModule.readVarInt(p77, var2170)
				var2170 = var2183 + var2182
			end
		elseif var2171 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2184, var2185 = protoModule.readFixed32(p77, var2170)
			local _ = var2184
			var2170 = var2185
		elseif var2171 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2186, var2187 = protoModule.readFixed64(p77, var2170)
			local _ = var2186
			var2170 = var2187
		else
			error("Unsupported wire type: " .. var3253)
		end
	end
	return var2169
end

function t_77:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var2188 = t_77.new()
	
	if self.key ~= nil then
		var2188.key = self.key
	end
	if self.value ~= nil then
		var2188.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2188
end

t_77.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_77
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		filter_groups = if p78 == nil or p78.filter_groups == nil then {} else p78.filter_groups,
		sort_id = if p78 == nil or p78.sort_id == nil then "" else p78.sort_id,
		secondary_sort_id = if p78 == nil or p78.secondary_sort_id == nil then 0 else p78.secondary_sort_id,
		title = if p78 == nil or p78.title == nil then "" else p78.title,
		primary_sort_id = if p78 == nil or p78.primary_sort_id == nil then nil else p78.primary_sort_id,
		applied_filters = if p78 == nil or p78.applied_filters == nil then nil else p78.applied_filters
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2188 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2189 = v:encode()
			local var2190, var2191 = protoModule.writeTag(buff, var2188, 1, protoModule.wireTypes.lengthDelimited)
			var2190, var3276 = protoModule.writeBuffer(var2190, var2191, var2189, buffer.len(var2189))
			buff = var2190
			var2188 = var2191
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2192, var2193 = protoModule.writeTag(buff, var2188, 2, protoModule.wireTypes.lengthDelimited)
		var2192, var3278 = protoModule.writeString(var2192, var2193, self.sort_id)
		buff = var2192
		var2188 = var2193
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2194, var2195 = protoModule.writeTag(buff, var2188, 3, protoModule.wireTypes.varint)
		var2194, var3280 = protoModule.writeVarInt(var2194, var2195, self.secondary_sort_id)
		buff = var2194
		var2188 = var2195
	end
	if self.title ~= nil and self.title ~= "" then
		local var2196, var2197 = protoModule.writeTag(buff, var2188, 4, protoModule.wireTypes.lengthDelimited)
		var2196, var3282 = protoModule.writeString(var2196, var2197, self.title)
		buff = var2196
		var2188 = var2197
	end
	if self.primary_sort_id ~= nil then
		local var2198, var2199 = protoModule.writeTag(buff, var2188, 5, protoModule.wireTypes.varint)
		var2198, var3284 = protoModule.writeVarInt(var2198, var2199, self.primary_sort_id)
		buff = var2198
		var2188 = var2199
	end
	if self.applied_filters ~= nil then
		local var2200, var2201 = protoModule.writeTag(buff, var2188, 6, protoModule.wireTypes.lengthDelimited)
		var2200, var3286 = protoModule.writeString(var2200, var2201, self.applied_filters)
		buff = var2200
		var2188 = var2201
	end
	local buff_1 = buffer.create(var2188)
	buffer.copy(buff_1, 0, buff, 0, var2188)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2202 = t_78.new()
	local var2203 = 0
	while var2203 < buffer.len(p78) do
		local _ = nil
		local var2204 = nil
		local var2205, var2206, var2207 = protoModule.readTag(p78, var2203)
		local var2208 = var2205
		var2204 = var2206
		var2203 = var2207
		
		if var2204 == protoModule.wireTypes.varint then
			if var2208 == 3 then
				local _ = nil
				local var2209, var2210 = protoModule.readVarIntI32(p78, var2203)
				var2203 = var2210
				var2202.secondary_sort_id = var2209
			elseif var2208 == 5 then
				local _ = nil
				local var2211, var2212 = protoModule.readVarIntI32(p78, var2203)
				var2203 = var2212
				var2202.primary_sort_id = var2211
			else
				local _ = nil
				local var2213, var2214 = protoModule.readVarInt(p78, var2203)
				local _ = var2213
				var2203 = var2214
			end
		end
		if var2204 == protoModule.wireTypes.lengthDelimited then
			if var2208 == 1 then
				local _ = nil
				local var2215, var2216 = protoModule.readBuffer(p78, var2203)
				var2203 = var2216
				table.insert(var2202.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2215))
			elseif var2208 == 2 then
				local _ = nil
				local var2217, var2218 = protoModule.readBuffer(p78, var2203)
				var2203 = var2218
				var2202.sort_id = buffer.tostring(var2217)
			elseif var2208 == 4 then
				local _ = nil
				local var2219, var2220 = protoModule.readBuffer(p78, var2203)
				var2203 = var2220
				var2202.title = buffer.tostring(var2219)
			elseif var2208 == 6 then
				local _ = nil
				local var2221, var2222 = protoModule.readBuffer(p78, var2203)
				var2203 = var2222
				var2202.applied_filters = buffer.tostring(var2221)
			else
				local _ = nil
				local var2223, var2224 = protoModule.readVarInt(p78, var2203)
				var2203 = var2224 + var2223
			end
		elseif var2204 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2225, var2226 = protoModule.readFixed32(p78, var2203)
			local _ = var2225
			var2203 = var2226
		elseif var2204 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2227, var2228 = protoModule.readFixed64(p78, var2203)
			local _ = var2227
			var2203 = var2228
		else
			error("Unsupported wire type: " .. var3290)
		end
	end
	return var2202
end

function t_78:jsonEncode()
	local t = {}
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, v:jsonEncode())
		end
		t.filterGroups = t_1
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_78:jsonDecode()
	-- upvalues: t_78 (ref), t (ref)
	local var2229 = t_78.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2229.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2229.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2229.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2229.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2229.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2229.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2229.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2229.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2229.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2229.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2229.applied_filters = self.appliedFilters
	end
	return var2229
end

t_78.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_78
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		filter_id = if p79 == nil or p79.filter_id == nil then "" else p79.filter_id,
		display_name = if p79 == nil or p79.display_name == nil then "" else p79.display_name,
		options = if p79 == nil or p79.options == nil then {} else p79.options,
		default_option_id = if p79 == nil or p79.default_option_id == nil then "" else p79.default_option_id,
		selected_option_id = if p79 == nil or p79.selected_option_id == nil then "" else p79.selected_option_id,
		filter_type = if p79 == nil or p79.filter_type == nil then "" else p79.filter_type,
		inactive_option_ids = if p79 == nil or p79.inactive_option_ids == nil then {} else p79.inactive_option_ids,
		info_text = if p79 == nil or p79.info_text == nil then "" else p79.info_text
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2230 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2231, var2232 = protoModule.writeTag(buff, var2230, 1, protoModule.wireTypes.lengthDelimited)
		var2231, var3323 = protoModule.writeString(var2231, var2232, self.filter_id)
		buff = var2231
		var2230 = var2232
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2233, var2234 = protoModule.writeTag(buff, var2230, 2, protoModule.wireTypes.lengthDelimited)
		var2233, var3325 = protoModule.writeString(var2233, var2234, self.display_name)
		buff = var2233
		var2230 = var2234
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2235 = v:encode()
			local var2236, var2237 = protoModule.writeTag(buff, var2230, 3, protoModule.wireTypes.lengthDelimited)
			var2236, var3328 = protoModule.writeBuffer(var2236, var2237, var2235, buffer.len(var2235))
			buff = var2236
			var2230 = var2237
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2238, var2239 = protoModule.writeTag(buff, var2230, 4, protoModule.wireTypes.lengthDelimited)
		var2238, var3330 = protoModule.writeString(var2238, var2239, self.default_option_id)
		buff = var2238
		var2230 = var2239
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2240, var2241 = protoModule.writeTag(buff, var2230, 5, protoModule.wireTypes.lengthDelimited)
		var2240, var3332 = protoModule.writeString(var2240, var2241, self.selected_option_id)
		buff = var2240
		var2230 = var2241
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2242, var2243 = protoModule.writeTag(buff, var2230, 6, protoModule.wireTypes.lengthDelimited)
		var2242, var3334 = protoModule.writeString(var2242, var2243, self.filter_type)
		buff = var2242
		var2230 = var2243
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2244, var2245 = protoModule.writeTag(buff, var2230, 7, protoModule.wireTypes.lengthDelimited)
			var2244, var3336 = protoModule.writeString(var2244, var2245, v)
			buff = var2244
			var2230 = var2245
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2246, var2247 = protoModule.writeTag(buff, var2230, 8, protoModule.wireTypes.lengthDelimited)
		var2246, var3338 = protoModule.writeString(var2246, var2247, self.info_text)
		buff = var2246
		var2230 = var2247
	end
	local buff_1 = buffer.create(var2230)
	buffer.copy(buff_1, 0, buff, 0, var2230)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2248 = t_79.new()
	local var2249 = 0
	while var2249 < buffer.len(p79) do
		local _ = nil
		local var2250 = nil
		local var2251, var2252, var2253 = protoModule.readTag(p79, var2249)
		local var2254 = var2251
		var2250 = var2252
		var2249 = var2253
		
		if var2250 == protoModule.wireTypes.varint then
			local _ = nil
			local var2255, var2256 = protoModule.readVarInt(p79, var2249)
			local _ = var2255
			var2249 = var2256
			continue
		end
		if var2250 == protoModule.wireTypes.lengthDelimited then
			if var2254 == 1 then
				local _ = nil
				local var2257, var2258 = protoModule.readBuffer(p79, var2249)
				var2249 = var2258
				var2248.filter_id = buffer.tostring(var2257)
			elseif var2254 == 2 then
				local _ = nil
				local var2259, var2260 = protoModule.readBuffer(p79, var2249)
				var2249 = var2260
				var2248.display_name = buffer.tostring(var2259)
			elseif var2254 == 3 then
				local _ = nil
				local var2261, var2262 = protoModule.readBuffer(p79, var2249)
				var2249 = var2262
				table.insert(var2248.options, t.FilterPillsInputData_FilterOption.decode(var2261))
			elseif var2254 == 4 then
				local _ = nil
				local var2263, var2264 = protoModule.readBuffer(p79, var2249)
				var2249 = var2264
				var2248.default_option_id = buffer.tostring(var2263)
			elseif var2254 == 5 then
				local _ = nil
				local var2265, var2266 = protoModule.readBuffer(p79, var2249)
				var2249 = var2266
				var2248.selected_option_id = buffer.tostring(var2265)
			elseif var2254 == 6 then
				local _ = nil
				local var2267, var2268 = protoModule.readBuffer(p79, var2249)
				var2249 = var2268
				var2248.filter_type = buffer.tostring(var2267)
			elseif var2254 == 7 then
				local _ = nil
				local var2269, var2270 = protoModule.readBuffer(p79, var2249)
				var2249 = var2270
				table.insert(var2248.inactive_option_ids, buffer.tostring(var2269))
			elseif var2254 == 8 then
				local _ = nil
				local var2271, var2272 = protoModule.readBuffer(p79, var2249)
				var2249 = var2272
				var2248.info_text = buffer.tostring(var2271)
			else
				local _ = nil
				local var2273, var2274 = protoModule.readVarInt(p79, var2249)
				var2249 = var2274 + var2273
			end
		elseif var2250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2275, var2276 = protoModule.readFixed32(p79, var2249)
			local _ = var2275
			var2249 = var2276
		elseif var2250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2277, var2278 = protoModule.readFixed64(p79, var2249)
			local _ = var2277
			var2249 = var2278
		else
			error("Unsupported wire type: " .. var3342)
		end
	end
	return var2248
end

function t_79:jsonEncode()
	local t = {}
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		t.filterId = self.filter_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		t.defaultOptionId = self.default_option_id
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		t.selectedOptionId = self.selected_option_id
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		t.filterType = self.filter_type
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		t.inactiveOptionIds = t_1
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var2279 = t_79.new()
	
	if self.filter_id ~= nil then
		var2279.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2279.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2279.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2279.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2279.options = t_1
	end
	if self.default_option_id ~= nil then
		var2279.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2279.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2279.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2279.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2279.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2279.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2279.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2279.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2279.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2279.info_text = self.infoText
	end
	return var2279
end

t_79.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_79
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		option_id = if p80 == nil or p80.option_id == nil then "" else p80.option_id,
		display_name = if p80 == nil or p80.display_name == nil then "" else p80.display_name,
		option_context_tag = if p80 == nil or p80.option_context_tag == nil then "" else p80.option_context_tag
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2280 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2281, var2282 = protoModule.writeTag(buff, var2280, 1, protoModule.wireTypes.lengthDelimited)
		var2281, var3381 = protoModule.writeString(var2281, var2282, self.option_id)
		buff = var2281
		var2280 = var2282
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2283, var2284 = protoModule.writeTag(buff, var2280, 2, protoModule.wireTypes.lengthDelimited)
		var2283, var3383 = protoModule.writeString(var2283, var2284, self.display_name)
		buff = var2283
		var2280 = var2284
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2285, var2286 = protoModule.writeTag(buff, var2280, 3, protoModule.wireTypes.lengthDelimited)
		var2285, var3385 = protoModule.writeString(var2285, var2286, self.option_context_tag)
		buff = var2285
		var2280 = var2286
	end
	local buff_1 = buffer.create(var2280)
	buffer.copy(buff_1, 0, buff, 0, var2280)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
	local var2280 = t_80.new()
	local var2281 = 0
	while var2281 < buffer.len(p80) do
		local _ = nil
		local var2282 = nil
		local var2283, var2284, var2285 = protoModule.readTag(p80, var2281)
		local var2286 = var2283
		var2282 = var2284
		var2281 = var2285
		
		if var2282 == protoModule.wireTypes.varint then
			local _ = nil
			local var2287, var2288 = protoModule.readVarInt(p80, var2281)
			local _ = var2287
			var2281 = var2288
			continue
		end
		if var2282 == protoModule.wireTypes.lengthDelimited then
			if var2286 == 1 then
				local _ = nil
				local var2289, var2290 = protoModule.readBuffer(p80, var2281)
				var2281 = var2290
				var2280.option_id = buffer.tostring(var2289)
			elseif var2286 == 2 then
				local _ = nil
				local var2291, var2292 = protoModule.readBuffer(p80, var2281)
				var2281 = var2292
				var2280.display_name = buffer.tostring(var2291)
			elseif var2286 == 3 then
				local _ = nil
				local var2293, var2294 = protoModule.readBuffer(p80, var2281)
				var2281 = var2294
				var2280.option_context_tag = buffer.tostring(var2293)
			else
				local _ = nil
				local var2295, var2296 = protoModule.readVarInt(p80, var2281)
				var2281 = var2296 + var2295
			end
		elseif var2282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2297, var2298 = protoModule.readFixed32(p80, var2281)
			local _ = var2297
			var2281 = var2298
		elseif var2282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2299, var2300 = protoModule.readFixed64(p80, var2281)
			local _ = var2299
			var2281 = var2300
		else
			error("Unsupported wire type: " .. var3389)
		end
	end
	return var2280
end

function t_80:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		t.optionContextTag = self.option_context_tag
	end
	return t
end

function t_80:jsonDecode()
	-- upvalues: t_80 (ref)
	local var2301 = t_80.new()
	
	if self.option_id ~= nil then
		var2301.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2301.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2301.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2301.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2301.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2301.option_context_tag = self.optionContextTag
	end
	return var2301
end

t_80.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_80
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		sort_options = if p81 == nil or p81.sort_options == nil then {} else p81.sort_options,
		selected_sort_id = if p81 == nil or p81.selected_sort_id == nil then "" else p81.selected_sort_id
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2301 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2302 = v:encode()
			local var2303, var2304 = protoModule.writeTag(buff, var2301, 1, protoModule.wireTypes.lengthDelimited)
			var2303, var3414 = protoModule.writeBuffer(var2303, var2304, var2302, buffer.len(var2302))
			buff = var2303
			var2301 = var2304
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2305, var2306 = protoModule.writeTag(buff, var2301, 2, protoModule.wireTypes.lengthDelimited)
		var2305, var3416 = protoModule.writeString(var2305, var2306, self.selected_sort_id)
		buff = var2305
		var2301 = var2306
	end
	local buff_1 = buffer.create(var2301)
	buffer.copy(buff_1, 0, buff, 0, var2301)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2307 = t_81.new()
	local var2308 = 0
	while var2308 < buffer.len(p81) do
		local _ = nil
		local var2309 = nil
		local var2310, var2311, var2312 = protoModule.readTag(p81, var2308)
		local var2313 = var2310
		var2309 = var2311
		var2308 = var2312
		
		if var2309 == protoModule.wireTypes.varint then
			local _ = nil
			local var2314, var2315 = protoModule.readVarInt(p81, var2308)
			local _ = var2314
			var2308 = var2315
			continue
		end
		if var2309 == protoModule.wireTypes.lengthDelimited then
			if var2313 == 1 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p81, var2308)
				var2308 = var2317
				table.insert(var2307.sort_options, t.SortSelectorInputData_SortOption.decode(var2316))
			elseif var2313 == 2 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p81, var2308)
				var2308 = var2319
				var2307.selected_sort_id = buffer.tostring(var2318)
			else
				local _ = nil
				local var2320, var2321 = protoModule.readVarInt(p81, var2308)
				var2308 = var2321 + var2320
			end
		elseif var2309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed32(p81, var2308)
			local _ = var2322
			var2308 = var2323
		elseif var2309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2324, var2325 = protoModule.readFixed64(p81, var2308)
			local _ = var2324
			var2308 = var2325
		else
			error("Unsupported wire type: " .. var3420)
		end
	end
	return var2307
end

function t_81:jsonEncode()
	local t = {}
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, v:jsonEncode())
		end
		t.sortOptions = t_1
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		t.selectedSortId = self.selected_sort_id
	end
	return t
end

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), t (ref)
	local var2326 = t_81.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2326.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2326.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2326.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2326.selected_sort_id = self.selectedSortId
	end
	return var2326
end

t_81.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_81
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		sort_id = if p82 == nil or p82.sort_id == nil then "" else p82.sort_id,
		display_name = if p82 == nil or p82.display_name == nil then "" else p82.display_name,
		content_type = if p82 == nil or p82.content_type == nil then "" else p82.content_type
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2327 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2328, var2329 = protoModule.writeTag(buff, var2327, 1, protoModule.wireTypes.lengthDelimited)
		var2328, var3445 = protoModule.writeString(var2328, var2329, self.sort_id)
		buff = var2328
		var2327 = var2329
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2330, var2331 = protoModule.writeTag(buff, var2327, 2, protoModule.wireTypes.lengthDelimited)
		var2330, var3447 = protoModule.writeString(var2330, var2331, self.display_name)
		buff = var2330
		var2327 = var2331
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2332, var2333 = protoModule.writeTag(buff, var2327, 3, protoModule.wireTypes.lengthDelimited)
		var2332, var3449 = protoModule.writeString(var2332, var2333, self.content_type)
		buff = var2332
		var2327 = var2333
	end
	local buff_1 = buffer.create(var2327)
	buffer.copy(buff_1, 0, buff, 0, var2327)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref)
	local var2327 = t_82.new()
	local var2328 = 0
	while var2328 < buffer.len(p82) do
		local _ = nil
		local var2329 = nil
		local var2330, var2331, var2332 = protoModule.readTag(p82, var2328)
		local var2333 = var2330
		var2329 = var2331
		var2328 = var2332
		
		if var2329 == protoModule.wireTypes.varint then
			local _ = nil
			local var2334, var2335 = protoModule.readVarInt(p82, var2328)
			local _ = var2334
			var2328 = var2335
			continue
		end
		if var2329 == protoModule.wireTypes.lengthDelimited then
			if var2333 == 1 then
				local _ = nil
				local var2336, var2337 = protoModule.readBuffer(p82, var2328)
				var2328 = var2337
				var2327.sort_id = buffer.tostring(var2336)
			elseif var2333 == 2 then
				local _ = nil
				local var2338, var2339 = protoModule.readBuffer(p82, var2328)
				var2328 = var2339
				var2327.display_name = buffer.tostring(var2338)
			elseif var2333 == 3 then
				local _ = nil
				local var2340, var2341 = protoModule.readBuffer(p82, var2328)
				var2328 = var2341
				var2327.content_type = buffer.tostring(var2340)
			else
				local _ = nil
				local var2342, var2343 = protoModule.readVarInt(p82, var2328)
				var2328 = var2343 + var2342
			end
		elseif var2329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2344, var2345 = protoModule.readFixed32(p82, var2328)
			local _ = var2344
			var2328 = var2345
		elseif var2329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2346, var2347 = protoModule.readFixed64(p82, var2328)
			local _ = var2346
			var2328 = var2347
		else
			error("Unsupported wire type: " .. var3453)
		end
	end
	return var2327
end

function t_82:jsonEncode()
	local t = {}
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function t_82:jsonDecode()
	-- upvalues: t_82 (ref)
	local var2348 = t_82.new()
	
	if self.sort_id ~= nil then
		var2348.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2348.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2348.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2348.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2348.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2348.content_type = self.contentType
	end
	return var2348
end

t_82.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_82
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		selected_option = if p83 == nil or p83.selected_option == nil then "" else p83.selected_option,
		options = if p83 == nil or p83.options == nil then {} else p83.options,
		experience_carousel = if p83 == nil or p83.experience_carousel == nil then nil else p83.experience_carousel
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2348 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2349, var2350 = protoModule.writeTag(buff, var2348, 1, protoModule.wireTypes.lengthDelimited)
		var2349, var3477 = protoModule.writeString(var2349, var2350, self.selected_option)
		buff = var2349
		var2348 = var2350
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2351 = v:encode()
			local var2352, var2353 = protoModule.writeTag(buff, var2348, 2, protoModule.wireTypes.lengthDelimited)
			var2352, var3480 = protoModule.writeBuffer(var2352, var2353, var2351, buffer.len(var2351))
			buff = var2352
			var2348 = var2353
		end
	end
	if self.experience_carousel ~= nil then
		local var2354 = self.experience_carousel:encode()
		local var2355, var2356 = protoModule.writeTag(buff, var2348, 3, protoModule.wireTypes.lengthDelimited)
		var2355, var3483 = protoModule.writeBuffer(var2355, var2356, var2354, buffer.len(var2354))
		buff = var2355
		var2348 = var2356
	end
	local buff_1 = buffer.create(var2348)
	buffer.copy(buff_1, 0, buff, 0, var2348)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2357 = t_83.new()
	local var2358 = 0
	while var2358 < buffer.len(p83) do
		local _ = nil
		local var2359 = nil
		local var2360, var2361, var2362 = protoModule.readTag(p83, var2358)
		local var2363 = var2360
		var2359 = var2361
		var2358 = var2362
		
		if var2359 == protoModule.wireTypes.varint then
			local _ = nil
			local var2364, var2365 = protoModule.readVarInt(p83, var2358)
			local _ = var2364
			var2358 = var2365
			continue
		end
		if var2359 == protoModule.wireTypes.lengthDelimited then
			if var2363 == 1 then
				local _ = nil
				local var2366, var2367 = protoModule.readBuffer(p83, var2358)
				var2358 = var2367
				var2357.selected_option = buffer.tostring(var2366)
			elseif var2363 == 2 then
				local _ = nil
				local var2368, var2369 = protoModule.readBuffer(p83, var2358)
				var2358 = var2369
				table.insert(var2357.options, t.SelectorOption.decode(var2368))
			elseif var2363 == 3 then
				local _ = nil
				local var2370, var2371 = protoModule.readBuffer(p83, var2358)
				var2358 = var2371
				var2357.experience_carousel = t.ExperienceCarouselInputData.decode(var2370)
			else
				local _ = nil
				local var2372, var2373 = protoModule.readVarInt(p83, var2358)
				var2358 = var2373 + var2372
			end
		elseif var2359 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2374, var2375 = protoModule.readFixed32(p83, var2358)
			local _ = var2374
			var2358 = var2375
		elseif var2359 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2376, var2377 = protoModule.readFixed64(p83, var2358)
			local _ = var2376
			var2358 = var2377
		else
			error("Unsupported wire type: " .. var3487)
		end
	end
	return var2357
end

function t_83:jsonEncode()
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.experience_carousel ~= nil then
		t.experienceCarousel = self.experience_carousel:jsonEncode()
	end
	return t
end

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var2378 = t_83.new()
	
	if self.selected_option ~= nil then
		var2378.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2378.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2378.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2378.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2378.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2378
end

t_83.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_83
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		id = if p84 == nil or p84.id == nil then "" else p84.id,
		preview_rows = if p84 == nil or p84.preview_rows == nil then 0 else p84.preview_rows,
		widget_style = if p84 == nil or p84.widget_style == nil then nil else p84.widget_style,
		see_all_button = if p84 == nil or p84.see_all_button == nil then false else p84.see_all_button,
		information_popover_text = if p84 == nil or p84.information_popover_text == nil then "" else p84.information_popover_text
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2379 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2380, var2381 = protoModule.writeTag(buff, var2379, 1, protoModule.wireTypes.lengthDelimited)
		var2380, var3513 = protoModule.writeString(var2380, var2381, self.id)
		buff = var2380
		var2379 = var2381
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2382, var2383 = protoModule.writeTag(buff, var2379, 4, protoModule.wireTypes.varint)
		var2382, var3515 = protoModule.writeVarInt(var2382, var2383, self.preview_rows)
		buff = var2382
		var2379 = var2383
	end
	if self.widget_style ~= nil then
		local var2384 = self.widget_style:encode()
		local var2385, var2386 = protoModule.writeTag(buff, var2379, 3, protoModule.wireTypes.lengthDelimited)
		var2385, var3518 = protoModule.writeBuffer(var2385, var2386, var2384, buffer.len(var2384))
		buff = var2385
		var2379 = var2386
	end
	if self.see_all_button then
		local var2387, var2388 = protoModule.writeTag(buff, var2379, 5, protoModule.wireTypes.varint)
		var2387, var3520 = protoModule.writeVarInt(var2387, var2388, if self.see_all_button then 1 else 0)
		buff = var2387
		var2379 = var2388
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2389, var2390 = protoModule.writeTag(buff, var2379, 6, protoModule.wireTypes.lengthDelimited)
		var2389, var3522 = protoModule.writeString(var2389, var2390, self.information_popover_text)
		buff = var2389
		var2379 = var2390
	end
	local buff_1 = buffer.create(var2379)
	buffer.copy(buff_1, 0, buff, 0, var2379)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2379 = t_84.new()
	local var2380 = 0
	while var2380 < buffer.len(p84) do
		local _ = nil
		local var2381 = nil
		local var2382, var2383, var2384 = protoModule.readTag(p84, var2380)
		local var2385 = var2382
		var2381 = var2383
		var2380 = var2384
		
		if var2381 == protoModule.wireTypes.varint then
			if var2385 == 4 then
				local _ = nil
				local var2386, var2387 = protoModule.readVarIntI64(p84, var2380)
				var2380 = var2387
				var2379.preview_rows = var2386
			elseif var2385 == 5 then
				local _ = nil
				local var2388, var2389 = protoModule.readVarInt(p84, var2380)
				var2380 = var2389
				var2379.see_all_button = var2388 ~= 0
			else
				local _ = nil
				local var2390, var2391 = protoModule.readVarInt(p84, var2380)
				local _ = var2390
				var2380 = var2391
			end
		end
		if var2381 == protoModule.wireTypes.lengthDelimited then
			if var2385 == 1 then
				local _ = nil
				local var2392, var2393 = protoModule.readBuffer(p84, var2380)
				var2380 = var2393
				var2379.id = buffer.tostring(var2392)
			elseif var2385 == 3 then
				local _ = nil
				local var2394, var2395 = protoModule.readBuffer(p84, var2380)
				var2380 = var2395
				var2379.widget_style = t.WidgetStyleData.decode(var2394)
			elseif var2385 == 6 then
				local _ = nil
				local var2396, var2397 = protoModule.readBuffer(p84, var2380)
				var2380 = var2397
				var2379.information_popover_text = buffer.tostring(var2396)
			else
				local _ = nil
				local var2398, var2399 = protoModule.readVarInt(p84, var2380)
				var2380 = var2399 + var2398
			end
		elseif var2381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2400, var2401 = protoModule.readFixed32(p84, var2380)
			local _ = var2400
			var2380 = var2401
		elseif var2381 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2402, var2403 = protoModule.readFixed64(p84, var2380)
			local _ = var2402
			var2380 = var2403
		else
			error("Unsupported wire type: " .. var3526)
		end
	end
	return var2379
end

function t_84:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		t.previewRows = self.preview_rows
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var2404 = t_84.new()
	
	if self.id ~= nil then
		var2404.id = self.id
	end
	if self.preview_rows ~= nil then
		var2404.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2404.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2404.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2404.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2404.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2404.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2404.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2404.information_popover_text = self.informationPopoverText
	end
	return var2404
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		id = if p85 == nil or p85.id == nil then "" else p85.id,
		num_items_to_show = if p85 == nil or p85.num_items_to_show == nil then 0 else p85.num_items_to_show,
		widget_style = if p85 == nil or p85.widget_style == nil then nil else p85.widget_style,
		see_all_button = if p85 == nil or p85.see_all_button == nil then false else p85.see_all_button,
		information_popover_text = if p85 == nil or p85.information_popover_text == nil then "" else p85.information_popover_text
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2404 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2405, var2406 = protoModule.writeTag(buff, var2404, 1, protoModule.wireTypes.lengthDelimited)
		var2405, var3554 = protoModule.writeString(var2405, var2406, self.id)
		buff = var2405
		var2404 = var2406
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2407, var2408 = protoModule.writeTag(buff, var2404, 5, protoModule.wireTypes.varint)
		var2407, var3556 = protoModule.writeVarInt(var2407, var2408, self.num_items_to_show)
		buff = var2407
		var2404 = var2408
	end
	if self.widget_style ~= nil then
		local var2409 = self.widget_style:encode()
		local var2410, var2411 = protoModule.writeTag(buff, var2404, 3, protoModule.wireTypes.lengthDelimited)
		var2410, var3559 = protoModule.writeBuffer(var2410, var2411, var2409, buffer.len(var2409))
		buff = var2410
		var2404 = var2411
	end
	if self.see_all_button then
		local var2412, var2413 = protoModule.writeTag(buff, var2404, 6, protoModule.wireTypes.varint)
		var2412, var3561 = protoModule.writeVarInt(var2412, var2413, if self.see_all_button then 1 else 0)
		buff = var2412
		var2404 = var2413
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2414, var2415 = protoModule.writeTag(buff, var2404, 7, protoModule.wireTypes.lengthDelimited)
		var2414, var3563 = protoModule.writeString(var2414, var2415, self.information_popover_text)
		buff = var2414
		var2404 = var2415
	end
	local buff_1 = buffer.create(var2404)
	buffer.copy(buff_1, 0, buff, 0, var2404)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2404 = t_85.new()
	local var2405 = 0
	while var2405 < buffer.len(p85) do
		local _ = nil
		local var2406 = nil
		local var2407, var2408, var2409 = protoModule.readTag(p85, var2405)
		local var2410 = var2407
		var2406 = var2408
		var2405 = var2409
		
		if var2406 == protoModule.wireTypes.varint then
			if var2410 == 5 then
				local _ = nil
				local var2411, var2412 = protoModule.readVarIntI64(p85, var2405)
				var2405 = var2412
				var2404.num_items_to_show = var2411
			elseif var2410 == 6 then
				local _ = nil
				local var2413, var2414 = protoModule.readVarInt(p85, var2405)
				var2405 = var2414
				var2404.see_all_button = var2413 ~= 0
			else
				local _ = nil
				local var2415, var2416 = protoModule.readVarInt(p85, var2405)
				local _ = var2415
				var2405 = var2416
			end
		end
		if var2406 == protoModule.wireTypes.lengthDelimited then
			if var2410 == 1 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p85, var2405)
				var2405 = var2418
				var2404.id = buffer.tostring(var2417)
			elseif var2410 == 3 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p85, var2405)
				var2405 = var2420
				var2404.widget_style = t.WidgetStyleData.decode(var2419)
			elseif var2410 == 7 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p85, var2405)
				var2405 = var2422
				var2404.information_popover_text = buffer.tostring(var2421)
			else
				local _ = nil
				local var2423, var2424 = protoModule.readVarInt(p85, var2405)
				var2405 = var2424 + var2423
			end
		elseif var2406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2425, var2426 = protoModule.readFixed32(p85, var2405)
			local _ = var2425
			var2405 = var2426
		elseif var2406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2427, var2428 = protoModule.readFixed64(p85, var2405)
			local _ = var2427
			var2405 = var2428
		else
			error("Unsupported wire type: " .. var3567)
		end
	end
	return var2404
end

function t_85:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		t.numItemsToShow = self.num_items_to_show
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), t (ref)
	local var2429 = t_85.new()
	
	if self.id ~= nil then
		var2429.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2429.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2429.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2429.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2429.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2429.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2429.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2429.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2429.information_popover_text = self.informationPopoverText
	end
	return var2429
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		background_layers = if p86 == nil or p86.background_layers == nil then {} else p86.background_layers
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2429 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2430 = v:encode()
			local var2431, var2432 = protoModule.writeTag(buff, var2429, 1, protoModule.wireTypes.lengthDelimited)
			var2431, var3596 = protoModule.writeBuffer(var2431, var2432, var2430, buffer.len(var2430))
			buff = var2431
			var2429 = var2432
		end
	end
	local buff_1 = buffer.create(var2429)
	buffer.copy(buff_1, 0, buff, 0, var2429)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2433 = t_86.new()
	local var2434 = 0
	while var2434 < buffer.len(p86) do
		local _ = nil
		local var2435 = nil
		local var2436, var2437, var2438 = protoModule.readTag(p86, var2434)
		local var2439 = var2436
		var2435 = var2437
		var2434 = var2438
		
		if var2435 == protoModule.wireTypes.varint then
			local _ = nil
			local var2440, var2441 = protoModule.readVarInt(p86, var2434)
			local _ = var2440
			var2434 = var2441
			continue
		end
		if var2435 == protoModule.wireTypes.lengthDelimited then
			if var2439 == 1 then
				local _ = nil
				local var2442, var2443 = protoModule.readBuffer(p86, var2434)
				var2434 = var2443
				table.insert(var2433.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2442))
			else
				local _ = nil
				local var2444, var2445 = protoModule.readVarInt(p86, var2434)
				var2434 = var2445 + var2444
			end
		elseif var2435 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2446, var2447 = protoModule.readFixed32(p86, var2434)
			local _ = var2446
			var2434 = var2447
		elseif var2435 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2448, var2449 = protoModule.readFixed64(p86, var2434)
			local _ = var2448
			var2434 = var2449
		else
			error("Unsupported wire type: " .. var3600)
		end
	end
	return var2433
end

function t_86:jsonEncode()
	local t = {}
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		local t_1 = {}
		
		for i, v in self.background_layers do
			table.insert(t_1, v:jsonEncode())
		end
		t.backgroundLayers = t_1
	end
	return t
end

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), backgroundLayerModule (ref)
	local var2450 = t_86.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2450.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2450.background_layers = t
	end
	return var2450
end

t_86.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_86
typeRegistryModule.default:register(t.WidgetStyleData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		id = if p87 == nil or p87.id == nil then "" else p87.id,
		available_until = if p87 == nil or p87.available_until == nil then "" else p87.available_until,
		widget_style = if p87 == nil or p87.widget_style == nil then nil else p87.widget_style
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2451 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2452, var2453 = protoModule.writeTag(buff, var2451, 1, protoModule.wireTypes.lengthDelimited)
		var2452, var3623 = protoModule.writeString(var2452, var2453, self.id)
		buff = var2452
		var2451 = var2453
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2454, var2455 = protoModule.writeTag(buff, var2451, 2, protoModule.wireTypes.lengthDelimited)
		var2454, var3625 = protoModule.writeString(var2454, var2455, self.available_until)
		buff = var2454
		var2451 = var2455
	end
	if self.widget_style ~= nil then
		local var2456 = self.widget_style:encode()
		local var2457, var2458 = protoModule.writeTag(buff, var2451, 3, protoModule.wireTypes.lengthDelimited)
		var2457, var3628 = protoModule.writeBuffer(var2457, var2458, var2456, buffer.len(var2456))
		buff = var2457
		var2451 = var2458
	end
	local buff_1 = buffer.create(var2451)
	buffer.copy(buff_1, 0, buff, 0, var2451)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2451 = t_87.new()
	local var2452 = 0
	while var2452 < buffer.len(p87) do
		local _ = nil
		local var2453 = nil
		local var2454, var2455, var2456 = protoModule.readTag(p87, var2452)
		local var2457 = var2454
		var2453 = var2455
		var2452 = var2456
		
		if var2453 == protoModule.wireTypes.varint then
			local _ = nil
			local var2458, var2459 = protoModule.readVarInt(p87, var2452)
			local _ = var2458
			var2452 = var2459
			continue
		end
		if var2453 == protoModule.wireTypes.lengthDelimited then
			if var2457 == 1 then
				local _ = nil
				local var2460, var2461 = protoModule.readBuffer(p87, var2452)
				var2452 = var2461
				var2451.id = buffer.tostring(var2460)
			elseif var2457 == 2 then
				local _ = nil
				local var2462, var2463 = protoModule.readBuffer(p87, var2452)
				var2452 = var2463
				var2451.available_until = buffer.tostring(var2462)
			elseif var2457 == 3 then
				local _ = nil
				local var2464, var2465 = protoModule.readBuffer(p87, var2452)
				var2452 = var2465
				var2451.widget_style = t.WidgetStyleData.decode(var2464)
			else
				local _ = nil
				local var2466, var2467 = protoModule.readVarInt(p87, var2452)
				var2452 = var2467 + var2466
			end
		elseif var2453 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2468, var2469 = protoModule.readFixed32(p87, var2452)
			local _ = var2468
			var2452 = var2469
		elseif var2453 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2470, var2471 = protoModule.readFixed64(p87, var2452)
			local _ = var2470
			var2452 = var2471
		else
			error("Unsupported wire type: " .. var3632)
		end
	end
	return var2451
end

function t_87:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		t.availableUntil = self.available_until
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), t (ref)
	local var2472 = t_87.new()
	
	if self.id ~= nil then
		var2472.id = self.id
	end
	if self.available_until ~= nil then
		var2472.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2472.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2472.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2472.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2472
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		entry_map = if p88 == nil or p88.entry_map == nil then {} else p88.entry_map,
		entry_order = if p88 == nil or p88.entry_order == nil then {} else p88.entry_order
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2472 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2473, var2474 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2473, var3656 = protoModule.writeString(var2473, var2474, i)
			local var2475 = v:encode()
			var2474, var3658 = protoModule.writeTag(var2473, var2474, 2, protoModule.wireTypes.lengthDelimited)
			var2474, var3658 = protoModule.writeBuffer(var2474, var3658, var2475, buffer.len(var2475))
			local var2476 = var2474
			local var2477 = var3658
			local var2478, var2479 = protoModule.writeTag(buff, var2472, 1, protoModule.wireTypes.lengthDelimited)
			var2478, var3662 = protoModule.writeBuffer(var2478, var2479, var2476, var2477)
			buff = var2478
			var2472 = var2479
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2480, var2481 = protoModule.writeTag(buff, var2472, 2, protoModule.wireTypes.lengthDelimited)
			var2480, var3664 = protoModule.writeString(var2480, var2481, v)
			buff = var2480
			var2472 = var2481
		end
	end
	local buff_1 = buffer.create(var2472)
	buffer.copy(buff_1, 0, buff, 0, var2472)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2482 = t_88.new()
	local var2483 = 0
	while var2483 < buffer.len(p88) do
		local _ = nil
		local var2484 = nil
		local var2485, var2486, var2487 = protoModule.readTag(p88, var2483)
		local var2488 = var2485
		var2484 = var2486
		var2483 = var2487
		
		if var2484 == protoModule.wireTypes.varint then
			local _ = nil
			local var2489, var2490 = protoModule.readVarInt(p88, var2483)
			local _ = var2489
			var2483 = var2490
			continue
		end
		if var2484 == protoModule.wireTypes.lengthDelimited then
			if var2488 == 1 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p88, var2483)
				var2483 = var2492
				var2491 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2491)
				var2482.entry_map[var2491.key or ""] = var2491.value or t.FeedEntry.new()
			elseif var2488 == 2 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p88, var2483)
				var2483 = var2494
				table.insert(var2482.entry_order, buffer.tostring(var2493))
			else
				local _ = nil
				local var2495, var2496 = protoModule.readVarInt(p88, var2483)
				var2483 = var2496 + var2495
			end
		elseif var2484 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed32(p88, var2483)
			local _ = var2497
			var2483 = var2498
		elseif var2484 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2499, var2500 = protoModule.readFixed64(p88, var2483)
			local _ = var2499
			var2483 = var2500
		else
			error("Unsupported wire type: " .. var3668)
		end
	end
	return var2482
end

function t_88:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	return t
end

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var2501 = t_88.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2501.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2501.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2501.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2501.entry_order = t_1
	end
	return var2501
end

t_88.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_88
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		key = if p89 == nil or p89.key == nil then "" else p89.key,
		value = if p89 == nil or p89.value == nil then nil else p89.value
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2502 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2503, var2504 = protoModule.writeTag(buff, var2502, 1, protoModule.wireTypes.lengthDelimited)
		var2503, var3696 = protoModule.writeString(var2503, var2504, self.key)
		buff = var2503
		var2502 = var2504
	end
	if self.value ~= nil then
		local var2505 = self.value:encode()
		local var2506, var2507 = protoModule.writeTag(buff, var2502, 2, protoModule.wireTypes.lengthDelimited)
		var2506, var3699 = protoModule.writeBuffer(var2506, var2507, var2505, buffer.len(var2505))
		buff = var2506
		var2502 = var2507
	end
	local buff_1 = buffer.create(var2502)
	buffer.copy(buff_1, 0, buff, 0, var2502)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2502 = t_89.new()
	local var2503 = 0
	while var2503 < buffer.len(p89) do
		local _ = nil
		local var2504 = nil
		local var2505, var2506, var2507 = protoModule.readTag(p89, var2503)
		local var2508 = var2505
		var2504 = var2506
		var2503 = var2507
		
		if var2504 == protoModule.wireTypes.varint then
			local _ = nil
			local var2509, var2510 = protoModule.readVarInt(p89, var2503)
			local _ = var2509
			var2503 = var2510
			continue
		end
		if var2504 == protoModule.wireTypes.lengthDelimited then
			if var2508 == 1 then
				local _ = nil
				local var2511, var2512 = protoModule.readBuffer(p89, var2503)
				var2503 = var2512
				var2502.key = buffer.tostring(var2511)
			elseif var2508 == 2 then
				local _ = nil
				local var2513, var2514 = protoModule.readBuffer(p89, var2503)
				var2503 = var2514
				var2502.value = t.FeedEntry.decode(var2513)
			else
				local _ = nil
				local var2515, var2516 = protoModule.readVarInt(p89, var2503)
				var2503 = var2516 + var2515
			end
		elseif var2504 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2517, var2518 = protoModule.readFixed32(p89, var2503)
			local _ = var2517
			var2503 = var2518
		elseif var2504 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2519, var2520 = protoModule.readFixed64(p89, var2503)
			local _ = var2519
			var2503 = var2520
		else
			error("Unsupported wire type: " .. var3703)
		end
	end
	return var2502
end

function t_89:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), t (ref)
	local var2521 = t_89.new()
	
	if self.key ~= nil then
		var2521.key = self.key
	end
	if self.value ~= nil then
		var2521.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2521
end

t_89.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_89
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p90 == nil or p90.marketplace_catalog_category_items == nil then {} else p90.marketplace_catalog_category_items,
		active_category_id = if p90 == nil or p90.active_category_id == nil then "" else p90.active_category_id,
		active_tooltip_idx = if p90 == nil or p90.active_tooltip_idx == nil then 0 else p90.active_tooltip_idx
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2521 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2522 = v:encode()
			local var2523, var2524 = protoModule.writeTag(buff, var2521, 1, protoModule.wireTypes.lengthDelimited)
			var2523, var3726 = protoModule.writeBuffer(var2523, var2524, var2522, buffer.len(var2522))
			buff = var2523
			var2521 = var2524
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2525, var2526 = protoModule.writeTag(buff, var2521, 2, protoModule.wireTypes.lengthDelimited)
		var2525, var3728 = protoModule.writeString(var2525, var2526, self.active_category_id)
		buff = var2525
		var2521 = var2526
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2527, var2528 = protoModule.writeTag(buff, var2521, 3, protoModule.wireTypes.varint)
		var2527, var3730 = protoModule.writeVarInt(var2527, var2528, self.active_tooltip_idx)
		buff = var2527
		var2521 = var2528
	end
	local buff_1 = buffer.create(var2521)
	buffer.copy(buff_1, 0, buff, 0, var2521)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var2529 = t_90.new()
	local var2530 = 0
	while var2530 < buffer.len(p90) do
		local _ = nil
		local var2531 = nil
		local var2532, var2533, var2534 = protoModule.readTag(p90, var2530)
		local var2535 = var2532
		var2531 = var2533
		var2530 = var2534
		
		if var2531 == protoModule.wireTypes.varint then
			if var2535 == 3 then
				local _ = nil
				local var2536, var2537 = protoModule.readVarIntI64(p90, var2530)
				var2530 = var2537
				var2529.active_tooltip_idx = var2536
			else
				local _ = nil
				local var2538, var2539 = protoModule.readVarInt(p90, var2530)
				local _ = var2538
				var2530 = var2539
			end
		end
		if var2531 == protoModule.wireTypes.lengthDelimited then
			if var2535 == 1 then
				local _ = nil
				local var2540, var2541 = protoModule.readBuffer(p90, var2530)
				var2530 = var2541
				table.insert(var2529.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2540))
			elseif var2535 == 2 then
				local _ = nil
				local var2542, var2543 = protoModule.readBuffer(p90, var2530)
				var2530 = var2543
				var2529.active_category_id = buffer.tostring(var2542)
			else
				local _ = nil
				local var2544, var2545 = protoModule.readVarInt(p90, var2530)
				var2530 = var2545 + var2544
			end
		elseif var2531 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2546, var2547 = protoModule.readFixed32(p90, var2530)
			local _ = var2546
			var2530 = var2547
		elseif var2531 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2548, var2549 = protoModule.readFixed64(p90, var2530)
			local _ = var2548
			var2530 = var2549
		else
			error("Unsupported wire type: " .. var3734)
		end
	end
	return var2529
end

function t_90:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.marketplaceCatalogCategoryItems = t_1
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		t.activeCategoryId = self.active_category_id
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		t.activeTooltipIdx = self.active_tooltip_idx
	end
	return t
end

function t_90:jsonDecode()
	-- upvalues: t_90 (ref), t (ref)
	local var2550 = t_90.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2550.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2550.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2550.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2550.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2550.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2550.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2550
end

t_90.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_90
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p91 == nil or p91.marketplace_catalog_category_item_id == nil then "" else p91.marketplace_catalog_category_item_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2551 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2552, var2553 = protoModule.writeTag(buff, var2551, 1, protoModule.wireTypes.lengthDelimited)
		var2552, var3761 = protoModule.writeString(var2552, var2553, self.marketplace_catalog_category_item_id)
		buff = var2552
		var2551 = var2553
	end
	local buff_1 = buffer.create(var2551)
	buffer.copy(buff_1, 0, buff, 0, var2551)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref)
	local var2551 = t_91.new()
	local var2552 = 0
	while var2552 < buffer.len(p91) do
		local _ = nil
		local var2553 = nil
		local var2554, var2555, var2556 = protoModule.readTag(p91, var2552)
		local var2557 = var2554
		var2553 = var2555
		var2552 = var2556
		
		if var2553 == protoModule.wireTypes.varint then
			local _ = nil
			local var2558, var2559 = protoModule.readVarInt(p91, var2552)
			local _ = var2558
			var2552 = var2559
			continue
		end
		if var2553 == protoModule.wireTypes.lengthDelimited then
			if var2557 == 1 then
				local _ = nil
				local var2560, var2561 = protoModule.readBuffer(p91, var2552)
				var2552 = var2561
				var2551.marketplace_catalog_category_item_id = buffer.tostring(var2560)
			else
				local _ = nil
				local var2562, var2563 = protoModule.readVarInt(p91, var2552)
				var2552 = var2563 + var2562
			end
		elseif var2553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2564, var2565 = protoModule.readFixed32(p91, var2552)
			local _ = var2564
			var2552 = var2565
		elseif var2553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2566, var2567 = protoModule.readFixed64(p91, var2552)
			local _ = var2566
			var2552 = var2567
		else
			error("Unsupported wire type: " .. var3765)
		end
	end
	return var2551
end

function t_91:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_91:jsonDecode()
	-- upvalues: t_91 (ref)
	local var2568 = t_91.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2568.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2568.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2568
end

t_91.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_91
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t_92 (ref)
	return setmetatable({
		hero_icon = if p92 == nil or p92.hero_icon == nil then nil else p92.hero_icon,
		body_dismiss_button_text = if p92 == nil or p92.body_dismiss_button_text == nil then "" else p92.body_dismiss_button_text,
		body_title = if p92 == nil or p92.body_title == nil then "" else p92.body_title,
		body_rich_text = if p92 == nil or p92.body_rich_text == nil then "" else p92.body_rich_text,
		terms_link_text = if p92 == nil or p92.terms_link_text == nil then nil else p92.terms_link_text,
		terms_title = if p92 == nil or p92.terms_title == nil then nil else p92.terms_title,
		terms_body_rich_text = if p92 == nil or p92.terms_body_rich_text == nil then nil else p92.terms_body_rich_text,
		terms_dismiss_button_text = if p92 == nil or p92.terms_dismiss_button_text == nil then nil else p92.terms_dismiss_button_text,
		offer_id = if p92 == nil or p92.offer_id == nil then "" else p92.offer_id
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2568 = 0
	
	if self.hero_icon ~= nil then
		local var2569, var2570 = protoModule.writeTag(buff, var2568, 1, protoModule.wireTypes.lengthDelimited)
		var2569, var3785 = protoModule.writeString(var2569, var2570, self.hero_icon)
		buff = var2569
		var2568 = var2570
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2571, var2572 = protoModule.writeTag(buff, var2568, 2, protoModule.wireTypes.lengthDelimited)
		var2571, var3787 = protoModule.writeString(var2571, var2572, self.body_dismiss_button_text)
		buff = var2571
		var2568 = var2572
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2573, var2574 = protoModule.writeTag(buff, var2568, 3, protoModule.wireTypes.lengthDelimited)
		var2573, var3789 = protoModule.writeString(var2573, var2574, self.body_title)
		buff = var2573
		var2568 = var2574
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2575, var2576 = protoModule.writeTag(buff, var2568, 4, protoModule.wireTypes.lengthDelimited)
		var2575, var3791 = protoModule.writeString(var2575, var2576, self.body_rich_text)
		buff = var2575
		var2568 = var2576
	end
	if self.terms_link_text ~= nil then
		local var2577, var2578 = protoModule.writeTag(buff, var2568, 5, protoModule.wireTypes.lengthDelimited)
		var2577, var3793 = protoModule.writeString(var2577, var2578, self.terms_link_text)
		buff = var2577
		var2568 = var2578
	end
	if self.terms_title ~= nil then
		local var2579, var2580 = protoModule.writeTag(buff, var2568, 6, protoModule.wireTypes.lengthDelimited)
		var2579, var3795 = protoModule.writeString(var2579, var2580, self.terms_title)
		buff = var2579
		var2568 = var2580
	end
	if self.terms_body_rich_text ~= nil then
		local var2581, var2582 = protoModule.writeTag(buff, var2568, 7, protoModule.wireTypes.lengthDelimited)
		var2581, var3797 = protoModule.writeString(var2581, var2582, self.terms_body_rich_text)
		buff = var2581
		var2568 = var2582
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2583, var2584 = protoModule.writeTag(buff, var2568, 8, protoModule.wireTypes.lengthDelimited)
		var2583, var3799 = protoModule.writeString(var2583, var2584, self.terms_dismiss_button_text)
		buff = var2583
		var2568 = var2584
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2585, var2586 = protoModule.writeTag(buff, var2568, 9, protoModule.wireTypes.lengthDelimited)
		var2585, var3801 = protoModule.writeString(var2585, var2586, self.offer_id)
		buff = var2585
		var2568 = var2586
	end
	local buff_1 = buffer.create(var2568)
	buffer.copy(buff_1, 0, buff, 0, var2568)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2568 = t_92.new()
	local var2569 = 0
	while var2569 < buffer.len(p92) do
		local _ = nil
		local var2570 = nil
		local var2571, var2572, var2573 = protoModule.readTag(p92, var2569)
		local var2574 = var2571
		var2570 = var2572
		var2569 = var2573
		
		if var2570 == protoModule.wireTypes.varint then
			local _ = nil
			local var2575, var2576 = protoModule.readVarInt(p92, var2569)
			local _ = var2575
			var2569 = var2576
			continue
		end
		if var2570 == protoModule.wireTypes.lengthDelimited then
			if var2574 == 1 then
				local _ = nil
				local var2577, var2578 = protoModule.readBuffer(p92, var2569)
				var2569 = var2578
				var2568.hero_icon = buffer.tostring(var2577)
			elseif var2574 == 2 then
				local _ = nil
				local var2579, var2580 = protoModule.readBuffer(p92, var2569)
				var2569 = var2580
				var2568.body_dismiss_button_text = buffer.tostring(var2579)
			elseif var2574 == 3 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p92, var2569)
				var2569 = var2582
				var2568.body_title = buffer.tostring(var2581)
			elseif var2574 == 4 then
				local _ = nil
				local var2583, var2584 = protoModule.readBuffer(p92, var2569)
				var2569 = var2584
				var2568.body_rich_text = buffer.tostring(var2583)
			elseif var2574 == 5 then
				local _ = nil
				local var2585, var2586 = protoModule.readBuffer(p92, var2569)
				var2569 = var2586
				var2568.terms_link_text = buffer.tostring(var2585)
			elseif var2574 == 6 then
				local _ = nil
				local var2587, var2588 = protoModule.readBuffer(p92, var2569)
				var2569 = var2588
				var2568.terms_title = buffer.tostring(var2587)
			elseif var2574 == 7 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p92, var2569)
				var2569 = var2590
				var2568.terms_body_rich_text = buffer.tostring(var2589)
			elseif var2574 == 8 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p92, var2569)
				var2569 = var2592
				var2568.terms_dismiss_button_text = buffer.tostring(var2591)
			elseif var2574 == 9 then
				local _ = nil
				local var2593, var2594 = protoModule.readBuffer(p92, var2569)
				var2569 = var2594
				var2568.offer_id = buffer.tostring(var2593)
			else
				local _ = nil
				local var2595, var2596 = protoModule.readVarInt(p92, var2569)
				var2569 = var2596 + var2595
			end
		elseif var2570 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2597, var2598 = protoModule.readFixed32(p92, var2569)
			local _ = var2597
			var2569 = var2598
		elseif var2570 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2599, var2600 = protoModule.readFixed64(p92, var2569)
			local _ = var2599
			var2569 = var2600
		else
			error("Unsupported wire type: " .. var3805)
		end
	end
	return var2568
end

function t_92:jsonEncode()
	local t = {}
	
	if self.hero_icon ~= nil then
		t.heroIcon = self.hero_icon
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		t.bodyDismissButtonText = self.body_dismiss_button_text
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		t.bodyTitle = self.body_title
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		t.bodyRichText = self.body_rich_text
	end
	if self.terms_link_text ~= nil then
		t.termsLinkText = self.terms_link_text
	end
	if self.terms_title ~= nil then
		t.termsTitle = self.terms_title
	end
	if self.terms_body_rich_text ~= nil then
		t.termsBodyRichText = self.terms_body_rich_text
	end
	if self.terms_dismiss_button_text ~= nil then
		t.termsDismissButtonText = self.terms_dismiss_button_text
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		t.offerId = self.offer_id
	end
	return t
end

function t_92:jsonDecode()
	-- upvalues: t_92 (ref)
	local var2601 = t_92.new()
	
	if self.hero_icon ~= nil then
		var2601.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2601.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2601.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2601.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2601.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2601.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2601.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2601.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2601.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2601.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2601.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2601.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2601.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2601.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2601.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2601.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2601.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2601.offer_id = self.offerId
	end
	return var2601
end

t_92.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_92
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		item_id = if p93 == nil or p93.item_id == nil then "" else p93.item_id,
		item_type = if p93 == nil or p93.item_type == nil then "" else p93.item_type,
		prefer_three_dimensional = if p93 == nil or p93.prefer_three_dimensional == nil then false else p93.prefer_three_dimensional,
		bundle_type = if p93 == nil or p93.bundle_type == nil then nil else p93.bundle_type,
		bundle_items = if p93 == nil or p93.bundle_items == nil then {} else p93.bundle_items
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2601 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2602, var2603 = protoModule.writeTag(buff, var2601, 1, protoModule.wireTypes.lengthDelimited)
		var2602, var3841 = protoModule.writeString(var2602, var2603, self.item_id)
		buff = var2602
		var2601 = var2603
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2604, var2605 = protoModule.writeTag(buff, var2601, 2, protoModule.wireTypes.lengthDelimited)
		var2604, var3843 = protoModule.writeString(var2604, var2605, self.item_type)
		buff = var2604
		var2601 = var2605
	end
	if self.prefer_three_dimensional then
		local var2606, var2607 = protoModule.writeTag(buff, var2601, 3, protoModule.wireTypes.varint)
		var2606, var3845 = protoModule.writeVarInt(var2606, var2607, if self.prefer_three_dimensional then 1 else 0)
		buff = var2606
		var2601 = var2607
	end
	if self.bundle_type ~= nil then
		local var2608, var2609 = protoModule.writeTag(buff, var2601, 4, protoModule.wireTypes.lengthDelimited)
		var2608, var3847 = protoModule.writeString(var2608, var2609, self.bundle_type)
		buff = var2608
		var2601 = var2609
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2610 = v:encode()
			local var2611, var2612 = protoModule.writeTag(buff, var2601, 5, protoModule.wireTypes.lengthDelimited)
			var2611, var3850 = protoModule.writeBuffer(var2611, var2612, var2610, buffer.len(var2610))
			buff = var2611
			var2601 = var2612
		end
	end
	local buff_1 = buffer.create(var2601)
	buffer.copy(buff_1, 0, buff, 0, var2601)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2613 = t_93.new()
	local var2614 = 0
	while var2614 < buffer.len(p93) do
		local _ = nil
		local var2615 = nil
		local var2616, var2617, var2618 = protoModule.readTag(p93, var2614)
		local var2619 = var2616
		var2615 = var2617
		var2614 = var2618
		
		if var2615 == protoModule.wireTypes.varint then
			if var2619 == 3 then
				local _ = nil
				local var2620, var2621 = protoModule.readVarInt(p93, var2614)
				var2614 = var2621
				var2613.prefer_three_dimensional = var2620 ~= 0
			else
				local _ = nil
				local var2622, var2623 = protoModule.readVarInt(p93, var2614)
				local _ = var2622
				var2614 = var2623
			end
		end
		if var2615 == protoModule.wireTypes.lengthDelimited then
			if var2619 == 1 then
				local _ = nil
				local var2624, var2625 = protoModule.readBuffer(p93, var2614)
				var2614 = var2625
				var2613.item_id = buffer.tostring(var2624)
			elseif var2619 == 2 then
				local _ = nil
				local var2626, var2627 = protoModule.readBuffer(p93, var2614)
				var2614 = var2627
				var2613.item_type = buffer.tostring(var2626)
			elseif var2619 == 4 then
				local _ = nil
				local var2628, var2629 = protoModule.readBuffer(p93, var2614)
				var2614 = var2629
				var2613.bundle_type = buffer.tostring(var2628)
			elseif var2619 == 5 then
				local _ = nil
				local var2630, var2631 = protoModule.readBuffer(p93, var2614)
				var2614 = var2631
				table.insert(var2613.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2630))
			else
				local _ = nil
				local var2632, var2633 = protoModule.readVarInt(p93, var2614)
				var2614 = var2633 + var2632
			end
		elseif var2615 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2634, var2635 = protoModule.readFixed32(p93, var2614)
			local _ = var2634
			var2614 = var2635
		elseif var2615 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2636, var2637 = protoModule.readFixed64(p93, var2614)
			local _ = var2636
			var2614 = var2637
		else
			error("Unsupported wire type: " .. var3854)
		end
	end
	return var2613
end

function t_93:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	if self.prefer_three_dimensional then
		t.preferThreeDimensional = self.prefer_three_dimensional
	end
	if self.bundle_type ~= nil then
		t.bundleType = self.bundle_type
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.bundleItems = t_1
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var2638 = t_93.new()
	
	if self.item_id ~= nil then
		var2638.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2638.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2638.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2638.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2638.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2638.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2638.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2638.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2638.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2638.bundle_items = t_1
	end
	return var2638
end

t_93.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceItemMediaHeaderInputData"
}
t.MarketplaceItemMediaHeaderInputData = t_93
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		id = if p94 == nil or p94.id == nil then "" else p94.id,
		type = if p94 == nil or p94.type == nil then "" else p94.type
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2639 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2640, var2641 = protoModule.writeTag(buff, var2639, 1, protoModule.wireTypes.lengthDelimited)
		var2640, var3885 = protoModule.writeString(var2640, var2641, self.id)
		buff = var2640
		var2639 = var2641
	end
	if self.type ~= nil and self.type ~= "" then
		local var2642, var2643 = protoModule.writeTag(buff, var2639, 2, protoModule.wireTypes.lengthDelimited)
		var2642, var3887 = protoModule.writeString(var2642, var2643, self.type)
		buff = var2642
		var2639 = var2643
	end
	local buff_1 = buffer.create(var2639)
	buffer.copy(buff_1, 0, buff, 0, var2639)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2639 = t_94.new()
	local var2640 = 0
	while var2640 < buffer.len(p94) do
		local _ = nil
		local var2641 = nil
		local var2642, var2643, var2644 = protoModule.readTag(p94, var2640)
		local var2645 = var2642
		var2641 = var2643
		var2640 = var2644
		
		if var2641 == protoModule.wireTypes.varint then
			local _ = nil
			local var2646, var2647 = protoModule.readVarInt(p94, var2640)
			local _ = var2646
			var2640 = var2647
			continue
		end
		if var2641 == protoModule.wireTypes.lengthDelimited then
			if var2645 == 1 then
				local _ = nil
				local var2648, var2649 = protoModule.readBuffer(p94, var2640)
				var2640 = var2649
				var2639.id = buffer.tostring(var2648)
			elseif var2645 == 2 then
				local _ = nil
				local var2650, var2651 = protoModule.readBuffer(p94, var2640)
				var2640 = var2651
				var2639.type = buffer.tostring(var2650)
			else
				local _ = nil
				local var2652, var2653 = protoModule.readVarInt(p94, var2640)
				var2640 = var2653 + var2652
			end
		elseif var2641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2654, var2655 = protoModule.readFixed32(p94, var2640)
			local _ = var2654
			var2640 = var2655
		elseif var2641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2656, var2657 = protoModule.readFixed64(p94, var2640)
			local _ = var2656
			var2640 = var2657
		else
			error("Unsupported wire type: " .. var3891)
		end
	end
	return var2639
end

function t_94:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref)
	local var2658 = t_94.new()
	
	if self.id ~= nil then
		var2658.id = self.id
	end
	if self.type ~= nil then
		var2658.type = self.type
	end
	return var2658
end

t_94.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData_BundleItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.BundleItem"
}
t.MarketplaceItemMediaHeaderInputData_BundleItem = t_94
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData_BundleItem)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		items = if p95 == nil or p95.items == nil then {} else p95.items,
		preview_columns = if p95 == nil or p95.preview_columns == nil then 0 else p95.preview_columns,
		impression_id = if p95 == nil or p95.impression_id == nil then "" else p95.impression_id
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2658 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2659 = v:encode()
			local var2660, var2661 = protoModule.writeTag(buff, var2658, 1, protoModule.wireTypes.lengthDelimited)
			var2660, var3914 = protoModule.writeBuffer(var2660, var2661, var2659, buffer.len(var2659))
			buff = var2660
			var2658 = var2661
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2662, var2663 = protoModule.writeTag(buff, var2658, 2, protoModule.wireTypes.varint)
		var2662, var3916 = protoModule.writeVarInt(var2662, var2663, self.preview_columns)
		buff = var2662
		var2658 = var2663
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2664, var2665 = protoModule.writeTag(buff, var2658, 3, protoModule.wireTypes.lengthDelimited)
		var2664, var3918 = protoModule.writeString(var2664, var2665, self.impression_id)
		buff = var2664
		var2658 = var2665
	end
	local buff_1 = buffer.create(var2658)
	buffer.copy(buff_1, 0, buff, 0, var2658)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2666 = t_95.new()
	local var2667 = 0
	while var2667 < buffer.len(p95) do
		local _ = nil
		local var2668 = nil
		local var2669, var2670, var2671 = protoModule.readTag(p95, var2667)
		local var2672 = var2669
		var2668 = var2670
		var2667 = var2671
		
		if var2668 == protoModule.wireTypes.varint then
			if var2672 == 2 then
				local _ = nil
				local var2673, var2674 = protoModule.readVarIntI32(p95, var2667)
				var2667 = var2674
				var2666.preview_columns = var2673
			else
				local _ = nil
				local var2675, var2676 = protoModule.readVarInt(p95, var2667)
				local _ = var2675
				var2667 = var2676
			end
		end
		if var2668 == protoModule.wireTypes.lengthDelimited then
			if var2672 == 1 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p95, var2667)
				var2667 = var2678
				table.insert(var2666.items, t.CatalogItemGridInputData_CatalogItem.decode(var2677))
			elseif var2672 == 3 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p95, var2667)
				var2667 = var2680
				var2666.impression_id = buffer.tostring(var2679)
			else
				local _ = nil
				local var2681, var2682 = protoModule.readVarInt(p95, var2667)
				var2667 = var2682 + var2681
			end
		elseif var2668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2683, var2684 = protoModule.readFixed32(p95, var2667)
			local _ = var2683
			var2667 = var2684
		elseif var2668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2685, var2686 = protoModule.readFixed64(p95, var2667)
			local _ = var2685
			var2667 = var2686
		else
			error("Unsupported wire type: " .. var3922)
		end
	end
	return var2666
end

function t_95:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		t.previewColumns = self.preview_columns
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		t.impressionId = self.impression_id
	end
	return t
end

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), t (ref)
	local var2687 = t_95.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2687.items = t_1
	end
	if self.preview_columns ~= nil then
		var2687.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2687.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2687.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2687.impression_id = self.impressionId
	end
	return var2687
end

t_95.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_95
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		id = if p96 == nil or p96.id == nil then "" else p96.id,
		type = if p96 == nil or p96.type == nil then "" else p96.type
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2688 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2689, var2690 = protoModule.writeTag(buff, var2688, 1, protoModule.wireTypes.lengthDelimited)
		var2689, var3948 = protoModule.writeString(var2689, var2690, self.id)
		buff = var2689
		var2688 = var2690
	end
	if self.type ~= nil and self.type ~= "" then
		local var2691, var2692 = protoModule.writeTag(buff, var2688, 2, protoModule.wireTypes.lengthDelimited)
		var2691, var3950 = protoModule.writeString(var2691, var2692, self.type)
		buff = var2691
		var2688 = var2692
	end
	local buff_1 = buffer.create(var2688)
	buffer.copy(buff_1, 0, buff, 0, var2688)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2688 = t_96.new()
	local var2689 = 0
	while var2689 < buffer.len(p96) do
		local _ = nil
		local var2690 = nil
		local var2691, var2692, var2693 = protoModule.readTag(p96, var2689)
		local var2694 = var2691
		var2690 = var2692
		var2689 = var2693
		
		if var2690 == protoModule.wireTypes.varint then
			local _ = nil
			local var2695, var2696 = protoModule.readVarInt(p96, var2689)
			local _ = var2695
			var2689 = var2696
			continue
		end
		if var2690 == protoModule.wireTypes.lengthDelimited then
			if var2694 == 1 then
				local _ = nil
				local var2697, var2698 = protoModule.readBuffer(p96, var2689)
				var2689 = var2698
				var2688.id = buffer.tostring(var2697)
			elseif var2694 == 2 then
				local _ = nil
				local var2699, var2700 = protoModule.readBuffer(p96, var2689)
				var2689 = var2700
				var2688.type = buffer.tostring(var2699)
			else
				local _ = nil
				local var2701, var2702 = protoModule.readVarInt(p96, var2689)
				var2689 = var2702 + var2701
			end
		elseif var2690 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2703, var2704 = protoModule.readFixed32(p96, var2689)
			local _ = var2703
			var2689 = var2704
		elseif var2690 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2705, var2706 = protoModule.readFixed64(p96, var2689)
			local _ = var2705
			var2689 = var2706
		else
			error("Unsupported wire type: " .. var3954)
		end
	end
	return var2688
end

function t_96:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_96:jsonDecode()
	-- upvalues: t_96 (ref)
	local var2707 = t_96.new()
	
	if self.id ~= nil then
		var2707.id = self.id
	end
	if self.type ~= nil then
		var2707.type = self.type
	end
	return var2707
end

t_96.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_96
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		entry_map = if p97 == nil or p97.entry_map == nil then {} else p97.entry_map,
		entry_order = if p97 == nil or p97.entry_order == nil then {} else p97.entry_order,
		content_pools = if p97 == nil or p97.content_pools == nil then {} else p97.content_pools,
		search_session_id = if p97 == nil or p97.search_session_id == nil then "" else p97.search_session_id,
		search_query = if p97 == nil or p97.search_query == nil then "" else p97.search_query
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2707 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2708, var2709 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2708, var3976 = protoModule.writeString(var2708, var2709, i)
			local var2710 = v:encode()
			var2709, var3978 = protoModule.writeTag(var2708, var2709, 2, protoModule.wireTypes.lengthDelimited)
			var2709, var3978 = protoModule.writeBuffer(var2709, var3978, var2710, buffer.len(var2710))
			local var2711 = var2709
			local var2712 = var3978
			local var2713, var2714 = protoModule.writeTag(buff, var2707, 1, protoModule.wireTypes.lengthDelimited)
			var2713, var3982 = protoModule.writeBuffer(var2713, var2714, var2711, var2712)
			buff = var2713
			var2707 = var2714
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2715, var2716 = protoModule.writeTag(buff, var2707, 2, protoModule.wireTypes.lengthDelimited)
			var2715, var3984 = protoModule.writeString(var2715, var2716, v)
			buff = var2715
			var2707 = var2716
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2717, var2718 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2717, var3986 = protoModule.writeString(var2717, var2718, i)
			local var2719 = v:encode()
			var2718, var3988 = protoModule.writeTag(var2717, var2718, 2, protoModule.wireTypes.lengthDelimited)
			var2718, var3988 = protoModule.writeBuffer(var2718, var3988, var2719, buffer.len(var2719))
			local var2720 = var2718
			local var2721 = var3988
			local var2722, var2723 = protoModule.writeTag(buff, var2707, 3, protoModule.wireTypes.lengthDelimited)
			var2722, var3992 = protoModule.writeBuffer(var2722, var2723, var2720, var2721)
			buff = var2722
			var2707 = var2723
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2724, var2725 = protoModule.writeTag(buff, var2707, 4, protoModule.wireTypes.lengthDelimited)
		var2724, var3994 = protoModule.writeString(var2724, var2725, self.search_session_id)
		buff = var2724
		var2707 = var2725
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2726, var2727 = protoModule.writeTag(buff, var2707, 5, protoModule.wireTypes.lengthDelimited)
		var2726, var3996 = protoModule.writeString(var2726, var2727, self.search_query)
		buff = var2726
		var2707 = var2727
	end
	local buff_1 = buffer.create(var2707)
	buffer.copy(buff_1, 0, buff, 0, var2707)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2728 = t_97.new()
	local var2729 = 0
	while var2729 < buffer.len(p97) do
		local _ = nil
		local var2730 = nil
		local var2731, var2732, var2733 = protoModule.readTag(p97, var2729)
		local var2734 = var2731
		var2730 = var2732
		var2729 = var2733
		
		if var2730 == protoModule.wireTypes.varint then
			local _ = nil
			local var2735, var2736 = protoModule.readVarInt(p97, var2729)
			local _ = var2735
			var2729 = var2736
			continue
		end
		if var2730 == protoModule.wireTypes.lengthDelimited then
			if var2734 == 1 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p97, var2729)
				var2729 = var2738
				var2737 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2737)
				var2728.entry_map[var2737.key or ""] = var2737.value or t.FeedEntry.new()
			elseif var2734 == 2 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p97, var2729)
				var2729 = var2740
				table.insert(var2728.entry_order, buffer.tostring(var2739))
			elseif var2734 == 3 then
				local _ = nil
				local var2741, var2742 = protoModule.readBuffer(p97, var2729)
				var2729 = var2742
				var2741 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2741)
				var2728.content_pools[var2741.key or ""] = var2741.value or t.ContentPool.new()
			elseif var2734 == 4 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p97, var2729)
				var2729 = var2744
				var2728.search_session_id = buffer.tostring(var2743)
			elseif var2734 == 5 then
				local _ = nil
				local var2745, var2746 = protoModule.readBuffer(p97, var2729)
				var2729 = var2746
				var2728.search_query = buffer.tostring(var2745)
			else
				local _ = nil
				local var2747, var2748 = protoModule.readVarInt(p97, var2729)
				var2729 = var2748 + var2747
			end
		elseif var2730 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2749, var2750 = protoModule.readFixed32(p97, var2729)
			local _ = var2749
			var2729 = var2750
		elseif var2730 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2751, var2752 = protoModule.readFixed64(p97, var2729)
			local _ = var2751
			var2729 = var2752
		else
			error("Unsupported wire type: " .. var4000)
		end
	end
	return var2728
end

function t_97:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = v:jsonEncode()
		end
		t.contentPools = t_1
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		t.searchSessionId = self.search_session_id
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		t.searchQuery = self.search_query
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref), t (ref)
	local var2753 = t_97.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2753.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2753.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2753.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2753.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2753.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2753.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2753.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2753.search_session_id = self.searchSessionId
	end
	if self.search_query ~= nil then
		var2753.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2753.search_query = self.searchQuery
	end
	return var2753
end

t_97.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_97
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t_98 (ref)
	return setmetatable({
		key = if p98 == nil or p98.key == nil then "" else p98.key,
		value = if p98 == nil or p98.value == nil then nil else p98.value
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2754 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2755, var2756 = protoModule.writeTag(buff, var2754, 1, protoModule.wireTypes.lengthDelimited)
		var2755, var4037 = protoModule.writeString(var2755, var2756, self.key)
		buff = var2755
		var2754 = var2756
	end
	if self.value ~= nil then
		local var2757 = self.value:encode()
		local var2758, var2759 = protoModule.writeTag(buff, var2754, 2, protoModule.wireTypes.lengthDelimited)
		var2758, var4040 = protoModule.writeBuffer(var2758, var2759, var2757, buffer.len(var2757))
		buff = var2758
		var2754 = var2759
	end
	local buff_1 = buffer.create(var2754)
	buffer.copy(buff_1, 0, buff, 0, var2754)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2754 = t_98.new()
	local var2755 = 0
	while var2755 < buffer.len(p98) do
		local _ = nil
		local var2756 = nil
		local var2757, var2758, var2759 = protoModule.readTag(p98, var2755)
		local var2760 = var2757
		var2756 = var2758
		var2755 = var2759
		
		if var2756 == protoModule.wireTypes.varint then
			local _ = nil
			local var2761, var2762 = protoModule.readVarInt(p98, var2755)
			local _ = var2761
			var2755 = var2762
			continue
		end
		if var2756 == protoModule.wireTypes.lengthDelimited then
			if var2760 == 1 then
				local _ = nil
				local var2763, var2764 = protoModule.readBuffer(p98, var2755)
				var2755 = var2764
				var2754.key = buffer.tostring(var2763)
			elseif var2760 == 2 then
				local _ = nil
				local var2765, var2766 = protoModule.readBuffer(p98, var2755)
				var2755 = var2766
				var2754.value = t.FeedEntry.decode(var2765)
			else
				local _ = nil
				local var2767, var2768 = protoModule.readVarInt(p98, var2755)
				var2755 = var2768 + var2767
			end
		elseif var2756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2769, var2770 = protoModule.readFixed32(p98, var2755)
			local _ = var2769
			var2755 = var2770
		elseif var2756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2771, var2772 = protoModule.readFixed64(p98, var2755)
			local _ = var2771
			var2755 = var2772
		else
			error("Unsupported wire type: " .. var4044)
		end
	end
	return var2754
end

function t_98:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var2773 = t_98.new()
	
	if self.key ~= nil then
		var2773.key = self.key
	end
	if self.value ~= nil then
		var2773.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2773
end

t_98.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_98
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		key = if p99 == nil or p99.key == nil then "" else p99.key,
		value = if p99 == nil or p99.value == nil then nil else p99.value
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2773 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2774, var2775 = protoModule.writeTag(buff, var2773, 1, protoModule.wireTypes.lengthDelimited)
		var2774, var4066 = protoModule.writeString(var2774, var2775, self.key)
		buff = var2774
		var2773 = var2775
	end
	if self.value ~= nil then
		local var2776 = self.value:encode()
		local var2777, var2778 = protoModule.writeTag(buff, var2773, 2, protoModule.wireTypes.lengthDelimited)
		var2777, var4069 = protoModule.writeBuffer(var2777, var2778, var2776, buffer.len(var2776))
		buff = var2777
		var2773 = var2778
	end
	local buff_1 = buffer.create(var2773)
	buffer.copy(buff_1, 0, buff, 0, var2773)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), t (ref)
	local var2773 = t_99.new()
	local var2774 = 0
	while var2774 < buffer.len(p99) do
		local _ = nil
		local var2775 = nil
		local var2776, var2777, var2778 = protoModule.readTag(p99, var2774)
		local var2779 = var2776
		var2775 = var2777
		var2774 = var2778
		
		if var2775 == protoModule.wireTypes.varint then
			local _ = nil
			local var2780, var2781 = protoModule.readVarInt(p99, var2774)
			local _ = var2780
			var2774 = var2781
			continue
		end
		if var2775 == protoModule.wireTypes.lengthDelimited then
			if var2779 == 1 then
				local _ = nil
				local var2782, var2783 = protoModule.readBuffer(p99, var2774)
				var2774 = var2783
				var2773.key = buffer.tostring(var2782)
			elseif var2779 == 2 then
				local _ = nil
				local var2784, var2785 = protoModule.readBuffer(p99, var2774)
				var2774 = var2785
				var2773.value = t.ContentPool.decode(var2784)
			else
				local _ = nil
				local var2786, var2787 = protoModule.readVarInt(p99, var2774)
				var2774 = var2787 + var2786
			end
		elseif var2775 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2788, var2789 = protoModule.readFixed32(p99, var2774)
			local _ = var2788
			var2774 = var2789
		elseif var2775 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2790, var2791 = protoModule.readFixed64(p99, var2774)
			local _ = var2790
			var2774 = var2791
		else
			error("Unsupported wire type: " .. var4073)
		end
	end
	return var2773
end

function t_99:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref), t (ref)
	local var2792 = t_99.new()
	
	if self.key ~= nil then
		var2792.key = self.key
	end
	if self.value ~= nil then
		var2792.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2792
end

t_99.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_99
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t_100 (ref)
	return setmetatable({
		prefix = if p100 == nil or p100.prefix == nil then "" else p100.prefix,
		algorithm_name = if p100 == nil or p100.algorithm_name == nil then "" else p100.algorithm_name,
		max_results = if p100 == nil or p100.max_results == nil then 0 else p100.max_results,
		suggestions = if p100 == nil or p100.suggestions == nil then {} else p100.suggestions
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2792 = 0
	
	if self.prefix ~= nil and self.prefix ~= "" then
		local var2793, var2794 = protoModule.writeTag(buff, var2792, 1, protoModule.wireTypes.lengthDelimited)
		var2793, var4095 = protoModule.writeString(var2793, var2794, self.prefix)
		buff = var2793
		var2792 = var2794
	end
	if self.algorithm_name ~= nil and self.algorithm_name ~= "" then
		local var2795, var2796 = protoModule.writeTag(buff, var2792, 2, protoModule.wireTypes.lengthDelimited)
		var2795, var4097 = protoModule.writeString(var2795, var2796, self.algorithm_name)
		buff = var2795
		var2792 = var2796
	end
	if self.max_results ~= nil and self.max_results ~= 0 then
		local var2797, var2798 = protoModule.writeTag(buff, var2792, 3, protoModule.wireTypes.varint)
		var2797, var4099 = protoModule.writeVarInt(var2797, var2798, self.max_results)
		buff = var2797
		var2792 = var2798
	end
	if self.suggestions ~= nil and #self.suggestions > 0 then
		for i, v in self.suggestions do
			local var2799 = v:encode()
			local var2800, var2801 = protoModule.writeTag(buff, var2792, 4, protoModule.wireTypes.lengthDelimited)
			var2800, var4102 = protoModule.writeBuffer(var2800, var2801, var2799, buffer.len(var2799))
			buff = var2800
			var2792 = var2801
		end
	end
	local buff_1 = buffer.create(var2792)
	buffer.copy(buff_1, 0, buff, 0, var2792)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2802 = t_100.new()
	local var2803 = 0
	while var2803 < buffer.len(p100) do
		local _ = nil
		local var2804 = nil
		local var2805, var2806, var2807 = protoModule.readTag(p100, var2803)
		local var2808 = var2805
		var2804 = var2806
		var2803 = var2807
		
		if var2804 == protoModule.wireTypes.varint then
			if var2808 == 3 then
				local _ = nil
				local var2809, var2810 = protoModule.readVarIntU32(p100, var2803)
				var2803 = var2810
				var2802.max_results = var2809
			else
				local _ = nil
				local var2811, var2812 = protoModule.readVarInt(p100, var2803)
				local _ = var2811
				var2803 = var2812
			end
		end
		if var2804 == protoModule.wireTypes.lengthDelimited then
			if var2808 == 1 then
				local _ = nil
				local var2813, var2814 = protoModule.readBuffer(p100, var2803)
				var2803 = var2814
				var2802.prefix = buffer.tostring(var2813)
			elseif var2808 == 2 then
				local _ = nil
				local var2815, var2816 = protoModule.readBuffer(p100, var2803)
				var2803 = var2816
				var2802.algorithm_name = buffer.tostring(var2815)
			elseif var2808 == 4 then
				local _ = nil
				local var2817, var2818 = protoModule.readBuffer(p100, var2803)
				var2803 = var2818
				table.insert(var2802.suggestions, t.SearchAutocompleteInputData_Suggestion.decode(var2817))
			else
				local _ = nil
				local var2819, var2820 = protoModule.readVarInt(p100, var2803)
				var2803 = var2820 + var2819
			end
		elseif var2804 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2821, var2822 = protoModule.readFixed32(p100, var2803)
			local _ = var2821
			var2803 = var2822
		elseif var2804 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2823, var2824 = protoModule.readFixed64(p100, var2803)
			local _ = var2823
			var2803 = var2824
		else
			error("Unsupported wire type: " .. var4106)
		end
	end
	return var2802
end

function t_100:jsonEncode()
	local t = {}
	
	if self.prefix ~= nil and self.prefix ~= "" then
		t.prefix = self.prefix
	end
	if self.algorithm_name ~= nil and self.algorithm_name ~= "" then
		t.algorithmName = self.algorithm_name
	end
	if self.max_results ~= nil and self.max_results ~= 0 then
		t.maxResults = self.max_results
	end
	if self.suggestions ~= nil and #self.suggestions > 0 then
		local t_1 = {}
		
		for i, v in self.suggestions do
			table.insert(t_1, v:jsonEncode())
		end
		t.suggestions = t_1
	end
	return t
end

function t_100:jsonDecode()
	-- upvalues: t_100 (ref), t (ref)
	local var2825 = t_100.new()
	
	if self.prefix ~= nil then
		var2825.prefix = self.prefix
	end
	if self.algorithm_name ~= nil then
		var2825.algorithm_name = self.algorithm_name
	end
	if self.algorithmName ~= nil then
		var2825.algorithm_name = self.algorithmName
	end
	if self.max_results ~= nil then
		var2825.max_results = self.max_results
	end
	if self.maxResults ~= nil then
		var2825.max_results = self.maxResults
	end
	if self.suggestions ~= nil then
		local t_1 = {}
		
		for i, v in self.suggestions do
			table.insert(t_1, t.SearchAutocompleteInputData_Suggestion.jsonDecode(v))
		end
		var2825.suggestions = t_1
	end
	return var2825
end

t_100.descriptor = {
	name = "SearchAutocompleteInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchAutocompleteInputData"
}
t.SearchAutocompleteInputData = t_100
typeRegistryModule.default:register(t.SearchAutocompleteInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t (ref), t_101 (ref)
	return setmetatable({
		search_query = if p101 == nil or p101.search_query == nil then "" else p101.search_query,
		suggestion_type = if p101 == nil or p101.suggestion_type == nil then assert(t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0), "Enum has no 0 default") else p101.suggestion_type,
		score = if p101 == nil or p101.score == nil then 0 else p101.score,
		position = if p101 == nil or p101.position == nil then 0 else p101.position,
		canonical_title = if p101 == nil or p101.canonical_title == nil then "" else p101.canonical_title,
		universe_id = if p101 == nil or p101.universe_id == nil then "" else p101.universe_id
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2826 = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2827, var2828 = protoModule.writeTag(buff, var2826, 1, protoModule.wireTypes.lengthDelimited)
		var2827, var4134 = protoModule.writeString(var2827, var2828, self.search_query)
		buff = var2827
		var2826 = var2828
	end
	if self.suggestion_type ~= nil and (self.suggestion_type ~= nil and self.suggestion_type ~= 0 or self.suggestion_type ~= t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0)) then
		local var2829, var2830 = protoModule.writeTag(buff, var2826, 2, protoModule.wireTypes.varint)
		var2829, var4136 = protoModule.writeVarInt(var2829, var2830, t.SearchAutocompleteInputData_Suggestion_SuggestionType.toNumber(self.suggestion_type))
		buff = var2829
		var2826 = var2830
	end
	if self.score ~= nil and self.score ~= 0 then
		local var2831, var2832 = protoModule.writeTag(buff, var2826, 3, protoModule.wireTypes.i64)
		var2831, var4138 = protoModule.writeDouble(var2831, var2832, self.score)
		buff = var2831
		var2826 = var2832
	end
	if self.position ~= nil and self.position ~= 0 then
		local var2833, var2834 = protoModule.writeTag(buff, var2826, 4, protoModule.wireTypes.varint)
		var2833, var4140 = protoModule.writeVarInt(var2833, var2834, self.position)
		buff = var2833
		var2826 = var2834
	end
	if self.canonical_title ~= nil and self.canonical_title ~= "" then
		local var2835, var2836 = protoModule.writeTag(buff, var2826, 5, protoModule.wireTypes.lengthDelimited)
		var2835, var4142 = protoModule.writeString(var2835, var2836, self.canonical_title)
		buff = var2835
		var2826 = var2836
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2837, var2838 = protoModule.writeTag(buff, var2826, 6, protoModule.wireTypes.lengthDelimited)
		var2837, var4144 = protoModule.writeString(var2837, var2838, self.universe_id)
		buff = var2837
		var2826 = var2838
	end
	local buff_1 = buffer.create(var2826)
	buffer.copy(buff_1, 0, buff, 0, var2826)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2826 = t_101.new()
	local var2827 = 0
	while var2827 < buffer.len(p101) do
		local _ = nil
		local var2828 = nil
		local var2829, var2830, var2831 = protoModule.readTag(p101, var2827)
		local var2832 = var2829
		var2828 = var2830
		var2827 = var2831
		
		if var2828 == protoModule.wireTypes.varint then
			if var2832 == 2 then
				local _ = nil
				local var2833, var2834 = protoModule.readVarIntI32(p101, var2827)
				local var2835 = var2833
				var2827 = var2834
				var2826.suggestion_type = t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(var2835) or var2835
			elseif var2832 == 4 then
				local _ = nil
				local var2836, var2837 = protoModule.readVarIntU32(p101, var2827)
				var2827 = var2837
				var2826.position = var2836
			else
				local _ = nil
				local var2838, var2839 = protoModule.readVarInt(p101, var2827)
				local _ = var2838
				var2827 = var2839
			end
		end
		if var2828 == protoModule.wireTypes.lengthDelimited then
			if var2832 == 1 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p101, var2827)
				var2827 = var2841
				var2826.search_query = buffer.tostring(var2840)
			elseif var2832 == 5 then
				local _ = nil
				local var2842, var2843 = protoModule.readBuffer(p101, var2827)
				var2827 = var2843
				var2826.canonical_title = buffer.tostring(var2842)
			elseif var2832 == 6 then
				local _ = nil
				local var2844, var2845 = protoModule.readBuffer(p101, var2827)
				var2827 = var2845
				var2826.universe_id = buffer.tostring(var2844)
			else
				local _ = nil
				local var2846, var2847 = protoModule.readVarInt(p101, var2827)
				var2827 = var2847 + var2846
			end
		elseif var2828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2848, var2849 = protoModule.readFixed32(p101, var2827)
			local _ = var2848
			var2827 = var2849
		elseif var2828 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4148)
		elseif var2832 == 3 then
			local _ = nil
			local var2850, var2851 = protoModule.readDouble(p101, var2827)
			var2827 = var2851
			var2826.score = var2850
		else
			local _ = nil
			local var2852, var2853 = protoModule.readFixed64(p101, var2827)
			local _ = var2852
			var2827 = var2853
		end
	end
	return var2826
end

function t_101:jsonEncode()
	-- upvalues: t (ref), protoModule (ref)
	local t_1 = {}
	
	if self.search_query ~= nil and self.search_query ~= "" then
		t_1.searchQuery = self.search_query
	end
	if self.suggestion_type ~= nil and (self.suggestion_type ~= nil and self.suggestion_type ~= 0 or self.suggestion_type ~= t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0)) then
		t_1.suggestionType = if typeof(self.suggestion_type) == "number" then self.suggestion_type else t.SearchAutocompleteInputData_Suggestion_SuggestionType.toNumber(self.suggestion_type)
	end
	if self.score ~= nil and self.score ~= 0 then
		t_1.score = protoModule.json.serializeNumber(self.score)
	end
	if self.position ~= nil and self.position ~= 0 then
		t_1.position = self.position
	end
	if self.canonical_title ~= nil and self.canonical_title ~= "" then
		t_1.canonicalTitle = self.canonical_title
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t_1.universeId = self.universe_id
	end
	return t_1
end

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref), protoModule (ref)
	local var2854 = t_101.new()
	
	if self.search_query ~= nil then
		var2854.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2854.search_query = self.searchQuery
	end
	if self.suggestion_type ~= nil then
		var2854.suggestion_type = if typeof(self.suggestion_type) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestion_type) or self.suggestion_type else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestion_type) or self.suggestion_type
	end
	if self.suggestionType ~= nil then
		var2854.suggestion_type = if typeof(self.suggestionType) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestionType) or self.suggestionType else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestionType) or self.suggestionType
	end
	if self.score ~= nil then
		var2854.score = protoModule.json.deserializeNumber(self.score)
	end
	if self.position ~= nil then
		var2854.position = self.position
	end
	if self.canonical_title ~= nil then
		var2854.canonical_title = self.canonical_title
	end
	if self.canonicalTitle ~= nil then
		var2854.canonical_title = self.canonicalTitle
	end
	if self.universe_id ~= nil then
		var2854.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2854.universe_id = self.universeId
	end
	return var2854
end

t_101.descriptor = {
	name = "SearchAutocompleteInputData_Suggestion",
	fullName = "roblox.apppageplatform.shared.v1beta1.Suggestion"
}
t.SearchAutocompleteInputData_Suggestion = t_101
typeRegistryModule.default:register(t.SearchAutocompleteInputData_Suggestion)
t.SearchAutocompleteInputData_Suggestion_SuggestionType = {
	fromNumber = function(p102)
		return if p102 == 0 then "SUGGESTION_TYPE_INVALID" elseif p102 == 1 then "SUGGESTION_TYPE_QUERY" elseif p102 == 2 then "SUGGESTION_TYPE_RICH" elseif p102 == 3 then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end,
	toNumber = function(p102)
		return if p102 == "SUGGESTION_TYPE_INVALID" then 0 elseif p102 == "SUGGESTION_TYPE_QUERY" then 1 elseif p102 == "SUGGESTION_TYPE_RICH" then 2 elseif p102 == "SUGGESTION_TYPE_TRENDING_QUERY" then 3 else p102
	end,
	fromName = function(p102)
		return if p102 == "SUGGESTION_TYPE_INVALID" then "SUGGESTION_TYPE_INVALID" elseif p102 == "SUGGESTION_TYPE_QUERY" then "SUGGESTION_TYPE_QUERY" elseif p102 == "SUGGESTION_TYPE_RICH" then "SUGGESTION_TYPE_RICH" elseif p102 == "SUGGESTION_TYPE_TRENDING_QUERY" then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end
}
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		universe_id = if p102 == nil or p102.universe_id == nil then "" else p102.universe_id,
		is_content_locked = if p102 == nil or p102.is_content_locked == nil then false else p102.is_content_locked
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2854 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2855, var2856 = protoModule.writeTag(buff, var2854, 1, protoModule.wireTypes.lengthDelimited)
		var2855, var4179 = protoModule.writeString(var2855, var2856, self.universe_id)
		buff = var2855
		var2854 = var2856
	end
	if self.is_content_locked then
		local var2857, var2858 = protoModule.writeTag(buff, var2854, 2, protoModule.wireTypes.varint)
		var2857, var4181 = protoModule.writeVarInt(var2857, var2858, if self.is_content_locked then 1 else 0)
		buff = var2857
		var2854 = var2858
	end
	local buff_1 = buffer.create(var2854)
	buffer.copy(buff_1, 0, buff, 0, var2854)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2854 = t_102.new()
	local var2855 = 0
	while var2855 < buffer.len(p102) do
		local _ = nil
		local var2856 = nil
		local var2857, var2858, var2859 = protoModule.readTag(p102, var2855)
		local var2860 = var2857
		var2856 = var2858
		var2855 = var2859
		
		if var2856 == protoModule.wireTypes.varint then
			if var2860 == 2 then
				local _ = nil
				local var2861, var2862 = protoModule.readVarInt(p102, var2855)
				var2855 = var2862
				var2854.is_content_locked = var2861 ~= 0
			else
				local _ = nil
				local var2863, var2864 = protoModule.readVarInt(p102, var2855)
				local _ = var2863
				var2855 = var2864
			end
		end
		if var2856 == protoModule.wireTypes.lengthDelimited then
			if var2860 == 1 then
				local _ = nil
				local var2865, var2866 = protoModule.readBuffer(p102, var2855)
				var2855 = var2866
				var2854.universe_id = buffer.tostring(var2865)
			else
				local _ = nil
				local var2867, var2868 = protoModule.readVarInt(p102, var2855)
				var2855 = var2868 + var2867
			end
		elseif var2856 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2869, var2870 = protoModule.readFixed32(p102, var2855)
			local _ = var2869
			var2855 = var2870
		elseif var2856 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2871, var2872 = protoModule.readFixed64(p102, var2855)
			local _ = var2871
			var2855 = var2872
		else
			error("Unsupported wire type: " .. var4185)
		end
	end
	return var2854
end

function t_102:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_102:jsonDecode()
	-- upvalues: t_102 (ref)
	local var2873 = t_102.new()
	
	if self.universe_id ~= nil then
		var2873.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2873.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2873.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2873.is_content_locked = self.isContentLocked
	end
	return var2873
end

t_102.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_102
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		overview_rich_text = if p103 == nil or p103.overview_rich_text == nil then "" else p103.overview_rich_text,
		result_entry = if p103 == nil or p103.result_entry == nil then nil else p103.result_entry,
		follow_up_queries = if p103 == nil or p103.follow_up_queries == nil then {} else p103.follow_up_queries,
		show_loading = if p103 == nil or p103.show_loading == nil then false else p103.show_loading,
		title = if p103 == nil or p103.title == nil then "" else p103.title,
		search_query = if p103 == nil or p103.search_query == nil then "" else p103.search_query,
		universe_ids = if p103 == nil or p103.universe_ids == nil then "" else p103.universe_ids
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2873 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2874, var2875 = protoModule.writeTag(buff, var2873, 1, protoModule.wireTypes.lengthDelimited)
		var2874, var4207 = protoModule.writeString(var2874, var2875, self.overview_rich_text)
		buff = var2874
		var2873 = var2875
	end
	if self.result_entry ~= nil then
		local var2876 = self.result_entry:encode()
		local var2877, var2878 = protoModule.writeTag(buff, var2873, 2, protoModule.wireTypes.lengthDelimited)
		var2877, var4210 = protoModule.writeBuffer(var2877, var2878, var2876, buffer.len(var2876))
		buff = var2877
		var2873 = var2878
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2879, var2880 = protoModule.writeTag(buff, var2873, 3, protoModule.wireTypes.lengthDelimited)
			var2879, var4212 = protoModule.writeString(var2879, var2880, v)
			buff = var2879
			var2873 = var2880
		end
	end
	if self.show_loading then
		local var2881, var2882 = protoModule.writeTag(buff, var2873, 4, protoModule.wireTypes.varint)
		var2881, var4214 = protoModule.writeVarInt(var2881, var2882, if self.show_loading then 1 else 0)
		buff = var2881
		var2873 = var2882
	end
	if self.title ~= nil and self.title ~= "" then
		local var2883, var2884 = protoModule.writeTag(buff, var2873, 5, protoModule.wireTypes.lengthDelimited)
		var2883, var4216 = protoModule.writeString(var2883, var2884, self.title)
		buff = var2883
		var2873 = var2884
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2885, var2886 = protoModule.writeTag(buff, var2873, 6, protoModule.wireTypes.lengthDelimited)
		var2885, var4218 = protoModule.writeString(var2885, var2886, self.search_query)
		buff = var2885
		var2873 = var2886
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2887, var2888 = protoModule.writeTag(buff, var2873, 8, protoModule.wireTypes.lengthDelimited)
		var2887, var4220 = protoModule.writeString(var2887, var2888, self.universe_ids)
		buff = var2887
		var2873 = var2888
	end
	local buff_1 = buffer.create(var2873)
	buffer.copy(buff_1, 0, buff, 0, var2873)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2889 = t_103.new()
	local var2890 = 0
	while var2890 < buffer.len(p103) do
		local _ = nil
		local var2891 = nil
		local var2892, var2893, var2894 = protoModule.readTag(p103, var2890)
		local var2895 = var2892
		var2891 = var2893
		var2890 = var2894
		
		if var2891 == protoModule.wireTypes.varint then
			if var2895 == 4 then
				local _ = nil
				local var2896, var2897 = protoModule.readVarInt(p103, var2890)
				var2890 = var2897
				var2889.show_loading = var2896 ~= 0
			else
				local _ = nil
				local var2898, var2899 = protoModule.readVarInt(p103, var2890)
				local _ = var2898
				var2890 = var2899
			end
		end
		if var2891 == protoModule.wireTypes.lengthDelimited then
			if var2895 == 1 then
				local _ = nil
				local var2900, var2901 = protoModule.readBuffer(p103, var2890)
				var2890 = var2901
				var2889.overview_rich_text = buffer.tostring(var2900)
			elseif var2895 == 2 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p103, var2890)
				var2890 = var2903
				var2889.result_entry = t.FeedEntry.decode(var2902)
			elseif var2895 == 3 then
				local _ = nil
				local var2904, var2905 = protoModule.readBuffer(p103, var2890)
				var2890 = var2905
				table.insert(var2889.follow_up_queries, buffer.tostring(var2904))
			elseif var2895 == 5 then
				local _ = nil
				local var2906, var2907 = protoModule.readBuffer(p103, var2890)
				var2890 = var2907
				var2889.title = buffer.tostring(var2906)
			elseif var2895 == 6 then
				local _ = nil
				local var2908, var2909 = protoModule.readBuffer(p103, var2890)
				var2890 = var2909
				var2889.search_query = buffer.tostring(var2908)
			elseif var2895 == 8 then
				local _ = nil
				local var2910, var2911 = protoModule.readBuffer(p103, var2890)
				var2890 = var2911
				var2889.universe_ids = buffer.tostring(var2910)
			else
				local _ = nil
				local var2912, var2913 = protoModule.readVarInt(p103, var2890)
				var2890 = var2913 + var2912
			end
		elseif var2891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2914, var2915 = protoModule.readFixed32(p103, var2890)
			local _ = var2914
			var2890 = var2915
		elseif var2891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2916, var2917 = protoModule.readFixed64(p103, var2890)
			local _ = var2916
			var2890 = var2917
		else
			error("Unsupported wire type: " .. var4224)
		end
	end
	return var2889
end

function t_103:jsonEncode()
	local t = {}
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		t.overviewRichText = self.overview_rich_text
	end
	if self.result_entry ~= nil then
		t.resultEntry = self.result_entry:jsonEncode()
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		t.followUpQueries = t_1
	end
	if self.show_loading then
		t.showLoading = self.show_loading
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		t.searchQuery = self.search_query
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		t.universeIds = self.universe_ids
	end
	return t
end

function t_103:jsonDecode()
	-- upvalues: t_103 (ref), t (ref)
	local var2918 = t_103.new()
	
	if self.overview_rich_text ~= nil then
		var2918.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2918.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2918.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2918.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2918.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2918.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2918.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2918.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2918.title = self.title
	end
	if self.search_query ~= nil then
		var2918.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2918.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2918.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2918.universe_ids = self.universeIds
	end
	return var2918
end

t_103.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_103
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t_104 (ref)
	return setmetatable({
		title = if p104 == nil or p104.title == nil then "" else p104.title,
		user_items = if p104 == nil or p104.user_items == nil then {} else p104.user_items,
		max_visible_rows = if p104 == nil or p104.max_visible_rows == nil then 0 else p104.max_visible_rows,
		sort_id = if p104 == nil or p104.sort_id == nil then nil else p104.sort_id
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2919 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2920, var2921 = protoModule.writeTag(buff, var2919, 1, protoModule.wireTypes.lengthDelimited)
		var2920, var4259 = protoModule.writeString(var2920, var2921, self.title)
		buff = var2920
		var2919 = var2921
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2922 = v:encode()
			local var2923, var2924 = protoModule.writeTag(buff, var2919, 2, protoModule.wireTypes.lengthDelimited)
			var2923, var4262 = protoModule.writeBuffer(var2923, var2924, var2922, buffer.len(var2922))
			buff = var2923
			var2919 = var2924
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2925, var2926 = protoModule.writeTag(buff, var2919, 3, protoModule.wireTypes.varint)
		var2925, var4264 = protoModule.writeVarInt(var2925, var2926, self.max_visible_rows)
		buff = var2925
		var2919 = var2926
	end
	if self.sort_id ~= nil then
		local var2927, var2928 = protoModule.writeTag(buff, var2919, 4, protoModule.wireTypes.lengthDelimited)
		var2927, var4266 = protoModule.writeString(var2927, var2928, self.sort_id)
		buff = var2927
		var2919 = var2928
	end
	local buff_1 = buffer.create(var2919)
	buffer.copy(buff_1, 0, buff, 0, var2919)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2929 = t_104.new()
	local var2930 = 0
	while var2930 < buffer.len(p104) do
		local _ = nil
		local var2931 = nil
		local var2932, var2933, var2934 = protoModule.readTag(p104, var2930)
		local var2935 = var2932
		var2931 = var2933
		var2930 = var2934
		
		if var2931 == protoModule.wireTypes.varint then
			if var2935 == 3 then
				local _ = nil
				local var2936, var2937 = protoModule.readVarIntI32(p104, var2930)
				var2930 = var2937
				var2929.max_visible_rows = var2936
			else
				local _ = nil
				local var2938, var2939 = protoModule.readVarInt(p104, var2930)
				local _ = var2938
				var2930 = var2939
			end
		end
		if var2931 == protoModule.wireTypes.lengthDelimited then
			if var2935 == 1 then
				local _ = nil
				local var2940, var2941 = protoModule.readBuffer(p104, var2930)
				var2930 = var2941
				var2929.title = buffer.tostring(var2940)
			elseif var2935 == 2 then
				local _ = nil
				local var2942, var2943 = protoModule.readBuffer(p104, var2930)
				var2930 = var2943
				table.insert(var2929.user_items, t.UserListInputData_UserItem.decode(var2942))
			elseif var2935 == 4 then
				local _ = nil
				local var2944, var2945 = protoModule.readBuffer(p104, var2930)
				var2930 = var2945
				var2929.sort_id = buffer.tostring(var2944)
			else
				local _ = nil
				local var2946, var2947 = protoModule.readVarInt(p104, var2930)
				var2930 = var2947 + var2946
			end
		elseif var2931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2948, var2949 = protoModule.readFixed32(p104, var2930)
			local _ = var2948
			var2930 = var2949
		elseif var2931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2950, var2951 = protoModule.readFixed64(p104, var2930)
			local _ = var2950
			var2930 = var2951
		else
			error("Unsupported wire type: " .. var4270)
		end
	end
	return var2929
end

function t_104:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.userItems = t_1
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_104:jsonDecode()
	-- upvalues: t_104 (ref), t (ref)
	local var2952 = t_104.new()
	
	if self.title ~= nil then
		var2952.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2952.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2952.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2952.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2952.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2952.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2952.sort_id = self.sortId
	end
	return var2952
end

t_104.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_104
typeRegistryModule.default:register(t.UserListInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		user_id = if p105 == nil or p105.user_id == nil then "" else p105.user_id,
		previous_usernames = if p105 == nil or p105.previous_usernames == nil then {} else p105.previous_usernames
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2953 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2954, var2955 = protoModule.writeTag(buff, var2953, 1, protoModule.wireTypes.lengthDelimited)
		var2954, var4299 = protoModule.writeString(var2954, var2955, self.user_id)
		buff = var2954
		var2953 = var2955
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for i, v in self.previous_usernames do
			local var2956, var2957 = protoModule.writeTag(buff, var2953, 2, protoModule.wireTypes.lengthDelimited)
			var2956, var4301 = protoModule.writeString(var2956, var2957, v)
			buff = var2956
			var2953 = var2957
		end
	end
	local buff_1 = buffer.create(var2953)
	buffer.copy(buff_1, 0, buff, 0, var2953)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2958 = t_105.new()
	local var2959 = 0
	while var2959 < buffer.len(p105) do
		local _ = nil
		local var2960 = nil
		local var2961, var2962, var2963 = protoModule.readTag(p105, var2959)
		local var2964 = var2961
		var2960 = var2962
		var2959 = var2963
		
		if var2960 == protoModule.wireTypes.varint then
			local _ = nil
			local var2965, var2966 = protoModule.readVarInt(p105, var2959)
			local _ = var2965
			var2959 = var2966
			continue
		end
		if var2960 == protoModule.wireTypes.lengthDelimited then
			if var2964 == 1 then
				local _ = nil
				local var2967, var2968 = protoModule.readBuffer(p105, var2959)
				var2959 = var2968
				var2958.user_id = buffer.tostring(var2967)
			elseif var2964 == 2 then
				local _ = nil
				local var2969, var2970 = protoModule.readBuffer(p105, var2959)
				var2959 = var2970
				table.insert(var2958.previous_usernames, buffer.tostring(var2969))
			else
				local _ = nil
				local var2971, var2972 = protoModule.readVarInt(p105, var2959)
				var2959 = var2972 + var2971
			end
		elseif var2960 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2973, var2974 = protoModule.readFixed32(p105, var2959)
			local _ = var2973
			var2959 = var2974
		elseif var2960 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2975, var2976 = protoModule.readFixed64(p105, var2959)
			local _ = var2975
			var2959 = var2976
		else
			error("Unsupported wire type: " .. var4305)
		end
	end
	return var2958
end

function t_105:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		local t_1 = {}
		
		for i, v in self.previous_usernames do
			table.insert(t_1, v)
		end
		t.previousUsernames = t_1
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2977 = t_105.new()
	
	if self.user_id ~= nil then
		var2977.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2977.user_id = self.userId
	end
	if self.previous_usernames ~= nil then
		local t = {}
		
		for i, v in self.previous_usernames do
			table.insert(t, v)
		end
		var2977.previous_usernames = t
	end
	if self.previousUsernames ~= nil then
		local t = {}
		
		for i, v in self.previousUsernames do
			table.insert(t, v)
		end
		var2977.previous_usernames = t
	end
	return var2977
end

t_105.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_105
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		title = if p106 == nil or p106.title == nil then "" else p106.title,
		items = if p106 == nil or p106.items == nil then {} else p106.items,
		max_visible_rows = if p106 == nil or p106.max_visible_rows == nil then 0 else p106.max_visible_rows,
		sort_id = if p106 == nil or p106.sort_id == nil then nil else p106.sort_id
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2978 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2979, var2980 = protoModule.writeTag(buff, var2978, 1, protoModule.wireTypes.lengthDelimited)
		var2979, var4330 = protoModule.writeString(var2979, var2980, self.title)
		buff = var2979
		var2978 = var2980
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2981 = v:encode()
			local var2982, var2983 = protoModule.writeTag(buff, var2978, 2, protoModule.wireTypes.lengthDelimited)
			var2982, var4333 = protoModule.writeBuffer(var2982, var2983, var2981, buffer.len(var2981))
			buff = var2982
			var2978 = var2983
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2984, var2985 = protoModule.writeTag(buff, var2978, 3, protoModule.wireTypes.varint)
		var2984, var4335 = protoModule.writeVarInt(var2984, var2985, self.max_visible_rows)
		buff = var2984
		var2978 = var2985
	end
	if self.sort_id ~= nil then
		local var2986, var2987 = protoModule.writeTag(buff, var2978, 4, protoModule.wireTypes.lengthDelimited)
		var2986, var4337 = protoModule.writeString(var2986, var2987, self.sort_id)
		buff = var2986
		var2978 = var2987
	end
	local buff_1 = buffer.create(var2978)
	buffer.copy(buff_1, 0, buff, 0, var2978)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2988 = t_106.new()
	local var2989 = 0
	while var2989 < buffer.len(p106) do
		local _ = nil
		local var2990 = nil
		local var2991, var2992, var2993 = protoModule.readTag(p106, var2989)
		local var2994 = var2991
		var2990 = var2992
		var2989 = var2993
		
		if var2990 == protoModule.wireTypes.varint then
			if var2994 == 3 then
				local _ = nil
				local var2995, var2996 = protoModule.readVarIntI32(p106, var2989)
				var2989 = var2996
				var2988.max_visible_rows = var2995
			else
				local _ = nil
				local var2997, var2998 = protoModule.readVarInt(p106, var2989)
				local _ = var2997
				var2989 = var2998
			end
		end
		if var2990 == protoModule.wireTypes.lengthDelimited then
			if var2994 == 1 then
				local _ = nil
				local var2999, var3000 = protoModule.readBuffer(p106, var2989)
				var2989 = var3000
				var2988.title = buffer.tostring(var2999)
			elseif var2994 == 2 then
				local _ = nil
				local var3001, var3002 = protoModule.readBuffer(p106, var2989)
				var2989 = var3002
				table.insert(var2988.items, t.CatalogItemListInputData_CatalogItem.decode(var3001))
			elseif var2994 == 4 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p106, var2989)
				var2989 = var3004
				var2988.sort_id = buffer.tostring(var3003)
			else
				local _ = nil
				local var3005, var3006 = protoModule.readVarInt(p106, var2989)
				var2989 = var3006 + var3005
			end
		elseif var2990 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3007, var3008 = protoModule.readFixed32(p106, var2989)
			local _ = var3007
			var2989 = var3008
		elseif var2990 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3009, var3010 = protoModule.readFixed64(p106, var2989)
			local _ = var3009
			var2989 = var3010
		else
			error("Unsupported wire type: " .. var4341)
		end
	end
	return var2988
end

function t_106:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_106:jsonDecode()
	-- upvalues: t_106 (ref), t (ref)
	local var3011 = t_106.new()
	
	if self.title ~= nil then
		var3011.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3011.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3011.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3011.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3011.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3011.sort_id = self.sortId
	end
	return var3011
end

t_106.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_106
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		item_id = if p107 == nil or p107.item_id == nil then "" else p107.item_id,
		item_type = if p107 == nil or p107.item_type == nil then "" else p107.item_type
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3012 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3013, var3014 = protoModule.writeTag(buff, var3012, 1, protoModule.wireTypes.lengthDelimited)
		var3013, var4369 = protoModule.writeString(var3013, var3014, self.item_id)
		buff = var3013
		var3012 = var3014
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3015, var3016 = protoModule.writeTag(buff, var3012, 2, protoModule.wireTypes.lengthDelimited)
		var3015, var4371 = protoModule.writeString(var3015, var3016, self.item_type)
		buff = var3015
		var3012 = var3016
	end
	local buff_1 = buffer.create(var3012)
	buffer.copy(buff_1, 0, buff, 0, var3012)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var3012 = t_107.new()
	local var3013 = 0
	while var3013 < buffer.len(p107) do
		local _ = nil
		local var3014 = nil
		local var3015, var3016, var3017 = protoModule.readTag(p107, var3013)
		local var3018 = var3015
		var3014 = var3016
		var3013 = var3017
		
		if var3014 == protoModule.wireTypes.varint then
			local _ = nil
			local var3019, var3020 = protoModule.readVarInt(p107, var3013)
			local _ = var3019
			var3013 = var3020
			continue
		end
		if var3014 == protoModule.wireTypes.lengthDelimited then
			if var3018 == 1 then
				local _ = nil
				local var3021, var3022 = protoModule.readBuffer(p107, var3013)
				var3013 = var3022
				var3012.item_id = buffer.tostring(var3021)
			elseif var3018 == 2 then
				local _ = nil
				local var3023, var3024 = protoModule.readBuffer(p107, var3013)
				var3013 = var3024
				var3012.item_type = buffer.tostring(var3023)
			else
				local _ = nil
				local var3025, var3026 = protoModule.readVarInt(p107, var3013)
				var3013 = var3026 + var3025
			end
		elseif var3014 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3027, var3028 = protoModule.readFixed32(p107, var3013)
			local _ = var3027
			var3013 = var3028
		elseif var3014 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3029, var3030 = protoModule.readFixed64(p107, var3013)
			local _ = var3029
			var3013 = var3030
		else
			error("Unsupported wire type: " .. var4375)
		end
	end
	return var3012
end

function t_107:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_107:jsonDecode()
	-- upvalues: t_107 (ref)
	local var3031 = t_107.new()
	
	if self.item_id ~= nil then
		var3031.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3031.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3031.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3031.item_type = self.itemType
	end
	return var3031
end

t_107.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_107
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		universe_id = if p108 == nil or p108.universe_id == nil then "" else p108.universe_id
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3031 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3032, var3033 = protoModule.writeTag(buff, var3031, 1, protoModule.wireTypes.lengthDelimited)
		var3032, var4397 = protoModule.writeString(var3032, var3033, self.universe_id)
		buff = var3032
		var3031 = var3033
	end
	local buff_1 = buffer.create(var3031)
	buffer.copy(buff_1, 0, buff, 0, var3031)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var3031 = t_108.new()
	local var3032 = 0
	while var3032 < buffer.len(p108) do
		local _ = nil
		local var3033 = nil
		local var3034, var3035, var3036 = protoModule.readTag(p108, var3032)
		local var3037 = var3034
		var3033 = var3035
		var3032 = var3036
		
		if var3033 == protoModule.wireTypes.varint then
			local _ = nil
			local var3038, var3039 = protoModule.readVarInt(p108, var3032)
			local _ = var3038
			var3032 = var3039
			continue
		end
		if var3033 == protoModule.wireTypes.lengthDelimited then
			if var3037 == 1 then
				local _ = nil
				local var3040, var3041 = protoModule.readBuffer(p108, var3032)
				var3032 = var3041
				var3031.universe_id = buffer.tostring(var3040)
			else
				local _ = nil
				local var3042, var3043 = protoModule.readVarInt(p108, var3032)
				var3032 = var3043 + var3042
			end
		elseif var3033 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3044, var3045 = protoModule.readFixed32(p108, var3032)
			local _ = var3044
			var3032 = var3045
		elseif var3033 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3046, var3047 = protoModule.readFixed64(p108, var3032)
			local _ = var3046
			var3032 = var3047
		else
			error("Unsupported wire type: " .. var4401)
		end
	end
	return var3031
end

function t_108:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_108:jsonDecode()
	-- upvalues: t_108 (ref)
	local var3048 = t_108.new()
	
	if self.universe_id ~= nil then
		var3048.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3048.universe_id = self.universeId
	end
	return var3048
end

t_108.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_108
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		title = if p109 == nil or p109.title == nil then "" else p109.title,
		subtitle = if p109 == nil or p109.subtitle == nil then "" else p109.subtitle,
		moment_items = if p109 == nil or p109.moment_items == nil then {} else p109.moment_items
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3048 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3049, var3050 = protoModule.writeTag(buff, var3048, 1, protoModule.wireTypes.lengthDelimited)
		var3049, var4421 = protoModule.writeString(var3049, var3050, self.title)
		buff = var3049
		var3048 = var3050
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3051, var3052 = protoModule.writeTag(buff, var3048, 2, protoModule.wireTypes.lengthDelimited)
		var3051, var4423 = protoModule.writeString(var3051, var3052, self.subtitle)
		buff = var3051
		var3048 = var3052
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3053 = v:encode()
			local var3054, var3055 = protoModule.writeTag(buff, var3048, 3, protoModule.wireTypes.lengthDelimited)
			var3054, var4426 = protoModule.writeBuffer(var3054, var3055, var3053, buffer.len(var3053))
			buff = var3054
			var3048 = var3055
		end
	end
	local buff_1 = buffer.create(var3048)
	buffer.copy(buff_1, 0, buff, 0, var3048)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var3056 = t_109.new()
	local var3057 = 0
	while var3057 < buffer.len(p109) do
		local _ = nil
		local var3058 = nil
		local var3059, var3060, var3061 = protoModule.readTag(p109, var3057)
		local var3062 = var3059
		var3058 = var3060
		var3057 = var3061
		
		if var3058 == protoModule.wireTypes.varint then
			local _ = nil
			local var3063, var3064 = protoModule.readVarInt(p109, var3057)
			local _ = var3063
			var3057 = var3064
			continue
		end
		if var3058 == protoModule.wireTypes.lengthDelimited then
			if var3062 == 1 then
				local _ = nil
				local var3065, var3066 = protoModule.readBuffer(p109, var3057)
				var3057 = var3066
				var3056.title = buffer.tostring(var3065)
			elseif var3062 == 2 then
				local _ = nil
				local var3067, var3068 = protoModule.readBuffer(p109, var3057)
				var3057 = var3068
				var3056.subtitle = buffer.tostring(var3067)
			elseif var3062 == 3 then
				local _ = nil
				local var3069, var3070 = protoModule.readBuffer(p109, var3057)
				var3057 = var3070
				table.insert(var3056.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3069))
			else
				local _ = nil
				local var3071, var3072 = protoModule.readVarInt(p109, var3057)
				var3057 = var3072 + var3071
			end
		elseif var3058 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3073, var3074 = protoModule.readFixed32(p109, var3057)
			local _ = var3073
			var3057 = var3074
		elseif var3058 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3075, var3076 = protoModule.readFixed64(p109, var3057)
			local _ = var3075
			var3057 = var3076
		else
			error("Unsupported wire type: " .. var4430)
		end
	end
	return var3056
end

function t_109:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.momentItems = t_1
	end
	return t
end

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), t (ref)
	local var3077 = t_109.new()
	
	if self.title ~= nil then
		var3077.title = self.title
	end
	if self.subtitle ~= nil then
		var3077.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3077.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3077.moment_items = t_1
	end
	return var3077
end

t_109.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_109
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		moment_id = if p110 == nil or p110.moment_id == nil then "" else p110.moment_id,
		video_asset_id = if p110 == nil or p110.video_asset_id == nil then "" else p110.video_asset_id,
		target_universe_id = if p110 == nil or p110.target_universe_id == nil then "" else p110.target_universe_id,
		target_place_id = if p110 == nil or p110.target_place_id == nil then "" else p110.target_place_id,
		feed_item_id = if p110 == nil or p110.feed_item_id == nil then "" else p110.feed_item_id,
		capture_universe_id = if p110 == nil or p110.capture_universe_id == nil then "" else p110.capture_universe_id
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3078 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3079, var3080 = protoModule.writeTag(buff, var3078, 1, protoModule.wireTypes.lengthDelimited)
		var3079, var4457 = protoModule.writeString(var3079, var3080, self.moment_id)
		buff = var3079
		var3078 = var3080
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3081, var3082 = protoModule.writeTag(buff, var3078, 2, protoModule.wireTypes.lengthDelimited)
		var3081, var4459 = protoModule.writeString(var3081, var3082, self.video_asset_id)
		buff = var3081
		var3078 = var3082
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3083, var3084 = protoModule.writeTag(buff, var3078, 3, protoModule.wireTypes.lengthDelimited)
		var3083, var4461 = protoModule.writeString(var3083, var3084, self.target_universe_id)
		buff = var3083
		var3078 = var3084
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3085, var3086 = protoModule.writeTag(buff, var3078, 4, protoModule.wireTypes.lengthDelimited)
		var3085, var4463 = protoModule.writeString(var3085, var3086, self.target_place_id)
		buff = var3085
		var3078 = var3086
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3087, var3088 = protoModule.writeTag(buff, var3078, 5, protoModule.wireTypes.lengthDelimited)
		var3087, var4465 = protoModule.writeString(var3087, var3088, self.feed_item_id)
		buff = var3087
		var3078 = var3088
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3089, var3090 = protoModule.writeTag(buff, var3078, 6, protoModule.wireTypes.lengthDelimited)
		var3089, var4467 = protoModule.writeString(var3089, var3090, self.capture_universe_id)
		buff = var3089
		var3078 = var3090
	end
	local buff_1 = buffer.create(var3078)
	buffer.copy(buff_1, 0, buff, 0, var3078)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3078 = t_110.new()
	local var3079 = 0
	while var3079 < buffer.len(p110) do
		local _ = nil
		local var3080 = nil
		local var3081, var3082, var3083 = protoModule.readTag(p110, var3079)
		local var3084 = var3081
		var3080 = var3082
		var3079 = var3083
		
		if var3080 == protoModule.wireTypes.varint then
			local _ = nil
			local var3085, var3086 = protoModule.readVarInt(p110, var3079)
			local _ = var3085
			var3079 = var3086
			continue
		end
		if var3080 == protoModule.wireTypes.lengthDelimited then
			if var3084 == 1 then
				local _ = nil
				local var3087, var3088 = protoModule.readBuffer(p110, var3079)
				var3079 = var3088
				var3078.moment_id = buffer.tostring(var3087)
			elseif var3084 == 2 then
				local _ = nil
				local var3089, var3090 = protoModule.readBuffer(p110, var3079)
				var3079 = var3090
				var3078.video_asset_id = buffer.tostring(var3089)
			elseif var3084 == 3 then
				local _ = nil
				local var3091, var3092 = protoModule.readBuffer(p110, var3079)
				var3079 = var3092
				var3078.target_universe_id = buffer.tostring(var3091)
			elseif var3084 == 4 then
				local _ = nil
				local var3093, var3094 = protoModule.readBuffer(p110, var3079)
				var3079 = var3094
				var3078.target_place_id = buffer.tostring(var3093)
			elseif var3084 == 5 then
				local _ = nil
				local var3095, var3096 = protoModule.readBuffer(p110, var3079)
				var3079 = var3096
				var3078.feed_item_id = buffer.tostring(var3095)
			elseif var3084 == 6 then
				local _ = nil
				local var3097, var3098 = protoModule.readBuffer(p110, var3079)
				var3079 = var3098
				var3078.capture_universe_id = buffer.tostring(var3097)
			else
				local _ = nil
				local var3099, var3100 = protoModule.readVarInt(p110, var3079)
				var3079 = var3100 + var3099
			end
		elseif var3080 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3101, var3102 = protoModule.readFixed32(p110, var3079)
			local _ = var3101
			var3079 = var3102
		elseif var3080 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3103, var3104 = protoModule.readFixed64(p110, var3079)
			local _ = var3103
			var3079 = var3104
		else
			error("Unsupported wire type: " .. var4471)
		end
	end
	return var3078
end

function t_110:jsonEncode()
	local t = {}
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		t.momentId = self.moment_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		t.targetUniverseId = self.target_universe_id
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		t.targetPlaceId = self.target_place_id
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		t.feedItemId = self.feed_item_id
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		t.captureUniverseId = self.capture_universe_id
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref)
	local var3105 = t_110.new()
	
	if self.moment_id ~= nil then
		var3105.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3105.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3105.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3105.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3105.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3105.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3105.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3105.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3105.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3105.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3105.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3105.capture_universe_id = self.captureUniverseId
	end
	return var3105
end

t_110.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_110
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		title = if p111 == nil or p111.title == nil then "" else p111.title,
		subtitle = if p111 == nil or p111.subtitle == nil then "" else p111.subtitle,
		show_download_button = if p111 == nil or p111.show_download_button == nil then false else p111.show_download_button
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3105 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3106, var3107 = protoModule.writeTag(buff, var3105, 1, protoModule.wireTypes.lengthDelimited)
		var3106, var4501 = protoModule.writeString(var3106, var3107, self.title)
		buff = var3106
		var3105 = var3107
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3108, var3109 = protoModule.writeTag(buff, var3105, 2, protoModule.wireTypes.lengthDelimited)
		var3108, var4503 = protoModule.writeString(var3108, var3109, self.subtitle)
		buff = var3108
		var3105 = var3109
	end
	if self.show_download_button then
		local var3110, var3111 = protoModule.writeTag(buff, var3105, 3, protoModule.wireTypes.varint)
		var3110, var4505 = protoModule.writeVarInt(var3110, var3111, if self.show_download_button then 1 else 0)
		buff = var3110
		var3105 = var3111
	end
	local buff_1 = buffer.create(var3105)
	buffer.copy(buff_1, 0, buff, 0, var3105)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3105 = t_111.new()
	local var3106 = 0
	while var3106 < buffer.len(p111) do
		local _ = nil
		local var3107 = nil
		local var3108, var3109, var3110 = protoModule.readTag(p111, var3106)
		local var3111 = var3108
		var3107 = var3109
		var3106 = var3110
		
		if var3107 == protoModule.wireTypes.varint then
			if var3111 == 3 then
				local _ = nil
				local var3112, var3113 = protoModule.readVarInt(p111, var3106)
				var3106 = var3113
				var3105.show_download_button = var3112 ~= 0
			else
				local _ = nil
				local var3114, var3115 = protoModule.readVarInt(p111, var3106)
				local _ = var3114
				var3106 = var3115
			end
		end
		if var3107 == protoModule.wireTypes.lengthDelimited then
			if var3111 == 1 then
				local _ = nil
				local var3116, var3117 = protoModule.readBuffer(p111, var3106)
				var3106 = var3117
				var3105.title = buffer.tostring(var3116)
			elseif var3111 == 2 then
				local _ = nil
				local var3118, var3119 = protoModule.readBuffer(p111, var3106)
				var3106 = var3119
				var3105.subtitle = buffer.tostring(var3118)
			else
				local _ = nil
				local var3120, var3121 = protoModule.readVarInt(p111, var3106)
				var3106 = var3121 + var3120
			end
		elseif var3107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3122, var3123 = protoModule.readFixed32(p111, var3106)
			local _ = var3122
			var3106 = var3123
		elseif var3107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3124, var3125 = protoModule.readFixed64(p111, var3106)
			local _ = var3124
			var3106 = var3125
		else
			error("Unsupported wire type: " .. var4509)
		end
	end
	return var3105
end

function t_111:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.show_download_button then
		t.showDownloadButton = self.show_download_button
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref)
	local var3126 = t_111.new()
	
	if self.title ~= nil then
		var3126.title = self.title
	end
	if self.subtitle ~= nil then
		var3126.subtitle = self.subtitle
	end
	if self.show_download_button ~= nil then
		var3126.show_download_button = self.show_download_button
	end
	if self.showDownloadButton ~= nil then
		var3126.show_download_button = self.showDownloadButton
	end
	return var3126
end

t_111.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_111
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		primary_cta_button_text = if p112 == nil or p112.primary_cta_button_text == nil then "" else p112.primary_cta_button_text,
		secondary_cta_button_text = if p112 == nil or p112.secondary_cta_button_text == nil then "" else p112.secondary_cta_button_text,
		primary_cta_type = if p112 == nil or p112.primary_cta_type == nil then "" else p112.primary_cta_type,
		secondary_cta_type = if p112 == nil or p112.secondary_cta_type == nil then "" else p112.secondary_cta_type
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3126 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3127, var3128 = protoModule.writeTag(buff, var3126, 1, protoModule.wireTypes.lengthDelimited)
		var3127, var4533 = protoModule.writeString(var3127, var3128, self.primary_cta_button_text)
		buff = var3127
		var3126 = var3128
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3129, var3130 = protoModule.writeTag(buff, var3126, 2, protoModule.wireTypes.lengthDelimited)
		var3129, var4535 = protoModule.writeString(var3129, var3130, self.secondary_cta_button_text)
		buff = var3129
		var3126 = var3130
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3131, var3132 = protoModule.writeTag(buff, var3126, 3, protoModule.wireTypes.lengthDelimited)
		var3131, var4537 = protoModule.writeString(var3131, var3132, self.primary_cta_type)
		buff = var3131
		var3126 = var3132
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3133, var3134 = protoModule.writeTag(buff, var3126, 4, protoModule.wireTypes.lengthDelimited)
		var3133, var4539 = protoModule.writeString(var3133, var3134, self.secondary_cta_type)
		buff = var3133
		var3126 = var3134
	end
	local buff_1 = buffer.create(var3126)
	buffer.copy(buff_1, 0, buff, 0, var3126)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref)
	local var3126 = t_112.new()
	local var3127 = 0
	while var3127 < buffer.len(p112) do
		local _ = nil
		local var3128 = nil
		local var3129, var3130, var3131 = protoModule.readTag(p112, var3127)
		local var3132 = var3129
		var3128 = var3130
		var3127 = var3131
		
		if var3128 == protoModule.wireTypes.varint then
			local _ = nil
			local var3133, var3134 = protoModule.readVarInt(p112, var3127)
			local _ = var3133
			var3127 = var3134
			continue
		end
		if var3128 == protoModule.wireTypes.lengthDelimited then
			if var3132 == 1 then
				local _ = nil
				local var3135, var3136 = protoModule.readBuffer(p112, var3127)
				var3127 = var3136
				var3126.primary_cta_button_text = buffer.tostring(var3135)
			elseif var3132 == 2 then
				local _ = nil
				local var3137, var3138 = protoModule.readBuffer(p112, var3127)
				var3127 = var3138
				var3126.secondary_cta_button_text = buffer.tostring(var3137)
			elseif var3132 == 3 then
				local _ = nil
				local var3139, var3140 = protoModule.readBuffer(p112, var3127)
				var3127 = var3140
				var3126.primary_cta_type = buffer.tostring(var3139)
			elseif var3132 == 4 then
				local _ = nil
				local var3141, var3142 = protoModule.readBuffer(p112, var3127)
				var3127 = var3142
				var3126.secondary_cta_type = buffer.tostring(var3141)
			else
				local _ = nil
				local var3143, var3144 = protoModule.readVarInt(p112, var3127)
				var3127 = var3144 + var3143
			end
		elseif var3128 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3145, var3146 = protoModule.readFixed32(p112, var3127)
			local _ = var3145
			var3127 = var3146
		elseif var3128 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3147, var3148 = protoModule.readFixed64(p112, var3127)
			local _ = var3147
			var3127 = var3148
		else
			error("Unsupported wire type: " .. var4543)
		end
	end
	return var3126
end

function t_112:jsonEncode()
	local t = {}
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		t.primaryCtaButtonText = self.primary_cta_button_text
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		t.secondaryCtaButtonText = self.secondary_cta_button_text
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		t.primaryCtaType = self.primary_cta_type
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		t.secondaryCtaType = self.secondary_cta_type
	end
	return t
end

function t_112:jsonDecode()
	-- upvalues: t_112 (ref)
	local var3149 = t_112.new()
	
	if self.primary_cta_button_text ~= nil then
		var3149.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3149.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3149.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3149.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3149.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3149.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3149.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3149.secondary_cta_type = self.secondaryCtaType
	end
	return var3149
end

t_112.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_112
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		image_asset_id = if p113 == nil or p113.image_asset_id == nil then "" else p113.image_asset_id
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3149 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3150, var3151 = protoModule.writeTag(buff, var3149, 1, protoModule.wireTypes.lengthDelimited)
		var3150, var4569 = protoModule.writeString(var3150, var3151, self.image_asset_id)
		buff = var3150
		var3149 = var3151
	end
	local buff_1 = buffer.create(var3149)
	buffer.copy(buff_1, 0, buff, 0, var3149)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var3149 = t_113.new()
	local var3150 = 0
	while var3150 < buffer.len(p113) do
		local _ = nil
		local var3151 = nil
		local var3152, var3153, var3154 = protoModule.readTag(p113, var3150)
		local var3155 = var3152
		var3151 = var3153
		var3150 = var3154
		
		if var3151 == protoModule.wireTypes.varint then
			local _ = nil
			local var3156, var3157 = protoModule.readVarInt(p113, var3150)
			local _ = var3156
			var3150 = var3157
			continue
		end
		if var3151 == protoModule.wireTypes.lengthDelimited then
			if var3155 == 1 then
				local _ = nil
				local var3158, var3159 = protoModule.readBuffer(p113, var3150)
				var3150 = var3159
				var3149.image_asset_id = buffer.tostring(var3158)
			else
				local _ = nil
				local var3160, var3161 = protoModule.readVarInt(p113, var3150)
				var3150 = var3161 + var3160
			end
		elseif var3151 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3162, var3163 = protoModule.readFixed32(p113, var3150)
			local _ = var3162
			var3150 = var3163
		elseif var3151 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3164, var3165 = protoModule.readFixed64(p113, var3150)
			local _ = var3164
			var3150 = var3165
		else
			error("Unsupported wire type: " .. var4573)
		end
	end
	return var3149
end

function t_113:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_113:jsonDecode()
	-- upvalues: t_113 (ref)
	local var3166 = t_113.new()
	
	if self.image_asset_id ~= nil then
		var3166.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3166.image_asset_id = self.imageAssetId
	end
	return var3166
end

t_113.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_113
typeRegistryModule.default:register(t.ImageInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		video_asset_id = if p114 == nil or p114.video_asset_id == nil then "" else p114.video_asset_id,
		loading_image_asset_id = if p114 == nil or p114.loading_image_asset_id == nil then "" else p114.loading_image_asset_id,
		max_quality = if p114 == nil or p114.max_quality == nil then "" else p114.max_quality,
		adaptive_resolution = if p114 == nil or p114.adaptive_resolution == nil then false else p114.adaptive_resolution
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3166 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3167, var3168 = protoModule.writeTag(buff, var3166, 1, protoModule.wireTypes.lengthDelimited)
		var3167, var4593 = protoModule.writeString(var3167, var3168, self.video_asset_id)
		buff = var3167
		var3166 = var3168
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3169, var3170 = protoModule.writeTag(buff, var3166, 2, protoModule.wireTypes.lengthDelimited)
		var3169, var4595 = protoModule.writeString(var3169, var3170, self.loading_image_asset_id)
		buff = var3169
		var3166 = var3170
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local var3171, var3172 = protoModule.writeTag(buff, var3166, 3, protoModule.wireTypes.lengthDelimited)
		var3171, var4597 = protoModule.writeString(var3171, var3172, self.max_quality)
		buff = var3171
		var3166 = var3172
	end
	if self.adaptive_resolution then
		local var3173, var3174 = protoModule.writeTag(buff, var3166, 4, protoModule.wireTypes.varint)
		var3173, var4599 = protoModule.writeVarInt(var3173, var3174, if self.adaptive_resolution then 1 else 0)
		buff = var3173
		var3166 = var3174
	end
	local buff_1 = buffer.create(var3166)
	buffer.copy(buff_1, 0, buff, 0, var3166)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var3166 = t_114.new()
	local var3167 = 0
	while var3167 < buffer.len(p114) do
		local _ = nil
		local var3168 = nil
		local var3169, var3170, var3171 = protoModule.readTag(p114, var3167)
		local var3172 = var3169
		var3168 = var3170
		var3167 = var3171
		
		if var3168 == protoModule.wireTypes.varint then
			if var3172 == 4 then
				local _ = nil
				local var3173, var3174 = protoModule.readVarInt(p114, var3167)
				var3167 = var3174
				var3166.adaptive_resolution = var3173 ~= 0
			else
				local _ = nil
				local var3175, var3176 = protoModule.readVarInt(p114, var3167)
				local _ = var3175
				var3167 = var3176
			end
		end
		if var3168 == protoModule.wireTypes.lengthDelimited then
			if var3172 == 1 then
				local _ = nil
				local var3177, var3178 = protoModule.readBuffer(p114, var3167)
				var3167 = var3178
				var3166.video_asset_id = buffer.tostring(var3177)
			elseif var3172 == 2 then
				local _ = nil
				local var3179, var3180 = protoModule.readBuffer(p114, var3167)
				var3167 = var3180
				var3166.loading_image_asset_id = buffer.tostring(var3179)
			elseif var3172 == 3 then
				local _ = nil
				local var3181, var3182 = protoModule.readBuffer(p114, var3167)
				var3167 = var3182
				var3166.max_quality = buffer.tostring(var3181)
			else
				local _ = nil
				local var3183, var3184 = protoModule.readVarInt(p114, var3167)
				var3167 = var3184 + var3183
			end
		elseif var3168 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3185, var3186 = protoModule.readFixed32(p114, var3167)
			local _ = var3185
			var3167 = var3186
		elseif var3168 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3187, var3188 = protoModule.readFixed64(p114, var3167)
			local _ = var3187
			var3167 = var3188
		else
			error("Unsupported wire type: " .. var4603)
		end
	end
	return var3166
end

function t_114:jsonEncode()
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		t.maxQuality = self.max_quality
	end
	if self.adaptive_resolution then
		t.adaptiveResolution = self.adaptive_resolution
	end
	return t
end

function t_114:jsonDecode()
	-- upvalues: t_114 (ref)
	local var3189 = t_114.new()
	
	if self.video_asset_id ~= nil then
		var3189.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3189.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3189.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3189.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		var3189.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		var3189.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		var3189.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		var3189.adaptive_resolution = self.adaptiveResolution
	end
	return var3189
end

t_114.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_114
typeRegistryModule.default:register(t.VideoInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		text = if p115 == nil or p115.text == nil then "" else p115.text,
		is_rendered_text = if p115 == nil or p115.is_rendered_text == nil then false else p115.is_rendered_text,
		url = if p115 == nil or p115.url == nil then "" else p115.url
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3189 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3190, var3191 = protoModule.writeTag(buff, var3189, 1, protoModule.wireTypes.lengthDelimited)
		var3190, var4629 = protoModule.writeString(var3190, var3191, self.text)
		buff = var3190
		var3189 = var3191
	end
	if self.is_rendered_text then
		local var3192, var3193 = protoModule.writeTag(buff, var3189, 2, protoModule.wireTypes.varint)
		var3192, var4631 = protoModule.writeVarInt(var3192, var3193, if self.is_rendered_text then 1 else 0)
		buff = var3192
		var3189 = var3193
	end
	if self.url ~= nil and self.url ~= "" then
		local var3194, var3195 = protoModule.writeTag(buff, var3189, 3, protoModule.wireTypes.lengthDelimited)
		var3194, var4633 = protoModule.writeString(var3194, var3195, self.url)
		buff = var3194
		var3189 = var3195
	end
	local buff_1 = buffer.create(var3189)
	buffer.copy(buff_1, 0, buff, 0, var3189)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3189 = t_115.new()
	local var3190 = 0
	while var3190 < buffer.len(p115) do
		local _ = nil
		local var3191 = nil
		local var3192, var3193, var3194 = protoModule.readTag(p115, var3190)
		local var3195 = var3192
		var3191 = var3193
		var3190 = var3194
		
		if var3191 == protoModule.wireTypes.varint then
			if var3195 == 2 then
				local _ = nil
				local var3196, var3197 = protoModule.readVarInt(p115, var3190)
				var3190 = var3197
				var3189.is_rendered_text = var3196 ~= 0
			else
				local _ = nil
				local var3198, var3199 = protoModule.readVarInt(p115, var3190)
				local _ = var3198
				var3190 = var3199
			end
		end
		if var3191 == protoModule.wireTypes.lengthDelimited then
			if var3195 == 1 then
				local _ = nil
				local var3200, var3201 = protoModule.readBuffer(p115, var3190)
				var3190 = var3201
				var3189.text = buffer.tostring(var3200)
			elseif var3195 == 3 then
				local _ = nil
				local var3202, var3203 = protoModule.readBuffer(p115, var3190)
				var3190 = var3203
				var3189.url = buffer.tostring(var3202)
			else
				local _ = nil
				local var3204, var3205 = protoModule.readVarInt(p115, var3190)
				var3190 = var3205 + var3204
			end
		elseif var3191 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3206, var3207 = protoModule.readFixed32(p115, var3190)
			local _ = var3206
			var3190 = var3207
		elseif var3191 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3208, var3209 = protoModule.readFixed64(p115, var3190)
			local _ = var3208
			var3190 = var3209
		else
			error("Unsupported wire type: " .. var4637)
		end
	end
	return var3189
end

function t_115:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	if self.url ~= nil and self.url ~= "" then
		t.url = self.url
	end
	return t
end

function t_115:jsonDecode()
	-- upvalues: t_115 (ref)
	local var3210 = t_115.new()
	
	if self.text ~= nil then
		var3210.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3210.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3210.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		var3210.url = self.url
	end
	return var3210
end

t_115.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_115
typeRegistryModule.default:register(t.TextInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t_116 (ref)
	return setmetatable({
		entry_map = if p116 == nil or p116.entry_map == nil then {} else p116.entry_map,
		entry_order = if p116 == nil or p116.entry_order == nil then {} else p116.entry_order,
		entry_order_map = if p116 == nil or p116.entry_order_map == nil then {} else p116.entry_order_map,
		content_pools = if p116 == nil or p116.content_pools == nil then {} else p116.content_pools
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3210 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3211, var3212 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3211, var4661 = protoModule.writeString(var3211, var3212, i)
			local var3213 = v:encode()
			var3212, var4663 = protoModule.writeTag(var3211, var3212, 2, protoModule.wireTypes.lengthDelimited)
			var3212, var4663 = protoModule.writeBuffer(var3212, var4663, var3213, buffer.len(var3213))
			local var3214 = var3212
			local var3215 = var4663
			local var3216, var3217 = protoModule.writeTag(buff, var3210, 1, protoModule.wireTypes.lengthDelimited)
			var3216, var4667 = protoModule.writeBuffer(var3216, var3217, var3214, var3215)
			buff = var3216
			var3210 = var3217
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3218, var3219 = protoModule.writeTag(buff, var3210, 2, protoModule.wireTypes.lengthDelimited)
			var3218, var4669 = protoModule.writeString(var3218, var3219, v)
			buff = var3218
			var3210 = var3219
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3220, var3221 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3220, var4671 = protoModule.writeString(var3220, var3221, i)
			local var3222 = v:encode()
			var3221, var4673 = protoModule.writeTag(var3220, var3221, 2, protoModule.wireTypes.lengthDelimited)
			var3221, var4673 = protoModule.writeBuffer(var3221, var4673, var3222, buffer.len(var3222))
			local var3223 = var3221
			local var3224 = var4673
			local var3225, var3226 = protoModule.writeTag(buff, var3210, 3, protoModule.wireTypes.lengthDelimited)
			var3225, var4677 = protoModule.writeBuffer(var3225, var3226, var3223, var3224)
			buff = var3225
			var3210 = var3226
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3227, var3228 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3227, var4679 = protoModule.writeString(var3227, var3228, i)
			local var3229 = v:encode()
			var3228, var4681 = protoModule.writeTag(var3227, var3228, 2, protoModule.wireTypes.lengthDelimited)
			var3228, var4681 = protoModule.writeBuffer(var3228, var4681, var3229, buffer.len(var3229))
			local var3230 = var3228
			local var3231 = var4681
			local var3232, var3233 = protoModule.writeTag(buff, var3210, 4, protoModule.wireTypes.lengthDelimited)
			var3232, var4685 = protoModule.writeBuffer(var3232, var3233, var3230, var3231)
			buff = var3232
			var3210 = var3233
		end
	end
	local buff_1 = buffer.create(var3210)
	buffer.copy(buff_1, 0, buff, 0, var3210)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3234 = t_116.new()
	local var3235 = 0
	while var3235 < buffer.len(p116) do
		local _ = nil
		local var3236 = nil
		local var3237, var3238, var3239 = protoModule.readTag(p116, var3235)
		local var3240 = var3237
		var3236 = var3238
		var3235 = var3239
		
		if var3236 == protoModule.wireTypes.varint then
			local _ = nil
			local var3241, var3242 = protoModule.readVarInt(p116, var3235)
			local _ = var3241
			var3235 = var3242
			continue
		end
		if var3236 == protoModule.wireTypes.lengthDelimited then
			if var3240 == 1 then
				local _ = nil
				local var3243, var3244 = protoModule.readBuffer(p116, var3235)
				var3235 = var3244
				var3243 = t.VerticalFeedInputData_EntryMapEntry.decode(var3243)
				var3234.entry_map[var3243.key or ""] = var3243.value or t.FeedEntry.new()
			elseif var3240 == 2 then
				local _ = nil
				local var3245, var3246 = protoModule.readBuffer(p116, var3235)
				var3235 = var3246
				table.insert(var3234.entry_order, buffer.tostring(var3245))
			elseif var3240 == 3 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p116, var3235)
				var3235 = var3248
				var3247 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3247)
				var3234.entry_order_map[var3247.key or ""] = var3247.value or t.EntryOrder.new()
			elseif var3240 == 4 then
				local _ = nil
				local var3249, var3250 = protoModule.readBuffer(p116, var3235)
				var3235 = var3250
				var3249 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3249)
				var3234.content_pools[var3249.key or ""] = var3249.value or t.ContentPool.new()
			else
				local _ = nil
				local var3251, var3252 = protoModule.readVarInt(p116, var3235)
				var3235 = var3252 + var3251
			end
		elseif var3236 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3253, var3254 = protoModule.readFixed32(p116, var3235)
			local _ = var3253
			var3235 = var3254
		elseif var3236 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3255, var3256 = protoModule.readFixed64(p116, var3235)
			local _ = var3255
			var3235 = var3256
		else
			error("Unsupported wire type: " .. var4689)
		end
	end
	return var3234
end

function t_116:jsonEncode()
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryOrderMap = t_1
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = v:jsonEncode()
		end
		t.contentPools = t_1
	end
	return t
end

function t_116:jsonDecode()
	-- upvalues: t_116 (ref), t (ref)
	local var3257 = t_116.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3257.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3257.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3257.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3257.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3257.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3257.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3257.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3257.content_pools = t_1
	end
	return var3257
end

t_116.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_116
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		key = if p117 == nil or p117.key == nil then "" else p117.key,
		value = if p117 == nil or p117.value == nil then nil else p117.value
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3258 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3259, var3260 = protoModule.writeTag(buff, var3258, 1, protoModule.wireTypes.lengthDelimited)
		var3259, var4727 = protoModule.writeString(var3259, var3260, self.key)
		buff = var3259
		var3258 = var3260
	end
	if self.value ~= nil then
		local var3261 = self.value:encode()
		local var3262, var3263 = protoModule.writeTag(buff, var3258, 2, protoModule.wireTypes.lengthDelimited)
		var3262, var4730 = protoModule.writeBuffer(var3262, var3263, var3261, buffer.len(var3261))
		buff = var3262
		var3258 = var3263
	end
	local buff_1 = buffer.create(var3258)
	buffer.copy(buff_1, 0, buff, 0, var3258)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3258 = t_117.new()
	local var3259 = 0
	while var3259 < buffer.len(p117) do
		local _ = nil
		local var3260 = nil
		local var3261, var3262, var3263 = protoModule.readTag(p117, var3259)
		local var3264 = var3261
		var3260 = var3262
		var3259 = var3263
		
		if var3260 == protoModule.wireTypes.varint then
			local _ = nil
			local var3265, var3266 = protoModule.readVarInt(p117, var3259)
			local _ = var3265
			var3259 = var3266
			continue
		end
		if var3260 == protoModule.wireTypes.lengthDelimited then
			if var3264 == 1 then
				local _ = nil
				local var3267, var3268 = protoModule.readBuffer(p117, var3259)
				var3259 = var3268
				var3258.key = buffer.tostring(var3267)
			elseif var3264 == 2 then
				local _ = nil
				local var3269, var3270 = protoModule.readBuffer(p117, var3259)
				var3259 = var3270
				var3258.value = t.FeedEntry.decode(var3269)
			else
				local _ = nil
				local var3271, var3272 = protoModule.readVarInt(p117, var3259)
				var3259 = var3272 + var3271
			end
		elseif var3260 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3273, var3274 = protoModule.readFixed32(p117, var3259)
			local _ = var3273
			var3259 = var3274
		elseif var3260 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3275, var3276 = protoModule.readFixed64(p117, var3259)
			local _ = var3275
			var3259 = var3276
		else
			error("Unsupported wire type: " .. var4734)
		end
	end
	return var3258
end

function t_117:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), t (ref)
	local var3277 = t_117.new()
	
	if self.key ~= nil then
		var3277.key = self.key
	end
	if self.value ~= nil then
		var3277.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3277
end

t_117.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_117
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		key = if p118 == nil or p118.key == nil then "" else p118.key,
		value = if p118 == nil or p118.value == nil then nil else p118.value
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3277 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3278, var3279 = protoModule.writeTag(buff, var3277, 1, protoModule.wireTypes.lengthDelimited)
		var3278, var4756 = protoModule.writeString(var3278, var3279, self.key)
		buff = var3278
		var3277 = var3279
	end
	if self.value ~= nil then
		local var3280 = self.value:encode()
		local var3281, var3282 = protoModule.writeTag(buff, var3277, 2, protoModule.wireTypes.lengthDelimited)
		var3281, var4759 = protoModule.writeBuffer(var3281, var3282, var3280, buffer.len(var3280))
		buff = var3281
		var3277 = var3282
	end
	local buff_1 = buffer.create(var3277)
	buffer.copy(buff_1, 0, buff, 0, var3277)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3277 = t_118.new()
	local var3278 = 0
	while var3278 < buffer.len(p118) do
		local _ = nil
		local var3279 = nil
		local var3280, var3281, var3282 = protoModule.readTag(p118, var3278)
		local var3283 = var3280
		var3279 = var3281
		var3278 = var3282
		
		if var3279 == protoModule.wireTypes.varint then
			local _ = nil
			local var3284, var3285 = protoModule.readVarInt(p118, var3278)
			local _ = var3284
			var3278 = var3285
			continue
		end
		if var3279 == protoModule.wireTypes.lengthDelimited then
			if var3283 == 1 then
				local _ = nil
				local var3286, var3287 = protoModule.readBuffer(p118, var3278)
				var3278 = var3287
				var3277.key = buffer.tostring(var3286)
			elseif var3283 == 2 then
				local _ = nil
				local var3288, var3289 = protoModule.readBuffer(p118, var3278)
				var3278 = var3289
				var3277.value = t.EntryOrder.decode(var3288)
			else
				local _ = nil
				local var3290, var3291 = protoModule.readVarInt(p118, var3278)
				var3278 = var3291 + var3290
			end
		elseif var3279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3292, var3293 = protoModule.readFixed32(p118, var3278)
			local _ = var3292
			var3278 = var3293
		elseif var3279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3294, var3295 = protoModule.readFixed64(p118, var3278)
			local _ = var3294
			var3278 = var3295
		else
			error("Unsupported wire type: " .. var4763)
		end
	end
	return var3277
end

function t_118:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var3296 = t_118.new()
	
	if self.key ~= nil then
		var3296.key = self.key
	end
	if self.value ~= nil then
		var3296.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3296
end

t_118.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_118
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		key = if p119 == nil or p119.key == nil then "" else p119.key,
		value = if p119 == nil or p119.value == nil then nil else p119.value
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3296 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3297, var3298 = protoModule.writeTag(buff, var3296, 1, protoModule.wireTypes.lengthDelimited)
		var3297, var4785 = protoModule.writeString(var3297, var3298, self.key)
		buff = var3297
		var3296 = var3298
	end
	if self.value ~= nil then
		local var3299 = self.value:encode()
		local var3300, var3301 = protoModule.writeTag(buff, var3296, 2, protoModule.wireTypes.lengthDelimited)
		var3300, var4788 = protoModule.writeBuffer(var3300, var3301, var3299, buffer.len(var3299))
		buff = var3300
		var3296 = var3301
	end
	local buff_1 = buffer.create(var3296)
	buffer.copy(buff_1, 0, buff, 0, var3296)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var3296 = t_119.new()
	local var3297 = 0
	while var3297 < buffer.len(p119) do
		local _ = nil
		local var3298 = nil
		local var3299, var3300, var3301 = protoModule.readTag(p119, var3297)
		local var3302 = var3299
		var3298 = var3300
		var3297 = var3301
		
		if var3298 == protoModule.wireTypes.varint then
			local _ = nil
			local var3303, var3304 = protoModule.readVarInt(p119, var3297)
			local _ = var3303
			var3297 = var3304
			continue
		end
		if var3298 == protoModule.wireTypes.lengthDelimited then
			if var3302 == 1 then
				local _ = nil
				local var3305, var3306 = protoModule.readBuffer(p119, var3297)
				var3297 = var3306
				var3296.key = buffer.tostring(var3305)
			elseif var3302 == 2 then
				local _ = nil
				local var3307, var3308 = protoModule.readBuffer(p119, var3297)
				var3297 = var3308
				var3296.value = t.ContentPool.decode(var3307)
			else
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p119, var3297)
				var3297 = var3310 + var3309
			end
		elseif var3298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3311, var3312 = protoModule.readFixed32(p119, var3297)
			local _ = var3311
			var3297 = var3312
		elseif var3298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3313, var3314 = protoModule.readFixed64(p119, var3297)
			local _ = var3313
			var3297 = var3314
		else
			error("Unsupported wire type: " .. var4792)
		end
	end
	return var3296
end

function t_119:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), t (ref)
	local var3315 = t_119.new()
	
	if self.key ~= nil then
		var3315.key = self.key
	end
	if self.value ~= nil then
		var3315.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3315
end

t_119.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_119
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		foreground_header_entry = if p120 == nil or p120.foreground_header_entry == nil then nil else p120.foreground_header_entry,
		background_header_entry = if p120 == nil or p120.background_header_entry == nil then nil else p120.background_header_entry,
		layout_variant = if p120 == nil or p120.layout_variant == nil then "" else p120.layout_variant
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3315 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3316 = self.foreground_header_entry:encode()
		local var3317, var3318 = protoModule.writeTag(buff, var3315, 1, protoModule.wireTypes.lengthDelimited)
		var3317, var4815 = protoModule.writeBuffer(var3317, var3318, var3316, buffer.len(var3316))
		buff = var3317
		var3315 = var3318
	end
	if self.background_header_entry ~= nil then
		local var3319 = self.background_header_entry:encode()
		local var3320, var3321 = protoModule.writeTag(buff, var3315, 2, protoModule.wireTypes.lengthDelimited)
		var3320, var4818 = protoModule.writeBuffer(var3320, var3321, var3319, buffer.len(var3319))
		buff = var3320
		var3315 = var3321
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3322, var3323 = protoModule.writeTag(buff, var3315, 3, protoModule.wireTypes.lengthDelimited)
		var3322, var4820 = protoModule.writeString(var3322, var3323, self.layout_variant)
		buff = var3322
		var3315 = var3323
	end
	local buff_1 = buffer.create(var3315)
	buffer.copy(buff_1, 0, buff, 0, var3315)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), t (ref)
	local var3315 = t_120.new()
	local var3316 = 0
	while var3316 < buffer.len(p120) do
		local _ = nil
		local var3317 = nil
		local var3318, var3319, var3320 = protoModule.readTag(p120, var3316)
		local var3321 = var3318
		var3317 = var3319
		var3316 = var3320
		
		if var3317 == protoModule.wireTypes.varint then
			local _ = nil
			local var3322, var3323 = protoModule.readVarInt(p120, var3316)
			local _ = var3322
			var3316 = var3323
			continue
		end
		if var3317 == protoModule.wireTypes.lengthDelimited then
			if var3321 == 1 then
				local _ = nil
				local var3324, var3325 = protoModule.readBuffer(p120, var3316)
				var3316 = var3325
				var3315.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3324)
			elseif var3321 == 2 then
				local _ = nil
				local var3326, var3327 = protoModule.readBuffer(p120, var3316)
				var3316 = var3327
				var3315.background_header_entry = t.BackgroundHeaderEntry.decode(var3326)
			elseif var3321 == 3 then
				local _ = nil
				local var3328, var3329 = protoModule.readBuffer(p120, var3316)
				var3316 = var3329
				var3315.layout_variant = buffer.tostring(var3328)
			else
				local _ = nil
				local var3330, var3331 = protoModule.readVarInt(p120, var3316)
				var3316 = var3331 + var3330
			end
		elseif var3317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3332, var3333 = protoModule.readFixed32(p120, var3316)
			local _ = var3332
			var3316 = var3333
		elseif var3317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3334, var3335 = protoModule.readFixed64(p120, var3316)
			local _ = var3334
			var3316 = var3335
		else
			error("Unsupported wire type: " .. var4824)
		end
	end
	return var3315
end

function t_120:jsonEncode()
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		t.layoutVariant = self.layout_variant
	end
	return t
end

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), t (ref)
	local var3336 = t_120.new()
	
	if self.foreground_header_entry ~= nil then
		var3336.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3336.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3336.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3336.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3336.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3336.layout_variant = self.layoutVariant
	end
	return var3336
end

t_120.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_120
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		cta_button_text = if p121 == nil or p121.cta_button_text == nil then "" else p121.cta_button_text,
		cta_type = if p121 == nil or p121.cta_type == nil then "" else p121.cta_type
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3336 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3337, var3338 = protoModule.writeTag(buff, var3336, 1, protoModule.wireTypes.lengthDelimited)
		var3337, var4848 = protoModule.writeString(var3337, var3338, self.cta_button_text)
		buff = var3337
		var3336 = var3338
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3339, var3340 = protoModule.writeTag(buff, var3336, 2, protoModule.wireTypes.lengthDelimited)
		var3339, var4850 = protoModule.writeString(var3339, var3340, self.cta_type)
		buff = var3339
		var3336 = var3340
	end
	local buff_1 = buffer.create(var3336)
	buffer.copy(buff_1, 0, buff, 0, var3336)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3336 = t_121.new()
	local var3337 = 0
	while var3337 < buffer.len(p121) do
		local _ = nil
		local var3338 = nil
		local var3339, var3340, var3341 = protoModule.readTag(p121, var3337)
		local var3342 = var3339
		var3338 = var3340
		var3337 = var3341
		
		if var3338 == protoModule.wireTypes.varint then
			local _ = nil
			local var3343, var3344 = protoModule.readVarInt(p121, var3337)
			local _ = var3343
			var3337 = var3344
			continue
		end
		if var3338 == protoModule.wireTypes.lengthDelimited then
			if var3342 == 1 then
				local _ = nil
				local var3345, var3346 = protoModule.readBuffer(p121, var3337)
				var3337 = var3346
				var3336.cta_button_text = buffer.tostring(var3345)
			elseif var3342 == 2 then
				local _ = nil
				local var3347, var3348 = protoModule.readBuffer(p121, var3337)
				var3337 = var3348
				var3336.cta_type = buffer.tostring(var3347)
			else
				local _ = nil
				local var3349, var3350 = protoModule.readVarInt(p121, var3337)
				var3337 = var3350 + var3349
			end
		elseif var3338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3351, var3352 = protoModule.readFixed32(p121, var3337)
			local _ = var3351
			var3337 = var3352
		elseif var3338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3353, var3354 = protoModule.readFixed64(p121, var3337)
			local _ = var3353
			var3337 = var3354
		else
			error("Unsupported wire type: " .. var4854)
		end
	end
	return var3336
end

function t_121:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_121:jsonDecode()
	-- upvalues: t_121 (ref)
	local var3355 = t_121.new()
	
	if self.cta_button_text ~= nil then
		var3355.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3355.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3355.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3355.cta_type = self.ctaType
	end
	return var3355
end

t_121.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_121
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		title = if p122 == nil or p122.title == nil then "" else p122.title,
		cta_button_text = if p122 == nil or p122.cta_button_text == nil then "" else p122.cta_button_text,
		image_asset_id = if p122 == nil or p122.image_asset_id == nil then "" else p122.image_asset_id,
		cta_type = if p122 == nil or p122.cta_type == nil then "" else p122.cta_type
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3355 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3356, var3357 = protoModule.writeTag(buff, var3355, 1, protoModule.wireTypes.lengthDelimited)
		var3356, var4876 = protoModule.writeString(var3356, var3357, self.title)
		buff = var3356
		var3355 = var3357
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3358, var3359 = protoModule.writeTag(buff, var3355, 2, protoModule.wireTypes.lengthDelimited)
		var3358, var4878 = protoModule.writeString(var3358, var3359, self.cta_button_text)
		buff = var3358
		var3355 = var3359
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3360, var3361 = protoModule.writeTag(buff, var3355, 3, protoModule.wireTypes.lengthDelimited)
		var3360, var4880 = protoModule.writeString(var3360, var3361, self.image_asset_id)
		buff = var3360
		var3355 = var3361
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3362, var3363 = protoModule.writeTag(buff, var3355, 4, protoModule.wireTypes.lengthDelimited)
		var3362, var4882 = protoModule.writeString(var3362, var3363, self.cta_type)
		buff = var3362
		var3355 = var3363
	end
	local buff_1 = buffer.create(var3355)
	buffer.copy(buff_1, 0, buff, 0, var3355)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref)
	local var3355 = t_122.new()
	local var3356 = 0
	while var3356 < buffer.len(p122) do
		local _ = nil
		local var3357 = nil
		local var3358, var3359, var3360 = protoModule.readTag(p122, var3356)
		local var3361 = var3358
		var3357 = var3359
		var3356 = var3360
		
		if var3357 == protoModule.wireTypes.varint then
			local _ = nil
			local var3362, var3363 = protoModule.readVarInt(p122, var3356)
			local _ = var3362
			var3356 = var3363
			continue
		end
		if var3357 == protoModule.wireTypes.lengthDelimited then
			if var3361 == 1 then
				local _ = nil
				local var3364, var3365 = protoModule.readBuffer(p122, var3356)
				var3356 = var3365
				var3355.title = buffer.tostring(var3364)
			elseif var3361 == 2 then
				local _ = nil
				local var3366, var3367 = protoModule.readBuffer(p122, var3356)
				var3356 = var3367
				var3355.cta_button_text = buffer.tostring(var3366)
			elseif var3361 == 3 then
				local _ = nil
				local var3368, var3369 = protoModule.readBuffer(p122, var3356)
				var3356 = var3369
				var3355.image_asset_id = buffer.tostring(var3368)
			elseif var3361 == 4 then
				local _ = nil
				local var3370, var3371 = protoModule.readBuffer(p122, var3356)
				var3356 = var3371
				var3355.cta_type = buffer.tostring(var3370)
			else
				local _ = nil
				local var3372, var3373 = protoModule.readVarInt(p122, var3356)
				var3356 = var3373 + var3372
			end
		elseif var3357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3374, var3375 = protoModule.readFixed32(p122, var3356)
			local _ = var3374
			var3356 = var3375
		elseif var3357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3376, var3377 = protoModule.readFixed64(p122, var3356)
			local _ = var3376
			var3356 = var3377
		else
			error("Unsupported wire type: " .. var4886)
		end
	end
	return var3355
end

function t_122:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_122:jsonDecode()
	-- upvalues: t_122 (ref)
	local var3378 = t_122.new()
	
	if self.title ~= nil then
		var3378.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3378.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3378.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3378.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3378.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3378.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3378.cta_type = self.ctaType
	end
	return var3378
end

t_122.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_122
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		title = if p123 == nil or p123.title == nil then "" else p123.title,
		url = if p123 == nil or p123.url == nil then nil else p123.url,
		destination = if p123 == nil or p123.destination == nil then nil else p123.destination,
		row_id = if p123 == nil or p123.row_id == nil then "" else p123.row_id
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3378 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3379, var3380 = protoModule.writeTag(buff, var3378, 1, protoModule.wireTypes.lengthDelimited)
		var3379, var4912 = protoModule.writeString(var3379, var3380, self.title)
		buff = var3379
		var3378 = var3380
	end
	if self.url ~= nil then
		local var3381, var3382 = protoModule.writeTag(buff, var3378, 2, protoModule.wireTypes.lengthDelimited)
		var3381, var4914 = protoModule.writeString(var3381, var3382, self.url)
		buff = var3381
		var3378 = var3382
	end
	if self.destination ~= nil then
		local var3383, var3384 = protoModule.writeTag(buff, var3378, 3, protoModule.wireTypes.lengthDelimited)
		var3383, var4916 = protoModule.writeString(var3383, var3384, self.destination)
		buff = var3383
		var3378 = var3384
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3385, var3386 = protoModule.writeTag(buff, var3378, 4, protoModule.wireTypes.lengthDelimited)
		var3385, var4918 = protoModule.writeString(var3385, var3386, self.row_id)
		buff = var3385
		var3378 = var3386
	end
	local buff_1 = buffer.create(var3378)
	buffer.copy(buff_1, 0, buff, 0, var3378)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3378 = t_123.new()
	local var3379 = 0
	while var3379 < buffer.len(p123) do
		local _ = nil
		local var3380 = nil
		local var3381, var3382, var3383 = protoModule.readTag(p123, var3379)
		local var3384 = var3381
		var3380 = var3382
		var3379 = var3383
		
		if var3380 == protoModule.wireTypes.varint then
			local _ = nil
			local var3385, var3386 = protoModule.readVarInt(p123, var3379)
			local _ = var3385
			var3379 = var3386
			continue
		end
		if var3380 == protoModule.wireTypes.lengthDelimited then
			if var3384 == 1 then
				local _ = nil
				local var3387, var3388 = protoModule.readBuffer(p123, var3379)
				var3379 = var3388
				var3378.title = buffer.tostring(var3387)
			elseif var3384 == 2 then
				local _ = nil
				local var3389, var3390 = protoModule.readBuffer(p123, var3379)
				var3379 = var3390
				var3378.url = buffer.tostring(var3389)
			elseif var3384 == 3 then
				local _ = nil
				local var3391, var3392 = protoModule.readBuffer(p123, var3379)
				var3379 = var3392
				var3378.destination = buffer.tostring(var3391)
			elseif var3384 == 4 then
				local _ = nil
				local var3393, var3394 = protoModule.readBuffer(p123, var3379)
				var3379 = var3394
				var3378.row_id = buffer.tostring(var3393)
			else
				local _ = nil
				local var3395, var3396 = protoModule.readVarInt(p123, var3379)
				var3379 = var3396 + var3395
			end
		elseif var3380 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3397, var3398 = protoModule.readFixed32(p123, var3379)
			local _ = var3397
			var3379 = var3398
		elseif var3380 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3399, var3400 = protoModule.readFixed64(p123, var3379)
			local _ = var3399
			var3379 = var3400
		else
			error("Unsupported wire type: " .. var4922)
		end
	end
	return var3378
end

function t_123:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.url ~= nil then
		t.url = self.url
	end
	if self.destination ~= nil then
		t.destination = self.destination
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		t.rowId = self.row_id
	end
	return t
end

function t_123:jsonDecode()
	-- upvalues: t_123 (ref)
	local var3401 = t_123.new()
	
	if self.title ~= nil then
		var3401.title = self.title
	end
	if self.url ~= nil then
		var3401.url = self.url
	end
	if self.destination ~= nil then
		var3401.destination = self.destination
	end
	if self.row_id ~= nil then
		var3401.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3401.row_id = self.rowId
	end
	return var3401
end

t_123.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = t_123
typeRegistryModule.default:register(t.SettingsRowInputData)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		setting_key = if p124 == nil or p124.setting_key == nil then "" else p124.setting_key,
		label = if p124 == nil or p124.label == nil then "" else p124.label,
		description = if p124 == nil or p124.description == nil then "" else p124.description,
		is_checked = if p124 == nil or p124.is_checked == nil then false else p124.is_checked,
		is_disabled = if p124 == nil or p124.is_disabled == nil then false else p124.is_disabled,
		audit_data = if p124 == nil or p124.audit_data == nil then "" else p124.audit_data
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3401 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3402, var3403 = protoModule.writeTag(buff, var3401, 1, protoModule.wireTypes.lengthDelimited)
		var3402, var4948 = protoModule.writeString(var3402, var3403, self.setting_key)
		buff = var3402
		var3401 = var3403
	end
	if self.label ~= nil and self.label ~= "" then
		local var3404, var3405 = protoModule.writeTag(buff, var3401, 2, protoModule.wireTypes.lengthDelimited)
		var3404, var4950 = protoModule.writeString(var3404, var3405, self.label)
		buff = var3404
		var3401 = var3405
	end
	if self.description ~= nil and self.description ~= "" then
		local var3406, var3407 = protoModule.writeTag(buff, var3401, 3, protoModule.wireTypes.lengthDelimited)
		var3406, var4952 = protoModule.writeString(var3406, var3407, self.description)
		buff = var3406
		var3401 = var3407
	end
	if self.is_checked then
		local var3408, var3409 = protoModule.writeTag(buff, var3401, 4, protoModule.wireTypes.varint)
		var3408, var4954 = protoModule.writeVarInt(var3408, var3409, if self.is_checked then 1 else 0)
		buff = var3408
		var3401 = var3409
	end
	if self.is_disabled then
		local var3410, var3411 = protoModule.writeTag(buff, var3401, 5, protoModule.wireTypes.varint)
		var3410, var4956 = protoModule.writeVarInt(var3410, var3411, if self.is_disabled then 1 else 0)
		buff = var3410
		var3401 = var3411
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3412, var3413 = protoModule.writeTag(buff, var3401, 6, protoModule.wireTypes.lengthDelimited)
		var3412, var4958 = protoModule.writeString(var3412, var3413, self.audit_data)
		buff = var3412
		var3401 = var3413
	end
	local buff_1 = buffer.create(var3401)
	buffer.copy(buff_1, 0, buff, 0, var3401)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3401 = t_124.new()
	local var3402 = 0
	while var3402 < buffer.len(p124) do
		local _ = nil
		local var3403 = nil
		local var3404, var3405, var3406 = protoModule.readTag(p124, var3402)
		local var3407 = var3404
		var3403 = var3405
		var3402 = var3406
		
		if var3403 == protoModule.wireTypes.varint then
			if var3407 == 4 then
				local _ = nil
				local var3408, var3409 = protoModule.readVarInt(p124, var3402)
				var3402 = var3409
				var3401.is_checked = var3408 ~= 0
			elseif var3407 == 5 then
				local _ = nil
				local var3410, var3411 = protoModule.readVarInt(p124, var3402)
				var3402 = var3411
				var3401.is_disabled = var3410 ~= 0
			else
				local _ = nil
				local var3412, var3413 = protoModule.readVarInt(p124, var3402)
				local _ = var3412
				var3402 = var3413
			end
		end
		if var3403 == protoModule.wireTypes.lengthDelimited then
			if var3407 == 1 then
				local _ = nil
				local var3414, var3415 = protoModule.readBuffer(p124, var3402)
				var3402 = var3415
				var3401.setting_key = buffer.tostring(var3414)
			elseif var3407 == 2 then
				local _ = nil
				local var3416, var3417 = protoModule.readBuffer(p124, var3402)
				var3402 = var3417
				var3401.label = buffer.tostring(var3416)
			elseif var3407 == 3 then
				local _ = nil
				local var3418, var3419 = protoModule.readBuffer(p124, var3402)
				var3402 = var3419
				var3401.description = buffer.tostring(var3418)
			elseif var3407 == 6 then
				local _ = nil
				local var3420, var3421 = protoModule.readBuffer(p124, var3402)
				var3402 = var3421
				var3401.audit_data = buffer.tostring(var3420)
			else
				local _ = nil
				local var3422, var3423 = protoModule.readVarInt(p124, var3402)
				var3402 = var3423 + var3422
			end
		elseif var3403 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3424, var3425 = protoModule.readFixed32(p124, var3402)
			local _ = var3424
			var3402 = var3425
		elseif var3403 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3426, var3427 = protoModule.readFixed64(p124, var3402)
			local _ = var3426
			var3402 = var3427
		else
			error("Unsupported wire type: " .. var4962)
		end
	end
	return var3401
end

function t_124:jsonEncode()
	local t = {}
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		t.settingKey = self.setting_key
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.is_checked then
		t.isChecked = self.is_checked
	end
	if self.is_disabled then
		t.isDisabled = self.is_disabled
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		t.auditData = self.audit_data
	end
	return t
end

function t_124:jsonDecode()
	-- upvalues: t_124 (ref)
	local var3428 = t_124.new()
	
	if self.setting_key ~= nil then
		var3428.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3428.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3428.label = self.label
	end
	if self.description ~= nil then
		var3428.description = self.description
	end
	if self.is_checked ~= nil then
		var3428.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3428.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3428.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3428.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3428.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3428.audit_data = self.auditData
	end
	return var3428
end

t_124.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = t_124
typeRegistryModule.default:register(t.SettingsToggleInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		universe_id = if p125 == nil or p125.universe_id == nil then nil else p125.universe_id,
		title = if p125 == nil or p125.title == nil then nil else p125.title,
		subtitle = if p125 == nil or p125.subtitle == nil then nil else p125.subtitle,
		badge_text = if p125 == nil or p125.badge_text == nil then nil else p125.badge_text,
		foreground = if p125 == nil or p125.foreground == nil then nil else p125.foreground,
		background = if p125 == nil or p125.background == nil then nil else p125.background,
		title_image = if p125 == nil or p125.title_image == nil then nil else p125.title_image,
		asset_title = if p125 == nil or p125.asset_title == nil then nil else p125.asset_title,
		asset_subtitle = if p125 == nil or p125.asset_subtitle == nil then nil else p125.asset_subtitle,
		gradient = if p125 == nil or p125.gradient == nil then nil else p125.gradient,
		playable_text = if p125 == nil or p125.playable_text == nil then nil else p125.playable_text,
		collection_id = if p125 == nil or p125.collection_id == nil then nil else p125.collection_id,
		campaign_id = if p125 == nil or p125.campaign_id == nil then nil else p125.campaign_id,
		cohort_id = if p125 == nil or p125.cohort_id == nil then nil else p125.cohort_id,
		sort_id = if p125 == nil or p125.sort_id == nil then nil else p125.sort_id,
		hero_unit_id = if p125 == nil or p125.hero_unit_id == nil then nil else p125.hero_unit_id,
		analytics_id = if p125 == nil or p125.analytics_id == nil then nil else p125.analytics_id,
		is_sponsored = if p125 == nil or p125.is_sponsored == nil then nil else p125.is_sponsored
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3428 = 0
	
	if self.universe_id ~= nil then
		local var3429, var3430 = protoModule.writeTag(buff, var3428, 1, protoModule.wireTypes.lengthDelimited)
		var3429, var4992 = protoModule.writeString(var3429, var3430, self.universe_id)
		buff = var3429
		var3428 = var3430
	end
	if self.title ~= nil then
		local var3431, var3432 = protoModule.writeTag(buff, var3428, 2, protoModule.wireTypes.lengthDelimited)
		var3431, var4994 = protoModule.writeString(var3431, var3432, self.title)
		buff = var3431
		var3428 = var3432
	end
	if self.subtitle ~= nil then
		local var3433, var3434 = protoModule.writeTag(buff, var3428, 3, protoModule.wireTypes.lengthDelimited)
		var3433, var4996 = protoModule.writeString(var3433, var3434, self.subtitle)
		buff = var3433
		var3428 = var3434
	end
	if self.badge_text ~= nil then
		local var3435, var3436 = protoModule.writeTag(buff, var3428, 4, protoModule.wireTypes.lengthDelimited)
		var3435, var4998 = protoModule.writeString(var3435, var3436, self.badge_text)
		buff = var3435
		var3428 = var3436
	end
	if self.foreground ~= nil then
		local var3437 = self.foreground:encode()
		local var3438, var3439 = protoModule.writeTag(buff, var3428, 5, protoModule.wireTypes.lengthDelimited)
		var3438, var5001 = protoModule.writeBuffer(var3438, var3439, var3437, buffer.len(var3437))
		buff = var3438
		var3428 = var3439
	end
	if self.background ~= nil then
		local var3440 = self.background:encode()
		local var3441, var3442 = protoModule.writeTag(buff, var3428, 6, protoModule.wireTypes.lengthDelimited)
		var3441, var5004 = protoModule.writeBuffer(var3441, var3442, var3440, buffer.len(var3440))
		buff = var3441
		var3428 = var3442
	end
	if self.title_image ~= nil then
		local var3443 = self.title_image:encode()
		local var3444, var3445 = protoModule.writeTag(buff, var3428, 7, protoModule.wireTypes.lengthDelimited)
		var3444, var5007 = protoModule.writeBuffer(var3444, var3445, var3443, buffer.len(var3443))
		buff = var3444
		var3428 = var3445
	end
	if self.asset_title ~= nil then
		local var3446, var3447 = protoModule.writeTag(buff, var3428, 8, protoModule.wireTypes.lengthDelimited)
		var3446, var5009 = protoModule.writeString(var3446, var3447, self.asset_title)
		buff = var3446
		var3428 = var3447
	end
	if self.asset_subtitle ~= nil then
		local var3448, var3449 = protoModule.writeTag(buff, var3428, 9, protoModule.wireTypes.lengthDelimited)
		var3448, var5011 = protoModule.writeString(var3448, var3449, self.asset_subtitle)
		buff = var3448
		var3428 = var3449
	end
	if self.gradient ~= nil then
		local var3450 = self.gradient:encode()
		local var3451, var3452 = protoModule.writeTag(buff, var3428, 10, protoModule.wireTypes.lengthDelimited)
		var3451, var5014 = protoModule.writeBuffer(var3451, var3452, var3450, buffer.len(var3450))
		buff = var3451
		var3428 = var3452
	end
	if self.playable_text ~= nil then
		local var3453, var3454 = protoModule.writeTag(buff, var3428, 11, protoModule.wireTypes.lengthDelimited)
		var3453, var5016 = protoModule.writeString(var3453, var3454, self.playable_text)
		buff = var3453
		var3428 = var3454
	end
	if self.collection_id ~= nil then
		local var3455, var3456 = protoModule.writeTag(buff, var3428, 12, protoModule.wireTypes.lengthDelimited)
		var3455, var5018 = protoModule.writeString(var3455, var3456, self.collection_id)
		buff = var3455
		var3428 = var3456
	end
	if self.campaign_id ~= nil then
		local var3457, var3458 = protoModule.writeTag(buff, var3428, 13, protoModule.wireTypes.lengthDelimited)
		var3457, var5020 = protoModule.writeString(var3457, var3458, self.campaign_id)
		buff = var3457
		var3428 = var3458
	end
	if self.cohort_id ~= nil then
		local var3459, var3460 = protoModule.writeTag(buff, var3428, 14, protoModule.wireTypes.lengthDelimited)
		var3459, var5022 = protoModule.writeString(var3459, var3460, self.cohort_id)
		buff = var3459
		var3428 = var3460
	end
	if self.sort_id ~= nil then
		local var3461, var3462 = protoModule.writeTag(buff, var3428, 15, protoModule.wireTypes.lengthDelimited)
		var3461, var5024 = protoModule.writeString(var3461, var3462, self.sort_id)
		buff = var3461
		var3428 = var3462
	end
	if self.hero_unit_id ~= nil then
		local var3463, var3464 = protoModule.writeTag(buff, var3428, 16, protoModule.wireTypes.lengthDelimited)
		var3463, var5026 = protoModule.writeString(var3463, var3464, self.hero_unit_id)
		buff = var3463
		var3428 = var3464
	end
	if self.analytics_id ~= nil then
		local var3465, var3466 = protoModule.writeTag(buff, var3428, 17, protoModule.wireTypes.lengthDelimited)
		var3465, var5028 = protoModule.writeString(var3465, var3466, self.analytics_id)
		buff = var3465
		var3428 = var3466
	end
	if self.is_sponsored ~= nil then
		local var3467, var3468 = protoModule.writeTag(buff, var3428, 18, protoModule.wireTypes.varint)
		var3467, var5030 = protoModule.writeVarInt(var3467, var3468, if self.is_sponsored then 1 else 0)
		buff = var3467
		var3428 = var3468
	end
	local buff_1 = buffer.create(var3428)
	buffer.copy(buff_1, 0, buff, 0, var3428)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3428 = t_125.new()
	local var3429 = 0
	while var3429 < buffer.len(p125) do
		local _ = nil
		local var3430 = nil
		local var3431, var3432, var3433 = protoModule.readTag(p125, var3429)
		local var3434 = var3431
		var3430 = var3432
		var3429 = var3433
		
		if var3430 == protoModule.wireTypes.varint then
			if var3434 == 18 then
				local _ = nil
				local var3435, var3436 = protoModule.readVarInt(p125, var3429)
				var3429 = var3436
				var3428.is_sponsored = var3435 ~= 0
			else
				local _ = nil
				local var3437, var3438 = protoModule.readVarInt(p125, var3429)
				local _ = var3437
				var3429 = var3438
			end
		end
		if var3430 == protoModule.wireTypes.lengthDelimited then
			if var3434 == 1 then
				local _ = nil
				local var3439, var3440 = protoModule.readBuffer(p125, var3429)
				var3429 = var3440
				var3428.universe_id = buffer.tostring(var3439)
			elseif var3434 == 2 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p125, var3429)
				var3429 = var3442
				var3428.title = buffer.tostring(var3441)
			elseif var3434 == 3 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p125, var3429)
				var3429 = var3444
				var3428.subtitle = buffer.tostring(var3443)
			elseif var3434 == 4 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p125, var3429)
				var3429 = var3446
				var3428.badge_text = buffer.tostring(var3445)
			elseif var3434 == 5 then
				local _ = nil
				local var3447, var3448 = protoModule.readBuffer(p125, var3429)
				var3429 = var3448
				var3428.foreground = t.HeroUnitInputData_VisualAsset.decode(var3447)
			elseif var3434 == 6 then
				local _ = nil
				local var3449, var3450 = protoModule.readBuffer(p125, var3429)
				var3429 = var3450
				var3428.background = t.HeroUnitInputData_VisualAsset.decode(var3449)
			elseif var3434 == 7 then
				local _ = nil
				local var3451, var3452 = protoModule.readBuffer(p125, var3429)
				var3429 = var3452
				var3428.title_image = t.HeroUnitInputData_VisualAsset.decode(var3451)
			elseif var3434 == 8 then
				local _ = nil
				local var3453, var3454 = protoModule.readBuffer(p125, var3429)
				var3429 = var3454
				var3428.asset_title = buffer.tostring(var3453)
			elseif var3434 == 9 then
				local _ = nil
				local var3455, var3456 = protoModule.readBuffer(p125, var3429)
				var3429 = var3456
				var3428.asset_subtitle = buffer.tostring(var3455)
			elseif var3434 == 10 then
				local _ = nil
				local var3457, var3458 = protoModule.readBuffer(p125, var3429)
				var3429 = var3458
				var3428.gradient = t.HeroUnitInputData_Gradient.decode(var3457)
			elseif var3434 == 11 then
				local _ = nil
				local var3459, var3460 = protoModule.readBuffer(p125, var3429)
				var3429 = var3460
				var3428.playable_text = buffer.tostring(var3459)
			elseif var3434 == 12 then
				local _ = nil
				local var3461, var3462 = protoModule.readBuffer(p125, var3429)
				var3429 = var3462
				var3428.collection_id = buffer.tostring(var3461)
			elseif var3434 == 13 then
				local _ = nil
				local var3463, var3464 = protoModule.readBuffer(p125, var3429)
				var3429 = var3464
				var3428.campaign_id = buffer.tostring(var3463)
			elseif var3434 == 14 then
				local _ = nil
				local var3465, var3466 = protoModule.readBuffer(p125, var3429)
				var3429 = var3466
				var3428.cohort_id = buffer.tostring(var3465)
			elseif var3434 == 15 then
				local _ = nil
				local var3467, var3468 = protoModule.readBuffer(p125, var3429)
				var3429 = var3468
				var3428.sort_id = buffer.tostring(var3467)
			elseif var3434 == 16 then
				local _ = nil
				local var3469, var3470 = protoModule.readBuffer(p125, var3429)
				var3429 = var3470
				var3428.hero_unit_id = buffer.tostring(var3469)
			elseif var3434 == 17 then
				local _ = nil
				local var3471, var3472 = protoModule.readBuffer(p125, var3429)
				var3429 = var3472
				var3428.analytics_id = buffer.tostring(var3471)
			else
				local _ = nil
				local var3473, var3474 = protoModule.readVarInt(p125, var3429)
				var3429 = var3474 + var3473
			end
		elseif var3430 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3475, var3476 = protoModule.readFixed32(p125, var3429)
			local _ = var3475
			var3429 = var3476
		elseif var3430 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3477, var3478 = protoModule.readFixed64(p125, var3429)
			local _ = var3477
			var3429 = var3478
		else
			error("Unsupported wire type: " .. var5034)
		end
	end
	return var3428
end

function t_125:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.foreground ~= nil then
		t.foreground = self.foreground:jsonEncode()
	end
	if self.background ~= nil then
		t.background = self.background:jsonEncode()
	end
	if self.title_image ~= nil then
		t.titleImage = self.title_image:jsonEncode()
	end
	if self.asset_title ~= nil then
		t.assetTitle = self.asset_title
	end
	if self.asset_subtitle ~= nil then
		t.assetSubtitle = self.asset_subtitle
	end
	if self.gradient ~= nil then
		t.gradient = self.gradient:jsonEncode()
	end
	if self.playable_text ~= nil then
		t.playableText = self.playable_text
	end
	if self.collection_id ~= nil then
		t.collectionId = self.collection_id
	end
	if self.campaign_id ~= nil then
		t.campaignId = self.campaign_id
	end
	if self.cohort_id ~= nil then
		t.cohortId = self.cohort_id
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	if self.hero_unit_id ~= nil then
		t.heroUnitId = self.hero_unit_id
	end
	if self.analytics_id ~= nil then
		t.analyticsId = self.analytics_id
	end
	if self.is_sponsored ~= nil then
		t.isSponsored = self.is_sponsored
	end
	return t
end

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var3479 = t_125.new()
	
	if self.universe_id ~= nil then
		var3479.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3479.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3479.title = self.title
	end
	if self.subtitle ~= nil then
		var3479.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3479.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3479.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3479.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3479.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3479.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3479.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3479.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3479.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3479.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3479.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3479.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3479.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3479.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3479.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3479.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3479.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3479.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3479.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3479.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3479.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3479.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3479.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3479.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3479.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3479.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3479.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3479.is_sponsored = self.isSponsored
	end
	return var3479
end

t_125.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_125
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		asset_id = if p126 == nil or p126.asset_id == nil then "" else p126.asset_id,
		aspect_ratio = if p126 == nil or p126.aspect_ratio == nil then nil else p126.aspect_ratio,
		enable_animation = if p126 == nil or p126.enable_animation == nil then nil else p126.enable_animation
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3479 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3480, var3481 = protoModule.writeTag(buff, var3479, 1, protoModule.wireTypes.lengthDelimited)
		var3480, var5088 = protoModule.writeString(var3480, var3481, self.asset_id)
		buff = var3480
		var3479 = var3481
	end
	if self.aspect_ratio ~= nil then
		local var3482, var3483 = protoModule.writeTag(buff, var3479, 2, protoModule.wireTypes.i64)
		var3482, var5090 = protoModule.writeDouble(var3482, var3483, self.aspect_ratio)
		buff = var3482
		var3479 = var3483
	end
	if self.enable_animation ~= nil then
		local var3484, var3485 = protoModule.writeTag(buff, var3479, 3, protoModule.wireTypes.varint)
		var3484, var5092 = protoModule.writeVarInt(var3484, var3485, if self.enable_animation then 1 else 0)
		buff = var3484
		var3479 = var3485
	end
	local buff_1 = buffer.create(var3479)
	buffer.copy(buff_1, 0, buff, 0, var3479)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3479 = t_126.new()
	local var3480 = 0
	while var3480 < buffer.len(p126) do
		local _ = nil
		local var3481 = nil
		local var3482, var3483, var3484 = protoModule.readTag(p126, var3480)
		local var3485 = var3482
		var3481 = var3483
		var3480 = var3484
		
		if var3481 == protoModule.wireTypes.varint then
			if var3485 == 3 then
				local _ = nil
				local var3486, var3487 = protoModule.readVarInt(p126, var3480)
				var3480 = var3487
				var3479.enable_animation = var3486 ~= 0
			else
				local _ = nil
				local var3488, var3489 = protoModule.readVarInt(p126, var3480)
				local _ = var3488
				var3480 = var3489
			end
		end
		if var3481 == protoModule.wireTypes.lengthDelimited then
			if var3485 == 1 then
				local _ = nil
				local var3490, var3491 = protoModule.readBuffer(p126, var3480)
				var3480 = var3491
				var3479.asset_id = buffer.tostring(var3490)
			else
				local _ = nil
				local var3492, var3493 = protoModule.readVarInt(p126, var3480)
				var3480 = var3493 + var3492
			end
		elseif var3481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3494, var3495 = protoModule.readFixed32(p126, var3480)
			local _ = var3494
			var3480 = var3495
		elseif var3481 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5096)
		elseif var3485 == 2 then
			local _ = nil
			local var3496, var3497 = protoModule.readDouble(p126, var3480)
			var3480 = var3497
			var3479.aspect_ratio = var3496
		else
			local _ = nil
			local var3498, var3499 = protoModule.readFixed64(p126, var3480)
			local _ = var3498
			var3480 = var3499
		end
	end
	return var3479
end

function t_126:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.aspect_ratio ~= nil then
		t.aspectRatio = protoModule.json.serializeNumber(self.aspect_ratio)
	end
	if self.enable_animation ~= nil then
		t.enableAnimation = self.enable_animation
	end
	return t
end

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3500 = t_126.new()
	
	if self.asset_id ~= nil then
		var3500.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3500.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3500.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3500.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3500.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3500.enable_animation = self.enableAnimation
	end
	return var3500
end

t_126.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_126
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		start_color = if p127 == nil or p127.start_color == nil then nil else p127.start_color,
		end_color = if p127 == nil or p127.end_color == nil then nil else p127.end_color,
		start_opacity = if p127 == nil or p127.start_opacity == nil then nil else p127.start_opacity,
		end_opacity = if p127 == nil or p127.end_opacity == nil then nil else p127.end_opacity,
		degree = if p127 == nil or p127.degree == nil then nil else p127.degree
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3500 = 0
	
	if self.start_color ~= nil then
		local var3501, var3502 = protoModule.writeTag(buff, var3500, 1, protoModule.wireTypes.lengthDelimited)
		var3501, var5120 = protoModule.writeString(var3501, var3502, self.start_color)
		buff = var3501
		var3500 = var3502
	end
	if self.end_color ~= nil then
		local var3503, var3504 = protoModule.writeTag(buff, var3500, 2, protoModule.wireTypes.lengthDelimited)
		var3503, var5122 = protoModule.writeString(var3503, var3504, self.end_color)
		buff = var3503
		var3500 = var3504
	end
	if self.start_opacity ~= nil then
		local var3505, var3506 = protoModule.writeTag(buff, var3500, 3, protoModule.wireTypes.i64)
		var3505, var5124 = protoModule.writeDouble(var3505, var3506, self.start_opacity)
		buff = var3505
		var3500 = var3506
	end
	if self.end_opacity ~= nil then
		local var3507, var3508 = protoModule.writeTag(buff, var3500, 4, protoModule.wireTypes.i64)
		var3507, var5126 = protoModule.writeDouble(var3507, var3508, self.end_opacity)
		buff = var3507
		var3500 = var3508
	end
	if self.degree ~= nil then
		local var3509, var3510 = protoModule.writeTag(buff, var3500, 5, protoModule.wireTypes.i64)
		var3509, var5128 = protoModule.writeDouble(var3509, var3510, self.degree)
		buff = var3509
		var3500 = var3510
	end
	local buff_1 = buffer.create(var3500)
	buffer.copy(buff_1, 0, buff, 0, var3500)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3500 = t_127.new()
	local var3501 = 0
	while var3501 < buffer.len(p127) do
		local _ = nil
		local var3502 = nil
		local var3503, var3504, var3505 = protoModule.readTag(p127, var3501)
		local var3506 = var3503
		var3502 = var3504
		var3501 = var3505
		
		if var3502 == protoModule.wireTypes.varint then
			local _ = nil
			local var3507, var3508 = protoModule.readVarInt(p127, var3501)
			local _ = var3507
			var3501 = var3508
			continue
		end
		if var3502 == protoModule.wireTypes.lengthDelimited then
			if var3506 == 1 then
				local _ = nil
				local var3509, var3510 = protoModule.readBuffer(p127, var3501)
				var3501 = var3510
				var3500.start_color = buffer.tostring(var3509)
			elseif var3506 == 2 then
				local _ = nil
				local var3511, var3512 = protoModule.readBuffer(p127, var3501)
				var3501 = var3512
				var3500.end_color = buffer.tostring(var3511)
			else
				local _ = nil
				local var3513, var3514 = protoModule.readVarInt(p127, var3501)
				var3501 = var3514 + var3513
			end
		elseif var3502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3515, var3516 = protoModule.readFixed32(p127, var3501)
			local _ = var3515
			var3501 = var3516
		elseif var3502 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5132)
		elseif var3506 == 3 then
			local _ = nil
			local var3517, var3518 = protoModule.readDouble(p127, var3501)
			var3501 = var3518
			var3500.start_opacity = var3517
		elseif var3506 == 4 then
			local _ = nil
			local var3519, var3520 = protoModule.readDouble(p127, var3501)
			var3501 = var3520
			var3500.end_opacity = var3519
		elseif var3506 == 5 then
			local _ = nil
			local var3521, var3522 = protoModule.readDouble(p127, var3501)
			var3501 = var3522
			var3500.degree = var3521
		else
			local _ = nil
			local var3523, var3524 = protoModule.readFixed64(p127, var3501)
			local _ = var3523
			var3501 = var3524
		end
	end
	return var3500
end

function t_127:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.start_color ~= nil then
		t.startColor = self.start_color
	end
	if self.end_color ~= nil then
		t.endColor = self.end_color
	end
	if self.start_opacity ~= nil then
		t.startOpacity = protoModule.json.serializeNumber(self.start_opacity)
	end
	if self.end_opacity ~= nil then
		t.endOpacity = protoModule.json.serializeNumber(self.end_opacity)
	end
	if self.degree ~= nil then
		t.degree = protoModule.json.serializeNumber(self.degree)
	end
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3525 = t_127.new()
	
	if self.start_color ~= nil then
		var3525.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3525.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3525.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3525.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3525.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3525.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3525.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3525.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3525.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3525
end

t_127.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_127
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		items = if p128 == nil or p128.items == nil then {} else p128.items,
		sort_id = if p128 == nil or p128.sort_id == nil then "" else p128.sort_id,
		recommendation_request_id = if p128 == nil or p128.recommendation_request_id == nil then "" else p128.recommendation_request_id
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3525 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3526 = v:encode()
			local var3527, var3528 = protoModule.writeTag(buff, var3525, 1, protoModule.wireTypes.lengthDelimited)
			var3527, var5161 = protoModule.writeBuffer(var3527, var3528, var3526, buffer.len(var3526))
			buff = var3527
			var3525 = var3528
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3529, var3530 = protoModule.writeTag(buff, var3525, 2, protoModule.wireTypes.lengthDelimited)
		var3529, var5163 = protoModule.writeString(var3529, var3530, self.sort_id)
		buff = var3529
		var3525 = var3530
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3531, var3532 = protoModule.writeTag(buff, var3525, 3, protoModule.wireTypes.lengthDelimited)
		var3531, var5165 = protoModule.writeString(var3531, var3532, self.recommendation_request_id)
		buff = var3531
		var3525 = var3532
	end
	local buff_1 = buffer.create(var3525)
	buffer.copy(buff_1, 0, buff, 0, var3525)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3533 = t_128.new()
	local var3534 = 0
	while var3534 < buffer.len(p128) do
		local _ = nil
		local var3535 = nil
		local var3536, var3537, var3538 = protoModule.readTag(p128, var3534)
		local var3539 = var3536
		var3535 = var3537
		var3534 = var3538
		
		if var3535 == protoModule.wireTypes.varint then
			local _ = nil
			local var3540, var3541 = protoModule.readVarInt(p128, var3534)
			local _ = var3540
			var3534 = var3541
			continue
		end
		if var3535 == protoModule.wireTypes.lengthDelimited then
			if var3539 == 1 then
				local _ = nil
				local var3542, var3543 = protoModule.readBuffer(p128, var3534)
				var3534 = var3543
				table.insert(var3533.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3542))
			elseif var3539 == 2 then
				local _ = nil
				local var3544, var3545 = protoModule.readBuffer(p128, var3534)
				var3534 = var3545
				var3533.sort_id = buffer.tostring(var3544)
			elseif var3539 == 3 then
				local _ = nil
				local var3546, var3547 = protoModule.readBuffer(p128, var3534)
				var3534 = var3547
				var3533.recommendation_request_id = buffer.tostring(var3546)
			else
				local _ = nil
				local var3548, var3549 = protoModule.readVarInt(p128, var3534)
				var3534 = var3549 + var3548
			end
		elseif var3535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3550, var3551 = protoModule.readFixed32(p128, var3534)
			local _ = var3550
			var3534 = var3551
		elseif var3535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3552, var3553 = protoModule.readFixed64(p128, var3534)
			local _ = var3552
			var3534 = var3553
		else
			error("Unsupported wire type: " .. var5169)
		end
	end
	return var3533
end

function t_128:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		t.recommendationRequestId = self.recommendation_request_id
	end
	return t
end

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var3554 = t_128.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3554.items = t_1
	end
	if self.sort_id ~= nil then
		var3554.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3554.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3554.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3554.recommendation_request_id = self.recommendationRequestId
	end
	return var3554
end

t_128.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_128
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		item_id = if p129 == nil or p129.item_id == nil then "" else p129.item_id,
		has_pending_friend_request = if p129 == nil or p129.has_pending_friend_request == nil then false else p129.has_pending_friend_request
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3555 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3556, var3557 = protoModule.writeTag(buff, var3555, 1, protoModule.wireTypes.lengthDelimited)
		var3556, var5195 = protoModule.writeString(var3556, var3557, self.item_id)
		buff = var3556
		var3555 = var3557
	end
	if self.has_pending_friend_request then
		local var3558, var3559 = protoModule.writeTag(buff, var3555, 2, protoModule.wireTypes.varint)
		var3558, var5197 = protoModule.writeVarInt(var3558, var3559, if self.has_pending_friend_request then 1 else 0)
		buff = var3558
		var3555 = var3559
	end
	local buff_1 = buffer.create(var3555)
	buffer.copy(buff_1, 0, buff, 0, var3555)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3555 = t_129.new()
	local var3556 = 0
	while var3556 < buffer.len(p129) do
		local _ = nil
		local var3557 = nil
		local var3558, var3559, var3560 = protoModule.readTag(p129, var3556)
		local var3561 = var3558
		var3557 = var3559
		var3556 = var3560
		
		if var3557 == protoModule.wireTypes.varint then
			if var3561 == 2 then
				local _ = nil
				local var3562, var3563 = protoModule.readVarInt(p129, var3556)
				var3556 = var3563
				var3555.has_pending_friend_request = var3562 ~= 0
			else
				local _ = nil
				local var3564, var3565 = protoModule.readVarInt(p129, var3556)
				local _ = var3564
				var3556 = var3565
			end
		end
		if var3557 == protoModule.wireTypes.lengthDelimited then
			if var3561 == 1 then
				local _ = nil
				local var3566, var3567 = protoModule.readBuffer(p129, var3556)
				var3556 = var3567
				var3555.item_id = buffer.tostring(var3566)
			else
				local _ = nil
				local var3568, var3569 = protoModule.readVarInt(p129, var3556)
				var3556 = var3569 + var3568
			end
		elseif var3557 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3570, var3571 = protoModule.readFixed32(p129, var3556)
			local _ = var3570
			var3556 = var3571
		elseif var3557 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3572, var3573 = protoModule.readFixed64(p129, var3556)
			local _ = var3572
			var3556 = var3573
		else
			error("Unsupported wire type: " .. var5201)
		end
	end
	return var3555
end

function t_129:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_129:jsonDecode()
	-- upvalues: t_129 (ref)
	local var3574 = t_129.new()
	
	if self.item_id ~= nil then
		var3574.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3574.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3574.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3574.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3574
end

t_129.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_129
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		selected_option = if p130 == nil or p130.selected_option == nil then "" else p130.selected_option,
		sort_id = if p130 == nil or p130.sort_id == nil then "" else p130.sort_id,
		options = if p130 == nil or p130.options == nil then {} else p130.options,
		experience_carousel = if p130 == nil or p130.experience_carousel == nil then nil else p130.experience_carousel,
		feed_item_key = if p130 == nil or p130.feed_item_key == nil then "" else p130.feed_item_key,
		title = if p130 == nil or p130.title == nil then "" else p130.title
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3574 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3575, var3576 = protoModule.writeTag(buff, var3574, 1, protoModule.wireTypes.lengthDelimited)
		var3575, var5223 = protoModule.writeString(var3575, var3576, self.selected_option)
		buff = var3575
		var3574 = var3576
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3577, var3578 = protoModule.writeTag(buff, var3574, 2, protoModule.wireTypes.lengthDelimited)
		var3577, var5225 = protoModule.writeString(var3577, var3578, self.sort_id)
		buff = var3577
		var3574 = var3578
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3579 = v:encode()
			local var3580, var3581 = protoModule.writeTag(buff, var3574, 3, protoModule.wireTypes.lengthDelimited)
			var3580, var5228 = protoModule.writeBuffer(var3580, var3581, var3579, buffer.len(var3579))
			buff = var3580
			var3574 = var3581
		end
	end
	if self.experience_carousel ~= nil then
		local var3582 = self.experience_carousel:encode()
		local var3583, var3584 = protoModule.writeTag(buff, var3574, 4, protoModule.wireTypes.lengthDelimited)
		var3583, var5231 = protoModule.writeBuffer(var3583, var3584, var3582, buffer.len(var3582))
		buff = var3583
		var3574 = var3584
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3585, var3586 = protoModule.writeTag(buff, var3574, 5, protoModule.wireTypes.lengthDelimited)
		var3585, var5233 = protoModule.writeString(var3585, var3586, self.feed_item_key)
		buff = var3585
		var3574 = var3586
	end
	if self.title ~= nil and self.title ~= "" then
		local var3587, var3588 = protoModule.writeTag(buff, var3574, 6, protoModule.wireTypes.lengthDelimited)
		var3587, var5235 = protoModule.writeString(var3587, var3588, self.title)
		buff = var3587
		var3574 = var3588
	end
	local buff_1 = buffer.create(var3574)
	buffer.copy(buff_1, 0, buff, 0, var3574)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3589 = t_130.new()
	local var3590 = 0
	while var3590 < buffer.len(p130) do
		local _ = nil
		local var3591 = nil
		local var3592, var3593, var3594 = protoModule.readTag(p130, var3590)
		local var3595 = var3592
		var3591 = var3593
		var3590 = var3594
		
		if var3591 == protoModule.wireTypes.varint then
			local _ = nil
			local var3596, var3597 = protoModule.readVarInt(p130, var3590)
			local _ = var3596
			var3590 = var3597
			continue
		end
		if var3591 == protoModule.wireTypes.lengthDelimited then
			if var3595 == 1 then
				local _ = nil
				local var3598, var3599 = protoModule.readBuffer(p130, var3590)
				var3590 = var3599
				var3589.selected_option = buffer.tostring(var3598)
			elseif var3595 == 2 then
				local _ = nil
				local var3600, var3601 = protoModule.readBuffer(p130, var3590)
				var3590 = var3601
				var3589.sort_id = buffer.tostring(var3600)
			elseif var3595 == 3 then
				local _ = nil
				local var3602, var3603 = protoModule.readBuffer(p130, var3590)
				var3590 = var3603
				table.insert(var3589.options, t.SelectorOption.decode(var3602))
			elseif var3595 == 4 then
				local _ = nil
				local var3604, var3605 = protoModule.readBuffer(p130, var3590)
				var3590 = var3605
				var3589.experience_carousel = t.ExperienceCarouselInputData.decode(var3604)
			elseif var3595 == 5 then
				local _ = nil
				local var3606, var3607 = protoModule.readBuffer(p130, var3590)
				var3590 = var3607
				var3589.feed_item_key = buffer.tostring(var3606)
			elseif var3595 == 6 then
				local _ = nil
				local var3608, var3609 = protoModule.readBuffer(p130, var3590)
				var3590 = var3609
				var3589.title = buffer.tostring(var3608)
			else
				local _ = nil
				local var3610, var3611 = protoModule.readVarInt(p130, var3590)
				var3590 = var3611 + var3610
			end
		elseif var3591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3612, var3613 = protoModule.readFixed32(p130, var3590)
			local _ = var3612
			var3590 = var3613
		elseif var3591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3614, var3615 = protoModule.readFixed64(p130, var3590)
			local _ = var3614
			var3590 = var3615
		else
			error("Unsupported wire type: " .. var5239)
		end
	end
	return var3589
end

function t_130:jsonEncode()
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.experience_carousel ~= nil then
		t.experienceCarousel = self.experience_carousel:jsonEncode()
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	return t
end

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var3616 = t_130.new()
	
	if self.selected_option ~= nil then
		var3616.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3616.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3616.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3616.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3616.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3616.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3616.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3616.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3616.feed_item_key = self.feedItemKey
	end
	if self.title ~= nil then
		var3616.title = self.title
	end
	return var3616
end

t_130.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_130
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		id = if p131 == nil or p131.id == nil then "" else p131.id,
		display_name = if p131 == nil or p131.display_name == nil then "" else p131.display_name,
		is_selected = if p131 == nil or p131.is_selected == nil then false else p131.is_selected
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3617 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3618, var3619 = protoModule.writeTag(buff, var3617, 1, protoModule.wireTypes.lengthDelimited)
		var3618, var5271 = protoModule.writeString(var3618, var3619, self.id)
		buff = var3618
		var3617 = var3619
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3620, var3621 = protoModule.writeTag(buff, var3617, 2, protoModule.wireTypes.lengthDelimited)
		var3620, var5273 = protoModule.writeString(var3620, var3621, self.display_name)
		buff = var3620
		var3617 = var3621
	end
	if self.is_selected then
		local var3622, var3623 = protoModule.writeTag(buff, var3617, 3, protoModule.wireTypes.varint)
		var3622, var5275 = protoModule.writeVarInt(var3622, var3623, if self.is_selected then 1 else 0)
		buff = var3622
		var3617 = var3623
	end
	local buff_1 = buffer.create(var3617)
	buffer.copy(buff_1, 0, buff, 0, var3617)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3617 = t_131.new()
	local var3618 = 0
	while var3618 < buffer.len(p131) do
		local _ = nil
		local var3619 = nil
		local var3620, var3621, var3622 = protoModule.readTag(p131, var3618)
		local var3623 = var3620
		var3619 = var3621
		var3618 = var3622
		
		if var3619 == protoModule.wireTypes.varint then
			if var3623 == 3 then
				local _ = nil
				local var3624, var3625 = protoModule.readVarInt(p131, var3618)
				var3618 = var3625
				var3617.is_selected = var3624 ~= 0
			else
				local _ = nil
				local var3626, var3627 = protoModule.readVarInt(p131, var3618)
				local _ = var3626
				var3618 = var3627
			end
		end
		if var3619 == protoModule.wireTypes.lengthDelimited then
			if var3623 == 1 then
				local _ = nil
				local var3628, var3629 = protoModule.readBuffer(p131, var3618)
				var3618 = var3629
				var3617.id = buffer.tostring(var3628)
			elseif var3623 == 2 then
				local _ = nil
				local var3630, var3631 = protoModule.readBuffer(p131, var3618)
				var3618 = var3631
				var3617.display_name = buffer.tostring(var3630)
			else
				local _ = nil
				local var3632, var3633 = protoModule.readVarInt(p131, var3618)
				var3618 = var3633 + var3632
			end
		elseif var3619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3634, var3635 = protoModule.readFixed32(p131, var3618)
			local _ = var3634
			var3618 = var3635
		elseif var3619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3636, var3637 = protoModule.readFixed64(p131, var3618)
			local _ = var3636
			var3618 = var3637
		else
			error("Unsupported wire type: " .. var5279)
		end
	end
	return var3617
end

function t_131:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.is_selected then
		t.isSelected = self.is_selected
	end
	return t
end

function t_131:jsonDecode()
	-- upvalues: t_131 (ref)
	local var3638 = t_131.new()
	
	if self.id ~= nil then
		var3638.id = self.id
	end
	if self.display_name ~= nil then
		var3638.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3638.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3638.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3638.is_selected = self.isSelected
	end
	return var3638
end

t_131.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_131
typeRegistryModule.default:register(t.SelectorOption)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		cards = if p132 == nil or p132.cards == nil then {} else p132.cards,
		title = if p132 == nil or p132.title == nil then "" else p132.title,
		sort_id = if p132 == nil or p132.sort_id == nil then nil else p132.sort_id
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3638 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3639 = v:encode()
			local var3640, var3641 = protoModule.writeTag(buff, var3638, 1, protoModule.wireTypes.lengthDelimited)
			var3640, var5304 = protoModule.writeBuffer(var3640, var3641, var3639, buffer.len(var3639))
			buff = var3640
			var3638 = var3641
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3642, var3643 = protoModule.writeTag(buff, var3638, 2, protoModule.wireTypes.lengthDelimited)
		var3642, var5306 = protoModule.writeString(var3642, var3643, self.title)
		buff = var3642
		var3638 = var3643
	end
	if self.sort_id ~= nil then
		local var3644, var3645 = protoModule.writeTag(buff, var3638, 3, protoModule.wireTypes.lengthDelimited)
		var3644, var5308 = protoModule.writeString(var3644, var3645, self.sort_id)
		buff = var3644
		var3638 = var3645
	end
	local buff_1 = buffer.create(var3638)
	buffer.copy(buff_1, 0, buff, 0, var3638)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var3646 = t_132.new()
	local var3647 = 0
	while var3647 < buffer.len(p132) do
		local _ = nil
		local var3648 = nil
		local var3649, var3650, var3651 = protoModule.readTag(p132, var3647)
		local var3652 = var3649
		var3648 = var3650
		var3647 = var3651
		
		if var3648 == protoModule.wireTypes.varint then
			local _ = nil
			local var3653, var3654 = protoModule.readVarInt(p132, var3647)
			local _ = var3653
			var3647 = var3654
			continue
		end
		if var3648 == protoModule.wireTypes.lengthDelimited then
			if var3652 == 1 then
				local _ = nil
				local var3655, var3656 = protoModule.readBuffer(p132, var3647)
				var3647 = var3656
				table.insert(var3646.cards, t.GameItemsCardInputData.decode(var3655))
			elseif var3652 == 2 then
				local _ = nil
				local var3657, var3658 = protoModule.readBuffer(p132, var3647)
				var3647 = var3658
				var3646.title = buffer.tostring(var3657)
			elseif var3652 == 3 then
				local _ = nil
				local var3659, var3660 = protoModule.readBuffer(p132, var3647)
				var3647 = var3660
				var3646.sort_id = buffer.tostring(var3659)
			else
				local _ = nil
				local var3661, var3662 = protoModule.readVarInt(p132, var3647)
				var3647 = var3662 + var3661
			end
		elseif var3648 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3663, var3664 = protoModule.readFixed32(p132, var3647)
			local _ = var3663
			var3647 = var3664
		elseif var3648 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3665, var3666 = protoModule.readFixed64(p132, var3647)
			local _ = var3665
			var3647 = var3666
		else
			error("Unsupported wire type: " .. var5312)
		end
	end
	return var3646
end

function t_132:jsonEncode()
	local t = {}
	
	if self.cards ~= nil and #self.cards > 0 then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, v:jsonEncode())
		end
		t.cards = t_1
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_132:jsonDecode()
	-- upvalues: t_132 (ref), t (ref)
	local var3667 = t_132.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3667.cards = t_1
	end
	if self.title ~= nil then
		var3667.title = self.title
	end
	if self.sort_id ~= nil then
		var3667.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3667.sort_id = self.sortId
	end
	return var3667
end

t_132.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_132
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		universe_id = if p133 == nil or p133.universe_id == nil then "" else p133.universe_id,
		items = if p133 == nil or p133.items == nil then {} else p133.items
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3668 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3669, var3670 = protoModule.writeTag(buff, var3668, 1, protoModule.wireTypes.lengthDelimited)
		var3669, var5338 = protoModule.writeString(var3669, var3670, self.universe_id)
		buff = var3669
		var3668 = var3670
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3671 = v:encode()
			local var3672, var3673 = protoModule.writeTag(buff, var3668, 2, protoModule.wireTypes.lengthDelimited)
			var3672, var5341 = protoModule.writeBuffer(var3672, var3673, var3671, buffer.len(var3671))
			buff = var3672
			var3668 = var3673
		end
	end
	local buff_1 = buffer.create(var3668)
	buffer.copy(buff_1, 0, buff, 0, var3668)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), t (ref)
	local var3674 = t_133.new()
	local var3675 = 0
	while var3675 < buffer.len(p133) do
		local _ = nil
		local var3676 = nil
		local var3677, var3678, var3679 = protoModule.readTag(p133, var3675)
		local var3680 = var3677
		var3676 = var3678
		var3675 = var3679
		
		if var3676 == protoModule.wireTypes.varint then
			local _ = nil
			local var3681, var3682 = protoModule.readVarInt(p133, var3675)
			local _ = var3681
			var3675 = var3682
			continue
		end
		if var3676 == protoModule.wireTypes.lengthDelimited then
			if var3680 == 1 then
				local _ = nil
				local var3683, var3684 = protoModule.readBuffer(p133, var3675)
				var3675 = var3684
				var3674.universe_id = buffer.tostring(var3683)
			elseif var3680 == 2 then
				local _ = nil
				local var3685, var3686 = protoModule.readBuffer(p133, var3675)
				var3675 = var3686
				table.insert(var3674.items, t.GameItemInputData.decode(var3685))
			else
				local _ = nil
				local var3687, var3688 = protoModule.readVarInt(p133, var3675)
				var3675 = var3688 + var3687
			end
		elseif var3676 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3689, var3690 = protoModule.readFixed32(p133, var3675)
			local _ = var3689
			var3675 = var3690
		elseif var3676 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3691, var3692 = protoModule.readFixed64(p133, var3675)
			local _ = var3691
			var3675 = var3692
		else
			error("Unsupported wire type: " .. var5345)
		end
	end
	return var3674
end

function t_133:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	return t
end

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), t (ref)
	local var3693 = t_133.new()
	
	if self.universe_id ~= nil then
		var3693.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3693.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3693.items = t_1
	end
	return var3693
end

t_133.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_133
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p134)
	-- upvalues: t_134 (ref)
	return setmetatable({
		item_id = if p134 == nil or p134.item_id == nil then "" else p134.item_id,
		item_type = if p134 == nil or p134.item_type == nil then "" else p134.item_type
	}, t_134)
end

function t_134:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3694 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3695, var3696 = protoModule.writeTag(buff, var3694, 1, protoModule.wireTypes.lengthDelimited)
		var3695, var5369 = protoModule.writeString(var3695, var3696, self.item_id)
		buff = var3695
		var3694 = var3696
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3697, var3698 = protoModule.writeTag(buff, var3694, 2, protoModule.wireTypes.lengthDelimited)
		var3697, var5371 = protoModule.writeString(var3697, var3698, self.item_type)
		buff = var3697
		var3694 = var3698
	end
	local buff_1 = buffer.create(var3694)
	buffer.copy(buff_1, 0, buff, 0, var3694)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref)
	local var3694 = t_134.new()
	local var3695 = 0
	while var3695 < buffer.len(p134) do
		local _ = nil
		local var3696 = nil
		local var3697, var3698, var3699 = protoModule.readTag(p134, var3695)
		local var3700 = var3697
		var3696 = var3698
		var3695 = var3699
		
		if var3696 == protoModule.wireTypes.varint then
			local _ = nil
			local var3701, var3702 = protoModule.readVarInt(p134, var3695)
			local _ = var3701
			var3695 = var3702
			continue
		end
		if var3696 == protoModule.wireTypes.lengthDelimited then
			if var3700 == 1 then
				local _ = nil
				local var3703, var3704 = protoModule.readBuffer(p134, var3695)
				var3695 = var3704
				var3694.item_id = buffer.tostring(var3703)
			elseif var3700 == 2 then
				local _ = nil
				local var3705, var3706 = protoModule.readBuffer(p134, var3695)
				var3695 = var3706
				var3694.item_type = buffer.tostring(var3705)
			else
				local _ = nil
				local var3707, var3708 = protoModule.readVarInt(p134, var3695)
				var3695 = var3708 + var3707
			end
		elseif var3696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3709, var3710 = protoModule.readFixed32(p134, var3695)
			local _ = var3709
			var3695 = var3710
		elseif var3696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3711, var3712 = protoModule.readFixed64(p134, var3695)
			local _ = var3711
			var3695 = var3712
		else
			error("Unsupported wire type: " .. var5375)
		end
	end
	return var3694
end

function t_134:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_134:jsonDecode()
	-- upvalues: t_134 (ref)
	local var3713 = t_134.new()
	
	if self.item_id ~= nil then
		var3713.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3713.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3713.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3713.item_type = self.itemType
	end
	return var3713
end

t_134.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_134
typeRegistryModule.default:register(t.GameItemInputData)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		clickout_url = if p135 == nil or p135.clickout_url == nil then "" else p135.clickout_url,
		native_ad_data = if p135 == nil or p135.native_ad_data == nil then "" else p135.native_ad_data,
		payer_name = if p135 == nil or p135.payer_name == nil then nil else p135.payer_name,
		logo_asset_id = if p135 == nil or p135.logo_asset_id == nil then nil else p135.logo_asset_id,
		logo_aspect_ratio = if p135 == nil or p135.logo_aspect_ratio == nil then nil else p135.logo_aspect_ratio,
		cta_text = if p135 == nil or p135.cta_text == nil then nil else p135.cta_text,
		title = if p135 == nil or p135.title == nil then nil else p135.title,
		subtitle = if p135 == nil or p135.subtitle == nil then nil else p135.subtitle,
		image_asset_id = if p135 == nil or p135.image_asset_id == nil then nil else p135.image_asset_id,
		video_asset_id = if p135 == nil or p135.video_asset_id == nil then nil else p135.video_asset_id,
		badge_text = if p135 == nil or p135.badge_text == nil then nil else p135.badge_text,
		badge_analytics_id = if p135 == nil or p135.badge_analytics_id == nil then nil else p135.badge_analytics_id,
		roblox_component = if p135 == nil or p135.roblox_component == nil then nil else p135.roblox_component,
		attribution_thumbnail_asset_id = if p135 == nil or p135.attribution_thumbnail_asset_id == nil then nil else p135.attribution_thumbnail_asset_id
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3713 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3714, var3715 = protoModule.writeTag(buff, var3713, 1, protoModule.wireTypes.lengthDelimited)
		var3714, var5397 = protoModule.writeString(var3714, var3715, self.clickout_url)
		buff = var3714
		var3713 = var3715
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3716, var3717 = protoModule.writeTag(buff, var3713, 2, protoModule.wireTypes.lengthDelimited)
		var3716, var5399 = protoModule.writeString(var3716, var3717, self.native_ad_data)
		buff = var3716
		var3713 = var3717
	end
	if self.payer_name ~= nil then
		local var3718, var3719 = protoModule.writeTag(buff, var3713, 3, protoModule.wireTypes.lengthDelimited)
		var3718, var5401 = protoModule.writeString(var3718, var3719, self.payer_name)
		buff = var3718
		var3713 = var3719
	end
	if self.logo_asset_id ~= nil then
		local var3720, var3721 = protoModule.writeTag(buff, var3713, 4, protoModule.wireTypes.lengthDelimited)
		var3720, var5403 = protoModule.writeString(var3720, var3721, self.logo_asset_id)
		buff = var3720
		var3713 = var3721
	end
	if self.logo_aspect_ratio ~= nil then
		local var3722, var3723 = protoModule.writeTag(buff, var3713, 5, protoModule.wireTypes.i64)
		var3722, var5405 = protoModule.writeDouble(var3722, var3723, self.logo_aspect_ratio)
		buff = var3722
		var3713 = var3723
	end
	if self.cta_text ~= nil then
		local var3724, var3725 = protoModule.writeTag(buff, var3713, 6, protoModule.wireTypes.lengthDelimited)
		var3724, var5407 = protoModule.writeString(var3724, var3725, self.cta_text)
		buff = var3724
		var3713 = var3725
	end
	if self.title ~= nil then
		local var3726, var3727 = protoModule.writeTag(buff, var3713, 7, protoModule.wireTypes.lengthDelimited)
		var3726, var5409 = protoModule.writeString(var3726, var3727, self.title)
		buff = var3726
		var3713 = var3727
	end
	if self.subtitle ~= nil then
		local var3728, var3729 = protoModule.writeTag(buff, var3713, 8, protoModule.wireTypes.lengthDelimited)
		var3728, var5411 = protoModule.writeString(var3728, var3729, self.subtitle)
		buff = var3728
		var3713 = var3729
	end
	if self.image_asset_id ~= nil then
		local var3730, var3731 = protoModule.writeTag(buff, var3713, 9, protoModule.wireTypes.lengthDelimited)
		var3730, var5413 = protoModule.writeString(var3730, var3731, self.image_asset_id)
		buff = var3730
		var3713 = var3731
	end
	if self.video_asset_id ~= nil then
		local var3732, var3733 = protoModule.writeTag(buff, var3713, 10, protoModule.wireTypes.lengthDelimited)
		var3732, var5415 = protoModule.writeString(var3732, var3733, self.video_asset_id)
		buff = var3732
		var3713 = var3733
	end
	if self.badge_text ~= nil then
		local var3734, var3735 = protoModule.writeTag(buff, var3713, 11, protoModule.wireTypes.lengthDelimited)
		var3734, var5417 = protoModule.writeString(var3734, var3735, self.badge_text)
		buff = var3734
		var3713 = var3735
	end
	if self.badge_analytics_id ~= nil then
		local var3736, var3737 = protoModule.writeTag(buff, var3713, 12, protoModule.wireTypes.lengthDelimited)
		var3736, var5419 = protoModule.writeString(var3736, var3737, self.badge_analytics_id)
		buff = var3736
		var3713 = var3737
	end
	if self.roblox_component ~= nil then
		local var3738, var3739 = protoModule.writeTag(buff, var3713, 13, protoModule.wireTypes.lengthDelimited)
		var3738, var5421 = protoModule.writeString(var3738, var3739, self.roblox_component)
		buff = var3738
		var3713 = var3739
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3740, var3741 = protoModule.writeTag(buff, var3713, 14, protoModule.wireTypes.lengthDelimited)
		var3740, var5423 = protoModule.writeString(var3740, var3741, self.attribution_thumbnail_asset_id)
		buff = var3740
		var3713 = var3741
	end
	local buff_1 = buffer.create(var3713)
	buffer.copy(buff_1, 0, buff, 0, var3713)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref)
	local var3713 = t_135.new()
	local var3714 = 0
	while var3714 < buffer.len(p135) do
		local _ = nil
		local var3715 = nil
		local var3716, var3717, var3718 = protoModule.readTag(p135, var3714)
		local var3719 = var3716
		var3715 = var3717
		var3714 = var3718
		
		if var3715 == protoModule.wireTypes.varint then
			local _ = nil
			local var3720, var3721 = protoModule.readVarInt(p135, var3714)
			local _ = var3720
			var3714 = var3721
			continue
		end
		if var3715 == protoModule.wireTypes.lengthDelimited then
			if var3719 == 1 then
				local _ = nil
				local var3722, var3723 = protoModule.readBuffer(p135, var3714)
				var3714 = var3723
				var3713.clickout_url = buffer.tostring(var3722)
			elseif var3719 == 2 then
				local _ = nil
				local var3724, var3725 = protoModule.readBuffer(p135, var3714)
				var3714 = var3725
				var3713.native_ad_data = buffer.tostring(var3724)
			elseif var3719 == 3 then
				local _ = nil
				local var3726, var3727 = protoModule.readBuffer(p135, var3714)
				var3714 = var3727
				var3713.payer_name = buffer.tostring(var3726)
			elseif var3719 == 4 then
				local _ = nil
				local var3728, var3729 = protoModule.readBuffer(p135, var3714)
				var3714 = var3729
				var3713.logo_asset_id = buffer.tostring(var3728)
			elseif var3719 == 6 then
				local _ = nil
				local var3730, var3731 = protoModule.readBuffer(p135, var3714)
				var3714 = var3731
				var3713.cta_text = buffer.tostring(var3730)
			elseif var3719 == 7 then
				local _ = nil
				local var3732, var3733 = protoModule.readBuffer(p135, var3714)
				var3714 = var3733
				var3713.title = buffer.tostring(var3732)
			elseif var3719 == 8 then
				local _ = nil
				local var3734, var3735 = protoModule.readBuffer(p135, var3714)
				var3714 = var3735
				var3713.subtitle = buffer.tostring(var3734)
			elseif var3719 == 9 then
				local _ = nil
				local var3736, var3737 = protoModule.readBuffer(p135, var3714)
				var3714 = var3737
				var3713.image_asset_id = buffer.tostring(var3736)
			elseif var3719 == 10 then
				local _ = nil
				local var3738, var3739 = protoModule.readBuffer(p135, var3714)
				var3714 = var3739
				var3713.video_asset_id = buffer.tostring(var3738)
			elseif var3719 == 11 then
				local _ = nil
				local var3740, var3741 = protoModule.readBuffer(p135, var3714)
				var3714 = var3741
				var3713.badge_text = buffer.tostring(var3740)
			elseif var3719 == 12 then
				local _ = nil
				local var3742, var3743 = protoModule.readBuffer(p135, var3714)
				var3714 = var3743
				var3713.badge_analytics_id = buffer.tostring(var3742)
			elseif var3719 == 13 then
				local _ = nil
				local var3744, var3745 = protoModule.readBuffer(p135, var3714)
				var3714 = var3745
				var3713.roblox_component = buffer.tostring(var3744)
			elseif var3719 == 14 then
				local _ = nil
				local var3746, var3747 = protoModule.readBuffer(p135, var3714)
				var3714 = var3747
				var3713.attribution_thumbnail_asset_id = buffer.tostring(var3746)
			else
				local _ = nil
				local var3748, var3749 = protoModule.readVarInt(p135, var3714)
				var3714 = var3749 + var3748
			end
		elseif var3715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3750, var3751 = protoModule.readFixed32(p135, var3714)
			local _ = var3750
			var3714 = var3751
		elseif var3715 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5427)
		elseif var3719 == 5 then
			local _ = nil
			local var3752, var3753 = protoModule.readDouble(p135, var3714)
			var3714 = var3753
			var3713.logo_aspect_ratio = var3752
		else
			local _ = nil
			local var3754, var3755 = protoModule.readFixed64(p135, var3714)
			local _ = var3754
			var3714 = var3755
		end
	end
	return var3713
end

function t_135:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		t.clickoutUrl = self.clickout_url
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = protoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	if self.roblox_component ~= nil then
		t.robloxComponent = self.roblox_component
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		t.attributionThumbnailAssetId = self.attribution_thumbnail_asset_id
	end
	return t
end

function t_135:jsonDecode()
	-- upvalues: t_135 (ref), protoModule (ref)
	local var3756 = t_135.new()
	
	if self.clickout_url ~= nil then
		var3756.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3756.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3756.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3756.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3756.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3756.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3756.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3756.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3756.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3756.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3756.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3756.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3756.title = self.title
	end
	if self.subtitle ~= nil then
		var3756.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3756.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3756.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3756.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3756.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3756.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3756.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3756.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3756.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3756.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3756.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3756.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3756.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3756
end

t_135.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_135
typeRegistryModule.default:register(t.AdLinkItem)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p136)
	-- upvalues: t_136 (ref)
	return setmetatable({
		layout = if p136 == nil or p136.layout == nil then nil else p136.layout,
		kind = if p136 == nil or p136.kind == nil then nil else p136.kind
	}, t_136)
end

function t_136:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3756 = 0
	
	if self.layout ~= nil then
		local var3757 = self.layout:encode()
		local var3758, var3759 = protoModule.writeTag(buff, var3756, 1, protoModule.wireTypes.lengthDelimited)
		var3758, var5474 = protoModule.writeBuffer(var3758, var3759, var3757, buffer.len(var3757))
		buff = var3758
		var3756 = var3759
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3760 = self.kind.value:encode()
			local var3761, var3762 = protoModule.writeTag(buff, var3756, 2, protoModule.wireTypes.lengthDelimited)
			var3761, var5477 = protoModule.writeBuffer(var3761, var3762, var3760, buffer.len(var3760))
			buff = var3761
			var3756 = var3762
		elseif self.kind.type == "ad_link" then
			local var3763 = self.kind.value:encode()
			local var3764, var3765 = protoModule.writeTag(buff, var3756, 3, protoModule.wireTypes.lengthDelimited)
			var3764, var5480 = protoModule.writeBuffer(var3764, var3765, var3763, buffer.len(var3763))
			buff = var3764
			var3756 = var3765
		end
	end
	local buff_1 = buffer.create(var3756)
	buffer.copy(buff_1, 0, buff, 0, var3756)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var3756 = t_136.new()
	local var3757 = 0
	while var3757 < buffer.len(p136) do
		local _ = nil
		local var3758 = nil
		local var3759, var3760, var3761 = protoModule.readTag(p136, var3757)
		local var3762 = var3759
		var3758 = var3760
		var3757 = var3761
		
		if var3758 == protoModule.wireTypes.varint then
			local _ = nil
			local var3763, var3764 = protoModule.readVarInt(p136, var3757)
			local _ = var3763
			var3757 = var3764
			continue
		end
		if var3758 == protoModule.wireTypes.lengthDelimited then
			if var3762 == 1 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p136, var3757)
				var3757 = var3766
				var3756.layout = t.ItemLayout.decode(var3765)
			elseif var3762 == 2 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p136, var3757)
				var3757 = var3768
				var3756.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3767)
				}
			elseif var3762 == 3 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p136, var3757)
				var3757 = var3770
				var3756.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3769) }
			else
				local _ = nil
				local var3771, var3772 = protoModule.readVarInt(p136, var3757)
				var3757 = var3772 + var3771
			end
		elseif var3758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3773, var3774 = protoModule.readFixed32(p136, var3757)
			local _ = var3773
			var3757 = var3774
		elseif var3758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3775, var3776 = protoModule.readFixed64(p136, var3757)
			local _ = var3775
			var3757 = var3776
		else
			error("Unsupported wire type: " .. var5484)
		end
	end
	return var3756
end

function t_136:jsonEncode()
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			t.universe = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "ad_link" then
			t.adLink = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_136:jsonDecode()
	-- upvalues: t_136 (ref), t (ref)
	local var3777 = t_136.new()
	
	if self.layout ~= nil then
		var3777.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3777.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3777.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3777.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3777
end

t_136.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_136
typeRegistryModule.default:register(t.ItemWithLayout)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		items = if p137 == nil or p137.items == nil then {} else p137.items,
		collection_item_size = if p137 == nil or p137.collection_item_size == nil then nil else p137.collection_item_size
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3777 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3778 = v:encode()
			local var3779, var3780 = protoModule.writeTag(buff, var3777, 1, protoModule.wireTypes.lengthDelimited)
			var3779, var5509 = protoModule.writeBuffer(var3779, var3780, var3778, buffer.len(var3778))
			buff = var3779
			var3777 = var3780
		end
	end
	if self.collection_item_size ~= nil then
		local var3781, var3782 = protoModule.writeTag(buff, var3777, 2, protoModule.wireTypes.lengthDelimited)
		var3781, var5511 = protoModule.writeString(var3781, var3782, self.collection_item_size)
		buff = var3781
		var3777 = var3782
	end
	local buff_1 = buffer.create(var3777)
	buffer.copy(buff_1, 0, buff, 0, var3777)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), t (ref)
	local var3783 = t_137.new()
	local var3784 = 0
	while var3784 < buffer.len(p137) do
		local _ = nil
		local var3785 = nil
		local var3786, var3787, var3788 = protoModule.readTag(p137, var3784)
		local var3789 = var3786
		var3785 = var3787
		var3784 = var3788
		
		if var3785 == protoModule.wireTypes.varint then
			local _ = nil
			local var3790, var3791 = protoModule.readVarInt(p137, var3784)
			local _ = var3790
			var3784 = var3791
			continue
		end
		if var3785 == protoModule.wireTypes.lengthDelimited then
			if var3789 == 1 then
				local _ = nil
				local var3792, var3793 = protoModule.readBuffer(p137, var3784)
				var3784 = var3793
				table.insert(var3783.items, t.ItemWithLayout.decode(var3792))
			elseif var3789 == 2 then
				local _ = nil
				local var3794, var3795 = protoModule.readBuffer(p137, var3784)
				var3784 = var3795
				var3783.collection_item_size = buffer.tostring(var3794)
			else
				local _ = nil
				local var3796, var3797 = protoModule.readVarInt(p137, var3784)
				var3784 = var3797 + var3796
			end
		elseif var3785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3798, var3799 = protoModule.readFixed32(p137, var3784)
			local _ = var3798
			var3784 = var3799
		elseif var3785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3800, var3801 = protoModule.readFixed64(p137, var3784)
			local _ = var3800
			var3784 = var3801
		else
			error("Unsupported wire type: " .. var5515)
		end
	end
	return var3783
end

function t_137:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.collection_item_size ~= nil then
		t.collectionItemSize = self.collection_item_size
	end
	return t
end

function t_137:jsonDecode()
	-- upvalues: t_137 (ref), t (ref)
	local var3802 = t_137.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3802.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3802.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3802.collection_item_size = self.collectionItemSize
	end
	return var3802
end

t_137.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_137
typeRegistryModule.default:register(t.ContentPool)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p138)
	-- upvalues: t_138 (ref)
	return setmetatable({
		col_span = if p138 == nil or p138.col_span == nil then 0 else p138.col_span,
		row_span = if p138 == nil or p138.row_span == nil then 0 else p138.row_span,
		alignment_type = if p138 == nil or p138.alignment_type == nil then "" else p138.alignment_type,
		min_row_padding = if p138 == nil or p138.min_row_padding == nil then 0 else p138.min_row_padding
	}, t_138)
end

function t_138:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3803 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3804, var3805 = protoModule.writeTag(buff, var3803, 1, protoModule.wireTypes.varint)
		var3804, var5539 = protoModule.writeVarInt(var3804, var3805, self.col_span)
		buff = var3804
		var3803 = var3805
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3806, var3807 = protoModule.writeTag(buff, var3803, 2, protoModule.wireTypes.varint)
		var3806, var5541 = protoModule.writeVarInt(var3806, var3807, self.row_span)
		buff = var3806
		var3803 = var3807
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3808, var3809 = protoModule.writeTag(buff, var3803, 3, protoModule.wireTypes.lengthDelimited)
		var3808, var5543 = protoModule.writeString(var3808, var3809, self.alignment_type)
		buff = var3808
		var3803 = var3809
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3810, var3811 = protoModule.writeTag(buff, var3803, 4, protoModule.wireTypes.varint)
		var3810, var5545 = protoModule.writeVarInt(var3810, var3811, self.min_row_padding)
		buff = var3810
		var3803 = var3811
	end
	local buff_1 = buffer.create(var3803)
	buffer.copy(buff_1, 0, buff, 0, var3803)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref)
	local var3803 = t_138.new()
	local var3804 = 0
	while var3804 < buffer.len(p138) do
		local _ = nil
		local var3805 = nil
		local var3806, var3807, var3808 = protoModule.readTag(p138, var3804)
		local var3809 = var3806
		var3805 = var3807
		var3804 = var3808
		
		if var3805 == protoModule.wireTypes.varint then
			if var3809 == 1 then
				local _ = nil
				local var3810, var3811 = protoModule.readVarIntI32(p138, var3804)
				var3804 = var3811
				var3803.col_span = var3810
			elseif var3809 == 2 then
				local _ = nil
				local var3812, var3813 = protoModule.readVarIntI32(p138, var3804)
				var3804 = var3813
				var3803.row_span = var3812
			elseif var3809 == 4 then
				local _ = nil
				local var3814, var3815 = protoModule.readVarIntI32(p138, var3804)
				var3804 = var3815
				var3803.min_row_padding = var3814
			else
				local _ = nil
				local var3816, var3817 = protoModule.readVarInt(p138, var3804)
				local _ = var3816
				var3804 = var3817
			end
		end
		if var3805 == protoModule.wireTypes.lengthDelimited then
			if var3809 == 3 then
				local _ = nil
				local var3818, var3819 = protoModule.readBuffer(p138, var3804)
				var3804 = var3819
				var3803.alignment_type = buffer.tostring(var3818)
			else
				local _ = nil
				local var3820, var3821 = protoModule.readVarInt(p138, var3804)
				var3804 = var3821 + var3820
			end
		elseif var3805 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3822, var3823 = protoModule.readFixed32(p138, var3804)
			local _ = var3822
			var3804 = var3823
		elseif var3805 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3824, var3825 = protoModule.readFixed64(p138, var3804)
			local _ = var3824
			var3804 = var3825
		else
			error("Unsupported wire type: " .. var5549)
		end
	end
	return var3803
end

function t_138:jsonEncode()
	local t = {}
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		t.colSpan = self.col_span
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		t.rowSpan = self.row_span
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		t.alignmentType = self.alignment_type
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		t.minRowPadding = self.min_row_padding
	end
	return t
end

function t_138:jsonDecode()
	-- upvalues: t_138 (ref)
	local var3826 = t_138.new()
	
	if self.col_span ~= nil then
		var3826.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3826.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3826.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3826.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3826.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3826.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3826.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3826.min_row_padding = self.minRowPadding
	end
	return var3826
end

t_138.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_138
typeRegistryModule.default:register(t.ItemLayout)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p139)
	-- upvalues: t_139 (ref)
	return setmetatable({
		community_id = if p139 == nil or p139.community_id == nil then "" else p139.community_id,
		announcement_id = if p139 == nil or p139.announcement_id == nil then "" else p139.announcement_id,
		message_id = if p139 == nil or p139.message_id == nil then "" else p139.message_id,
		title = if p139 == nil or p139.title == nil then "" else p139.title,
		body = if p139 == nil or p139.body == nil then "" else p139.body,
		creator_key = if p139 == nil or p139.creator_key == nil then "" else p139.creator_key,
		creator_role_name = if p139 == nil or p139.creator_role_name == nil then nil else p139.creator_role_name,
		media_asset_id = if p139 == nil or p139.media_asset_id == nil then nil else p139.media_asset_id,
		created_time = if p139 == nil or p139.created_time == nil then nil else p139.created_time
	}, t_139)
end

function t_139:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3826 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3827, var3828 = protoModule.writeTag(buff, var3826, 1, protoModule.wireTypes.lengthDelimited)
		var3827, var5575 = protoModule.writeString(var3827, var3828, self.community_id)
		buff = var3827
		var3826 = var3828
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3829, var3830 = protoModule.writeTag(buff, var3826, 2, protoModule.wireTypes.lengthDelimited)
		var3829, var5577 = protoModule.writeString(var3829, var3830, self.announcement_id)
		buff = var3829
		var3826 = var3830
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3831, var3832 = protoModule.writeTag(buff, var3826, 3, protoModule.wireTypes.lengthDelimited)
		var3831, var5579 = protoModule.writeString(var3831, var3832, self.message_id)
		buff = var3831
		var3826 = var3832
	end
	if self.title ~= nil and self.title ~= "" then
		local var3833, var3834 = protoModule.writeTag(buff, var3826, 4, protoModule.wireTypes.lengthDelimited)
		var3833, var5581 = protoModule.writeString(var3833, var3834, self.title)
		buff = var3833
		var3826 = var3834
	end
	if self.body ~= nil and self.body ~= "" then
		local var3835, var3836 = protoModule.writeTag(buff, var3826, 5, protoModule.wireTypes.lengthDelimited)
		var3835, var5583 = protoModule.writeString(var3835, var3836, self.body)
		buff = var3835
		var3826 = var3836
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3837, var3838 = protoModule.writeTag(buff, var3826, 6, protoModule.wireTypes.lengthDelimited)
		var3837, var5585 = protoModule.writeString(var3837, var3838, self.creator_key)
		buff = var3837
		var3826 = var3838
	end
	if self.creator_role_name ~= nil then
		local var3839, var3840 = protoModule.writeTag(buff, var3826, 7, protoModule.wireTypes.lengthDelimited)
		var3839, var5587 = protoModule.writeString(var3839, var3840, self.creator_role_name)
		buff = var3839
		var3826 = var3840
	end
	if self.media_asset_id ~= nil then
		local var3841, var3842 = protoModule.writeTag(buff, var3826, 8, protoModule.wireTypes.lengthDelimited)
		var3841, var5589 = protoModule.writeString(var3841, var3842, self.media_asset_id)
		buff = var3841
		var3826 = var3842
	end
	if self.created_time ~= nil then
		local var3843 = self.created_time:encode()
		local var3844, var3845 = protoModule.writeTag(buff, var3826, 9, protoModule.wireTypes.lengthDelimited)
		var3844, var5592 = protoModule.writeBuffer(var3844, var3845, var3843, buffer.len(var3843))
		buff = var3844
		var3826 = var3845
	end
	local buff_1 = buffer.create(var3826)
	buffer.copy(buff_1, 0, buff, 0, var3826)
	
	return buff_1
end

function t_139.decode(p139)
	-- upvalues: t_139 (ref), protoModule (ref), timestampModule (ref)
	local var3826 = t_139.new()
	local var3827 = 0
	while var3827 < buffer.len(p139) do
		local _ = nil
		local var3828 = nil
		local var3829, var3830, var3831 = protoModule.readTag(p139, var3827)
		local var3832 = var3829
		var3828 = var3830
		var3827 = var3831
		
		if var3828 == protoModule.wireTypes.varint then
			local _ = nil
			local var3833, var3834 = protoModule.readVarInt(p139, var3827)
			local _ = var3833
			var3827 = var3834
			continue
		end
		if var3828 == protoModule.wireTypes.lengthDelimited then
			if var3832 == 1 then
				local _ = nil
				local var3835, var3836 = protoModule.readBuffer(p139, var3827)
				var3827 = var3836
				var3826.community_id = buffer.tostring(var3835)
			elseif var3832 == 2 then
				local _ = nil
				local var3837, var3838 = protoModule.readBuffer(p139, var3827)
				var3827 = var3838
				var3826.announcement_id = buffer.tostring(var3837)
			elseif var3832 == 3 then
				local _ = nil
				local var3839, var3840 = protoModule.readBuffer(p139, var3827)
				var3827 = var3840
				var3826.message_id = buffer.tostring(var3839)
			elseif var3832 == 4 then
				local _ = nil
				local var3841, var3842 = protoModule.readBuffer(p139, var3827)
				var3827 = var3842
				var3826.title = buffer.tostring(var3841)
			elseif var3832 == 5 then
				local _ = nil
				local var3843, var3844 = protoModule.readBuffer(p139, var3827)
				var3827 = var3844
				var3826.body = buffer.tostring(var3843)
			elseif var3832 == 6 then
				local _ = nil
				local var3845, var3846 = protoModule.readBuffer(p139, var3827)
				var3827 = var3846
				var3826.creator_key = buffer.tostring(var3845)
			elseif var3832 == 7 then
				local _ = nil
				local var3847, var3848 = protoModule.readBuffer(p139, var3827)
				var3827 = var3848
				var3826.creator_role_name = buffer.tostring(var3847)
			elseif var3832 == 8 then
				local _ = nil
				local var3849, var3850 = protoModule.readBuffer(p139, var3827)
				var3827 = var3850
				var3826.media_asset_id = buffer.tostring(var3849)
			elseif var3832 == 9 then
				local _ = nil
				local var3851, var3852 = protoModule.readBuffer(p139, var3827)
				var3827 = var3852
				var3826.created_time = timestampModule.Timestamp.decode(var3851)
			else
				local _ = nil
				local var3853, var3854 = protoModule.readVarInt(p139, var3827)
				var3827 = var3854 + var3853
			end
		elseif var3828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3855, var3856 = protoModule.readFixed32(p139, var3827)
			local _ = var3855
			var3827 = var3856
		elseif var3828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3857, var3858 = protoModule.readFixed64(p139, var3827)
			local _ = var3857
			var3827 = var3858
		else
			error("Unsupported wire type: " .. var5596)
		end
	end
	return var3826
end

function t_139:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		t.announcementId = self.announcement_id
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		t.messageId = self.message_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.body ~= nil and self.body ~= "" then
		t.body = self.body
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.creator_role_name ~= nil then
		t.creatorRoleName = self.creator_role_name
	end
	if self.media_asset_id ~= nil then
		t.mediaAssetId = self.media_asset_id
	end
	if self.created_time ~= nil then
		t.createdTime = self.created_time:jsonEncode()
	end
	return t
end

function t_139:jsonDecode()
	-- upvalues: t_139 (ref), timestampModule (ref)
	local var3859 = t_139.new()
	
	if self.community_id ~= nil then
		var3859.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3859.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3859.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3859.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3859.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3859.message_id = self.messageId
	end
	if self.title ~= nil then
		var3859.title = self.title
	end
	if self.body ~= nil then
		var3859.body = self.body
	end
	if self.creator_key ~= nil then
		var3859.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3859.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3859.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3859.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3859.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3859.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3859.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3859.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3859
end

t_139.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_139
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p140)
	-- upvalues: t_140 (ref)
	return setmetatable({
		group_id = if p140 == nil or p140.group_id == nil then "" else p140.group_id,
		announcement_id = if p140 == nil or p140.announcement_id == nil then "" else p140.announcement_id,
		message_id = if p140 == nil or p140.message_id == nil then "" else p140.message_id,
		title = if p140 == nil or p140.title == nil then "" else p140.title,
		body = if p140 == nil or p140.body == nil then "" else p140.body,
		creator_key = if p140 == nil or p140.creator_key == nil then "" else p140.creator_key,
		creator_role_name = if p140 == nil or p140.creator_role_name == nil then nil else p140.creator_role_name,
		media_asset_id = if p140 == nil or p140.media_asset_id == nil then nil else p140.media_asset_id,
		created_time = if p140 == nil or p140.created_time == nil then nil else p140.created_time
	}, t_140)
end

function t_140:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3859 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var3860, var3861 = protoModule.writeTag(buff, var3859, 1, protoModule.wireTypes.lengthDelimited)
		var3860, var5632 = protoModule.writeString(var3860, var3861, self.group_id)
		buff = var3860
		var3859 = var3861
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3862, var3863 = protoModule.writeTag(buff, var3859, 2, protoModule.wireTypes.lengthDelimited)
		var3862, var5634 = protoModule.writeString(var3862, var3863, self.announcement_id)
		buff = var3862
		var3859 = var3863
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3864, var3865 = protoModule.writeTag(buff, var3859, 3, protoModule.wireTypes.lengthDelimited)
		var3864, var5636 = protoModule.writeString(var3864, var3865, self.message_id)
		buff = var3864
		var3859 = var3865
	end
	if self.title ~= nil and self.title ~= "" then
		local var3866, var3867 = protoModule.writeTag(buff, var3859, 4, protoModule.wireTypes.lengthDelimited)
		var3866, var5638 = protoModule.writeString(var3866, var3867, self.title)
		buff = var3866
		var3859 = var3867
	end
	if self.body ~= nil and self.body ~= "" then
		local var3868, var3869 = protoModule.writeTag(buff, var3859, 5, protoModule.wireTypes.lengthDelimited)
		var3868, var5640 = protoModule.writeString(var3868, var3869, self.body)
		buff = var3868
		var3859 = var3869
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3870, var3871 = protoModule.writeTag(buff, var3859, 6, protoModule.wireTypes.lengthDelimited)
		var3870, var5642 = protoModule.writeString(var3870, var3871, self.creator_key)
		buff = var3870
		var3859 = var3871
	end
	if self.creator_role_name ~= nil then
		local var3872, var3873 = protoModule.writeTag(buff, var3859, 7, protoModule.wireTypes.lengthDelimited)
		var3872, var5644 = protoModule.writeString(var3872, var3873, self.creator_role_name)
		buff = var3872
		var3859 = var3873
	end
	if self.media_asset_id ~= nil then
		local var3874, var3875 = protoModule.writeTag(buff, var3859, 8, protoModule.wireTypes.lengthDelimited)
		var3874, var5646 = protoModule.writeString(var3874, var3875, self.media_asset_id)
		buff = var3874
		var3859 = var3875
	end
	if self.created_time ~= nil then
		local var3876 = self.created_time:encode()
		local var3877, var3878 = protoModule.writeTag(buff, var3859, 9, protoModule.wireTypes.lengthDelimited)
		var3877, var5649 = protoModule.writeBuffer(var3877, var3878, var3876, buffer.len(var3876))
		buff = var3877
		var3859 = var3878
	end
	local buff_1 = buffer.create(var3859)
	buffer.copy(buff_1, 0, buff, 0, var3859)
	
	return buff_1
end

function t_140.decode(p140)
	-- upvalues: t_140 (ref), protoModule (ref), timestampModule (ref)
	local var3859 = t_140.new()
	local var3860 = 0
	while var3860 < buffer.len(p140) do
		local _ = nil
		local var3861 = nil
		local var3862, var3863, var3864 = protoModule.readTag(p140, var3860)
		local var3865 = var3862
		var3861 = var3863
		var3860 = var3864
		
		if var3861 == protoModule.wireTypes.varint then
			local _ = nil
			local var3866, var3867 = protoModule.readVarInt(p140, var3860)
			local _ = var3866
			var3860 = var3867
			continue
		end
		if var3861 == protoModule.wireTypes.lengthDelimited then
			if var3865 == 1 then
				local _ = nil
				local var3868, var3869 = protoModule.readBuffer(p140, var3860)
				var3860 = var3869
				var3859.group_id = buffer.tostring(var3868)
			elseif var3865 == 2 then
				local _ = nil
				local var3870, var3871 = protoModule.readBuffer(p140, var3860)
				var3860 = var3871
				var3859.announcement_id = buffer.tostring(var3870)
			elseif var3865 == 3 then
				local _ = nil
				local var3872, var3873 = protoModule.readBuffer(p140, var3860)
				var3860 = var3873
				var3859.message_id = buffer.tostring(var3872)
			elseif var3865 == 4 then
				local _ = nil
				local var3874, var3875 = protoModule.readBuffer(p140, var3860)
				var3860 = var3875
				var3859.title = buffer.tostring(var3874)
			elseif var3865 == 5 then
				local _ = nil
				local var3876, var3877 = protoModule.readBuffer(p140, var3860)
				var3860 = var3877
				var3859.body = buffer.tostring(var3876)
			elseif var3865 == 6 then
				local _ = nil
				local var3878, var3879 = protoModule.readBuffer(p140, var3860)
				var3860 = var3879
				var3859.creator_key = buffer.tostring(var3878)
			elseif var3865 == 7 then
				local _ = nil
				local var3880, var3881 = protoModule.readBuffer(p140, var3860)
				var3860 = var3881
				var3859.creator_role_name = buffer.tostring(var3880)
			elseif var3865 == 8 then
				local _ = nil
				local var3882, var3883 = protoModule.readBuffer(p140, var3860)
				var3860 = var3883
				var3859.media_asset_id = buffer.tostring(var3882)
			elseif var3865 == 9 then
				local _ = nil
				local var3884, var3885 = protoModule.readBuffer(p140, var3860)
				var3860 = var3885
				var3859.created_time = timestampModule.Timestamp.decode(var3884)
			else
				local _ = nil
				local var3886, var3887 = protoModule.readVarInt(p140, var3860)
				var3860 = var3887 + var3886
			end
		elseif var3861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3888, var3889 = protoModule.readFixed32(p140, var3860)
			local _ = var3888
			var3860 = var3889
		elseif var3861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3890, var3891 = protoModule.readFixed64(p140, var3860)
			local _ = var3890
			var3860 = var3891
		else
			error("Unsupported wire type: " .. var5653)
		end
	end
	return var3859
end

function t_140:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		t.announcementId = self.announcement_id
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		t.messageId = self.message_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.body ~= nil and self.body ~= "" then
		t.body = self.body
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.creator_role_name ~= nil then
		t.creatorRoleName = self.creator_role_name
	end
	if self.media_asset_id ~= nil then
		t.mediaAssetId = self.media_asset_id
	end
	if self.created_time ~= nil then
		t.createdTime = self.created_time:jsonEncode()
	end
	return t
end

function t_140:jsonDecode()
	-- upvalues: t_140 (ref), timestampModule (ref)
	local var3892 = t_140.new()
	
	if self.group_id ~= nil then
		var3892.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var3892.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		var3892.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3892.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3892.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3892.message_id = self.messageId
	end
	if self.title ~= nil then
		var3892.title = self.title
	end
	if self.body ~= nil then
		var3892.body = self.body
	end
	if self.creator_key ~= nil then
		var3892.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3892.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3892.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3892.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3892.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3892.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3892.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3892.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3892
end

t_140.descriptor = {
	name = "GroupAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GroupAnnouncementInputData"
}
t.GroupAnnouncementInputData = t_140
typeRegistryModule.default:register(t.GroupAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p141)
		return if p141 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p141 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p141)
		return if p141 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p141 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p141
	end,
	fromName = function(p141)
		return if p141 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p141 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end
}

return {
	UniversalPageEntry = t.UniversalPageEntry,
	FeedEntry = t.FeedEntry,
	ForegroundHeaderEntry = t.ForegroundHeaderEntry,
	BackgroundHeaderEntry = t.BackgroundHeaderEntry,
	PageEntryInputData = t.PageEntryInputData,
	BadgesGridInputData = t.BadgesGridInputData,
	BadgesGridInputData_BadgeInputData = t.BadgesGridInputData_BadgeInputData,
	BadgeDetailsInputData = t.BadgeDetailsInputData,
	BadgeDetailsInputData_LocalizedLiterals = t.BadgeDetailsInputData_LocalizedLiterals,
	BadgeDetailsInputData_LocalizedLiterals_InfoTable = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable,
	BadgeDetailsInputData_LocalizedLiterals_ActionModule = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule,
	BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu,
	StaticInputData = t.StaticInputData,
	ExperienceDetailsFeedInputData = t.ExperienceDetailsFeedInputData,
	EntryOrder = t.EntryOrder,
	ExperienceDetailsActionBarInputData = t.ExperienceDetailsActionBarInputData,
	ExperienceDetailsBannerImageInputData = t.ExperienceDetailsBannerImageInputData,
	ExperienceDetailsStickyHeaderInputData = t.ExperienceDetailsStickyHeaderInputData,
	ExperienceAttributionRowInputData = t.ExperienceAttributionRowInputData,
	ExperienceActionModuleInputData = t.ExperienceActionModuleInputData,
	ExperienceActionModuleInputData_ConnectionPlayedUser = t.ExperienceActionModuleInputData_ConnectionPlayedUser,
	ExperienceMediaGalleryInputData = t.ExperienceMediaGalleryInputData,
	ExperienceMediaGalleryInputData_MediaItem = t.ExperienceMediaGalleryInputData_MediaItem,
	ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback,
	ExperienceDescriptionInputData = t.ExperienceDescriptionInputData,
	ExperienceStatRowInputData = t.ExperienceStatRowInputData,
	ExperienceInfoTableInputData = t.ExperienceInfoTableInputData,
	ExperienceContentRatingLabelInputData = t.ExperienceContentRatingLabelInputData,
	ExperienceRefundPolicyInputData = t.ExperienceRefundPolicyInputData,
	ExperiencePlayWithRewardInputData = t.ExperiencePlayWithRewardInputData,
	CommunitySectionInputData = t.CommunitySectionInputData,
	SocialLinkRowInputData = t.SocialLinkRowInputData,
	SocialLinkRowInputData_SocialLinkItem = t.SocialLinkRowInputData_SocialLinkItem,
	ExperienceCarouselInputData = t.ExperienceCarouselInputData,
	ExperienceCarouselInputData_UniverseItem = t.ExperienceCarouselInputData_UniverseItem,
	ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback,
	SongCarouselInputData = t.SongCarouselInputData,
	SongCarouselInputData_SongItem = t.SongCarouselInputData_SongItem,
	EventsCarouselInputData = t.EventsCarouselInputData,
	EventsCarouselInputData_EventItem = t.EventsCarouselInputData_EventItem,
	DevStoreFeedInputData = t.DevStoreFeedInputData,
	PillTabsInputData = t.PillTabsInputData,
	PillTabsInputData_PillTabOption = t.PillTabsInputData_PillTabOption,
	GamePassCollectionInputData = t.GamePassCollectionInputData,
	GamePassCollectionInputData_GamePassItem = t.GamePassCollectionInputData_GamePassItem,
	DeveloperProductCollectionInputData = t.DeveloperProductCollectionInputData,
	DeveloperProductCollectionInputData_DeveloperProductItem = t.DeveloperProductCollectionInputData_DeveloperProductItem,
	SubscriptionCollectionInputData = t.SubscriptionCollectionInputData,
	SubscriptionCollectionInputData_SubscriptionItem = t.SubscriptionCollectionInputData_SubscriptionItem,
	DynamicStoreCategoryInputData = t.DynamicStoreCategoryInputData,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType,
	CardContainerCardInputData = t.CardContainerCardInputData,
	CommunitiesCardClientAttributes = t.CommunitiesCardClientAttributes,
	CardContainerInputData = t.CardContainerInputData,
	CardInputData = t.CardInputData,
	DialogInputData = t.DialogInputData,
	IncomingTransferContent = t.IncomingTransferContent,
	BannerInputData = t.BannerInputData,
	TooltipInputData = t.TooltipInputData,
	CoachmarkInputData = t.CoachmarkInputData,
	SystemBannerInputData = t.SystemBannerInputData,
	AgeCheckUpsellInputData = t.AgeCheckUpsellInputData,
	PartyChatConversationUpsellInputData = t.PartyChatConversationUpsellInputData,
	EventDetailsFeedInputData = t.EventDetailsFeedInputData,
	EventDetailsActionBarInputData = t.EventDetailsActionBarInputData,
	EventDescriptionInputData = t.EventDescriptionInputData,
	EventAttributionRowInputData = t.EventAttributionRowInputData,
	EventAttributionRowInputData_RsvpUser = t.EventAttributionRowInputData_RsvpUser,
	EventInfoTableInputData = t.EventInfoTableInputData,
	EventDetailsSheetFullBleedInputData = t.EventDetailsSheetFullBleedInputData,
	EventNotificationsModalInputData = t.EventNotificationsModalInputData,
	ChartsFeedInputData = t.ChartsFeedInputData,
	FilterPillsInputData = t.FilterPillsInputData,
	FilterPillsInputData_FilterGroup = t.FilterPillsInputData_FilterGroup,
	FilterPillsInputData_FilterOption = t.FilterPillsInputData_FilterOption,
	SortSelectorInputData = t.SortSelectorInputData,
	SortSelectorInputData_SortOption = t.SortSelectorInputData_SortOption,
	ChartsGenreSelectorInputData = t.ChartsGenreSelectorInputData,
	UAMarketplaceCatalogItemGroupInputData = t.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t.UAMarketplaceCatalogItemCarouselInputData,
	WidgetStyleData = t.WidgetStyleData,
	UAMarketplaceCatalogHeroUnitInputData = t.UAMarketplaceCatalogHeroUnitInputData,
	UAMarketplaceCatalogFeedInputData = t.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogCategoryMenuInputData = t.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
	MarketplaceOfferModalInputData = t.MarketplaceOfferModalInputData,
	MarketplaceItemMediaHeaderInputData = t.MarketplaceItemMediaHeaderInputData,
	MarketplaceItemMediaHeaderInputData_BundleItem = t.MarketplaceItemMediaHeaderInputData_BundleItem,
	CatalogItemGridInputData = t.CatalogItemGridInputData,
	CatalogItemGridInputData_CatalogItem = t.CatalogItemGridInputData_CatalogItem,
	SearchResultsFeedInputData = t.SearchResultsFeedInputData,
	SearchAutocompleteInputData = t.SearchAutocompleteInputData,
	SearchAutocompleteInputData_Suggestion = t.SearchAutocompleteInputData_Suggestion,
	SearchAutocompleteInputData_Suggestion_SuggestionType = t.SearchAutocompleteInputData_Suggestion_SuggestionType,
	ExperienceEmphasisTileInputData = t.ExperienceEmphasisTileInputData,
	PowerSearchAIOverviewInputData = t.PowerSearchAIOverviewInputData,
	UserListInputData = t.UserListInputData,
	UserListInputData_UserItem = t.UserListInputData_UserItem,
	CatalogItemListInputData = t.CatalogItemListInputData,
	CatalogItemListInputData_CatalogItem = t.CatalogItemListInputData_CatalogItem,
	ExperienceGuidelinesDialogInputData = t.ExperienceGuidelinesDialogInputData,
	MomentsCarouselInputData = t.MomentsCarouselInputData,
	MomentsCarouselInputData_MomentItem = t.MomentsCarouselInputData_MomentItem,
	AttributionRowInputData = t.AttributionRowInputData,
	CtaButtonsInputData = t.CtaButtonsInputData,
	ImageInputData = t.ImageInputData,
	VideoInputData = t.VideoInputData,
	TextInputData = t.TextInputData,
	VerticalFeedInputData = t.VerticalFeedInputData,
	PageHeaderInputData = t.PageHeaderInputData,
	PreAuthLandingStickyHeaderInputData = t.PreAuthLandingStickyHeaderInputData,
	ImageCtaSectionInputData = t.ImageCtaSectionInputData,
	SettingsRowInputData = t.SettingsRowInputData,
	SettingsToggleInputData = t.SettingsToggleInputData,
	HeroUnitInputData = t.HeroUnitInputData,
	HeroUnitInputData_VisualAsset = t.HeroUnitInputData_VisualAsset,
	HeroUnitInputData_Gradient = t.HeroUnitInputData_Gradient,
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_RecommendationItem = t.FriendRecommendationCarouselInputData_RecommendationItem,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	GameItemsCarouselInputData = t.GameItemsCarouselInputData,
	GameItemsCardInputData = t.GameItemsCardInputData,
	GameItemInputData = t.GameItemInputData,
	AdLinkItem = t.AdLinkItem,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	CommunityAnnouncementInputData = t.CommunityAnnouncementInputData,
	GroupAnnouncementInputData = t.GroupAnnouncementInputData,
	PageEntryFormat = t.PageEntryFormat
}