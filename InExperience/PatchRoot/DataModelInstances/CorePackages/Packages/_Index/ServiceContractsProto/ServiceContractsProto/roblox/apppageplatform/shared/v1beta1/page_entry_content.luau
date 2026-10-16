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
		var3, var148 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var151 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var3)
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
		var22, var178 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var180 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var22)
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
		var40, var206 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var209 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var212 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var41)
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
		var61, var240 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var243 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var246 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var62)
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
			var83, var275 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var278 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var281 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var284 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var287 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var290 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var293 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var296 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var299 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var302 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var305 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var308 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var311 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var314 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var317 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var320 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var323 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var326 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var329 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var332 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var335 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var338 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var341 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var344 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var347 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var350 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var353 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var356 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var359 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var362 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var365 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var368 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var371 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var374 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var377 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var380 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var383 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "sandbox_content" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 50, protoModule.wireTypes.lengthDelimited)
			var194, var386 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_feed" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var197, var389 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_action_bar" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var200, var392 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_banner_image" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var203, var395 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "experience_details_sticky_header" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var206, var398 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_feed" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var209, var401 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_details_action_bar" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var212, var404 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_attribution_row" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var215, var407 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_description" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var218, var410 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_info_table" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var221, var413 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var224, var416 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "event_notifications_modal" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var227, var419 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "dev_store_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var230, var422 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "charts_feed" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var233, var425 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "filter_pills" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var236, var428 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "sort_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var239, var431 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "genre_selector" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var242, var434 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var245, var437 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var248, var440 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var251, var443 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var254, var446 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var257, var449 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "catalog_item_grid" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var260, var452 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "marketplace_offer_modal" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var263, var455 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "marketplace_item_media_header" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 907, protoModule.wireTypes.lengthDelimited)
			var266, var458 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "search_results_feed" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var269, var461 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "power_search_ai_overview" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var272, var464 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "experience_emphasis_tile" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var275, var467 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "option_selector_carousel" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var278, var470 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "game_items_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var281, var473 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "hero_unit" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var284, var476 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var287, var479 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var290, var482 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var293, var485 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "community_announcement" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var296, var488 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
		elseif self.kind.type == "group_announcement" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var81, 1401, protoModule.wireTypes.lengthDelimited)
			var299, var491 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var81 = var300
		elseif self.kind.type == "settings_row" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var302, var494 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var81 = var303
		elseif self.kind.type == "settings_toggle" then
			local var304 = self.kind.value:encode()
			local var305, var306 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var305, var497 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
			buff = var305
			var81 = var306
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
			elseif var87 == 1100 then
				local _ = nil
				local var220, var221 = protoModule.readBuffer(p5, var82)
				var82 = var221
				var81.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var220)
				}
			elseif var87 == 1101 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p5, var82)
				var82 = var223
				var81.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var222)
				}
			elseif var87 == 1102 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p5, var82)
				var82 = var225
				var81.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var224)
				}
			elseif var87 == 1103 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p5, var82)
				var82 = var227
				var81.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var226)
				}
			elseif var87 == 1200 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p5, var82)
				var82 = var229
				var81.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var228)
				}
			elseif var87 == 1300 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p5, var82)
				var82 = var231
				var81.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var230)
				}
			elseif var87 == 1400 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p5, var82)
				var82 = var233
				var81.kind = {
					type = "community_announcement",
					value = t.CommunityAnnouncementInputData.decode(var232)
				}
			elseif var87 == 1401 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p5, var82)
				var82 = var235
				var81.kind = {
					type = "group_announcement",
					value = t.GroupAnnouncementInputData.decode(var234)
				}
			elseif var87 == 1500 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p5, var82)
				var82 = var237
				var81.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(var236)
				}
			elseif var87 == 1501 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p5, var82)
				var82 = var239
				var81.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(var238)
				}
			else
				local _ = nil
				local var240, var241 = protoModule.readVarInt(p5, var82)
				var82 = var241 + var240
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var242, var243 = protoModule.readFixed32(p5, var82)
			local _ = var242
			var82 = var243
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var244, var245 = protoModule.readFixed64(p5, var82)
			local _ = var244
			var82 = var245
		else
			error("Unsupported wire type: " .. var83)
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
	local var246 = t_5.new()
	
	if self.badges_grid ~= nil then
		var246.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var246.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var246.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var246.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var246.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var246.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var246.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var246.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var246.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var246.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var246.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var246.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var246.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var246.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var246.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var246.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var246.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var246.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var246.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var246.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var246.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var246.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var246.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var246.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var246.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var246.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var246.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var246.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var246.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var246.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var246.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var246.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var246.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var246.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var246.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var246.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var246.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var246.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var246.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var246.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var246.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var246.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var246.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var246.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var246.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var246.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var246.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var246.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var246.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var246.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var246.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var246.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var246.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var246.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var246.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var246.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var246.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var246.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var246.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var246.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var246.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var246.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var246.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var246.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var246.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var246.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var246.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var246.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.sandbox_content ~= nil then
		var246.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandbox_content)
		}
	end
	if self.sandboxContent ~= nil then
		var246.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandboxContent)
		}
	end
	if self.experience_details_feed ~= nil then
		var246.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var246.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var246.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var246.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var246.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var246.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var246.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var246.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var246.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var246.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var246.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var246.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var246.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var246.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var246.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var246.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var246.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var246.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var246.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var246.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var246.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var246.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var246.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var246.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var246.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var246.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var246.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var246.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var246.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var246.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var246.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var246.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var246.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var246.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var246.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var246.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var246.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var246.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var246.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var246.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var246.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var246.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var246.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var246.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var246.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var246.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.marketplace_item_media_header ~= nil then
		var246.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplace_item_media_header)
		}
	end
	if self.marketplaceItemMediaHeader ~= nil then
		var246.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplaceItemMediaHeader)
		}
	end
	if self.search_results_feed ~= nil then
		var246.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var246.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var246.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var246.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var246.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var246.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var246.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var246.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var246.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var246.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var246.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var246.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var246.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var246.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var246.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var246.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var246.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var246.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var246.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var246.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.group_announcement ~= nil then
		var246.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.group_announcement)
		}
	end
	if self.groupAnnouncement ~= nil then
		var246.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.groupAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var246.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var246.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		var246.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		var246.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
		}
	end
	return var246
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
	local var246 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var247, var248 = protoModule.writeTag(buff, var246, 1, protoModule.wireTypes.lengthDelimited)
		var247, var669 = protoModule.writeString(var247, var248, self.section_title)
		buff = var247
		var246 = var248
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var249 = v:encode()
			local var250, var251 = protoModule.writeTag(buff, var246, 2, protoModule.wireTypes.lengthDelimited)
			var250, var672 = protoModule.writeBuffer(var250, var251, var249, buffer.len(var249))
			buff = var250
			var246 = var251
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var252, var253 = protoModule.writeTag(buff, var246, 3, protoModule.wireTypes.lengthDelimited)
		var252, var674 = protoModule.writeString(var252, var253, self.collection_id)
		buff = var252
		var246 = var253
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var254, var255 = protoModule.writeTag(buff, var246, 4, protoModule.wireTypes.lengthDelimited)
		var254, var676 = protoModule.writeString(var254, var255, self.collection_position)
		buff = var254
		var246 = var255
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var256, var257 = protoModule.writeTag(buff, var246, 5, protoModule.wireTypes.lengthDelimited)
		var256, var678 = protoModule.writeString(var256, var257, self.universe_id)
		buff = var256
		var246 = var257
	end
	local buff_1 = buffer.create(var246)
	buffer.copy(buff_1, 0, buff, 0, var246)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var258 = t_6.new()
	local var259 = 0
	while var259 < buffer.len(p6) do
		local _ = nil
		local var260 = nil
		local var261, var262, var263 = protoModule.readTag(p6, var259)
		local var264 = var261
		var260 = var262
		var259 = var263
		
		if var260 == protoModule.wireTypes.varint then
			local _ = nil
			local var265, var266 = protoModule.readVarInt(p6, var259)
			local _ = var265
			var259 = var266
			continue
		end
		if var260 == protoModule.wireTypes.lengthDelimited then
			if var264 == 1 then
				local _ = nil
				local var267, var268 = protoModule.readBuffer(p6, var259)
				var259 = var268
				var258.section_title = buffer.tostring(var267)
			elseif var264 == 2 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p6, var259)
				var259 = var270
				table.insert(var258.badges, t.BadgesGridInputData_BadgeInputData.decode(var269))
			elseif var264 == 3 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p6, var259)
				var259 = var272
				var258.collection_id = buffer.tostring(var271)
			elseif var264 == 4 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p6, var259)
				var259 = var274
				var258.collection_position = buffer.tostring(var273)
			elseif var264 == 5 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p6, var259)
				var259 = var276
				var258.universe_id = buffer.tostring(var275)
			else
				local _ = nil
				local var277, var278 = protoModule.readVarInt(p6, var259)
				var259 = var278 + var277
			end
		elseif var260 == protoModule.wireTypes.i32 then
			local _ = nil
			local var279, var280 = protoModule.readFixed32(p6, var259)
			local _ = var279
			var259 = var280
		elseif var260 == protoModule.wireTypes.i64 then
			local _ = nil
			local var281, var282 = protoModule.readFixed64(p6, var259)
			local _ = var281
			var259 = var282
		else
			error("Unsupported wire type: " .. var260)
		end
	end
	return var258
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
	local var283 = t_6.new()
	
	if self.section_title ~= nil then
		var283.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var283.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var283.badges = t_1
	end
	if self.collection_id ~= nil then
		var283.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var283.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var283.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var283.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var283.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var283.universe_id = self.universeId
	end
	return var283
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
	local var284 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var285, var286 = protoModule.writeTag(buff, var284, 1, protoModule.wireTypes.lengthDelimited)
		var285, var712 = protoModule.writeString(var285, var286, self.badge_id)
		buff = var285
		var284 = var286
	end
	local buff_1 = buffer.create(var284)
	buffer.copy(buff_1, 0, buff, 0, var284)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var284 = t_7.new()
	local var285 = 0
	while var285 < buffer.len(p7) do
		local _ = nil
		local var286 = nil
		local var287, var288, var289 = protoModule.readTag(p7, var285)
		local var290 = var287
		var286 = var288
		var285 = var289
		
		if var286 == protoModule.wireTypes.varint then
			local _ = nil
			local var291, var292 = protoModule.readVarInt(p7, var285)
			local _ = var291
			var285 = var292
			continue
		end
		if var286 == protoModule.wireTypes.lengthDelimited then
			if var290 == 1 then
				local _ = nil
				local var293, var294 = protoModule.readBuffer(p7, var285)
				var285 = var294
				var284.badge_id = buffer.tostring(var293)
			else
				local _ = nil
				local var295, var296 = protoModule.readVarInt(p7, var285)
				var285 = var296 + var295
			end
		elseif var286 == protoModule.wireTypes.i32 then
			local _ = nil
			local var297, var298 = protoModule.readFixed32(p7, var285)
			local _ = var297
			var285 = var298
		elseif var286 == protoModule.wireTypes.i64 then
			local _ = nil
			local var299, var300 = protoModule.readFixed64(p7, var285)
			local _ = var299
			var285 = var300
		else
			error("Unsupported wire type: " .. var286)
		end
	end
	return var284
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
	local var301 = t_7.new()
	
	if self.badge_id ~= nil then
		var301.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var301.badge_id = self.badgeId
	end
	return var301
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
	local var301 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var302, var303 = protoModule.writeTag(buff, var301, 1, protoModule.wireTypes.lengthDelimited)
		var302, var736 = protoModule.writeString(var302, var303, self.badge_id)
		buff = var302
		var301 = var303
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var304, var305 = protoModule.writeTag(buff, var301, 2, protoModule.wireTypes.lengthDelimited)
		var304, var738 = protoModule.writeString(var304, var305, self.universe_id)
		buff = var304
		var301 = var305
	end
	if self.localized_literals ~= nil then
		local var306 = self.localized_literals:encode()
		local var307, var308 = protoModule.writeTag(buff, var301, 3, protoModule.wireTypes.lengthDelimited)
		var307, var741 = protoModule.writeBuffer(var307, var308, var306, buffer.len(var306))
		buff = var307
		var301 = var308
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var309, var310 = protoModule.writeTag(buff, var301, 4, protoModule.wireTypes.lengthDelimited)
		var309, var743 = protoModule.writeString(var309, var310, self.creator_key)
		buff = var309
		var301 = var310
	end
	local buff_1 = buffer.create(var301)
	buffer.copy(buff_1, 0, buff, 0, var301)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var301 = t_8.new()
	local var302 = 0
	while var302 < buffer.len(p8) do
		local _ = nil
		local var303 = nil
		local var304, var305, var306 = protoModule.readTag(p8, var302)
		local var307 = var304
		var303 = var305
		var302 = var306
		
		if var303 == protoModule.wireTypes.varint then
			local _ = nil
			local var308, var309 = protoModule.readVarInt(p8, var302)
			local _ = var308
			var302 = var309
			continue
		end
		if var303 == protoModule.wireTypes.lengthDelimited then
			if var307 == 1 then
				local _ = nil
				local var310, var311 = protoModule.readBuffer(p8, var302)
				var302 = var311
				var301.badge_id = buffer.tostring(var310)
			elseif var307 == 2 then
				local _ = nil
				local var312, var313 = protoModule.readBuffer(p8, var302)
				var302 = var313
				var301.universe_id = buffer.tostring(var312)
			elseif var307 == 3 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p8, var302)
				var302 = var315
				var301.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var314)
			elseif var307 == 4 then
				local _ = nil
				local var316, var317 = protoModule.readBuffer(p8, var302)
				var302 = var317
				var301.creator_key = buffer.tostring(var316)
			else
				local _ = nil
				local var318, var319 = protoModule.readVarInt(p8, var302)
				var302 = var319 + var318
			end
		elseif var303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var320, var321 = protoModule.readFixed32(p8, var302)
			local _ = var320
			var302 = var321
		elseif var303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var322, var323 = protoModule.readFixed64(p8, var302)
			local _ = var322
			var302 = var323
		else
			error("Unsupported wire type: " .. var303)
		end
	end
	return var301
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
	local var324 = t_8.new()
	
	if self.badge_id ~= nil then
		var324.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var324.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var324.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var324.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var324.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var324.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var324.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var324.creator_key = self.creatorKey
	end
	return var324
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
	local var324 = 0
	
	if self.info_table ~= nil then
		local var325 = self.info_table:encode()
		local var326, var327 = protoModule.writeTag(buff, var324, 1, protoModule.wireTypes.lengthDelimited)
		var326, var774 = protoModule.writeBuffer(var326, var327, var325, buffer.len(var325))
		buff = var326
		var324 = var327
	end
	if self.action_module ~= nil then
		local var328 = self.action_module:encode()
		local var329, var330 = protoModule.writeTag(buff, var324, 2, protoModule.wireTypes.lengthDelimited)
		var329, var777 = protoModule.writeBuffer(var329, var330, var328, buffer.len(var328))
		buff = var329
		var324 = var330
	end
	if self.overflow_menu ~= nil then
		local var331 = self.overflow_menu:encode()
		local var332, var333 = protoModule.writeTag(buff, var324, 3, protoModule.wireTypes.lengthDelimited)
		var332, var780 = protoModule.writeBuffer(var332, var333, var331, buffer.len(var331))
		buff = var332
		var324 = var333
	end
	local buff_1 = buffer.create(var324)
	buffer.copy(buff_1, 0, buff, 0, var324)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var324 = t_9.new()
	local var325 = 0
	while var325 < buffer.len(p9) do
		local _ = nil
		local var326 = nil
		local var327, var328, var329 = protoModule.readTag(p9, var325)
		local var330 = var327
		var326 = var328
		var325 = var329
		
		if var326 == protoModule.wireTypes.varint then
			local _ = nil
			local var331, var332 = protoModule.readVarInt(p9, var325)
			local _ = var331
			var325 = var332
			continue
		end
		if var326 == protoModule.wireTypes.lengthDelimited then
			if var330 == 1 then
				local _ = nil
				local var333, var334 = protoModule.readBuffer(p9, var325)
				var325 = var334
				var324.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var333)
			elseif var330 == 2 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p9, var325)
				var325 = var336
				var324.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var335)
			elseif var330 == 3 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p9, var325)
				var325 = var338
				var324.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var337)
			else
				local _ = nil
				local var339, var340 = protoModule.readVarInt(p9, var325)
				var325 = var340 + var339
			end
		elseif var326 == protoModule.wireTypes.i32 then
			local _ = nil
			local var341, var342 = protoModule.readFixed32(p9, var325)
			local _ = var341
			var325 = var342
		elseif var326 == protoModule.wireTypes.i64 then
			local _ = nil
			local var343, var344 = protoModule.readFixed64(p9, var325)
			local _ = var343
			var325 = var344
		else
			error("Unsupported wire type: " .. var326)
		end
	end
	return var324
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
	local var345 = t_9.new()
	
	if self.info_table ~= nil then
		var345.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var345.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var345.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var345.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var345.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var345.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var345
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
	local var345 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var345, 1, protoModule.wireTypes.lengthDelimited)
		var346, var808 = protoModule.writeString(var346, var347, self.type_label)
		buff = var346
		var345 = var347
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var345, 2, protoModule.wireTypes.lengthDelimited)
		var348, var810 = protoModule.writeString(var348, var349, self.earned_label)
		buff = var348
		var345 = var349
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var345, 3, protoModule.wireTypes.lengthDelimited)
		var350, var812 = protoModule.writeString(var350, var351, self.updated_label)
		buff = var350
		var345 = var351
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var345, 4, protoModule.wireTypes.lengthDelimited)
		var352, var814 = protoModule.writeString(var352, var353, self.experience_label)
		buff = var352
		var345 = var353
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var354, var355 = protoModule.writeTag(buff, var345, 5, protoModule.wireTypes.lengthDelimited)
		var354, var816 = protoModule.writeString(var354, var355, self.rarity_label)
		buff = var354
		var345 = var355
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var345, 6, protoModule.wireTypes.lengthDelimited)
		var356, var818 = protoModule.writeString(var356, var357, self.won_yesterday_label)
		buff = var356
		var345 = var357
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var358, var359 = protoModule.writeTag(buff, var345, 7, protoModule.wireTypes.lengthDelimited)
		var358, var820 = protoModule.writeString(var358, var359, self.won_ever_label)
		buff = var358
		var345 = var359
	end
	local buff_1 = buffer.create(var345)
	buffer.copy(buff_1, 0, buff, 0, var345)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var345 = t_10.new()
	local var346 = 0
	while var346 < buffer.len(p10) do
		local _ = nil
		local var347 = nil
		local var348, var349, var350 = protoModule.readTag(p10, var346)
		local var351 = var348
		var347 = var349
		var346 = var350
		
		if var347 == protoModule.wireTypes.varint then
			local _ = nil
			local var352, var353 = protoModule.readVarInt(p10, var346)
			local _ = var352
			var346 = var353
			continue
		end
		if var347 == protoModule.wireTypes.lengthDelimited then
			if var351 == 1 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var346)
				var346 = var355
				var345.type_label = buffer.tostring(var354)
			elseif var351 == 2 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var346)
				var346 = var357
				var345.earned_label = buffer.tostring(var356)
			elseif var351 == 3 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var346)
				var346 = var359
				var345.updated_label = buffer.tostring(var358)
			elseif var351 == 4 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var346)
				var346 = var361
				var345.experience_label = buffer.tostring(var360)
			elseif var351 == 5 then
				local _ = nil
				local var362, var363 = protoModule.readBuffer(p10, var346)
				var346 = var363
				var345.rarity_label = buffer.tostring(var362)
			elseif var351 == 6 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p10, var346)
				var346 = var365
				var345.won_yesterday_label = buffer.tostring(var364)
			elseif var351 == 7 then
				local _ = nil
				local var366, var367 = protoModule.readBuffer(p10, var346)
				var346 = var367
				var345.won_ever_label = buffer.tostring(var366)
			else
				local _ = nil
				local var368, var369 = protoModule.readVarInt(p10, var346)
				var346 = var369 + var368
			end
		elseif var347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var370, var371 = protoModule.readFixed32(p10, var346)
			local _ = var370
			var346 = var371
		elseif var347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var372, var373 = protoModule.readFixed64(p10, var346)
			local _ = var372
			var346 = var373
		else
			error("Unsupported wire type: " .. var347)
		end
	end
	return var345
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
	local var374 = t_10.new()
	
	if self.type_label ~= nil then
		var374.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var374.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var374.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var374.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var374.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var374.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var374.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var374.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var374.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var374.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var374.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var374.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var374.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var374.won_ever_label = self.wonEverLabel
	end
	return var374
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
	local var374 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var375, var376 = protoModule.writeTag(buff, var374, 1, protoModule.wireTypes.lengthDelimited)
		var375, var856 = protoModule.writeString(var375, var376, self.share)
		buff = var375
		var374 = var376
	end
	if self.report ~= nil and self.report ~= "" then
		local var377, var378 = protoModule.writeTag(buff, var374, 2, protoModule.wireTypes.lengthDelimited)
		var377, var858 = protoModule.writeString(var377, var378, self.report)
		buff = var377
		var374 = var378
	end
	local buff_1 = buffer.create(var374)
	buffer.copy(buff_1, 0, buff, 0, var374)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var374 = t_11.new()
	local var375 = 0
	while var375 < buffer.len(p11) do
		local _ = nil
		local var376 = nil
		local var377, var378, var379 = protoModule.readTag(p11, var375)
		local var380 = var377
		var376 = var378
		var375 = var379
		
		if var376 == protoModule.wireTypes.varint then
			local _ = nil
			local var381, var382 = protoModule.readVarInt(p11, var375)
			local _ = var381
			var375 = var382
			continue
		end
		if var376 == protoModule.wireTypes.lengthDelimited then
			if var380 == 1 then
				local _ = nil
				local var383, var384 = protoModule.readBuffer(p11, var375)
				var375 = var384
				var374.share = buffer.tostring(var383)
			elseif var380 == 2 then
				local _ = nil
				local var385, var386 = protoModule.readBuffer(p11, var375)
				var375 = var386
				var374.report = buffer.tostring(var385)
			else
				local _ = nil
				local var387, var388 = protoModule.readVarInt(p11, var375)
				var375 = var388 + var387
			end
		elseif var376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var389, var390 = protoModule.readFixed32(p11, var375)
			local _ = var389
			var375 = var390
		elseif var376 == protoModule.wireTypes.i64 then
			local _ = nil
			local var391, var392 = protoModule.readFixed64(p11, var375)
			local _ = var391
			var375 = var392
		else
			error("Unsupported wire type: " .. var376)
		end
	end
	return var374
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
	local var393 = t_11.new()
	
	if self.share ~= nil then
		var393.share = self.share
	end
	if self.report ~= nil then
		var393.report = self.report
	end
	return var393
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
	local var393 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var394, var395 = protoModule.writeTag(buff, var393, 1, protoModule.wireTypes.lengthDelimited)
		var394, var884 = protoModule.writeString(var394, var395, self.report)
		buff = var394
		var393 = var395
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var396, var397 = protoModule.writeTag(buff, var393, 2, protoModule.wireTypes.lengthDelimited)
		var396, var886 = protoModule.writeString(var396, var397, self.remove)
		buff = var396
		var393 = var397
	end
	local buff_1 = buffer.create(var393)
	buffer.copy(buff_1, 0, buff, 0, var393)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var393 = t_12.new()
	local var394 = 0
	while var394 < buffer.len(p12) do
		local _ = nil
		local var395 = nil
		local var396, var397, var398 = protoModule.readTag(p12, var394)
		local var399 = var396
		var395 = var397
		var394 = var398
		
		if var395 == protoModule.wireTypes.varint then
			local _ = nil
			local var400, var401 = protoModule.readVarInt(p12, var394)
			local _ = var400
			var394 = var401
			continue
		end
		if var395 == protoModule.wireTypes.lengthDelimited then
			if var399 == 1 then
				local _ = nil
				local var402, var403 = protoModule.readBuffer(p12, var394)
				var394 = var403
				var393.report = buffer.tostring(var402)
			elseif var399 == 2 then
				local _ = nil
				local var404, var405 = protoModule.readBuffer(p12, var394)
				var394 = var405
				var393.remove = buffer.tostring(var404)
			else
				local _ = nil
				local var406, var407 = protoModule.readVarInt(p12, var394)
				var394 = var407 + var406
			end
		elseif var395 == protoModule.wireTypes.i32 then
			local _ = nil
			local var408, var409 = protoModule.readFixed32(p12, var394)
			local _ = var408
			var394 = var409
		elseif var395 == protoModule.wireTypes.i64 then
			local _ = nil
			local var410, var411 = protoModule.readFixed64(p12, var394)
			local _ = var410
			var394 = var411
		else
			error("Unsupported wire type: " .. var395)
		end
	end
	return var393
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
	local var412 = t_12.new()
	
	if self.report ~= nil then
		var412.report = self.report
	end
	if self.remove ~= nil then
		var412.remove = self.remove
	end
	return var412
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
	local var412 = t_13.new()
	local var413 = 0
	while var413 < buffer.len(p13) do
		local var414 = nil
		local _ = nil
		local var415, var416, var417 = protoModule.readTag(p13, var413)
		var414 = var415
		local var418 = var416
		var413 = var417
		
		if var418 == protoModule.wireTypes.varint then
			local _ = nil
			local var419, var420 = protoModule.readVarInt(p13, var413)
			local _ = var419
			var413 = var420
		elseif var418 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var421, var422 = protoModule.readVarInt(p13, var413)
			var413 = var422 + var421
		elseif var418 == protoModule.wireTypes.i32 then
			local _ = nil
			local var423, var424 = protoModule.readFixed32(p13, var413)
			local _ = var423
			var413 = var424
		elseif var418 == protoModule.wireTypes.i64 then
			local _ = nil
			local var425, var426 = protoModule.readFixed64(p13, var413)
			local _ = var425
			var413 = var426
		else
			error("Unsupported wire type: " .. var418)
		end
	end
	return var412
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
	local var427 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var428, var429 = protoModule.writeTag(buff, var427, 1, protoModule.wireTypes.lengthDelimited)
		var428, var928 = protoModule.writeString(var428, var429, self.universe_id)
		buff = var428
		var427 = var429
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var430, var431 = protoModule.writeTag(buff, var427, 2, protoModule.wireTypes.lengthDelimited)
		var430, var930 = protoModule.writeString(var430, var431, self.creator_key)
		buff = var430
		var427 = var431
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var432, var433 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var432, var932 = protoModule.writeString(var432, var433, i)
			local var434 = v:encode()
			var433, var934 = protoModule.writeTag(var432, var433, 2, protoModule.wireTypes.lengthDelimited)
			var433, var934 = protoModule.writeBuffer(var433, var934, var434, buffer.len(var434))
			local var435 = var433
			local var436 = var934
			local var437, var438 = protoModule.writeTag(buff, var427, 3, protoModule.wireTypes.lengthDelimited)
			var437, var938 = protoModule.writeBuffer(var437, var438, var435, var436)
			buff = var437
			var427 = var438
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var439, var440 = protoModule.writeTag(buff, var427, 4, protoModule.wireTypes.lengthDelimited)
			var439, var940 = protoModule.writeString(var439, var440, v)
			buff = var439
			var427 = var440
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var441, var442 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var441, var942 = protoModule.writeString(var441, var442, i)
			local var443 = v:encode()
			var442, var944 = protoModule.writeTag(var441, var442, 2, protoModule.wireTypes.lengthDelimited)
			var442, var944 = protoModule.writeBuffer(var442, var944, var443, buffer.len(var443))
			local var444 = var442
			local var445 = var944
			local var446, var447 = protoModule.writeTag(buff, var427, 5, protoModule.wireTypes.lengthDelimited)
			var446, var948 = protoModule.writeBuffer(var446, var447, var444, var445)
			buff = var446
			var427 = var447
		end
	end
	local buff_1 = buffer.create(var427)
	buffer.copy(buff_1, 0, buff, 0, var427)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var448 = t_14.new()
	local var449 = 0
	while var449 < buffer.len(p14) do
		local _ = nil
		local var450 = nil
		local var451, var452, var453 = protoModule.readTag(p14, var449)
		local var454 = var451
		var450 = var452
		var449 = var453
		
		if var450 == protoModule.wireTypes.varint then
			local _ = nil
			local var455, var456 = protoModule.readVarInt(p14, var449)
			local _ = var455
			var449 = var456
			continue
		end
		if var450 == protoModule.wireTypes.lengthDelimited then
			if var454 == 1 then
				local _ = nil
				local var457, var458 = protoModule.readBuffer(p14, var449)
				var449 = var458
				var448.universe_id = buffer.tostring(var457)
			elseif var454 == 2 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p14, var449)
				var449 = var460
				var448.creator_key = buffer.tostring(var459)
			elseif var454 == 3 then
				local _ = nil
				local var461, var462 = protoModule.readBuffer(p14, var449)
				var449 = var462
				var461 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var461)
				var448.entry_map[var461.key or ""] = var461.value or t.FeedEntry.new()
			elseif var454 == 4 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p14, var449)
				var449 = var464
				table.insert(var448.entry_order, buffer.tostring(var463))
			elseif var454 == 5 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p14, var449)
				var449 = var466
				var465 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var465)
				var448.entry_order_map[var465.key or ""] = var465.value or t.EntryOrder.new()
			else
				local _ = nil
				local var467, var468 = protoModule.readVarInt(p14, var449)
				var449 = var468 + var467
			end
		elseif var450 == protoModule.wireTypes.i32 then
			local _ = nil
			local var469, var470 = protoModule.readFixed32(p14, var449)
			local _ = var469
			var449 = var470
		elseif var450 == protoModule.wireTypes.i64 then
			local _ = nil
			local var471, var472 = protoModule.readFixed64(p14, var449)
			local _ = var471
			var449 = var472
		else
			error("Unsupported wire type: " .. var450)
		end
	end
	return var448
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
	local var473 = t_14.new()
	
	if self.universe_id ~= nil then
		var473.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var473.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var473.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var473.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var473.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var473.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var473.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var473.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var473.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var473.entry_order_map = t_1
	end
	return var473
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
	local var474 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var475, var476 = protoModule.writeTag(buff, var474, 1, protoModule.wireTypes.lengthDelimited)
		var475, var989 = protoModule.writeString(var475, var476, self.key)
		buff = var475
		var474 = var476
	end
	if self.value ~= nil then
		local var477 = self.value:encode()
		local var478, var479 = protoModule.writeTag(buff, var474, 2, protoModule.wireTypes.lengthDelimited)
		var478, var992 = protoModule.writeBuffer(var478, var479, var477, buffer.len(var477))
		buff = var478
		var474 = var479
	end
	local buff_1 = buffer.create(var474)
	buffer.copy(buff_1, 0, buff, 0, var474)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var474 = t_15.new()
	local var475 = 0
	while var475 < buffer.len(p15) do
		local _ = nil
		local var476 = nil
		local var477, var478, var479 = protoModule.readTag(p15, var475)
		local var480 = var477
		var476 = var478
		var475 = var479
		
		if var476 == protoModule.wireTypes.varint then
			local _ = nil
			local var481, var482 = protoModule.readVarInt(p15, var475)
			local _ = var481
			var475 = var482
			continue
		end
		if var476 == protoModule.wireTypes.lengthDelimited then
			if var480 == 1 then
				local _ = nil
				local var483, var484 = protoModule.readBuffer(p15, var475)
				var475 = var484
				var474.key = buffer.tostring(var483)
			elseif var480 == 2 then
				local _ = nil
				local var485, var486 = protoModule.readBuffer(p15, var475)
				var475 = var486
				var474.value = t.FeedEntry.decode(var485)
			else
				local _ = nil
				local var487, var488 = protoModule.readVarInt(p15, var475)
				var475 = var488 + var487
			end
		elseif var476 == protoModule.wireTypes.i32 then
			local _ = nil
			local var489, var490 = protoModule.readFixed32(p15, var475)
			local _ = var489
			var475 = var490
		elseif var476 == protoModule.wireTypes.i64 then
			local _ = nil
			local var491, var492 = protoModule.readFixed64(p15, var475)
			local _ = var491
			var475 = var492
		else
			error("Unsupported wire type: " .. var476)
		end
	end
	return var474
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
	local var493 = t_15.new()
	
	if self.key ~= nil then
		var493.key = self.key
	end
	if self.value ~= nil then
		var493.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var493
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
	local var493 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var494, var495 = protoModule.writeTag(buff, var493, 1, protoModule.wireTypes.lengthDelimited)
		var494, var1018 = protoModule.writeString(var494, var495, self.key)
		buff = var494
		var493 = var495
	end
	if self.value ~= nil then
		local var496 = self.value:encode()
		local var497, var498 = protoModule.writeTag(buff, var493, 2, protoModule.wireTypes.lengthDelimited)
		var497, var1021 = protoModule.writeBuffer(var497, var498, var496, buffer.len(var496))
		buff = var497
		var493 = var498
	end
	local buff_1 = buffer.create(var493)
	buffer.copy(buff_1, 0, buff, 0, var493)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var493 = t_16.new()
	local var494 = 0
	while var494 < buffer.len(p16) do
		local _ = nil
		local var495 = nil
		local var496, var497, var498 = protoModule.readTag(p16, var494)
		local var499 = var496
		var495 = var497
		var494 = var498
		
		if var495 == protoModule.wireTypes.varint then
			local _ = nil
			local var500, var501 = protoModule.readVarInt(p16, var494)
			local _ = var500
			var494 = var501
			continue
		end
		if var495 == protoModule.wireTypes.lengthDelimited then
			if var499 == 1 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p16, var494)
				var494 = var503
				var493.key = buffer.tostring(var502)
			elseif var499 == 2 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p16, var494)
				var494 = var505
				var493.value = t.EntryOrder.decode(var504)
			else
				local _ = nil
				local var506, var507 = protoModule.readVarInt(p16, var494)
				var494 = var507 + var506
			end
		elseif var495 == protoModule.wireTypes.i32 then
			local _ = nil
			local var508, var509 = protoModule.readFixed32(p16, var494)
			local _ = var508
			var494 = var509
		elseif var495 == protoModule.wireTypes.i64 then
			local _ = nil
			local var510, var511 = protoModule.readFixed64(p16, var494)
			local _ = var510
			var494 = var511
		else
			error("Unsupported wire type: " .. var495)
		end
	end
	return var493
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
	local var512 = t_16.new()
	
	if self.key ~= nil then
		var512.key = self.key
	end
	if self.value ~= nil then
		var512.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var512
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
	local var512 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var513, var514 = protoModule.writeTag(buff, var512, 1, protoModule.wireTypes.lengthDelimited)
			var513, var1047 = protoModule.writeString(var513, var514, v)
			buff = var513
			var512 = var514
		end
	end
	local buff_1 = buffer.create(var512)
	buffer.copy(buff_1, 0, buff, 0, var512)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var515 = t_17.new()
	local var516 = 0
	while var516 < buffer.len(p17) do
		local _ = nil
		local var517 = nil
		local var518, var519, var520 = protoModule.readTag(p17, var516)
		local var521 = var518
		var517 = var519
		var516 = var520
		
		if var517 == protoModule.wireTypes.varint then
			local _ = nil
			local var522, var523 = protoModule.readVarInt(p17, var516)
			local _ = var522
			var516 = var523
			continue
		end
		if var517 == protoModule.wireTypes.lengthDelimited then
			if var521 == 1 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p17, var516)
				var516 = var525
				table.insert(var515.items, buffer.tostring(var524))
			else
				local _ = nil
				local var526, var527 = protoModule.readVarInt(p17, var516)
				var516 = var527 + var526
			end
		elseif var517 == protoModule.wireTypes.i32 then
			local _ = nil
			local var528, var529 = protoModule.readFixed32(p17, var516)
			local _ = var528
			var516 = var529
		elseif var517 == protoModule.wireTypes.i64 then
			local _ = nil
			local var530, var531 = protoModule.readFixed64(p17, var516)
			local _ = var530
			var516 = var531
		else
			error("Unsupported wire type: " .. var517)
		end
	end
	return var515
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
	local var532 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var532.items = t
	end
	return var532
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
	local var533 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var534, var535 = protoModule.writeTag(buff, var533, 1, protoModule.wireTypes.lengthDelimited)
		var534, var1073 = protoModule.writeString(var534, var535, self.universe_id)
		buff = var534
		var533 = var535
	end
	if self.user_owns_experience then
		local var536, var537 = protoModule.writeTag(buff, var533, 2, protoModule.wireTypes.varint)
		var536, var1075 = protoModule.writeVarInt(var536, var537, if self.user_owns_experience then 1 else 0)
		buff = var536
		var533 = var537
	end
	local buff_1 = buffer.create(var533)
	buffer.copy(buff_1, 0, buff, 0, var533)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var533 = t_18.new()
	local var534 = 0
	while var534 < buffer.len(p18) do
		local _ = nil
		local var535 = nil
		local var536, var537, var538 = protoModule.readTag(p18, var534)
		local var539 = var536
		var535 = var537
		var534 = var538
		
		if var535 == protoModule.wireTypes.varint then
			if var539 == 2 then
				local _ = nil
				local var540, var541 = protoModule.readVarInt(p18, var534)
				var534 = var541
				var533.user_owns_experience = var540 ~= 0
			else
				local _ = nil
				local var542, var543 = protoModule.readVarInt(p18, var534)
				local _ = var542
				var534 = var543
			end
		end
		if var535 == protoModule.wireTypes.lengthDelimited then
			if var539 == 1 then
				local _ = nil
				local var544, var545 = protoModule.readBuffer(p18, var534)
				var534 = var545
				var533.universe_id = buffer.tostring(var544)
			else
				local _ = nil
				local var546, var547 = protoModule.readVarInt(p18, var534)
				var534 = var547 + var546
			end
		elseif var535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var548, var549 = protoModule.readFixed32(p18, var534)
			local _ = var548
			var534 = var549
		elseif var535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var550, var551 = protoModule.readFixed64(p18, var534)
			local _ = var550
			var534 = var551
		else
			error("Unsupported wire type: " .. var535)
		end
	end
	return var533
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
	local var552 = t_18.new()
	
	if self.universe_id ~= nil then
		var552.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var552.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var552.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var552.user_owns_experience = self.userOwnsExperience
	end
	return var552
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
	local var552 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var553, var554 = protoModule.writeTag(buff, var552, 1, protoModule.wireTypes.lengthDelimited)
		var553, var1101 = protoModule.writeString(var553, var554, self.media_asset_id)
		buff = var553
		var552 = var554
	end
	local buff_1 = buffer.create(var552)
	buffer.copy(buff_1, 0, buff, 0, var552)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var552 = t_19.new()
	local var553 = 0
	while var553 < buffer.len(p19) do
		local _ = nil
		local var554 = nil
		local var555, var556, var557 = protoModule.readTag(p19, var553)
		local var558 = var555
		var554 = var556
		var553 = var557
		
		if var554 == protoModule.wireTypes.varint then
			local _ = nil
			local var559, var560 = protoModule.readVarInt(p19, var553)
			local _ = var559
			var553 = var560
			continue
		end
		if var554 == protoModule.wireTypes.lengthDelimited then
			if var558 == 1 then
				local _ = nil
				local var561, var562 = protoModule.readBuffer(p19, var553)
				var553 = var562
				var552.media_asset_id = buffer.tostring(var561)
			else
				local _ = nil
				local var563, var564 = protoModule.readVarInt(p19, var553)
				var553 = var564 + var563
			end
		elseif var554 == protoModule.wireTypes.i32 then
			local _ = nil
			local var565, var566 = protoModule.readFixed32(p19, var553)
			local _ = var565
			var553 = var566
		elseif var554 == protoModule.wireTypes.i64 then
			local _ = nil
			local var567, var568 = protoModule.readFixed64(p19, var553)
			local _ = var567
			var553 = var568
		else
			error("Unsupported wire type: " .. var554)
		end
	end
	return var552
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
	local var569 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var569.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var569.media_asset_id = self.mediaAssetId
	end
	return var569
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
	local var569 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var570, var571 = protoModule.writeTag(buff, var569, 1, protoModule.wireTypes.lengthDelimited)
		var570, var1125 = protoModule.writeString(var570, var571, self.universe_id)
		buff = var570
		var569 = var571
	end
	local buff_1 = buffer.create(var569)
	buffer.copy(buff_1, 0, buff, 0, var569)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var569 = t_20.new()
	local var570 = 0
	while var570 < buffer.len(p20) do
		local _ = nil
		local var571 = nil
		local var572, var573, var574 = protoModule.readTag(p20, var570)
		local var575 = var572
		var571 = var573
		var570 = var574
		
		if var571 == protoModule.wireTypes.varint then
			local _ = nil
			local var576, var577 = protoModule.readVarInt(p20, var570)
			local _ = var576
			var570 = var577
			continue
		end
		if var571 == protoModule.wireTypes.lengthDelimited then
			if var575 == 1 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p20, var570)
				var570 = var579
				var569.universe_id = buffer.tostring(var578)
			else
				local _ = nil
				local var580, var581 = protoModule.readVarInt(p20, var570)
				var570 = var581 + var580
			end
		elseif var571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var582, var583 = protoModule.readFixed32(p20, var570)
			local _ = var582
			var570 = var583
		elseif var571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var584, var585 = protoModule.readFixed64(p20, var570)
			local _ = var584
			var570 = var585
		else
			error("Unsupported wire type: " .. var571)
		end
	end
	return var569
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
	local var586 = t_20.new()
	
	if self.universe_id ~= nil then
		var586.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var586.universe_id = self.universeId
	end
	return var586
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
	local var586 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var587, var588 = protoModule.writeTag(buff, var586, 1, protoModule.wireTypes.lengthDelimited)
		var587, var1149 = protoModule.writeString(var587, var588, self.universe_id)
		buff = var587
		var586 = var588
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var589, var590 = protoModule.writeTag(buff, var586, 2, protoModule.wireTypes.lengthDelimited)
		var589, var1151 = protoModule.writeString(var589, var590, self.creator_key)
		buff = var589
		var586 = var590
	end
	local buff_1 = buffer.create(var586)
	buffer.copy(buff_1, 0, buff, 0, var586)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var586 = t_21.new()
	local var587 = 0
	while var587 < buffer.len(p21) do
		local _ = nil
		local var588 = nil
		local var589, var590, var591 = protoModule.readTag(p21, var587)
		local var592 = var589
		var588 = var590
		var587 = var591
		
		if var588 == protoModule.wireTypes.varint then
			local _ = nil
			local var593, var594 = protoModule.readVarInt(p21, var587)
			local _ = var593
			var587 = var594
			continue
		end
		if var588 == protoModule.wireTypes.lengthDelimited then
			if var592 == 1 then
				local _ = nil
				local var595, var596 = protoModule.readBuffer(p21, var587)
				var587 = var596
				var586.universe_id = buffer.tostring(var595)
			elseif var592 == 2 then
				local _ = nil
				local var597, var598 = protoModule.readBuffer(p21, var587)
				var587 = var598
				var586.creator_key = buffer.tostring(var597)
			else
				local _ = nil
				local var599, var600 = protoModule.readVarInt(p21, var587)
				var587 = var600 + var599
			end
		elseif var588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var601, var602 = protoModule.readFixed32(p21, var587)
			local _ = var601
			var587 = var602
		elseif var588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var603, var604 = protoModule.readFixed64(p21, var587)
			local _ = var603
			var587 = var604
		else
			error("Unsupported wire type: " .. var588)
		end
	end
	return var586
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
	local var605 = t_21.new()
	
	if self.universe_id ~= nil then
		var605.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var605.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var605.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var605.creator_key = self.creatorKey
	end
	return var605
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
	local var605 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var606, var607 = protoModule.writeTag(buff, var605, 1, protoModule.wireTypes.lengthDelimited)
		var606, var1177 = protoModule.writeString(var606, var607, self.universe_id)
		buff = var606
		var605 = var607
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var608, var609 = protoModule.writeTag(buff, var605, 2, protoModule.wireTypes.lengthDelimited)
		var608, var1179 = protoModule.writeString(var608, var609, self.root_place_id)
		buff = var608
		var605 = var609
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var610, var611 = protoModule.writeTag(buff, var605, 3, protoModule.wireTypes.lengthDelimited)
		var610, var1181 = protoModule.writeString(var610, var611, self.connection_played_display_name)
		buff = var610
		var605 = var611
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var605, 4, protoModule.wireTypes.lengthDelimited)
		var612, var1183 = protoModule.writeString(var612, var613, self.upsell_prompt)
		buff = var612
		var605 = var613
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var614 = v:encode()
			local var615, var616 = protoModule.writeTag(buff, var605, 5, protoModule.wireTypes.lengthDelimited)
			var615, var1186 = protoModule.writeBuffer(var615, var616, var614, buffer.len(var614))
			buff = var615
			var605 = var616
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var617, var618 = protoModule.writeTag(buff, var605, 6, protoModule.wireTypes.varint)
		var617, var1188 = protoModule.writeVarInt(var617, var618, self.connection_played_num_others)
		buff = var617
		var605 = var618
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var619, var620 = protoModule.writeTag(buff, var605, 7, protoModule.wireTypes.varint)
		var619, var1190 = protoModule.writeVarInt(var619, var620, self.connection_played_total_count)
		buff = var619
		var605 = var620
	end
	local buff_1 = buffer.create(var605)
	buffer.copy(buff_1, 0, buff, 0, var605)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var621 = t_22.new()
	local var622 = 0
	while var622 < buffer.len(p22) do
		local _ = nil
		local var623 = nil
		local var624, var625, var626 = protoModule.readTag(p22, var622)
		local var627 = var624
		var623 = var625
		var622 = var626
		
		if var623 == protoModule.wireTypes.varint then
			if var627 == 6 then
				local _ = nil
				local var628, var629 = protoModule.readVarIntI32(p22, var622)
				var622 = var629
				var621.connection_played_num_others = var628
			elseif var627 == 7 then
				local _ = nil
				local var630, var631 = protoModule.readVarIntI32(p22, var622)
				var622 = var631
				var621.connection_played_total_count = var630
			else
				local _ = nil
				local var632, var633 = protoModule.readVarInt(p22, var622)
				local _ = var632
				var622 = var633
			end
		end
		if var623 == protoModule.wireTypes.lengthDelimited then
			if var627 == 1 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p22, var622)
				var622 = var635
				var621.universe_id = buffer.tostring(var634)
			elseif var627 == 2 then
				local _ = nil
				local var636, var637 = protoModule.readBuffer(p22, var622)
				var622 = var637
				var621.root_place_id = buffer.tostring(var636)
			elseif var627 == 3 then
				local _ = nil
				local var638, var639 = protoModule.readBuffer(p22, var622)
				var622 = var639
				var621.connection_played_display_name = buffer.tostring(var638)
			elseif var627 == 4 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p22, var622)
				var622 = var641
				var621.upsell_prompt = buffer.tostring(var640)
			elseif var627 == 5 then
				local _ = nil
				local var642, var643 = protoModule.readBuffer(p22, var622)
				var622 = var643
				table.insert(var621.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var642))
			else
				local _ = nil
				local var644, var645 = protoModule.readVarInt(p22, var622)
				var622 = var645 + var644
			end
		elseif var623 == protoModule.wireTypes.i32 then
			local _ = nil
			local var646, var647 = protoModule.readFixed32(p22, var622)
			local _ = var646
			var622 = var647
		elseif var623 == protoModule.wireTypes.i64 then
			local _ = nil
			local var648, var649 = protoModule.readFixed64(p22, var622)
			local _ = var648
			var622 = var649
		else
			error("Unsupported wire type: " .. var623)
		end
	end
	return var621
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
	local var650 = t_22.new()
	
	if self.universe_id ~= nil then
		var650.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var650.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var650.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var650.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var650.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var650.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var650.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var650.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var650.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var650.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var650.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var650.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var650.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var650.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var650
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
	local var651 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var652, var653 = protoModule.writeTag(buff, var651, 1, protoModule.wireTypes.lengthDelimited)
		var652, var1229 = protoModule.writeString(var652, var653, self.user_id)
		buff = var652
		var651 = var653
	end
	local buff_1 = buffer.create(var651)
	buffer.copy(buff_1, 0, buff, 0, var651)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var651 = t_23.new()
	local var652 = 0
	while var652 < buffer.len(p23) do
		local _ = nil
		local var653 = nil
		local var654, var655, var656 = protoModule.readTag(p23, var652)
		local var657 = var654
		var653 = var655
		var652 = var656
		
		if var653 == protoModule.wireTypes.varint then
			local _ = nil
			local var658, var659 = protoModule.readVarInt(p23, var652)
			local _ = var658
			var652 = var659
			continue
		end
		if var653 == protoModule.wireTypes.lengthDelimited then
			if var657 == 1 then
				local _ = nil
				local var660, var661 = protoModule.readBuffer(p23, var652)
				var652 = var661
				var651.user_id = buffer.tostring(var660)
			else
				local _ = nil
				local var662, var663 = protoModule.readVarInt(p23, var652)
				var652 = var663 + var662
			end
		elseif var653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var664, var665 = protoModule.readFixed32(p23, var652)
			local _ = var664
			var652 = var665
		elseif var653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var666, var667 = protoModule.readFixed64(p23, var652)
			local _ = var666
			var652 = var667
		else
			error("Unsupported wire type: " .. var653)
		end
	end
	return var651
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
	local var668 = t_23.new()
	
	if self.user_id ~= nil then
		var668.user_id = self.user_id
	end
	if self.userId ~= nil then
		var668.user_id = self.userId
	end
	return var668
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
	local var668 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var669 = v:encode()
			local var670, var671 = protoModule.writeTag(buff, var668, 1, protoModule.wireTypes.lengthDelimited)
			var670, var1254 = protoModule.writeBuffer(var670, var671, var669, buffer.len(var669))
			buff = var670
			var668 = var671
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var672, var673 = protoModule.writeTag(buff, var668, 2, protoModule.wireTypes.lengthDelimited)
		var672, var1256 = protoModule.writeString(var672, var673, self.universe_id)
		buff = var672
		var668 = var673
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var674, var675 = protoModule.writeTag(buff, var668, 3, protoModule.wireTypes.lengthDelimited)
		var674, var1258 = protoModule.writeString(var674, var675, self.place_id)
		buff = var674
		var668 = var675
	end
	local buff_1 = buffer.create(var668)
	buffer.copy(buff_1, 0, buff, 0, var668)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var676 = t_24.new()
	local var677 = 0
	while var677 < buffer.len(p24) do
		local _ = nil
		local var678 = nil
		local var679, var680, var681 = protoModule.readTag(p24, var677)
		local var682 = var679
		var678 = var680
		var677 = var681
		
		if var678 == protoModule.wireTypes.varint then
			local _ = nil
			local var683, var684 = protoModule.readVarInt(p24, var677)
			local _ = var683
			var677 = var684
			continue
		end
		if var678 == protoModule.wireTypes.lengthDelimited then
			if var682 == 1 then
				local _ = nil
				local var685, var686 = protoModule.readBuffer(p24, var677)
				var677 = var686
				table.insert(var676.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var685))
			elseif var682 == 2 then
				local _ = nil
				local var687, var688 = protoModule.readBuffer(p24, var677)
				var677 = var688
				var676.universe_id = buffer.tostring(var687)
			elseif var682 == 3 then
				local _ = nil
				local var689, var690 = protoModule.readBuffer(p24, var677)
				var677 = var690
				var676.place_id = buffer.tostring(var689)
			else
				local _ = nil
				local var691, var692 = protoModule.readVarInt(p24, var677)
				var677 = var692 + var691
			end
		elseif var678 == protoModule.wireTypes.i32 then
			local _ = nil
			local var693, var694 = protoModule.readFixed32(p24, var677)
			local _ = var693
			var677 = var694
		elseif var678 == protoModule.wireTypes.i64 then
			local _ = nil
			local var695, var696 = protoModule.readFixed64(p24, var677)
			local _ = var695
			var677 = var696
		else
			error("Unsupported wire type: " .. var678)
		end
	end
	return var676
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
	local var697 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var697.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var697.media_items = t_1
	end
	if self.universe_id ~= nil then
		var697.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var697.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var697.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var697.place_id = self.placeId
	end
	return var697
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
		media_asset_id = if p25 == nil or p25.media_asset_id == nil then "" else p25.media_asset_id
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var698 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var699, var700 = protoModule.writeTag(buff, var698, 1, protoModule.wireTypes.lengthDelimited)
		var699, var1289 = protoModule.writeString(var699, var700, self.media_asset_id)
		buff = var699
		var698 = var700
	end
	local buff_1 = buffer.create(var698)
	buffer.copy(buff_1, 0, buff, 0, var698)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var698 = t_25.new()
	local var699 = 0
	while var699 < buffer.len(p25) do
		local _ = nil
		local var700 = nil
		local var701, var702, var703 = protoModule.readTag(p25, var699)
		local var704 = var701
		var700 = var702
		var699 = var703
		
		if var700 == protoModule.wireTypes.varint then
			local _ = nil
			local var705, var706 = protoModule.readVarInt(p25, var699)
			local _ = var705
			var699 = var706
			continue
		end
		if var700 == protoModule.wireTypes.lengthDelimited then
			if var704 == 1 then
				local _ = nil
				local var707, var708 = protoModule.readBuffer(p25, var699)
				var699 = var708
				var698.media_asset_id = buffer.tostring(var707)
			else
				local _ = nil
				local var709, var710 = protoModule.readVarInt(p25, var699)
				var699 = var710 + var709
			end
		elseif var700 == protoModule.wireTypes.i32 then
			local _ = nil
			local var711, var712 = protoModule.readFixed32(p25, var699)
			local _ = var711
			var699 = var712
		elseif var700 == protoModule.wireTypes.i64 then
			local _ = nil
			local var713, var714 = protoModule.readFixed64(p25, var699)
			local _ = var713
			var699 = var714
		else
			error("Unsupported wire type: " .. var700)
		end
	end
	return var698
end

function t_25:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref)
	local var715 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var715.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var715.media_asset_id = self.mediaAssetId
	end
	return var715
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
		universe_id = if p26 == nil or p26.universe_id == nil then "" else p26.universe_id
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var715 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var716, var717 = protoModule.writeTag(buff, var715, 1, protoModule.wireTypes.lengthDelimited)
		var716, var1313 = protoModule.writeString(var716, var717, self.universe_id)
		buff = var716
		var715 = var717
	end
	local buff_1 = buffer.create(var715)
	buffer.copy(buff_1, 0, buff, 0, var715)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var715 = t_26.new()
	local var716 = 0
	while var716 < buffer.len(p26) do
		local _ = nil
		local var717 = nil
		local var718, var719, var720 = protoModule.readTag(p26, var716)
		local var721 = var718
		var717 = var719
		var716 = var720
		
		if var717 == protoModule.wireTypes.varint then
			local _ = nil
			local var722, var723 = protoModule.readVarInt(p26, var716)
			local _ = var722
			var716 = var723
			continue
		end
		if var717 == protoModule.wireTypes.lengthDelimited then
			if var721 == 1 then
				local _ = nil
				local var724, var725 = protoModule.readBuffer(p26, var716)
				var716 = var725
				var715.universe_id = buffer.tostring(var724)
			else
				local _ = nil
				local var726, var727 = protoModule.readVarInt(p26, var716)
				var716 = var727 + var726
			end
		elseif var717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var728, var729 = protoModule.readFixed32(p26, var716)
			local _ = var728
			var716 = var729
		elseif var717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var730, var731 = protoModule.readFixed64(p26, var716)
			local _ = var730
			var716 = var731
		else
			error("Unsupported wire type: " .. var717)
		end
	end
	return var715
end

function t_26:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref)
	local var732 = t_26.new()
	
	if self.universe_id ~= nil then
		var732.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var732.universe_id = self.universeId
	end
	return var732
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
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
	local var732 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var733, var734 = protoModule.writeTag(buff, var732, 1, protoModule.wireTypes.lengthDelimited)
		var733, var1337 = protoModule.writeString(var733, var734, self.universe_id)
		buff = var733
		var732 = var734
	end
	local buff_1 = buffer.create(var732)
	buffer.copy(buff_1, 0, buff, 0, var732)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var732 = t_27.new()
	local var733 = 0
	while var733 < buffer.len(p27) do
		local _ = nil
		local var734 = nil
		local var735, var736, var737 = protoModule.readTag(p27, var733)
		local var738 = var735
		var734 = var736
		var733 = var737
		
		if var734 == protoModule.wireTypes.varint then
			local _ = nil
			local var739, var740 = protoModule.readVarInt(p27, var733)
			local _ = var739
			var733 = var740
			continue
		end
		if var734 == protoModule.wireTypes.lengthDelimited then
			if var738 == 1 then
				local _ = nil
				local var741, var742 = protoModule.readBuffer(p27, var733)
				var733 = var742
				var732.universe_id = buffer.tostring(var741)
			else
				local _ = nil
				local var743, var744 = protoModule.readVarInt(p27, var733)
				var733 = var744 + var743
			end
		elseif var734 == protoModule.wireTypes.i32 then
			local _ = nil
			local var745, var746 = protoModule.readFixed32(p27, var733)
			local _ = var745
			var733 = var746
		elseif var734 == protoModule.wireTypes.i64 then
			local _ = nil
			local var747, var748 = protoModule.readFixed64(p27, var733)
			local _ = var747
			var733 = var748
		else
			error("Unsupported wire type: " .. var734)
		end
	end
	return var732
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
	local var749 = t_27.new()
	
	if self.universe_id ~= nil then
		var749.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var749.universe_id = self.universeId
	end
	return var749
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p28 == nil or p28.universe_id == nil then "" else p28.universe_id,
		has_store_items = if p28 == nil or p28.has_store_items == nil then false else p28.has_store_items,
		has_badges = if p28 == nil or p28.has_badges == nil then false else p28.has_badges,
		has_game_passes = if p28 == nil or p28.has_game_passes == nil then false else p28.has_game_passes,
		community_id = if p28 == nil or p28.community_id == nil then "" else p28.community_id
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var749 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var750, var751 = protoModule.writeTag(buff, var749, 1, protoModule.wireTypes.lengthDelimited)
		var750, var1361 = protoModule.writeString(var750, var751, self.universe_id)
		buff = var750
		var749 = var751
	end
	if self.has_store_items then
		local var752, var753 = protoModule.writeTag(buff, var749, 2, protoModule.wireTypes.varint)
		var752, var1363 = protoModule.writeVarInt(var752, var753, if self.has_store_items then 1 else 0)
		buff = var752
		var749 = var753
	end
	if self.has_badges then
		local var754, var755 = protoModule.writeTag(buff, var749, 3, protoModule.wireTypes.varint)
		var754, var1365 = protoModule.writeVarInt(var754, var755, if self.has_badges then 1 else 0)
		buff = var754
		var749 = var755
	end
	if self.has_game_passes then
		local var756, var757 = protoModule.writeTag(buff, var749, 4, protoModule.wireTypes.varint)
		var756, var1367 = protoModule.writeVarInt(var756, var757, if self.has_game_passes then 1 else 0)
		buff = var756
		var749 = var757
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var758, var759 = protoModule.writeTag(buff, var749, 5, protoModule.wireTypes.lengthDelimited)
		var758, var1369 = protoModule.writeString(var758, var759, self.community_id)
		buff = var758
		var749 = var759
	end
	local buff_1 = buffer.create(var749)
	buffer.copy(buff_1, 0, buff, 0, var749)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var749 = t_28.new()
	local var750 = 0
	while var750 < buffer.len(p28) do
		local _ = nil
		local var751 = nil
		local var752, var753, var754 = protoModule.readTag(p28, var750)
		local var755 = var752
		var751 = var753
		var750 = var754
		
		if var751 == protoModule.wireTypes.varint then
			if var755 == 2 then
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p28, var750)
				var750 = var757
				var749.has_store_items = var756 ~= 0
			elseif var755 == 3 then
				local _ = nil
				local var758, var759 = protoModule.readVarInt(p28, var750)
				var750 = var759
				var749.has_badges = var758 ~= 0
			elseif var755 == 4 then
				local _ = nil
				local var760, var761 = protoModule.readVarInt(p28, var750)
				var750 = var761
				var749.has_game_passes = var760 ~= 0
			else
				local _ = nil
				local var762, var763 = protoModule.readVarInt(p28, var750)
				local _ = var762
				var750 = var763
			end
		end
		if var751 == protoModule.wireTypes.lengthDelimited then
			if var755 == 1 then
				local _ = nil
				local var764, var765 = protoModule.readBuffer(p28, var750)
				var750 = var765
				var749.universe_id = buffer.tostring(var764)
			elseif var755 == 5 then
				local _ = nil
				local var766, var767 = protoModule.readBuffer(p28, var750)
				var750 = var767
				var749.community_id = buffer.tostring(var766)
			else
				local _ = nil
				local var768, var769 = protoModule.readVarInt(p28, var750)
				var750 = var769 + var768
			end
		elseif var751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var770, var771 = protoModule.readFixed32(p28, var750)
			local _ = var770
			var750 = var771
		elseif var751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var772, var773 = protoModule.readFixed64(p28, var750)
			local _ = var772
			var750 = var773
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var749
end

function t_28:jsonEncode()
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

function t_28:jsonDecode()
	-- upvalues: t_28 (ref)
	local var774 = t_28.new()
	
	if self.universe_id ~= nil then
		var774.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var774.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var774.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var774.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var774.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var774.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var774.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var774.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var774.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var774.community_id = self.communityId
	end
	return var774
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p29 == nil or p29.universe_id == nil then "" else p29.universe_id
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var774 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var775, var776 = protoModule.writeTag(buff, var774, 1, protoModule.wireTypes.lengthDelimited)
		var775, var1401 = protoModule.writeString(var775, var776, self.universe_id)
		buff = var775
		var774 = var776
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
			local _ = nil
			local var781, var782 = protoModule.readVarInt(p29, var775)
			local _ = var781
			var775 = var782
			continue
		end
		if var776 == protoModule.wireTypes.lengthDelimited then
			if var780 == 1 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p29, var775)
				var775 = var784
				var774.universe_id = buffer.tostring(var783)
			else
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p29, var775)
				var775 = var786 + var785
			end
		elseif var776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var787, var788 = protoModule.readFixed32(p29, var775)
			local _ = var787
			var775 = var788
		elseif var776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var789, var790 = protoModule.readFixed64(p29, var775)
			local _ = var789
			var775 = var790
		else
			error("Unsupported wire type: " .. var776)
		end
	end
	return var774
end

function t_29:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref)
	local var791 = t_29.new()
	
	if self.universe_id ~= nil then
		var791.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var791.universe_id = self.universeId
	end
	return var791
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p30 == nil or p30.universe_id == nil then "" else p30.universe_id,
		user_owns_experience = if p30 == nil or p30.user_owns_experience == nil then false else p30.user_owns_experience
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var791 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var792, var793 = protoModule.writeTag(buff, var791, 1, protoModule.wireTypes.lengthDelimited)
		var792, var1425 = protoModule.writeString(var792, var793, self.universe_id)
		buff = var792
		var791 = var793
	end
	if self.user_owns_experience then
		local var794, var795 = protoModule.writeTag(buff, var791, 2, protoModule.wireTypes.varint)
		var794, var1427 = protoModule.writeVarInt(var794, var795, if self.user_owns_experience then 1 else 0)
		buff = var794
		var791 = var795
	end
	local buff_1 = buffer.create(var791)
	buffer.copy(buff_1, 0, buff, 0, var791)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var791 = t_30.new()
	local var792 = 0
	while var792 < buffer.len(p30) do
		local _ = nil
		local var793 = nil
		local var794, var795, var796 = protoModule.readTag(p30, var792)
		local var797 = var794
		var793 = var795
		var792 = var796
		
		if var793 == protoModule.wireTypes.varint then
			if var797 == 2 then
				local _ = nil
				local var798, var799 = protoModule.readVarInt(p30, var792)
				var792 = var799
				var791.user_owns_experience = var798 ~= 0
			else
				local _ = nil
				local var800, var801 = protoModule.readVarInt(p30, var792)
				local _ = var800
				var792 = var801
			end
		end
		if var793 == protoModule.wireTypes.lengthDelimited then
			if var797 == 1 then
				local _ = nil
				local var802, var803 = protoModule.readBuffer(p30, var792)
				var792 = var803
				var791.universe_id = buffer.tostring(var802)
			else
				local _ = nil
				local var804, var805 = protoModule.readVarInt(p30, var792)
				var792 = var805 + var804
			end
		elseif var793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var806, var807 = protoModule.readFixed32(p30, var792)
			local _ = var806
			var792 = var807
		elseif var793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var808, var809 = protoModule.readFixed64(p30, var792)
			local _ = var808
			var792 = var809
		else
			error("Unsupported wire type: " .. var793)
		end
	end
	return var791
end

function t_30:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode()
	-- upvalues: t_30 (ref)
	local var810 = t_30.new()
	
	if self.universe_id ~= nil then
		var810.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var810.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var810.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var810.user_owns_experience = self.userOwnsExperience
	end
	return var810
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p31 == nil or p31.universe_id == nil then "" else p31.universe_id,
		place_id = if p31 == nil or p31.place_id == nil then "" else p31.place_id,
		product_id = if p31 == nil or p31.product_id == nil then "" else p31.product_id,
		product_image_asset_id = if p31 == nil or p31.product_image_asset_id == nil then "" else p31.product_image_asset_id,
		product_name = if p31 == nil or p31.product_name == nil then "" else p31.product_name,
		variant_id = if p31 == nil or p31.variant_id == nil then "" else p31.variant_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var810 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var811, var812 = protoModule.writeTag(buff, var810, 1, protoModule.wireTypes.lengthDelimited)
		var811, var1453 = protoModule.writeString(var811, var812, self.universe_id)
		buff = var811
		var810 = var812
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var813, var814 = protoModule.writeTag(buff, var810, 2, protoModule.wireTypes.lengthDelimited)
		var813, var1455 = protoModule.writeString(var813, var814, self.place_id)
		buff = var813
		var810 = var814
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		local var815, var816 = protoModule.writeTag(buff, var810, 3, protoModule.wireTypes.lengthDelimited)
		var815, var1457 = protoModule.writeString(var815, var816, self.product_id)
		buff = var815
		var810 = var816
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		local var817, var818 = protoModule.writeTag(buff, var810, 4, protoModule.wireTypes.lengthDelimited)
		var817, var1459 = protoModule.writeString(var817, var818, self.product_image_asset_id)
		buff = var817
		var810 = var818
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		local var819, var820 = protoModule.writeTag(buff, var810, 5, protoModule.wireTypes.lengthDelimited)
		var819, var1461 = protoModule.writeString(var819, var820, self.product_name)
		buff = var819
		var810 = var820
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		local var821, var822 = protoModule.writeTag(buff, var810, 6, protoModule.wireTypes.lengthDelimited)
		var821, var1463 = protoModule.writeString(var821, var822, self.variant_id)
		buff = var821
		var810 = var822
	end
	local buff_1 = buffer.create(var810)
	buffer.copy(buff_1, 0, buff, 0, var810)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var810 = t_31.new()
	local var811 = 0
	while var811 < buffer.len(p31) do
		local _ = nil
		local var812 = nil
		local var813, var814, var815 = protoModule.readTag(p31, var811)
		local var816 = var813
		var812 = var814
		var811 = var815
		
		if var812 == protoModule.wireTypes.varint then
			local _ = nil
			local var817, var818 = protoModule.readVarInt(p31, var811)
			local _ = var817
			var811 = var818
			continue
		end
		if var812 == protoModule.wireTypes.lengthDelimited then
			if var816 == 1 then
				local _ = nil
				local var819, var820 = protoModule.readBuffer(p31, var811)
				var811 = var820
				var810.universe_id = buffer.tostring(var819)
			elseif var816 == 2 then
				local _ = nil
				local var821, var822 = protoModule.readBuffer(p31, var811)
				var811 = var822
				var810.place_id = buffer.tostring(var821)
			elseif var816 == 3 then
				local _ = nil
				local var823, var824 = protoModule.readBuffer(p31, var811)
				var811 = var824
				var810.product_id = buffer.tostring(var823)
			elseif var816 == 4 then
				local _ = nil
				local var825, var826 = protoModule.readBuffer(p31, var811)
				var811 = var826
				var810.product_image_asset_id = buffer.tostring(var825)
			elseif var816 == 5 then
				local _ = nil
				local var827, var828 = protoModule.readBuffer(p31, var811)
				var811 = var828
				var810.product_name = buffer.tostring(var827)
			elseif var816 == 6 then
				local _ = nil
				local var829, var830 = protoModule.readBuffer(p31, var811)
				var811 = var830
				var810.variant_id = buffer.tostring(var829)
			else
				local _ = nil
				local var831, var832 = protoModule.readVarInt(p31, var811)
				var811 = var832 + var831
			end
		elseif var812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var833, var834 = protoModule.readFixed32(p31, var811)
			local _ = var833
			var811 = var834
		elseif var812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var835, var836 = protoModule.readFixed64(p31, var811)
			local _ = var835
			var811 = var836
		else
			error("Unsupported wire type: " .. var812)
		end
	end
	return var810
end

function t_31:jsonEncode()
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

function t_31:jsonDecode()
	-- upvalues: t_31 (ref)
	local var837 = t_31.new()
	
	if self.universe_id ~= nil then
		var837.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var837.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var837.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var837.place_id = self.placeId
	end
	if self.product_id ~= nil then
		var837.product_id = self.product_id
	end
	if self.productId ~= nil then
		var837.product_id = self.productId
	end
	if self.product_image_asset_id ~= nil then
		var837.product_image_asset_id = self.product_image_asset_id
	end
	if self.productImageAssetId ~= nil then
		var837.product_image_asset_id = self.productImageAssetId
	end
	if self.product_name ~= nil then
		var837.product_name = self.product_name
	end
	if self.productName ~= nil then
		var837.product_name = self.productName
	end
	if self.variant_id ~= nil then
		var837.variant_id = self.variant_id
	end
	if self.variantId ~= nil then
		var837.variant_id = self.variantId
	end
	return var837
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p32 == nil or p32.community_id == nil then "" else p32.community_id
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var837 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var838, var839 = protoModule.writeTag(buff, var837, 1, protoModule.wireTypes.lengthDelimited)
		var838, var1497 = protoModule.writeString(var838, var839, self.community_id)
		buff = var838
		var837 = var839
	end
	local buff_1 = buffer.create(var837)
	buffer.copy(buff_1, 0, buff, 0, var837)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var837 = t_32.new()
	local var838 = 0
	while var838 < buffer.len(p32) do
		local _ = nil
		local var839 = nil
		local var840, var841, var842 = protoModule.readTag(p32, var838)
		local var843 = var840
		var839 = var841
		var838 = var842
		
		if var839 == protoModule.wireTypes.varint then
			local _ = nil
			local var844, var845 = protoModule.readVarInt(p32, var838)
			local _ = var844
			var838 = var845
			continue
		end
		if var839 == protoModule.wireTypes.lengthDelimited then
			if var843 == 1 then
				local _ = nil
				local var846, var847 = protoModule.readBuffer(p32, var838)
				var838 = var847
				var837.community_id = buffer.tostring(var846)
			else
				local _ = nil
				local var848, var849 = protoModule.readVarInt(p32, var838)
				var838 = var849 + var848
			end
		elseif var839 == protoModule.wireTypes.i32 then
			local _ = nil
			local var850, var851 = protoModule.readFixed32(p32, var838)
			local _ = var850
			var838 = var851
		elseif var839 == protoModule.wireTypes.i64 then
			local _ = nil
			local var852, var853 = protoModule.readFixed64(p32, var838)
			local _ = var852
			var838 = var853
		else
			error("Unsupported wire type: " .. var839)
		end
	end
	return var837
end

function t_32:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref)
	local var854 = t_32.new()
	
	if self.community_id ~= nil then
		var854.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var854.community_id = self.communityId
	end
	return var854
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p33)
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p33 == nil or p33.social_link_items == nil then {} else p33.social_link_items
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var854 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var855 = v:encode()
			local var856, var857 = protoModule.writeTag(buff, var854, 1, protoModule.wireTypes.lengthDelimited)
			var856, var1522 = protoModule.writeBuffer(var856, var857, var855, buffer.len(var855))
			buff = var856
			var854 = var857
		end
	end
	local buff_1 = buffer.create(var854)
	buffer.copy(buff_1, 0, buff, 0, var854)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var858 = t_33.new()
	local var859 = 0
	while var859 < buffer.len(p33) do
		local _ = nil
		local var860 = nil
		local var861, var862, var863 = protoModule.readTag(p33, var859)
		local var864 = var861
		var860 = var862
		var859 = var863
		
		if var860 == protoModule.wireTypes.varint then
			local _ = nil
			local var865, var866 = protoModule.readVarInt(p33, var859)
			local _ = var865
			var859 = var866
			continue
		end
		if var860 == protoModule.wireTypes.lengthDelimited then
			if var864 == 1 then
				local _ = nil
				local var867, var868 = protoModule.readBuffer(p33, var859)
				var859 = var868
				table.insert(var858.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var867))
			else
				local _ = nil
				local var869, var870 = protoModule.readVarInt(p33, var859)
				var859 = var870 + var869
			end
		elseif var860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var871, var872 = protoModule.readFixed32(p33, var859)
			local _ = var871
			var859 = var872
		elseif var860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var873, var874 = protoModule.readFixed64(p33, var859)
			local _ = var873
			var859 = var874
		else
			error("Unsupported wire type: " .. var860)
		end
	end
	return var858
end

function t_33:jsonEncode()
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

function t_33:jsonDecode()
	-- upvalues: t_33 (ref), t (ref)
	local var875 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var875.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var875.social_link_items = t_1
	end
	return var875
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p34)
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p34 == nil or p34.social_link_id == nil then "" else p34.social_link_id
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var876 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var877, var878 = protoModule.writeTag(buff, var876, 1, protoModule.wireTypes.lengthDelimited)
		var877, var1549 = protoModule.writeString(var877, var878, self.social_link_id)
		buff = var877
		var876 = var878
	end
	local buff_1 = buffer.create(var876)
	buffer.copy(buff_1, 0, buff, 0, var876)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var876 = t_34.new()
	local var877 = 0
	while var877 < buffer.len(p34) do
		local _ = nil
		local var878 = nil
		local var879, var880, var881 = protoModule.readTag(p34, var877)
		local var882 = var879
		var878 = var880
		var877 = var881
		
		if var878 == protoModule.wireTypes.varint then
			local _ = nil
			local var883, var884 = protoModule.readVarInt(p34, var877)
			local _ = var883
			var877 = var884
			continue
		end
		if var878 == protoModule.wireTypes.lengthDelimited then
			if var882 == 1 then
				local _ = nil
				local var885, var886 = protoModule.readBuffer(p34, var877)
				var877 = var886
				var876.social_link_id = buffer.tostring(var885)
			else
				local _ = nil
				local var887, var888 = protoModule.readVarInt(p34, var877)
				var877 = var888 + var887
			end
		elseif var878 == protoModule.wireTypes.i32 then
			local _ = nil
			local var889, var890 = protoModule.readFixed32(p34, var877)
			local _ = var889
			var877 = var890
		elseif var878 == protoModule.wireTypes.i64 then
			local _ = nil
			local var891, var892 = protoModule.readFixed64(p34, var877)
			local _ = var891
			var877 = var892
		else
			error("Unsupported wire type: " .. var878)
		end
	end
	return var876
end

function t_34:jsonEncode()
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref)
	local var893 = t_34.new()
	
	if self.social_link_id ~= nil then
		var893.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var893.social_link_id = self.socialLinkId
	end
	return var893
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		title = if p35 == nil or p35.title == nil then "" else p35.title,
		universe_items = if p35 == nil or p35.universe_items == nil then {} else p35.universe_items,
		next_page_token = if p35 == nil or p35.next_page_token == nil then "" else p35.next_page_token,
		sort_id = if p35 == nil or p35.sort_id == nil then "" else p35.sort_id,
		secondary_sort_id = if p35 == nil or p35.secondary_sort_id == nil then 0 else p35.secondary_sort_id,
		max_visible_rows = if p35 == nil or p35.max_visible_rows == nil then 0 else p35.max_visible_rows,
		subtitle = if p35 == nil or p35.subtitle == nil then "" else p35.subtitle,
		info_text = if p35 == nil or p35.info_text == nil then "" else p35.info_text,
		subtitle_link_path = if p35 == nil or p35.subtitle_link_path == nil then "" else p35.subtitle_link_path,
		is_placeholder = if p35 == nil or p35.is_placeholder == nil then nil else p35.is_placeholder,
		primary_sort_id = if p35 == nil or p35.primary_sort_id == nil then nil else p35.primary_sort_id,
		applied_filters = if p35 == nil or p35.applied_filters == nil then nil else p35.applied_filters,
		pool_id = if p35 == nil or p35.pool_id == nil then nil else p35.pool_id,
		has_emphasized_tile = if p35 == nil or p35.has_emphasized_tile == nil then false else p35.has_emphasized_tile,
		tile_activation_mode = if p35 == nil or p35.tile_activation_mode == nil then "" else p35.tile_activation_mode,
		initial_feed_visible_rows = if p35 == nil or p35.initial_feed_visible_rows == nil then nil else p35.initial_feed_visible_rows,
		visible_rows_per_reveal = if p35 == nil or p35.visible_rows_per_reveal == nil then nil else p35.visible_rows_per_reveal,
		sponsored_user_cohort = if p35 == nil or p35.sponsored_user_cohort == nil then nil else p35.sponsored_user_cohort,
		anchor_tag = if p35 == nil or p35.anchor_tag == nil then nil else p35.anchor_tag,
		collection_item_size = if p35 == nil or p35.collection_item_size == nil then nil else p35.collection_item_size,
		sort_sub_id = if p35 == nil or p35.sort_sub_id == nil then nil else p35.sort_sub_id,
		enable_game_tile_videos = if p35 == nil or p35.enable_game_tile_videos == nil then false else p35.enable_game_tile_videos,
		continues_previous_section = if p35 == nil or p35.continues_previous_section == nil then nil else p35.continues_previous_section
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var893 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var894, var895 = protoModule.writeTag(buff, var893, 1, protoModule.wireTypes.lengthDelimited)
		var894, var1573 = protoModule.writeString(var894, var895, self.title)
		buff = var894
		var893 = var895
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var896 = v:encode()
			local var897, var898 = protoModule.writeTag(buff, var893, 2, protoModule.wireTypes.lengthDelimited)
			var897, var1576 = protoModule.writeBuffer(var897, var898, var896, buffer.len(var896))
			buff = var897
			var893 = var898
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var899, var900 = protoModule.writeTag(buff, var893, 3, protoModule.wireTypes.lengthDelimited)
		var899, var1578 = protoModule.writeString(var899, var900, self.next_page_token)
		buff = var899
		var893 = var900
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var901, var902 = protoModule.writeTag(buff, var893, 4, protoModule.wireTypes.lengthDelimited)
		var901, var1580 = protoModule.writeString(var901, var902, self.sort_id)
		buff = var901
		var893 = var902
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var903, var904 = protoModule.writeTag(buff, var893, 5, protoModule.wireTypes.varint)
		var903, var1582 = protoModule.writeVarInt(var903, var904, self.secondary_sort_id)
		buff = var903
		var893 = var904
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var905, var906 = protoModule.writeTag(buff, var893, 6, protoModule.wireTypes.varint)
		var905, var1584 = protoModule.writeVarInt(var905, var906, self.max_visible_rows)
		buff = var905
		var893 = var906
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var907, var908 = protoModule.writeTag(buff, var893, 7, protoModule.wireTypes.lengthDelimited)
		var907, var1586 = protoModule.writeString(var907, var908, self.subtitle)
		buff = var907
		var893 = var908
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var909, var910 = protoModule.writeTag(buff, var893, 8, protoModule.wireTypes.lengthDelimited)
		var909, var1588 = protoModule.writeString(var909, var910, self.info_text)
		buff = var909
		var893 = var910
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var911, var912 = protoModule.writeTag(buff, var893, 9, protoModule.wireTypes.lengthDelimited)
		var911, var1590 = protoModule.writeString(var911, var912, self.subtitle_link_path)
		buff = var911
		var893 = var912
	end
	if self.is_placeholder ~= nil then
		local var913, var914 = protoModule.writeTag(buff, var893, 10, protoModule.wireTypes.varint)
		var913, var1592 = protoModule.writeVarInt(var913, var914, if self.is_placeholder then 1 else 0)
		buff = var913
		var893 = var914
	end
	if self.primary_sort_id ~= nil then
		local var915, var916 = protoModule.writeTag(buff, var893, 11, protoModule.wireTypes.varint)
		var915, var1594 = protoModule.writeVarInt(var915, var916, self.primary_sort_id)
		buff = var915
		var893 = var916
	end
	if self.applied_filters ~= nil then
		local var917, var918 = protoModule.writeTag(buff, var893, 12, protoModule.wireTypes.lengthDelimited)
		var917, var1596 = protoModule.writeString(var917, var918, self.applied_filters)
		buff = var917
		var893 = var918
	end
	if self.pool_id ~= nil then
		local var919, var920 = protoModule.writeTag(buff, var893, 13, protoModule.wireTypes.lengthDelimited)
		var919, var1598 = protoModule.writeString(var919, var920, self.pool_id)
		buff = var919
		var893 = var920
	end
	if self.has_emphasized_tile then
		local var921, var922 = protoModule.writeTag(buff, var893, 14, protoModule.wireTypes.varint)
		var921, var1600 = protoModule.writeVarInt(var921, var922, if self.has_emphasized_tile then 1 else 0)
		buff = var921
		var893 = var922
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var923, var924 = protoModule.writeTag(buff, var893, 15, protoModule.wireTypes.lengthDelimited)
		var923, var1602 = protoModule.writeString(var923, var924, self.tile_activation_mode)
		buff = var923
		var893 = var924
	end
	if self.initial_feed_visible_rows ~= nil then
		local var925, var926 = protoModule.writeTag(buff, var893, 16, protoModule.wireTypes.varint)
		var925, var1604 = protoModule.writeVarInt(var925, var926, self.initial_feed_visible_rows)
		buff = var925
		var893 = var926
	end
	if self.visible_rows_per_reveal ~= nil then
		local var927, var928 = protoModule.writeTag(buff, var893, 17, protoModule.wireTypes.varint)
		var927, var1606 = protoModule.writeVarInt(var927, var928, self.visible_rows_per_reveal)
		buff = var927
		var893 = var928
	end
	if self.sponsored_user_cohort ~= nil then
		local var929, var930 = protoModule.writeTag(buff, var893, 18, protoModule.wireTypes.lengthDelimited)
		var929, var1608 = protoModule.writeString(var929, var930, self.sponsored_user_cohort)
		buff = var929
		var893 = var930
	end
	if self.anchor_tag ~= nil then
		local var931, var932 = protoModule.writeTag(buff, var893, 19, protoModule.wireTypes.lengthDelimited)
		var931, var1610 = protoModule.writeString(var931, var932, self.anchor_tag)
		buff = var931
		var893 = var932
	end
	if self.collection_item_size ~= nil then
		local var933, var934 = protoModule.writeTag(buff, var893, 20, protoModule.wireTypes.lengthDelimited)
		var933, var1612 = protoModule.writeString(var933, var934, self.collection_item_size)
		buff = var933
		var893 = var934
	end
	if self.sort_sub_id ~= nil then
		local var935, var936 = protoModule.writeTag(buff, var893, 21, protoModule.wireTypes.lengthDelimited)
		var935, var1614 = protoModule.writeString(var935, var936, self.sort_sub_id)
		buff = var935
		var893 = var936
	end
	if self.enable_game_tile_videos then
		local var937, var938 = protoModule.writeTag(buff, var893, 22, protoModule.wireTypes.varint)
		var937, var1616 = protoModule.writeVarInt(var937, var938, if self.enable_game_tile_videos then 1 else 0)
		buff = var937
		var893 = var938
	end
	if self.continues_previous_section ~= nil then
		local var939, var940 = protoModule.writeTag(buff, var893, 23, protoModule.wireTypes.varint)
		var939, var1618 = protoModule.writeVarInt(var939, var940, if self.continues_previous_section then 1 else 0)
		buff = var939
		var893 = var940
	end
	local buff_1 = buffer.create(var893)
	buffer.copy(buff_1, 0, buff, 0, var893)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var941 = t_35.new()
	local var942 = 0
	while var942 < buffer.len(p35) do
		local _ = nil
		local var943 = nil
		local var944, var945, var946 = protoModule.readTag(p35, var942)
		local var947 = var944
		var943 = var945
		var942 = var946
		
		if var943 == protoModule.wireTypes.varint then
			if var947 == 5 then
				local _ = nil
				local var948, var949 = protoModule.readVarIntI32(p35, var942)
				var942 = var949
				var941.secondary_sort_id = var948
			elseif var947 == 6 then
				local _ = nil
				local var950, var951 = protoModule.readVarIntI32(p35, var942)
				var942 = var951
				var941.max_visible_rows = var950
			elseif var947 == 10 then
				local _ = nil
				local var952, var953 = protoModule.readVarInt(p35, var942)
				var942 = var953
				var941.is_placeholder = var952 ~= 0
			elseif var947 == 11 then
				local _ = nil
				local var954, var955 = protoModule.readVarIntI32(p35, var942)
				var942 = var955
				var941.primary_sort_id = var954
			elseif var947 == 14 then
				local _ = nil
				local var956, var957 = protoModule.readVarInt(p35, var942)
				var942 = var957
				var941.has_emphasized_tile = var956 ~= 0
			elseif var947 == 16 then
				local _ = nil
				local var958, var959 = protoModule.readVarIntI32(p35, var942)
				var942 = var959
				var941.initial_feed_visible_rows = var958
			elseif var947 == 17 then
				local _ = nil
				local var960, var961 = protoModule.readVarIntI32(p35, var942)
				var942 = var961
				var941.visible_rows_per_reveal = var960
			elseif var947 == 22 then
				local _ = nil
				local var962, var963 = protoModule.readVarInt(p35, var942)
				var942 = var963
				var941.enable_game_tile_videos = var962 ~= 0
			elseif var947 == 23 then
				local _ = nil
				local var964, var965 = protoModule.readVarInt(p35, var942)
				var942 = var965
				var941.continues_previous_section = var964 ~= 0
			else
				local _ = nil
				local var966, var967 = protoModule.readVarInt(p35, var942)
				local _ = var966
				var942 = var967
			end
		end
		if var943 == protoModule.wireTypes.lengthDelimited then
			if var947 == 1 then
				local _ = nil
				local var968, var969 = protoModule.readBuffer(p35, var942)
				var942 = var969
				var941.title = buffer.tostring(var968)
			elseif var947 == 2 then
				local _ = nil
				local var970, var971 = protoModule.readBuffer(p35, var942)
				var942 = var971
				table.insert(var941.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var970))
			elseif var947 == 3 then
				local _ = nil
				local var972, var973 = protoModule.readBuffer(p35, var942)
				var942 = var973
				var941.next_page_token = buffer.tostring(var972)
			elseif var947 == 4 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p35, var942)
				var942 = var975
				var941.sort_id = buffer.tostring(var974)
			elseif var947 == 7 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p35, var942)
				var942 = var977
				var941.subtitle = buffer.tostring(var976)
			elseif var947 == 8 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p35, var942)
				var942 = var979
				var941.info_text = buffer.tostring(var978)
			elseif var947 == 9 then
				local _ = nil
				local var980, var981 = protoModule.readBuffer(p35, var942)
				var942 = var981
				var941.subtitle_link_path = buffer.tostring(var980)
			elseif var947 == 12 then
				local _ = nil
				local var982, var983 = protoModule.readBuffer(p35, var942)
				var942 = var983
				var941.applied_filters = buffer.tostring(var982)
			elseif var947 == 13 then
				local _ = nil
				local var984, var985 = protoModule.readBuffer(p35, var942)
				var942 = var985
				var941.pool_id = buffer.tostring(var984)
			elseif var947 == 15 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p35, var942)
				var942 = var987
				var941.tile_activation_mode = buffer.tostring(var986)
			elseif var947 == 18 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p35, var942)
				var942 = var989
				var941.sponsored_user_cohort = buffer.tostring(var988)
			elseif var947 == 19 then
				local _ = nil
				local var990, var991 = protoModule.readBuffer(p35, var942)
				var942 = var991
				var941.anchor_tag = buffer.tostring(var990)
			elseif var947 == 20 then
				local _ = nil
				local var992, var993 = protoModule.readBuffer(p35, var942)
				var942 = var993
				var941.collection_item_size = buffer.tostring(var992)
			elseif var947 == 21 then
				local _ = nil
				local var994, var995 = protoModule.readBuffer(p35, var942)
				var942 = var995
				var941.sort_sub_id = buffer.tostring(var994)
			else
				local _ = nil
				local var996, var997 = protoModule.readVarInt(p35, var942)
				var942 = var997 + var996
			end
		elseif var943 == protoModule.wireTypes.i32 then
			local _ = nil
			local var998, var999 = protoModule.readFixed32(p35, var942)
			local _ = var998
			var942 = var999
		elseif var943 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1000, var1001 = protoModule.readFixed64(p35, var942)
			local _ = var1000
			var942 = var1001
		else
			error("Unsupported wire type: " .. var943)
		end
	end
	return var941
end

function t_35:jsonEncode()
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

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var1002 = t_35.new()
	
	if self.title ~= nil then
		var1002.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1002.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1002.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1002.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1002.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1002.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1002.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1002.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1002.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1002.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1002.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1002.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1002.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1002.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1002.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1002.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1002.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1002.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1002.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1002.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1002.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1002.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1002.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1002.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1002.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1002.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1002.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1002.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var1002.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var1002.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var1002.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var1002.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var1002.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1002.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var1002.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1002.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var1002.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1002.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var1002.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var1002.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var1002.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var1002.enable_game_tile_videos = self.enableGameTileVideos
	end
	if self.continues_previous_section ~= nil then
		var1002.continues_previous_section = self.continues_previous_section
	end
	if self.continuesPreviousSection ~= nil then
		var1002.continues_previous_section = self.continuesPreviousSection
	end
	return var1002
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t_36 (ref)
	return setmetatable({
		universe_id = if p36 == nil or p36.universe_id == nil then "" else p36.universe_id,
		is_sponsored = if p36 == nil or p36.is_sponsored == nil then false else p36.is_sponsored,
		roblox_component = if p36 == nil or p36.roblox_component == nil then "" else p36.roblox_component,
		native_ad_data = if p36 == nil or p36.native_ad_data == nil then "" else p36.native_ad_data,
		is_content_locked = if p36 == nil or p36.is_content_locked == nil then false else p36.is_content_locked,
		title = if p36 == nil or p36.title == nil then "" else p36.title,
		subtitle = if p36 == nil or p36.subtitle == nil then "" else p36.subtitle,
		image_asset_id = if p36 == nil or p36.image_asset_id == nil then "" else p36.image_asset_id,
		video_asset_id = if p36 == nil or p36.video_asset_id == nil then "" else p36.video_asset_id,
		badge_text = if p36 == nil or p36.badge_text == nil then "" else p36.badge_text,
		player_count = if p36 == nil or p36.player_count == nil then nil else p36.player_count,
		creator_key = if p36 == nil or p36.creator_key == nil then "" else p36.creator_key,
		rank = if p36 == nil or p36.rank == nil then nil else p36.rank,
		payer_name = if p36 == nil or p36.payer_name == nil then nil else p36.payer_name,
		logo_asset_id = if p36 == nil or p36.logo_asset_id == nil then nil else p36.logo_asset_id,
		logo_aspect_ratio = if p36 == nil or p36.logo_aspect_ratio == nil then nil else p36.logo_aspect_ratio,
		place_id = if p36 == nil or p36.place_id == nil then nil else p36.place_id,
		launch_data = if p36 == nil or p36.launch_data == nil then nil else p36.launch_data,
		tile_variant = if p36 == nil or p36.tile_variant == nil then nil else p36.tile_variant,
		cta_text = if p36 == nil or p36.cta_text == nil then nil else p36.cta_text,
		badge_analytics_id = if p36 == nil or p36.badge_analytics_id == nil then nil else p36.badge_analytics_id,
		game_items = if p36 == nil or p36.game_items == nil then {} else p36.game_items,
		attribution_thumbnail_asset_id = if p36 == nil or p36.attribution_thumbnail_asset_id == nil then nil else p36.attribution_thumbnail_asset_id,
		game_items_compact = if p36 == nil or p36.game_items_compact == nil then {} else p36.game_items_compact,
		source_sort_id = if p36 == nil or p36.source_sort_id == nil then nil else p36.source_sort_id,
		new_game_enum = if p36 == nil or p36.new_game_enum == nil then nil else p36.new_game_enum,
		moment_video_playback = if p36 == nil or p36.moment_video_playback == nil then nil else p36.moment_video_playback
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1003 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1004, var1005 = protoModule.writeTag(buff, var1003, 1, protoModule.wireTypes.lengthDelimited)
		var1004, var1689 = protoModule.writeString(var1004, var1005, self.universe_id)
		buff = var1004
		var1003 = var1005
	end
	if self.is_sponsored then
		local var1006, var1007 = protoModule.writeTag(buff, var1003, 2, protoModule.wireTypes.varint)
		var1006, var1691 = protoModule.writeVarInt(var1006, var1007, if self.is_sponsored then 1 else 0)
		buff = var1006
		var1003 = var1007
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1008, var1009 = protoModule.writeTag(buff, var1003, 3, protoModule.wireTypes.lengthDelimited)
		var1008, var1693 = protoModule.writeString(var1008, var1009, self.roblox_component)
		buff = var1008
		var1003 = var1009
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1010, var1011 = protoModule.writeTag(buff, var1003, 4, protoModule.wireTypes.lengthDelimited)
		var1010, var1695 = protoModule.writeString(var1010, var1011, self.native_ad_data)
		buff = var1010
		var1003 = var1011
	end
	if self.is_content_locked then
		local var1012, var1013 = protoModule.writeTag(buff, var1003, 5, protoModule.wireTypes.varint)
		var1012, var1697 = protoModule.writeVarInt(var1012, var1013, if self.is_content_locked then 1 else 0)
		buff = var1012
		var1003 = var1013
	end
	if self.title ~= nil and self.title ~= "" then
		local var1014, var1015 = protoModule.writeTag(buff, var1003, 6, protoModule.wireTypes.lengthDelimited)
		var1014, var1699 = protoModule.writeString(var1014, var1015, self.title)
		buff = var1014
		var1003 = var1015
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1016, var1017 = protoModule.writeTag(buff, var1003, 7, protoModule.wireTypes.lengthDelimited)
		var1016, var1701 = protoModule.writeString(var1016, var1017, self.subtitle)
		buff = var1016
		var1003 = var1017
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1018, var1019 = protoModule.writeTag(buff, var1003, 8, protoModule.wireTypes.lengthDelimited)
		var1018, var1703 = protoModule.writeString(var1018, var1019, self.image_asset_id)
		buff = var1018
		var1003 = var1019
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1020, var1021 = protoModule.writeTag(buff, var1003, 9, protoModule.wireTypes.lengthDelimited)
		var1020, var1705 = protoModule.writeString(var1020, var1021, self.video_asset_id)
		buff = var1020
		var1003 = var1021
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1022, var1023 = protoModule.writeTag(buff, var1003, 10, protoModule.wireTypes.lengthDelimited)
		var1022, var1707 = protoModule.writeString(var1022, var1023, self.badge_text)
		buff = var1022
		var1003 = var1023
	end
	if self.player_count ~= nil then
		local var1024, var1025 = protoModule.writeTag(buff, var1003, 11, protoModule.wireTypes.varint)
		var1024, var1709 = protoModule.writeVarInt(var1024, var1025, self.player_count)
		buff = var1024
		var1003 = var1025
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1026, var1027 = protoModule.writeTag(buff, var1003, 12, protoModule.wireTypes.lengthDelimited)
		var1026, var1711 = protoModule.writeString(var1026, var1027, self.creator_key)
		buff = var1026
		var1003 = var1027
	end
	if self.rank ~= nil then
		local var1028, var1029 = protoModule.writeTag(buff, var1003, 13, protoModule.wireTypes.varint)
		var1028, var1713 = protoModule.writeVarInt(var1028, var1029, self.rank)
		buff = var1028
		var1003 = var1029
	end
	if self.payer_name ~= nil then
		local var1030, var1031 = protoModule.writeTag(buff, var1003, 14, protoModule.wireTypes.lengthDelimited)
		var1030, var1715 = protoModule.writeString(var1030, var1031, self.payer_name)
		buff = var1030
		var1003 = var1031
	end
	if self.logo_asset_id ~= nil then
		local var1032, var1033 = protoModule.writeTag(buff, var1003, 15, protoModule.wireTypes.lengthDelimited)
		var1032, var1717 = protoModule.writeString(var1032, var1033, self.logo_asset_id)
		buff = var1032
		var1003 = var1033
	end
	if self.logo_aspect_ratio ~= nil then
		local var1034, var1035 = protoModule.writeTag(buff, var1003, 16, protoModule.wireTypes.i64)
		var1034, var1719 = protoModule.writeDouble(var1034, var1035, self.logo_aspect_ratio)
		buff = var1034
		var1003 = var1035
	end
	if self.place_id ~= nil then
		local var1036, var1037 = protoModule.writeTag(buff, var1003, 17, protoModule.wireTypes.lengthDelimited)
		var1036, var1721 = protoModule.writeString(var1036, var1037, self.place_id)
		buff = var1036
		var1003 = var1037
	end
	if self.launch_data ~= nil then
		local var1038, var1039 = protoModule.writeTag(buff, var1003, 18, protoModule.wireTypes.lengthDelimited)
		var1038, var1723 = protoModule.writeString(var1038, var1039, self.launch_data)
		buff = var1038
		var1003 = var1039
	end
	if self.tile_variant ~= nil then
		local var1040, var1041 = protoModule.writeTag(buff, var1003, 19, protoModule.wireTypes.lengthDelimited)
		var1040, var1725 = protoModule.writeString(var1040, var1041, self.tile_variant)
		buff = var1040
		var1003 = var1041
	end
	if self.cta_text ~= nil then
		local var1042, var1043 = protoModule.writeTag(buff, var1003, 20, protoModule.wireTypes.lengthDelimited)
		var1042, var1727 = protoModule.writeString(var1042, var1043, self.cta_text)
		buff = var1042
		var1003 = var1043
	end
	if self.badge_analytics_id ~= nil then
		local var1044, var1045 = protoModule.writeTag(buff, var1003, 21, protoModule.wireTypes.lengthDelimited)
		var1044, var1729 = protoModule.writeString(var1044, var1045, self.badge_analytics_id)
		buff = var1044
		var1003 = var1045
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1046 = v:encode()
			local var1047, var1048 = protoModule.writeTag(buff, var1003, 22, protoModule.wireTypes.lengthDelimited)
			var1047, var1732 = protoModule.writeBuffer(var1047, var1048, var1046, buffer.len(var1046))
			buff = var1047
			var1003 = var1048
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1049, var1050 = protoModule.writeTag(buff, var1003, 23, protoModule.wireTypes.lengthDelimited)
		var1049, var1734 = protoModule.writeString(var1049, var1050, self.attribution_thumbnail_asset_id)
		buff = var1049
		var1003 = var1050
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1051 = v:encode()
			local var1052, var1053 = protoModule.writeTag(buff, var1003, 24, protoModule.wireTypes.lengthDelimited)
			var1052, var1737 = protoModule.writeBuffer(var1052, var1053, var1051, buffer.len(var1051))
			buff = var1052
			var1003 = var1053
		end
	end
	if self.source_sort_id ~= nil then
		local var1054, var1055 = protoModule.writeTag(buff, var1003, 25, protoModule.wireTypes.lengthDelimited)
		var1054, var1739 = protoModule.writeString(var1054, var1055, self.source_sort_id)
		buff = var1054
		var1003 = var1055
	end
	if self.new_game_enum ~= nil then
		local var1056, var1057 = protoModule.writeTag(buff, var1003, 26, protoModule.wireTypes.varint)
		var1056, var1741 = protoModule.writeVarInt(var1056, var1057, self.new_game_enum)
		buff = var1056
		var1003 = var1057
	end
	if self.moment_video_playback ~= nil then
		local var1058 = self.moment_video_playback:encode()
		local var1059, var1060 = protoModule.writeTag(buff, var1003, 27, protoModule.wireTypes.lengthDelimited)
		var1059, var1744 = protoModule.writeBuffer(var1059, var1060, var1058, buffer.len(var1058))
		buff = var1059
		var1003 = var1060
	end
	local buff_1 = buffer.create(var1003)
	buffer.copy(buff_1, 0, buff, 0, var1003)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1061 = t_36.new()
	local var1062 = 0
	while var1062 < buffer.len(p36) do
		local _ = nil
		local var1063 = nil
		local var1064, var1065, var1066 = protoModule.readTag(p36, var1062)
		local var1067 = var1064
		var1063 = var1065
		var1062 = var1066
		
		if var1063 == protoModule.wireTypes.varint then
			if var1067 == 2 then
				local _ = nil
				local var1068, var1069 = protoModule.readVarInt(p36, var1062)
				var1062 = var1069
				var1061.is_sponsored = var1068 ~= 0
			elseif var1067 == 5 then
				local _ = nil
				local var1070, var1071 = protoModule.readVarInt(p36, var1062)
				var1062 = var1071
				var1061.is_content_locked = var1070 ~= 0
			elseif var1067 == 11 then
				local _ = nil
				local var1072, var1073 = protoModule.readVarIntI64(p36, var1062)
				var1062 = var1073
				var1061.player_count = var1072
			elseif var1067 == 13 then
				local _ = nil
				local var1074, var1075 = protoModule.readVarIntI32(p36, var1062)
				var1062 = var1075
				var1061.rank = var1074
			elseif var1067 == 26 then
				local _ = nil
				local var1076, var1077 = protoModule.readVarIntI32(p36, var1062)
				var1062 = var1077
				var1061.new_game_enum = var1076
			else
				local _ = nil
				local var1078, var1079 = protoModule.readVarInt(p36, var1062)
				local _ = var1078
				var1062 = var1079
			end
		end
		if var1063 == protoModule.wireTypes.lengthDelimited then
			if var1067 == 1 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p36, var1062)
				var1062 = var1081
				var1061.universe_id = buffer.tostring(var1080)
			elseif var1067 == 3 then
				local _ = nil
				local var1082, var1083 = protoModule.readBuffer(p36, var1062)
				var1062 = var1083
				var1061.roblox_component = buffer.tostring(var1082)
			elseif var1067 == 4 then
				local _ = nil
				local var1084, var1085 = protoModule.readBuffer(p36, var1062)
				var1062 = var1085
				var1061.native_ad_data = buffer.tostring(var1084)
			elseif var1067 == 6 then
				local _ = nil
				local var1086, var1087 = protoModule.readBuffer(p36, var1062)
				var1062 = var1087
				var1061.title = buffer.tostring(var1086)
			elseif var1067 == 7 then
				local _ = nil
				local var1088, var1089 = protoModule.readBuffer(p36, var1062)
				var1062 = var1089
				var1061.subtitle = buffer.tostring(var1088)
			elseif var1067 == 8 then
				local _ = nil
				local var1090, var1091 = protoModule.readBuffer(p36, var1062)
				var1062 = var1091
				var1061.image_asset_id = buffer.tostring(var1090)
			elseif var1067 == 9 then
				local _ = nil
				local var1092, var1093 = protoModule.readBuffer(p36, var1062)
				var1062 = var1093
				var1061.video_asset_id = buffer.tostring(var1092)
			elseif var1067 == 10 then
				local _ = nil
				local var1094, var1095 = protoModule.readBuffer(p36, var1062)
				var1062 = var1095
				var1061.badge_text = buffer.tostring(var1094)
			elseif var1067 == 12 then
				local _ = nil
				local var1096, var1097 = protoModule.readBuffer(p36, var1062)
				var1062 = var1097
				var1061.creator_key = buffer.tostring(var1096)
			elseif var1067 == 14 then
				local _ = nil
				local var1098, var1099 = protoModule.readBuffer(p36, var1062)
				var1062 = var1099
				var1061.payer_name = buffer.tostring(var1098)
			elseif var1067 == 15 then
				local _ = nil
				local var1100, var1101 = protoModule.readBuffer(p36, var1062)
				var1062 = var1101
				var1061.logo_asset_id = buffer.tostring(var1100)
			elseif var1067 == 17 then
				local _ = nil
				local var1102, var1103 = protoModule.readBuffer(p36, var1062)
				var1062 = var1103
				var1061.place_id = buffer.tostring(var1102)
			elseif var1067 == 18 then
				local _ = nil
				local var1104, var1105 = protoModule.readBuffer(p36, var1062)
				var1062 = var1105
				var1061.launch_data = buffer.tostring(var1104)
			elseif var1067 == 19 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p36, var1062)
				var1062 = var1107
				var1061.tile_variant = buffer.tostring(var1106)
			elseif var1067 == 20 then
				local _ = nil
				local var1108, var1109 = protoModule.readBuffer(p36, var1062)
				var1062 = var1109
				var1061.cta_text = buffer.tostring(var1108)
			elseif var1067 == 21 then
				local _ = nil
				local var1110, var1111 = protoModule.readBuffer(p36, var1062)
				var1062 = var1111
				var1061.badge_analytics_id = buffer.tostring(var1110)
			elseif var1067 == 22 then
				local _ = nil
				local var1112, var1113 = protoModule.readBuffer(p36, var1062)
				var1062 = var1113
				table.insert(var1061.game_items, t.GameItemInputData.decode(var1112))
			elseif var1067 == 23 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p36, var1062)
				var1062 = var1115
				var1061.attribution_thumbnail_asset_id = buffer.tostring(var1114)
			elseif var1067 == 24 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p36, var1062)
				var1062 = var1117
				table.insert(var1061.game_items_compact, t.GameItemInputData.decode(var1116))
			elseif var1067 == 25 then
				local _ = nil
				local var1118, var1119 = protoModule.readBuffer(p36, var1062)
				var1062 = var1119
				var1061.source_sort_id = buffer.tostring(var1118)
			elseif var1067 == 27 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p36, var1062)
				var1062 = var1121
				var1061.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1120)
			else
				local _ = nil
				local var1122, var1123 = protoModule.readVarInt(p36, var1062)
				var1062 = var1123 + var1122
			end
		elseif var1063 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1124, var1125 = protoModule.readFixed32(p36, var1062)
			local _ = var1124
			var1062 = var1125
		elseif var1063 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1063)
		elseif var1067 == 16 then
			local _ = nil
			local var1126, var1127 = protoModule.readDouble(p36, var1062)
			var1062 = var1127
			var1061.logo_aspect_ratio = var1126
		else
			local _ = nil
			local var1128, var1129 = protoModule.readFixed64(p36, var1062)
			local _ = var1128
			var1062 = var1129
		end
	end
	return var1061
end

function t_36:jsonEncode()
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

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1130 = t_36.new()
	
	if self.universe_id ~= nil then
		var1130.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1130.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1130.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1130.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1130.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1130.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1130.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1130.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1130.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1130.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1130.title = self.title
	end
	if self.subtitle ~= nil then
		var1130.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1130.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1130.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1130.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1130.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1130.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1130.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1130.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1130.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1130.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1130.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1130.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1130.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1130.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1130.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1130.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1130.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1130.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1130.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1130.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1130.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1130.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1130.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1130.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1130.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1130.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1130.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1130.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1130.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1130.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1130.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1130.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1130.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1130.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1130.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1130.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1130.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1130.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1130.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1130.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	return var1130
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p37)
	-- upvalues: t_37 (ref)
	return setmetatable({
		asset_id = if p37 == nil or p37.asset_id == nil then "" else p37.asset_id,
		asset_access_context = if p37 == nil or p37.asset_access_context == nil then "" else p37.asset_access_context
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1131 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1132, var1133 = protoModule.writeTag(buff, var1131, 1, protoModule.wireTypes.lengthDelimited)
		var1132, var1826 = protoModule.writeString(var1132, var1133, self.asset_id)
		buff = var1132
		var1131 = var1133
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1134, var1135 = protoModule.writeTag(buff, var1131, 2, protoModule.wireTypes.lengthDelimited)
		var1134, var1828 = protoModule.writeString(var1134, var1135, self.asset_access_context)
		buff = var1134
		var1131 = var1135
	end
	local buff_1 = buffer.create(var1131)
	buffer.copy(buff_1, 0, buff, 0, var1131)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref)
	local var1131 = t_37.new()
	local var1132 = 0
	while var1132 < buffer.len(p37) do
		local _ = nil
		local var1133 = nil
		local var1134, var1135, var1136 = protoModule.readTag(p37, var1132)
		local var1137 = var1134
		var1133 = var1135
		var1132 = var1136
		
		if var1133 == protoModule.wireTypes.varint then
			local _ = nil
			local var1138, var1139 = protoModule.readVarInt(p37, var1132)
			local _ = var1138
			var1132 = var1139
			continue
		end
		if var1133 == protoModule.wireTypes.lengthDelimited then
			if var1137 == 1 then
				local _ = nil
				local var1140, var1141 = protoModule.readBuffer(p37, var1132)
				var1132 = var1141
				var1131.asset_id = buffer.tostring(var1140)
			elseif var1137 == 2 then
				local _ = nil
				local var1142, var1143 = protoModule.readBuffer(p37, var1132)
				var1132 = var1143
				var1131.asset_access_context = buffer.tostring(var1142)
			else
				local _ = nil
				local var1144, var1145 = protoModule.readVarInt(p37, var1132)
				var1132 = var1145 + var1144
			end
		elseif var1133 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1146, var1147 = protoModule.readFixed32(p37, var1132)
			local _ = var1146
			var1132 = var1147
		elseif var1133 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1148, var1149 = protoModule.readFixed64(p37, var1132)
			local _ = var1148
			var1132 = var1149
		else
			error("Unsupported wire type: " .. var1133)
		end
	end
	return var1131
end

function t_37:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function t_37:jsonDecode()
	-- upvalues: t_37 (ref)
	local var1150 = t_37.new()
	
	if self.asset_id ~= nil then
		var1150.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1150.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1150.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1150.asset_access_context = self.assetAccessContext
	end
	return var1150
end

t_37.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = t_37
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t_38 (ref)
	return setmetatable({
		title = if p38 == nil or p38.title == nil then "" else p38.title,
		song_items = if p38 == nil or p38.song_items == nil then {} else p38.song_items,
		next_page_token = if p38 == nil or p38.next_page_token == nil then "" else p38.next_page_token,
		sort_id = if p38 == nil or p38.sort_id == nil then "" else p38.sort_id,
		secondary_sort_id = if p38 == nil or p38.secondary_sort_id == nil then 0 else p38.secondary_sort_id,
		subtitle = if p38 == nil or p38.subtitle == nil then "" else p38.subtitle,
		info_text = if p38 == nil or p38.info_text == nil then "" else p38.info_text,
		subtitle_link_path = if p38 == nil or p38.subtitle_link_path == nil then "" else p38.subtitle_link_path,
		is_placeholder = if p38 == nil or p38.is_placeholder == nil then nil else p38.is_placeholder,
		primary_sort_id = if p38 == nil or p38.primary_sort_id == nil then nil else p38.primary_sort_id,
		applied_filters = if p38 == nil or p38.applied_filters == nil then nil else p38.applied_filters
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1150 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1151, var1152 = protoModule.writeTag(buff, var1150, 1, protoModule.wireTypes.lengthDelimited)
		var1151, var1854 = protoModule.writeString(var1151, var1152, self.title)
		buff = var1151
		var1150 = var1152
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1153 = v:encode()
			local var1154, var1155 = protoModule.writeTag(buff, var1150, 2, protoModule.wireTypes.lengthDelimited)
			var1154, var1857 = protoModule.writeBuffer(var1154, var1155, var1153, buffer.len(var1153))
			buff = var1154
			var1150 = var1155
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1156, var1157 = protoModule.writeTag(buff, var1150, 3, protoModule.wireTypes.lengthDelimited)
		var1156, var1859 = protoModule.writeString(var1156, var1157, self.next_page_token)
		buff = var1156
		var1150 = var1157
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1158, var1159 = protoModule.writeTag(buff, var1150, 4, protoModule.wireTypes.lengthDelimited)
		var1158, var1861 = protoModule.writeString(var1158, var1159, self.sort_id)
		buff = var1158
		var1150 = var1159
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1160, var1161 = protoModule.writeTag(buff, var1150, 5, protoModule.wireTypes.varint)
		var1160, var1863 = protoModule.writeVarInt(var1160, var1161, self.secondary_sort_id)
		buff = var1160
		var1150 = var1161
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1162, var1163 = protoModule.writeTag(buff, var1150, 6, protoModule.wireTypes.lengthDelimited)
		var1162, var1865 = protoModule.writeString(var1162, var1163, self.subtitle)
		buff = var1162
		var1150 = var1163
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1164, var1165 = protoModule.writeTag(buff, var1150, 7, protoModule.wireTypes.lengthDelimited)
		var1164, var1867 = protoModule.writeString(var1164, var1165, self.info_text)
		buff = var1164
		var1150 = var1165
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1166, var1167 = protoModule.writeTag(buff, var1150, 8, protoModule.wireTypes.lengthDelimited)
		var1166, var1869 = protoModule.writeString(var1166, var1167, self.subtitle_link_path)
		buff = var1166
		var1150 = var1167
	end
	if self.is_placeholder ~= nil then
		local var1168, var1169 = protoModule.writeTag(buff, var1150, 9, protoModule.wireTypes.varint)
		var1168, var1871 = protoModule.writeVarInt(var1168, var1169, if self.is_placeholder then 1 else 0)
		buff = var1168
		var1150 = var1169
	end
	if self.primary_sort_id ~= nil then
		local var1170, var1171 = protoModule.writeTag(buff, var1150, 10, protoModule.wireTypes.varint)
		var1170, var1873 = protoModule.writeVarInt(var1170, var1171, self.primary_sort_id)
		buff = var1170
		var1150 = var1171
	end
	if self.applied_filters ~= nil then
		local var1172, var1173 = protoModule.writeTag(buff, var1150, 11, protoModule.wireTypes.lengthDelimited)
		var1172, var1875 = protoModule.writeString(var1172, var1173, self.applied_filters)
		buff = var1172
		var1150 = var1173
	end
	local buff_1 = buffer.create(var1150)
	buffer.copy(buff_1, 0, buff, 0, var1150)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1174 = t_38.new()
	local var1175 = 0
	while var1175 < buffer.len(p38) do
		local _ = nil
		local var1176 = nil
		local var1177, var1178, var1179 = protoModule.readTag(p38, var1175)
		local var1180 = var1177
		var1176 = var1178
		var1175 = var1179
		
		if var1176 == protoModule.wireTypes.varint then
			if var1180 == 5 then
				local _ = nil
				local var1181, var1182 = protoModule.readVarIntI32(p38, var1175)
				var1175 = var1182
				var1174.secondary_sort_id = var1181
			elseif var1180 == 9 then
				local _ = nil
				local var1183, var1184 = protoModule.readVarInt(p38, var1175)
				var1175 = var1184
				var1174.is_placeholder = var1183 ~= 0
			elseif var1180 == 10 then
				local _ = nil
				local var1185, var1186 = protoModule.readVarIntI32(p38, var1175)
				var1175 = var1186
				var1174.primary_sort_id = var1185
			else
				local _ = nil
				local var1187, var1188 = protoModule.readVarInt(p38, var1175)
				local _ = var1187
				var1175 = var1188
			end
		end
		if var1176 == protoModule.wireTypes.lengthDelimited then
			if var1180 == 1 then
				local _ = nil
				local var1189, var1190 = protoModule.readBuffer(p38, var1175)
				var1175 = var1190
				var1174.title = buffer.tostring(var1189)
			elseif var1180 == 2 then
				local _ = nil
				local var1191, var1192 = protoModule.readBuffer(p38, var1175)
				var1175 = var1192
				table.insert(var1174.song_items, t.SongCarouselInputData_SongItem.decode(var1191))
			elseif var1180 == 3 then
				local _ = nil
				local var1193, var1194 = protoModule.readBuffer(p38, var1175)
				var1175 = var1194
				var1174.next_page_token = buffer.tostring(var1193)
			elseif var1180 == 4 then
				local _ = nil
				local var1195, var1196 = protoModule.readBuffer(p38, var1175)
				var1175 = var1196
				var1174.sort_id = buffer.tostring(var1195)
			elseif var1180 == 6 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p38, var1175)
				var1175 = var1198
				var1174.subtitle = buffer.tostring(var1197)
			elseif var1180 == 7 then
				local _ = nil
				local var1199, var1200 = protoModule.readBuffer(p38, var1175)
				var1175 = var1200
				var1174.info_text = buffer.tostring(var1199)
			elseif var1180 == 8 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p38, var1175)
				var1175 = var1202
				var1174.subtitle_link_path = buffer.tostring(var1201)
			elseif var1180 == 11 then
				local _ = nil
				local var1203, var1204 = protoModule.readBuffer(p38, var1175)
				var1175 = var1204
				var1174.applied_filters = buffer.tostring(var1203)
			else
				local _ = nil
				local var1205, var1206 = protoModule.readVarInt(p38, var1175)
				var1175 = var1206 + var1205
			end
		elseif var1176 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed32(p38, var1175)
			local _ = var1207
			var1175 = var1208
		elseif var1176 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1209, var1210 = protoModule.readFixed64(p38, var1175)
			local _ = var1209
			var1175 = var1210
		else
			error("Unsupported wire type: " .. var1176)
		end
	end
	return var1174
end

function t_38:jsonEncode()
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

function t_38:jsonDecode()
	-- upvalues: t_38 (ref), t (ref)
	local var1211 = t_38.new()
	
	if self.title ~= nil then
		var1211.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1211.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1211.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1211.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1211.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1211.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1211.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1211.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1211.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1211.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1211.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1211.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1211.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1211.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1211.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1211.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1211.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1211.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1211.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1211.applied_filters = self.appliedFilters
	end
	return var1211
end

t_38.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_38
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		song_id = if p39 == nil or p39.song_id == nil then "" else p39.song_id
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1212 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1213, var1214 = protoModule.writeTag(buff, var1212, 1, protoModule.wireTypes.lengthDelimited)
		var1213, var1922 = protoModule.writeString(var1213, var1214, self.song_id)
		buff = var1213
		var1212 = var1214
	end
	local buff_1 = buffer.create(var1212)
	buffer.copy(buff_1, 0, buff, 0, var1212)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref)
	local var1212 = t_39.new()
	local var1213 = 0
	while var1213 < buffer.len(p39) do
		local _ = nil
		local var1214 = nil
		local var1215, var1216, var1217 = protoModule.readTag(p39, var1213)
		local var1218 = var1215
		var1214 = var1216
		var1213 = var1217
		
		if var1214 == protoModule.wireTypes.varint then
			local _ = nil
			local var1219, var1220 = protoModule.readVarInt(p39, var1213)
			local _ = var1219
			var1213 = var1220
			continue
		end
		if var1214 == protoModule.wireTypes.lengthDelimited then
			if var1218 == 1 then
				local _ = nil
				local var1221, var1222 = protoModule.readBuffer(p39, var1213)
				var1213 = var1222
				var1212.song_id = buffer.tostring(var1221)
			else
				local _ = nil
				local var1223, var1224 = protoModule.readVarInt(p39, var1213)
				var1213 = var1224 + var1223
			end
		elseif var1214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1225, var1226 = protoModule.readFixed32(p39, var1213)
			local _ = var1225
			var1213 = var1226
		elseif var1214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1227, var1228 = protoModule.readFixed64(p39, var1213)
			local _ = var1227
			var1213 = var1228
		else
			error("Unsupported wire type: " .. var1214)
		end
	end
	return var1212
end

function t_39:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_39:jsonDecode()
	-- upvalues: t_39 (ref)
	local var1229 = t_39.new()
	
	if self.song_id ~= nil then
		var1229.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1229.song_id = self.songId
	end
	return var1229
end

t_39.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_39
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t_40 (ref)
	return setmetatable({
		title = if p40 == nil or p40.title == nil then "" else p40.title,
		event_items = if p40 == nil or p40.event_items == nil then {} else p40.event_items,
		universe_id = if p40 == nil or p40.universe_id == nil then "" else p40.universe_id,
		sort_id = if p40 == nil or p40.sort_id == nil then "" else p40.sort_id,
		subtitle = if p40 == nil or p40.subtitle == nil then "" else p40.subtitle,
		info_text = if p40 == nil or p40.info_text == nil then "" else p40.info_text
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1229 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1230, var1231 = protoModule.writeTag(buff, var1229, 1, protoModule.wireTypes.lengthDelimited)
		var1230, var1946 = protoModule.writeString(var1230, var1231, self.title)
		buff = var1230
		var1229 = var1231
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1232 = v:encode()
			local var1233, var1234 = protoModule.writeTag(buff, var1229, 2, protoModule.wireTypes.lengthDelimited)
			var1233, var1949 = protoModule.writeBuffer(var1233, var1234, var1232, buffer.len(var1232))
			buff = var1233
			var1229 = var1234
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1235, var1236 = protoModule.writeTag(buff, var1229, 3, protoModule.wireTypes.lengthDelimited)
		var1235, var1951 = protoModule.writeString(var1235, var1236, self.universe_id)
		buff = var1235
		var1229 = var1236
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1237, var1238 = protoModule.writeTag(buff, var1229, 4, protoModule.wireTypes.lengthDelimited)
		var1237, var1953 = protoModule.writeString(var1237, var1238, self.sort_id)
		buff = var1237
		var1229 = var1238
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1239, var1240 = protoModule.writeTag(buff, var1229, 5, protoModule.wireTypes.lengthDelimited)
		var1239, var1955 = protoModule.writeString(var1239, var1240, self.subtitle)
		buff = var1239
		var1229 = var1240
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1241, var1242 = protoModule.writeTag(buff, var1229, 6, protoModule.wireTypes.lengthDelimited)
		var1241, var1957 = protoModule.writeString(var1241, var1242, self.info_text)
		buff = var1241
		var1229 = var1242
	end
	local buff_1 = buffer.create(var1229)
	buffer.copy(buff_1, 0, buff, 0, var1229)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1243 = t_40.new()
	local var1244 = 0
	while var1244 < buffer.len(p40) do
		local _ = nil
		local var1245 = nil
		local var1246, var1247, var1248 = protoModule.readTag(p40, var1244)
		local var1249 = var1246
		var1245 = var1247
		var1244 = var1248
		
		if var1245 == protoModule.wireTypes.varint then
			local _ = nil
			local var1250, var1251 = protoModule.readVarInt(p40, var1244)
			local _ = var1250
			var1244 = var1251
			continue
		end
		if var1245 == protoModule.wireTypes.lengthDelimited then
			if var1249 == 1 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p40, var1244)
				var1244 = var1253
				var1243.title = buffer.tostring(var1252)
			elseif var1249 == 2 then
				local _ = nil
				local var1254, var1255 = protoModule.readBuffer(p40, var1244)
				var1244 = var1255
				table.insert(var1243.event_items, t.EventsCarouselInputData_EventItem.decode(var1254))
			elseif var1249 == 3 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p40, var1244)
				var1244 = var1257
				var1243.universe_id = buffer.tostring(var1256)
			elseif var1249 == 4 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p40, var1244)
				var1244 = var1259
				var1243.sort_id = buffer.tostring(var1258)
			elseif var1249 == 5 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p40, var1244)
				var1244 = var1261
				var1243.subtitle = buffer.tostring(var1260)
			elseif var1249 == 6 then
				local _ = nil
				local var1262, var1263 = protoModule.readBuffer(p40, var1244)
				var1244 = var1263
				var1243.info_text = buffer.tostring(var1262)
			else
				local _ = nil
				local var1264, var1265 = protoModule.readVarInt(p40, var1244)
				var1244 = var1265 + var1264
			end
		elseif var1245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1266, var1267 = protoModule.readFixed32(p40, var1244)
			local _ = var1266
			var1244 = var1267
		elseif var1245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1268, var1269 = protoModule.readFixed64(p40, var1244)
			local _ = var1268
			var1244 = var1269
		else
			error("Unsupported wire type: " .. var1245)
		end
	end
	return var1243
end

function t_40:jsonEncode()
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

function t_40:jsonDecode()
	-- upvalues: t_40 (ref), t (ref)
	local var1270 = t_40.new()
	
	if self.title ~= nil then
		var1270.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1270.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1270.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1270.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1270.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1270.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1270.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1270.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1270.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1270.info_text = self.infoText
	end
	return var1270
end

t_40.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		event_id = if p41 == nil or p41.event_id == nil then "" else p41.event_id
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1271 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1272, var1273 = protoModule.writeTag(buff, var1271, 1, protoModule.wireTypes.lengthDelimited)
		var1272, var1994 = protoModule.writeString(var1272, var1273, self.event_id)
		buff = var1272
		var1271 = var1273
	end
	local buff_1 = buffer.create(var1271)
	buffer.copy(buff_1, 0, buff, 0, var1271)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref)
	local var1271 = t_41.new()
	local var1272 = 0
	while var1272 < buffer.len(p41) do
		local _ = nil
		local var1273 = nil
		local var1274, var1275, var1276 = protoModule.readTag(p41, var1272)
		local var1277 = var1274
		var1273 = var1275
		var1272 = var1276
		
		if var1273 == protoModule.wireTypes.varint then
			local _ = nil
			local var1278, var1279 = protoModule.readVarInt(p41, var1272)
			local _ = var1278
			var1272 = var1279
			continue
		end
		if var1273 == protoModule.wireTypes.lengthDelimited then
			if var1277 == 1 then
				local _ = nil
				local var1280, var1281 = protoModule.readBuffer(p41, var1272)
				var1272 = var1281
				var1271.event_id = buffer.tostring(var1280)
			else
				local _ = nil
				local var1282, var1283 = protoModule.readVarInt(p41, var1272)
				var1272 = var1283 + var1282
			end
		elseif var1273 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1284, var1285 = protoModule.readFixed32(p41, var1272)
			local _ = var1284
			var1272 = var1285
		elseif var1273 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1286, var1287 = protoModule.readFixed64(p41, var1272)
			local _ = var1286
			var1272 = var1287
		else
			error("Unsupported wire type: " .. var1273)
		end
	end
	return var1271
end

function t_41:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_41:jsonDecode()
	-- upvalues: t_41 (ref)
	local var1288 = t_41.new()
	
	if self.event_id ~= nil then
		var1288.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1288.event_id = self.eventId
	end
	return var1288
end

t_41.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_41
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t_42 (ref)
	return setmetatable({
		universe_id = if p42 == nil or p42.universe_id == nil then "" else p42.universe_id,
		entry_map = if p42 == nil or p42.entry_map == nil then {} else p42.entry_map,
		entry_order = if p42 == nil or p42.entry_order == nil then {} else p42.entry_order,
		creator_key = if p42 == nil or p42.creator_key == nil then "" else p42.creator_key,
		pill_tabs = if p42 == nil or p42.pill_tabs == nil then nil else p42.pill_tabs
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1288 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1289, var1290 = protoModule.writeTag(buff, var1288, 1, protoModule.wireTypes.lengthDelimited)
		var1289, var2018 = protoModule.writeString(var1289, var1290, self.universe_id)
		buff = var1289
		var1288 = var1290
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1291, var1292 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1291, var2020 = protoModule.writeString(var1291, var1292, i)
			local var1293 = v:encode()
			var1292, var2022 = protoModule.writeTag(var1291, var1292, 2, protoModule.wireTypes.lengthDelimited)
			var1292, var2022 = protoModule.writeBuffer(var1292, var2022, var1293, buffer.len(var1293))
			local var1294 = var1292
			local var1295 = var2022
			local var1296, var1297 = protoModule.writeTag(buff, var1288, 2, protoModule.wireTypes.lengthDelimited)
			var1296, var2026 = protoModule.writeBuffer(var1296, var1297, var1294, var1295)
			buff = var1296
			var1288 = var1297
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1298, var1299 = protoModule.writeTag(buff, var1288, 3, protoModule.wireTypes.lengthDelimited)
			var1298, var2028 = protoModule.writeString(var1298, var1299, v)
			buff = var1298
			var1288 = var1299
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1300, var1301 = protoModule.writeTag(buff, var1288, 4, protoModule.wireTypes.lengthDelimited)
		var1300, var2030 = protoModule.writeString(var1300, var1301, self.creator_key)
		buff = var1300
		var1288 = var1301
	end
	if self.pill_tabs ~= nil then
		local var1302 = self.pill_tabs:encode()
		local var1303, var1304 = protoModule.writeTag(buff, var1288, 5, protoModule.wireTypes.lengthDelimited)
		var1303, var2033 = protoModule.writeBuffer(var1303, var1304, var1302, buffer.len(var1302))
		buff = var1303
		var1288 = var1304
	end
	local buff_1 = buffer.create(var1288)
	buffer.copy(buff_1, 0, buff, 0, var1288)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1305 = t_42.new()
	local var1306 = 0
	while var1306 < buffer.len(p42) do
		local _ = nil
		local var1307 = nil
		local var1308, var1309, var1310 = protoModule.readTag(p42, var1306)
		local var1311 = var1308
		var1307 = var1309
		var1306 = var1310
		
		if var1307 == protoModule.wireTypes.varint then
			local _ = nil
			local var1312, var1313 = protoModule.readVarInt(p42, var1306)
			local _ = var1312
			var1306 = var1313
			continue
		end
		if var1307 == protoModule.wireTypes.lengthDelimited then
			if var1311 == 1 then
				local _ = nil
				local var1314, var1315 = protoModule.readBuffer(p42, var1306)
				var1306 = var1315
				var1305.universe_id = buffer.tostring(var1314)
			elseif var1311 == 2 then
				local _ = nil
				local var1316, var1317 = protoModule.readBuffer(p42, var1306)
				var1306 = var1317
				var1316 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1316)
				var1305.entry_map[var1316.key or ""] = var1316.value or t.FeedEntry.new()
			elseif var1311 == 3 then
				local _ = nil
				local var1318, var1319 = protoModule.readBuffer(p42, var1306)
				var1306 = var1319
				table.insert(var1305.entry_order, buffer.tostring(var1318))
			elseif var1311 == 4 then
				local _ = nil
				local var1320, var1321 = protoModule.readBuffer(p42, var1306)
				var1306 = var1321
				var1305.creator_key = buffer.tostring(var1320)
			elseif var1311 == 5 then
				local _ = nil
				local var1322, var1323 = protoModule.readBuffer(p42, var1306)
				var1306 = var1323
				var1305.pill_tabs = t.PillTabsInputData.decode(var1322)
			else
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p42, var1306)
				var1306 = var1325 + var1324
			end
		elseif var1307 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1326, var1327 = protoModule.readFixed32(p42, var1306)
			local _ = var1326
			var1306 = var1327
		elseif var1307 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1328, var1329 = protoModule.readFixed64(p42, var1306)
			local _ = var1328
			var1306 = var1329
		else
			error("Unsupported wire type: " .. var1307)
		end
	end
	return var1305
end

function t_42:jsonEncode()
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

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var1330 = t_42.new()
	
	if self.universe_id ~= nil then
		var1330.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1330.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1330.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1330.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1330.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1330.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1330.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1330.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1330.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1330.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1330
end

t_42.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		key = if p43 == nil or p43.key == nil then "" else p43.key,
		value = if p43 == nil or p43.value == nil then nil else p43.value
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1331 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1332, var1333 = protoModule.writeTag(buff, var1331, 1, protoModule.wireTypes.lengthDelimited)
		var1332, var2071 = protoModule.writeString(var1332, var1333, self.key)
		buff = var1332
		var1331 = var1333
	end
	if self.value ~= nil then
		local var1334 = self.value:encode()
		local var1335, var1336 = protoModule.writeTag(buff, var1331, 2, protoModule.wireTypes.lengthDelimited)
		var1335, var2074 = protoModule.writeBuffer(var1335, var1336, var1334, buffer.len(var1334))
		buff = var1335
		var1331 = var1336
	end
	local buff_1 = buffer.create(var1331)
	buffer.copy(buff_1, 0, buff, 0, var1331)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1331 = t_43.new()
	local var1332 = 0
	while var1332 < buffer.len(p43) do
		local _ = nil
		local var1333 = nil
		local var1334, var1335, var1336 = protoModule.readTag(p43, var1332)
		local var1337 = var1334
		var1333 = var1335
		var1332 = var1336
		
		if var1333 == protoModule.wireTypes.varint then
			local _ = nil
			local var1338, var1339 = protoModule.readVarInt(p43, var1332)
			local _ = var1338
			var1332 = var1339
			continue
		end
		if var1333 == protoModule.wireTypes.lengthDelimited then
			if var1337 == 1 then
				local _ = nil
				local var1340, var1341 = protoModule.readBuffer(p43, var1332)
				var1332 = var1341
				var1331.key = buffer.tostring(var1340)
			elseif var1337 == 2 then
				local _ = nil
				local var1342, var1343 = protoModule.readBuffer(p43, var1332)
				var1332 = var1343
				var1331.value = t.FeedEntry.decode(var1342)
			else
				local _ = nil
				local var1344, var1345 = protoModule.readVarInt(p43, var1332)
				var1332 = var1345 + var1344
			end
		elseif var1333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1346, var1347 = protoModule.readFixed32(p43, var1332)
			local _ = var1346
			var1332 = var1347
		elseif var1333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1348, var1349 = protoModule.readFixed64(p43, var1332)
			local _ = var1348
			var1332 = var1349
		else
			error("Unsupported wire type: " .. var1333)
		end
	end
	return var1331
end

function t_43:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var1350 = t_43.new()
	
	if self.key ~= nil then
		var1350.key = self.key
	end
	if self.value ~= nil then
		var1350.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1350
end

t_43.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_43
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		options = if p44 == nil or p44.options == nil then {} else p44.options,
		default_option_id = if p44 == nil or p44.default_option_id == nil then "" else p44.default_option_id
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1350 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1351 = v:encode()
			local var1352, var1353 = protoModule.writeTag(buff, var1350, 1, protoModule.wireTypes.lengthDelimited)
			var1352, var2101 = protoModule.writeBuffer(var1352, var1353, var1351, buffer.len(var1351))
			buff = var1352
			var1350 = var1353
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1354, var1355 = protoModule.writeTag(buff, var1350, 2, protoModule.wireTypes.lengthDelimited)
		var1354, var2103 = protoModule.writeString(var1354, var1355, self.default_option_id)
		buff = var1354
		var1350 = var1355
	end
	local buff_1 = buffer.create(var1350)
	buffer.copy(buff_1, 0, buff, 0, var1350)
	
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
				table.insert(var1356.options, t.PillTabsInputData_PillTabOption.decode(var1365))
			elseif var1362 == 2 then
				local _ = nil
				local var1367, var1368 = protoModule.readBuffer(p44, var1357)
				var1357 = var1368
				var1356.default_option_id = buffer.tostring(var1367)
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
			error("Unsupported wire type: " .. var1358)
		end
	end
	return var1356
end

function t_44:jsonEncode()
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

function t_44:jsonDecode()
	-- upvalues: t_44 (ref), t (ref)
	local var1375 = t_44.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1375.options = t_1
	end
	if self.default_option_id ~= nil then
		var1375.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1375.default_option_id = self.defaultOptionId
	end
	return var1375
end

t_44.descriptor = {
	name = "PillTabsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabsInputData"
}
t.PillTabsInputData = t_44
typeRegistryModule.default:register(t.PillTabsInputData)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		option_id = if p45 == nil or p45.option_id == nil then "" else p45.option_id,
		display_name = if p45 == nil or p45.display_name == nil then "" else p45.display_name
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1376 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1377, var1378 = protoModule.writeTag(buff, var1376, 1, protoModule.wireTypes.lengthDelimited)
		var1377, var2131 = protoModule.writeString(var1377, var1378, self.option_id)
		buff = var1377
		var1376 = var1378
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1379, var1380 = protoModule.writeTag(buff, var1376, 2, protoModule.wireTypes.lengthDelimited)
		var1379, var2133 = protoModule.writeString(var1379, var1380, self.display_name)
		buff = var1379
		var1376 = var1380
	end
	local buff_1 = buffer.create(var1376)
	buffer.copy(buff_1, 0, buff, 0, var1376)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref)
	local var1376 = t_45.new()
	local var1377 = 0
	while var1377 < buffer.len(p45) do
		local _ = nil
		local var1378 = nil
		local var1379, var1380, var1381 = protoModule.readTag(p45, var1377)
		local var1382 = var1379
		var1378 = var1380
		var1377 = var1381
		
		if var1378 == protoModule.wireTypes.varint then
			local _ = nil
			local var1383, var1384 = protoModule.readVarInt(p45, var1377)
			local _ = var1383
			var1377 = var1384
			continue
		end
		if var1378 == protoModule.wireTypes.lengthDelimited then
			if var1382 == 1 then
				local _ = nil
				local var1385, var1386 = protoModule.readBuffer(p45, var1377)
				var1377 = var1386
				var1376.option_id = buffer.tostring(var1385)
			elseif var1382 == 2 then
				local _ = nil
				local var1387, var1388 = protoModule.readBuffer(p45, var1377)
				var1377 = var1388
				var1376.display_name = buffer.tostring(var1387)
			else
				local _ = nil
				local var1389, var1390 = protoModule.readVarInt(p45, var1377)
				var1377 = var1390 + var1389
			end
		elseif var1378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1391, var1392 = protoModule.readFixed32(p45, var1377)
			local _ = var1391
			var1377 = var1392
		elseif var1378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1393, var1394 = protoModule.readFixed64(p45, var1377)
			local _ = var1393
			var1377 = var1394
		else
			error("Unsupported wire type: " .. var1378)
		end
	end
	return var1376
end

function t_45:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	return t
end

function t_45:jsonDecode()
	-- upvalues: t_45 (ref)
	local var1395 = t_45.new()
	
	if self.option_id ~= nil then
		var1395.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1395.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1395.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1395.display_name = self.displayName
	end
	return var1395
end

t_45.descriptor = {
	name = "PillTabsInputData_PillTabOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabOption"
}
t.PillTabsInputData_PillTabOption = t_45
typeRegistryModule.default:register(t.PillTabsInputData_PillTabOption)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		game_passes = if p46 == nil or p46.game_passes == nil then {} else p46.game_passes
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1395 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1396 = v:encode()
			local var1397, var1398 = protoModule.writeTag(buff, var1395, 1, protoModule.wireTypes.lengthDelimited)
			var1397, var2160 = protoModule.writeBuffer(var1397, var1398, var1396, buffer.len(var1396))
			buff = var1397
			var1395 = var1398
		end
	end
	local buff_1 = buffer.create(var1395)
	buffer.copy(buff_1, 0, buff, 0, var1395)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1399 = t_46.new()
	local var1400 = 0
	while var1400 < buffer.len(p46) do
		local _ = nil
		local var1401 = nil
		local var1402, var1403, var1404 = protoModule.readTag(p46, var1400)
		local var1405 = var1402
		var1401 = var1403
		var1400 = var1404
		
		if var1401 == protoModule.wireTypes.varint then
			local _ = nil
			local var1406, var1407 = protoModule.readVarInt(p46, var1400)
			local _ = var1406
			var1400 = var1407
			continue
		end
		if var1401 == protoModule.wireTypes.lengthDelimited then
			if var1405 == 1 then
				local _ = nil
				local var1408, var1409 = protoModule.readBuffer(p46, var1400)
				var1400 = var1409
				table.insert(var1399.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1408))
			else
				local _ = nil
				local var1410, var1411 = protoModule.readVarInt(p46, var1400)
				var1400 = var1411 + var1410
			end
		elseif var1401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1412, var1413 = protoModule.readFixed32(p46, var1400)
			local _ = var1412
			var1400 = var1413
		elseif var1401 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1414, var1415 = protoModule.readFixed64(p46, var1400)
			local _ = var1414
			var1400 = var1415
		else
			error("Unsupported wire type: " .. var1401)
		end
	end
	return var1399
end

function t_46:jsonEncode()
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

function t_46:jsonDecode()
	-- upvalues: t_46 (ref), t (ref)
	local var1416 = t_46.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1416.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1416.game_passes = t_1
	end
	return var1416
end

t_46.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_46
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		game_pass_id = if p47 == nil or p47.game_pass_id == nil then "" else p47.game_pass_id
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1417 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1418, var1419 = protoModule.writeTag(buff, var1417, 1, protoModule.wireTypes.lengthDelimited)
		var1418, var2187 = protoModule.writeString(var1418, var1419, self.game_pass_id)
		buff = var1418
		var1417 = var1419
	end
	local buff_1 = buffer.create(var1417)
	buffer.copy(buff_1, 0, buff, 0, var1417)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref)
	local var1417 = t_47.new()
	local var1418 = 0
	while var1418 < buffer.len(p47) do
		local _ = nil
		local var1419 = nil
		local var1420, var1421, var1422 = protoModule.readTag(p47, var1418)
		local var1423 = var1420
		var1419 = var1421
		var1418 = var1422
		
		if var1419 == protoModule.wireTypes.varint then
			local _ = nil
			local var1424, var1425 = protoModule.readVarInt(p47, var1418)
			local _ = var1424
			var1418 = var1425
			continue
		end
		if var1419 == protoModule.wireTypes.lengthDelimited then
			if var1423 == 1 then
				local _ = nil
				local var1426, var1427 = protoModule.readBuffer(p47, var1418)
				var1418 = var1427
				var1417.game_pass_id = buffer.tostring(var1426)
			else
				local _ = nil
				local var1428, var1429 = protoModule.readVarInt(p47, var1418)
				var1418 = var1429 + var1428
			end
		elseif var1419 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1430, var1431 = protoModule.readFixed32(p47, var1418)
			local _ = var1430
			var1418 = var1431
		elseif var1419 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1432, var1433 = protoModule.readFixed64(p47, var1418)
			local _ = var1432
			var1418 = var1433
		else
			error("Unsupported wire type: " .. var1419)
		end
	end
	return var1417
end

function t_47:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_47:jsonDecode()
	-- upvalues: t_47 (ref)
	local var1434 = t_47.new()
	
	if self.game_pass_id ~= nil then
		var1434.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1434.game_pass_id = self.gamePassId
	end
	return var1434
end

t_47.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_47
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		developer_products = if p48 == nil or p48.developer_products == nil then {} else p48.developer_products
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1434 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1435 = v:encode()
			local var1436, var1437 = protoModule.writeTag(buff, var1434, 1, protoModule.wireTypes.lengthDelimited)
			var1436, var2212 = protoModule.writeBuffer(var1436, var1437, var1435, buffer.len(var1435))
			buff = var1436
			var1434 = var1437
		end
	end
	local buff_1 = buffer.create(var1434)
	buffer.copy(buff_1, 0, buff, 0, var1434)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1438 = t_48.new()
	local var1439 = 0
	while var1439 < buffer.len(p48) do
		local _ = nil
		local var1440 = nil
		local var1441, var1442, var1443 = protoModule.readTag(p48, var1439)
		local var1444 = var1441
		var1440 = var1442
		var1439 = var1443
		
		if var1440 == protoModule.wireTypes.varint then
			local _ = nil
			local var1445, var1446 = protoModule.readVarInt(p48, var1439)
			local _ = var1445
			var1439 = var1446
			continue
		end
		if var1440 == protoModule.wireTypes.lengthDelimited then
			if var1444 == 1 then
				local _ = nil
				local var1447, var1448 = protoModule.readBuffer(p48, var1439)
				var1439 = var1448
				table.insert(var1438.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1447))
			else
				local _ = nil
				local var1449, var1450 = protoModule.readVarInt(p48, var1439)
				var1439 = var1450 + var1449
			end
		elseif var1440 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1451, var1452 = protoModule.readFixed32(p48, var1439)
			local _ = var1451
			var1439 = var1452
		elseif var1440 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1453, var1454 = protoModule.readFixed64(p48, var1439)
			local _ = var1453
			var1439 = var1454
		else
			error("Unsupported wire type: " .. var1440)
		end
	end
	return var1438
end

function t_48:jsonEncode()
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

function t_48:jsonDecode()
	-- upvalues: t_48 (ref), t (ref)
	local var1455 = t_48.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1455.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1455.developer_products = t_1
	end
	return var1455
end

t_48.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_48
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		developer_product_id = if p49 == nil or p49.developer_product_id == nil then "" else p49.developer_product_id
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1456 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1457, var1458 = protoModule.writeTag(buff, var1456, 1, protoModule.wireTypes.lengthDelimited)
		var1457, var2239 = protoModule.writeString(var1457, var1458, self.developer_product_id)
		buff = var1457
		var1456 = var1458
	end
	local buff_1 = buffer.create(var1456)
	buffer.copy(buff_1, 0, buff, 0, var1456)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref)
	local var1456 = t_49.new()
	local var1457 = 0
	while var1457 < buffer.len(p49) do
		local _ = nil
		local var1458 = nil
		local var1459, var1460, var1461 = protoModule.readTag(p49, var1457)
		local var1462 = var1459
		var1458 = var1460
		var1457 = var1461
		
		if var1458 == protoModule.wireTypes.varint then
			local _ = nil
			local var1463, var1464 = protoModule.readVarInt(p49, var1457)
			local _ = var1463
			var1457 = var1464
			continue
		end
		if var1458 == protoModule.wireTypes.lengthDelimited then
			if var1462 == 1 then
				local _ = nil
				local var1465, var1466 = protoModule.readBuffer(p49, var1457)
				var1457 = var1466
				var1456.developer_product_id = buffer.tostring(var1465)
			else
				local _ = nil
				local var1467, var1468 = protoModule.readVarInt(p49, var1457)
				var1457 = var1468 + var1467
			end
		elseif var1458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1469, var1470 = protoModule.readFixed32(p49, var1457)
			local _ = var1469
			var1457 = var1470
		elseif var1458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1471, var1472 = protoModule.readFixed64(p49, var1457)
			local _ = var1471
			var1457 = var1472
		else
			error("Unsupported wire type: " .. var1458)
		end
	end
	return var1456
end

function t_49:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_49:jsonDecode()
	-- upvalues: t_49 (ref)
	local var1473 = t_49.new()
	
	if self.developer_product_id ~= nil then
		var1473.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1473.developer_product_id = self.developerProductId
	end
	return var1473
end

t_49.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_49
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t_50 (ref)
	return setmetatable({
		subscriptions = if p50 == nil or p50.subscriptions == nil then {} else p50.subscriptions
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1473 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1474 = v:encode()
			local var1475, var1476 = protoModule.writeTag(buff, var1473, 1, protoModule.wireTypes.lengthDelimited)
			var1475, var2264 = protoModule.writeBuffer(var1475, var1476, var1474, buffer.len(var1474))
			buff = var1475
			var1473 = var1476
		end
	end
	local buff_1 = buffer.create(var1473)
	buffer.copy(buff_1, 0, buff, 0, var1473)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1477 = t_50.new()
	local var1478 = 0
	while var1478 < buffer.len(p50) do
		local _ = nil
		local var1479 = nil
		local var1480, var1481, var1482 = protoModule.readTag(p50, var1478)
		local var1483 = var1480
		var1479 = var1481
		var1478 = var1482
		
		if var1479 == protoModule.wireTypes.varint then
			local _ = nil
			local var1484, var1485 = protoModule.readVarInt(p50, var1478)
			local _ = var1484
			var1478 = var1485
			continue
		end
		if var1479 == protoModule.wireTypes.lengthDelimited then
			if var1483 == 1 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p50, var1478)
				var1478 = var1487
				table.insert(var1477.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1486))
			else
				local _ = nil
				local var1488, var1489 = protoModule.readVarInt(p50, var1478)
				var1478 = var1489 + var1488
			end
		elseif var1479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1490, var1491 = protoModule.readFixed32(p50, var1478)
			local _ = var1490
			var1478 = var1491
		elseif var1479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed64(p50, var1478)
			local _ = var1492
			var1478 = var1493
		else
			error("Unsupported wire type: " .. var1479)
		end
	end
	return var1477
end

function t_50:jsonEncode()
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

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), t (ref)
	local var1494 = t_50.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1494.subscriptions = t_1
	end
	return var1494
end

t_50.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_50
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		subscription_id = if p51 == nil or p51.subscription_id == nil then "" else p51.subscription_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1495 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1496, var1497 = protoModule.writeTag(buff, var1495, 1, protoModule.wireTypes.lengthDelimited)
		var1496, var2290 = protoModule.writeString(var1496, var1497, self.subscription_id)
		buff = var1496
		var1495 = var1497
	end
	local buff_1 = buffer.create(var1495)
	buffer.copy(buff_1, 0, buff, 0, var1495)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1495 = t_51.new()
	local var1496 = 0
	while var1496 < buffer.len(p51) do
		local _ = nil
		local var1497 = nil
		local var1498, var1499, var1500 = protoModule.readTag(p51, var1496)
		local var1501 = var1498
		var1497 = var1499
		var1496 = var1500
		
		if var1497 == protoModule.wireTypes.varint then
			local _ = nil
			local var1502, var1503 = protoModule.readVarInt(p51, var1496)
			local _ = var1502
			var1496 = var1503
			continue
		end
		if var1497 == protoModule.wireTypes.lengthDelimited then
			if var1501 == 1 then
				local _ = nil
				local var1504, var1505 = protoModule.readBuffer(p51, var1496)
				var1496 = var1505
				var1495.subscription_id = buffer.tostring(var1504)
			else
				local _ = nil
				local var1506, var1507 = protoModule.readVarInt(p51, var1496)
				var1496 = var1507 + var1506
			end
		elseif var1497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1508, var1509 = protoModule.readFixed32(p51, var1496)
			local _ = var1508
			var1496 = var1509
		elseif var1497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1510, var1511 = protoModule.readFixed64(p51, var1496)
			local _ = var1510
			var1496 = var1511
		else
			error("Unsupported wire type: " .. var1497)
		end
	end
	return var1495
end

function t_51:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_51:jsonDecode()
	-- upvalues: t_51 (ref)
	local var1512 = t_51.new()
	
	if self.subscription_id ~= nil then
		var1512.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1512.subscription_id = self.subscriptionId
	end
	return var1512
end

t_51.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_51
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t_52 (ref)
	return setmetatable({
		items = if p52 == nil or p52.items == nil then {} else p52.items,
		universe_id = if p52 == nil or p52.universe_id == nil then "" else p52.universe_id,
		section_title = if p52 == nil or p52.section_title == nil then "" else p52.section_title,
		creator_key = if p52 == nil or p52.creator_key == nil then "" else p52.creator_key,
		collection_item_size = if p52 == nil or p52.collection_item_size == nil then "" else p52.collection_item_size,
		item_height_mode = if p52 == nil or p52.item_height_mode == nil then "" else p52.item_height_mode,
		experience_store_product_type = if p52 == nil or p52.experience_store_product_type == nil then "" else p52.experience_store_product_type,
		content_type = if p52 == nil or p52.content_type == nil then "" else p52.content_type,
		item_type = if p52 == nil or p52.item_type == nil then "" else p52.item_type,
		filter_category_id = if p52 == nil or p52.filter_category_id == nil then "" else p52.filter_category_id
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1512 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1513 = v:encode()
			local var1514, var1515 = protoModule.writeTag(buff, var1512, 1, protoModule.wireTypes.lengthDelimited)
			var1514, var2315 = protoModule.writeBuffer(var1514, var1515, var1513, buffer.len(var1513))
			buff = var1514
			var1512 = var1515
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1512, 2, protoModule.wireTypes.lengthDelimited)
		var1516, var2317 = protoModule.writeString(var1516, var1517, self.universe_id)
		buff = var1516
		var1512 = var1517
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1512, 3, protoModule.wireTypes.lengthDelimited)
		var1518, var2319 = protoModule.writeString(var1518, var1519, self.section_title)
		buff = var1518
		var1512 = var1519
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1512, 4, protoModule.wireTypes.lengthDelimited)
		var1520, var2321 = protoModule.writeString(var1520, var1521, self.creator_key)
		buff = var1520
		var1512 = var1521
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1522, var1523 = protoModule.writeTag(buff, var1512, 5, protoModule.wireTypes.lengthDelimited)
		var1522, var2323 = protoModule.writeString(var1522, var1523, self.collection_item_size)
		buff = var1522
		var1512 = var1523
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1524, var1525 = protoModule.writeTag(buff, var1512, 6, protoModule.wireTypes.lengthDelimited)
		var1524, var2325 = protoModule.writeString(var1524, var1525, self.item_height_mode)
		buff = var1524
		var1512 = var1525
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1526, var1527 = protoModule.writeTag(buff, var1512, 7, protoModule.wireTypes.lengthDelimited)
		var1526, var2327 = protoModule.writeString(var1526, var1527, self.experience_store_product_type)
		buff = var1526
		var1512 = var1527
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1528, var1529 = protoModule.writeTag(buff, var1512, 8, protoModule.wireTypes.lengthDelimited)
		var1528, var2329 = protoModule.writeString(var1528, var1529, self.content_type)
		buff = var1528
		var1512 = var1529
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1530, var1531 = protoModule.writeTag(buff, var1512, 9, protoModule.wireTypes.lengthDelimited)
		var1530, var2331 = protoModule.writeString(var1530, var1531, self.item_type)
		buff = var1530
		var1512 = var1531
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1532, var1533 = protoModule.writeTag(buff, var1512, 10, protoModule.wireTypes.lengthDelimited)
		var1532, var2333 = protoModule.writeString(var1532, var1533, self.filter_category_id)
		buff = var1532
		var1512 = var1533
	end
	local buff_1 = buffer.create(var1512)
	buffer.copy(buff_1, 0, buff, 0, var1512)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1534 = t_52.new()
	local var1535 = 0
	while var1535 < buffer.len(p52) do
		local _ = nil
		local var1536 = nil
		local var1537, var1538, var1539 = protoModule.readTag(p52, var1535)
		local var1540 = var1537
		var1536 = var1538
		var1535 = var1539
		
		if var1536 == protoModule.wireTypes.varint then
			local _ = nil
			local var1541, var1542 = protoModule.readVarInt(p52, var1535)
			local _ = var1541
			var1535 = var1542
			continue
		end
		if var1536 == protoModule.wireTypes.lengthDelimited then
			if var1540 == 1 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p52, var1535)
				var1535 = var1544
				table.insert(var1534.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1543))
			elseif var1540 == 2 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p52, var1535)
				var1535 = var1546
				var1534.universe_id = buffer.tostring(var1545)
			elseif var1540 == 3 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p52, var1535)
				var1535 = var1548
				var1534.section_title = buffer.tostring(var1547)
			elseif var1540 == 4 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p52, var1535)
				var1535 = var1550
				var1534.creator_key = buffer.tostring(var1549)
			elseif var1540 == 5 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p52, var1535)
				var1535 = var1552
				var1534.collection_item_size = buffer.tostring(var1551)
			elseif var1540 == 6 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p52, var1535)
				var1535 = var1554
				var1534.item_height_mode = buffer.tostring(var1553)
			elseif var1540 == 7 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p52, var1535)
				var1535 = var1556
				var1534.experience_store_product_type = buffer.tostring(var1555)
			elseif var1540 == 8 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p52, var1535)
				var1535 = var1558
				var1534.content_type = buffer.tostring(var1557)
			elseif var1540 == 9 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p52, var1535)
				var1535 = var1560
				var1534.item_type = buffer.tostring(var1559)
			elseif var1540 == 10 then
				local _ = nil
				local var1561, var1562 = protoModule.readBuffer(p52, var1535)
				var1535 = var1562
				var1534.filter_category_id = buffer.tostring(var1561)
			else
				local _ = nil
				local var1563, var1564 = protoModule.readVarInt(p52, var1535)
				var1535 = var1564 + var1563
			end
		elseif var1536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1565, var1566 = protoModule.readFixed32(p52, var1535)
			local _ = var1565
			var1535 = var1566
		elseif var1536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1567, var1568 = protoModule.readFixed64(p52, var1535)
			local _ = var1567
			var1535 = var1568
		else
			error("Unsupported wire type: " .. var1536)
		end
	end
	return var1534
end

function t_52:jsonEncode()
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

function t_52:jsonDecode()
	-- upvalues: t_52 (ref), t (ref)
	local var1569 = t_52.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1569.items = t_1
	end
	if self.universe_id ~= nil then
		var1569.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1569.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1569.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1569.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1569.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1569.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1569.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1569.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1569.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1569.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1569.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1569.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1569.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1569.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1569.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1569.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1569.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1569.filter_category_id = self.filterCategoryId
	end
	return var1569
end

t_52.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_52
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t (ref), t_53 (ref)
	return setmetatable({
		item_id = if p53 == nil or p53.item_id == nil then "" else p53.item_id,
		identifier = if p53 == nil or p53.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p53.identifier
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1570 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1571, var1572 = protoModule.writeTag(buff, var1570, 1, protoModule.wireTypes.lengthDelimited)
		var1571, var2377 = protoModule.writeString(var1571, var1572, self.item_id)
		buff = var1571
		var1570 = var1572
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1573, var1574 = protoModule.writeTag(buff, var1570, 2, protoModule.wireTypes.varint)
		var1573, var2379 = protoModule.writeVarInt(var1573, var1574, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1573
		var1570 = var1574
	end
	local buff_1 = buffer.create(var1570)
	buffer.copy(buff_1, 0, buff, 0, var1570)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1570 = t_53.new()
	local var1571 = 0
	while var1571 < buffer.len(p53) do
		local _ = nil
		local var1572 = nil
		local var1573, var1574, var1575 = protoModule.readTag(p53, var1571)
		local var1576 = var1573
		var1572 = var1574
		var1571 = var1575
		
		if var1572 == protoModule.wireTypes.varint then
			if var1576 == 2 then
				local _ = nil
				local var1577, var1578 = protoModule.readVarIntI32(p53, var1571)
				local var1579 = var1577
				var1571 = var1578
				var1570.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1579) or var1579
			else
				local _ = nil
				local var1580, var1581 = protoModule.readVarInt(p53, var1571)
				local _ = var1580
				var1571 = var1581
			end
		end
		if var1572 == protoModule.wireTypes.lengthDelimited then
			if var1576 == 1 then
				local _ = nil
				local var1582, var1583 = protoModule.readBuffer(p53, var1571)
				var1571 = var1583
				var1570.item_id = buffer.tostring(var1582)
			else
				local _ = nil
				local var1584, var1585 = protoModule.readVarInt(p53, var1571)
				var1571 = var1585 + var1584
			end
		elseif var1572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1586, var1587 = protoModule.readFixed32(p53, var1571)
			local _ = var1586
			var1571 = var1587
		elseif var1572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1588, var1589 = protoModule.readFixed64(p53, var1571)
			local _ = var1588
			var1571 = var1589
		else
			error("Unsupported wire type: " .. var1572)
		end
	end
	return var1570
end

function t_53:jsonEncode()
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

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), t (ref)
	local var1590 = t_53.new()
	
	if self.item_id ~= nil then
		var1590.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1590.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1590.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1590
end

t_53.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_53
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p54)
		return if p54 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p54 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p54 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p54 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p54)
		return if p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p54
	end,
	fromName = function(p54)
		return if p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p54 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t_54 (ref)
	return setmetatable({
		roblox_component = if p54 == nil or p54.roblox_component == nil then "" else p54.roblox_component,
		identifier = if p54 == nil or p54.identifier == nil then "" else p54.identifier,
		title = if p54 == nil or p54.title == nil then "" else p54.title,
		user_id = if p54 == nil or p54.user_id == nil then "" else p54.user_id,
		description = if p54 == nil or p54.description == nil then "" else p54.description,
		cta_text = if p54 == nil or p54.cta_text == nil then "" else p54.cta_text,
		prompt_id = if p54 == nil or p54.prompt_id == nil then "" else p54.prompt_id,
		prompt_type = if p54 == nil or p54.prompt_type == nil then "" else p54.prompt_type,
		entity_id = if p54 == nil or p54.entity_id == nil then "" else p54.entity_id
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1590 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1591, var1592 = protoModule.writeTag(buff, var1590, 1, protoModule.wireTypes.lengthDelimited)
		var1591, var2406 = protoModule.writeString(var1591, var1592, self.roblox_component)
		buff = var1591
		var1590 = var1592
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1593, var1594 = protoModule.writeTag(buff, var1590, 2, protoModule.wireTypes.lengthDelimited)
		var1593, var2408 = protoModule.writeString(var1593, var1594, self.identifier)
		buff = var1593
		var1590 = var1594
	end
	if self.title ~= nil and self.title ~= "" then
		local var1595, var1596 = protoModule.writeTag(buff, var1590, 3, protoModule.wireTypes.lengthDelimited)
		var1595, var2410 = protoModule.writeString(var1595, var1596, self.title)
		buff = var1595
		var1590 = var1596
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1597, var1598 = protoModule.writeTag(buff, var1590, 4, protoModule.wireTypes.lengthDelimited)
		var1597, var2412 = protoModule.writeString(var1597, var1598, self.user_id)
		buff = var1597
		var1590 = var1598
	end
	if self.description ~= nil and self.description ~= "" then
		local var1599, var1600 = protoModule.writeTag(buff, var1590, 5, protoModule.wireTypes.lengthDelimited)
		var1599, var2414 = protoModule.writeString(var1599, var1600, self.description)
		buff = var1599
		var1590 = var1600
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1601, var1602 = protoModule.writeTag(buff, var1590, 6, protoModule.wireTypes.lengthDelimited)
		var1601, var2416 = protoModule.writeString(var1601, var1602, self.cta_text)
		buff = var1601
		var1590 = var1602
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1603, var1604 = protoModule.writeTag(buff, var1590, 7, protoModule.wireTypes.lengthDelimited)
		var1603, var2418 = protoModule.writeString(var1603, var1604, self.prompt_id)
		buff = var1603
		var1590 = var1604
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1605, var1606 = protoModule.writeTag(buff, var1590, 8, protoModule.wireTypes.lengthDelimited)
		var1605, var2420 = protoModule.writeString(var1605, var1606, self.prompt_type)
		buff = var1605
		var1590 = var1606
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1607, var1608 = protoModule.writeTag(buff, var1590, 9, protoModule.wireTypes.lengthDelimited)
		var1607, var2422 = protoModule.writeString(var1607, var1608, self.entity_id)
		buff = var1607
		var1590 = var1608
	end
	local buff_1 = buffer.create(var1590)
	buffer.copy(buff_1, 0, buff, 0, var1590)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1590 = t_54.new()
	local var1591 = 0
	while var1591 < buffer.len(p54) do
		local _ = nil
		local var1592 = nil
		local var1593, var1594, var1595 = protoModule.readTag(p54, var1591)
		local var1596 = var1593
		var1592 = var1594
		var1591 = var1595
		
		if var1592 == protoModule.wireTypes.varint then
			local _ = nil
			local var1597, var1598 = protoModule.readVarInt(p54, var1591)
			local _ = var1597
			var1591 = var1598
			continue
		end
		if var1592 == protoModule.wireTypes.lengthDelimited then
			if var1596 == 1 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p54, var1591)
				var1591 = var1600
				var1590.roblox_component = buffer.tostring(var1599)
			elseif var1596 == 2 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p54, var1591)
				var1591 = var1602
				var1590.identifier = buffer.tostring(var1601)
			elseif var1596 == 3 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p54, var1591)
				var1591 = var1604
				var1590.title = buffer.tostring(var1603)
			elseif var1596 == 4 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p54, var1591)
				var1591 = var1606
				var1590.user_id = buffer.tostring(var1605)
			elseif var1596 == 5 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p54, var1591)
				var1591 = var1608
				var1590.description = buffer.tostring(var1607)
			elseif var1596 == 6 then
				local _ = nil
				local var1609, var1610 = protoModule.readBuffer(p54, var1591)
				var1591 = var1610
				var1590.cta_text = buffer.tostring(var1609)
			elseif var1596 == 7 then
				local _ = nil
				local var1611, var1612 = protoModule.readBuffer(p54, var1591)
				var1591 = var1612
				var1590.prompt_id = buffer.tostring(var1611)
			elseif var1596 == 8 then
				local _ = nil
				local var1613, var1614 = protoModule.readBuffer(p54, var1591)
				var1591 = var1614
				var1590.prompt_type = buffer.tostring(var1613)
			elseif var1596 == 9 then
				local _ = nil
				local var1615, var1616 = protoModule.readBuffer(p54, var1591)
				var1591 = var1616
				var1590.entity_id = buffer.tostring(var1615)
			else
				local _ = nil
				local var1617, var1618 = protoModule.readVarInt(p54, var1591)
				var1591 = var1618 + var1617
			end
		elseif var1592 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1619, var1620 = protoModule.readFixed32(p54, var1591)
			local _ = var1619
			var1591 = var1620
		elseif var1592 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1621, var1622 = protoModule.readFixed64(p54, var1591)
			local _ = var1621
			var1591 = var1622
		else
			error("Unsupported wire type: " .. var1592)
		end
	end
	return var1590
end

function t_54:jsonEncode()
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

function t_54:jsonDecode()
	-- upvalues: t_54 (ref)
	local var1623 = t_54.new()
	
	if self.roblox_component ~= nil then
		var1623.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1623.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1623.identifier = self.identifier
	end
	if self.title ~= nil then
		var1623.title = self.title
	end
	if self.user_id ~= nil then
		var1623.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1623.user_id = self.userId
	end
	if self.description ~= nil then
		var1623.description = self.description
	end
	if self.cta_text ~= nil then
		var1623.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1623.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1623.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1623.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1623.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1623.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1623.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1623.entity_id = self.entityId
	end
	return var1623
end

t_54.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_54
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		group_id = if p55 == nil or p55.group_id == nil then "" else p55.group_id,
		experience_id = if p55 == nil or p55.experience_id == nil then "" else p55.experience_id
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1623 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1624, var1625 = protoModule.writeTag(buff, var1623, 1, protoModule.wireTypes.lengthDelimited)
		var1624, var2462 = protoModule.writeString(var1624, var1625, self.group_id)
		buff = var1624
		var1623 = var1625
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1626, var1627 = protoModule.writeTag(buff, var1623, 2, protoModule.wireTypes.lengthDelimited)
		var1626, var2464 = protoModule.writeString(var1626, var1627, self.experience_id)
		buff = var1626
		var1623 = var1627
	end
	local buff_1 = buffer.create(var1623)
	buffer.copy(buff_1, 0, buff, 0, var1623)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1623 = t_55.new()
	local var1624 = 0
	while var1624 < buffer.len(p55) do
		local _ = nil
		local var1625 = nil
		local var1626, var1627, var1628 = protoModule.readTag(p55, var1624)
		local var1629 = var1626
		var1625 = var1627
		var1624 = var1628
		
		if var1625 == protoModule.wireTypes.varint then
			local _ = nil
			local var1630, var1631 = protoModule.readVarInt(p55, var1624)
			local _ = var1630
			var1624 = var1631
			continue
		end
		if var1625 == protoModule.wireTypes.lengthDelimited then
			if var1629 == 1 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p55, var1624)
				var1624 = var1633
				var1623.group_id = buffer.tostring(var1632)
			elseif var1629 == 2 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p55, var1624)
				var1624 = var1635
				var1623.experience_id = buffer.tostring(var1634)
			else
				local _ = nil
				local var1636, var1637 = protoModule.readVarInt(p55, var1624)
				var1624 = var1637 + var1636
			end
		elseif var1625 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1638, var1639 = protoModule.readFixed32(p55, var1624)
			local _ = var1638
			var1624 = var1639
		elseif var1625 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1640, var1641 = protoModule.readFixed64(p55, var1624)
			local _ = var1640
			var1624 = var1641
		else
			error("Unsupported wire type: " .. var1625)
		end
	end
	return var1623
end

function t_55:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_55:jsonDecode()
	-- upvalues: t_55 (ref)
	local var1642 = t_55.new()
	
	if self.group_id ~= nil then
		var1642.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1642.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1642.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1642.experience_id = self.experienceId
	end
	return var1642
end

t_55.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_55
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		title = if p56 == nil or p56.title == nil then "" else p56.title,
		dismiss_text = if p56 == nil or p56.dismiss_text == nil then "" else p56.dismiss_text,
		user_id = if p56 == nil or p56.user_id == nil then "" else p56.user_id,
		cards = if p56 == nil or p56.cards == nil then {} else p56.cards,
		prompt_id = if p56 == nil or p56.prompt_id == nil then "" else p56.prompt_id,
		prompt_type = if p56 == nil or p56.prompt_type == nil then "" else p56.prompt_type,
		sort_id = if p56 == nil or p56.sort_id == nil then "" else p56.sort_id,
		feed_item_key = if p56 == nil or p56.feed_item_key == nil then "" else p56.feed_item_key,
		client_attributes = if p56 == nil or p56.client_attributes == nil then nil else p56.client_attributes
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1642 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1643, var1644 = protoModule.writeTag(buff, var1642, 1, protoModule.wireTypes.lengthDelimited)
		var1643, var2490 = protoModule.writeString(var1643, var1644, self.title)
		buff = var1643
		var1642 = var1644
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1645, var1646 = protoModule.writeTag(buff, var1642, 2, protoModule.wireTypes.lengthDelimited)
		var1645, var2492 = protoModule.writeString(var1645, var1646, self.dismiss_text)
		buff = var1645
		var1642 = var1646
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1647, var1648 = protoModule.writeTag(buff, var1642, 3, protoModule.wireTypes.lengthDelimited)
		var1647, var2494 = protoModule.writeString(var1647, var1648, self.user_id)
		buff = var1647
		var1642 = var1648
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1649 = v:encode()
			local var1650, var1651 = protoModule.writeTag(buff, var1642, 4, protoModule.wireTypes.lengthDelimited)
			var1650, var2497 = protoModule.writeBuffer(var1650, var1651, var1649, buffer.len(var1649))
			buff = var1650
			var1642 = var1651
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1642, 5, protoModule.wireTypes.lengthDelimited)
		var1652, var2499 = protoModule.writeString(var1652, var1653, self.prompt_id)
		buff = var1652
		var1642 = var1653
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1642, 6, protoModule.wireTypes.lengthDelimited)
		var1654, var2501 = protoModule.writeString(var1654, var1655, self.prompt_type)
		buff = var1654
		var1642 = var1655
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1656, var1657 = protoModule.writeTag(buff, var1642, 7, protoModule.wireTypes.lengthDelimited)
		var1656, var2503 = protoModule.writeString(var1656, var1657, self.sort_id)
		buff = var1656
		var1642 = var1657
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1658, var1659 = protoModule.writeTag(buff, var1642, 8, protoModule.wireTypes.lengthDelimited)
		var1658, var2505 = protoModule.writeString(var1658, var1659, self.feed_item_key)
		buff = var1658
		var1642 = var1659
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1660 = self.client_attributes.value:encode()
		local var1661, var1662 = protoModule.writeTag(buff, var1642, 9, protoModule.wireTypes.lengthDelimited)
		var1661, var2508 = protoModule.writeBuffer(var1661, var1662, var1660, buffer.len(var1660))
		buff = var1661
		var1642 = var1662
	end
	local buff_1 = buffer.create(var1642)
	buffer.copy(buff_1, 0, buff, 0, var1642)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1663 = t_56.new()
	local var1664 = 0
	while var1664 < buffer.len(p56) do
		local _ = nil
		local var1665 = nil
		local var1666, var1667, var1668 = protoModule.readTag(p56, var1664)
		local var1669 = var1666
		var1665 = var1667
		var1664 = var1668
		
		if var1665 == protoModule.wireTypes.varint then
			local _ = nil
			local var1670, var1671 = protoModule.readVarInt(p56, var1664)
			local _ = var1670
			var1664 = var1671
			continue
		end
		if var1665 == protoModule.wireTypes.lengthDelimited then
			if var1669 == 1 then
				local _ = nil
				local var1672, var1673 = protoModule.readBuffer(p56, var1664)
				var1664 = var1673
				var1663.title = buffer.tostring(var1672)
			elseif var1669 == 2 then
				local _ = nil
				local var1674, var1675 = protoModule.readBuffer(p56, var1664)
				var1664 = var1675
				var1663.dismiss_text = buffer.tostring(var1674)
			elseif var1669 == 3 then
				local _ = nil
				local var1676, var1677 = protoModule.readBuffer(p56, var1664)
				var1664 = var1677
				var1663.user_id = buffer.tostring(var1676)
			elseif var1669 == 4 then
				local _ = nil
				local var1678, var1679 = protoModule.readBuffer(p56, var1664)
				var1664 = var1679
				table.insert(var1663.cards, t.CardContainerCardInputData.decode(var1678))
			elseif var1669 == 5 then
				local _ = nil
				local var1680, var1681 = protoModule.readBuffer(p56, var1664)
				var1664 = var1681
				var1663.prompt_id = buffer.tostring(var1680)
			elseif var1669 == 6 then
				local _ = nil
				local var1682, var1683 = protoModule.readBuffer(p56, var1664)
				var1664 = var1683
				var1663.prompt_type = buffer.tostring(var1682)
			elseif var1669 == 7 then
				local _ = nil
				local var1684, var1685 = protoModule.readBuffer(p56, var1664)
				var1664 = var1685
				var1663.sort_id = buffer.tostring(var1684)
			elseif var1669 == 8 then
				local _ = nil
				local var1686, var1687 = protoModule.readBuffer(p56, var1664)
				var1664 = var1687
				var1663.feed_item_key = buffer.tostring(var1686)
			elseif var1669 == 9 then
				local _ = nil
				local var1688, var1689 = protoModule.readBuffer(p56, var1664)
				var1664 = var1689
				var1663.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1688)
				}
			else
				local _ = nil
				local var1690, var1691 = protoModule.readVarInt(p56, var1664)
				var1664 = var1691 + var1690
			end
		elseif var1665 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1692, var1693 = protoModule.readFixed32(p56, var1664)
			local _ = var1692
			var1664 = var1693
		elseif var1665 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1694, var1695 = protoModule.readFixed64(p56, var1664)
			local _ = var1694
			var1664 = var1695
		else
			error("Unsupported wire type: " .. var1665)
		end
	end
	return var1663
end

function t_56:jsonEncode()
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

function t_56:jsonDecode()
	-- upvalues: t_56 (ref), t (ref)
	local var1696 = t_56.new()
	
	if self.title ~= nil then
		var1696.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1696.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1696.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1696.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1696.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1696.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1696.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1696.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1696.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1696.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1696.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1696.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1696.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1696.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1696.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1696.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1696
end

t_56.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_56
typeRegistryModule.default:register(t.CardContainerInputData)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		title = if p57 == nil or p57.title == nil then "" else p57.title,
		user_id = if p57 == nil or p57.user_id == nil then "" else p57.user_id,
		description = if p57 == nil or p57.description == nil then "" else p57.description,
		cta_text = if p57 == nil or p57.cta_text == nil then "" else p57.cta_text,
		prompt_id = if p57 == nil or p57.prompt_id == nil then "" else p57.prompt_id,
		prompt_type = if p57 == nil or p57.prompt_type == nil then "" else p57.prompt_type,
		entity_id = if p57 == nil or p57.entity_id == nil then "" else p57.entity_id
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1697 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1697, 1, protoModule.wireTypes.lengthDelimited)
		var1698, var2550 = protoModule.writeString(var1698, var1699, self.title)
		buff = var1698
		var1697 = var1699
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1697, 2, protoModule.wireTypes.lengthDelimited)
		var1700, var2552 = protoModule.writeString(var1700, var1701, self.user_id)
		buff = var1700
		var1697 = var1701
	end
	if self.description ~= nil and self.description ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1697, 3, protoModule.wireTypes.lengthDelimited)
		var1702, var2554 = protoModule.writeString(var1702, var1703, self.description)
		buff = var1702
		var1697 = var1703
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1704, var1705 = protoModule.writeTag(buff, var1697, 4, protoModule.wireTypes.lengthDelimited)
		var1704, var2556 = protoModule.writeString(var1704, var1705, self.cta_text)
		buff = var1704
		var1697 = var1705
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1706, var1707 = protoModule.writeTag(buff, var1697, 5, protoModule.wireTypes.lengthDelimited)
		var1706, var2558 = protoModule.writeString(var1706, var1707, self.prompt_id)
		buff = var1706
		var1697 = var1707
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1708, var1709 = protoModule.writeTag(buff, var1697, 6, protoModule.wireTypes.lengthDelimited)
		var1708, var2560 = protoModule.writeString(var1708, var1709, self.prompt_type)
		buff = var1708
		var1697 = var1709
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1710, var1711 = protoModule.writeTag(buff, var1697, 7, protoModule.wireTypes.lengthDelimited)
		var1710, var2562 = protoModule.writeString(var1710, var1711, self.entity_id)
		buff = var1710
		var1697 = var1711
	end
	local buff_1 = buffer.create(var1697)
	buffer.copy(buff_1, 0, buff, 0, var1697)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1697 = t_57.new()
	local var1698 = 0
	while var1698 < buffer.len(p57) do
		local _ = nil
		local var1699 = nil
		local var1700, var1701, var1702 = protoModule.readTag(p57, var1698)
		local var1703 = var1700
		var1699 = var1701
		var1698 = var1702
		
		if var1699 == protoModule.wireTypes.varint then
			local _ = nil
			local var1704, var1705 = protoModule.readVarInt(p57, var1698)
			local _ = var1704
			var1698 = var1705
			continue
		end
		if var1699 == protoModule.wireTypes.lengthDelimited then
			if var1703 == 1 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p57, var1698)
				var1698 = var1707
				var1697.title = buffer.tostring(var1706)
			elseif var1703 == 2 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p57, var1698)
				var1698 = var1709
				var1697.user_id = buffer.tostring(var1708)
			elseif var1703 == 3 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p57, var1698)
				var1698 = var1711
				var1697.description = buffer.tostring(var1710)
			elseif var1703 == 4 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p57, var1698)
				var1698 = var1713
				var1697.cta_text = buffer.tostring(var1712)
			elseif var1703 == 5 then
				local _ = nil
				local var1714, var1715 = protoModule.readBuffer(p57, var1698)
				var1698 = var1715
				var1697.prompt_id = buffer.tostring(var1714)
			elseif var1703 == 6 then
				local _ = nil
				local var1716, var1717 = protoModule.readBuffer(p57, var1698)
				var1698 = var1717
				var1697.prompt_type = buffer.tostring(var1716)
			elseif var1703 == 7 then
				local _ = nil
				local var1718, var1719 = protoModule.readBuffer(p57, var1698)
				var1698 = var1719
				var1697.entity_id = buffer.tostring(var1718)
			else
				local _ = nil
				local var1720, var1721 = protoModule.readVarInt(p57, var1698)
				var1698 = var1721 + var1720
			end
		elseif var1699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1722, var1723 = protoModule.readFixed32(p57, var1698)
			local _ = var1722
			var1698 = var1723
		elseif var1699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1724, var1725 = protoModule.readFixed64(p57, var1698)
			local _ = var1724
			var1698 = var1725
		else
			error("Unsupported wire type: " .. var1699)
		end
	end
	return var1697
end

function t_57:jsonEncode()
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

function t_57:jsonDecode()
	-- upvalues: t_57 (ref)
	local var1726 = t_57.new()
	
	if self.title ~= nil then
		var1726.title = self.title
	end
	if self.user_id ~= nil then
		var1726.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1726.user_id = self.userId
	end
	if self.description ~= nil then
		var1726.description = self.description
	end
	if self.cta_text ~= nil then
		var1726.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1726.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1726.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1726.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1726.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1726.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1726.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1726.entity_id = self.entityId
	end
	return var1726
end

t_57.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_57
typeRegistryModule.default:register(t.CardInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		prompt_id = if p58 == nil or p58.prompt_id == nil then "" else p58.prompt_id,
		prompt_type = if p58 == nil or p58.prompt_type == nil then "" else p58.prompt_type,
		user_id = if p58 == nil or p58.user_id == nil then "" else p58.user_id,
		audit_data = if p58 == nil or p58.audit_data == nil then "" else p58.audit_data
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1726 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1727, var1728 = protoModule.writeTag(buff, var1726, 1, protoModule.wireTypes.lengthDelimited)
		var1727, var2598 = protoModule.writeString(var1727, var1728, self.prompt_id)
		buff = var1727
		var1726 = var1728
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1726, 2, protoModule.wireTypes.lengthDelimited)
		var1729, var2600 = protoModule.writeString(var1729, var1730, self.prompt_type)
		buff = var1729
		var1726 = var1730
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1726, 3, protoModule.wireTypes.lengthDelimited)
		var1731, var2602 = protoModule.writeString(var1731, var1732, self.user_id)
		buff = var1731
		var1726 = var1732
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1726, 4, protoModule.wireTypes.lengthDelimited)
		var1733, var2604 = protoModule.writeString(var1733, var1734, self.audit_data)
		buff = var1733
		var1726 = var1734
	end
	local buff_1 = buffer.create(var1726)
	buffer.copy(buff_1, 0, buff, 0, var1726)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1726 = t_58.new()
	local var1727 = 0
	while var1727 < buffer.len(p58) do
		local _ = nil
		local var1728 = nil
		local var1729, var1730, var1731 = protoModule.readTag(p58, var1727)
		local var1732 = var1729
		var1728 = var1730
		var1727 = var1731
		
		if var1728 == protoModule.wireTypes.varint then
			local _ = nil
			local var1733, var1734 = protoModule.readVarInt(p58, var1727)
			local _ = var1733
			var1727 = var1734
			continue
		end
		if var1728 == protoModule.wireTypes.lengthDelimited then
			if var1732 == 1 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p58, var1727)
				var1727 = var1736
				var1726.prompt_id = buffer.tostring(var1735)
			elseif var1732 == 2 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p58, var1727)
				var1727 = var1738
				var1726.prompt_type = buffer.tostring(var1737)
			elseif var1732 == 3 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p58, var1727)
				var1727 = var1740
				var1726.user_id = buffer.tostring(var1739)
			elseif var1732 == 4 then
				local _ = nil
				local var1741, var1742 = protoModule.readBuffer(p58, var1727)
				var1727 = var1742
				var1726.audit_data = buffer.tostring(var1741)
			else
				local _ = nil
				local var1743, var1744 = protoModule.readVarInt(p58, var1727)
				var1727 = var1744 + var1743
			end
		elseif var1728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1745, var1746 = protoModule.readFixed32(p58, var1727)
			local _ = var1745
			var1727 = var1746
		elseif var1728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1747, var1748 = protoModule.readFixed64(p58, var1727)
			local _ = var1747
			var1727 = var1748
		else
			error("Unsupported wire type: " .. var1728)
		end
	end
	return var1726
end

function t_58:jsonEncode()
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

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var1749 = t_58.new()
	
	if self.prompt_id ~= nil then
		var1749.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1749.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1749.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1749.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1749.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1749.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1749.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1749.audit_data = self.auditData
	end
	return var1749
end

t_58.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_58
typeRegistryModule.default:register(t.DialogInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		sender_count = if p59 == nil or p59.sender_count == nil then 0 else p59.sender_count,
		total_robux_amount = if p59 == nil or p59.total_robux_amount == nil then 0 else p59.total_robux_amount
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1749 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1750, var1751 = protoModule.writeTag(buff, var1749, 1, protoModule.wireTypes.varint)
		var1750, var2634 = protoModule.writeVarInt(var1750, var1751, self.sender_count)
		buff = var1750
		var1749 = var1751
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1752, var1753 = protoModule.writeTag(buff, var1749, 2, protoModule.wireTypes.varint)
		var1752, var2636 = protoModule.writeVarInt(var1752, var1753, self.total_robux_amount)
		buff = var1752
		var1749 = var1753
	end
	local buff_1 = buffer.create(var1749)
	buffer.copy(buff_1, 0, buff, 0, var1749)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1749 = t_59.new()
	local var1750 = 0
	while var1750 < buffer.len(p59) do
		local _ = nil
		local _ = nil
		local var1751, var1752, var1753 = protoModule.readTag(p59, var1750)
		local var1754 = var1751
		local var1755 = var1752
		var1750 = var1753
		
		if var1755 == protoModule.wireTypes.varint then
			if var1754 == 1 then
				local _ = nil
				local var1756, var1757 = protoModule.readVarIntI32(p59, var1750)
				var1750 = var1757
				var1749.sender_count = var1756
			elseif var1754 == 2 then
				local _ = nil
				local var1758, var1759 = protoModule.readVarIntI64(p59, var1750)
				var1750 = var1759
				var1749.total_robux_amount = var1758
			else
				local _ = nil
				local var1760, var1761 = protoModule.readVarInt(p59, var1750)
				local _ = var1760
				var1750 = var1761
			end
		elseif var1755 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1762, var1763 = protoModule.readVarInt(p59, var1750)
			var1750 = var1763 + var1762
		elseif var1755 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1764, var1765 = protoModule.readFixed32(p59, var1750)
			local _ = var1764
			var1750 = var1765
		elseif var1755 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1766, var1767 = protoModule.readFixed64(p59, var1750)
			local _ = var1766
			var1750 = var1767
		else
			error("Unsupported wire type: " .. var1755)
		end
	end
	return var1749
end

function t_59:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_59:jsonDecode()
	-- upvalues: t_59 (ref)
	local var1768 = t_59.new()
	
	if self.sender_count ~= nil then
		var1768.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1768.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1768.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1768.total_robux_amount = self.totalRobuxAmount
	end
	return var1768
end

t_59.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_59
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		title = if p60 == nil or p60.title == nil then "" else p60.title,
		description = if p60 == nil or p60.description == nil then "" else p60.description,
		primary_text = if p60 == nil or p60.primary_text == nil then "" else p60.primary_text,
		secondary_text = if p60 == nil or p60.secondary_text == nil then "" else p60.secondary_text,
		prompt_id = if p60 == nil or p60.prompt_id == nil then "" else p60.prompt_id,
		prompt_type = if p60 == nil or p60.prompt_type == nil then "" else p60.prompt_type,
		times_seen = if p60 == nil or p60.times_seen == nil then 0 else p60.times_seen,
		content = if p60 == nil or p60.content == nil then nil else p60.content,
		sort_id = if p60 == nil or p60.sort_id == nil then nil else p60.sort_id
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1768 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1769, var1770 = protoModule.writeTag(buff, var1768, 1, protoModule.wireTypes.lengthDelimited)
		var1769, var2662 = protoModule.writeString(var1769, var1770, self.title)
		buff = var1769
		var1768 = var1770
	end
	if self.description ~= nil and self.description ~= "" then
		local var1771, var1772 = protoModule.writeTag(buff, var1768, 2, protoModule.wireTypes.lengthDelimited)
		var1771, var2664 = protoModule.writeString(var1771, var1772, self.description)
		buff = var1771
		var1768 = var1772
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1773, var1774 = protoModule.writeTag(buff, var1768, 3, protoModule.wireTypes.lengthDelimited)
		var1773, var2666 = protoModule.writeString(var1773, var1774, self.primary_text)
		buff = var1773
		var1768 = var1774
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1775, var1776 = protoModule.writeTag(buff, var1768, 4, protoModule.wireTypes.lengthDelimited)
		var1775, var2668 = protoModule.writeString(var1775, var1776, self.secondary_text)
		buff = var1775
		var1768 = var1776
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1777, var1778 = protoModule.writeTag(buff, var1768, 5, protoModule.wireTypes.lengthDelimited)
		var1777, var2670 = protoModule.writeString(var1777, var1778, self.prompt_id)
		buff = var1777
		var1768 = var1778
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1779, var1780 = protoModule.writeTag(buff, var1768, 6, protoModule.wireTypes.lengthDelimited)
		var1779, var2672 = protoModule.writeString(var1779, var1780, self.prompt_type)
		buff = var1779
		var1768 = var1780
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1781, var1782 = protoModule.writeTag(buff, var1768, 7, protoModule.wireTypes.varint)
		var1781, var2674 = protoModule.writeVarInt(var1781, var1782, self.times_seen)
		buff = var1781
		var1768 = var1782
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1783 = self.content.value:encode()
		local var1784, var1785 = protoModule.writeTag(buff, var1768, 8, protoModule.wireTypes.lengthDelimited)
		var1784, var2677 = protoModule.writeBuffer(var1784, var1785, var1783, buffer.len(var1783))
		buff = var1784
		var1768 = var1785
	end
	if self.sort_id ~= nil then
		local var1786, var1787 = protoModule.writeTag(buff, var1768, 9, protoModule.wireTypes.lengthDelimited)
		var1786, var2679 = protoModule.writeString(var1786, var1787, self.sort_id)
		buff = var1786
		var1768 = var1787
	end
	local buff_1 = buffer.create(var1768)
	buffer.copy(buff_1, 0, buff, 0, var1768)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1768 = t_60.new()
	local var1769 = 0
	while var1769 < buffer.len(p60) do
		local _ = nil
		local var1770 = nil
		local var1771, var1772, var1773 = protoModule.readTag(p60, var1769)
		local var1774 = var1771
		var1770 = var1772
		var1769 = var1773
		
		if var1770 == protoModule.wireTypes.varint then
			if var1774 == 7 then
				local _ = nil
				local var1775, var1776 = protoModule.readVarIntI32(p60, var1769)
				var1769 = var1776
				var1768.times_seen = var1775
			else
				local _ = nil
				local var1777, var1778 = protoModule.readVarInt(p60, var1769)
				local _ = var1777
				var1769 = var1778
			end
		end
		if var1770 == protoModule.wireTypes.lengthDelimited then
			if var1774 == 1 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p60, var1769)
				var1769 = var1780
				var1768.title = buffer.tostring(var1779)
			elseif var1774 == 2 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p60, var1769)
				var1769 = var1782
				var1768.description = buffer.tostring(var1781)
			elseif var1774 == 3 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p60, var1769)
				var1769 = var1784
				var1768.primary_text = buffer.tostring(var1783)
			elseif var1774 == 4 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p60, var1769)
				var1769 = var1786
				var1768.secondary_text = buffer.tostring(var1785)
			elseif var1774 == 5 then
				local _ = nil
				local var1787, var1788 = protoModule.readBuffer(p60, var1769)
				var1769 = var1788
				var1768.prompt_id = buffer.tostring(var1787)
			elseif var1774 == 6 then
				local _ = nil
				local var1789, var1790 = protoModule.readBuffer(p60, var1769)
				var1769 = var1790
				var1768.prompt_type = buffer.tostring(var1789)
			elseif var1774 == 8 then
				local _ = nil
				local var1791, var1792 = protoModule.readBuffer(p60, var1769)
				var1769 = var1792
				var1768.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1791)
				}
			elseif var1774 == 9 then
				local _ = nil
				local var1793, var1794 = protoModule.readBuffer(p60, var1769)
				var1769 = var1794
				var1768.sort_id = buffer.tostring(var1793)
			else
				local _ = nil
				local var1795, var1796 = protoModule.readVarInt(p60, var1769)
				var1769 = var1796 + var1795
			end
		elseif var1770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1797, var1798 = protoModule.readFixed32(p60, var1769)
			local _ = var1797
			var1769 = var1798
		elseif var1770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1799, var1800 = protoModule.readFixed64(p60, var1769)
			local _ = var1799
			var1769 = var1800
		else
			error("Unsupported wire type: " .. var1770)
		end
	end
	return var1768
end

function t_60:jsonEncode()
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

function t_60:jsonDecode()
	-- upvalues: t_60 (ref), t (ref)
	local var1801 = t_60.new()
	
	if self.title ~= nil then
		var1801.title = self.title
	end
	if self.description ~= nil then
		var1801.description = self.description
	end
	if self.primary_text ~= nil then
		var1801.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1801.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1801.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1801.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1801.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1801.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1801.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1801.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1801.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1801.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1801.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1801.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1801.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1801.sort_id = self.sortId
	end
	return var1801
end

t_60.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_60
typeRegistryModule.default:register(t.BannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		tooltip_text = if p61 == nil or p61.tooltip_text == nil then "" else p61.tooltip_text,
		prompt_id = if p61 == nil or p61.prompt_id == nil then "" else p61.prompt_id,
		prompt_type = if p61 == nil or p61.prompt_type == nil then "" else p61.prompt_type
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1801 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1802, var1803 = protoModule.writeTag(buff, var1801, 1, protoModule.wireTypes.lengthDelimited)
		var1802, var2719 = protoModule.writeString(var1802, var1803, self.tooltip_text)
		buff = var1802
		var1801 = var1803
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1804, var1805 = protoModule.writeTag(buff, var1801, 2, protoModule.wireTypes.lengthDelimited)
		var1804, var2721 = protoModule.writeString(var1804, var1805, self.prompt_id)
		buff = var1804
		var1801 = var1805
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1806, var1807 = protoModule.writeTag(buff, var1801, 3, protoModule.wireTypes.lengthDelimited)
		var1806, var2723 = protoModule.writeString(var1806, var1807, self.prompt_type)
		buff = var1806
		var1801 = var1807
	end
	local buff_1 = buffer.create(var1801)
	buffer.copy(buff_1, 0, buff, 0, var1801)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1801 = t_61.new()
	local var1802 = 0
	while var1802 < buffer.len(p61) do
		local _ = nil
		local var1803 = nil
		local var1804, var1805, var1806 = protoModule.readTag(p61, var1802)
		local var1807 = var1804
		var1803 = var1805
		var1802 = var1806
		
		if var1803 == protoModule.wireTypes.varint then
			local _ = nil
			local var1808, var1809 = protoModule.readVarInt(p61, var1802)
			local _ = var1808
			var1802 = var1809
			continue
		end
		if var1803 == protoModule.wireTypes.lengthDelimited then
			if var1807 == 1 then
				local _ = nil
				local var1810, var1811 = protoModule.readBuffer(p61, var1802)
				var1802 = var1811
				var1801.tooltip_text = buffer.tostring(var1810)
			elseif var1807 == 2 then
				local _ = nil
				local var1812, var1813 = protoModule.readBuffer(p61, var1802)
				var1802 = var1813
				var1801.prompt_id = buffer.tostring(var1812)
			elseif var1807 == 3 then
				local _ = nil
				local var1814, var1815 = protoModule.readBuffer(p61, var1802)
				var1802 = var1815
				var1801.prompt_type = buffer.tostring(var1814)
			else
				local _ = nil
				local var1816, var1817 = protoModule.readVarInt(p61, var1802)
				var1802 = var1817 + var1816
			end
		elseif var1803 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1818, var1819 = protoModule.readFixed32(p61, var1802)
			local _ = var1818
			var1802 = var1819
		elseif var1803 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1820, var1821 = protoModule.readFixed64(p61, var1802)
			local _ = var1820
			var1802 = var1821
		else
			error("Unsupported wire type: " .. var1803)
		end
	end
	return var1801
end

function t_61:jsonEncode()
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

function t_61:jsonDecode()
	-- upvalues: t_61 (ref)
	local var1822 = t_61.new()
	
	if self.tooltip_text ~= nil then
		var1822.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1822.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1822.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1822.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1822.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1822.prompt_type = self.promptType
	end
	return var1822
end

t_61.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_61
typeRegistryModule.default:register(t.TooltipInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		media_id = if p62 == nil or p62.media_id == nil then "" else p62.media_id,
		title = if p62 == nil or p62.title == nil then "" else p62.title,
		description = if p62 == nil or p62.description == nil then "" else p62.description,
		prompt_id = if p62 == nil or p62.prompt_id == nil then "" else p62.prompt_id,
		prompt_type = if p62 == nil or p62.prompt_type == nil then "" else p62.prompt_type,
		anchor_tag = if p62 == nil or p62.anchor_tag == nil then "" else p62.anchor_tag
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1822 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1823, var1824 = protoModule.writeTag(buff, var1822, 1, protoModule.wireTypes.lengthDelimited)
		var1823, var2751 = protoModule.writeString(var1823, var1824, self.media_id)
		buff = var1823
		var1822 = var1824
	end
	if self.title ~= nil and self.title ~= "" then
		local var1825, var1826 = protoModule.writeTag(buff, var1822, 2, protoModule.wireTypes.lengthDelimited)
		var1825, var2753 = protoModule.writeString(var1825, var1826, self.title)
		buff = var1825
		var1822 = var1826
	end
	if self.description ~= nil and self.description ~= "" then
		local var1827, var1828 = protoModule.writeTag(buff, var1822, 3, protoModule.wireTypes.lengthDelimited)
		var1827, var2755 = protoModule.writeString(var1827, var1828, self.description)
		buff = var1827
		var1822 = var1828
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1829, var1830 = protoModule.writeTag(buff, var1822, 4, protoModule.wireTypes.lengthDelimited)
		var1829, var2757 = protoModule.writeString(var1829, var1830, self.prompt_id)
		buff = var1829
		var1822 = var1830
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1831, var1832 = protoModule.writeTag(buff, var1822, 5, protoModule.wireTypes.lengthDelimited)
		var1831, var2759 = protoModule.writeString(var1831, var1832, self.prompt_type)
		buff = var1831
		var1822 = var1832
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1833, var1834 = protoModule.writeTag(buff, var1822, 6, protoModule.wireTypes.lengthDelimited)
		var1833, var2761 = protoModule.writeString(var1833, var1834, self.anchor_tag)
		buff = var1833
		var1822 = var1834
	end
	local buff_1 = buffer.create(var1822)
	buffer.copy(buff_1, 0, buff, 0, var1822)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1822 = t_62.new()
	local var1823 = 0
	while var1823 < buffer.len(p62) do
		local _ = nil
		local var1824 = nil
		local var1825, var1826, var1827 = protoModule.readTag(p62, var1823)
		local var1828 = var1825
		var1824 = var1826
		var1823 = var1827
		
		if var1824 == protoModule.wireTypes.varint then
			local _ = nil
			local var1829, var1830 = protoModule.readVarInt(p62, var1823)
			local _ = var1829
			var1823 = var1830
			continue
		end
		if var1824 == protoModule.wireTypes.lengthDelimited then
			if var1828 == 1 then
				local _ = nil
				local var1831, var1832 = protoModule.readBuffer(p62, var1823)
				var1823 = var1832
				var1822.media_id = buffer.tostring(var1831)
			elseif var1828 == 2 then
				local _ = nil
				local var1833, var1834 = protoModule.readBuffer(p62, var1823)
				var1823 = var1834
				var1822.title = buffer.tostring(var1833)
			elseif var1828 == 3 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p62, var1823)
				var1823 = var1836
				var1822.description = buffer.tostring(var1835)
			elseif var1828 == 4 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p62, var1823)
				var1823 = var1838
				var1822.prompt_id = buffer.tostring(var1837)
			elseif var1828 == 5 then
				local _ = nil
				local var1839, var1840 = protoModule.readBuffer(p62, var1823)
				var1823 = var1840
				var1822.prompt_type = buffer.tostring(var1839)
			elseif var1828 == 6 then
				local _ = nil
				local var1841, var1842 = protoModule.readBuffer(p62, var1823)
				var1823 = var1842
				var1822.anchor_tag = buffer.tostring(var1841)
			else
				local _ = nil
				local var1843, var1844 = protoModule.readVarInt(p62, var1823)
				var1823 = var1844 + var1843
			end
		elseif var1824 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1845, var1846 = protoModule.readFixed32(p62, var1823)
			local _ = var1845
			var1823 = var1846
		elseif var1824 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1847, var1848 = protoModule.readFixed64(p62, var1823)
			local _ = var1847
			var1823 = var1848
		else
			error("Unsupported wire type: " .. var1824)
		end
	end
	return var1822
end

function t_62:jsonEncode()
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

function t_62:jsonDecode()
	-- upvalues: t_62 (ref)
	local var1849 = t_62.new()
	
	if self.media_id ~= nil then
		var1849.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1849.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1849.title = self.title
	end
	if self.description ~= nil then
		var1849.description = self.description
	end
	if self.prompt_id ~= nil then
		var1849.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1849.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1849.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1849.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1849.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1849.anchor_tag = self.anchorTag
	end
	return var1849
end

t_62.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_62
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		prompt_id = if p63 == nil or p63.prompt_id == nil then "" else p63.prompt_id,
		prompt_type = if p63 == nil or p63.prompt_type == nil then "" else p63.prompt_type
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1849 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1850, var1851 = protoModule.writeTag(buff, var1849, 1, protoModule.wireTypes.lengthDelimited)
		var1850, var2795 = protoModule.writeString(var1850, var1851, self.prompt_id)
		buff = var1850
		var1849 = var1851
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1852, var1853 = protoModule.writeTag(buff, var1849, 2, protoModule.wireTypes.lengthDelimited)
		var1852, var2797 = protoModule.writeString(var1852, var1853, self.prompt_type)
		buff = var1852
		var1849 = var1853
	end
	local buff_1 = buffer.create(var1849)
	buffer.copy(buff_1, 0, buff, 0, var1849)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1849 = t_63.new()
	local var1850 = 0
	while var1850 < buffer.len(p63) do
		local _ = nil
		local var1851 = nil
		local var1852, var1853, var1854 = protoModule.readTag(p63, var1850)
		local var1855 = var1852
		var1851 = var1853
		var1850 = var1854
		
		if var1851 == protoModule.wireTypes.varint then
			local _ = nil
			local var1856, var1857 = protoModule.readVarInt(p63, var1850)
			local _ = var1856
			var1850 = var1857
			continue
		end
		if var1851 == protoModule.wireTypes.lengthDelimited then
			if var1855 == 1 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p63, var1850)
				var1850 = var1859
				var1849.prompt_id = buffer.tostring(var1858)
			elseif var1855 == 2 then
				local _ = nil
				local var1860, var1861 = protoModule.readBuffer(p63, var1850)
				var1850 = var1861
				var1849.prompt_type = buffer.tostring(var1860)
			else
				local _ = nil
				local var1862, var1863 = protoModule.readVarInt(p63, var1850)
				var1850 = var1863 + var1862
			end
		elseif var1851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1864, var1865 = protoModule.readFixed32(p63, var1850)
			local _ = var1864
			var1850 = var1865
		elseif var1851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1866, var1867 = protoModule.readFixed64(p63, var1850)
			local _ = var1866
			var1850 = var1867
		else
			error("Unsupported wire type: " .. var1851)
		end
	end
	return var1849
end

function t_63:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref)
	local var1868 = t_63.new()
	
	if self.prompt_id ~= nil then
		var1868.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1868.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1868.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1868.prompt_type = self.promptType
	end
	return var1868
end

t_63.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_63
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		upsell_prompt = if p64 == nil or p64.upsell_prompt == nil then "" else p64.upsell_prompt
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1868 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1869, var1870 = protoModule.writeTag(buff, var1868, 1, protoModule.wireTypes.lengthDelimited)
		var1869, var2823 = protoModule.writeString(var1869, var1870, self.upsell_prompt)
		buff = var1869
		var1868 = var1870
	end
	local buff_1 = buffer.create(var1868)
	buffer.copy(buff_1, 0, buff, 0, var1868)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1868 = t_64.new()
	local var1869 = 0
	while var1869 < buffer.len(p64) do
		local _ = nil
		local var1870 = nil
		local var1871, var1872, var1873 = protoModule.readTag(p64, var1869)
		local var1874 = var1871
		var1870 = var1872
		var1869 = var1873
		
		if var1870 == protoModule.wireTypes.varint then
			local _ = nil
			local var1875, var1876 = protoModule.readVarInt(p64, var1869)
			local _ = var1875
			var1869 = var1876
			continue
		end
		if var1870 == protoModule.wireTypes.lengthDelimited then
			if var1874 == 1 then
				local _ = nil
				local var1877, var1878 = protoModule.readBuffer(p64, var1869)
				var1869 = var1878
				var1868.upsell_prompt = buffer.tostring(var1877)
			else
				local _ = nil
				local var1879, var1880 = protoModule.readVarInt(p64, var1869)
				var1869 = var1880 + var1879
			end
		elseif var1870 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1881, var1882 = protoModule.readFixed32(p64, var1869)
			local _ = var1881
			var1869 = var1882
		elseif var1870 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1883, var1884 = protoModule.readFixed64(p64, var1869)
			local _ = var1883
			var1869 = var1884
		else
			error("Unsupported wire type: " .. var1870)
		end
	end
	return var1868
end

function t_64:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_64:jsonDecode()
	-- upvalues: t_64 (ref)
	local var1885 = t_64.new()
	
	if self.upsell_prompt ~= nil then
		var1885.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1885.upsell_prompt = self.upsellPrompt
	end
	return var1885
end

t_64.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_64
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		modal_variant = if p65 == nil or p65.modal_variant == nil then "" else p65.modal_variant,
		modal_sequence = if p65 == nil or p65.modal_sequence == nil then "" else p65.modal_sequence,
		conversation_id = if p65 == nil or p65.conversation_id == nil then "" else p65.conversation_id,
		friend_id = if p65 == nil or p65.friend_id == nil then "" else p65.friend_id
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1885 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1886, var1887 = protoModule.writeTag(buff, var1885, 1, protoModule.wireTypes.lengthDelimited)
		var1886, var2847 = protoModule.writeString(var1886, var1887, self.modal_variant)
		buff = var1886
		var1885 = var1887
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1888, var1889 = protoModule.writeTag(buff, var1885, 2, protoModule.wireTypes.lengthDelimited)
		var1888, var2849 = protoModule.writeString(var1888, var1889, self.modal_sequence)
		buff = var1888
		var1885 = var1889
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1890, var1891 = protoModule.writeTag(buff, var1885, 3, protoModule.wireTypes.lengthDelimited)
		var1890, var2851 = protoModule.writeString(var1890, var1891, self.conversation_id)
		buff = var1890
		var1885 = var1891
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1892, var1893 = protoModule.writeTag(buff, var1885, 4, protoModule.wireTypes.lengthDelimited)
		var1892, var2853 = protoModule.writeString(var1892, var1893, self.friend_id)
		buff = var1892
		var1885 = var1893
	end
	local buff_1 = buffer.create(var1885)
	buffer.copy(buff_1, 0, buff, 0, var1885)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1885 = t_65.new()
	local var1886 = 0
	while var1886 < buffer.len(p65) do
		local _ = nil
		local var1887 = nil
		local var1888, var1889, var1890 = protoModule.readTag(p65, var1886)
		local var1891 = var1888
		var1887 = var1889
		var1886 = var1890
		
		if var1887 == protoModule.wireTypes.varint then
			local _ = nil
			local var1892, var1893 = protoModule.readVarInt(p65, var1886)
			local _ = var1892
			var1886 = var1893
			continue
		end
		if var1887 == protoModule.wireTypes.lengthDelimited then
			if var1891 == 1 then
				local _ = nil
				local var1894, var1895 = protoModule.readBuffer(p65, var1886)
				var1886 = var1895
				var1885.modal_variant = buffer.tostring(var1894)
			elseif var1891 == 2 then
				local _ = nil
				local var1896, var1897 = protoModule.readBuffer(p65, var1886)
				var1886 = var1897
				var1885.modal_sequence = buffer.tostring(var1896)
			elseif var1891 == 3 then
				local _ = nil
				local var1898, var1899 = protoModule.readBuffer(p65, var1886)
				var1886 = var1899
				var1885.conversation_id = buffer.tostring(var1898)
			elseif var1891 == 4 then
				local _ = nil
				local var1900, var1901 = protoModule.readBuffer(p65, var1886)
				var1886 = var1901
				var1885.friend_id = buffer.tostring(var1900)
			else
				local _ = nil
				local var1902, var1903 = protoModule.readVarInt(p65, var1886)
				var1886 = var1903 + var1902
			end
		elseif var1887 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1904, var1905 = protoModule.readFixed32(p65, var1886)
			local _ = var1904
			var1886 = var1905
		elseif var1887 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1906, var1907 = protoModule.readFixed64(p65, var1886)
			local _ = var1906
			var1886 = var1907
		else
			error("Unsupported wire type: " .. var1887)
		end
	end
	return var1885
end

function t_65:jsonEncode()
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

function t_65:jsonDecode()
	-- upvalues: t_65 (ref)
	local var1908 = t_65.new()
	
	if self.modal_variant ~= nil then
		var1908.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1908.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1908.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1908.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1908.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1908.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1908.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1908.friend_id = self.friendId
	end
	return var1908
end

t_65.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_65
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p66 == nil or p66.event_id == nil then "" else p66.event_id,
		universe_id = if p66 == nil or p66.universe_id == nil then "" else p66.universe_id,
		entry_map = if p66 == nil or p66.entry_map == nil then {} else p66.entry_map,
		entry_order = if p66 == nil or p66.entry_order == nil then {} else p66.entry_order
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1908 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1909, var1910 = protoModule.writeTag(buff, var1908, 1, protoModule.wireTypes.lengthDelimited)
		var1909, var2883 = protoModule.writeString(var1909, var1910, self.event_id)
		buff = var1909
		var1908 = var1910
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1911, var1912 = protoModule.writeTag(buff, var1908, 2, protoModule.wireTypes.lengthDelimited)
		var1911, var2885 = protoModule.writeString(var1911, var1912, self.universe_id)
		buff = var1911
		var1908 = var1912
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1913, var1914 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1913, var2887 = protoModule.writeString(var1913, var1914, i)
			local var1915 = v:encode()
			var1914, var2889 = protoModule.writeTag(var1913, var1914, 2, protoModule.wireTypes.lengthDelimited)
			var1914, var2889 = protoModule.writeBuffer(var1914, var2889, var1915, buffer.len(var1915))
			local var1916 = var1914
			local var1917 = var2889
			local var1918, var1919 = protoModule.writeTag(buff, var1908, 3, protoModule.wireTypes.lengthDelimited)
			var1918, var2893 = protoModule.writeBuffer(var1918, var1919, var1916, var1917)
			buff = var1918
			var1908 = var1919
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1920, var1921 = protoModule.writeTag(buff, var1908, 4, protoModule.wireTypes.lengthDelimited)
			var1920, var2895 = protoModule.writeString(var1920, var1921, v)
			buff = var1920
			var1908 = var1921
		end
	end
	local buff_1 = buffer.create(var1908)
	buffer.copy(buff_1, 0, buff, 0, var1908)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1922 = t_66.new()
	local var1923 = 0
	while var1923 < buffer.len(p66) do
		local _ = nil
		local var1924 = nil
		local var1925, var1926, var1927 = protoModule.readTag(p66, var1923)
		local var1928 = var1925
		var1924 = var1926
		var1923 = var1927
		
		if var1924 == protoModule.wireTypes.varint then
			local _ = nil
			local var1929, var1930 = protoModule.readVarInt(p66, var1923)
			local _ = var1929
			var1923 = var1930
			continue
		end
		if var1924 == protoModule.wireTypes.lengthDelimited then
			if var1928 == 1 then
				local _ = nil
				local var1931, var1932 = protoModule.readBuffer(p66, var1923)
				var1923 = var1932
				var1922.event_id = buffer.tostring(var1931)
			elseif var1928 == 2 then
				local _ = nil
				local var1933, var1934 = protoModule.readBuffer(p66, var1923)
				var1923 = var1934
				var1922.universe_id = buffer.tostring(var1933)
			elseif var1928 == 3 then
				local _ = nil
				local var1935, var1936 = protoModule.readBuffer(p66, var1923)
				var1923 = var1936
				var1935 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1935)
				var1922.entry_map[var1935.key or ""] = var1935.value or t.FeedEntry.new()
			elseif var1928 == 4 then
				local _ = nil
				local var1937, var1938 = protoModule.readBuffer(p66, var1923)
				var1923 = var1938
				table.insert(var1922.entry_order, buffer.tostring(var1937))
			else
				local _ = nil
				local var1939, var1940 = protoModule.readVarInt(p66, var1923)
				var1923 = var1940 + var1939
			end
		elseif var1924 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1941, var1942 = protoModule.readFixed32(p66, var1923)
			local _ = var1941
			var1923 = var1942
		elseif var1924 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1943, var1944 = protoModule.readFixed64(p66, var1923)
			local _ = var1943
			var1923 = var1944
		else
			error("Unsupported wire type: " .. var1924)
		end
	end
	return var1922
end

function t_66:jsonEncode()
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

function t_66:jsonDecode()
	-- upvalues: t_66 (ref), t (ref)
	local var1945 = t_66.new()
	
	if self.event_id ~= nil then
		var1945.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1945.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1945.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1945.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1945.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1945.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1945.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1945.entry_order = t_1
	end
	return var1945
end

t_66.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_66
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		key = if p67 == nil or p67.key == nil then "" else p67.key,
		value = if p67 == nil or p67.value == nil then nil else p67.value
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1946 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1947, var1948 = protoModule.writeTag(buff, var1946, 1, protoModule.wireTypes.lengthDelimited)
		var1947, var2931 = protoModule.writeString(var1947, var1948, self.key)
		buff = var1947
		var1946 = var1948
	end
	if self.value ~= nil then
		local var1949 = self.value:encode()
		local var1950, var1951 = protoModule.writeTag(buff, var1946, 2, protoModule.wireTypes.lengthDelimited)
		var1950, var2934 = protoModule.writeBuffer(var1950, var1951, var1949, buffer.len(var1949))
		buff = var1950
		var1946 = var1951
	end
	local buff_1 = buffer.create(var1946)
	buffer.copy(buff_1, 0, buff, 0, var1946)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1946 = t_67.new()
	local var1947 = 0
	while var1947 < buffer.len(p67) do
		local _ = nil
		local var1948 = nil
		local var1949, var1950, var1951 = protoModule.readTag(p67, var1947)
		local var1952 = var1949
		var1948 = var1950
		var1947 = var1951
		
		if var1948 == protoModule.wireTypes.varint then
			local _ = nil
			local var1953, var1954 = protoModule.readVarInt(p67, var1947)
			local _ = var1953
			var1947 = var1954
			continue
		end
		if var1948 == protoModule.wireTypes.lengthDelimited then
			if var1952 == 1 then
				local _ = nil
				local var1955, var1956 = protoModule.readBuffer(p67, var1947)
				var1947 = var1956
				var1946.key = buffer.tostring(var1955)
			elseif var1952 == 2 then
				local _ = nil
				local var1957, var1958 = protoModule.readBuffer(p67, var1947)
				var1947 = var1958
				var1946.value = t.FeedEntry.decode(var1957)
			else
				local _ = nil
				local var1959, var1960 = protoModule.readVarInt(p67, var1947)
				var1947 = var1960 + var1959
			end
		elseif var1948 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1961, var1962 = protoModule.readFixed32(p67, var1947)
			local _ = var1961
			var1947 = var1962
		elseif var1948 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1963, var1964 = protoModule.readFixed64(p67, var1947)
			local _ = var1963
			var1947 = var1964
		else
			error("Unsupported wire type: " .. var1948)
		end
	end
	return var1946
end

function t_67:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), t (ref)
	local var1965 = t_67.new()
	
	if self.key ~= nil then
		var1965.key = self.key
	end
	if self.value ~= nil then
		var1965.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1965
end

t_67.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_67
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		event_id = if p68 == nil or p68.event_id == nil then "" else p68.event_id,
		universe_id = if p68 == nil or p68.universe_id == nil then "" else p68.universe_id
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1965 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1966, var1967 = protoModule.writeTag(buff, var1965, 1, protoModule.wireTypes.lengthDelimited)
		var1966, var2960 = protoModule.writeString(var1966, var1967, self.event_id)
		buff = var1966
		var1965 = var1967
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1968, var1969 = protoModule.writeTag(buff, var1965, 2, protoModule.wireTypes.lengthDelimited)
		var1968, var2962 = protoModule.writeString(var1968, var1969, self.universe_id)
		buff = var1968
		var1965 = var1969
	end
	local buff_1 = buffer.create(var1965)
	buffer.copy(buff_1, 0, buff, 0, var1965)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1965 = t_68.new()
	local var1966 = 0
	while var1966 < buffer.len(p68) do
		local _ = nil
		local var1967 = nil
		local var1968, var1969, var1970 = protoModule.readTag(p68, var1966)
		local var1971 = var1968
		var1967 = var1969
		var1966 = var1970
		
		if var1967 == protoModule.wireTypes.varint then
			local _ = nil
			local var1972, var1973 = protoModule.readVarInt(p68, var1966)
			local _ = var1972
			var1966 = var1973
			continue
		end
		if var1967 == protoModule.wireTypes.lengthDelimited then
			if var1971 == 1 then
				local _ = nil
				local var1974, var1975 = protoModule.readBuffer(p68, var1966)
				var1966 = var1975
				var1965.event_id = buffer.tostring(var1974)
			elseif var1971 == 2 then
				local _ = nil
				local var1976, var1977 = protoModule.readBuffer(p68, var1966)
				var1966 = var1977
				var1965.universe_id = buffer.tostring(var1976)
			else
				local _ = nil
				local var1978, var1979 = protoModule.readVarInt(p68, var1966)
				var1966 = var1979 + var1978
			end
		elseif var1967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1980, var1981 = protoModule.readFixed32(p68, var1966)
			local _ = var1980
			var1966 = var1981
		elseif var1967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1982, var1983 = protoModule.readFixed64(p68, var1966)
			local _ = var1982
			var1966 = var1983
		else
			error("Unsupported wire type: " .. var1967)
		end
	end
	return var1965
end

function t_68:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref)
	local var1984 = t_68.new()
	
	if self.event_id ~= nil then
		var1984.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1984.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1984.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1984.universe_id = self.universeId
	end
	return var1984
end

t_68.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_68
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p69 == nil or p69.event_id == nil then "" else p69.event_id
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1984 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1985, var1986 = protoModule.writeTag(buff, var1984, 1, protoModule.wireTypes.lengthDelimited)
		var1985, var2988 = protoModule.writeString(var1985, var1986, self.event_id)
		buff = var1985
		var1984 = var1986
	end
	local buff_1 = buffer.create(var1984)
	buffer.copy(buff_1, 0, buff, 0, var1984)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1984 = t_69.new()
	local var1985 = 0
	while var1985 < buffer.len(p69) do
		local _ = nil
		local var1986 = nil
		local var1987, var1988, var1989 = protoModule.readTag(p69, var1985)
		local var1990 = var1987
		var1986 = var1988
		var1985 = var1989
		
		if var1986 == protoModule.wireTypes.varint then
			local _ = nil
			local var1991, var1992 = protoModule.readVarInt(p69, var1985)
			local _ = var1991
			var1985 = var1992
			continue
		end
		if var1986 == protoModule.wireTypes.lengthDelimited then
			if var1990 == 1 then
				local _ = nil
				local var1993, var1994 = protoModule.readBuffer(p69, var1985)
				var1985 = var1994
				var1984.event_id = buffer.tostring(var1993)
			else
				local _ = nil
				local var1995, var1996 = protoModule.readVarInt(p69, var1985)
				var1985 = var1996 + var1995
			end
		elseif var1986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1997, var1998 = protoModule.readFixed32(p69, var1985)
			local _ = var1997
			var1985 = var1998
		elseif var1986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1999, var2000 = protoModule.readFixed64(p69, var1985)
			local _ = var1999
			var1985 = var2000
		else
			error("Unsupported wire type: " .. var1986)
		end
	end
	return var1984
end

function t_69:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode()
	-- upvalues: t_69 (ref)
	local var2001 = t_69.new()
	
	if self.event_id ~= nil then
		var2001.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2001.event_id = self.eventId
	end
	return var2001
end

t_69.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_69
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p70 == nil or p70.event_id == nil then "" else p70.event_id,
		universe_id = if p70 == nil or p70.universe_id == nil then "" else p70.universe_id,
		rsvp_users = if p70 == nil or p70.rsvp_users == nil then {} else p70.rsvp_users
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2001 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2002, var2003 = protoModule.writeTag(buff, var2001, 1, protoModule.wireTypes.lengthDelimited)
		var2002, var3012 = protoModule.writeString(var2002, var2003, self.event_id)
		buff = var2002
		var2001 = var2003
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2004, var2005 = protoModule.writeTag(buff, var2001, 2, protoModule.wireTypes.lengthDelimited)
		var2004, var3014 = protoModule.writeString(var2004, var2005, self.universe_id)
		buff = var2004
		var2001 = var2005
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2006 = v:encode()
			local var2007, var2008 = protoModule.writeTag(buff, var2001, 3, protoModule.wireTypes.lengthDelimited)
			var2007, var3017 = protoModule.writeBuffer(var2007, var2008, var2006, buffer.len(var2006))
			buff = var2007
			var2001 = var2008
		end
	end
	local buff_1 = buffer.create(var2001)
	buffer.copy(buff_1, 0, buff, 0, var2001)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
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
			elseif var2015 == 2 then
				local _ = nil
				local var2020, var2021 = protoModule.readBuffer(p70, var2010)
				var2010 = var2021
				var2009.universe_id = buffer.tostring(var2020)
			elseif var2015 == 3 then
				local _ = nil
				local var2022, var2023 = protoModule.readBuffer(p70, var2010)
				var2010 = var2023
				table.insert(var2009.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2022))
			else
				local _ = nil
				local var2024, var2025 = protoModule.readVarInt(p70, var2010)
				var2010 = var2025 + var2024
			end
		elseif var2011 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2026, var2027 = protoModule.readFixed32(p70, var2010)
			local _ = var2026
			var2010 = var2027
		elseif var2011 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2028, var2029 = protoModule.readFixed64(p70, var2010)
			local _ = var2028
			var2010 = var2029
		else
			error("Unsupported wire type: " .. var2011)
		end
	end
	return var2009
end

function t_70:jsonEncode()
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

function t_70:jsonDecode()
	-- upvalues: t_70 (ref), t (ref)
	local var2030 = t_70.new()
	
	if self.event_id ~= nil then
		var2030.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2030.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2030.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2030.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2030.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2030.rsvp_users = t_1
	end
	return var2030
end

t_70.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_70
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		user_id = if p71 == nil or p71.user_id == nil then 0 else p71.user_id
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2031 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2032, var2033 = protoModule.writeTag(buff, var2031, 1, protoModule.wireTypes.varint)
		var2032, var3048 = protoModule.writeVarInt(var2032, var2033, self.user_id)
		buff = var2032
		var2031 = var2033
	end
	local buff_1 = buffer.create(var2031)
	buffer.copy(buff_1, 0, buff, 0, var2031)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2031 = t_71.new()
	local var2032 = 0
	while var2032 < buffer.len(p71) do
		local _ = nil
		local _ = nil
		local var2033, var2034, var2035 = protoModule.readTag(p71, var2032)
		local var2036 = var2033
		local var2037 = var2034
		var2032 = var2035
		
		if var2037 == protoModule.wireTypes.varint then
			if var2036 == 1 then
				local _ = nil
				local var2038, var2039 = protoModule.readVarIntI64(p71, var2032)
				var2032 = var2039
				var2031.user_id = var2038
			else
				local _ = nil
				local var2040, var2041 = protoModule.readVarInt(p71, var2032)
				local _ = var2040
				var2032 = var2041
			end
		elseif var2037 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2042, var2043 = protoModule.readVarInt(p71, var2032)
			var2032 = var2043 + var2042
		elseif var2037 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2044, var2045 = protoModule.readFixed32(p71, var2032)
			local _ = var2044
			var2032 = var2045
		elseif var2037 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2046, var2047 = protoModule.readFixed64(p71, var2032)
			local _ = var2046
			var2032 = var2047
		else
			error("Unsupported wire type: " .. var2037)
		end
	end
	return var2031
end

function t_71:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref)
	local var2048 = t_71.new()
	
	if self.user_id ~= nil then
		var2048.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2048.user_id = self.userId
	end
	return var2048
end

t_71.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_71
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t_72 (ref)
	return setmetatable({
		event_id = if p72 == nil or p72.event_id == nil then "" else p72.event_id
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2048 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2049, var2050 = protoModule.writeTag(buff, var2048, 1, protoModule.wireTypes.lengthDelimited)
		var2049, var3072 = protoModule.writeString(var2049, var2050, self.event_id)
		buff = var2049
		var2048 = var2050
	end
	local buff_1 = buffer.create(var2048)
	buffer.copy(buff_1, 0, buff, 0, var2048)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2048 = t_72.new()
	local var2049 = 0
	while var2049 < buffer.len(p72) do
		local _ = nil
		local var2050 = nil
		local var2051, var2052, var2053 = protoModule.readTag(p72, var2049)
		local var2054 = var2051
		var2050 = var2052
		var2049 = var2053
		
		if var2050 == protoModule.wireTypes.varint then
			local _ = nil
			local var2055, var2056 = protoModule.readVarInt(p72, var2049)
			local _ = var2055
			var2049 = var2056
			continue
		end
		if var2050 == protoModule.wireTypes.lengthDelimited then
			if var2054 == 1 then
				local _ = nil
				local var2057, var2058 = protoModule.readBuffer(p72, var2049)
				var2049 = var2058
				var2048.event_id = buffer.tostring(var2057)
			else
				local _ = nil
				local var2059, var2060 = protoModule.readVarInt(p72, var2049)
				var2049 = var2060 + var2059
			end
		elseif var2050 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2061, var2062 = protoModule.readFixed32(p72, var2049)
			local _ = var2061
			var2049 = var2062
		elseif var2050 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2063, var2064 = protoModule.readFixed64(p72, var2049)
			local _ = var2063
			var2049 = var2064
		else
			error("Unsupported wire type: " .. var2050)
		end
	end
	return var2048
end

function t_72:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_72:jsonDecode()
	-- upvalues: t_72 (ref)
	local var2065 = t_72.new()
	
	if self.event_id ~= nil then
		var2065.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2065.event_id = self.eventId
	end
	return var2065
end

t_72.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_72
typeRegistryModule.default:register(t.EventInfoTableInputData)
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
	local var2065 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2066, var2067 = protoModule.writeTag(buff, var2065, 1, protoModule.wireTypes.lengthDelimited)
		var2066, var3096 = protoModule.writeString(var2066, var2067, self.event_id)
		buff = var2066
		var2065 = var2067
	end
	local buff_1 = buffer.create(var2065)
	buffer.copy(buff_1, 0, buff, 0, var2065)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2065 = t_73.new()
	local var2066 = 0
	while var2066 < buffer.len(p73) do
		local _ = nil
		local var2067 = nil
		local var2068, var2069, var2070 = protoModule.readTag(p73, var2066)
		local var2071 = var2068
		var2067 = var2069
		var2066 = var2070
		
		if var2067 == protoModule.wireTypes.varint then
			local _ = nil
			local var2072, var2073 = protoModule.readVarInt(p73, var2066)
			local _ = var2072
			var2066 = var2073
			continue
		end
		if var2067 == protoModule.wireTypes.lengthDelimited then
			if var2071 == 1 then
				local _ = nil
				local var2074, var2075 = protoModule.readBuffer(p73, var2066)
				var2066 = var2075
				var2065.event_id = buffer.tostring(var2074)
			else
				local _ = nil
				local var2076, var2077 = protoModule.readVarInt(p73, var2066)
				var2066 = var2077 + var2076
			end
		elseif var2067 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2078, var2079 = protoModule.readFixed32(p73, var2066)
			local _ = var2078
			var2066 = var2079
		elseif var2067 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2080, var2081 = protoModule.readFixed64(p73, var2066)
			local _ = var2080
			var2066 = var2081
		else
			error("Unsupported wire type: " .. var2067)
		end
	end
	return var2065
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
	local var2082 = t_73.new()
	
	if self.event_id ~= nil then
		var2082.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2082.event_id = self.eventId
	end
	return var2082
end

t_73.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_73
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		event_id = if p74 == nil or p74.event_id == nil then "" else p74.event_id,
		universe_id = if p74 == nil or p74.universe_id == nil then "" else p74.universe_id
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2082 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2083, var2084 = protoModule.writeTag(buff, var2082, 1, protoModule.wireTypes.lengthDelimited)
		var2083, var3120 = protoModule.writeString(var2083, var2084, self.event_id)
		buff = var2083
		var2082 = var2084
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2085, var2086 = protoModule.writeTag(buff, var2082, 2, protoModule.wireTypes.lengthDelimited)
		var2085, var3122 = protoModule.writeString(var2085, var2086, self.universe_id)
		buff = var2085
		var2082 = var2086
	end
	local buff_1 = buffer.create(var2082)
	buffer.copy(buff_1, 0, buff, 0, var2082)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref)
	local var2082 = t_74.new()
	local var2083 = 0
	while var2083 < buffer.len(p74) do
		local _ = nil
		local var2084 = nil
		local var2085, var2086, var2087 = protoModule.readTag(p74, var2083)
		local var2088 = var2085
		var2084 = var2086
		var2083 = var2087
		
		if var2084 == protoModule.wireTypes.varint then
			local _ = nil
			local var2089, var2090 = protoModule.readVarInt(p74, var2083)
			local _ = var2089
			var2083 = var2090
			continue
		end
		if var2084 == protoModule.wireTypes.lengthDelimited then
			if var2088 == 1 then
				local _ = nil
				local var2091, var2092 = protoModule.readBuffer(p74, var2083)
				var2083 = var2092
				var2082.event_id = buffer.tostring(var2091)
			elseif var2088 == 2 then
				local _ = nil
				local var2093, var2094 = protoModule.readBuffer(p74, var2083)
				var2083 = var2094
				var2082.universe_id = buffer.tostring(var2093)
			else
				local _ = nil
				local var2095, var2096 = protoModule.readVarInt(p74, var2083)
				var2083 = var2096 + var2095
			end
		elseif var2084 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2097, var2098 = protoModule.readFixed32(p74, var2083)
			local _ = var2097
			var2083 = var2098
		elseif var2084 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2099, var2100 = protoModule.readFixed64(p74, var2083)
			local _ = var2099
			var2083 = var2100
		else
			error("Unsupported wire type: " .. var2084)
		end
	end
	return var2082
end

function t_74:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_74:jsonDecode()
	-- upvalues: t_74 (ref)
	local var2101 = t_74.new()
	
	if self.event_id ~= nil then
		var2101.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2101.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2101.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2101.universe_id = self.universeId
	end
	return var2101
end

t_74.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_74
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		entry_map = if p75 == nil or p75.entry_map == nil then {} else p75.entry_map,
		entry_order = if p75 == nil or p75.entry_order == nil then {} else p75.entry_order,
		next_page_token = if p75 == nil or p75.next_page_token == nil then "" else p75.next_page_token,
		sticky_filter_pills = if p75 == nil or p75.sticky_filter_pills == nil then nil else p75.sticky_filter_pills,
		applied_filters = if p75 == nil or p75.applied_filters == nil then "" else p75.applied_filters
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2101 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2102, var2103 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2102, var3148 = protoModule.writeString(var2102, var2103, i)
			local var2104 = v:encode()
			var2103, var3150 = protoModule.writeTag(var2102, var2103, 2, protoModule.wireTypes.lengthDelimited)
			var2103, var3150 = protoModule.writeBuffer(var2103, var3150, var2104, buffer.len(var2104))
			local var2105 = var2103
			local var2106 = var3150
			local var2107, var2108 = protoModule.writeTag(buff, var2101, 1, protoModule.wireTypes.lengthDelimited)
			var2107, var3154 = protoModule.writeBuffer(var2107, var2108, var2105, var2106)
			buff = var2107
			var2101 = var2108
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2109, var2110 = protoModule.writeTag(buff, var2101, 2, protoModule.wireTypes.lengthDelimited)
			var2109, var3156 = protoModule.writeString(var2109, var2110, v)
			buff = var2109
			var2101 = var2110
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2111, var2112 = protoModule.writeTag(buff, var2101, 3, protoModule.wireTypes.lengthDelimited)
		var2111, var3158 = protoModule.writeString(var2111, var2112, self.next_page_token)
		buff = var2111
		var2101 = var2112
	end
	if self.sticky_filter_pills ~= nil then
		local var2113 = self.sticky_filter_pills:encode()
		local var2114, var2115 = protoModule.writeTag(buff, var2101, 4, protoModule.wireTypes.lengthDelimited)
		var2114, var3161 = protoModule.writeBuffer(var2114, var2115, var2113, buffer.len(var2113))
		buff = var2114
		var2101 = var2115
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2116, var2117 = protoModule.writeTag(buff, var2101, 5, protoModule.wireTypes.lengthDelimited)
		var2116, var3163 = protoModule.writeString(var2116, var2117, self.applied_filters)
		buff = var2116
		var2101 = var2117
	end
	local buff_1 = buffer.create(var2101)
	buffer.copy(buff_1, 0, buff, 0, var2101)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2118 = t_75.new()
	local var2119 = 0
	while var2119 < buffer.len(p75) do
		local _ = nil
		local var2120 = nil
		local var2121, var2122, var2123 = protoModule.readTag(p75, var2119)
		local var2124 = var2121
		var2120 = var2122
		var2119 = var2123
		
		if var2120 == protoModule.wireTypes.varint then
			local _ = nil
			local var2125, var2126 = protoModule.readVarInt(p75, var2119)
			local _ = var2125
			var2119 = var2126
			continue
		end
		if var2120 == protoModule.wireTypes.lengthDelimited then
			if var2124 == 1 then
				local _ = nil
				local var2127, var2128 = protoModule.readBuffer(p75, var2119)
				var2119 = var2128
				var2127 = t.ChartsFeedInputData_EntryMapEntry.decode(var2127)
				var2118.entry_map[var2127.key or ""] = var2127.value or t.FeedEntry.new()
			elseif var2124 == 2 then
				local _ = nil
				local var2129, var2130 = protoModule.readBuffer(p75, var2119)
				var2119 = var2130
				table.insert(var2118.entry_order, buffer.tostring(var2129))
			elseif var2124 == 3 then
				local _ = nil
				local var2131, var2132 = protoModule.readBuffer(p75, var2119)
				var2119 = var2132
				var2118.next_page_token = buffer.tostring(var2131)
			elseif var2124 == 4 then
				local _ = nil
				local var2133, var2134 = protoModule.readBuffer(p75, var2119)
				var2119 = var2134
				var2118.sticky_filter_pills = t.FilterPillsInputData.decode(var2133)
			elseif var2124 == 5 then
				local _ = nil
				local var2135, var2136 = protoModule.readBuffer(p75, var2119)
				var2119 = var2136
				var2118.applied_filters = buffer.tostring(var2135)
			else
				local _ = nil
				local var2137, var2138 = protoModule.readVarInt(p75, var2119)
				var2119 = var2138 + var2137
			end
		elseif var2120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2139, var2140 = protoModule.readFixed32(p75, var2119)
			local _ = var2139
			var2119 = var2140
		elseif var2120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2141, var2142 = protoModule.readFixed64(p75, var2119)
			local _ = var2141
			var2119 = var2142
		else
			error("Unsupported wire type: " .. var2120)
		end
	end
	return var2118
end

function t_75:jsonEncode()
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

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), t (ref)
	local var2143 = t_75.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2143.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2143.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2143.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2143.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2143.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2143.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2143.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2143.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2143.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2143.applied_filters = self.appliedFilters
	end
	return var2143
end

t_75.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_75
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		key = if p76 == nil or p76.key == nil then "" else p76.key,
		value = if p76 == nil or p76.value == nil then nil else p76.value
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2144 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2145, var2146 = protoModule.writeTag(buff, var2144, 1, protoModule.wireTypes.lengthDelimited)
		var2145, var3201 = protoModule.writeString(var2145, var2146, self.key)
		buff = var2145
		var2144 = var2146
	end
	if self.value ~= nil then
		local var2147 = self.value:encode()
		local var2148, var2149 = protoModule.writeTag(buff, var2144, 2, protoModule.wireTypes.lengthDelimited)
		var2148, var3204 = protoModule.writeBuffer(var2148, var2149, var2147, buffer.len(var2147))
		buff = var2148
		var2144 = var2149
	end
	local buff_1 = buffer.create(var2144)
	buffer.copy(buff_1, 0, buff, 0, var2144)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2144 = t_76.new()
	local var2145 = 0
	while var2145 < buffer.len(p76) do
		local _ = nil
		local var2146 = nil
		local var2147, var2148, var2149 = protoModule.readTag(p76, var2145)
		local var2150 = var2147
		var2146 = var2148
		var2145 = var2149
		
		if var2146 == protoModule.wireTypes.varint then
			local _ = nil
			local var2151, var2152 = protoModule.readVarInt(p76, var2145)
			local _ = var2151
			var2145 = var2152
			continue
		end
		if var2146 == protoModule.wireTypes.lengthDelimited then
			if var2150 == 1 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p76, var2145)
				var2145 = var2154
				var2144.key = buffer.tostring(var2153)
			elseif var2150 == 2 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p76, var2145)
				var2145 = var2156
				var2144.value = t.FeedEntry.decode(var2155)
			else
				local _ = nil
				local var2157, var2158 = protoModule.readVarInt(p76, var2145)
				var2145 = var2158 + var2157
			end
		elseif var2146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2159, var2160 = protoModule.readFixed32(p76, var2145)
			local _ = var2159
			var2145 = var2160
		elseif var2146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2161, var2162 = protoModule.readFixed64(p76, var2145)
			local _ = var2161
			var2145 = var2162
		else
			error("Unsupported wire type: " .. var2146)
		end
	end
	return var2144
end

function t_76:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_76:jsonDecode()
	-- upvalues: t_76 (ref), t (ref)
	local var2163 = t_76.new()
	
	if self.key ~= nil then
		var2163.key = self.key
	end
	if self.value ~= nil then
		var2163.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2163
end

t_76.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_76
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		filter_groups = if p77 == nil or p77.filter_groups == nil then {} else p77.filter_groups,
		sort_id = if p77 == nil or p77.sort_id == nil then "" else p77.sort_id,
		secondary_sort_id = if p77 == nil or p77.secondary_sort_id == nil then 0 else p77.secondary_sort_id,
		title = if p77 == nil or p77.title == nil then "" else p77.title,
		primary_sort_id = if p77 == nil or p77.primary_sort_id == nil then nil else p77.primary_sort_id,
		applied_filters = if p77 == nil or p77.applied_filters == nil then nil else p77.applied_filters
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2163 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2164 = v:encode()
			local var2165, var2166 = protoModule.writeTag(buff, var2163, 1, protoModule.wireTypes.lengthDelimited)
			var2165, var3231 = protoModule.writeBuffer(var2165, var2166, var2164, buffer.len(var2164))
			buff = var2165
			var2163 = var2166
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2167, var2168 = protoModule.writeTag(buff, var2163, 2, protoModule.wireTypes.lengthDelimited)
		var2167, var3233 = protoModule.writeString(var2167, var2168, self.sort_id)
		buff = var2167
		var2163 = var2168
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2169, var2170 = protoModule.writeTag(buff, var2163, 3, protoModule.wireTypes.varint)
		var2169, var3235 = protoModule.writeVarInt(var2169, var2170, self.secondary_sort_id)
		buff = var2169
		var2163 = var2170
	end
	if self.title ~= nil and self.title ~= "" then
		local var2171, var2172 = protoModule.writeTag(buff, var2163, 4, protoModule.wireTypes.lengthDelimited)
		var2171, var3237 = protoModule.writeString(var2171, var2172, self.title)
		buff = var2171
		var2163 = var2172
	end
	if self.primary_sort_id ~= nil then
		local var2173, var2174 = protoModule.writeTag(buff, var2163, 5, protoModule.wireTypes.varint)
		var2173, var3239 = protoModule.writeVarInt(var2173, var2174, self.primary_sort_id)
		buff = var2173
		var2163 = var2174
	end
	if self.applied_filters ~= nil then
		local var2175, var2176 = protoModule.writeTag(buff, var2163, 6, protoModule.wireTypes.lengthDelimited)
		var2175, var3241 = protoModule.writeString(var2175, var2176, self.applied_filters)
		buff = var2175
		var2163 = var2176
	end
	local buff_1 = buffer.create(var2163)
	buffer.copy(buff_1, 0, buff, 0, var2163)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2177 = t_77.new()
	local var2178 = 0
	while var2178 < buffer.len(p77) do
		local _ = nil
		local var2179 = nil
		local var2180, var2181, var2182 = protoModule.readTag(p77, var2178)
		local var2183 = var2180
		var2179 = var2181
		var2178 = var2182
		
		if var2179 == protoModule.wireTypes.varint then
			if var2183 == 3 then
				local _ = nil
				local var2184, var2185 = protoModule.readVarIntI32(p77, var2178)
				var2178 = var2185
				var2177.secondary_sort_id = var2184
			elseif var2183 == 5 then
				local _ = nil
				local var2186, var2187 = protoModule.readVarIntI32(p77, var2178)
				var2178 = var2187
				var2177.primary_sort_id = var2186
			else
				local _ = nil
				local var2188, var2189 = protoModule.readVarInt(p77, var2178)
				local _ = var2188
				var2178 = var2189
			end
		end
		if var2179 == protoModule.wireTypes.lengthDelimited then
			if var2183 == 1 then
				local _ = nil
				local var2190, var2191 = protoModule.readBuffer(p77, var2178)
				var2178 = var2191
				table.insert(var2177.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2190))
			elseif var2183 == 2 then
				local _ = nil
				local var2192, var2193 = protoModule.readBuffer(p77, var2178)
				var2178 = var2193
				var2177.sort_id = buffer.tostring(var2192)
			elseif var2183 == 4 then
				local _ = nil
				local var2194, var2195 = protoModule.readBuffer(p77, var2178)
				var2178 = var2195
				var2177.title = buffer.tostring(var2194)
			elseif var2183 == 6 then
				local _ = nil
				local var2196, var2197 = protoModule.readBuffer(p77, var2178)
				var2178 = var2197
				var2177.applied_filters = buffer.tostring(var2196)
			else
				local _ = nil
				local var2198, var2199 = protoModule.readVarInt(p77, var2178)
				var2178 = var2199 + var2198
			end
		elseif var2179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2200, var2201 = protoModule.readFixed32(p77, var2178)
			local _ = var2200
			var2178 = var2201
		elseif var2179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2202, var2203 = protoModule.readFixed64(p77, var2178)
			local _ = var2202
			var2178 = var2203
		else
			error("Unsupported wire type: " .. var2179)
		end
	end
	return var2177
end

function t_77:jsonEncode()
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

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var2204 = t_77.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2204.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2204.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2204.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2204.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2204.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2204.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2204.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2204.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2204.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2204.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2204.applied_filters = self.appliedFilters
	end
	return var2204
end

t_77.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_77
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		filter_id = if p78 == nil or p78.filter_id == nil then "" else p78.filter_id,
		display_name = if p78 == nil or p78.display_name == nil then "" else p78.display_name,
		options = if p78 == nil or p78.options == nil then {} else p78.options,
		default_option_id = if p78 == nil or p78.default_option_id == nil then "" else p78.default_option_id,
		selected_option_id = if p78 == nil or p78.selected_option_id == nil then "" else p78.selected_option_id,
		filter_type = if p78 == nil or p78.filter_type == nil then "" else p78.filter_type,
		inactive_option_ids = if p78 == nil or p78.inactive_option_ids == nil then {} else p78.inactive_option_ids,
		info_text = if p78 == nil or p78.info_text == nil then "" else p78.info_text
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2205 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2206, var2207 = protoModule.writeTag(buff, var2205, 1, protoModule.wireTypes.lengthDelimited)
		var2206, var3278 = protoModule.writeString(var2206, var2207, self.filter_id)
		buff = var2206
		var2205 = var2207
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2208, var2209 = protoModule.writeTag(buff, var2205, 2, protoModule.wireTypes.lengthDelimited)
		var2208, var3280 = protoModule.writeString(var2208, var2209, self.display_name)
		buff = var2208
		var2205 = var2209
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2210 = v:encode()
			local var2211, var2212 = protoModule.writeTag(buff, var2205, 3, protoModule.wireTypes.lengthDelimited)
			var2211, var3283 = protoModule.writeBuffer(var2211, var2212, var2210, buffer.len(var2210))
			buff = var2211
			var2205 = var2212
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2213, var2214 = protoModule.writeTag(buff, var2205, 4, protoModule.wireTypes.lengthDelimited)
		var2213, var3285 = protoModule.writeString(var2213, var2214, self.default_option_id)
		buff = var2213
		var2205 = var2214
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2215, var2216 = protoModule.writeTag(buff, var2205, 5, protoModule.wireTypes.lengthDelimited)
		var2215, var3287 = protoModule.writeString(var2215, var2216, self.selected_option_id)
		buff = var2215
		var2205 = var2216
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2217, var2218 = protoModule.writeTag(buff, var2205, 6, protoModule.wireTypes.lengthDelimited)
		var2217, var3289 = protoModule.writeString(var2217, var2218, self.filter_type)
		buff = var2217
		var2205 = var2218
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2219, var2220 = protoModule.writeTag(buff, var2205, 7, protoModule.wireTypes.lengthDelimited)
			var2219, var3291 = protoModule.writeString(var2219, var2220, v)
			buff = var2219
			var2205 = var2220
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2221, var2222 = protoModule.writeTag(buff, var2205, 8, protoModule.wireTypes.lengthDelimited)
		var2221, var3293 = protoModule.writeString(var2221, var2222, self.info_text)
		buff = var2221
		var2205 = var2222
	end
	local buff_1 = buffer.create(var2205)
	buffer.copy(buff_1, 0, buff, 0, var2205)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2223 = t_78.new()
	local var2224 = 0
	while var2224 < buffer.len(p78) do
		local _ = nil
		local var2225 = nil
		local var2226, var2227, var2228 = protoModule.readTag(p78, var2224)
		local var2229 = var2226
		var2225 = var2227
		var2224 = var2228
		
		if var2225 == protoModule.wireTypes.varint then
			local _ = nil
			local var2230, var2231 = protoModule.readVarInt(p78, var2224)
			local _ = var2230
			var2224 = var2231
			continue
		end
		if var2225 == protoModule.wireTypes.lengthDelimited then
			if var2229 == 1 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p78, var2224)
				var2224 = var2233
				var2223.filter_id = buffer.tostring(var2232)
			elseif var2229 == 2 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p78, var2224)
				var2224 = var2235
				var2223.display_name = buffer.tostring(var2234)
			elseif var2229 == 3 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p78, var2224)
				var2224 = var2237
				table.insert(var2223.options, t.FilterPillsInputData_FilterOption.decode(var2236))
			elseif var2229 == 4 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p78, var2224)
				var2224 = var2239
				var2223.default_option_id = buffer.tostring(var2238)
			elseif var2229 == 5 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p78, var2224)
				var2224 = var2241
				var2223.selected_option_id = buffer.tostring(var2240)
			elseif var2229 == 6 then
				local _ = nil
				local var2242, var2243 = protoModule.readBuffer(p78, var2224)
				var2224 = var2243
				var2223.filter_type = buffer.tostring(var2242)
			elseif var2229 == 7 then
				local _ = nil
				local var2244, var2245 = protoModule.readBuffer(p78, var2224)
				var2224 = var2245
				table.insert(var2223.inactive_option_ids, buffer.tostring(var2244))
			elseif var2229 == 8 then
				local _ = nil
				local var2246, var2247 = protoModule.readBuffer(p78, var2224)
				var2224 = var2247
				var2223.info_text = buffer.tostring(var2246)
			else
				local _ = nil
				local var2248, var2249 = protoModule.readVarInt(p78, var2224)
				var2224 = var2249 + var2248
			end
		elseif var2225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2250, var2251 = protoModule.readFixed32(p78, var2224)
			local _ = var2250
			var2224 = var2251
		elseif var2225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2252, var2253 = protoModule.readFixed64(p78, var2224)
			local _ = var2252
			var2224 = var2253
		else
			error("Unsupported wire type: " .. var2225)
		end
	end
	return var2223
end

function t_78:jsonEncode()
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

function t_78:jsonDecode()
	-- upvalues: t_78 (ref), t (ref)
	local var2254 = t_78.new()
	
	if self.filter_id ~= nil then
		var2254.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2254.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2254.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2254.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2254.options = t_1
	end
	if self.default_option_id ~= nil then
		var2254.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2254.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2254.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2254.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2254.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2254.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2254.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2254.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2254.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2254.info_text = self.infoText
	end
	return var2254
end

t_78.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_78
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		option_id = if p79 == nil or p79.option_id == nil then "" else p79.option_id,
		display_name = if p79 == nil or p79.display_name == nil then "" else p79.display_name,
		option_context_tag = if p79 == nil or p79.option_context_tag == nil then "" else p79.option_context_tag
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2255 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2256, var2257 = protoModule.writeTag(buff, var2255, 1, protoModule.wireTypes.lengthDelimited)
		var2256, var3336 = protoModule.writeString(var2256, var2257, self.option_id)
		buff = var2256
		var2255 = var2257
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2258, var2259 = protoModule.writeTag(buff, var2255, 2, protoModule.wireTypes.lengthDelimited)
		var2258, var3338 = protoModule.writeString(var2258, var2259, self.display_name)
		buff = var2258
		var2255 = var2259
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2260, var2261 = protoModule.writeTag(buff, var2255, 3, protoModule.wireTypes.lengthDelimited)
		var2260, var3340 = protoModule.writeString(var2260, var2261, self.option_context_tag)
		buff = var2260
		var2255 = var2261
	end
	local buff_1 = buffer.create(var2255)
	buffer.copy(buff_1, 0, buff, 0, var2255)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref)
	local var2255 = t_79.new()
	local var2256 = 0
	while var2256 < buffer.len(p79) do
		local _ = nil
		local var2257 = nil
		local var2258, var2259, var2260 = protoModule.readTag(p79, var2256)
		local var2261 = var2258
		var2257 = var2259
		var2256 = var2260
		
		if var2257 == protoModule.wireTypes.varint then
			local _ = nil
			local var2262, var2263 = protoModule.readVarInt(p79, var2256)
			local _ = var2262
			var2256 = var2263
			continue
		end
		if var2257 == protoModule.wireTypes.lengthDelimited then
			if var2261 == 1 then
				local _ = nil
				local var2264, var2265 = protoModule.readBuffer(p79, var2256)
				var2256 = var2265
				var2255.option_id = buffer.tostring(var2264)
			elseif var2261 == 2 then
				local _ = nil
				local var2266, var2267 = protoModule.readBuffer(p79, var2256)
				var2256 = var2267
				var2255.display_name = buffer.tostring(var2266)
			elseif var2261 == 3 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p79, var2256)
				var2256 = var2269
				var2255.option_context_tag = buffer.tostring(var2268)
			else
				local _ = nil
				local var2270, var2271 = protoModule.readVarInt(p79, var2256)
				var2256 = var2271 + var2270
			end
		elseif var2257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2272, var2273 = protoModule.readFixed32(p79, var2256)
			local _ = var2272
			var2256 = var2273
		elseif var2257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2274, var2275 = protoModule.readFixed64(p79, var2256)
			local _ = var2274
			var2256 = var2275
		else
			error("Unsupported wire type: " .. var2257)
		end
	end
	return var2255
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref)
	local var2276 = t_79.new()
	
	if self.option_id ~= nil then
		var2276.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2276.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2276.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2276.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2276.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2276.option_context_tag = self.optionContextTag
	end
	return var2276
end

t_79.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_79
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		sort_options = if p80 == nil or p80.sort_options == nil then {} else p80.sort_options,
		selected_sort_id = if p80 == nil or p80.selected_sort_id == nil then "" else p80.selected_sort_id
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2276 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2277 = v:encode()
			local var2278, var2279 = protoModule.writeTag(buff, var2276, 1, protoModule.wireTypes.lengthDelimited)
			var2278, var3369 = protoModule.writeBuffer(var2278, var2279, var2277, buffer.len(var2277))
			buff = var2278
			var2276 = var2279
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2280, var2281 = protoModule.writeTag(buff, var2276, 2, protoModule.wireTypes.lengthDelimited)
		var2280, var3371 = protoModule.writeString(var2280, var2281, self.selected_sort_id)
		buff = var2280
		var2276 = var2281
	end
	local buff_1 = buffer.create(var2276)
	buffer.copy(buff_1, 0, buff, 0, var2276)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2282 = t_80.new()
	local var2283 = 0
	while var2283 < buffer.len(p80) do
		local _ = nil
		local var2284 = nil
		local var2285, var2286, var2287 = protoModule.readTag(p80, var2283)
		local var2288 = var2285
		var2284 = var2286
		var2283 = var2287
		
		if var2284 == protoModule.wireTypes.varint then
			local _ = nil
			local var2289, var2290 = protoModule.readVarInt(p80, var2283)
			local _ = var2289
			var2283 = var2290
			continue
		end
		if var2284 == protoModule.wireTypes.lengthDelimited then
			if var2288 == 1 then
				local _ = nil
				local var2291, var2292 = protoModule.readBuffer(p80, var2283)
				var2283 = var2292
				table.insert(var2282.sort_options, t.SortSelectorInputData_SortOption.decode(var2291))
			elseif var2288 == 2 then
				local _ = nil
				local var2293, var2294 = protoModule.readBuffer(p80, var2283)
				var2283 = var2294
				var2282.selected_sort_id = buffer.tostring(var2293)
			else
				local _ = nil
				local var2295, var2296 = protoModule.readVarInt(p80, var2283)
				var2283 = var2296 + var2295
			end
		elseif var2284 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2297, var2298 = protoModule.readFixed32(p80, var2283)
			local _ = var2297
			var2283 = var2298
		elseif var2284 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2299, var2300 = protoModule.readFixed64(p80, var2283)
			local _ = var2299
			var2283 = var2300
		else
			error("Unsupported wire type: " .. var2284)
		end
	end
	return var2282
end

function t_80:jsonEncode()
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

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var2301 = t_80.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2301.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2301.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2301.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2301.selected_sort_id = self.selectedSortId
	end
	return var2301
end

t_80.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_80
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		sort_id = if p81 == nil or p81.sort_id == nil then "" else p81.sort_id,
		display_name = if p81 == nil or p81.display_name == nil then "" else p81.display_name,
		content_type = if p81 == nil or p81.content_type == nil then "" else p81.content_type
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2302 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2303, var2304 = protoModule.writeTag(buff, var2302, 1, protoModule.wireTypes.lengthDelimited)
		var2303, var3400 = protoModule.writeString(var2303, var2304, self.sort_id)
		buff = var2303
		var2302 = var2304
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2305, var2306 = protoModule.writeTag(buff, var2302, 2, protoModule.wireTypes.lengthDelimited)
		var2305, var3402 = protoModule.writeString(var2305, var2306, self.display_name)
		buff = var2305
		var2302 = var2306
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2307, var2308 = protoModule.writeTag(buff, var2302, 3, protoModule.wireTypes.lengthDelimited)
		var2307, var3404 = protoModule.writeString(var2307, var2308, self.content_type)
		buff = var2307
		var2302 = var2308
	end
	local buff_1 = buffer.create(var2302)
	buffer.copy(buff_1, 0, buff, 0, var2302)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref)
	local var2302 = t_81.new()
	local var2303 = 0
	while var2303 < buffer.len(p81) do
		local _ = nil
		local var2304 = nil
		local var2305, var2306, var2307 = protoModule.readTag(p81, var2303)
		local var2308 = var2305
		var2304 = var2306
		var2303 = var2307
		
		if var2304 == protoModule.wireTypes.varint then
			local _ = nil
			local var2309, var2310 = protoModule.readVarInt(p81, var2303)
			local _ = var2309
			var2303 = var2310
			continue
		end
		if var2304 == protoModule.wireTypes.lengthDelimited then
			if var2308 == 1 then
				local _ = nil
				local var2311, var2312 = protoModule.readBuffer(p81, var2303)
				var2303 = var2312
				var2302.sort_id = buffer.tostring(var2311)
			elseif var2308 == 2 then
				local _ = nil
				local var2313, var2314 = protoModule.readBuffer(p81, var2303)
				var2303 = var2314
				var2302.display_name = buffer.tostring(var2313)
			elseif var2308 == 3 then
				local _ = nil
				local var2315, var2316 = protoModule.readBuffer(p81, var2303)
				var2303 = var2316
				var2302.content_type = buffer.tostring(var2315)
			else
				local _ = nil
				local var2317, var2318 = protoModule.readVarInt(p81, var2303)
				var2303 = var2318 + var2317
			end
		elseif var2304 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2319, var2320 = protoModule.readFixed32(p81, var2303)
			local _ = var2319
			var2303 = var2320
		elseif var2304 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2321, var2322 = protoModule.readFixed64(p81, var2303)
			local _ = var2321
			var2303 = var2322
		else
			error("Unsupported wire type: " .. var2304)
		end
	end
	return var2302
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref)
	local var2323 = t_81.new()
	
	if self.sort_id ~= nil then
		var2323.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2323.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2323.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2323.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2323.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2323.content_type = self.contentType
	end
	return var2323
end

t_81.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_81
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		selected_option = if p82 == nil or p82.selected_option == nil then "" else p82.selected_option,
		options = if p82 == nil or p82.options == nil then {} else p82.options,
		experience_carousel = if p82 == nil or p82.experience_carousel == nil then nil else p82.experience_carousel
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2323 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2324, var2325 = protoModule.writeTag(buff, var2323, 1, protoModule.wireTypes.lengthDelimited)
		var2324, var3432 = protoModule.writeString(var2324, var2325, self.selected_option)
		buff = var2324
		var2323 = var2325
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2326 = v:encode()
			local var2327, var2328 = protoModule.writeTag(buff, var2323, 2, protoModule.wireTypes.lengthDelimited)
			var2327, var3435 = protoModule.writeBuffer(var2327, var2328, var2326, buffer.len(var2326))
			buff = var2327
			var2323 = var2328
		end
	end
	if self.experience_carousel ~= nil then
		local var2329 = self.experience_carousel:encode()
		local var2330, var2331 = protoModule.writeTag(buff, var2323, 3, protoModule.wireTypes.lengthDelimited)
		var2330, var3438 = protoModule.writeBuffer(var2330, var2331, var2329, buffer.len(var2329))
		buff = var2330
		var2323 = var2331
	end
	local buff_1 = buffer.create(var2323)
	buffer.copy(buff_1, 0, buff, 0, var2323)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2332 = t_82.new()
	local var2333 = 0
	while var2333 < buffer.len(p82) do
		local _ = nil
		local var2334 = nil
		local var2335, var2336, var2337 = protoModule.readTag(p82, var2333)
		local var2338 = var2335
		var2334 = var2336
		var2333 = var2337
		
		if var2334 == protoModule.wireTypes.varint then
			local _ = nil
			local var2339, var2340 = protoModule.readVarInt(p82, var2333)
			local _ = var2339
			var2333 = var2340
			continue
		end
		if var2334 == protoModule.wireTypes.lengthDelimited then
			if var2338 == 1 then
				local _ = nil
				local var2341, var2342 = protoModule.readBuffer(p82, var2333)
				var2333 = var2342
				var2332.selected_option = buffer.tostring(var2341)
			elseif var2338 == 2 then
				local _ = nil
				local var2343, var2344 = protoModule.readBuffer(p82, var2333)
				var2333 = var2344
				table.insert(var2332.options, t.SelectorOption.decode(var2343))
			elseif var2338 == 3 then
				local _ = nil
				local var2345, var2346 = protoModule.readBuffer(p82, var2333)
				var2333 = var2346
				var2332.experience_carousel = t.ExperienceCarouselInputData.decode(var2345)
			else
				local _ = nil
				local var2347, var2348 = protoModule.readVarInt(p82, var2333)
				var2333 = var2348 + var2347
			end
		elseif var2334 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2349, var2350 = protoModule.readFixed32(p82, var2333)
			local _ = var2349
			var2333 = var2350
		elseif var2334 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2351, var2352 = protoModule.readFixed64(p82, var2333)
			local _ = var2351
			var2333 = var2352
		else
			error("Unsupported wire type: " .. var2334)
		end
	end
	return var2332
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), t (ref)
	local var2353 = t_82.new()
	
	if self.selected_option ~= nil then
		var2353.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2353.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2353.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2353.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2353.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2353
end

t_82.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_82
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p83 == nil or p83.id == nil then "" else p83.id,
		preview_rows = if p83 == nil or p83.preview_rows == nil then 0 else p83.preview_rows,
		widget_style = if p83 == nil or p83.widget_style == nil then nil else p83.widget_style,
		see_all_button = if p83 == nil or p83.see_all_button == nil then false else p83.see_all_button,
		information_popover_text = if p83 == nil or p83.information_popover_text == nil then "" else p83.information_popover_text
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2354 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2355, var2356 = protoModule.writeTag(buff, var2354, 1, protoModule.wireTypes.lengthDelimited)
		var2355, var3468 = protoModule.writeString(var2355, var2356, self.id)
		buff = var2355
		var2354 = var2356
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2357, var2358 = protoModule.writeTag(buff, var2354, 4, protoModule.wireTypes.varint)
		var2357, var3470 = protoModule.writeVarInt(var2357, var2358, self.preview_rows)
		buff = var2357
		var2354 = var2358
	end
	if self.widget_style ~= nil then
		local var2359 = self.widget_style:encode()
		local var2360, var2361 = protoModule.writeTag(buff, var2354, 3, protoModule.wireTypes.lengthDelimited)
		var2360, var3473 = protoModule.writeBuffer(var2360, var2361, var2359, buffer.len(var2359))
		buff = var2360
		var2354 = var2361
	end
	if self.see_all_button then
		local var2362, var2363 = protoModule.writeTag(buff, var2354, 5, protoModule.wireTypes.varint)
		var2362, var3475 = protoModule.writeVarInt(var2362, var2363, if self.see_all_button then 1 else 0)
		buff = var2362
		var2354 = var2363
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2364, var2365 = protoModule.writeTag(buff, var2354, 6, protoModule.wireTypes.lengthDelimited)
		var2364, var3477 = protoModule.writeString(var2364, var2365, self.information_popover_text)
		buff = var2364
		var2354 = var2365
	end
	local buff_1 = buffer.create(var2354)
	buffer.copy(buff_1, 0, buff, 0, var2354)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2354 = t_83.new()
	local var2355 = 0
	while var2355 < buffer.len(p83) do
		local _ = nil
		local var2356 = nil
		local var2357, var2358, var2359 = protoModule.readTag(p83, var2355)
		local var2360 = var2357
		var2356 = var2358
		var2355 = var2359
		
		if var2356 == protoModule.wireTypes.varint then
			if var2360 == 4 then
				local _ = nil
				local var2361, var2362 = protoModule.readVarIntI64(p83, var2355)
				var2355 = var2362
				var2354.preview_rows = var2361
			elseif var2360 == 5 then
				local _ = nil
				local var2363, var2364 = protoModule.readVarInt(p83, var2355)
				var2355 = var2364
				var2354.see_all_button = var2363 ~= 0
			else
				local _ = nil
				local var2365, var2366 = protoModule.readVarInt(p83, var2355)
				local _ = var2365
				var2355 = var2366
			end
		end
		if var2356 == protoModule.wireTypes.lengthDelimited then
			if var2360 == 1 then
				local _ = nil
				local var2367, var2368 = protoModule.readBuffer(p83, var2355)
				var2355 = var2368
				var2354.id = buffer.tostring(var2367)
			elseif var2360 == 3 then
				local _ = nil
				local var2369, var2370 = protoModule.readBuffer(p83, var2355)
				var2355 = var2370
				var2354.widget_style = t.WidgetStyleData.decode(var2369)
			elseif var2360 == 6 then
				local _ = nil
				local var2371, var2372 = protoModule.readBuffer(p83, var2355)
				var2355 = var2372
				var2354.information_popover_text = buffer.tostring(var2371)
			else
				local _ = nil
				local var2373, var2374 = protoModule.readVarInt(p83, var2355)
				var2355 = var2374 + var2373
			end
		elseif var2356 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2375, var2376 = protoModule.readFixed32(p83, var2355)
			local _ = var2375
			var2355 = var2376
		elseif var2356 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2377, var2378 = protoModule.readFixed64(p83, var2355)
			local _ = var2377
			var2355 = var2378
		else
			error("Unsupported wire type: " .. var2356)
		end
	end
	return var2354
end

function t_83:jsonEncode()
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

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var2379 = t_83.new()
	
	if self.id ~= nil then
		var2379.id = self.id
	end
	if self.preview_rows ~= nil then
		var2379.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2379.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2379.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2379.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2379.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2379.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2379.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2379.information_popover_text = self.informationPopoverText
	end
	return var2379
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		id = if p84 == nil or p84.id == nil then "" else p84.id,
		num_items_to_show = if p84 == nil or p84.num_items_to_show == nil then 0 else p84.num_items_to_show,
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
		var2380, var3509 = protoModule.writeString(var2380, var2381, self.id)
		buff = var2380
		var2379 = var2381
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2382, var2383 = protoModule.writeTag(buff, var2379, 5, protoModule.wireTypes.varint)
		var2382, var3511 = protoModule.writeVarInt(var2382, var2383, self.num_items_to_show)
		buff = var2382
		var2379 = var2383
	end
	if self.widget_style ~= nil then
		local var2384 = self.widget_style:encode()
		local var2385, var2386 = protoModule.writeTag(buff, var2379, 3, protoModule.wireTypes.lengthDelimited)
		var2385, var3514 = protoModule.writeBuffer(var2385, var2386, var2384, buffer.len(var2384))
		buff = var2385
		var2379 = var2386
	end
	if self.see_all_button then
		local var2387, var2388 = protoModule.writeTag(buff, var2379, 6, protoModule.wireTypes.varint)
		var2387, var3516 = protoModule.writeVarInt(var2387, var2388, if self.see_all_button then 1 else 0)
		buff = var2387
		var2379 = var2388
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2389, var2390 = protoModule.writeTag(buff, var2379, 7, protoModule.wireTypes.lengthDelimited)
		var2389, var3518 = protoModule.writeString(var2389, var2390, self.information_popover_text)
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
			if var2385 == 5 then
				local _ = nil
				local var2386, var2387 = protoModule.readVarIntI64(p84, var2380)
				var2380 = var2387
				var2379.num_items_to_show = var2386
			elseif var2385 == 6 then
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
			elseif var2385 == 7 then
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
			error("Unsupported wire type: " .. var2381)
		end
	end
	return var2379
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var2404 = t_84.new()
	
	if self.id ~= nil then
		var2404.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2404.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2404.num_items_to_show = self.numItemsToShow
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
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		background_layers = if p85 == nil or p85.background_layers == nil then {} else p85.background_layers
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2404 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2405 = v:encode()
			local var2406, var2407 = protoModule.writeTag(buff, var2404, 1, protoModule.wireTypes.lengthDelimited)
			var2406, var3551 = protoModule.writeBuffer(var2406, var2407, var2405, buffer.len(var2405))
			buff = var2406
			var2404 = var2407
		end
	end
	local buff_1 = buffer.create(var2404)
	buffer.copy(buff_1, 0, buff, 0, var2404)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2408 = t_85.new()
	local var2409 = 0
	while var2409 < buffer.len(p85) do
		local _ = nil
		local var2410 = nil
		local var2411, var2412, var2413 = protoModule.readTag(p85, var2409)
		local var2414 = var2411
		var2410 = var2412
		var2409 = var2413
		
		if var2410 == protoModule.wireTypes.varint then
			local _ = nil
			local var2415, var2416 = protoModule.readVarInt(p85, var2409)
			local _ = var2415
			var2409 = var2416
			continue
		end
		if var2410 == protoModule.wireTypes.lengthDelimited then
			if var2414 == 1 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p85, var2409)
				var2409 = var2418
				table.insert(var2408.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2417))
			else
				local _ = nil
				local var2419, var2420 = protoModule.readVarInt(p85, var2409)
				var2409 = var2420 + var2419
			end
		elseif var2410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2421, var2422 = protoModule.readFixed32(p85, var2409)
			local _ = var2421
			var2409 = var2422
		elseif var2410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2423, var2424 = protoModule.readFixed64(p85, var2409)
			local _ = var2423
			var2409 = var2424
		else
			error("Unsupported wire type: " .. var2410)
		end
	end
	return var2408
end

function t_85:jsonEncode()
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

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), backgroundLayerModule (ref)
	local var2425 = t_85.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2425.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2425.background_layers = t
	end
	return var2425
end

t_85.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_85
typeRegistryModule.default:register(t.WidgetStyleData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		id = if p86 == nil or p86.id == nil then "" else p86.id,
		available_until = if p86 == nil or p86.available_until == nil then "" else p86.available_until,
		widget_style = if p86 == nil or p86.widget_style == nil then nil else p86.widget_style
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2426 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2427, var2428 = protoModule.writeTag(buff, var2426, 1, protoModule.wireTypes.lengthDelimited)
		var2427, var3578 = protoModule.writeString(var2427, var2428, self.id)
		buff = var2427
		var2426 = var2428
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2429, var2430 = protoModule.writeTag(buff, var2426, 2, protoModule.wireTypes.lengthDelimited)
		var2429, var3580 = protoModule.writeString(var2429, var2430, self.available_until)
		buff = var2429
		var2426 = var2430
	end
	if self.widget_style ~= nil then
		local var2431 = self.widget_style:encode()
		local var2432, var2433 = protoModule.writeTag(buff, var2426, 3, protoModule.wireTypes.lengthDelimited)
		var2432, var3583 = protoModule.writeBuffer(var2432, var2433, var2431, buffer.len(var2431))
		buff = var2432
		var2426 = var2433
	end
	local buff_1 = buffer.create(var2426)
	buffer.copy(buff_1, 0, buff, 0, var2426)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2426 = t_86.new()
	local var2427 = 0
	while var2427 < buffer.len(p86) do
		local _ = nil
		local var2428 = nil
		local var2429, var2430, var2431 = protoModule.readTag(p86, var2427)
		local var2432 = var2429
		var2428 = var2430
		var2427 = var2431
		
		if var2428 == protoModule.wireTypes.varint then
			local _ = nil
			local var2433, var2434 = protoModule.readVarInt(p86, var2427)
			local _ = var2433
			var2427 = var2434
			continue
		end
		if var2428 == protoModule.wireTypes.lengthDelimited then
			if var2432 == 1 then
				local _ = nil
				local var2435, var2436 = protoModule.readBuffer(p86, var2427)
				var2427 = var2436
				var2426.id = buffer.tostring(var2435)
			elseif var2432 == 2 then
				local _ = nil
				local var2437, var2438 = protoModule.readBuffer(p86, var2427)
				var2427 = var2438
				var2426.available_until = buffer.tostring(var2437)
			elseif var2432 == 3 then
				local _ = nil
				local var2439, var2440 = protoModule.readBuffer(p86, var2427)
				var2427 = var2440
				var2426.widget_style = t.WidgetStyleData.decode(var2439)
			else
				local _ = nil
				local var2441, var2442 = protoModule.readVarInt(p86, var2427)
				var2427 = var2442 + var2441
			end
		elseif var2428 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2443, var2444 = protoModule.readFixed32(p86, var2427)
			local _ = var2443
			var2427 = var2444
		elseif var2428 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2445, var2446 = protoModule.readFixed64(p86, var2427)
			local _ = var2445
			var2427 = var2446
		else
			error("Unsupported wire type: " .. var2428)
		end
	end
	return var2426
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var2447 = t_86.new()
	
	if self.id ~= nil then
		var2447.id = self.id
	end
	if self.available_until ~= nil then
		var2447.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2447.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2447.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2447.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2447
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		entry_map = if p87 == nil or p87.entry_map == nil then {} else p87.entry_map,
		entry_order = if p87 == nil or p87.entry_order == nil then {} else p87.entry_order
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2447 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2448, var2449 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2448, var3611 = protoModule.writeString(var2448, var2449, i)
			local var2450 = v:encode()
			var2449, var3613 = protoModule.writeTag(var2448, var2449, 2, protoModule.wireTypes.lengthDelimited)
			var2449, var3613 = protoModule.writeBuffer(var2449, var3613, var2450, buffer.len(var2450))
			local var2451 = var2449
			local var2452 = var3613
			local var2453, var2454 = protoModule.writeTag(buff, var2447, 1, protoModule.wireTypes.lengthDelimited)
			var2453, var3617 = protoModule.writeBuffer(var2453, var2454, var2451, var2452)
			buff = var2453
			var2447 = var2454
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2455, var2456 = protoModule.writeTag(buff, var2447, 2, protoModule.wireTypes.lengthDelimited)
			var2455, var3619 = protoModule.writeString(var2455, var2456, v)
			buff = var2455
			var2447 = var2456
		end
	end
	local buff_1 = buffer.create(var2447)
	buffer.copy(buff_1, 0, buff, 0, var2447)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2457 = t_87.new()
	local var2458 = 0
	while var2458 < buffer.len(p87) do
		local _ = nil
		local var2459 = nil
		local var2460, var2461, var2462 = protoModule.readTag(p87, var2458)
		local var2463 = var2460
		var2459 = var2461
		var2458 = var2462
		
		if var2459 == protoModule.wireTypes.varint then
			local _ = nil
			local var2464, var2465 = protoModule.readVarInt(p87, var2458)
			local _ = var2464
			var2458 = var2465
			continue
		end
		if var2459 == protoModule.wireTypes.lengthDelimited then
			if var2463 == 1 then
				local _ = nil
				local var2466, var2467 = protoModule.readBuffer(p87, var2458)
				var2458 = var2467
				var2466 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2466)
				var2457.entry_map[var2466.key or ""] = var2466.value or t.FeedEntry.new()
			elseif var2463 == 2 then
				local _ = nil
				local var2468, var2469 = protoModule.readBuffer(p87, var2458)
				var2458 = var2469
				table.insert(var2457.entry_order, buffer.tostring(var2468))
			else
				local _ = nil
				local var2470, var2471 = protoModule.readVarInt(p87, var2458)
				var2458 = var2471 + var2470
			end
		elseif var2459 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2472, var2473 = protoModule.readFixed32(p87, var2458)
			local _ = var2472
			var2458 = var2473
		elseif var2459 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2474, var2475 = protoModule.readFixed64(p87, var2458)
			local _ = var2474
			var2458 = var2475
		else
			error("Unsupported wire type: " .. var2459)
		end
	end
	return var2457
end

function t_87:jsonEncode()
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

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), t (ref)
	local var2476 = t_87.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2476.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2476.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2476.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2476.entry_order = t_1
	end
	return var2476
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		key = if p88 == nil or p88.key == nil then "" else p88.key,
		value = if p88 == nil or p88.value == nil then nil else p88.value
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2477 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2478, var2479 = protoModule.writeTag(buff, var2477, 1, protoModule.wireTypes.lengthDelimited)
		var2478, var3651 = protoModule.writeString(var2478, var2479, self.key)
		buff = var2478
		var2477 = var2479
	end
	if self.value ~= nil then
		local var2480 = self.value:encode()
		local var2481, var2482 = protoModule.writeTag(buff, var2477, 2, protoModule.wireTypes.lengthDelimited)
		var2481, var3654 = protoModule.writeBuffer(var2481, var2482, var2480, buffer.len(var2480))
		buff = var2481
		var2477 = var2482
	end
	local buff_1 = buffer.create(var2477)
	buffer.copy(buff_1, 0, buff, 0, var2477)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2477 = t_88.new()
	local var2478 = 0
	while var2478 < buffer.len(p88) do
		local _ = nil
		local var2479 = nil
		local var2480, var2481, var2482 = protoModule.readTag(p88, var2478)
		local var2483 = var2480
		var2479 = var2481
		var2478 = var2482
		
		if var2479 == protoModule.wireTypes.varint then
			local _ = nil
			local var2484, var2485 = protoModule.readVarInt(p88, var2478)
			local _ = var2484
			var2478 = var2485
			continue
		end
		if var2479 == protoModule.wireTypes.lengthDelimited then
			if var2483 == 1 then
				local _ = nil
				local var2486, var2487 = protoModule.readBuffer(p88, var2478)
				var2478 = var2487
				var2477.key = buffer.tostring(var2486)
			elseif var2483 == 2 then
				local _ = nil
				local var2488, var2489 = protoModule.readBuffer(p88, var2478)
				var2478 = var2489
				var2477.value = t.FeedEntry.decode(var2488)
			else
				local _ = nil
				local var2490, var2491 = protoModule.readVarInt(p88, var2478)
				var2478 = var2491 + var2490
			end
		elseif var2479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2492, var2493 = protoModule.readFixed32(p88, var2478)
			local _ = var2492
			var2478 = var2493
		elseif var2479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2494, var2495 = protoModule.readFixed64(p88, var2478)
			local _ = var2494
			var2478 = var2495
		else
			error("Unsupported wire type: " .. var2479)
		end
	end
	return var2477
end

function t_88:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var2496 = t_88.new()
	
	if self.key ~= nil then
		var2496.key = self.key
	end
	if self.value ~= nil then
		var2496.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2496
end

t_88.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_88
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p89 == nil or p89.marketplace_catalog_category_items == nil then {} else p89.marketplace_catalog_category_items,
		active_category_id = if p89 == nil or p89.active_category_id == nil then "" else p89.active_category_id,
		active_tooltip_idx = if p89 == nil or p89.active_tooltip_idx == nil then 0 else p89.active_tooltip_idx
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2496 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2497 = v:encode()
			local var2498, var2499 = protoModule.writeTag(buff, var2496, 1, protoModule.wireTypes.lengthDelimited)
			var2498, var3681 = protoModule.writeBuffer(var2498, var2499, var2497, buffer.len(var2497))
			buff = var2498
			var2496 = var2499
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2500, var2501 = protoModule.writeTag(buff, var2496, 2, protoModule.wireTypes.lengthDelimited)
		var2500, var3683 = protoModule.writeString(var2500, var2501, self.active_category_id)
		buff = var2500
		var2496 = var2501
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2502, var2503 = protoModule.writeTag(buff, var2496, 3, protoModule.wireTypes.varint)
		var2502, var3685 = protoModule.writeVarInt(var2502, var2503, self.active_tooltip_idx)
		buff = var2502
		var2496 = var2503
	end
	local buff_1 = buffer.create(var2496)
	buffer.copy(buff_1, 0, buff, 0, var2496)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2504 = t_89.new()
	local var2505 = 0
	while var2505 < buffer.len(p89) do
		local _ = nil
		local var2506 = nil
		local var2507, var2508, var2509 = protoModule.readTag(p89, var2505)
		local var2510 = var2507
		var2506 = var2508
		var2505 = var2509
		
		if var2506 == protoModule.wireTypes.varint then
			if var2510 == 3 then
				local _ = nil
				local var2511, var2512 = protoModule.readVarIntI64(p89, var2505)
				var2505 = var2512
				var2504.active_tooltip_idx = var2511
			else
				local _ = nil
				local var2513, var2514 = protoModule.readVarInt(p89, var2505)
				local _ = var2513
				var2505 = var2514
			end
		end
		if var2506 == protoModule.wireTypes.lengthDelimited then
			if var2510 == 1 then
				local _ = nil
				local var2515, var2516 = protoModule.readBuffer(p89, var2505)
				var2505 = var2516
				table.insert(var2504.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2515))
			elseif var2510 == 2 then
				local _ = nil
				local var2517, var2518 = protoModule.readBuffer(p89, var2505)
				var2505 = var2518
				var2504.active_category_id = buffer.tostring(var2517)
			else
				local _ = nil
				local var2519, var2520 = protoModule.readVarInt(p89, var2505)
				var2505 = var2520 + var2519
			end
		elseif var2506 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2521, var2522 = protoModule.readFixed32(p89, var2505)
			local _ = var2521
			var2505 = var2522
		elseif var2506 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed64(p89, var2505)
			local _ = var2523
			var2505 = var2524
		else
			error("Unsupported wire type: " .. var2506)
		end
	end
	return var2504
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), t (ref)
	local var2525 = t_89.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2525.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2525.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2525.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2525.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2525.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2525.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2525
end

t_89.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_89
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p90 == nil or p90.marketplace_catalog_category_item_id == nil then "" else p90.marketplace_catalog_category_item_id
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2526 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2527, var2528 = protoModule.writeTag(buff, var2526, 1, protoModule.wireTypes.lengthDelimited)
		var2527, var3716 = protoModule.writeString(var2527, var2528, self.marketplace_catalog_category_item_id)
		buff = var2527
		var2526 = var2528
	end
	local buff_1 = buffer.create(var2526)
	buffer.copy(buff_1, 0, buff, 0, var2526)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2526 = t_90.new()
	local var2527 = 0
	while var2527 < buffer.len(p90) do
		local _ = nil
		local var2528 = nil
		local var2529, var2530, var2531 = protoModule.readTag(p90, var2527)
		local var2532 = var2529
		var2528 = var2530
		var2527 = var2531
		
		if var2528 == protoModule.wireTypes.varint then
			local _ = nil
			local var2533, var2534 = protoModule.readVarInt(p90, var2527)
			local _ = var2533
			var2527 = var2534
			continue
		end
		if var2528 == protoModule.wireTypes.lengthDelimited then
			if var2532 == 1 then
				local _ = nil
				local var2535, var2536 = protoModule.readBuffer(p90, var2527)
				var2527 = var2536
				var2526.marketplace_catalog_category_item_id = buffer.tostring(var2535)
			else
				local _ = nil
				local var2537, var2538 = protoModule.readVarInt(p90, var2527)
				var2527 = var2538 + var2537
			end
		elseif var2528 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2539, var2540 = protoModule.readFixed32(p90, var2527)
			local _ = var2539
			var2527 = var2540
		elseif var2528 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2541, var2542 = protoModule.readFixed64(p90, var2527)
			local _ = var2541
			var2527 = var2542
		else
			error("Unsupported wire type: " .. var2528)
		end
	end
	return var2526
end

function t_90:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_90:jsonDecode()
	-- upvalues: t_90 (ref)
	local var2543 = t_90.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2543.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2543.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2543
end

t_90.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_90
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		hero_icon = if p91 == nil or p91.hero_icon == nil then nil else p91.hero_icon,
		body_dismiss_button_text = if p91 == nil or p91.body_dismiss_button_text == nil then "" else p91.body_dismiss_button_text,
		body_title = if p91 == nil or p91.body_title == nil then "" else p91.body_title,
		body_rich_text = if p91 == nil or p91.body_rich_text == nil then "" else p91.body_rich_text,
		terms_link_text = if p91 == nil or p91.terms_link_text == nil then nil else p91.terms_link_text,
		terms_title = if p91 == nil or p91.terms_title == nil then nil else p91.terms_title,
		terms_body_rich_text = if p91 == nil or p91.terms_body_rich_text == nil then nil else p91.terms_body_rich_text,
		terms_dismiss_button_text = if p91 == nil or p91.terms_dismiss_button_text == nil then nil else p91.terms_dismiss_button_text,
		offer_id = if p91 == nil or p91.offer_id == nil then "" else p91.offer_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2543 = 0
	
	if self.hero_icon ~= nil then
		local var2544, var2545 = protoModule.writeTag(buff, var2543, 1, protoModule.wireTypes.lengthDelimited)
		var2544, var3740 = protoModule.writeString(var2544, var2545, self.hero_icon)
		buff = var2544
		var2543 = var2545
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2546, var2547 = protoModule.writeTag(buff, var2543, 2, protoModule.wireTypes.lengthDelimited)
		var2546, var3742 = protoModule.writeString(var2546, var2547, self.body_dismiss_button_text)
		buff = var2546
		var2543 = var2547
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2548, var2549 = protoModule.writeTag(buff, var2543, 3, protoModule.wireTypes.lengthDelimited)
		var2548, var3744 = protoModule.writeString(var2548, var2549, self.body_title)
		buff = var2548
		var2543 = var2549
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2550, var2551 = protoModule.writeTag(buff, var2543, 4, protoModule.wireTypes.lengthDelimited)
		var2550, var3746 = protoModule.writeString(var2550, var2551, self.body_rich_text)
		buff = var2550
		var2543 = var2551
	end
	if self.terms_link_text ~= nil then
		local var2552, var2553 = protoModule.writeTag(buff, var2543, 5, protoModule.wireTypes.lengthDelimited)
		var2552, var3748 = protoModule.writeString(var2552, var2553, self.terms_link_text)
		buff = var2552
		var2543 = var2553
	end
	if self.terms_title ~= nil then
		local var2554, var2555 = protoModule.writeTag(buff, var2543, 6, protoModule.wireTypes.lengthDelimited)
		var2554, var3750 = protoModule.writeString(var2554, var2555, self.terms_title)
		buff = var2554
		var2543 = var2555
	end
	if self.terms_body_rich_text ~= nil then
		local var2556, var2557 = protoModule.writeTag(buff, var2543, 7, protoModule.wireTypes.lengthDelimited)
		var2556, var3752 = protoModule.writeString(var2556, var2557, self.terms_body_rich_text)
		buff = var2556
		var2543 = var2557
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2558, var2559 = protoModule.writeTag(buff, var2543, 8, protoModule.wireTypes.lengthDelimited)
		var2558, var3754 = protoModule.writeString(var2558, var2559, self.terms_dismiss_button_text)
		buff = var2558
		var2543 = var2559
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2560, var2561 = protoModule.writeTag(buff, var2543, 9, protoModule.wireTypes.lengthDelimited)
		var2560, var3756 = protoModule.writeString(var2560, var2561, self.offer_id)
		buff = var2560
		var2543 = var2561
	end
	local buff_1 = buffer.create(var2543)
	buffer.copy(buff_1, 0, buff, 0, var2543)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref)
	local var2543 = t_91.new()
	local var2544 = 0
	while var2544 < buffer.len(p91) do
		local _ = nil
		local var2545 = nil
		local var2546, var2547, var2548 = protoModule.readTag(p91, var2544)
		local var2549 = var2546
		var2545 = var2547
		var2544 = var2548
		
		if var2545 == protoModule.wireTypes.varint then
			local _ = nil
			local var2550, var2551 = protoModule.readVarInt(p91, var2544)
			local _ = var2550
			var2544 = var2551
			continue
		end
		if var2545 == protoModule.wireTypes.lengthDelimited then
			if var2549 == 1 then
				local _ = nil
				local var2552, var2553 = protoModule.readBuffer(p91, var2544)
				var2544 = var2553
				var2543.hero_icon = buffer.tostring(var2552)
			elseif var2549 == 2 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p91, var2544)
				var2544 = var2555
				var2543.body_dismiss_button_text = buffer.tostring(var2554)
			elseif var2549 == 3 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p91, var2544)
				var2544 = var2557
				var2543.body_title = buffer.tostring(var2556)
			elseif var2549 == 4 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p91, var2544)
				var2544 = var2559
				var2543.body_rich_text = buffer.tostring(var2558)
			elseif var2549 == 5 then
				local _ = nil
				local var2560, var2561 = protoModule.readBuffer(p91, var2544)
				var2544 = var2561
				var2543.terms_link_text = buffer.tostring(var2560)
			elseif var2549 == 6 then
				local _ = nil
				local var2562, var2563 = protoModule.readBuffer(p91, var2544)
				var2544 = var2563
				var2543.terms_title = buffer.tostring(var2562)
			elseif var2549 == 7 then
				local _ = nil
				local var2564, var2565 = protoModule.readBuffer(p91, var2544)
				var2544 = var2565
				var2543.terms_body_rich_text = buffer.tostring(var2564)
			elseif var2549 == 8 then
				local _ = nil
				local var2566, var2567 = protoModule.readBuffer(p91, var2544)
				var2544 = var2567
				var2543.terms_dismiss_button_text = buffer.tostring(var2566)
			elseif var2549 == 9 then
				local _ = nil
				local var2568, var2569 = protoModule.readBuffer(p91, var2544)
				var2544 = var2569
				var2543.offer_id = buffer.tostring(var2568)
			else
				local _ = nil
				local var2570, var2571 = protoModule.readVarInt(p91, var2544)
				var2544 = var2571 + var2570
			end
		elseif var2545 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2572, var2573 = protoModule.readFixed32(p91, var2544)
			local _ = var2572
			var2544 = var2573
		elseif var2545 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2574, var2575 = protoModule.readFixed64(p91, var2544)
			local _ = var2574
			var2544 = var2575
		else
			error("Unsupported wire type: " .. var2545)
		end
	end
	return var2543
end

function t_91:jsonEncode()
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref)
	local var2576 = t_91.new()
	
	if self.hero_icon ~= nil then
		var2576.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2576.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2576.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2576.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2576.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2576.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2576.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2576.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2576.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2576.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2576.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2576.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2576.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2576.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2576.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2576.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2576.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2576.offer_id = self.offerId
	end
	return var2576
end

t_91.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_91
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t_92 (ref)
	return setmetatable({
		item_id = if p92 == nil or p92.item_id == nil then "" else p92.item_id,
		item_type = if p92 == nil or p92.item_type == nil then "" else p92.item_type,
		prefer_three_dimensional = if p92 == nil or p92.prefer_three_dimensional == nil then false else p92.prefer_three_dimensional,
		bundle_type = if p92 == nil or p92.bundle_type == nil then nil else p92.bundle_type,
		bundle_items = if p92 == nil or p92.bundle_items == nil then {} else p92.bundle_items
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2576 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2577, var2578 = protoModule.writeTag(buff, var2576, 1, protoModule.wireTypes.lengthDelimited)
		var2577, var3796 = protoModule.writeString(var2577, var2578, self.item_id)
		buff = var2577
		var2576 = var2578
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2579, var2580 = protoModule.writeTag(buff, var2576, 2, protoModule.wireTypes.lengthDelimited)
		var2579, var3798 = protoModule.writeString(var2579, var2580, self.item_type)
		buff = var2579
		var2576 = var2580
	end
	if self.prefer_three_dimensional then
		local var2581, var2582 = protoModule.writeTag(buff, var2576, 3, protoModule.wireTypes.varint)
		var2581, var3800 = protoModule.writeVarInt(var2581, var2582, if self.prefer_three_dimensional then 1 else 0)
		buff = var2581
		var2576 = var2582
	end
	if self.bundle_type ~= nil then
		local var2583, var2584 = protoModule.writeTag(buff, var2576, 4, protoModule.wireTypes.lengthDelimited)
		var2583, var3802 = protoModule.writeString(var2583, var2584, self.bundle_type)
		buff = var2583
		var2576 = var2584
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2585 = v:encode()
			local var2586, var2587 = protoModule.writeTag(buff, var2576, 5, protoModule.wireTypes.lengthDelimited)
			var2586, var3805 = protoModule.writeBuffer(var2586, var2587, var2585, buffer.len(var2585))
			buff = var2586
			var2576 = var2587
		end
	end
	local buff_1 = buffer.create(var2576)
	buffer.copy(buff_1, 0, buff, 0, var2576)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2588 = t_92.new()
	local var2589 = 0
	while var2589 < buffer.len(p92) do
		local _ = nil
		local var2590 = nil
		local var2591, var2592, var2593 = protoModule.readTag(p92, var2589)
		local var2594 = var2591
		var2590 = var2592
		var2589 = var2593
		
		if var2590 == protoModule.wireTypes.varint then
			if var2594 == 3 then
				local _ = nil
				local var2595, var2596 = protoModule.readVarInt(p92, var2589)
				var2589 = var2596
				var2588.prefer_three_dimensional = var2595 ~= 0
			else
				local _ = nil
				local var2597, var2598 = protoModule.readVarInt(p92, var2589)
				local _ = var2597
				var2589 = var2598
			end
		end
		if var2590 == protoModule.wireTypes.lengthDelimited then
			if var2594 == 1 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p92, var2589)
				var2589 = var2600
				var2588.item_id = buffer.tostring(var2599)
			elseif var2594 == 2 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p92, var2589)
				var2589 = var2602
				var2588.item_type = buffer.tostring(var2601)
			elseif var2594 == 4 then
				local _ = nil
				local var2603, var2604 = protoModule.readBuffer(p92, var2589)
				var2589 = var2604
				var2588.bundle_type = buffer.tostring(var2603)
			elseif var2594 == 5 then
				local _ = nil
				local var2605, var2606 = protoModule.readBuffer(p92, var2589)
				var2589 = var2606
				table.insert(var2588.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2605))
			else
				local _ = nil
				local var2607, var2608 = protoModule.readVarInt(p92, var2589)
				var2589 = var2608 + var2607
			end
		elseif var2590 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2609, var2610 = protoModule.readFixed32(p92, var2589)
			local _ = var2609
			var2589 = var2610
		elseif var2590 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2611, var2612 = protoModule.readFixed64(p92, var2589)
			local _ = var2611
			var2589 = var2612
		else
			error("Unsupported wire type: " .. var2590)
		end
	end
	return var2588
end

function t_92:jsonEncode()
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

function t_92:jsonDecode()
	-- upvalues: t_92 (ref), t (ref)
	local var2613 = t_92.new()
	
	if self.item_id ~= nil then
		var2613.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2613.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2613.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2613.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2613.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2613.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2613.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2613.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2613.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2613.bundle_items = t_1
	end
	return var2613
end

t_92.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceItemMediaHeaderInputData"
}
t.MarketplaceItemMediaHeaderInputData = t_92
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		id = if p93 == nil or p93.id == nil then "" else p93.id,
		type = if p93 == nil or p93.type == nil then "" else p93.type
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2614 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2615, var2616 = protoModule.writeTag(buff, var2614, 1, protoModule.wireTypes.lengthDelimited)
		var2615, var3840 = protoModule.writeString(var2615, var2616, self.id)
		buff = var2615
		var2614 = var2616
	end
	if self.type ~= nil and self.type ~= "" then
		local var2617, var2618 = protoModule.writeTag(buff, var2614, 2, protoModule.wireTypes.lengthDelimited)
		var2617, var3842 = protoModule.writeString(var2617, var2618, self.type)
		buff = var2617
		var2614 = var2618
	end
	local buff_1 = buffer.create(var2614)
	buffer.copy(buff_1, 0, buff, 0, var2614)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref)
	local var2614 = t_93.new()
	local var2615 = 0
	while var2615 < buffer.len(p93) do
		local _ = nil
		local var2616 = nil
		local var2617, var2618, var2619 = protoModule.readTag(p93, var2615)
		local var2620 = var2617
		var2616 = var2618
		var2615 = var2619
		
		if var2616 == protoModule.wireTypes.varint then
			local _ = nil
			local var2621, var2622 = protoModule.readVarInt(p93, var2615)
			local _ = var2621
			var2615 = var2622
			continue
		end
		if var2616 == protoModule.wireTypes.lengthDelimited then
			if var2620 == 1 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p93, var2615)
				var2615 = var2624
				var2614.id = buffer.tostring(var2623)
			elseif var2620 == 2 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p93, var2615)
				var2615 = var2626
				var2614.type = buffer.tostring(var2625)
			else
				local _ = nil
				local var2627, var2628 = protoModule.readVarInt(p93, var2615)
				var2615 = var2628 + var2627
			end
		elseif var2616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2629, var2630 = protoModule.readFixed32(p93, var2615)
			local _ = var2629
			var2615 = var2630
		elseif var2616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2631, var2632 = protoModule.readFixed64(p93, var2615)
			local _ = var2631
			var2615 = var2632
		else
			error("Unsupported wire type: " .. var2616)
		end
	end
	return var2614
end

function t_93:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref)
	local var2633 = t_93.new()
	
	if self.id ~= nil then
		var2633.id = self.id
	end
	if self.type ~= nil then
		var2633.type = self.type
	end
	return var2633
end

t_93.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData_BundleItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.BundleItem"
}
t.MarketplaceItemMediaHeaderInputData_BundleItem = t_93
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData_BundleItem)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		items = if p94 == nil or p94.items == nil then {} else p94.items,
		preview_columns = if p94 == nil or p94.preview_columns == nil then 0 else p94.preview_columns,
		impression_id = if p94 == nil or p94.impression_id == nil then "" else p94.impression_id
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2633 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2634 = v:encode()
			local var2635, var2636 = protoModule.writeTag(buff, var2633, 1, protoModule.wireTypes.lengthDelimited)
			var2635, var3869 = protoModule.writeBuffer(var2635, var2636, var2634, buffer.len(var2634))
			buff = var2635
			var2633 = var2636
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2637, var2638 = protoModule.writeTag(buff, var2633, 2, protoModule.wireTypes.varint)
		var2637, var3871 = protoModule.writeVarInt(var2637, var2638, self.preview_columns)
		buff = var2637
		var2633 = var2638
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2639, var2640 = protoModule.writeTag(buff, var2633, 3, protoModule.wireTypes.lengthDelimited)
		var2639, var3873 = protoModule.writeString(var2639, var2640, self.impression_id)
		buff = var2639
		var2633 = var2640
	end
	local buff_1 = buffer.create(var2633)
	buffer.copy(buff_1, 0, buff, 0, var2633)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2641 = t_94.new()
	local var2642 = 0
	while var2642 < buffer.len(p94) do
		local _ = nil
		local var2643 = nil
		local var2644, var2645, var2646 = protoModule.readTag(p94, var2642)
		local var2647 = var2644
		var2643 = var2645
		var2642 = var2646
		
		if var2643 == protoModule.wireTypes.varint then
			if var2647 == 2 then
				local _ = nil
				local var2648, var2649 = protoModule.readVarIntI32(p94, var2642)
				var2642 = var2649
				var2641.preview_columns = var2648
			else
				local _ = nil
				local var2650, var2651 = protoModule.readVarInt(p94, var2642)
				local _ = var2650
				var2642 = var2651
			end
		end
		if var2643 == protoModule.wireTypes.lengthDelimited then
			if var2647 == 1 then
				local _ = nil
				local var2652, var2653 = protoModule.readBuffer(p94, var2642)
				var2642 = var2653
				table.insert(var2641.items, t.CatalogItemGridInputData_CatalogItem.decode(var2652))
			elseif var2647 == 3 then
				local _ = nil
				local var2654, var2655 = protoModule.readBuffer(p94, var2642)
				var2642 = var2655
				var2641.impression_id = buffer.tostring(var2654)
			else
				local _ = nil
				local var2656, var2657 = protoModule.readVarInt(p94, var2642)
				var2642 = var2657 + var2656
			end
		elseif var2643 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2658, var2659 = protoModule.readFixed32(p94, var2642)
			local _ = var2658
			var2642 = var2659
		elseif var2643 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2660, var2661 = protoModule.readFixed64(p94, var2642)
			local _ = var2660
			var2642 = var2661
		else
			error("Unsupported wire type: " .. var2643)
		end
	end
	return var2641
end

function t_94:jsonEncode()
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

function t_94:jsonDecode()
	-- upvalues: t_94 (ref), t (ref)
	local var2662 = t_94.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2662.items = t_1
	end
	if self.preview_columns ~= nil then
		var2662.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2662.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2662.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2662.impression_id = self.impressionId
	end
	return var2662
end

t_94.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_94
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		id = if p95 == nil or p95.id == nil then "" else p95.id,
		type = if p95 == nil or p95.type == nil then "" else p95.type
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2663 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2664, var2665 = protoModule.writeTag(buff, var2663, 1, protoModule.wireTypes.lengthDelimited)
		var2664, var3903 = protoModule.writeString(var2664, var2665, self.id)
		buff = var2664
		var2663 = var2665
	end
	if self.type ~= nil and self.type ~= "" then
		local var2666, var2667 = protoModule.writeTag(buff, var2663, 2, protoModule.wireTypes.lengthDelimited)
		var2666, var3905 = protoModule.writeString(var2666, var2667, self.type)
		buff = var2666
		var2663 = var2667
	end
	local buff_1 = buffer.create(var2663)
	buffer.copy(buff_1, 0, buff, 0, var2663)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref)
	local var2663 = t_95.new()
	local var2664 = 0
	while var2664 < buffer.len(p95) do
		local _ = nil
		local var2665 = nil
		local var2666, var2667, var2668 = protoModule.readTag(p95, var2664)
		local var2669 = var2666
		var2665 = var2667
		var2664 = var2668
		
		if var2665 == protoModule.wireTypes.varint then
			local _ = nil
			local var2670, var2671 = protoModule.readVarInt(p95, var2664)
			local _ = var2670
			var2664 = var2671
			continue
		end
		if var2665 == protoModule.wireTypes.lengthDelimited then
			if var2669 == 1 then
				local _ = nil
				local var2672, var2673 = protoModule.readBuffer(p95, var2664)
				var2664 = var2673
				var2663.id = buffer.tostring(var2672)
			elseif var2669 == 2 then
				local _ = nil
				local var2674, var2675 = protoModule.readBuffer(p95, var2664)
				var2664 = var2675
				var2663.type = buffer.tostring(var2674)
			else
				local _ = nil
				local var2676, var2677 = protoModule.readVarInt(p95, var2664)
				var2664 = var2677 + var2676
			end
		elseif var2665 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2678, var2679 = protoModule.readFixed32(p95, var2664)
			local _ = var2678
			var2664 = var2679
		elseif var2665 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2680, var2681 = protoModule.readFixed64(p95, var2664)
			local _ = var2680
			var2664 = var2681
		else
			error("Unsupported wire type: " .. var2665)
		end
	end
	return var2663
end

function t_95:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_95:jsonDecode()
	-- upvalues: t_95 (ref)
	local var2682 = t_95.new()
	
	if self.id ~= nil then
		var2682.id = self.id
	end
	if self.type ~= nil then
		var2682.type = self.type
	end
	return var2682
end

t_95.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_95
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		entry_map = if p96 == nil or p96.entry_map == nil then {} else p96.entry_map,
		entry_order = if p96 == nil or p96.entry_order == nil then {} else p96.entry_order,
		content_pools = if p96 == nil or p96.content_pools == nil then {} else p96.content_pools,
		search_session_id = if p96 == nil or p96.search_session_id == nil then "" else p96.search_session_id
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2682 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2683, var2684 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2683, var3931 = protoModule.writeString(var2683, var2684, i)
			local var2685 = v:encode()
			var2684, var3933 = protoModule.writeTag(var2683, var2684, 2, protoModule.wireTypes.lengthDelimited)
			var2684, var3933 = protoModule.writeBuffer(var2684, var3933, var2685, buffer.len(var2685))
			local var2686 = var2684
			local var2687 = var3933
			local var2688, var2689 = protoModule.writeTag(buff, var2682, 1, protoModule.wireTypes.lengthDelimited)
			var2688, var3937 = protoModule.writeBuffer(var2688, var2689, var2686, var2687)
			buff = var2688
			var2682 = var2689
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2690, var2691 = protoModule.writeTag(buff, var2682, 2, protoModule.wireTypes.lengthDelimited)
			var2690, var3939 = protoModule.writeString(var2690, var2691, v)
			buff = var2690
			var2682 = var2691
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2692, var2693 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2692, var3941 = protoModule.writeString(var2692, var2693, i)
			local var2694 = v:encode()
			var2693, var3943 = protoModule.writeTag(var2692, var2693, 2, protoModule.wireTypes.lengthDelimited)
			var2693, var3943 = protoModule.writeBuffer(var2693, var3943, var2694, buffer.len(var2694))
			local var2695 = var2693
			local var2696 = var3943
			local var2697, var2698 = protoModule.writeTag(buff, var2682, 3, protoModule.wireTypes.lengthDelimited)
			var2697, var3947 = protoModule.writeBuffer(var2697, var2698, var2695, var2696)
			buff = var2697
			var2682 = var2698
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2699, var2700 = protoModule.writeTag(buff, var2682, 4, protoModule.wireTypes.lengthDelimited)
		var2699, var3949 = protoModule.writeString(var2699, var2700, self.search_session_id)
		buff = var2699
		var2682 = var2700
	end
	local buff_1 = buffer.create(var2682)
	buffer.copy(buff_1, 0, buff, 0, var2682)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2701 = t_96.new()
	local var2702 = 0
	while var2702 < buffer.len(p96) do
		local _ = nil
		local var2703 = nil
		local var2704, var2705, var2706 = protoModule.readTag(p96, var2702)
		local var2707 = var2704
		var2703 = var2705
		var2702 = var2706
		
		if var2703 == protoModule.wireTypes.varint then
			local _ = nil
			local var2708, var2709 = protoModule.readVarInt(p96, var2702)
			local _ = var2708
			var2702 = var2709
			continue
		end
		if var2703 == protoModule.wireTypes.lengthDelimited then
			if var2707 == 1 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p96, var2702)
				var2702 = var2711
				var2710 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2710)
				var2701.entry_map[var2710.key or ""] = var2710.value or t.FeedEntry.new()
			elseif var2707 == 2 then
				local _ = nil
				local var2712, var2713 = protoModule.readBuffer(p96, var2702)
				var2702 = var2713
				table.insert(var2701.entry_order, buffer.tostring(var2712))
			elseif var2707 == 3 then
				local _ = nil
				local var2714, var2715 = protoModule.readBuffer(p96, var2702)
				var2702 = var2715
				var2714 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2714)
				var2701.content_pools[var2714.key or ""] = var2714.value or t.ContentPool.new()
			elseif var2707 == 4 then
				local _ = nil
				local var2716, var2717 = protoModule.readBuffer(p96, var2702)
				var2702 = var2717
				var2701.search_session_id = buffer.tostring(var2716)
			else
				local _ = nil
				local var2718, var2719 = protoModule.readVarInt(p96, var2702)
				var2702 = var2719 + var2718
			end
		elseif var2703 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2720, var2721 = protoModule.readFixed32(p96, var2702)
			local _ = var2720
			var2702 = var2721
		elseif var2703 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2722, var2723 = protoModule.readFixed64(p96, var2702)
			local _ = var2722
			var2702 = var2723
		else
			error("Unsupported wire type: " .. var2703)
		end
	end
	return var2701
end

function t_96:jsonEncode()
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
	return t
end

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var2724 = t_96.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2724.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2724.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2724.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2724.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2724.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2724.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2724.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2724.search_session_id = self.searchSessionId
	end
	return var2724
end

t_96.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_96
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		key = if p97 == nil or p97.key == nil then "" else p97.key,
		value = if p97 == nil or p97.value == nil then nil else p97.value
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2725 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2726, var2727 = protoModule.writeTag(buff, var2725, 1, protoModule.wireTypes.lengthDelimited)
		var2726, var3988 = protoModule.writeString(var2726, var2727, self.key)
		buff = var2726
		var2725 = var2727
	end
	if self.value ~= nil then
		local var2728 = self.value:encode()
		local var2729, var2730 = protoModule.writeTag(buff, var2725, 2, protoModule.wireTypes.lengthDelimited)
		var2729, var3991 = protoModule.writeBuffer(var2729, var2730, var2728, buffer.len(var2728))
		buff = var2729
		var2725 = var2730
	end
	local buff_1 = buffer.create(var2725)
	buffer.copy(buff_1, 0, buff, 0, var2725)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2725 = t_97.new()
	local var2726 = 0
	while var2726 < buffer.len(p97) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p97, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			local _ = nil
			local var2732, var2733 = protoModule.readVarInt(p97, var2726)
			local _ = var2732
			var2726 = var2733
			continue
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readBuffer(p97, var2726)
				var2726 = var2735
				var2725.key = buffer.tostring(var2734)
			elseif var2731 == 2 then
				local _ = nil
				local var2736, var2737 = protoModule.readBuffer(p97, var2726)
				var2726 = var2737
				var2725.value = t.FeedEntry.decode(var2736)
			else
				local _ = nil
				local var2738, var2739 = protoModule.readVarInt(p97, var2726)
				var2726 = var2739 + var2738
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2740, var2741 = protoModule.readFixed32(p97, var2726)
			local _ = var2740
			var2726 = var2741
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2742, var2743 = protoModule.readFixed64(p97, var2726)
			local _ = var2742
			var2726 = var2743
		else
			error("Unsupported wire type: " .. var2727)
		end
	end
	return var2725
end

function t_97:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref), t (ref)
	local var2744 = t_97.new()
	
	if self.key ~= nil then
		var2744.key = self.key
	end
	if self.value ~= nil then
		var2744.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2744
end

t_97.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_97
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
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
	local var2744 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2745, var2746 = protoModule.writeTag(buff, var2744, 1, protoModule.wireTypes.lengthDelimited)
		var2745, var4017 = protoModule.writeString(var2745, var2746, self.key)
		buff = var2745
		var2744 = var2746
	end
	if self.value ~= nil then
		local var2747 = self.value:encode()
		local var2748, var2749 = protoModule.writeTag(buff, var2744, 2, protoModule.wireTypes.lengthDelimited)
		var2748, var4020 = protoModule.writeBuffer(var2748, var2749, var2747, buffer.len(var2747))
		buff = var2748
		var2744 = var2749
	end
	local buff_1 = buffer.create(var2744)
	buffer.copy(buff_1, 0, buff, 0, var2744)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2744 = t_98.new()
	local var2745 = 0
	while var2745 < buffer.len(p98) do
		local _ = nil
		local var2746 = nil
		local var2747, var2748, var2749 = protoModule.readTag(p98, var2745)
		local var2750 = var2747
		var2746 = var2748
		var2745 = var2749
		
		if var2746 == protoModule.wireTypes.varint then
			local _ = nil
			local var2751, var2752 = protoModule.readVarInt(p98, var2745)
			local _ = var2751
			var2745 = var2752
			continue
		end
		if var2746 == protoModule.wireTypes.lengthDelimited then
			if var2750 == 1 then
				local _ = nil
				local var2753, var2754 = protoModule.readBuffer(p98, var2745)
				var2745 = var2754
				var2744.key = buffer.tostring(var2753)
			elseif var2750 == 2 then
				local _ = nil
				local var2755, var2756 = protoModule.readBuffer(p98, var2745)
				var2745 = var2756
				var2744.value = t.ContentPool.decode(var2755)
			else
				local _ = nil
				local var2757, var2758 = protoModule.readVarInt(p98, var2745)
				var2745 = var2758 + var2757
			end
		elseif var2746 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2759, var2760 = protoModule.readFixed32(p98, var2745)
			local _ = var2759
			var2745 = var2760
		elseif var2746 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2761, var2762 = protoModule.readFixed64(p98, var2745)
			local _ = var2761
			var2745 = var2762
		else
			error("Unsupported wire type: " .. var2746)
		end
	end
	return var2744
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
	local var2763 = t_98.new()
	
	if self.key ~= nil then
		var2763.key = self.key
	end
	if self.value ~= nil then
		var2763.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2763
end

t_98.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_98
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		universe_id = if p99 == nil or p99.universe_id == nil then "" else p99.universe_id,
		is_content_locked = if p99 == nil or p99.is_content_locked == nil then false else p99.is_content_locked
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2763 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2764, var2765 = protoModule.writeTag(buff, var2763, 1, protoModule.wireTypes.lengthDelimited)
		var2764, var4046 = protoModule.writeString(var2764, var2765, self.universe_id)
		buff = var2764
		var2763 = var2765
	end
	if self.is_content_locked then
		local var2766, var2767 = protoModule.writeTag(buff, var2763, 2, protoModule.wireTypes.varint)
		var2766, var4048 = protoModule.writeVarInt(var2766, var2767, if self.is_content_locked then 1 else 0)
		buff = var2766
		var2763 = var2767
	end
	local buff_1 = buffer.create(var2763)
	buffer.copy(buff_1, 0, buff, 0, var2763)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2763 = t_99.new()
	local var2764 = 0
	while var2764 < buffer.len(p99) do
		local _ = nil
		local var2765 = nil
		local var2766, var2767, var2768 = protoModule.readTag(p99, var2764)
		local var2769 = var2766
		var2765 = var2767
		var2764 = var2768
		
		if var2765 == protoModule.wireTypes.varint then
			if var2769 == 2 then
				local _ = nil
				local var2770, var2771 = protoModule.readVarInt(p99, var2764)
				var2764 = var2771
				var2763.is_content_locked = var2770 ~= 0
			else
				local _ = nil
				local var2772, var2773 = protoModule.readVarInt(p99, var2764)
				local _ = var2772
				var2764 = var2773
			end
		end
		if var2765 == protoModule.wireTypes.lengthDelimited then
			if var2769 == 1 then
				local _ = nil
				local var2774, var2775 = protoModule.readBuffer(p99, var2764)
				var2764 = var2775
				var2763.universe_id = buffer.tostring(var2774)
			else
				local _ = nil
				local var2776, var2777 = protoModule.readVarInt(p99, var2764)
				var2764 = var2777 + var2776
			end
		elseif var2765 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed32(p99, var2764)
			local _ = var2778
			var2764 = var2779
		elseif var2765 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2780, var2781 = protoModule.readFixed64(p99, var2764)
			local _ = var2780
			var2764 = var2781
		else
			error("Unsupported wire type: " .. var2765)
		end
	end
	return var2763
end

function t_99:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref)
	local var2782 = t_99.new()
	
	if self.universe_id ~= nil then
		var2782.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2782.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2782.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2782.is_content_locked = self.isContentLocked
	end
	return var2782
end

t_99.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_99
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t_100 (ref)
	return setmetatable({
		overview_rich_text = if p100 == nil or p100.overview_rich_text == nil then "" else p100.overview_rich_text,
		result_entry = if p100 == nil or p100.result_entry == nil then nil else p100.result_entry,
		follow_up_queries = if p100 == nil or p100.follow_up_queries == nil then {} else p100.follow_up_queries,
		show_loading = if p100 == nil or p100.show_loading == nil then false else p100.show_loading,
		title = if p100 == nil or p100.title == nil then "" else p100.title,
		search_query = if p100 == nil or p100.search_query == nil then "" else p100.search_query,
		universe_ids = if p100 == nil or p100.universe_ids == nil then "" else p100.universe_ids
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2782 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2783, var2784 = protoModule.writeTag(buff, var2782, 1, protoModule.wireTypes.lengthDelimited)
		var2783, var4074 = protoModule.writeString(var2783, var2784, self.overview_rich_text)
		buff = var2783
		var2782 = var2784
	end
	if self.result_entry ~= nil then
		local var2785 = self.result_entry:encode()
		local var2786, var2787 = protoModule.writeTag(buff, var2782, 2, protoModule.wireTypes.lengthDelimited)
		var2786, var4077 = protoModule.writeBuffer(var2786, var2787, var2785, buffer.len(var2785))
		buff = var2786
		var2782 = var2787
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2788, var2789 = protoModule.writeTag(buff, var2782, 3, protoModule.wireTypes.lengthDelimited)
			var2788, var4079 = protoModule.writeString(var2788, var2789, v)
			buff = var2788
			var2782 = var2789
		end
	end
	if self.show_loading then
		local var2790, var2791 = protoModule.writeTag(buff, var2782, 4, protoModule.wireTypes.varint)
		var2790, var4081 = protoModule.writeVarInt(var2790, var2791, if self.show_loading then 1 else 0)
		buff = var2790
		var2782 = var2791
	end
	if self.title ~= nil and self.title ~= "" then
		local var2792, var2793 = protoModule.writeTag(buff, var2782, 5, protoModule.wireTypes.lengthDelimited)
		var2792, var4083 = protoModule.writeString(var2792, var2793, self.title)
		buff = var2792
		var2782 = var2793
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2794, var2795 = protoModule.writeTag(buff, var2782, 6, protoModule.wireTypes.lengthDelimited)
		var2794, var4085 = protoModule.writeString(var2794, var2795, self.search_query)
		buff = var2794
		var2782 = var2795
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2796, var2797 = protoModule.writeTag(buff, var2782, 8, protoModule.wireTypes.lengthDelimited)
		var2796, var4087 = protoModule.writeString(var2796, var2797, self.universe_ids)
		buff = var2796
		var2782 = var2797
	end
	local buff_1 = buffer.create(var2782)
	buffer.copy(buff_1, 0, buff, 0, var2782)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2798 = t_100.new()
	local var2799 = 0
	while var2799 < buffer.len(p100) do
		local _ = nil
		local var2800 = nil
		local var2801, var2802, var2803 = protoModule.readTag(p100, var2799)
		local var2804 = var2801
		var2800 = var2802
		var2799 = var2803
		
		if var2800 == protoModule.wireTypes.varint then
			if var2804 == 4 then
				local _ = nil
				local var2805, var2806 = protoModule.readVarInt(p100, var2799)
				var2799 = var2806
				var2798.show_loading = var2805 ~= 0
			else
				local _ = nil
				local var2807, var2808 = protoModule.readVarInt(p100, var2799)
				local _ = var2807
				var2799 = var2808
			end
		end
		if var2800 == protoModule.wireTypes.lengthDelimited then
			if var2804 == 1 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p100, var2799)
				var2799 = var2810
				var2798.overview_rich_text = buffer.tostring(var2809)
			elseif var2804 == 2 then
				local _ = nil
				local var2811, var2812 = protoModule.readBuffer(p100, var2799)
				var2799 = var2812
				var2798.result_entry = t.FeedEntry.decode(var2811)
			elseif var2804 == 3 then
				local _ = nil
				local var2813, var2814 = protoModule.readBuffer(p100, var2799)
				var2799 = var2814
				table.insert(var2798.follow_up_queries, buffer.tostring(var2813))
			elseif var2804 == 5 then
				local _ = nil
				local var2815, var2816 = protoModule.readBuffer(p100, var2799)
				var2799 = var2816
				var2798.title = buffer.tostring(var2815)
			elseif var2804 == 6 then
				local _ = nil
				local var2817, var2818 = protoModule.readBuffer(p100, var2799)
				var2799 = var2818
				var2798.search_query = buffer.tostring(var2817)
			elseif var2804 == 8 then
				local _ = nil
				local var2819, var2820 = protoModule.readBuffer(p100, var2799)
				var2799 = var2820
				var2798.universe_ids = buffer.tostring(var2819)
			else
				local _ = nil
				local var2821, var2822 = protoModule.readVarInt(p100, var2799)
				var2799 = var2822 + var2821
			end
		elseif var2800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2823, var2824 = protoModule.readFixed32(p100, var2799)
			local _ = var2823
			var2799 = var2824
		elseif var2800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2825, var2826 = protoModule.readFixed64(p100, var2799)
			local _ = var2825
			var2799 = var2826
		else
			error("Unsupported wire type: " .. var2800)
		end
	end
	return var2798
end

function t_100:jsonEncode()
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

function t_100:jsonDecode()
	-- upvalues: t_100 (ref), t (ref)
	local var2827 = t_100.new()
	
	if self.overview_rich_text ~= nil then
		var2827.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2827.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2827.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2827.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2827.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2827.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2827.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2827.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2827.title = self.title
	end
	if self.search_query ~= nil then
		var2827.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2827.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2827.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2827.universe_ids = self.universeIds
	end
	return var2827
end

t_100.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_100
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p101 == nil or p101.title == nil then "" else p101.title,
		user_items = if p101 == nil or p101.user_items == nil then {} else p101.user_items,
		max_visible_rows = if p101 == nil or p101.max_visible_rows == nil then 0 else p101.max_visible_rows,
		sort_id = if p101 == nil or p101.sort_id == nil then nil else p101.sort_id
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2828 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2829, var2830 = protoModule.writeTag(buff, var2828, 1, protoModule.wireTypes.lengthDelimited)
		var2829, var4126 = protoModule.writeString(var2829, var2830, self.title)
		buff = var2829
		var2828 = var2830
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2831 = v:encode()
			local var2832, var2833 = protoModule.writeTag(buff, var2828, 2, protoModule.wireTypes.lengthDelimited)
			var2832, var4129 = protoModule.writeBuffer(var2832, var2833, var2831, buffer.len(var2831))
			buff = var2832
			var2828 = var2833
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2834, var2835 = protoModule.writeTag(buff, var2828, 3, protoModule.wireTypes.varint)
		var2834, var4131 = protoModule.writeVarInt(var2834, var2835, self.max_visible_rows)
		buff = var2834
		var2828 = var2835
	end
	if self.sort_id ~= nil then
		local var2836, var2837 = protoModule.writeTag(buff, var2828, 4, protoModule.wireTypes.lengthDelimited)
		var2836, var4133 = protoModule.writeString(var2836, var2837, self.sort_id)
		buff = var2836
		var2828 = var2837
	end
	local buff_1 = buffer.create(var2828)
	buffer.copy(buff_1, 0, buff, 0, var2828)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2838 = t_101.new()
	local var2839 = 0
	while var2839 < buffer.len(p101) do
		local _ = nil
		local var2840 = nil
		local var2841, var2842, var2843 = protoModule.readTag(p101, var2839)
		local var2844 = var2841
		var2840 = var2842
		var2839 = var2843
		
		if var2840 == protoModule.wireTypes.varint then
			if var2844 == 3 then
				local _ = nil
				local var2845, var2846 = protoModule.readVarIntI32(p101, var2839)
				var2839 = var2846
				var2838.max_visible_rows = var2845
			else
				local _ = nil
				local var2847, var2848 = protoModule.readVarInt(p101, var2839)
				local _ = var2847
				var2839 = var2848
			end
		end
		if var2840 == protoModule.wireTypes.lengthDelimited then
			if var2844 == 1 then
				local _ = nil
				local var2849, var2850 = protoModule.readBuffer(p101, var2839)
				var2839 = var2850
				var2838.title = buffer.tostring(var2849)
			elseif var2844 == 2 then
				local _ = nil
				local var2851, var2852 = protoModule.readBuffer(p101, var2839)
				var2839 = var2852
				table.insert(var2838.user_items, t.UserListInputData_UserItem.decode(var2851))
			elseif var2844 == 4 then
				local _ = nil
				local var2853, var2854 = protoModule.readBuffer(p101, var2839)
				var2839 = var2854
				var2838.sort_id = buffer.tostring(var2853)
			else
				local _ = nil
				local var2855, var2856 = protoModule.readVarInt(p101, var2839)
				var2839 = var2856 + var2855
			end
		elseif var2840 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2857, var2858 = protoModule.readFixed32(p101, var2839)
			local _ = var2857
			var2839 = var2858
		elseif var2840 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2859, var2860 = protoModule.readFixed64(p101, var2839)
			local _ = var2859
			var2839 = var2860
		else
			error("Unsupported wire type: " .. var2840)
		end
	end
	return var2838
end

function t_101:jsonEncode()
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

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref)
	local var2861 = t_101.new()
	
	if self.title ~= nil then
		var2861.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2861.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2861.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2861.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2861.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2861.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2861.sort_id = self.sortId
	end
	return var2861
end

t_101.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_101
typeRegistryModule.default:register(t.UserListInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		user_id = if p102 == nil or p102.user_id == nil then "" else p102.user_id
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2862 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2863, var2864 = protoModule.writeTag(buff, var2862, 1, protoModule.wireTypes.lengthDelimited)
		var2863, var4166 = protoModule.writeString(var2863, var2864, self.user_id)
		buff = var2863
		var2862 = var2864
	end
	local buff_1 = buffer.create(var2862)
	buffer.copy(buff_1, 0, buff, 0, var2862)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2862 = t_102.new()
	local var2863 = 0
	while var2863 < buffer.len(p102) do
		local _ = nil
		local var2864 = nil
		local var2865, var2866, var2867 = protoModule.readTag(p102, var2863)
		local var2868 = var2865
		var2864 = var2866
		var2863 = var2867
		
		if var2864 == protoModule.wireTypes.varint then
			local _ = nil
			local var2869, var2870 = protoModule.readVarInt(p102, var2863)
			local _ = var2869
			var2863 = var2870
			continue
		end
		if var2864 == protoModule.wireTypes.lengthDelimited then
			if var2868 == 1 then
				local _ = nil
				local var2871, var2872 = protoModule.readBuffer(p102, var2863)
				var2863 = var2872
				var2862.user_id = buffer.tostring(var2871)
			else
				local _ = nil
				local var2873, var2874 = protoModule.readVarInt(p102, var2863)
				var2863 = var2874 + var2873
			end
		elseif var2864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2875, var2876 = protoModule.readFixed32(p102, var2863)
			local _ = var2875
			var2863 = var2876
		elseif var2864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2877, var2878 = protoModule.readFixed64(p102, var2863)
			local _ = var2877
			var2863 = var2878
		else
			error("Unsupported wire type: " .. var2864)
		end
	end
	return var2862
end

function t_102:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_102:jsonDecode()
	-- upvalues: t_102 (ref)
	local var2879 = t_102.new()
	
	if self.user_id ~= nil then
		var2879.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2879.user_id = self.userId
	end
	return var2879
end

t_102.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_102
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p103 == nil or p103.title == nil then "" else p103.title,
		items = if p103 == nil or p103.items == nil then {} else p103.items,
		max_visible_rows = if p103 == nil or p103.max_visible_rows == nil then 0 else p103.max_visible_rows,
		sort_id = if p103 == nil or p103.sort_id == nil then nil else p103.sort_id
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2879 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2880, var2881 = protoModule.writeTag(buff, var2879, 1, protoModule.wireTypes.lengthDelimited)
		var2880, var4190 = protoModule.writeString(var2880, var2881, self.title)
		buff = var2880
		var2879 = var2881
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2882 = v:encode()
			local var2883, var2884 = protoModule.writeTag(buff, var2879, 2, protoModule.wireTypes.lengthDelimited)
			var2883, var4193 = protoModule.writeBuffer(var2883, var2884, var2882, buffer.len(var2882))
			buff = var2883
			var2879 = var2884
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2885, var2886 = protoModule.writeTag(buff, var2879, 3, protoModule.wireTypes.varint)
		var2885, var4195 = protoModule.writeVarInt(var2885, var2886, self.max_visible_rows)
		buff = var2885
		var2879 = var2886
	end
	if self.sort_id ~= nil then
		local var2887, var2888 = protoModule.writeTag(buff, var2879, 4, protoModule.wireTypes.lengthDelimited)
		var2887, var4197 = protoModule.writeString(var2887, var2888, self.sort_id)
		buff = var2887
		var2879 = var2888
	end
	local buff_1 = buffer.create(var2879)
	buffer.copy(buff_1, 0, buff, 0, var2879)
	
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
			if var2895 == 3 then
				local _ = nil
				local var2896, var2897 = protoModule.readVarIntI32(p103, var2890)
				var2890 = var2897
				var2889.max_visible_rows = var2896
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
				var2889.title = buffer.tostring(var2900)
			elseif var2895 == 2 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p103, var2890)
				var2890 = var2903
				table.insert(var2889.items, t.CatalogItemListInputData_CatalogItem.decode(var2902))
			elseif var2895 == 4 then
				local _ = nil
				local var2904, var2905 = protoModule.readBuffer(p103, var2890)
				var2890 = var2905
				var2889.sort_id = buffer.tostring(var2904)
			else
				local _ = nil
				local var2906, var2907 = protoModule.readVarInt(p103, var2890)
				var2890 = var2907 + var2906
			end
		elseif var2891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2908, var2909 = protoModule.readFixed32(p103, var2890)
			local _ = var2908
			var2890 = var2909
		elseif var2891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2910, var2911 = protoModule.readFixed64(p103, var2890)
			local _ = var2910
			var2890 = var2911
		else
			error("Unsupported wire type: " .. var2891)
		end
	end
	return var2889
end

function t_103:jsonEncode()
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

function t_103:jsonDecode()
	-- upvalues: t_103 (ref), t (ref)
	local var2912 = t_103.new()
	
	if self.title ~= nil then
		var2912.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2912.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2912.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2912.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2912.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2912.sort_id = self.sortId
	end
	return var2912
end

t_103.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_103
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t_104 (ref)
	return setmetatable({
		item_id = if p104 == nil or p104.item_id == nil then "" else p104.item_id,
		item_type = if p104 == nil or p104.item_type == nil then "" else p104.item_type
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2913 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2914, var2915 = protoModule.writeTag(buff, var2913, 1, protoModule.wireTypes.lengthDelimited)
		var2914, var4229 = protoModule.writeString(var2914, var2915, self.item_id)
		buff = var2914
		var2913 = var2915
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2916, var2917 = protoModule.writeTag(buff, var2913, 2, protoModule.wireTypes.lengthDelimited)
		var2916, var4231 = protoModule.writeString(var2916, var2917, self.item_type)
		buff = var2916
		var2913 = var2917
	end
	local buff_1 = buffer.create(var2913)
	buffer.copy(buff_1, 0, buff, 0, var2913)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2913 = t_104.new()
	local var2914 = 0
	while var2914 < buffer.len(p104) do
		local _ = nil
		local var2915 = nil
		local var2916, var2917, var2918 = protoModule.readTag(p104, var2914)
		local var2919 = var2916
		var2915 = var2917
		var2914 = var2918
		
		if var2915 == protoModule.wireTypes.varint then
			local _ = nil
			local var2920, var2921 = protoModule.readVarInt(p104, var2914)
			local _ = var2920
			var2914 = var2921
			continue
		end
		if var2915 == protoModule.wireTypes.lengthDelimited then
			if var2919 == 1 then
				local _ = nil
				local var2922, var2923 = protoModule.readBuffer(p104, var2914)
				var2914 = var2923
				var2913.item_id = buffer.tostring(var2922)
			elseif var2919 == 2 then
				local _ = nil
				local var2924, var2925 = protoModule.readBuffer(p104, var2914)
				var2914 = var2925
				var2913.item_type = buffer.tostring(var2924)
			else
				local _ = nil
				local var2926, var2927 = protoModule.readVarInt(p104, var2914)
				var2914 = var2927 + var2926
			end
		elseif var2915 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2928, var2929 = protoModule.readFixed32(p104, var2914)
			local _ = var2928
			var2914 = var2929
		elseif var2915 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2930, var2931 = protoModule.readFixed64(p104, var2914)
			local _ = var2930
			var2914 = var2931
		else
			error("Unsupported wire type: " .. var2915)
		end
	end
	return var2913
end

function t_104:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_104:jsonDecode()
	-- upvalues: t_104 (ref)
	local var2932 = t_104.new()
	
	if self.item_id ~= nil then
		var2932.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2932.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2932.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2932.item_type = self.itemType
	end
	return var2932
end

t_104.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_104
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p105 == nil or p105.universe_id == nil then "" else p105.universe_id
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2932 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2933, var2934 = protoModule.writeTag(buff, var2932, 1, protoModule.wireTypes.lengthDelimited)
		var2933, var4257 = protoModule.writeString(var2933, var2934, self.universe_id)
		buff = var2933
		var2932 = var2934
	end
	local buff_1 = buffer.create(var2932)
	buffer.copy(buff_1, 0, buff, 0, var2932)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2932 = t_105.new()
	local var2933 = 0
	while var2933 < buffer.len(p105) do
		local _ = nil
		local var2934 = nil
		local var2935, var2936, var2937 = protoModule.readTag(p105, var2933)
		local var2938 = var2935
		var2934 = var2936
		var2933 = var2937
		
		if var2934 == protoModule.wireTypes.varint then
			local _ = nil
			local var2939, var2940 = protoModule.readVarInt(p105, var2933)
			local _ = var2939
			var2933 = var2940
			continue
		end
		if var2934 == protoModule.wireTypes.lengthDelimited then
			if var2938 == 1 then
				local _ = nil
				local var2941, var2942 = protoModule.readBuffer(p105, var2933)
				var2933 = var2942
				var2932.universe_id = buffer.tostring(var2941)
			else
				local _ = nil
				local var2943, var2944 = protoModule.readVarInt(p105, var2933)
				var2933 = var2944 + var2943
			end
		elseif var2934 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2945, var2946 = protoModule.readFixed32(p105, var2933)
			local _ = var2945
			var2933 = var2946
		elseif var2934 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2947, var2948 = protoModule.readFixed64(p105, var2933)
			local _ = var2947
			var2933 = var2948
		else
			error("Unsupported wire type: " .. var2934)
		end
	end
	return var2932
end

function t_105:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2949 = t_105.new()
	
	if self.universe_id ~= nil then
		var2949.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2949.universe_id = self.universeId
	end
	return var2949
end

t_105.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_105
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		title = if p106 == nil or p106.title == nil then "" else p106.title,
		subtitle = if p106 == nil or p106.subtitle == nil then "" else p106.subtitle,
		moment_items = if p106 == nil or p106.moment_items == nil then {} else p106.moment_items
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2949 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2950, var2951 = protoModule.writeTag(buff, var2949, 1, protoModule.wireTypes.lengthDelimited)
		var2950, var4281 = protoModule.writeString(var2950, var2951, self.title)
		buff = var2950
		var2949 = var2951
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2952, var2953 = protoModule.writeTag(buff, var2949, 2, protoModule.wireTypes.lengthDelimited)
		var2952, var4283 = protoModule.writeString(var2952, var2953, self.subtitle)
		buff = var2952
		var2949 = var2953
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2954 = v:encode()
			local var2955, var2956 = protoModule.writeTag(buff, var2949, 3, protoModule.wireTypes.lengthDelimited)
			var2955, var4286 = protoModule.writeBuffer(var2955, var2956, var2954, buffer.len(var2954))
			buff = var2955
			var2949 = var2956
		end
	end
	local buff_1 = buffer.create(var2949)
	buffer.copy(buff_1, 0, buff, 0, var2949)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2957 = t_106.new()
	local var2958 = 0
	while var2958 < buffer.len(p106) do
		local _ = nil
		local var2959 = nil
		local var2960, var2961, var2962 = protoModule.readTag(p106, var2958)
		local var2963 = var2960
		var2959 = var2961
		var2958 = var2962
		
		if var2959 == protoModule.wireTypes.varint then
			local _ = nil
			local var2964, var2965 = protoModule.readVarInt(p106, var2958)
			local _ = var2964
			var2958 = var2965
			continue
		end
		if var2959 == protoModule.wireTypes.lengthDelimited then
			if var2963 == 1 then
				local _ = nil
				local var2966, var2967 = protoModule.readBuffer(p106, var2958)
				var2958 = var2967
				var2957.title = buffer.tostring(var2966)
			elseif var2963 == 2 then
				local _ = nil
				local var2968, var2969 = protoModule.readBuffer(p106, var2958)
				var2958 = var2969
				var2957.subtitle = buffer.tostring(var2968)
			elseif var2963 == 3 then
				local _ = nil
				local var2970, var2971 = protoModule.readBuffer(p106, var2958)
				var2958 = var2971
				table.insert(var2957.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2970))
			else
				local _ = nil
				local var2972, var2973 = protoModule.readVarInt(p106, var2958)
				var2958 = var2973 + var2972
			end
		elseif var2959 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2974, var2975 = protoModule.readFixed32(p106, var2958)
			local _ = var2974
			var2958 = var2975
		elseif var2959 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2976, var2977 = protoModule.readFixed64(p106, var2958)
			local _ = var2976
			var2958 = var2977
		else
			error("Unsupported wire type: " .. var2959)
		end
	end
	return var2957
end

function t_106:jsonEncode()
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

function t_106:jsonDecode()
	-- upvalues: t_106 (ref), t (ref)
	local var2978 = t_106.new()
	
	if self.title ~= nil then
		var2978.title = self.title
	end
	if self.subtitle ~= nil then
		var2978.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2978.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2978.moment_items = t_1
	end
	return var2978
end

t_106.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_106
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		moment_id = if p107 == nil or p107.moment_id == nil then "" else p107.moment_id,
		video_asset_id = if p107 == nil or p107.video_asset_id == nil then "" else p107.video_asset_id,
		target_universe_id = if p107 == nil or p107.target_universe_id == nil then "" else p107.target_universe_id,
		target_place_id = if p107 == nil or p107.target_place_id == nil then "" else p107.target_place_id,
		feed_item_id = if p107 == nil or p107.feed_item_id == nil then "" else p107.feed_item_id,
		capture_universe_id = if p107 == nil or p107.capture_universe_id == nil then "" else p107.capture_universe_id
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2979 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2980, var2981 = protoModule.writeTag(buff, var2979, 1, protoModule.wireTypes.lengthDelimited)
		var2980, var4317 = protoModule.writeString(var2980, var2981, self.moment_id)
		buff = var2980
		var2979 = var2981
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2982, var2983 = protoModule.writeTag(buff, var2979, 2, protoModule.wireTypes.lengthDelimited)
		var2982, var4319 = protoModule.writeString(var2982, var2983, self.video_asset_id)
		buff = var2982
		var2979 = var2983
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2984, var2985 = protoModule.writeTag(buff, var2979, 3, protoModule.wireTypes.lengthDelimited)
		var2984, var4321 = protoModule.writeString(var2984, var2985, self.target_universe_id)
		buff = var2984
		var2979 = var2985
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2986, var2987 = protoModule.writeTag(buff, var2979, 4, protoModule.wireTypes.lengthDelimited)
		var2986, var4323 = protoModule.writeString(var2986, var2987, self.target_place_id)
		buff = var2986
		var2979 = var2987
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2988, var2989 = protoModule.writeTag(buff, var2979, 5, protoModule.wireTypes.lengthDelimited)
		var2988, var4325 = protoModule.writeString(var2988, var2989, self.feed_item_id)
		buff = var2988
		var2979 = var2989
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2990, var2991 = protoModule.writeTag(buff, var2979, 6, protoModule.wireTypes.lengthDelimited)
		var2990, var4327 = protoModule.writeString(var2990, var2991, self.capture_universe_id)
		buff = var2990
		var2979 = var2991
	end
	local buff_1 = buffer.create(var2979)
	buffer.copy(buff_1, 0, buff, 0, var2979)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2979 = t_107.new()
	local var2980 = 0
	while var2980 < buffer.len(p107) do
		local _ = nil
		local var2981 = nil
		local var2982, var2983, var2984 = protoModule.readTag(p107, var2980)
		local var2985 = var2982
		var2981 = var2983
		var2980 = var2984
		
		if var2981 == protoModule.wireTypes.varint then
			local _ = nil
			local var2986, var2987 = protoModule.readVarInt(p107, var2980)
			local _ = var2986
			var2980 = var2987
			continue
		end
		if var2981 == protoModule.wireTypes.lengthDelimited then
			if var2985 == 1 then
				local _ = nil
				local var2988, var2989 = protoModule.readBuffer(p107, var2980)
				var2980 = var2989
				var2979.moment_id = buffer.tostring(var2988)
			elseif var2985 == 2 then
				local _ = nil
				local var2990, var2991 = protoModule.readBuffer(p107, var2980)
				var2980 = var2991
				var2979.video_asset_id = buffer.tostring(var2990)
			elseif var2985 == 3 then
				local _ = nil
				local var2992, var2993 = protoModule.readBuffer(p107, var2980)
				var2980 = var2993
				var2979.target_universe_id = buffer.tostring(var2992)
			elseif var2985 == 4 then
				local _ = nil
				local var2994, var2995 = protoModule.readBuffer(p107, var2980)
				var2980 = var2995
				var2979.target_place_id = buffer.tostring(var2994)
			elseif var2985 == 5 then
				local _ = nil
				local var2996, var2997 = protoModule.readBuffer(p107, var2980)
				var2980 = var2997
				var2979.feed_item_id = buffer.tostring(var2996)
			elseif var2985 == 6 then
				local _ = nil
				local var2998, var2999 = protoModule.readBuffer(p107, var2980)
				var2980 = var2999
				var2979.capture_universe_id = buffer.tostring(var2998)
			else
				local _ = nil
				local var3000, var3001 = protoModule.readVarInt(p107, var2980)
				var2980 = var3001 + var3000
			end
		elseif var2981 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3002, var3003 = protoModule.readFixed32(p107, var2980)
			local _ = var3002
			var2980 = var3003
		elseif var2981 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3004, var3005 = protoModule.readFixed64(p107, var2980)
			local _ = var3004
			var2980 = var3005
		else
			error("Unsupported wire type: " .. var2981)
		end
	end
	return var2979
end

function t_107:jsonEncode()
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

function t_107:jsonDecode()
	-- upvalues: t_107 (ref)
	local var3006 = t_107.new()
	
	if self.moment_id ~= nil then
		var3006.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3006.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3006.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3006.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3006.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3006.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3006.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3006.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3006.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3006.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3006.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3006.capture_universe_id = self.captureUniverseId
	end
	return var3006
end

t_107.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_107
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		title = if p108 == nil or p108.title == nil then "" else p108.title,
		subtitle = if p108 == nil or p108.subtitle == nil then "" else p108.subtitle
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3006 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3007, var3008 = protoModule.writeTag(buff, var3006, 1, protoModule.wireTypes.lengthDelimited)
		var3007, var4361 = protoModule.writeString(var3007, var3008, self.title)
		buff = var3007
		var3006 = var3008
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3009, var3010 = protoModule.writeTag(buff, var3006, 2, protoModule.wireTypes.lengthDelimited)
		var3009, var4363 = protoModule.writeString(var3009, var3010, self.subtitle)
		buff = var3009
		var3006 = var3010
	end
	local buff_1 = buffer.create(var3006)
	buffer.copy(buff_1, 0, buff, 0, var3006)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var3006 = t_108.new()
	local var3007 = 0
	while var3007 < buffer.len(p108) do
		local _ = nil
		local var3008 = nil
		local var3009, var3010, var3011 = protoModule.readTag(p108, var3007)
		local var3012 = var3009
		var3008 = var3010
		var3007 = var3011
		
		if var3008 == protoModule.wireTypes.varint then
			local _ = nil
			local var3013, var3014 = protoModule.readVarInt(p108, var3007)
			local _ = var3013
			var3007 = var3014
			continue
		end
		if var3008 == protoModule.wireTypes.lengthDelimited then
			if var3012 == 1 then
				local _ = nil
				local var3015, var3016 = protoModule.readBuffer(p108, var3007)
				var3007 = var3016
				var3006.title = buffer.tostring(var3015)
			elseif var3012 == 2 then
				local _ = nil
				local var3017, var3018 = protoModule.readBuffer(p108, var3007)
				var3007 = var3018
				var3006.subtitle = buffer.tostring(var3017)
			else
				local _ = nil
				local var3019, var3020 = protoModule.readVarInt(p108, var3007)
				var3007 = var3020 + var3019
			end
		elseif var3008 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3021, var3022 = protoModule.readFixed32(p108, var3007)
			local _ = var3021
			var3007 = var3022
		elseif var3008 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3023, var3024 = protoModule.readFixed64(p108, var3007)
			local _ = var3023
			var3007 = var3024
		else
			error("Unsupported wire type: " .. var3008)
		end
	end
	return var3006
end

function t_108:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_108:jsonDecode()
	-- upvalues: t_108 (ref)
	local var3025 = t_108.new()
	
	if self.title ~= nil then
		var3025.title = self.title
	end
	if self.subtitle ~= nil then
		var3025.subtitle = self.subtitle
	end
	return var3025
end

t_108.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_108
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		primary_cta_button_text = if p109 == nil or p109.primary_cta_button_text == nil then "" else p109.primary_cta_button_text,
		secondary_cta_button_text = if p109 == nil or p109.secondary_cta_button_text == nil then "" else p109.secondary_cta_button_text,
		primary_cta_type = if p109 == nil or p109.primary_cta_type == nil then "" else p109.primary_cta_type,
		secondary_cta_type = if p109 == nil or p109.secondary_cta_type == nil then "" else p109.secondary_cta_type
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3025 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3026, var3027 = protoModule.writeTag(buff, var3025, 1, protoModule.wireTypes.lengthDelimited)
		var3026, var4389 = protoModule.writeString(var3026, var3027, self.primary_cta_button_text)
		buff = var3026
		var3025 = var3027
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3028, var3029 = protoModule.writeTag(buff, var3025, 2, protoModule.wireTypes.lengthDelimited)
		var3028, var4391 = protoModule.writeString(var3028, var3029, self.secondary_cta_button_text)
		buff = var3028
		var3025 = var3029
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3030, var3031 = protoModule.writeTag(buff, var3025, 3, protoModule.wireTypes.lengthDelimited)
		var3030, var4393 = protoModule.writeString(var3030, var3031, self.primary_cta_type)
		buff = var3030
		var3025 = var3031
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3032, var3033 = protoModule.writeTag(buff, var3025, 4, protoModule.wireTypes.lengthDelimited)
		var3032, var4395 = protoModule.writeString(var3032, var3033, self.secondary_cta_type)
		buff = var3032
		var3025 = var3033
	end
	local buff_1 = buffer.create(var3025)
	buffer.copy(buff_1, 0, buff, 0, var3025)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var3025 = t_109.new()
	local var3026 = 0
	while var3026 < buffer.len(p109) do
		local _ = nil
		local var3027 = nil
		local var3028, var3029, var3030 = protoModule.readTag(p109, var3026)
		local var3031 = var3028
		var3027 = var3029
		var3026 = var3030
		
		if var3027 == protoModule.wireTypes.varint then
			local _ = nil
			local var3032, var3033 = protoModule.readVarInt(p109, var3026)
			local _ = var3032
			var3026 = var3033
			continue
		end
		if var3027 == protoModule.wireTypes.lengthDelimited then
			if var3031 == 1 then
				local _ = nil
				local var3034, var3035 = protoModule.readBuffer(p109, var3026)
				var3026 = var3035
				var3025.primary_cta_button_text = buffer.tostring(var3034)
			elseif var3031 == 2 then
				local _ = nil
				local var3036, var3037 = protoModule.readBuffer(p109, var3026)
				var3026 = var3037
				var3025.secondary_cta_button_text = buffer.tostring(var3036)
			elseif var3031 == 3 then
				local _ = nil
				local var3038, var3039 = protoModule.readBuffer(p109, var3026)
				var3026 = var3039
				var3025.primary_cta_type = buffer.tostring(var3038)
			elseif var3031 == 4 then
				local _ = nil
				local var3040, var3041 = protoModule.readBuffer(p109, var3026)
				var3026 = var3041
				var3025.secondary_cta_type = buffer.tostring(var3040)
			else
				local _ = nil
				local var3042, var3043 = protoModule.readVarInt(p109, var3026)
				var3026 = var3043 + var3042
			end
		elseif var3027 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3044, var3045 = protoModule.readFixed32(p109, var3026)
			local _ = var3044
			var3026 = var3045
		elseif var3027 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3046, var3047 = protoModule.readFixed64(p109, var3026)
			local _ = var3046
			var3026 = var3047
		else
			error("Unsupported wire type: " .. var3027)
		end
	end
	return var3025
end

function t_109:jsonEncode()
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

function t_109:jsonDecode()
	-- upvalues: t_109 (ref)
	local var3048 = t_109.new()
	
	if self.primary_cta_button_text ~= nil then
		var3048.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3048.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3048.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3048.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3048.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3048.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3048.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3048.secondary_cta_type = self.secondaryCtaType
	end
	return var3048
end

t_109.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_109
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		image_asset_id = if p110 == nil or p110.image_asset_id == nil then "" else p110.image_asset_id
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3048 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3049, var3050 = protoModule.writeTag(buff, var3048, 1, protoModule.wireTypes.lengthDelimited)
		var3049, var4425 = protoModule.writeString(var3049, var3050, self.image_asset_id)
		buff = var3049
		var3048 = var3050
	end
	local buff_1 = buffer.create(var3048)
	buffer.copy(buff_1, 0, buff, 0, var3048)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3048 = t_110.new()
	local var3049 = 0
	while var3049 < buffer.len(p110) do
		local _ = nil
		local var3050 = nil
		local var3051, var3052, var3053 = protoModule.readTag(p110, var3049)
		local var3054 = var3051
		var3050 = var3052
		var3049 = var3053
		
		if var3050 == protoModule.wireTypes.varint then
			local _ = nil
			local var3055, var3056 = protoModule.readVarInt(p110, var3049)
			local _ = var3055
			var3049 = var3056
			continue
		end
		if var3050 == protoModule.wireTypes.lengthDelimited then
			if var3054 == 1 then
				local _ = nil
				local var3057, var3058 = protoModule.readBuffer(p110, var3049)
				var3049 = var3058
				var3048.image_asset_id = buffer.tostring(var3057)
			else
				local _ = nil
				local var3059, var3060 = protoModule.readVarInt(p110, var3049)
				var3049 = var3060 + var3059
			end
		elseif var3050 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3061, var3062 = protoModule.readFixed32(p110, var3049)
			local _ = var3061
			var3049 = var3062
		elseif var3050 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3063, var3064 = protoModule.readFixed64(p110, var3049)
			local _ = var3063
			var3049 = var3064
		else
			error("Unsupported wire type: " .. var3050)
		end
	end
	return var3048
end

function t_110:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref)
	local var3065 = t_110.new()
	
	if self.image_asset_id ~= nil then
		var3065.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3065.image_asset_id = self.imageAssetId
	end
	return var3065
end

t_110.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_110
typeRegistryModule.default:register(t.ImageInputData)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		video_asset_id = if p111 == nil or p111.video_asset_id == nil then "" else p111.video_asset_id,
		loading_image_asset_id = if p111 == nil or p111.loading_image_asset_id == nil then "" else p111.loading_image_asset_id,
		max_quality = if p111 == nil or p111.max_quality == nil then "" else p111.max_quality,
		adaptive_resolution = if p111 == nil or p111.adaptive_resolution == nil then false else p111.adaptive_resolution
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3065 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3066, var3067 = protoModule.writeTag(buff, var3065, 1, protoModule.wireTypes.lengthDelimited)
		var3066, var4449 = protoModule.writeString(var3066, var3067, self.video_asset_id)
		buff = var3066
		var3065 = var3067
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3068, var3069 = protoModule.writeTag(buff, var3065, 2, protoModule.wireTypes.lengthDelimited)
		var3068, var4451 = protoModule.writeString(var3068, var3069, self.loading_image_asset_id)
		buff = var3068
		var3065 = var3069
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local var3070, var3071 = protoModule.writeTag(buff, var3065, 3, protoModule.wireTypes.lengthDelimited)
		var3070, var4453 = protoModule.writeString(var3070, var3071, self.max_quality)
		buff = var3070
		var3065 = var3071
	end
	if self.adaptive_resolution then
		local var3072, var3073 = protoModule.writeTag(buff, var3065, 4, protoModule.wireTypes.varint)
		var3072, var4455 = protoModule.writeVarInt(var3072, var3073, if self.adaptive_resolution then 1 else 0)
		buff = var3072
		var3065 = var3073
	end
	local buff_1 = buffer.create(var3065)
	buffer.copy(buff_1, 0, buff, 0, var3065)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3065 = t_111.new()
	local var3066 = 0
	while var3066 < buffer.len(p111) do
		local _ = nil
		local var3067 = nil
		local var3068, var3069, var3070 = protoModule.readTag(p111, var3066)
		local var3071 = var3068
		var3067 = var3069
		var3066 = var3070
		
		if var3067 == protoModule.wireTypes.varint then
			if var3071 == 4 then
				local _ = nil
				local var3072, var3073 = protoModule.readVarInt(p111, var3066)
				var3066 = var3073
				var3065.adaptive_resolution = var3072 ~= 0
			else
				local _ = nil
				local var3074, var3075 = protoModule.readVarInt(p111, var3066)
				local _ = var3074
				var3066 = var3075
			end
		end
		if var3067 == protoModule.wireTypes.lengthDelimited then
			if var3071 == 1 then
				local _ = nil
				local var3076, var3077 = protoModule.readBuffer(p111, var3066)
				var3066 = var3077
				var3065.video_asset_id = buffer.tostring(var3076)
			elseif var3071 == 2 then
				local _ = nil
				local var3078, var3079 = protoModule.readBuffer(p111, var3066)
				var3066 = var3079
				var3065.loading_image_asset_id = buffer.tostring(var3078)
			elseif var3071 == 3 then
				local _ = nil
				local var3080, var3081 = protoModule.readBuffer(p111, var3066)
				var3066 = var3081
				var3065.max_quality = buffer.tostring(var3080)
			else
				local _ = nil
				local var3082, var3083 = protoModule.readVarInt(p111, var3066)
				var3066 = var3083 + var3082
			end
		elseif var3067 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3084, var3085 = protoModule.readFixed32(p111, var3066)
			local _ = var3084
			var3066 = var3085
		elseif var3067 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3086, var3087 = protoModule.readFixed64(p111, var3066)
			local _ = var3086
			var3066 = var3087
		else
			error("Unsupported wire type: " .. var3067)
		end
	end
	return var3065
end

function t_111:jsonEncode()
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

function t_111:jsonDecode()
	-- upvalues: t_111 (ref)
	local var3088 = t_111.new()
	
	if self.video_asset_id ~= nil then
		var3088.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3088.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3088.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3088.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		var3088.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		var3088.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		var3088.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		var3088.adaptive_resolution = self.adaptiveResolution
	end
	return var3088
end

t_111.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_111
typeRegistryModule.default:register(t.VideoInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		text = if p112 == nil or p112.text == nil then "" else p112.text,
		is_rendered_text = if p112 == nil or p112.is_rendered_text == nil then false else p112.is_rendered_text,
		url = if p112 == nil or p112.url == nil then "" else p112.url
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3088 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3089, var3090 = protoModule.writeTag(buff, var3088, 1, protoModule.wireTypes.lengthDelimited)
		var3089, var4485 = protoModule.writeString(var3089, var3090, self.text)
		buff = var3089
		var3088 = var3090
	end
	if self.is_rendered_text then
		local var3091, var3092 = protoModule.writeTag(buff, var3088, 2, protoModule.wireTypes.varint)
		var3091, var4487 = protoModule.writeVarInt(var3091, var3092, if self.is_rendered_text then 1 else 0)
		buff = var3091
		var3088 = var3092
	end
	if self.url ~= nil and self.url ~= "" then
		local var3093, var3094 = protoModule.writeTag(buff, var3088, 3, protoModule.wireTypes.lengthDelimited)
		var3093, var4489 = protoModule.writeString(var3093, var3094, self.url)
		buff = var3093
		var3088 = var3094
	end
	local buff_1 = buffer.create(var3088)
	buffer.copy(buff_1, 0, buff, 0, var3088)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref)
	local var3088 = t_112.new()
	local var3089 = 0
	while var3089 < buffer.len(p112) do
		local _ = nil
		local var3090 = nil
		local var3091, var3092, var3093 = protoModule.readTag(p112, var3089)
		local var3094 = var3091
		var3090 = var3092
		var3089 = var3093
		
		if var3090 == protoModule.wireTypes.varint then
			if var3094 == 2 then
				local _ = nil
				local var3095, var3096 = protoModule.readVarInt(p112, var3089)
				var3089 = var3096
				var3088.is_rendered_text = var3095 ~= 0
			else
				local _ = nil
				local var3097, var3098 = protoModule.readVarInt(p112, var3089)
				local _ = var3097
				var3089 = var3098
			end
		end
		if var3090 == protoModule.wireTypes.lengthDelimited then
			if var3094 == 1 then
				local _ = nil
				local var3099, var3100 = protoModule.readBuffer(p112, var3089)
				var3089 = var3100
				var3088.text = buffer.tostring(var3099)
			elseif var3094 == 3 then
				local _ = nil
				local var3101, var3102 = protoModule.readBuffer(p112, var3089)
				var3089 = var3102
				var3088.url = buffer.tostring(var3101)
			else
				local _ = nil
				local var3103, var3104 = protoModule.readVarInt(p112, var3089)
				var3089 = var3104 + var3103
			end
		elseif var3090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3105, var3106 = protoModule.readFixed32(p112, var3089)
			local _ = var3105
			var3089 = var3106
		elseif var3090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3107, var3108 = protoModule.readFixed64(p112, var3089)
			local _ = var3107
			var3089 = var3108
		else
			error("Unsupported wire type: " .. var3090)
		end
	end
	return var3088
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref)
	local var3109 = t_112.new()
	
	if self.text ~= nil then
		var3109.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3109.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3109.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		var3109.url = self.url
	end
	return var3109
end

t_112.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_112
typeRegistryModule.default:register(t.TextInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		entry_map = if p113 == nil or p113.entry_map == nil then {} else p113.entry_map,
		entry_order = if p113 == nil or p113.entry_order == nil then {} else p113.entry_order,
		entry_order_map = if p113 == nil or p113.entry_order_map == nil then {} else p113.entry_order_map,
		content_pools = if p113 == nil or p113.content_pools == nil then {} else p113.content_pools
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3109 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3110, var3111 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3110, var4517 = protoModule.writeString(var3110, var3111, i)
			local var3112 = v:encode()
			var3111, var4519 = protoModule.writeTag(var3110, var3111, 2, protoModule.wireTypes.lengthDelimited)
			var3111, var4519 = protoModule.writeBuffer(var3111, var4519, var3112, buffer.len(var3112))
			local var3113 = var3111
			local var3114 = var4519
			local var3115, var3116 = protoModule.writeTag(buff, var3109, 1, protoModule.wireTypes.lengthDelimited)
			var3115, var4523 = protoModule.writeBuffer(var3115, var3116, var3113, var3114)
			buff = var3115
			var3109 = var3116
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3117, var3118 = protoModule.writeTag(buff, var3109, 2, protoModule.wireTypes.lengthDelimited)
			var3117, var4525 = protoModule.writeString(var3117, var3118, v)
			buff = var3117
			var3109 = var3118
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3119, var3120 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3119, var4527 = protoModule.writeString(var3119, var3120, i)
			local var3121 = v:encode()
			var3120, var4529 = protoModule.writeTag(var3119, var3120, 2, protoModule.wireTypes.lengthDelimited)
			var3120, var4529 = protoModule.writeBuffer(var3120, var4529, var3121, buffer.len(var3121))
			local var3122 = var3120
			local var3123 = var4529
			local var3124, var3125 = protoModule.writeTag(buff, var3109, 3, protoModule.wireTypes.lengthDelimited)
			var3124, var4533 = protoModule.writeBuffer(var3124, var3125, var3122, var3123)
			buff = var3124
			var3109 = var3125
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3126, var3127 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3126, var4535 = protoModule.writeString(var3126, var3127, i)
			local var3128 = v:encode()
			var3127, var4537 = protoModule.writeTag(var3126, var3127, 2, protoModule.wireTypes.lengthDelimited)
			var3127, var4537 = protoModule.writeBuffer(var3127, var4537, var3128, buffer.len(var3128))
			local var3129 = var3127
			local var3130 = var4537
			local var3131, var3132 = protoModule.writeTag(buff, var3109, 4, protoModule.wireTypes.lengthDelimited)
			var3131, var4541 = protoModule.writeBuffer(var3131, var3132, var3129, var3130)
			buff = var3131
			var3109 = var3132
		end
	end
	local buff_1 = buffer.create(var3109)
	buffer.copy(buff_1, 0, buff, 0, var3109)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3133 = t_113.new()
	local var3134 = 0
	while var3134 < buffer.len(p113) do
		local _ = nil
		local var3135 = nil
		local var3136, var3137, var3138 = protoModule.readTag(p113, var3134)
		local var3139 = var3136
		var3135 = var3137
		var3134 = var3138
		
		if var3135 == protoModule.wireTypes.varint then
			local _ = nil
			local var3140, var3141 = protoModule.readVarInt(p113, var3134)
			local _ = var3140
			var3134 = var3141
			continue
		end
		if var3135 == protoModule.wireTypes.lengthDelimited then
			if var3139 == 1 then
				local _ = nil
				local var3142, var3143 = protoModule.readBuffer(p113, var3134)
				var3134 = var3143
				var3142 = t.VerticalFeedInputData_EntryMapEntry.decode(var3142)
				var3133.entry_map[var3142.key or ""] = var3142.value or t.FeedEntry.new()
			elseif var3139 == 2 then
				local _ = nil
				local var3144, var3145 = protoModule.readBuffer(p113, var3134)
				var3134 = var3145
				table.insert(var3133.entry_order, buffer.tostring(var3144))
			elseif var3139 == 3 then
				local _ = nil
				local var3146, var3147 = protoModule.readBuffer(p113, var3134)
				var3134 = var3147
				var3146 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3146)
				var3133.entry_order_map[var3146.key or ""] = var3146.value or t.EntryOrder.new()
			elseif var3139 == 4 then
				local _ = nil
				local var3148, var3149 = protoModule.readBuffer(p113, var3134)
				var3134 = var3149
				var3148 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3148)
				var3133.content_pools[var3148.key or ""] = var3148.value or t.ContentPool.new()
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p113, var3134)
				var3134 = var3151 + var3150
			end
		elseif var3135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3152, var3153 = protoModule.readFixed32(p113, var3134)
			local _ = var3152
			var3134 = var3153
		elseif var3135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3154, var3155 = protoModule.readFixed64(p113, var3134)
			local _ = var3154
			var3134 = var3155
		else
			error("Unsupported wire type: " .. var3135)
		end
	end
	return var3133
end

function t_113:jsonEncode()
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

function t_113:jsonDecode()
	-- upvalues: t_113 (ref), t (ref)
	local var3156 = t_113.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3156.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3156.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3156.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3156.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3156.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3156.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3156.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3156.content_pools = t_1
	end
	return var3156
end

t_113.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_113
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		key = if p114 == nil or p114.key == nil then "" else p114.key,
		value = if p114 == nil or p114.value == nil then nil else p114.value
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3157 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3158, var3159 = protoModule.writeTag(buff, var3157, 1, protoModule.wireTypes.lengthDelimited)
		var3158, var4583 = protoModule.writeString(var3158, var3159, self.key)
		buff = var3158
		var3157 = var3159
	end
	if self.value ~= nil then
		local var3160 = self.value:encode()
		local var3161, var3162 = protoModule.writeTag(buff, var3157, 2, protoModule.wireTypes.lengthDelimited)
		var3161, var4586 = protoModule.writeBuffer(var3161, var3162, var3160, buffer.len(var3160))
		buff = var3161
		var3157 = var3162
	end
	local buff_1 = buffer.create(var3157)
	buffer.copy(buff_1, 0, buff, 0, var3157)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3157 = t_114.new()
	local var3158 = 0
	while var3158 < buffer.len(p114) do
		local _ = nil
		local var3159 = nil
		local var3160, var3161, var3162 = protoModule.readTag(p114, var3158)
		local var3163 = var3160
		var3159 = var3161
		var3158 = var3162
		
		if var3159 == protoModule.wireTypes.varint then
			local _ = nil
			local var3164, var3165 = protoModule.readVarInt(p114, var3158)
			local _ = var3164
			var3158 = var3165
			continue
		end
		if var3159 == protoModule.wireTypes.lengthDelimited then
			if var3163 == 1 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p114, var3158)
				var3158 = var3167
				var3157.key = buffer.tostring(var3166)
			elseif var3163 == 2 then
				local _ = nil
				local var3168, var3169 = protoModule.readBuffer(p114, var3158)
				var3158 = var3169
				var3157.value = t.FeedEntry.decode(var3168)
			else
				local _ = nil
				local var3170, var3171 = protoModule.readVarInt(p114, var3158)
				var3158 = var3171 + var3170
			end
		elseif var3159 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3172, var3173 = protoModule.readFixed32(p114, var3158)
			local _ = var3172
			var3158 = var3173
		elseif var3159 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3174, var3175 = protoModule.readFixed64(p114, var3158)
			local _ = var3174
			var3158 = var3175
		else
			error("Unsupported wire type: " .. var3159)
		end
	end
	return var3157
end

function t_114:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_114:jsonDecode()
	-- upvalues: t_114 (ref), t (ref)
	local var3176 = t_114.new()
	
	if self.key ~= nil then
		var3176.key = self.key
	end
	if self.value ~= nil then
		var3176.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3176
end

t_114.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_114
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		key = if p115 == nil or p115.key == nil then "" else p115.key,
		value = if p115 == nil or p115.value == nil then nil else p115.value
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3176 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3177, var3178 = protoModule.writeTag(buff, var3176, 1, protoModule.wireTypes.lengthDelimited)
		var3177, var4612 = protoModule.writeString(var3177, var3178, self.key)
		buff = var3177
		var3176 = var3178
	end
	if self.value ~= nil then
		local var3179 = self.value:encode()
		local var3180, var3181 = protoModule.writeTag(buff, var3176, 2, protoModule.wireTypes.lengthDelimited)
		var3180, var4615 = protoModule.writeBuffer(var3180, var3181, var3179, buffer.len(var3179))
		buff = var3180
		var3176 = var3181
	end
	local buff_1 = buffer.create(var3176)
	buffer.copy(buff_1, 0, buff, 0, var3176)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3176 = t_115.new()
	local var3177 = 0
	while var3177 < buffer.len(p115) do
		local _ = nil
		local var3178 = nil
		local var3179, var3180, var3181 = protoModule.readTag(p115, var3177)
		local var3182 = var3179
		var3178 = var3180
		var3177 = var3181
		
		if var3178 == protoModule.wireTypes.varint then
			local _ = nil
			local var3183, var3184 = protoModule.readVarInt(p115, var3177)
			local _ = var3183
			var3177 = var3184
			continue
		end
		if var3178 == protoModule.wireTypes.lengthDelimited then
			if var3182 == 1 then
				local _ = nil
				local var3185, var3186 = protoModule.readBuffer(p115, var3177)
				var3177 = var3186
				var3176.key = buffer.tostring(var3185)
			elseif var3182 == 2 then
				local _ = nil
				local var3187, var3188 = protoModule.readBuffer(p115, var3177)
				var3177 = var3188
				var3176.value = t.EntryOrder.decode(var3187)
			else
				local _ = nil
				local var3189, var3190 = protoModule.readVarInt(p115, var3177)
				var3177 = var3190 + var3189
			end
		elseif var3178 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3191, var3192 = protoModule.readFixed32(p115, var3177)
			local _ = var3191
			var3177 = var3192
		elseif var3178 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3193, var3194 = protoModule.readFixed64(p115, var3177)
			local _ = var3193
			var3177 = var3194
		else
			error("Unsupported wire type: " .. var3178)
		end
	end
	return var3176
end

function t_115:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), t (ref)
	local var3195 = t_115.new()
	
	if self.key ~= nil then
		var3195.key = self.key
	end
	if self.value ~= nil then
		var3195.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3195
end

t_115.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_115
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t_116 (ref)
	return setmetatable({
		key = if p116 == nil or p116.key == nil then "" else p116.key,
		value = if p116 == nil or p116.value == nil then nil else p116.value
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3195 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3196, var3197 = protoModule.writeTag(buff, var3195, 1, protoModule.wireTypes.lengthDelimited)
		var3196, var4641 = protoModule.writeString(var3196, var3197, self.key)
		buff = var3196
		var3195 = var3197
	end
	if self.value ~= nil then
		local var3198 = self.value:encode()
		local var3199, var3200 = protoModule.writeTag(buff, var3195, 2, protoModule.wireTypes.lengthDelimited)
		var3199, var4644 = protoModule.writeBuffer(var3199, var3200, var3198, buffer.len(var3198))
		buff = var3199
		var3195 = var3200
	end
	local buff_1 = buffer.create(var3195)
	buffer.copy(buff_1, 0, buff, 0, var3195)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3195 = t_116.new()
	local var3196 = 0
	while var3196 < buffer.len(p116) do
		local _ = nil
		local var3197 = nil
		local var3198, var3199, var3200 = protoModule.readTag(p116, var3196)
		local var3201 = var3198
		var3197 = var3199
		var3196 = var3200
		
		if var3197 == protoModule.wireTypes.varint then
			local _ = nil
			local var3202, var3203 = protoModule.readVarInt(p116, var3196)
			local _ = var3202
			var3196 = var3203
			continue
		end
		if var3197 == protoModule.wireTypes.lengthDelimited then
			if var3201 == 1 then
				local _ = nil
				local var3204, var3205 = protoModule.readBuffer(p116, var3196)
				var3196 = var3205
				var3195.key = buffer.tostring(var3204)
			elseif var3201 == 2 then
				local _ = nil
				local var3206, var3207 = protoModule.readBuffer(p116, var3196)
				var3196 = var3207
				var3195.value = t.ContentPool.decode(var3206)
			else
				local _ = nil
				local var3208, var3209 = protoModule.readVarInt(p116, var3196)
				var3196 = var3209 + var3208
			end
		elseif var3197 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3210, var3211 = protoModule.readFixed32(p116, var3196)
			local _ = var3210
			var3196 = var3211
		elseif var3197 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3212, var3213 = protoModule.readFixed64(p116, var3196)
			local _ = var3212
			var3196 = var3213
		else
			error("Unsupported wire type: " .. var3197)
		end
	end
	return var3195
end

function t_116:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_116:jsonDecode()
	-- upvalues: t_116 (ref), t (ref)
	local var3214 = t_116.new()
	
	if self.key ~= nil then
		var3214.key = self.key
	end
	if self.value ~= nil then
		var3214.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3214
end

t_116.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_116
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		foreground_header_entry = if p117 == nil or p117.foreground_header_entry == nil then nil else p117.foreground_header_entry,
		background_header_entry = if p117 == nil or p117.background_header_entry == nil then nil else p117.background_header_entry,
		layout_variant = if p117 == nil or p117.layout_variant == nil then "" else p117.layout_variant
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3214 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3215 = self.foreground_header_entry:encode()
		local var3216, var3217 = protoModule.writeTag(buff, var3214, 1, protoModule.wireTypes.lengthDelimited)
		var3216, var4671 = protoModule.writeBuffer(var3216, var3217, var3215, buffer.len(var3215))
		buff = var3216
		var3214 = var3217
	end
	if self.background_header_entry ~= nil then
		local var3218 = self.background_header_entry:encode()
		local var3219, var3220 = protoModule.writeTag(buff, var3214, 2, protoModule.wireTypes.lengthDelimited)
		var3219, var4674 = protoModule.writeBuffer(var3219, var3220, var3218, buffer.len(var3218))
		buff = var3219
		var3214 = var3220
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3221, var3222 = protoModule.writeTag(buff, var3214, 3, protoModule.wireTypes.lengthDelimited)
		var3221, var4676 = protoModule.writeString(var3221, var3222, self.layout_variant)
		buff = var3221
		var3214 = var3222
	end
	local buff_1 = buffer.create(var3214)
	buffer.copy(buff_1, 0, buff, 0, var3214)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3214 = t_117.new()
	local var3215 = 0
	while var3215 < buffer.len(p117) do
		local _ = nil
		local var3216 = nil
		local var3217, var3218, var3219 = protoModule.readTag(p117, var3215)
		local var3220 = var3217
		var3216 = var3218
		var3215 = var3219
		
		if var3216 == protoModule.wireTypes.varint then
			local _ = nil
			local var3221, var3222 = protoModule.readVarInt(p117, var3215)
			local _ = var3221
			var3215 = var3222
			continue
		end
		if var3216 == protoModule.wireTypes.lengthDelimited then
			if var3220 == 1 then
				local _ = nil
				local var3223, var3224 = protoModule.readBuffer(p117, var3215)
				var3215 = var3224
				var3214.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3223)
			elseif var3220 == 2 then
				local _ = nil
				local var3225, var3226 = protoModule.readBuffer(p117, var3215)
				var3215 = var3226
				var3214.background_header_entry = t.BackgroundHeaderEntry.decode(var3225)
			elseif var3220 == 3 then
				local _ = nil
				local var3227, var3228 = protoModule.readBuffer(p117, var3215)
				var3215 = var3228
				var3214.layout_variant = buffer.tostring(var3227)
			else
				local _ = nil
				local var3229, var3230 = protoModule.readVarInt(p117, var3215)
				var3215 = var3230 + var3229
			end
		elseif var3216 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3231, var3232 = protoModule.readFixed32(p117, var3215)
			local _ = var3231
			var3215 = var3232
		elseif var3216 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3233, var3234 = protoModule.readFixed64(p117, var3215)
			local _ = var3233
			var3215 = var3234
		else
			error("Unsupported wire type: " .. var3216)
		end
	end
	return var3214
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), t (ref)
	local var3235 = t_117.new()
	
	if self.foreground_header_entry ~= nil then
		var3235.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3235.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3235.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3235.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3235.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3235.layout_variant = self.layoutVariant
	end
	return var3235
end

t_117.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_117
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		cta_button_text = if p118 == nil or p118.cta_button_text == nil then "" else p118.cta_button_text,
		cta_type = if p118 == nil or p118.cta_type == nil then "" else p118.cta_type
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3235 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3236, var3237 = protoModule.writeTag(buff, var3235, 1, protoModule.wireTypes.lengthDelimited)
		var3236, var4704 = protoModule.writeString(var3236, var3237, self.cta_button_text)
		buff = var3236
		var3235 = var3237
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3238, var3239 = protoModule.writeTag(buff, var3235, 2, protoModule.wireTypes.lengthDelimited)
		var3238, var4706 = protoModule.writeString(var3238, var3239, self.cta_type)
		buff = var3238
		var3235 = var3239
	end
	local buff_1 = buffer.create(var3235)
	buffer.copy(buff_1, 0, buff, 0, var3235)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3235 = t_118.new()
	local var3236 = 0
	while var3236 < buffer.len(p118) do
		local _ = nil
		local var3237 = nil
		local var3238, var3239, var3240 = protoModule.readTag(p118, var3236)
		local var3241 = var3238
		var3237 = var3239
		var3236 = var3240
		
		if var3237 == protoModule.wireTypes.varint then
			local _ = nil
			local var3242, var3243 = protoModule.readVarInt(p118, var3236)
			local _ = var3242
			var3236 = var3243
			continue
		end
		if var3237 == protoModule.wireTypes.lengthDelimited then
			if var3241 == 1 then
				local _ = nil
				local var3244, var3245 = protoModule.readBuffer(p118, var3236)
				var3236 = var3245
				var3235.cta_button_text = buffer.tostring(var3244)
			elseif var3241 == 2 then
				local _ = nil
				local var3246, var3247 = protoModule.readBuffer(p118, var3236)
				var3236 = var3247
				var3235.cta_type = buffer.tostring(var3246)
			else
				local _ = nil
				local var3248, var3249 = protoModule.readVarInt(p118, var3236)
				var3236 = var3249 + var3248
			end
		elseif var3237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3250, var3251 = protoModule.readFixed32(p118, var3236)
			local _ = var3250
			var3236 = var3251
		elseif var3237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3252, var3253 = protoModule.readFixed64(p118, var3236)
			local _ = var3252
			var3236 = var3253
		else
			error("Unsupported wire type: " .. var3237)
		end
	end
	return var3235
end

function t_118:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_118:jsonDecode()
	-- upvalues: t_118 (ref)
	local var3254 = t_118.new()
	
	if self.cta_button_text ~= nil then
		var3254.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3254.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3254.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3254.cta_type = self.ctaType
	end
	return var3254
end

t_118.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_118
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		title = if p119 == nil or p119.title == nil then "" else p119.title,
		cta_button_text = if p119 == nil or p119.cta_button_text == nil then "" else p119.cta_button_text,
		image_asset_id = if p119 == nil or p119.image_asset_id == nil then "" else p119.image_asset_id,
		cta_type = if p119 == nil or p119.cta_type == nil then "" else p119.cta_type
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3254 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3255, var3256 = protoModule.writeTag(buff, var3254, 1, protoModule.wireTypes.lengthDelimited)
		var3255, var4732 = protoModule.writeString(var3255, var3256, self.title)
		buff = var3255
		var3254 = var3256
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3257, var3258 = protoModule.writeTag(buff, var3254, 2, protoModule.wireTypes.lengthDelimited)
		var3257, var4734 = protoModule.writeString(var3257, var3258, self.cta_button_text)
		buff = var3257
		var3254 = var3258
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3259, var3260 = protoModule.writeTag(buff, var3254, 3, protoModule.wireTypes.lengthDelimited)
		var3259, var4736 = protoModule.writeString(var3259, var3260, self.image_asset_id)
		buff = var3259
		var3254 = var3260
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3261, var3262 = protoModule.writeTag(buff, var3254, 4, protoModule.wireTypes.lengthDelimited)
		var3261, var4738 = protoModule.writeString(var3261, var3262, self.cta_type)
		buff = var3261
		var3254 = var3262
	end
	local buff_1 = buffer.create(var3254)
	buffer.copy(buff_1, 0, buff, 0, var3254)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3254 = t_119.new()
	local var3255 = 0
	while var3255 < buffer.len(p119) do
		local _ = nil
		local var3256 = nil
		local var3257, var3258, var3259 = protoModule.readTag(p119, var3255)
		local var3260 = var3257
		var3256 = var3258
		var3255 = var3259
		
		if var3256 == protoModule.wireTypes.varint then
			local _ = nil
			local var3261, var3262 = protoModule.readVarInt(p119, var3255)
			local _ = var3261
			var3255 = var3262
			continue
		end
		if var3256 == protoModule.wireTypes.lengthDelimited then
			if var3260 == 1 then
				local _ = nil
				local var3263, var3264 = protoModule.readBuffer(p119, var3255)
				var3255 = var3264
				var3254.title = buffer.tostring(var3263)
			elseif var3260 == 2 then
				local _ = nil
				local var3265, var3266 = protoModule.readBuffer(p119, var3255)
				var3255 = var3266
				var3254.cta_button_text = buffer.tostring(var3265)
			elseif var3260 == 3 then
				local _ = nil
				local var3267, var3268 = protoModule.readBuffer(p119, var3255)
				var3255 = var3268
				var3254.image_asset_id = buffer.tostring(var3267)
			elseif var3260 == 4 then
				local _ = nil
				local var3269, var3270 = protoModule.readBuffer(p119, var3255)
				var3255 = var3270
				var3254.cta_type = buffer.tostring(var3269)
			else
				local _ = nil
				local var3271, var3272 = protoModule.readVarInt(p119, var3255)
				var3255 = var3272 + var3271
			end
		elseif var3256 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3273, var3274 = protoModule.readFixed32(p119, var3255)
			local _ = var3273
			var3255 = var3274
		elseif var3256 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3275, var3276 = protoModule.readFixed64(p119, var3255)
			local _ = var3275
			var3255 = var3276
		else
			error("Unsupported wire type: " .. var3256)
		end
	end
	return var3254
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref)
	local var3277 = t_119.new()
	
	if self.title ~= nil then
		var3277.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3277.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3277.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3277.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3277.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3277.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3277.cta_type = self.ctaType
	end
	return var3277
end

t_119.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_119
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		title = if p120 == nil or p120.title == nil then "" else p120.title,
		url = if p120 == nil or p120.url == nil then nil else p120.url,
		destination = if p120 == nil or p120.destination == nil then nil else p120.destination,
		row_id = if p120 == nil or p120.row_id == nil then "" else p120.row_id
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3277 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3278, var3279 = protoModule.writeTag(buff, var3277, 1, protoModule.wireTypes.lengthDelimited)
		var3278, var4768 = protoModule.writeString(var3278, var3279, self.title)
		buff = var3278
		var3277 = var3279
	end
	if self.url ~= nil then
		local var3280, var3281 = protoModule.writeTag(buff, var3277, 2, protoModule.wireTypes.lengthDelimited)
		var3280, var4770 = protoModule.writeString(var3280, var3281, self.url)
		buff = var3280
		var3277 = var3281
	end
	if self.destination ~= nil then
		local var3282, var3283 = protoModule.writeTag(buff, var3277, 3, protoModule.wireTypes.lengthDelimited)
		var3282, var4772 = protoModule.writeString(var3282, var3283, self.destination)
		buff = var3282
		var3277 = var3283
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3284, var3285 = protoModule.writeTag(buff, var3277, 4, protoModule.wireTypes.lengthDelimited)
		var3284, var4774 = protoModule.writeString(var3284, var3285, self.row_id)
		buff = var3284
		var3277 = var3285
	end
	local buff_1 = buffer.create(var3277)
	buffer.copy(buff_1, 0, buff, 0, var3277)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3277 = t_120.new()
	local var3278 = 0
	while var3278 < buffer.len(p120) do
		local _ = nil
		local var3279 = nil
		local var3280, var3281, var3282 = protoModule.readTag(p120, var3278)
		local var3283 = var3280
		var3279 = var3281
		var3278 = var3282
		
		if var3279 == protoModule.wireTypes.varint then
			local _ = nil
			local var3284, var3285 = protoModule.readVarInt(p120, var3278)
			local _ = var3284
			var3278 = var3285
			continue
		end
		if var3279 == protoModule.wireTypes.lengthDelimited then
			if var3283 == 1 then
				local _ = nil
				local var3286, var3287 = protoModule.readBuffer(p120, var3278)
				var3278 = var3287
				var3277.title = buffer.tostring(var3286)
			elseif var3283 == 2 then
				local _ = nil
				local var3288, var3289 = protoModule.readBuffer(p120, var3278)
				var3278 = var3289
				var3277.url = buffer.tostring(var3288)
			elseif var3283 == 3 then
				local _ = nil
				local var3290, var3291 = protoModule.readBuffer(p120, var3278)
				var3278 = var3291
				var3277.destination = buffer.tostring(var3290)
			elseif var3283 == 4 then
				local _ = nil
				local var3292, var3293 = protoModule.readBuffer(p120, var3278)
				var3278 = var3293
				var3277.row_id = buffer.tostring(var3292)
			else
				local _ = nil
				local var3294, var3295 = protoModule.readVarInt(p120, var3278)
				var3278 = var3295 + var3294
			end
		elseif var3279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3296, var3297 = protoModule.readFixed32(p120, var3278)
			local _ = var3296
			var3278 = var3297
		elseif var3279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3298, var3299 = protoModule.readFixed64(p120, var3278)
			local _ = var3298
			var3278 = var3299
		else
			error("Unsupported wire type: " .. var3279)
		end
	end
	return var3277
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref)
	local var3300 = t_120.new()
	
	if self.title ~= nil then
		var3300.title = self.title
	end
	if self.url ~= nil then
		var3300.url = self.url
	end
	if self.destination ~= nil then
		var3300.destination = self.destination
	end
	if self.row_id ~= nil then
		var3300.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3300.row_id = self.rowId
	end
	return var3300
end

t_120.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = t_120
typeRegistryModule.default:register(t.SettingsRowInputData)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		setting_key = if p121 == nil or p121.setting_key == nil then "" else p121.setting_key,
		label = if p121 == nil or p121.label == nil then "" else p121.label,
		description = if p121 == nil or p121.description == nil then "" else p121.description,
		is_checked = if p121 == nil or p121.is_checked == nil then false else p121.is_checked,
		is_disabled = if p121 == nil or p121.is_disabled == nil then false else p121.is_disabled,
		audit_data = if p121 == nil or p121.audit_data == nil then "" else p121.audit_data
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3300 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3301, var3302 = protoModule.writeTag(buff, var3300, 1, protoModule.wireTypes.lengthDelimited)
		var3301, var4804 = protoModule.writeString(var3301, var3302, self.setting_key)
		buff = var3301
		var3300 = var3302
	end
	if self.label ~= nil and self.label ~= "" then
		local var3303, var3304 = protoModule.writeTag(buff, var3300, 2, protoModule.wireTypes.lengthDelimited)
		var3303, var4806 = protoModule.writeString(var3303, var3304, self.label)
		buff = var3303
		var3300 = var3304
	end
	if self.description ~= nil and self.description ~= "" then
		local var3305, var3306 = protoModule.writeTag(buff, var3300, 3, protoModule.wireTypes.lengthDelimited)
		var3305, var4808 = protoModule.writeString(var3305, var3306, self.description)
		buff = var3305
		var3300 = var3306
	end
	if self.is_checked then
		local var3307, var3308 = protoModule.writeTag(buff, var3300, 4, protoModule.wireTypes.varint)
		var3307, var4810 = protoModule.writeVarInt(var3307, var3308, if self.is_checked then 1 else 0)
		buff = var3307
		var3300 = var3308
	end
	if self.is_disabled then
		local var3309, var3310 = protoModule.writeTag(buff, var3300, 5, protoModule.wireTypes.varint)
		var3309, var4812 = protoModule.writeVarInt(var3309, var3310, if self.is_disabled then 1 else 0)
		buff = var3309
		var3300 = var3310
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3311, var3312 = protoModule.writeTag(buff, var3300, 6, protoModule.wireTypes.lengthDelimited)
		var3311, var4814 = protoModule.writeString(var3311, var3312, self.audit_data)
		buff = var3311
		var3300 = var3312
	end
	local buff_1 = buffer.create(var3300)
	buffer.copy(buff_1, 0, buff, 0, var3300)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3300 = t_121.new()
	local var3301 = 0
	while var3301 < buffer.len(p121) do
		local _ = nil
		local var3302 = nil
		local var3303, var3304, var3305 = protoModule.readTag(p121, var3301)
		local var3306 = var3303
		var3302 = var3304
		var3301 = var3305
		
		if var3302 == protoModule.wireTypes.varint then
			if var3306 == 4 then
				local _ = nil
				local var3307, var3308 = protoModule.readVarInt(p121, var3301)
				var3301 = var3308
				var3300.is_checked = var3307 ~= 0
			elseif var3306 == 5 then
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p121, var3301)
				var3301 = var3310
				var3300.is_disabled = var3309 ~= 0
			else
				local _ = nil
				local var3311, var3312 = protoModule.readVarInt(p121, var3301)
				local _ = var3311
				var3301 = var3312
			end
		end
		if var3302 == protoModule.wireTypes.lengthDelimited then
			if var3306 == 1 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p121, var3301)
				var3301 = var3314
				var3300.setting_key = buffer.tostring(var3313)
			elseif var3306 == 2 then
				local _ = nil
				local var3315, var3316 = protoModule.readBuffer(p121, var3301)
				var3301 = var3316
				var3300.label = buffer.tostring(var3315)
			elseif var3306 == 3 then
				local _ = nil
				local var3317, var3318 = protoModule.readBuffer(p121, var3301)
				var3301 = var3318
				var3300.description = buffer.tostring(var3317)
			elseif var3306 == 6 then
				local _ = nil
				local var3319, var3320 = protoModule.readBuffer(p121, var3301)
				var3301 = var3320
				var3300.audit_data = buffer.tostring(var3319)
			else
				local _ = nil
				local var3321, var3322 = protoModule.readVarInt(p121, var3301)
				var3301 = var3322 + var3321
			end
		elseif var3302 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3323, var3324 = protoModule.readFixed32(p121, var3301)
			local _ = var3323
			var3301 = var3324
		elseif var3302 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3325, var3326 = protoModule.readFixed64(p121, var3301)
			local _ = var3325
			var3301 = var3326
		else
			error("Unsupported wire type: " .. var3302)
		end
	end
	return var3300
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref)
	local var3327 = t_121.new()
	
	if self.setting_key ~= nil then
		var3327.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3327.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3327.label = self.label
	end
	if self.description ~= nil then
		var3327.description = self.description
	end
	if self.is_checked ~= nil then
		var3327.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3327.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3327.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3327.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3327.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3327.audit_data = self.auditData
	end
	return var3327
end

t_121.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = t_121
typeRegistryModule.default:register(t.SettingsToggleInputData)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		universe_id = if p122 == nil or p122.universe_id == nil then nil else p122.universe_id,
		title = if p122 == nil or p122.title == nil then nil else p122.title,
		subtitle = if p122 == nil or p122.subtitle == nil then nil else p122.subtitle,
		badge_text = if p122 == nil or p122.badge_text == nil then nil else p122.badge_text,
		foreground = if p122 == nil or p122.foreground == nil then nil else p122.foreground,
		background = if p122 == nil or p122.background == nil then nil else p122.background,
		title_image = if p122 == nil or p122.title_image == nil then nil else p122.title_image,
		asset_title = if p122 == nil or p122.asset_title == nil then nil else p122.asset_title,
		asset_subtitle = if p122 == nil or p122.asset_subtitle == nil then nil else p122.asset_subtitle,
		gradient = if p122 == nil or p122.gradient == nil then nil else p122.gradient,
		playable_text = if p122 == nil or p122.playable_text == nil then nil else p122.playable_text,
		collection_id = if p122 == nil or p122.collection_id == nil then nil else p122.collection_id,
		campaign_id = if p122 == nil or p122.campaign_id == nil then nil else p122.campaign_id,
		cohort_id = if p122 == nil or p122.cohort_id == nil then nil else p122.cohort_id,
		sort_id = if p122 == nil or p122.sort_id == nil then nil else p122.sort_id,
		hero_unit_id = if p122 == nil or p122.hero_unit_id == nil then nil else p122.hero_unit_id,
		analytics_id = if p122 == nil or p122.analytics_id == nil then nil else p122.analytics_id,
		is_sponsored = if p122 == nil or p122.is_sponsored == nil then nil else p122.is_sponsored
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3327 = 0
	
	if self.universe_id ~= nil then
		local var3328, var3329 = protoModule.writeTag(buff, var3327, 1, protoModule.wireTypes.lengthDelimited)
		var3328, var4848 = protoModule.writeString(var3328, var3329, self.universe_id)
		buff = var3328
		var3327 = var3329
	end
	if self.title ~= nil then
		local var3330, var3331 = protoModule.writeTag(buff, var3327, 2, protoModule.wireTypes.lengthDelimited)
		var3330, var4850 = protoModule.writeString(var3330, var3331, self.title)
		buff = var3330
		var3327 = var3331
	end
	if self.subtitle ~= nil then
		local var3332, var3333 = protoModule.writeTag(buff, var3327, 3, protoModule.wireTypes.lengthDelimited)
		var3332, var4852 = protoModule.writeString(var3332, var3333, self.subtitle)
		buff = var3332
		var3327 = var3333
	end
	if self.badge_text ~= nil then
		local var3334, var3335 = protoModule.writeTag(buff, var3327, 4, protoModule.wireTypes.lengthDelimited)
		var3334, var4854 = protoModule.writeString(var3334, var3335, self.badge_text)
		buff = var3334
		var3327 = var3335
	end
	if self.foreground ~= nil then
		local var3336 = self.foreground:encode()
		local var3337, var3338 = protoModule.writeTag(buff, var3327, 5, protoModule.wireTypes.lengthDelimited)
		var3337, var4857 = protoModule.writeBuffer(var3337, var3338, var3336, buffer.len(var3336))
		buff = var3337
		var3327 = var3338
	end
	if self.background ~= nil then
		local var3339 = self.background:encode()
		local var3340, var3341 = protoModule.writeTag(buff, var3327, 6, protoModule.wireTypes.lengthDelimited)
		var3340, var4860 = protoModule.writeBuffer(var3340, var3341, var3339, buffer.len(var3339))
		buff = var3340
		var3327 = var3341
	end
	if self.title_image ~= nil then
		local var3342 = self.title_image:encode()
		local var3343, var3344 = protoModule.writeTag(buff, var3327, 7, protoModule.wireTypes.lengthDelimited)
		var3343, var4863 = protoModule.writeBuffer(var3343, var3344, var3342, buffer.len(var3342))
		buff = var3343
		var3327 = var3344
	end
	if self.asset_title ~= nil then
		local var3345, var3346 = protoModule.writeTag(buff, var3327, 8, protoModule.wireTypes.lengthDelimited)
		var3345, var4865 = protoModule.writeString(var3345, var3346, self.asset_title)
		buff = var3345
		var3327 = var3346
	end
	if self.asset_subtitle ~= nil then
		local var3347, var3348 = protoModule.writeTag(buff, var3327, 9, protoModule.wireTypes.lengthDelimited)
		var3347, var4867 = protoModule.writeString(var3347, var3348, self.asset_subtitle)
		buff = var3347
		var3327 = var3348
	end
	if self.gradient ~= nil then
		local var3349 = self.gradient:encode()
		local var3350, var3351 = protoModule.writeTag(buff, var3327, 10, protoModule.wireTypes.lengthDelimited)
		var3350, var4870 = protoModule.writeBuffer(var3350, var3351, var3349, buffer.len(var3349))
		buff = var3350
		var3327 = var3351
	end
	if self.playable_text ~= nil then
		local var3352, var3353 = protoModule.writeTag(buff, var3327, 11, protoModule.wireTypes.lengthDelimited)
		var3352, var4872 = protoModule.writeString(var3352, var3353, self.playable_text)
		buff = var3352
		var3327 = var3353
	end
	if self.collection_id ~= nil then
		local var3354, var3355 = protoModule.writeTag(buff, var3327, 12, protoModule.wireTypes.lengthDelimited)
		var3354, var4874 = protoModule.writeString(var3354, var3355, self.collection_id)
		buff = var3354
		var3327 = var3355
	end
	if self.campaign_id ~= nil then
		local var3356, var3357 = protoModule.writeTag(buff, var3327, 13, protoModule.wireTypes.lengthDelimited)
		var3356, var4876 = protoModule.writeString(var3356, var3357, self.campaign_id)
		buff = var3356
		var3327 = var3357
	end
	if self.cohort_id ~= nil then
		local var3358, var3359 = protoModule.writeTag(buff, var3327, 14, protoModule.wireTypes.lengthDelimited)
		var3358, var4878 = protoModule.writeString(var3358, var3359, self.cohort_id)
		buff = var3358
		var3327 = var3359
	end
	if self.sort_id ~= nil then
		local var3360, var3361 = protoModule.writeTag(buff, var3327, 15, protoModule.wireTypes.lengthDelimited)
		var3360, var4880 = protoModule.writeString(var3360, var3361, self.sort_id)
		buff = var3360
		var3327 = var3361
	end
	if self.hero_unit_id ~= nil then
		local var3362, var3363 = protoModule.writeTag(buff, var3327, 16, protoModule.wireTypes.lengthDelimited)
		var3362, var4882 = protoModule.writeString(var3362, var3363, self.hero_unit_id)
		buff = var3362
		var3327 = var3363
	end
	if self.analytics_id ~= nil then
		local var3364, var3365 = protoModule.writeTag(buff, var3327, 17, protoModule.wireTypes.lengthDelimited)
		var3364, var4884 = protoModule.writeString(var3364, var3365, self.analytics_id)
		buff = var3364
		var3327 = var3365
	end
	if self.is_sponsored ~= nil then
		local var3366, var3367 = protoModule.writeTag(buff, var3327, 18, protoModule.wireTypes.varint)
		var3366, var4886 = protoModule.writeVarInt(var3366, var3367, if self.is_sponsored then 1 else 0)
		buff = var3366
		var3327 = var3367
	end
	local buff_1 = buffer.create(var3327)
	buffer.copy(buff_1, 0, buff, 0, var3327)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3327 = t_122.new()
	local var3328 = 0
	while var3328 < buffer.len(p122) do
		local _ = nil
		local var3329 = nil
		local var3330, var3331, var3332 = protoModule.readTag(p122, var3328)
		local var3333 = var3330
		var3329 = var3331
		var3328 = var3332
		
		if var3329 == protoModule.wireTypes.varint then
			if var3333 == 18 then
				local _ = nil
				local var3334, var3335 = protoModule.readVarInt(p122, var3328)
				var3328 = var3335
				var3327.is_sponsored = var3334 ~= 0
			else
				local _ = nil
				local var3336, var3337 = protoModule.readVarInt(p122, var3328)
				local _ = var3336
				var3328 = var3337
			end
		end
		if var3329 == protoModule.wireTypes.lengthDelimited then
			if var3333 == 1 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p122, var3328)
				var3328 = var3339
				var3327.universe_id = buffer.tostring(var3338)
			elseif var3333 == 2 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p122, var3328)
				var3328 = var3341
				var3327.title = buffer.tostring(var3340)
			elseif var3333 == 3 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p122, var3328)
				var3328 = var3343
				var3327.subtitle = buffer.tostring(var3342)
			elseif var3333 == 4 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p122, var3328)
				var3328 = var3345
				var3327.badge_text = buffer.tostring(var3344)
			elseif var3333 == 5 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p122, var3328)
				var3328 = var3347
				var3327.foreground = t.HeroUnitInputData_VisualAsset.decode(var3346)
			elseif var3333 == 6 then
				local _ = nil
				local var3348, var3349 = protoModule.readBuffer(p122, var3328)
				var3328 = var3349
				var3327.background = t.HeroUnitInputData_VisualAsset.decode(var3348)
			elseif var3333 == 7 then
				local _ = nil
				local var3350, var3351 = protoModule.readBuffer(p122, var3328)
				var3328 = var3351
				var3327.title_image = t.HeroUnitInputData_VisualAsset.decode(var3350)
			elseif var3333 == 8 then
				local _ = nil
				local var3352, var3353 = protoModule.readBuffer(p122, var3328)
				var3328 = var3353
				var3327.asset_title = buffer.tostring(var3352)
			elseif var3333 == 9 then
				local _ = nil
				local var3354, var3355 = protoModule.readBuffer(p122, var3328)
				var3328 = var3355
				var3327.asset_subtitle = buffer.tostring(var3354)
			elseif var3333 == 10 then
				local _ = nil
				local var3356, var3357 = protoModule.readBuffer(p122, var3328)
				var3328 = var3357
				var3327.gradient = t.HeroUnitInputData_Gradient.decode(var3356)
			elseif var3333 == 11 then
				local _ = nil
				local var3358, var3359 = protoModule.readBuffer(p122, var3328)
				var3328 = var3359
				var3327.playable_text = buffer.tostring(var3358)
			elseif var3333 == 12 then
				local _ = nil
				local var3360, var3361 = protoModule.readBuffer(p122, var3328)
				var3328 = var3361
				var3327.collection_id = buffer.tostring(var3360)
			elseif var3333 == 13 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p122, var3328)
				var3328 = var3363
				var3327.campaign_id = buffer.tostring(var3362)
			elseif var3333 == 14 then
				local _ = nil
				local var3364, var3365 = protoModule.readBuffer(p122, var3328)
				var3328 = var3365
				var3327.cohort_id = buffer.tostring(var3364)
			elseif var3333 == 15 then
				local _ = nil
				local var3366, var3367 = protoModule.readBuffer(p122, var3328)
				var3328 = var3367
				var3327.sort_id = buffer.tostring(var3366)
			elseif var3333 == 16 then
				local _ = nil
				local var3368, var3369 = protoModule.readBuffer(p122, var3328)
				var3328 = var3369
				var3327.hero_unit_id = buffer.tostring(var3368)
			elseif var3333 == 17 then
				local _ = nil
				local var3370, var3371 = protoModule.readBuffer(p122, var3328)
				var3328 = var3371
				var3327.analytics_id = buffer.tostring(var3370)
			else
				local _ = nil
				local var3372, var3373 = protoModule.readVarInt(p122, var3328)
				var3328 = var3373 + var3372
			end
		elseif var3329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3374, var3375 = protoModule.readFixed32(p122, var3328)
			local _ = var3374
			var3328 = var3375
		elseif var3329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3376, var3377 = protoModule.readFixed64(p122, var3328)
			local _ = var3376
			var3328 = var3377
		else
			error("Unsupported wire type: " .. var3329)
		end
	end
	return var3327
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), t (ref)
	local var3378 = t_122.new()
	
	if self.universe_id ~= nil then
		var3378.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3378.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3378.title = self.title
	end
	if self.subtitle ~= nil then
		var3378.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3378.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3378.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3378.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3378.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3378.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3378.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3378.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3378.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3378.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3378.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3378.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3378.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3378.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3378.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3378.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3378.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3378.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3378.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3378.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3378.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3378.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3378.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3378.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3378.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3378.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3378.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3378.is_sponsored = self.isSponsored
	end
	return var3378
end

t_122.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_122
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		asset_id = if p123 == nil or p123.asset_id == nil then "" else p123.asset_id,
		aspect_ratio = if p123 == nil or p123.aspect_ratio == nil then nil else p123.aspect_ratio,
		enable_animation = if p123 == nil or p123.enable_animation == nil then nil else p123.enable_animation
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3378 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3379, var3380 = protoModule.writeTag(buff, var3378, 1, protoModule.wireTypes.lengthDelimited)
		var3379, var4944 = protoModule.writeString(var3379, var3380, self.asset_id)
		buff = var3379
		var3378 = var3380
	end
	if self.aspect_ratio ~= nil then
		local var3381, var3382 = protoModule.writeTag(buff, var3378, 2, protoModule.wireTypes.i64)
		var3381, var4946 = protoModule.writeDouble(var3381, var3382, self.aspect_ratio)
		buff = var3381
		var3378 = var3382
	end
	if self.enable_animation ~= nil then
		local var3383, var3384 = protoModule.writeTag(buff, var3378, 3, protoModule.wireTypes.varint)
		var3383, var4948 = protoModule.writeVarInt(var3383, var3384, if self.enable_animation then 1 else 0)
		buff = var3383
		var3378 = var3384
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
			if var3384 == 3 then
				local _ = nil
				local var3385, var3386 = protoModule.readVarInt(p123, var3379)
				var3379 = var3386
				var3378.enable_animation = var3385 ~= 0
			else
				local _ = nil
				local var3387, var3388 = protoModule.readVarInt(p123, var3379)
				local _ = var3387
				var3379 = var3388
			end
		end
		if var3380 == protoModule.wireTypes.lengthDelimited then
			if var3384 == 1 then
				local _ = nil
				local var3389, var3390 = protoModule.readBuffer(p123, var3379)
				var3379 = var3390
				var3378.asset_id = buffer.tostring(var3389)
			else
				local _ = nil
				local var3391, var3392 = protoModule.readVarInt(p123, var3379)
				var3379 = var3392 + var3391
			end
		elseif var3380 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3393, var3394 = protoModule.readFixed32(p123, var3379)
			local _ = var3393
			var3379 = var3394
		elseif var3380 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var3380)
		elseif var3384 == 2 then
			local _ = nil
			local var3395, var3396 = protoModule.readDouble(p123, var3379)
			var3379 = var3396
			var3378.aspect_ratio = var3395
		else
			local _ = nil
			local var3397, var3398 = protoModule.readFixed64(p123, var3379)
			local _ = var3397
			var3379 = var3398
		end
	end
	return var3378
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3399 = t_123.new()
	
	if self.asset_id ~= nil then
		var3399.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3399.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3399.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3399.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3399.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3399.enable_animation = self.enableAnimation
	end
	return var3399
end

t_123.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_123
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		start_color = if p124 == nil or p124.start_color == nil then nil else p124.start_color,
		end_color = if p124 == nil or p124.end_color == nil then nil else p124.end_color,
		start_opacity = if p124 == nil or p124.start_opacity == nil then nil else p124.start_opacity,
		end_opacity = if p124 == nil or p124.end_opacity == nil then nil else p124.end_opacity,
		degree = if p124 == nil or p124.degree == nil then nil else p124.degree
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3399 = 0
	
	if self.start_color ~= nil then
		local var3400, var3401 = protoModule.writeTag(buff, var3399, 1, protoModule.wireTypes.lengthDelimited)
		var3400, var4976 = protoModule.writeString(var3400, var3401, self.start_color)
		buff = var3400
		var3399 = var3401
	end
	if self.end_color ~= nil then
		local var3402, var3403 = protoModule.writeTag(buff, var3399, 2, protoModule.wireTypes.lengthDelimited)
		var3402, var4978 = protoModule.writeString(var3402, var3403, self.end_color)
		buff = var3402
		var3399 = var3403
	end
	if self.start_opacity ~= nil then
		local var3404, var3405 = protoModule.writeTag(buff, var3399, 3, protoModule.wireTypes.i64)
		var3404, var4980 = protoModule.writeDouble(var3404, var3405, self.start_opacity)
		buff = var3404
		var3399 = var3405
	end
	if self.end_opacity ~= nil then
		local var3406, var3407 = protoModule.writeTag(buff, var3399, 4, protoModule.wireTypes.i64)
		var3406, var4982 = protoModule.writeDouble(var3406, var3407, self.end_opacity)
		buff = var3406
		var3399 = var3407
	end
	if self.degree ~= nil then
		local var3408, var3409 = protoModule.writeTag(buff, var3399, 5, protoModule.wireTypes.i64)
		var3408, var4984 = protoModule.writeDouble(var3408, var3409, self.degree)
		buff = var3408
		var3399 = var3409
	end
	local buff_1 = buffer.create(var3399)
	buffer.copy(buff_1, 0, buff, 0, var3399)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3399 = t_124.new()
	local var3400 = 0
	while var3400 < buffer.len(p124) do
		local _ = nil
		local var3401 = nil
		local var3402, var3403, var3404 = protoModule.readTag(p124, var3400)
		local var3405 = var3402
		var3401 = var3403
		var3400 = var3404
		
		if var3401 == protoModule.wireTypes.varint then
			local _ = nil
			local var3406, var3407 = protoModule.readVarInt(p124, var3400)
			local _ = var3406
			var3400 = var3407
			continue
		end
		if var3401 == protoModule.wireTypes.lengthDelimited then
			if var3405 == 1 then
				local _ = nil
				local var3408, var3409 = protoModule.readBuffer(p124, var3400)
				var3400 = var3409
				var3399.start_color = buffer.tostring(var3408)
			elseif var3405 == 2 then
				local _ = nil
				local var3410, var3411 = protoModule.readBuffer(p124, var3400)
				var3400 = var3411
				var3399.end_color = buffer.tostring(var3410)
			else
				local _ = nil
				local var3412, var3413 = protoModule.readVarInt(p124, var3400)
				var3400 = var3413 + var3412
			end
		elseif var3401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3414, var3415 = protoModule.readFixed32(p124, var3400)
			local _ = var3414
			var3400 = var3415
		elseif var3401 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var3401)
		elseif var3405 == 3 then
			local _ = nil
			local var3416, var3417 = protoModule.readDouble(p124, var3400)
			var3400 = var3417
			var3399.start_opacity = var3416
		elseif var3405 == 4 then
			local _ = nil
			local var3418, var3419 = protoModule.readDouble(p124, var3400)
			var3400 = var3419
			var3399.end_opacity = var3418
		elseif var3405 == 5 then
			local _ = nil
			local var3420, var3421 = protoModule.readDouble(p124, var3400)
			var3400 = var3421
			var3399.degree = var3420
		else
			local _ = nil
			local var3422, var3423 = protoModule.readFixed64(p124, var3400)
			local _ = var3422
			var3400 = var3423
		end
	end
	return var3399
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3424 = t_124.new()
	
	if self.start_color ~= nil then
		var3424.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3424.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3424.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3424.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3424.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3424.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3424.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3424.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3424.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3424
end

t_124.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_124
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		items = if p125 == nil or p125.items == nil then {} else p125.items,
		sort_id = if p125 == nil or p125.sort_id == nil then "" else p125.sort_id,
		recommendation_request_id = if p125 == nil or p125.recommendation_request_id == nil then "" else p125.recommendation_request_id
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3424 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3425 = v:encode()
			local var3426, var3427 = protoModule.writeTag(buff, var3424, 1, protoModule.wireTypes.lengthDelimited)
			var3426, var5017 = protoModule.writeBuffer(var3426, var3427, var3425, buffer.len(var3425))
			buff = var3426
			var3424 = var3427
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3428, var3429 = protoModule.writeTag(buff, var3424, 2, protoModule.wireTypes.lengthDelimited)
		var3428, var5019 = protoModule.writeString(var3428, var3429, self.sort_id)
		buff = var3428
		var3424 = var3429
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3430, var3431 = protoModule.writeTag(buff, var3424, 3, protoModule.wireTypes.lengthDelimited)
		var3430, var5021 = protoModule.writeString(var3430, var3431, self.recommendation_request_id)
		buff = var3430
		var3424 = var3431
	end
	local buff_1 = buffer.create(var3424)
	buffer.copy(buff_1, 0, buff, 0, var3424)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3432 = t_125.new()
	local var3433 = 0
	while var3433 < buffer.len(p125) do
		local _ = nil
		local var3434 = nil
		local var3435, var3436, var3437 = protoModule.readTag(p125, var3433)
		local var3438 = var3435
		var3434 = var3436
		var3433 = var3437
		
		if var3434 == protoModule.wireTypes.varint then
			local _ = nil
			local var3439, var3440 = protoModule.readVarInt(p125, var3433)
			local _ = var3439
			var3433 = var3440
			continue
		end
		if var3434 == protoModule.wireTypes.lengthDelimited then
			if var3438 == 1 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p125, var3433)
				var3433 = var3442
				table.insert(var3432.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3441))
			elseif var3438 == 2 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p125, var3433)
				var3433 = var3444
				var3432.sort_id = buffer.tostring(var3443)
			elseif var3438 == 3 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p125, var3433)
				var3433 = var3446
				var3432.recommendation_request_id = buffer.tostring(var3445)
			else
				local _ = nil
				local var3447, var3448 = protoModule.readVarInt(p125, var3433)
				var3433 = var3448 + var3447
			end
		elseif var3434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3449, var3450 = protoModule.readFixed32(p125, var3433)
			local _ = var3449
			var3433 = var3450
		elseif var3434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3451, var3452 = protoModule.readFixed64(p125, var3433)
			local _ = var3451
			var3433 = var3452
		else
			error("Unsupported wire type: " .. var3434)
		end
	end
	return var3432
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var3453 = t_125.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3453.items = t_1
	end
	if self.sort_id ~= nil then
		var3453.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3453.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3453.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3453.recommendation_request_id = self.recommendationRequestId
	end
	return var3453
end

t_125.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_125
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		item_id = if p126 == nil or p126.item_id == nil then "" else p126.item_id,
		has_pending_friend_request = if p126 == nil or p126.has_pending_friend_request == nil then false else p126.has_pending_friend_request
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3454 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3455, var3456 = protoModule.writeTag(buff, var3454, 1, protoModule.wireTypes.lengthDelimited)
		var3455, var5051 = protoModule.writeString(var3455, var3456, self.item_id)
		buff = var3455
		var3454 = var3456
	end
	if self.has_pending_friend_request then
		local var3457, var3458 = protoModule.writeTag(buff, var3454, 2, protoModule.wireTypes.varint)
		var3457, var5053 = protoModule.writeVarInt(var3457, var3458, if self.has_pending_friend_request then 1 else 0)
		buff = var3457
		var3454 = var3458
	end
	local buff_1 = buffer.create(var3454)
	buffer.copy(buff_1, 0, buff, 0, var3454)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3454 = t_126.new()
	local var3455 = 0
	while var3455 < buffer.len(p126) do
		local _ = nil
		local var3456 = nil
		local var3457, var3458, var3459 = protoModule.readTag(p126, var3455)
		local var3460 = var3457
		var3456 = var3458
		var3455 = var3459
		
		if var3456 == protoModule.wireTypes.varint then
			if var3460 == 2 then
				local _ = nil
				local var3461, var3462 = protoModule.readVarInt(p126, var3455)
				var3455 = var3462
				var3454.has_pending_friend_request = var3461 ~= 0
			else
				local _ = nil
				local var3463, var3464 = protoModule.readVarInt(p126, var3455)
				local _ = var3463
				var3455 = var3464
			end
		end
		if var3456 == protoModule.wireTypes.lengthDelimited then
			if var3460 == 1 then
				local _ = nil
				local var3465, var3466 = protoModule.readBuffer(p126, var3455)
				var3455 = var3466
				var3454.item_id = buffer.tostring(var3465)
			else
				local _ = nil
				local var3467, var3468 = protoModule.readVarInt(p126, var3455)
				var3455 = var3468 + var3467
			end
		elseif var3456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3469, var3470 = protoModule.readFixed32(p126, var3455)
			local _ = var3469
			var3455 = var3470
		elseif var3456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3471, var3472 = protoModule.readFixed64(p126, var3455)
			local _ = var3471
			var3455 = var3472
		else
			error("Unsupported wire type: " .. var3456)
		end
	end
	return var3454
end

function t_126:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_126:jsonDecode()
	-- upvalues: t_126 (ref)
	local var3473 = t_126.new()
	
	if self.item_id ~= nil then
		var3473.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3473.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3473.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3473.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3473
end

t_126.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_126
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		selected_option = if p127 == nil or p127.selected_option == nil then "" else p127.selected_option,
		sort_id = if p127 == nil or p127.sort_id == nil then "" else p127.sort_id,
		options = if p127 == nil or p127.options == nil then {} else p127.options,
		experience_carousel = if p127 == nil or p127.experience_carousel == nil then nil else p127.experience_carousel,
		feed_item_key = if p127 == nil or p127.feed_item_key == nil then "" else p127.feed_item_key
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3473 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3474, var3475 = protoModule.writeTag(buff, var3473, 1, protoModule.wireTypes.lengthDelimited)
		var3474, var5079 = protoModule.writeString(var3474, var3475, self.selected_option)
		buff = var3474
		var3473 = var3475
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3476, var3477 = protoModule.writeTag(buff, var3473, 2, protoModule.wireTypes.lengthDelimited)
		var3476, var5081 = protoModule.writeString(var3476, var3477, self.sort_id)
		buff = var3476
		var3473 = var3477
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3478 = v:encode()
			local var3479, var3480 = protoModule.writeTag(buff, var3473, 3, protoModule.wireTypes.lengthDelimited)
			var3479, var5084 = protoModule.writeBuffer(var3479, var3480, var3478, buffer.len(var3478))
			buff = var3479
			var3473 = var3480
		end
	end
	if self.experience_carousel ~= nil then
		local var3481 = self.experience_carousel:encode()
		local var3482, var3483 = protoModule.writeTag(buff, var3473, 4, protoModule.wireTypes.lengthDelimited)
		var3482, var5087 = protoModule.writeBuffer(var3482, var3483, var3481, buffer.len(var3481))
		buff = var3482
		var3473 = var3483
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3484, var3485 = protoModule.writeTag(buff, var3473, 5, protoModule.wireTypes.lengthDelimited)
		var3484, var5089 = protoModule.writeString(var3484, var3485, self.feed_item_key)
		buff = var3484
		var3473 = var3485
	end
	local buff_1 = buffer.create(var3473)
	buffer.copy(buff_1, 0, buff, 0, var3473)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref)
	local var3486 = t_127.new()
	local var3487 = 0
	while var3487 < buffer.len(p127) do
		local _ = nil
		local var3488 = nil
		local var3489, var3490, var3491 = protoModule.readTag(p127, var3487)
		local var3492 = var3489
		var3488 = var3490
		var3487 = var3491
		
		if var3488 == protoModule.wireTypes.varint then
			local _ = nil
			local var3493, var3494 = protoModule.readVarInt(p127, var3487)
			local _ = var3493
			var3487 = var3494
			continue
		end
		if var3488 == protoModule.wireTypes.lengthDelimited then
			if var3492 == 1 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p127, var3487)
				var3487 = var3496
				var3486.selected_option = buffer.tostring(var3495)
			elseif var3492 == 2 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p127, var3487)
				var3487 = var3498
				var3486.sort_id = buffer.tostring(var3497)
			elseif var3492 == 3 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p127, var3487)
				var3487 = var3500
				table.insert(var3486.options, t.SelectorOption.decode(var3499))
			elseif var3492 == 4 then
				local _ = nil
				local var3501, var3502 = protoModule.readBuffer(p127, var3487)
				var3487 = var3502
				var3486.experience_carousel = t.ExperienceCarouselInputData.decode(var3501)
			elseif var3492 == 5 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p127, var3487)
				var3487 = var3504
				var3486.feed_item_key = buffer.tostring(var3503)
			else
				local _ = nil
				local var3505, var3506 = protoModule.readVarInt(p127, var3487)
				var3487 = var3506 + var3505
			end
		elseif var3488 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3507, var3508 = protoModule.readFixed32(p127, var3487)
			local _ = var3507
			var3487 = var3508
		elseif var3488 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3509, var3510 = protoModule.readFixed64(p127, var3487)
			local _ = var3509
			var3487 = var3510
		else
			error("Unsupported wire type: " .. var3488)
		end
	end
	return var3486
end

function t_127:jsonEncode()
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
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), t (ref)
	local var3511 = t_127.new()
	
	if self.selected_option ~= nil then
		var3511.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3511.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3511.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3511.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3511.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3511.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3511.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3511.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3511.feed_item_key = self.feedItemKey
	end
	return var3511
end

t_127.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_127
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		id = if p128 == nil or p128.id == nil then "" else p128.id,
		display_name = if p128 == nil or p128.display_name == nil then "" else p128.display_name,
		is_selected = if p128 == nil or p128.is_selected == nil then false else p128.is_selected
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3512 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3513, var3514 = protoModule.writeTag(buff, var3512, 1, protoModule.wireTypes.lengthDelimited)
		var3513, var5123 = protoModule.writeString(var3513, var3514, self.id)
		buff = var3513
		var3512 = var3514
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3515, var3516 = protoModule.writeTag(buff, var3512, 2, protoModule.wireTypes.lengthDelimited)
		var3515, var5125 = protoModule.writeString(var3515, var3516, self.display_name)
		buff = var3515
		var3512 = var3516
	end
	if self.is_selected then
		local var3517, var3518 = protoModule.writeTag(buff, var3512, 3, protoModule.wireTypes.varint)
		var3517, var5127 = protoModule.writeVarInt(var3517, var3518, if self.is_selected then 1 else 0)
		buff = var3517
		var3512 = var3518
	end
	local buff_1 = buffer.create(var3512)
	buffer.copy(buff_1, 0, buff, 0, var3512)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3512 = t_128.new()
	local var3513 = 0
	while var3513 < buffer.len(p128) do
		local _ = nil
		local var3514 = nil
		local var3515, var3516, var3517 = protoModule.readTag(p128, var3513)
		local var3518 = var3515
		var3514 = var3516
		var3513 = var3517
		
		if var3514 == protoModule.wireTypes.varint then
			if var3518 == 3 then
				local _ = nil
				local var3519, var3520 = protoModule.readVarInt(p128, var3513)
				var3513 = var3520
				var3512.is_selected = var3519 ~= 0
			else
				local _ = nil
				local var3521, var3522 = protoModule.readVarInt(p128, var3513)
				local _ = var3521
				var3513 = var3522
			end
		end
		if var3514 == protoModule.wireTypes.lengthDelimited then
			if var3518 == 1 then
				local _ = nil
				local var3523, var3524 = protoModule.readBuffer(p128, var3513)
				var3513 = var3524
				var3512.id = buffer.tostring(var3523)
			elseif var3518 == 2 then
				local _ = nil
				local var3525, var3526 = protoModule.readBuffer(p128, var3513)
				var3513 = var3526
				var3512.display_name = buffer.tostring(var3525)
			else
				local _ = nil
				local var3527, var3528 = protoModule.readVarInt(p128, var3513)
				var3513 = var3528 + var3527
			end
		elseif var3514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3529, var3530 = protoModule.readFixed32(p128, var3513)
			local _ = var3529
			var3513 = var3530
		elseif var3514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3531, var3532 = protoModule.readFixed64(p128, var3513)
			local _ = var3531
			var3513 = var3532
		else
			error("Unsupported wire type: " .. var3514)
		end
	end
	return var3512
end

function t_128:jsonEncode()
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

function t_128:jsonDecode()
	-- upvalues: t_128 (ref)
	local var3533 = t_128.new()
	
	if self.id ~= nil then
		var3533.id = self.id
	end
	if self.display_name ~= nil then
		var3533.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3533.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3533.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3533.is_selected = self.isSelected
	end
	return var3533
end

t_128.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_128
typeRegistryModule.default:register(t.SelectorOption)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		cards = if p129 == nil or p129.cards == nil then {} else p129.cards,
		title = if p129 == nil or p129.title == nil then "" else p129.title,
		sort_id = if p129 == nil or p129.sort_id == nil then nil else p129.sort_id
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3533 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3534 = v:encode()
			local var3535, var3536 = protoModule.writeTag(buff, var3533, 1, protoModule.wireTypes.lengthDelimited)
			var3535, var5156 = protoModule.writeBuffer(var3535, var3536, var3534, buffer.len(var3534))
			buff = var3535
			var3533 = var3536
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3537, var3538 = protoModule.writeTag(buff, var3533, 2, protoModule.wireTypes.lengthDelimited)
		var3537, var5158 = protoModule.writeString(var3537, var3538, self.title)
		buff = var3537
		var3533 = var3538
	end
	if self.sort_id ~= nil then
		local var3539, var3540 = protoModule.writeTag(buff, var3533, 3, protoModule.wireTypes.lengthDelimited)
		var3539, var5160 = protoModule.writeString(var3539, var3540, self.sort_id)
		buff = var3539
		var3533 = var3540
	end
	local buff_1 = buffer.create(var3533)
	buffer.copy(buff_1, 0, buff, 0, var3533)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3541 = t_129.new()
	local var3542 = 0
	while var3542 < buffer.len(p129) do
		local _ = nil
		local var3543 = nil
		local var3544, var3545, var3546 = protoModule.readTag(p129, var3542)
		local var3547 = var3544
		var3543 = var3545
		var3542 = var3546
		
		if var3543 == protoModule.wireTypes.varint then
			local _ = nil
			local var3548, var3549 = protoModule.readVarInt(p129, var3542)
			local _ = var3548
			var3542 = var3549
			continue
		end
		if var3543 == protoModule.wireTypes.lengthDelimited then
			if var3547 == 1 then
				local _ = nil
				local var3550, var3551 = protoModule.readBuffer(p129, var3542)
				var3542 = var3551
				table.insert(var3541.cards, t.GameItemsCardInputData.decode(var3550))
			elseif var3547 == 2 then
				local _ = nil
				local var3552, var3553 = protoModule.readBuffer(p129, var3542)
				var3542 = var3553
				var3541.title = buffer.tostring(var3552)
			elseif var3547 == 3 then
				local _ = nil
				local var3554, var3555 = protoModule.readBuffer(p129, var3542)
				var3542 = var3555
				var3541.sort_id = buffer.tostring(var3554)
			else
				local _ = nil
				local var3556, var3557 = protoModule.readVarInt(p129, var3542)
				var3542 = var3557 + var3556
			end
		elseif var3543 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3558, var3559 = protoModule.readFixed32(p129, var3542)
			local _ = var3558
			var3542 = var3559
		elseif var3543 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3560, var3561 = protoModule.readFixed64(p129, var3542)
			local _ = var3560
			var3542 = var3561
		else
			error("Unsupported wire type: " .. var3543)
		end
	end
	return var3541
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), t (ref)
	local var3562 = t_129.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3562.cards = t_1
	end
	if self.title ~= nil then
		var3562.title = self.title
	end
	if self.sort_id ~= nil then
		var3562.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3562.sort_id = self.sortId
	end
	return var3562
end

t_129.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_129
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id,
		items = if p130 == nil or p130.items == nil then {} else p130.items
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3563 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3564, var3565 = protoModule.writeTag(buff, var3563, 1, protoModule.wireTypes.lengthDelimited)
		var3564, var5190 = protoModule.writeString(var3564, var3565, self.universe_id)
		buff = var3564
		var3563 = var3565
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3566 = v:encode()
			local var3567, var3568 = protoModule.writeTag(buff, var3563, 2, protoModule.wireTypes.lengthDelimited)
			var3567, var5193 = protoModule.writeBuffer(var3567, var3568, var3566, buffer.len(var3566))
			buff = var3567
			var3563 = var3568
		end
	end
	local buff_1 = buffer.create(var3563)
	buffer.copy(buff_1, 0, buff, 0, var3563)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3569 = t_130.new()
	local var3570 = 0
	while var3570 < buffer.len(p130) do
		local _ = nil
		local var3571 = nil
		local var3572, var3573, var3574 = protoModule.readTag(p130, var3570)
		local var3575 = var3572
		var3571 = var3573
		var3570 = var3574
		
		if var3571 == protoModule.wireTypes.varint then
			local _ = nil
			local var3576, var3577 = protoModule.readVarInt(p130, var3570)
			local _ = var3576
			var3570 = var3577
			continue
		end
		if var3571 == protoModule.wireTypes.lengthDelimited then
			if var3575 == 1 then
				local _ = nil
				local var3578, var3579 = protoModule.readBuffer(p130, var3570)
				var3570 = var3579
				var3569.universe_id = buffer.tostring(var3578)
			elseif var3575 == 2 then
				local _ = nil
				local var3580, var3581 = protoModule.readBuffer(p130, var3570)
				var3570 = var3581
				table.insert(var3569.items, t.GameItemInputData.decode(var3580))
			else
				local _ = nil
				local var3582, var3583 = protoModule.readVarInt(p130, var3570)
				var3570 = var3583 + var3582
			end
		elseif var3571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3584, var3585 = protoModule.readFixed32(p130, var3570)
			local _ = var3584
			var3570 = var3585
		elseif var3571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3586, var3587 = protoModule.readFixed64(p130, var3570)
			local _ = var3586
			var3570 = var3587
		else
			error("Unsupported wire type: " .. var3571)
		end
	end
	return var3569
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var3588 = t_130.new()
	
	if self.universe_id ~= nil then
		var3588.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3588.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3588.items = t_1
	end
	return var3588
end

t_130.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_130
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		item_id = if p131 == nil or p131.item_id == nil then "" else p131.item_id,
		item_type = if p131 == nil or p131.item_type == nil then "" else p131.item_type
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3589 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3590, var3591 = protoModule.writeTag(buff, var3589, 1, protoModule.wireTypes.lengthDelimited)
		var3590, var5221 = protoModule.writeString(var3590, var3591, self.item_id)
		buff = var3590
		var3589 = var3591
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3592, var3593 = protoModule.writeTag(buff, var3589, 2, protoModule.wireTypes.lengthDelimited)
		var3592, var5223 = protoModule.writeString(var3592, var3593, self.item_type)
		buff = var3592
		var3589 = var3593
	end
	local buff_1 = buffer.create(var3589)
	buffer.copy(buff_1, 0, buff, 0, var3589)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3589 = t_131.new()
	local var3590 = 0
	while var3590 < buffer.len(p131) do
		local _ = nil
		local var3591 = nil
		local var3592, var3593, var3594 = protoModule.readTag(p131, var3590)
		local var3595 = var3592
		var3591 = var3593
		var3590 = var3594
		
		if var3591 == protoModule.wireTypes.varint then
			local _ = nil
			local var3596, var3597 = protoModule.readVarInt(p131, var3590)
			local _ = var3596
			var3590 = var3597
			continue
		end
		if var3591 == protoModule.wireTypes.lengthDelimited then
			if var3595 == 1 then
				local _ = nil
				local var3598, var3599 = protoModule.readBuffer(p131, var3590)
				var3590 = var3599
				var3589.item_id = buffer.tostring(var3598)
			elseif var3595 == 2 then
				local _ = nil
				local var3600, var3601 = protoModule.readBuffer(p131, var3590)
				var3590 = var3601
				var3589.item_type = buffer.tostring(var3600)
			else
				local _ = nil
				local var3602, var3603 = protoModule.readVarInt(p131, var3590)
				var3590 = var3603 + var3602
			end
		elseif var3591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3604, var3605 = protoModule.readFixed32(p131, var3590)
			local _ = var3604
			var3590 = var3605
		elseif var3591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3606, var3607 = protoModule.readFixed64(p131, var3590)
			local _ = var3606
			var3590 = var3607
		else
			error("Unsupported wire type: " .. var3591)
		end
	end
	return var3589
end

function t_131:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_131:jsonDecode()
	-- upvalues: t_131 (ref)
	local var3608 = t_131.new()
	
	if self.item_id ~= nil then
		var3608.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3608.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3608.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3608.item_type = self.itemType
	end
	return var3608
end

t_131.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_131
typeRegistryModule.default:register(t.GameItemInputData)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		clickout_url = if p132 == nil or p132.clickout_url == nil then "" else p132.clickout_url,
		native_ad_data = if p132 == nil or p132.native_ad_data == nil then "" else p132.native_ad_data,
		payer_name = if p132 == nil or p132.payer_name == nil then nil else p132.payer_name,
		logo_asset_id = if p132 == nil or p132.logo_asset_id == nil then nil else p132.logo_asset_id,
		logo_aspect_ratio = if p132 == nil or p132.logo_aspect_ratio == nil then nil else p132.logo_aspect_ratio,
		cta_text = if p132 == nil or p132.cta_text == nil then nil else p132.cta_text,
		title = if p132 == nil or p132.title == nil then nil else p132.title,
		subtitle = if p132 == nil or p132.subtitle == nil then nil else p132.subtitle,
		image_asset_id = if p132 == nil or p132.image_asset_id == nil then nil else p132.image_asset_id,
		video_asset_id = if p132 == nil or p132.video_asset_id == nil then nil else p132.video_asset_id,
		badge_text = if p132 == nil or p132.badge_text == nil then nil else p132.badge_text,
		badge_analytics_id = if p132 == nil or p132.badge_analytics_id == nil then nil else p132.badge_analytics_id,
		roblox_component = if p132 == nil or p132.roblox_component == nil then nil else p132.roblox_component,
		attribution_thumbnail_asset_id = if p132 == nil or p132.attribution_thumbnail_asset_id == nil then nil else p132.attribution_thumbnail_asset_id
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3608 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3609, var3610 = protoModule.writeTag(buff, var3608, 1, protoModule.wireTypes.lengthDelimited)
		var3609, var5249 = protoModule.writeString(var3609, var3610, self.clickout_url)
		buff = var3609
		var3608 = var3610
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3611, var3612 = protoModule.writeTag(buff, var3608, 2, protoModule.wireTypes.lengthDelimited)
		var3611, var5251 = protoModule.writeString(var3611, var3612, self.native_ad_data)
		buff = var3611
		var3608 = var3612
	end
	if self.payer_name ~= nil then
		local var3613, var3614 = protoModule.writeTag(buff, var3608, 3, protoModule.wireTypes.lengthDelimited)
		var3613, var5253 = protoModule.writeString(var3613, var3614, self.payer_name)
		buff = var3613
		var3608 = var3614
	end
	if self.logo_asset_id ~= nil then
		local var3615, var3616 = protoModule.writeTag(buff, var3608, 4, protoModule.wireTypes.lengthDelimited)
		var3615, var5255 = protoModule.writeString(var3615, var3616, self.logo_asset_id)
		buff = var3615
		var3608 = var3616
	end
	if self.logo_aspect_ratio ~= nil then
		local var3617, var3618 = protoModule.writeTag(buff, var3608, 5, protoModule.wireTypes.i64)
		var3617, var5257 = protoModule.writeDouble(var3617, var3618, self.logo_aspect_ratio)
		buff = var3617
		var3608 = var3618
	end
	if self.cta_text ~= nil then
		local var3619, var3620 = protoModule.writeTag(buff, var3608, 6, protoModule.wireTypes.lengthDelimited)
		var3619, var5259 = protoModule.writeString(var3619, var3620, self.cta_text)
		buff = var3619
		var3608 = var3620
	end
	if self.title ~= nil then
		local var3621, var3622 = protoModule.writeTag(buff, var3608, 7, protoModule.wireTypes.lengthDelimited)
		var3621, var5261 = protoModule.writeString(var3621, var3622, self.title)
		buff = var3621
		var3608 = var3622
	end
	if self.subtitle ~= nil then
		local var3623, var3624 = protoModule.writeTag(buff, var3608, 8, protoModule.wireTypes.lengthDelimited)
		var3623, var5263 = protoModule.writeString(var3623, var3624, self.subtitle)
		buff = var3623
		var3608 = var3624
	end
	if self.image_asset_id ~= nil then
		local var3625, var3626 = protoModule.writeTag(buff, var3608, 9, protoModule.wireTypes.lengthDelimited)
		var3625, var5265 = protoModule.writeString(var3625, var3626, self.image_asset_id)
		buff = var3625
		var3608 = var3626
	end
	if self.video_asset_id ~= nil then
		local var3627, var3628 = protoModule.writeTag(buff, var3608, 10, protoModule.wireTypes.lengthDelimited)
		var3627, var5267 = protoModule.writeString(var3627, var3628, self.video_asset_id)
		buff = var3627
		var3608 = var3628
	end
	if self.badge_text ~= nil then
		local var3629, var3630 = protoModule.writeTag(buff, var3608, 11, protoModule.wireTypes.lengthDelimited)
		var3629, var5269 = protoModule.writeString(var3629, var3630, self.badge_text)
		buff = var3629
		var3608 = var3630
	end
	if self.badge_analytics_id ~= nil then
		local var3631, var3632 = protoModule.writeTag(buff, var3608, 12, protoModule.wireTypes.lengthDelimited)
		var3631, var5271 = protoModule.writeString(var3631, var3632, self.badge_analytics_id)
		buff = var3631
		var3608 = var3632
	end
	if self.roblox_component ~= nil then
		local var3633, var3634 = protoModule.writeTag(buff, var3608, 13, protoModule.wireTypes.lengthDelimited)
		var3633, var5273 = protoModule.writeString(var3633, var3634, self.roblox_component)
		buff = var3633
		var3608 = var3634
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3635, var3636 = protoModule.writeTag(buff, var3608, 14, protoModule.wireTypes.lengthDelimited)
		var3635, var5275 = protoModule.writeString(var3635, var3636, self.attribution_thumbnail_asset_id)
		buff = var3635
		var3608 = var3636
	end
	local buff_1 = buffer.create(var3608)
	buffer.copy(buff_1, 0, buff, 0, var3608)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3608 = t_132.new()
	local var3609 = 0
	while var3609 < buffer.len(p132) do
		local _ = nil
		local var3610 = nil
		local var3611, var3612, var3613 = protoModule.readTag(p132, var3609)
		local var3614 = var3611
		var3610 = var3612
		var3609 = var3613
		
		if var3610 == protoModule.wireTypes.varint then
			local _ = nil
			local var3615, var3616 = protoModule.readVarInt(p132, var3609)
			local _ = var3615
			var3609 = var3616
			continue
		end
		if var3610 == protoModule.wireTypes.lengthDelimited then
			if var3614 == 1 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p132, var3609)
				var3609 = var3618
				var3608.clickout_url = buffer.tostring(var3617)
			elseif var3614 == 2 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p132, var3609)
				var3609 = var3620
				var3608.native_ad_data = buffer.tostring(var3619)
			elseif var3614 == 3 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p132, var3609)
				var3609 = var3622
				var3608.payer_name = buffer.tostring(var3621)
			elseif var3614 == 4 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p132, var3609)
				var3609 = var3624
				var3608.logo_asset_id = buffer.tostring(var3623)
			elseif var3614 == 6 then
				local _ = nil
				local var3625, var3626 = protoModule.readBuffer(p132, var3609)
				var3609 = var3626
				var3608.cta_text = buffer.tostring(var3625)
			elseif var3614 == 7 then
				local _ = nil
				local var3627, var3628 = protoModule.readBuffer(p132, var3609)
				var3609 = var3628
				var3608.title = buffer.tostring(var3627)
			elseif var3614 == 8 then
				local _ = nil
				local var3629, var3630 = protoModule.readBuffer(p132, var3609)
				var3609 = var3630
				var3608.subtitle = buffer.tostring(var3629)
			elseif var3614 == 9 then
				local _ = nil
				local var3631, var3632 = protoModule.readBuffer(p132, var3609)
				var3609 = var3632
				var3608.image_asset_id = buffer.tostring(var3631)
			elseif var3614 == 10 then
				local _ = nil
				local var3633, var3634 = protoModule.readBuffer(p132, var3609)
				var3609 = var3634
				var3608.video_asset_id = buffer.tostring(var3633)
			elseif var3614 == 11 then
				local _ = nil
				local var3635, var3636 = protoModule.readBuffer(p132, var3609)
				var3609 = var3636
				var3608.badge_text = buffer.tostring(var3635)
			elseif var3614 == 12 then
				local _ = nil
				local var3637, var3638 = protoModule.readBuffer(p132, var3609)
				var3609 = var3638
				var3608.badge_analytics_id = buffer.tostring(var3637)
			elseif var3614 == 13 then
				local _ = nil
				local var3639, var3640 = protoModule.readBuffer(p132, var3609)
				var3609 = var3640
				var3608.roblox_component = buffer.tostring(var3639)
			elseif var3614 == 14 then
				local _ = nil
				local var3641, var3642 = protoModule.readBuffer(p132, var3609)
				var3609 = var3642
				var3608.attribution_thumbnail_asset_id = buffer.tostring(var3641)
			else
				local _ = nil
				local var3643, var3644 = protoModule.readVarInt(p132, var3609)
				var3609 = var3644 + var3643
			end
		elseif var3610 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3645, var3646 = protoModule.readFixed32(p132, var3609)
			local _ = var3645
			var3609 = var3646
		elseif var3610 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var3610)
		elseif var3614 == 5 then
			local _ = nil
			local var3647, var3648 = protoModule.readDouble(p132, var3609)
			var3609 = var3648
			var3608.logo_aspect_ratio = var3647
		else
			local _ = nil
			local var3649, var3650 = protoModule.readFixed64(p132, var3609)
			local _ = var3649
			var3609 = var3650
		end
	end
	return var3608
end

function t_132:jsonEncode()
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

function t_132:jsonDecode()
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3651 = t_132.new()
	
	if self.clickout_url ~= nil then
		var3651.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3651.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3651.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3651.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3651.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3651.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3651.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3651.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3651.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3651.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3651.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3651.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3651.title = self.title
	end
	if self.subtitle ~= nil then
		var3651.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3651.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3651.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3651.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3651.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3651.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3651.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3651.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3651.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3651.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3651.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3651.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3651.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3651
end

t_132.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_132
typeRegistryModule.default:register(t.AdLinkItem)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		layout = if p133 == nil or p133.layout == nil then nil else p133.layout,
		kind = if p133 == nil or p133.kind == nil then nil else p133.kind
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3651 = 0
	
	if self.layout ~= nil then
		local var3652 = self.layout:encode()
		local var3653, var3654 = protoModule.writeTag(buff, var3651, 1, protoModule.wireTypes.lengthDelimited)
		var3653, var5326 = protoModule.writeBuffer(var3653, var3654, var3652, buffer.len(var3652))
		buff = var3653
		var3651 = var3654
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3655 = self.kind.value:encode()
			local var3656, var3657 = protoModule.writeTag(buff, var3651, 2, protoModule.wireTypes.lengthDelimited)
			var3656, var5329 = protoModule.writeBuffer(var3656, var3657, var3655, buffer.len(var3655))
			buff = var3656
			var3651 = var3657
		elseif self.kind.type == "ad_link" then
			local var3658 = self.kind.value:encode()
			local var3659, var3660 = protoModule.writeTag(buff, var3651, 3, protoModule.wireTypes.lengthDelimited)
			var3659, var5332 = protoModule.writeBuffer(var3659, var3660, var3658, buffer.len(var3658))
			buff = var3659
			var3651 = var3660
		end
	end
	local buff_1 = buffer.create(var3651)
	buffer.copy(buff_1, 0, buff, 0, var3651)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), t (ref)
	local var3651 = t_133.new()
	local var3652 = 0
	while var3652 < buffer.len(p133) do
		local _ = nil
		local var3653 = nil
		local var3654, var3655, var3656 = protoModule.readTag(p133, var3652)
		local var3657 = var3654
		var3653 = var3655
		var3652 = var3656
		
		if var3653 == protoModule.wireTypes.varint then
			local _ = nil
			local var3658, var3659 = protoModule.readVarInt(p133, var3652)
			local _ = var3658
			var3652 = var3659
			continue
		end
		if var3653 == protoModule.wireTypes.lengthDelimited then
			if var3657 == 1 then
				local _ = nil
				local var3660, var3661 = protoModule.readBuffer(p133, var3652)
				var3652 = var3661
				var3651.layout = t.ItemLayout.decode(var3660)
			elseif var3657 == 2 then
				local _ = nil
				local var3662, var3663 = protoModule.readBuffer(p133, var3652)
				var3652 = var3663
				var3651.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3662)
				}
			elseif var3657 == 3 then
				local _ = nil
				local var3664, var3665 = protoModule.readBuffer(p133, var3652)
				var3652 = var3665
				var3651.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3664) }
			else
				local _ = nil
				local var3666, var3667 = protoModule.readVarInt(p133, var3652)
				var3652 = var3667 + var3666
			end
		elseif var3653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3668, var3669 = protoModule.readFixed32(p133, var3652)
			local _ = var3668
			var3652 = var3669
		elseif var3653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3670, var3671 = protoModule.readFixed64(p133, var3652)
			local _ = var3670
			var3652 = var3671
		else
			error("Unsupported wire type: " .. var3653)
		end
	end
	return var3651
end

function t_133:jsonEncode()
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

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), t (ref)
	local var3672 = t_133.new()
	
	if self.layout ~= nil then
		var3672.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3672.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3672.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3672.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3672
end

t_133.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_133
typeRegistryModule.default:register(t.ItemWithLayout)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p134)
	-- upvalues: t_134 (ref)
	return setmetatable({
		items = if p134 == nil or p134.items == nil then {} else p134.items,
		collection_item_size = if p134 == nil or p134.collection_item_size == nil then nil else p134.collection_item_size
	}, t_134)
end

function t_134:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3672 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3673 = v:encode()
			local var3674, var3675 = protoModule.writeTag(buff, var3672, 1, protoModule.wireTypes.lengthDelimited)
			var3674, var5361 = protoModule.writeBuffer(var3674, var3675, var3673, buffer.len(var3673))
			buff = var3674
			var3672 = var3675
		end
	end
	if self.collection_item_size ~= nil then
		local var3676, var3677 = protoModule.writeTag(buff, var3672, 2, protoModule.wireTypes.lengthDelimited)
		var3676, var5363 = protoModule.writeString(var3676, var3677, self.collection_item_size)
		buff = var3676
		var3672 = var3677
	end
	local buff_1 = buffer.create(var3672)
	buffer.copy(buff_1, 0, buff, 0, var3672)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var3678 = t_134.new()
	local var3679 = 0
	while var3679 < buffer.len(p134) do
		local _ = nil
		local var3680 = nil
		local var3681, var3682, var3683 = protoModule.readTag(p134, var3679)
		local var3684 = var3681
		var3680 = var3682
		var3679 = var3683
		
		if var3680 == protoModule.wireTypes.varint then
			local _ = nil
			local var3685, var3686 = protoModule.readVarInt(p134, var3679)
			local _ = var3685
			var3679 = var3686
			continue
		end
		if var3680 == protoModule.wireTypes.lengthDelimited then
			if var3684 == 1 then
				local _ = nil
				local var3687, var3688 = protoModule.readBuffer(p134, var3679)
				var3679 = var3688
				table.insert(var3678.items, t.ItemWithLayout.decode(var3687))
			elseif var3684 == 2 then
				local _ = nil
				local var3689, var3690 = protoModule.readBuffer(p134, var3679)
				var3679 = var3690
				var3678.collection_item_size = buffer.tostring(var3689)
			else
				local _ = nil
				local var3691, var3692 = protoModule.readVarInt(p134, var3679)
				var3679 = var3692 + var3691
			end
		elseif var3680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3693, var3694 = protoModule.readFixed32(p134, var3679)
			local _ = var3693
			var3679 = var3694
		elseif var3680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3695, var3696 = protoModule.readFixed64(p134, var3679)
			local _ = var3695
			var3679 = var3696
		else
			error("Unsupported wire type: " .. var3680)
		end
	end
	return var3678
end

function t_134:jsonEncode()
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

function t_134:jsonDecode()
	-- upvalues: t_134 (ref), t (ref)
	local var3697 = t_134.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3697.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3697.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3697.collection_item_size = self.collectionItemSize
	end
	return var3697
end

t_134.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_134
typeRegistryModule.default:register(t.ContentPool)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		col_span = if p135 == nil or p135.col_span == nil then 0 else p135.col_span,
		row_span = if p135 == nil or p135.row_span == nil then 0 else p135.row_span,
		alignment_type = if p135 == nil or p135.alignment_type == nil then "" else p135.alignment_type,
		min_row_padding = if p135 == nil or p135.min_row_padding == nil then 0 else p135.min_row_padding
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3698 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3699, var3700 = protoModule.writeTag(buff, var3698, 1, protoModule.wireTypes.varint)
		var3699, var5391 = protoModule.writeVarInt(var3699, var3700, self.col_span)
		buff = var3699
		var3698 = var3700
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3701, var3702 = protoModule.writeTag(buff, var3698, 2, protoModule.wireTypes.varint)
		var3701, var5393 = protoModule.writeVarInt(var3701, var3702, self.row_span)
		buff = var3701
		var3698 = var3702
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3703, var3704 = protoModule.writeTag(buff, var3698, 3, protoModule.wireTypes.lengthDelimited)
		var3703, var5395 = protoModule.writeString(var3703, var3704, self.alignment_type)
		buff = var3703
		var3698 = var3704
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3705, var3706 = protoModule.writeTag(buff, var3698, 4, protoModule.wireTypes.varint)
		var3705, var5397 = protoModule.writeVarInt(var3705, var3706, self.min_row_padding)
		buff = var3705
		var3698 = var3706
	end
	local buff_1 = buffer.create(var3698)
	buffer.copy(buff_1, 0, buff, 0, var3698)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref)
	local var3698 = t_135.new()
	local var3699 = 0
	while var3699 < buffer.len(p135) do
		local _ = nil
		local var3700 = nil
		local var3701, var3702, var3703 = protoModule.readTag(p135, var3699)
		local var3704 = var3701
		var3700 = var3702
		var3699 = var3703
		
		if var3700 == protoModule.wireTypes.varint then
			if var3704 == 1 then
				local _ = nil
				local var3705, var3706 = protoModule.readVarIntI32(p135, var3699)
				var3699 = var3706
				var3698.col_span = var3705
			elseif var3704 == 2 then
				local _ = nil
				local var3707, var3708 = protoModule.readVarIntI32(p135, var3699)
				var3699 = var3708
				var3698.row_span = var3707
			elseif var3704 == 4 then
				local _ = nil
				local var3709, var3710 = protoModule.readVarIntI32(p135, var3699)
				var3699 = var3710
				var3698.min_row_padding = var3709
			else
				local _ = nil
				local var3711, var3712 = protoModule.readVarInt(p135, var3699)
				local _ = var3711
				var3699 = var3712
			end
		end
		if var3700 == protoModule.wireTypes.lengthDelimited then
			if var3704 == 3 then
				local _ = nil
				local var3713, var3714 = protoModule.readBuffer(p135, var3699)
				var3699 = var3714
				var3698.alignment_type = buffer.tostring(var3713)
			else
				local _ = nil
				local var3715, var3716 = protoModule.readVarInt(p135, var3699)
				var3699 = var3716 + var3715
			end
		elseif var3700 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3717, var3718 = protoModule.readFixed32(p135, var3699)
			local _ = var3717
			var3699 = var3718
		elseif var3700 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3719, var3720 = protoModule.readFixed64(p135, var3699)
			local _ = var3719
			var3699 = var3720
		else
			error("Unsupported wire type: " .. var3700)
		end
	end
	return var3698
end

function t_135:jsonEncode()
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

function t_135:jsonDecode()
	-- upvalues: t_135 (ref)
	local var3721 = t_135.new()
	
	if self.col_span ~= nil then
		var3721.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3721.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3721.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3721.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3721.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3721.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3721.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3721.min_row_padding = self.minRowPadding
	end
	return var3721
end

t_135.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_135
typeRegistryModule.default:register(t.ItemLayout)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p136)
	-- upvalues: t_136 (ref)
	return setmetatable({
		community_id = if p136 == nil or p136.community_id == nil then "" else p136.community_id,
		announcement_id = if p136 == nil or p136.announcement_id == nil then "" else p136.announcement_id,
		message_id = if p136 == nil or p136.message_id == nil then "" else p136.message_id,
		title = if p136 == nil or p136.title == nil then "" else p136.title,
		body = if p136 == nil or p136.body == nil then "" else p136.body,
		creator_key = if p136 == nil or p136.creator_key == nil then "" else p136.creator_key,
		creator_role_name = if p136 == nil or p136.creator_role_name == nil then nil else p136.creator_role_name,
		media_asset_id = if p136 == nil or p136.media_asset_id == nil then nil else p136.media_asset_id,
		created_time = if p136 == nil or p136.created_time == nil then nil else p136.created_time
	}, t_136)
end

function t_136:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3721 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3722, var3723 = protoModule.writeTag(buff, var3721, 1, protoModule.wireTypes.lengthDelimited)
		var3722, var5427 = protoModule.writeString(var3722, var3723, self.community_id)
		buff = var3722
		var3721 = var3723
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3724, var3725 = protoModule.writeTag(buff, var3721, 2, protoModule.wireTypes.lengthDelimited)
		var3724, var5429 = protoModule.writeString(var3724, var3725, self.announcement_id)
		buff = var3724
		var3721 = var3725
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3726, var3727 = protoModule.writeTag(buff, var3721, 3, protoModule.wireTypes.lengthDelimited)
		var3726, var5431 = protoModule.writeString(var3726, var3727, self.message_id)
		buff = var3726
		var3721 = var3727
	end
	if self.title ~= nil and self.title ~= "" then
		local var3728, var3729 = protoModule.writeTag(buff, var3721, 4, protoModule.wireTypes.lengthDelimited)
		var3728, var5433 = protoModule.writeString(var3728, var3729, self.title)
		buff = var3728
		var3721 = var3729
	end
	if self.body ~= nil and self.body ~= "" then
		local var3730, var3731 = protoModule.writeTag(buff, var3721, 5, protoModule.wireTypes.lengthDelimited)
		var3730, var5435 = protoModule.writeString(var3730, var3731, self.body)
		buff = var3730
		var3721 = var3731
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3732, var3733 = protoModule.writeTag(buff, var3721, 6, protoModule.wireTypes.lengthDelimited)
		var3732, var5437 = protoModule.writeString(var3732, var3733, self.creator_key)
		buff = var3732
		var3721 = var3733
	end
	if self.creator_role_name ~= nil then
		local var3734, var3735 = protoModule.writeTag(buff, var3721, 7, protoModule.wireTypes.lengthDelimited)
		var3734, var5439 = protoModule.writeString(var3734, var3735, self.creator_role_name)
		buff = var3734
		var3721 = var3735
	end
	if self.media_asset_id ~= nil then
		local var3736, var3737 = protoModule.writeTag(buff, var3721, 8, protoModule.wireTypes.lengthDelimited)
		var3736, var5441 = protoModule.writeString(var3736, var3737, self.media_asset_id)
		buff = var3736
		var3721 = var3737
	end
	if self.created_time ~= nil then
		local var3738 = self.created_time:encode()
		local var3739, var3740 = protoModule.writeTag(buff, var3721, 9, protoModule.wireTypes.lengthDelimited)
		var3739, var5444 = protoModule.writeBuffer(var3739, var3740, var3738, buffer.len(var3738))
		buff = var3739
		var3721 = var3740
	end
	local buff_1 = buffer.create(var3721)
	buffer.copy(buff_1, 0, buff, 0, var3721)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), timestampModule (ref)
	local var3721 = t_136.new()
	local var3722 = 0
	while var3722 < buffer.len(p136) do
		local _ = nil
		local var3723 = nil
		local var3724, var3725, var3726 = protoModule.readTag(p136, var3722)
		local var3727 = var3724
		var3723 = var3725
		var3722 = var3726
		
		if var3723 == protoModule.wireTypes.varint then
			local _ = nil
			local var3728, var3729 = protoModule.readVarInt(p136, var3722)
			local _ = var3728
			var3722 = var3729
			continue
		end
		if var3723 == protoModule.wireTypes.lengthDelimited then
			if var3727 == 1 then
				local _ = nil
				local var3730, var3731 = protoModule.readBuffer(p136, var3722)
				var3722 = var3731
				var3721.community_id = buffer.tostring(var3730)
			elseif var3727 == 2 then
				local _ = nil
				local var3732, var3733 = protoModule.readBuffer(p136, var3722)
				var3722 = var3733
				var3721.announcement_id = buffer.tostring(var3732)
			elseif var3727 == 3 then
				local _ = nil
				local var3734, var3735 = protoModule.readBuffer(p136, var3722)
				var3722 = var3735
				var3721.message_id = buffer.tostring(var3734)
			elseif var3727 == 4 then
				local _ = nil
				local var3736, var3737 = protoModule.readBuffer(p136, var3722)
				var3722 = var3737
				var3721.title = buffer.tostring(var3736)
			elseif var3727 == 5 then
				local _ = nil
				local var3738, var3739 = protoModule.readBuffer(p136, var3722)
				var3722 = var3739
				var3721.body = buffer.tostring(var3738)
			elseif var3727 == 6 then
				local _ = nil
				local var3740, var3741 = protoModule.readBuffer(p136, var3722)
				var3722 = var3741
				var3721.creator_key = buffer.tostring(var3740)
			elseif var3727 == 7 then
				local _ = nil
				local var3742, var3743 = protoModule.readBuffer(p136, var3722)
				var3722 = var3743
				var3721.creator_role_name = buffer.tostring(var3742)
			elseif var3727 == 8 then
				local _ = nil
				local var3744, var3745 = protoModule.readBuffer(p136, var3722)
				var3722 = var3745
				var3721.media_asset_id = buffer.tostring(var3744)
			elseif var3727 == 9 then
				local _ = nil
				local var3746, var3747 = protoModule.readBuffer(p136, var3722)
				var3722 = var3747
				var3721.created_time = timestampModule.Timestamp.decode(var3746)
			else
				local _ = nil
				local var3748, var3749 = protoModule.readVarInt(p136, var3722)
				var3722 = var3749 + var3748
			end
		elseif var3723 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3750, var3751 = protoModule.readFixed32(p136, var3722)
			local _ = var3750
			var3722 = var3751
		elseif var3723 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3752, var3753 = protoModule.readFixed64(p136, var3722)
			local _ = var3752
			var3722 = var3753
		else
			error("Unsupported wire type: " .. var3723)
		end
	end
	return var3721
end

function t_136:jsonEncode()
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

function t_136:jsonDecode()
	-- upvalues: t_136 (ref), timestampModule (ref)
	local var3754 = t_136.new()
	
	if self.community_id ~= nil then
		var3754.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3754.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3754.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3754.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3754.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3754.message_id = self.messageId
	end
	if self.title ~= nil then
		var3754.title = self.title
	end
	if self.body ~= nil then
		var3754.body = self.body
	end
	if self.creator_key ~= nil then
		var3754.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3754.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3754.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3754.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3754.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3754.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3754.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3754.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3754
end

t_136.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_136
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		group_id = if p137 == nil or p137.group_id == nil then "" else p137.group_id,
		announcement_id = if p137 == nil or p137.announcement_id == nil then "" else p137.announcement_id,
		message_id = if p137 == nil or p137.message_id == nil then "" else p137.message_id,
		title = if p137 == nil or p137.title == nil then "" else p137.title,
		body = if p137 == nil or p137.body == nil then "" else p137.body,
		creator_key = if p137 == nil or p137.creator_key == nil then "" else p137.creator_key,
		creator_role_name = if p137 == nil or p137.creator_role_name == nil then nil else p137.creator_role_name,
		media_asset_id = if p137 == nil or p137.media_asset_id == nil then nil else p137.media_asset_id,
		created_time = if p137 == nil or p137.created_time == nil then nil else p137.created_time
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3754 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var3755, var3756 = protoModule.writeTag(buff, var3754, 1, protoModule.wireTypes.lengthDelimited)
		var3755, var5484 = protoModule.writeString(var3755, var3756, self.group_id)
		buff = var3755
		var3754 = var3756
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3757, var3758 = protoModule.writeTag(buff, var3754, 2, protoModule.wireTypes.lengthDelimited)
		var3757, var5486 = protoModule.writeString(var3757, var3758, self.announcement_id)
		buff = var3757
		var3754 = var3758
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3759, var3760 = protoModule.writeTag(buff, var3754, 3, protoModule.wireTypes.lengthDelimited)
		var3759, var5488 = protoModule.writeString(var3759, var3760, self.message_id)
		buff = var3759
		var3754 = var3760
	end
	if self.title ~= nil and self.title ~= "" then
		local var3761, var3762 = protoModule.writeTag(buff, var3754, 4, protoModule.wireTypes.lengthDelimited)
		var3761, var5490 = protoModule.writeString(var3761, var3762, self.title)
		buff = var3761
		var3754 = var3762
	end
	if self.body ~= nil and self.body ~= "" then
		local var3763, var3764 = protoModule.writeTag(buff, var3754, 5, protoModule.wireTypes.lengthDelimited)
		var3763, var5492 = protoModule.writeString(var3763, var3764, self.body)
		buff = var3763
		var3754 = var3764
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3765, var3766 = protoModule.writeTag(buff, var3754, 6, protoModule.wireTypes.lengthDelimited)
		var3765, var5494 = protoModule.writeString(var3765, var3766, self.creator_key)
		buff = var3765
		var3754 = var3766
	end
	if self.creator_role_name ~= nil then
		local var3767, var3768 = protoModule.writeTag(buff, var3754, 7, protoModule.wireTypes.lengthDelimited)
		var3767, var5496 = protoModule.writeString(var3767, var3768, self.creator_role_name)
		buff = var3767
		var3754 = var3768
	end
	if self.media_asset_id ~= nil then
		local var3769, var3770 = protoModule.writeTag(buff, var3754, 8, protoModule.wireTypes.lengthDelimited)
		var3769, var5498 = protoModule.writeString(var3769, var3770, self.media_asset_id)
		buff = var3769
		var3754 = var3770
	end
	if self.created_time ~= nil then
		local var3771 = self.created_time:encode()
		local var3772, var3773 = protoModule.writeTag(buff, var3754, 9, protoModule.wireTypes.lengthDelimited)
		var3772, var5501 = protoModule.writeBuffer(var3772, var3773, var3771, buffer.len(var3771))
		buff = var3772
		var3754 = var3773
	end
	local buff_1 = buffer.create(var3754)
	buffer.copy(buff_1, 0, buff, 0, var3754)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), timestampModule (ref)
	local var3754 = t_137.new()
	local var3755 = 0
	while var3755 < buffer.len(p137) do
		local _ = nil
		local var3756 = nil
		local var3757, var3758, var3759 = protoModule.readTag(p137, var3755)
		local var3760 = var3757
		var3756 = var3758
		var3755 = var3759
		
		if var3756 == protoModule.wireTypes.varint then
			local _ = nil
			local var3761, var3762 = protoModule.readVarInt(p137, var3755)
			local _ = var3761
			var3755 = var3762
			continue
		end
		if var3756 == protoModule.wireTypes.lengthDelimited then
			if var3760 == 1 then
				local _ = nil
				local var3763, var3764 = protoModule.readBuffer(p137, var3755)
				var3755 = var3764
				var3754.group_id = buffer.tostring(var3763)
			elseif var3760 == 2 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p137, var3755)
				var3755 = var3766
				var3754.announcement_id = buffer.tostring(var3765)
			elseif var3760 == 3 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p137, var3755)
				var3755 = var3768
				var3754.message_id = buffer.tostring(var3767)
			elseif var3760 == 4 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p137, var3755)
				var3755 = var3770
				var3754.title = buffer.tostring(var3769)
			elseif var3760 == 5 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p137, var3755)
				var3755 = var3772
				var3754.body = buffer.tostring(var3771)
			elseif var3760 == 6 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p137, var3755)
				var3755 = var3774
				var3754.creator_key = buffer.tostring(var3773)
			elseif var3760 == 7 then
				local _ = nil
				local var3775, var3776 = protoModule.readBuffer(p137, var3755)
				var3755 = var3776
				var3754.creator_role_name = buffer.tostring(var3775)
			elseif var3760 == 8 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p137, var3755)
				var3755 = var3778
				var3754.media_asset_id = buffer.tostring(var3777)
			elseif var3760 == 9 then
				local _ = nil
				local var3779, var3780 = protoModule.readBuffer(p137, var3755)
				var3755 = var3780
				var3754.created_time = timestampModule.Timestamp.decode(var3779)
			else
				local _ = nil
				local var3781, var3782 = protoModule.readVarInt(p137, var3755)
				var3755 = var3782 + var3781
			end
		elseif var3756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3783, var3784 = protoModule.readFixed32(p137, var3755)
			local _ = var3783
			var3755 = var3784
		elseif var3756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3785, var3786 = protoModule.readFixed64(p137, var3755)
			local _ = var3785
			var3755 = var3786
		else
			error("Unsupported wire type: " .. var3756)
		end
	end
	return var3754
end

function t_137:jsonEncode()
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

function t_137:jsonDecode()
	-- upvalues: t_137 (ref), timestampModule (ref)
	local var3787 = t_137.new()
	
	if self.group_id ~= nil then
		var3787.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var3787.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		var3787.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3787.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3787.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3787.message_id = self.messageId
	end
	if self.title ~= nil then
		var3787.title = self.title
	end
	if self.body ~= nil then
		var3787.body = self.body
	end
	if self.creator_key ~= nil then
		var3787.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3787.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3787.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3787.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3787.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3787.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3787.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3787.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3787
end

t_137.descriptor = {
	name = "GroupAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GroupAnnouncementInputData"
}
t.GroupAnnouncementInputData = t_137
typeRegistryModule.default:register(t.GroupAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p138)
		return if p138 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p138 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p138)
		return if p138 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p138 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p138
	end,
	fromName = function(p138)
		return if p138 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p138 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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