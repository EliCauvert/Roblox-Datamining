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
			error("Unsupported wire type: " .. var155)
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
			error("Unsupported wire type: " .. var184)
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
			error("Unsupported wire type: " .. var216)
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
			error("Unsupported wire type: " .. var250)
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
			error("Unsupported wire type: " .. var501)
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
			error("Unsupported wire type: " .. var682)
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
			error("Unsupported wire type: " .. var716)
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
			error("Unsupported wire type: " .. var747)
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
			error("Unsupported wire type: " .. var784)
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
			error("Unsupported wire type: " .. var824)
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
			error("Unsupported wire type: " .. var862)
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
			error("Unsupported wire type: " .. var890)
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
			error("Unsupported wire type: " .. var916)
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
			error("Unsupported wire type: " .. var952)
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
			error("Unsupported wire type: " .. var996)
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
			error("Unsupported wire type: " .. var1025)
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
			error("Unsupported wire type: " .. var1051)
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
			error("Unsupported wire type: " .. var1079)
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
			error("Unsupported wire type: " .. var1105)
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
			error("Unsupported wire type: " .. var1129)
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
			error("Unsupported wire type: " .. var1155)
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
			error("Unsupported wire type: " .. var1194)
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
			error("Unsupported wire type: " .. var1233)
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
			error("Unsupported wire type: " .. var1262)
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
			error("Unsupported wire type: " .. var1293)
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
			error("Unsupported wire type: " .. var1317)
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
			error("Unsupported wire type: " .. var1341)
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
			error("Unsupported wire type: " .. var1373)
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
			error("Unsupported wire type: " .. var1405)
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
			error("Unsupported wire type: " .. var1431)
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
			error("Unsupported wire type: " .. var1467)
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
			error("Unsupported wire type: " .. var1501)
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
			error("Unsupported wire type: " .. var1526)
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
			error("Unsupported wire type: " .. var1553)
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
		enable_game_tile_videos = if p35 == nil or p35.enable_game_tile_videos == nil then false else p35.enable_game_tile_videos
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
	local buff_1 = buffer.create(var893)
	buffer.copy(buff_1, 0, buff, 0, var893)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var939 = t_35.new()
	local var940 = 0
	while var940 < buffer.len(p35) do
		local _ = nil
		local var941 = nil
		local var942, var943, var944 = protoModule.readTag(p35, var940)
		local var945 = var942
		var941 = var943
		var940 = var944
		
		if var941 == protoModule.wireTypes.varint then
			if var945 == 5 then
				local _ = nil
				local var946, var947 = protoModule.readVarIntI32(p35, var940)
				var940 = var947
				var939.secondary_sort_id = var946
			elseif var945 == 6 then
				local _ = nil
				local var948, var949 = protoModule.readVarIntI32(p35, var940)
				var940 = var949
				var939.max_visible_rows = var948
			elseif var945 == 10 then
				local _ = nil
				local var950, var951 = protoModule.readVarInt(p35, var940)
				var940 = var951
				var939.is_placeholder = var950 ~= 0
			elseif var945 == 11 then
				local _ = nil
				local var952, var953 = protoModule.readVarIntI32(p35, var940)
				var940 = var953
				var939.primary_sort_id = var952
			elseif var945 == 14 then
				local _ = nil
				local var954, var955 = protoModule.readVarInt(p35, var940)
				var940 = var955
				var939.has_emphasized_tile = var954 ~= 0
			elseif var945 == 16 then
				local _ = nil
				local var956, var957 = protoModule.readVarIntI32(p35, var940)
				var940 = var957
				var939.initial_feed_visible_rows = var956
			elseif var945 == 17 then
				local _ = nil
				local var958, var959 = protoModule.readVarIntI32(p35, var940)
				var940 = var959
				var939.visible_rows_per_reveal = var958
			elseif var945 == 22 then
				local _ = nil
				local var960, var961 = protoModule.readVarInt(p35, var940)
				var940 = var961
				var939.enable_game_tile_videos = var960 ~= 0
			else
				local _ = nil
				local var962, var963 = protoModule.readVarInt(p35, var940)
				local _ = var962
				var940 = var963
			end
		end
		if var941 == protoModule.wireTypes.lengthDelimited then
			if var945 == 1 then
				local _ = nil
				local var964, var965 = protoModule.readBuffer(p35, var940)
				var940 = var965
				var939.title = buffer.tostring(var964)
			elseif var945 == 2 then
				local _ = nil
				local var966, var967 = protoModule.readBuffer(p35, var940)
				var940 = var967
				table.insert(var939.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var966))
			elseif var945 == 3 then
				local _ = nil
				local var968, var969 = protoModule.readBuffer(p35, var940)
				var940 = var969
				var939.next_page_token = buffer.tostring(var968)
			elseif var945 == 4 then
				local _ = nil
				local var970, var971 = protoModule.readBuffer(p35, var940)
				var940 = var971
				var939.sort_id = buffer.tostring(var970)
			elseif var945 == 7 then
				local _ = nil
				local var972, var973 = protoModule.readBuffer(p35, var940)
				var940 = var973
				var939.subtitle = buffer.tostring(var972)
			elseif var945 == 8 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p35, var940)
				var940 = var975
				var939.info_text = buffer.tostring(var974)
			elseif var945 == 9 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p35, var940)
				var940 = var977
				var939.subtitle_link_path = buffer.tostring(var976)
			elseif var945 == 12 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p35, var940)
				var940 = var979
				var939.applied_filters = buffer.tostring(var978)
			elseif var945 == 13 then
				local _ = nil
				local var980, var981 = protoModule.readBuffer(p35, var940)
				var940 = var981
				var939.pool_id = buffer.tostring(var980)
			elseif var945 == 15 then
				local _ = nil
				local var982, var983 = protoModule.readBuffer(p35, var940)
				var940 = var983
				var939.tile_activation_mode = buffer.tostring(var982)
			elseif var945 == 18 then
				local _ = nil
				local var984, var985 = protoModule.readBuffer(p35, var940)
				var940 = var985
				var939.sponsored_user_cohort = buffer.tostring(var984)
			elseif var945 == 19 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p35, var940)
				var940 = var987
				var939.anchor_tag = buffer.tostring(var986)
			elseif var945 == 20 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p35, var940)
				var940 = var989
				var939.collection_item_size = buffer.tostring(var988)
			elseif var945 == 21 then
				local _ = nil
				local var990, var991 = protoModule.readBuffer(p35, var940)
				var940 = var991
				var939.sort_sub_id = buffer.tostring(var990)
			else
				local _ = nil
				local var992, var993 = protoModule.readVarInt(p35, var940)
				var940 = var993 + var992
			end
		elseif var941 == protoModule.wireTypes.i32 then
			local _ = nil
			local var994, var995 = protoModule.readFixed32(p35, var940)
			local _ = var994
			var940 = var995
		elseif var941 == protoModule.wireTypes.i64 then
			local _ = nil
			local var996, var997 = protoModule.readFixed64(p35, var940)
			local _ = var996
			var940 = var997
		else
			error("Unsupported wire type: " .. var1620)
		end
	end
	return var939
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
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var998 = t_35.new()
	
	if self.title ~= nil then
		var998.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var998.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var998.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var998.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var998.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var998.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var998.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var998.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var998.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var998.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var998.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var998.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var998.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var998.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var998.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var998.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var998.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var998.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var998.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var998.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var998.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var998.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var998.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var998.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var998.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var998.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var998.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var998.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var998.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var998.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var998.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var998.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var998.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var998.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var998.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var998.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var998.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var998.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var998.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var998.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var998.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var998.enable_game_tile_videos = self.enableGameTileVideos
	end
	return var998
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
	local var999 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1000, var1001 = protoModule.writeTag(buff, var999, 1, protoModule.wireTypes.lengthDelimited)
		var1000, var1685 = protoModule.writeString(var1000, var1001, self.universe_id)
		buff = var1000
		var999 = var1001
	end
	if self.is_sponsored then
		local var1002, var1003 = protoModule.writeTag(buff, var999, 2, protoModule.wireTypes.varint)
		var1002, var1687 = protoModule.writeVarInt(var1002, var1003, if self.is_sponsored then 1 else 0)
		buff = var1002
		var999 = var1003
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1004, var1005 = protoModule.writeTag(buff, var999, 3, protoModule.wireTypes.lengthDelimited)
		var1004, var1689 = protoModule.writeString(var1004, var1005, self.roblox_component)
		buff = var1004
		var999 = var1005
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1006, var1007 = protoModule.writeTag(buff, var999, 4, protoModule.wireTypes.lengthDelimited)
		var1006, var1691 = protoModule.writeString(var1006, var1007, self.native_ad_data)
		buff = var1006
		var999 = var1007
	end
	if self.is_content_locked then
		local var1008, var1009 = protoModule.writeTag(buff, var999, 5, protoModule.wireTypes.varint)
		var1008, var1693 = protoModule.writeVarInt(var1008, var1009, if self.is_content_locked then 1 else 0)
		buff = var1008
		var999 = var1009
	end
	if self.title ~= nil and self.title ~= "" then
		local var1010, var1011 = protoModule.writeTag(buff, var999, 6, protoModule.wireTypes.lengthDelimited)
		var1010, var1695 = protoModule.writeString(var1010, var1011, self.title)
		buff = var1010
		var999 = var1011
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1012, var1013 = protoModule.writeTag(buff, var999, 7, protoModule.wireTypes.lengthDelimited)
		var1012, var1697 = protoModule.writeString(var1012, var1013, self.subtitle)
		buff = var1012
		var999 = var1013
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1014, var1015 = protoModule.writeTag(buff, var999, 8, protoModule.wireTypes.lengthDelimited)
		var1014, var1699 = protoModule.writeString(var1014, var1015, self.image_asset_id)
		buff = var1014
		var999 = var1015
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1016, var1017 = protoModule.writeTag(buff, var999, 9, protoModule.wireTypes.lengthDelimited)
		var1016, var1701 = protoModule.writeString(var1016, var1017, self.video_asset_id)
		buff = var1016
		var999 = var1017
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1018, var1019 = protoModule.writeTag(buff, var999, 10, protoModule.wireTypes.lengthDelimited)
		var1018, var1703 = protoModule.writeString(var1018, var1019, self.badge_text)
		buff = var1018
		var999 = var1019
	end
	if self.player_count ~= nil then
		local var1020, var1021 = protoModule.writeTag(buff, var999, 11, protoModule.wireTypes.varint)
		var1020, var1705 = protoModule.writeVarInt(var1020, var1021, self.player_count)
		buff = var1020
		var999 = var1021
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1022, var1023 = protoModule.writeTag(buff, var999, 12, protoModule.wireTypes.lengthDelimited)
		var1022, var1707 = protoModule.writeString(var1022, var1023, self.creator_key)
		buff = var1022
		var999 = var1023
	end
	if self.rank ~= nil then
		local var1024, var1025 = protoModule.writeTag(buff, var999, 13, protoModule.wireTypes.varint)
		var1024, var1709 = protoModule.writeVarInt(var1024, var1025, self.rank)
		buff = var1024
		var999 = var1025
	end
	if self.payer_name ~= nil then
		local var1026, var1027 = protoModule.writeTag(buff, var999, 14, protoModule.wireTypes.lengthDelimited)
		var1026, var1711 = protoModule.writeString(var1026, var1027, self.payer_name)
		buff = var1026
		var999 = var1027
	end
	if self.logo_asset_id ~= nil then
		local var1028, var1029 = protoModule.writeTag(buff, var999, 15, protoModule.wireTypes.lengthDelimited)
		var1028, var1713 = protoModule.writeString(var1028, var1029, self.logo_asset_id)
		buff = var1028
		var999 = var1029
	end
	if self.logo_aspect_ratio ~= nil then
		local var1030, var1031 = protoModule.writeTag(buff, var999, 16, protoModule.wireTypes.i64)
		var1030, var1715 = protoModule.writeDouble(var1030, var1031, self.logo_aspect_ratio)
		buff = var1030
		var999 = var1031
	end
	if self.place_id ~= nil then
		local var1032, var1033 = protoModule.writeTag(buff, var999, 17, protoModule.wireTypes.lengthDelimited)
		var1032, var1717 = protoModule.writeString(var1032, var1033, self.place_id)
		buff = var1032
		var999 = var1033
	end
	if self.launch_data ~= nil then
		local var1034, var1035 = protoModule.writeTag(buff, var999, 18, protoModule.wireTypes.lengthDelimited)
		var1034, var1719 = protoModule.writeString(var1034, var1035, self.launch_data)
		buff = var1034
		var999 = var1035
	end
	if self.tile_variant ~= nil then
		local var1036, var1037 = protoModule.writeTag(buff, var999, 19, protoModule.wireTypes.lengthDelimited)
		var1036, var1721 = protoModule.writeString(var1036, var1037, self.tile_variant)
		buff = var1036
		var999 = var1037
	end
	if self.cta_text ~= nil then
		local var1038, var1039 = protoModule.writeTag(buff, var999, 20, protoModule.wireTypes.lengthDelimited)
		var1038, var1723 = protoModule.writeString(var1038, var1039, self.cta_text)
		buff = var1038
		var999 = var1039
	end
	if self.badge_analytics_id ~= nil then
		local var1040, var1041 = protoModule.writeTag(buff, var999, 21, protoModule.wireTypes.lengthDelimited)
		var1040, var1725 = protoModule.writeString(var1040, var1041, self.badge_analytics_id)
		buff = var1040
		var999 = var1041
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1042 = v:encode()
			local var1043, var1044 = protoModule.writeTag(buff, var999, 22, protoModule.wireTypes.lengthDelimited)
			var1043, var1728 = protoModule.writeBuffer(var1043, var1044, var1042, buffer.len(var1042))
			buff = var1043
			var999 = var1044
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1045, var1046 = protoModule.writeTag(buff, var999, 23, protoModule.wireTypes.lengthDelimited)
		var1045, var1730 = protoModule.writeString(var1045, var1046, self.attribution_thumbnail_asset_id)
		buff = var1045
		var999 = var1046
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1047 = v:encode()
			local var1048, var1049 = protoModule.writeTag(buff, var999, 24, protoModule.wireTypes.lengthDelimited)
			var1048, var1733 = protoModule.writeBuffer(var1048, var1049, var1047, buffer.len(var1047))
			buff = var1048
			var999 = var1049
		end
	end
	if self.source_sort_id ~= nil then
		local var1050, var1051 = protoModule.writeTag(buff, var999, 25, protoModule.wireTypes.lengthDelimited)
		var1050, var1735 = protoModule.writeString(var1050, var1051, self.source_sort_id)
		buff = var1050
		var999 = var1051
	end
	if self.new_game_enum ~= nil then
		local var1052, var1053 = protoModule.writeTag(buff, var999, 26, protoModule.wireTypes.varint)
		var1052, var1737 = protoModule.writeVarInt(var1052, var1053, self.new_game_enum)
		buff = var1052
		var999 = var1053
	end
	if self.moment_video_playback ~= nil then
		local var1054 = self.moment_video_playback:encode()
		local var1055, var1056 = protoModule.writeTag(buff, var999, 27, protoModule.wireTypes.lengthDelimited)
		var1055, var1740 = protoModule.writeBuffer(var1055, var1056, var1054, buffer.len(var1054))
		buff = var1055
		var999 = var1056
	end
	local buff_1 = buffer.create(var999)
	buffer.copy(buff_1, 0, buff, 0, var999)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1057 = t_36.new()
	local var1058 = 0
	while var1058 < buffer.len(p36) do
		local _ = nil
		local var1059 = nil
		local var1060, var1061, var1062 = protoModule.readTag(p36, var1058)
		local var1063 = var1060
		var1059 = var1061
		var1058 = var1062
		
		if var1059 == protoModule.wireTypes.varint then
			if var1063 == 2 then
				local _ = nil
				local var1064, var1065 = protoModule.readVarInt(p36, var1058)
				var1058 = var1065
				var1057.is_sponsored = var1064 ~= 0
			elseif var1063 == 5 then
				local _ = nil
				local var1066, var1067 = protoModule.readVarInt(p36, var1058)
				var1058 = var1067
				var1057.is_content_locked = var1066 ~= 0
			elseif var1063 == 11 then
				local _ = nil
				local var1068, var1069 = protoModule.readVarIntI64(p36, var1058)
				var1058 = var1069
				var1057.player_count = var1068
			elseif var1063 == 13 then
				local _ = nil
				local var1070, var1071 = protoModule.readVarIntI32(p36, var1058)
				var1058 = var1071
				var1057.rank = var1070
			elseif var1063 == 26 then
				local _ = nil
				local var1072, var1073 = protoModule.readVarIntI32(p36, var1058)
				var1058 = var1073
				var1057.new_game_enum = var1072
			else
				local _ = nil
				local var1074, var1075 = protoModule.readVarInt(p36, var1058)
				local _ = var1074
				var1058 = var1075
			end
		end
		if var1059 == protoModule.wireTypes.lengthDelimited then
			if var1063 == 1 then
				local _ = nil
				local var1076, var1077 = protoModule.readBuffer(p36, var1058)
				var1058 = var1077
				var1057.universe_id = buffer.tostring(var1076)
			elseif var1063 == 3 then
				local _ = nil
				local var1078, var1079 = protoModule.readBuffer(p36, var1058)
				var1058 = var1079
				var1057.roblox_component = buffer.tostring(var1078)
			elseif var1063 == 4 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p36, var1058)
				var1058 = var1081
				var1057.native_ad_data = buffer.tostring(var1080)
			elseif var1063 == 6 then
				local _ = nil
				local var1082, var1083 = protoModule.readBuffer(p36, var1058)
				var1058 = var1083
				var1057.title = buffer.tostring(var1082)
			elseif var1063 == 7 then
				local _ = nil
				local var1084, var1085 = protoModule.readBuffer(p36, var1058)
				var1058 = var1085
				var1057.subtitle = buffer.tostring(var1084)
			elseif var1063 == 8 then
				local _ = nil
				local var1086, var1087 = protoModule.readBuffer(p36, var1058)
				var1058 = var1087
				var1057.image_asset_id = buffer.tostring(var1086)
			elseif var1063 == 9 then
				local _ = nil
				local var1088, var1089 = protoModule.readBuffer(p36, var1058)
				var1058 = var1089
				var1057.video_asset_id = buffer.tostring(var1088)
			elseif var1063 == 10 then
				local _ = nil
				local var1090, var1091 = protoModule.readBuffer(p36, var1058)
				var1058 = var1091
				var1057.badge_text = buffer.tostring(var1090)
			elseif var1063 == 12 then
				local _ = nil
				local var1092, var1093 = protoModule.readBuffer(p36, var1058)
				var1058 = var1093
				var1057.creator_key = buffer.tostring(var1092)
			elseif var1063 == 14 then
				local _ = nil
				local var1094, var1095 = protoModule.readBuffer(p36, var1058)
				var1058 = var1095
				var1057.payer_name = buffer.tostring(var1094)
			elseif var1063 == 15 then
				local _ = nil
				local var1096, var1097 = protoModule.readBuffer(p36, var1058)
				var1058 = var1097
				var1057.logo_asset_id = buffer.tostring(var1096)
			elseif var1063 == 17 then
				local _ = nil
				local var1098, var1099 = protoModule.readBuffer(p36, var1058)
				var1058 = var1099
				var1057.place_id = buffer.tostring(var1098)
			elseif var1063 == 18 then
				local _ = nil
				local var1100, var1101 = protoModule.readBuffer(p36, var1058)
				var1058 = var1101
				var1057.launch_data = buffer.tostring(var1100)
			elseif var1063 == 19 then
				local _ = nil
				local var1102, var1103 = protoModule.readBuffer(p36, var1058)
				var1058 = var1103
				var1057.tile_variant = buffer.tostring(var1102)
			elseif var1063 == 20 then
				local _ = nil
				local var1104, var1105 = protoModule.readBuffer(p36, var1058)
				var1058 = var1105
				var1057.cta_text = buffer.tostring(var1104)
			elseif var1063 == 21 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p36, var1058)
				var1058 = var1107
				var1057.badge_analytics_id = buffer.tostring(var1106)
			elseif var1063 == 22 then
				local _ = nil
				local var1108, var1109 = protoModule.readBuffer(p36, var1058)
				var1058 = var1109
				table.insert(var1057.game_items, t.GameItemInputData.decode(var1108))
			elseif var1063 == 23 then
				local _ = nil
				local var1110, var1111 = protoModule.readBuffer(p36, var1058)
				var1058 = var1111
				var1057.attribution_thumbnail_asset_id = buffer.tostring(var1110)
			elseif var1063 == 24 then
				local _ = nil
				local var1112, var1113 = protoModule.readBuffer(p36, var1058)
				var1058 = var1113
				table.insert(var1057.game_items_compact, t.GameItemInputData.decode(var1112))
			elseif var1063 == 25 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p36, var1058)
				var1058 = var1115
				var1057.source_sort_id = buffer.tostring(var1114)
			elseif var1063 == 27 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p36, var1058)
				var1058 = var1117
				var1057.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1116)
			else
				local _ = nil
				local var1118, var1119 = protoModule.readVarInt(p36, var1058)
				var1058 = var1119 + var1118
			end
		elseif var1059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1120, var1121 = protoModule.readFixed32(p36, var1058)
			local _ = var1120
			var1058 = var1121
		elseif var1059 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1744)
		elseif var1063 == 16 then
			local _ = nil
			local var1122, var1123 = protoModule.readDouble(p36, var1058)
			var1058 = var1123
			var1057.logo_aspect_ratio = var1122
		else
			local _ = nil
			local var1124, var1125 = protoModule.readFixed64(p36, var1058)
			local _ = var1124
			var1058 = var1125
		end
	end
	return var1057
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
	local var1126 = t_36.new()
	
	if self.universe_id ~= nil then
		var1126.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1126.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1126.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1126.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1126.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1126.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1126.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1126.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1126.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1126.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1126.title = self.title
	end
	if self.subtitle ~= nil then
		var1126.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1126.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1126.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1126.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1126.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1126.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1126.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1126.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1126.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1126.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1126.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1126.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1126.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1126.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1126.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1126.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1126.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1126.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1126.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1126.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1126.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1126.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1126.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1126.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1126.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1126.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1126.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1126.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1126.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1126.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1126.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1126.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1126.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1126.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1126.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1126.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1126.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1126.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1126.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1126.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	return var1126
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
	local var1127 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1128, var1129 = protoModule.writeTag(buff, var1127, 1, protoModule.wireTypes.lengthDelimited)
		var1128, var1822 = protoModule.writeString(var1128, var1129, self.asset_id)
		buff = var1128
		var1127 = var1129
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1130, var1131 = protoModule.writeTag(buff, var1127, 2, protoModule.wireTypes.lengthDelimited)
		var1130, var1824 = protoModule.writeString(var1130, var1131, self.asset_access_context)
		buff = var1130
		var1127 = var1131
	end
	local buff_1 = buffer.create(var1127)
	buffer.copy(buff_1, 0, buff, 0, var1127)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref)
	local var1127 = t_37.new()
	local var1128 = 0
	while var1128 < buffer.len(p37) do
		local _ = nil
		local var1129 = nil
		local var1130, var1131, var1132 = protoModule.readTag(p37, var1128)
		local var1133 = var1130
		var1129 = var1131
		var1128 = var1132
		
		if var1129 == protoModule.wireTypes.varint then
			local _ = nil
			local var1134, var1135 = protoModule.readVarInt(p37, var1128)
			local _ = var1134
			var1128 = var1135
			continue
		end
		if var1129 == protoModule.wireTypes.lengthDelimited then
			if var1133 == 1 then
				local _ = nil
				local var1136, var1137 = protoModule.readBuffer(p37, var1128)
				var1128 = var1137
				var1127.asset_id = buffer.tostring(var1136)
			elseif var1133 == 2 then
				local _ = nil
				local var1138, var1139 = protoModule.readBuffer(p37, var1128)
				var1128 = var1139
				var1127.asset_access_context = buffer.tostring(var1138)
			else
				local _ = nil
				local var1140, var1141 = protoModule.readVarInt(p37, var1128)
				var1128 = var1141 + var1140
			end
		elseif var1129 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1142, var1143 = protoModule.readFixed32(p37, var1128)
			local _ = var1142
			var1128 = var1143
		elseif var1129 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1144, var1145 = protoModule.readFixed64(p37, var1128)
			local _ = var1144
			var1128 = var1145
		else
			error("Unsupported wire type: " .. var1828)
		end
	end
	return var1127
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
	local var1146 = t_37.new()
	
	if self.asset_id ~= nil then
		var1146.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1146.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1146.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1146.asset_access_context = self.assetAccessContext
	end
	return var1146
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
	local var1146 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1147, var1148 = protoModule.writeTag(buff, var1146, 1, protoModule.wireTypes.lengthDelimited)
		var1147, var1850 = protoModule.writeString(var1147, var1148, self.title)
		buff = var1147
		var1146 = var1148
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1149 = v:encode()
			local var1150, var1151 = protoModule.writeTag(buff, var1146, 2, protoModule.wireTypes.lengthDelimited)
			var1150, var1853 = protoModule.writeBuffer(var1150, var1151, var1149, buffer.len(var1149))
			buff = var1150
			var1146 = var1151
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1152, var1153 = protoModule.writeTag(buff, var1146, 3, protoModule.wireTypes.lengthDelimited)
		var1152, var1855 = protoModule.writeString(var1152, var1153, self.next_page_token)
		buff = var1152
		var1146 = var1153
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1154, var1155 = protoModule.writeTag(buff, var1146, 4, protoModule.wireTypes.lengthDelimited)
		var1154, var1857 = protoModule.writeString(var1154, var1155, self.sort_id)
		buff = var1154
		var1146 = var1155
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1156, var1157 = protoModule.writeTag(buff, var1146, 5, protoModule.wireTypes.varint)
		var1156, var1859 = protoModule.writeVarInt(var1156, var1157, self.secondary_sort_id)
		buff = var1156
		var1146 = var1157
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1158, var1159 = protoModule.writeTag(buff, var1146, 6, protoModule.wireTypes.lengthDelimited)
		var1158, var1861 = protoModule.writeString(var1158, var1159, self.subtitle)
		buff = var1158
		var1146 = var1159
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1160, var1161 = protoModule.writeTag(buff, var1146, 7, protoModule.wireTypes.lengthDelimited)
		var1160, var1863 = protoModule.writeString(var1160, var1161, self.info_text)
		buff = var1160
		var1146 = var1161
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1162, var1163 = protoModule.writeTag(buff, var1146, 8, protoModule.wireTypes.lengthDelimited)
		var1162, var1865 = protoModule.writeString(var1162, var1163, self.subtitle_link_path)
		buff = var1162
		var1146 = var1163
	end
	if self.is_placeholder ~= nil then
		local var1164, var1165 = protoModule.writeTag(buff, var1146, 9, protoModule.wireTypes.varint)
		var1164, var1867 = protoModule.writeVarInt(var1164, var1165, if self.is_placeholder then 1 else 0)
		buff = var1164
		var1146 = var1165
	end
	if self.primary_sort_id ~= nil then
		local var1166, var1167 = protoModule.writeTag(buff, var1146, 10, protoModule.wireTypes.varint)
		var1166, var1869 = protoModule.writeVarInt(var1166, var1167, self.primary_sort_id)
		buff = var1166
		var1146 = var1167
	end
	if self.applied_filters ~= nil then
		local var1168, var1169 = protoModule.writeTag(buff, var1146, 11, protoModule.wireTypes.lengthDelimited)
		var1168, var1871 = protoModule.writeString(var1168, var1169, self.applied_filters)
		buff = var1168
		var1146 = var1169
	end
	local buff_1 = buffer.create(var1146)
	buffer.copy(buff_1, 0, buff, 0, var1146)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1170 = t_38.new()
	local var1171 = 0
	while var1171 < buffer.len(p38) do
		local _ = nil
		local var1172 = nil
		local var1173, var1174, var1175 = protoModule.readTag(p38, var1171)
		local var1176 = var1173
		var1172 = var1174
		var1171 = var1175
		
		if var1172 == protoModule.wireTypes.varint then
			if var1176 == 5 then
				local _ = nil
				local var1177, var1178 = protoModule.readVarIntI32(p38, var1171)
				var1171 = var1178
				var1170.secondary_sort_id = var1177
			elseif var1176 == 9 then
				local _ = nil
				local var1179, var1180 = protoModule.readVarInt(p38, var1171)
				var1171 = var1180
				var1170.is_placeholder = var1179 ~= 0
			elseif var1176 == 10 then
				local _ = nil
				local var1181, var1182 = protoModule.readVarIntI32(p38, var1171)
				var1171 = var1182
				var1170.primary_sort_id = var1181
			else
				local _ = nil
				local var1183, var1184 = protoModule.readVarInt(p38, var1171)
				local _ = var1183
				var1171 = var1184
			end
		end
		if var1172 == protoModule.wireTypes.lengthDelimited then
			if var1176 == 1 then
				local _ = nil
				local var1185, var1186 = protoModule.readBuffer(p38, var1171)
				var1171 = var1186
				var1170.title = buffer.tostring(var1185)
			elseif var1176 == 2 then
				local _ = nil
				local var1187, var1188 = protoModule.readBuffer(p38, var1171)
				var1171 = var1188
				table.insert(var1170.song_items, t.SongCarouselInputData_SongItem.decode(var1187))
			elseif var1176 == 3 then
				local _ = nil
				local var1189, var1190 = protoModule.readBuffer(p38, var1171)
				var1171 = var1190
				var1170.next_page_token = buffer.tostring(var1189)
			elseif var1176 == 4 then
				local _ = nil
				local var1191, var1192 = protoModule.readBuffer(p38, var1171)
				var1171 = var1192
				var1170.sort_id = buffer.tostring(var1191)
			elseif var1176 == 6 then
				local _ = nil
				local var1193, var1194 = protoModule.readBuffer(p38, var1171)
				var1171 = var1194
				var1170.subtitle = buffer.tostring(var1193)
			elseif var1176 == 7 then
				local _ = nil
				local var1195, var1196 = protoModule.readBuffer(p38, var1171)
				var1171 = var1196
				var1170.info_text = buffer.tostring(var1195)
			elseif var1176 == 8 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p38, var1171)
				var1171 = var1198
				var1170.subtitle_link_path = buffer.tostring(var1197)
			elseif var1176 == 11 then
				local _ = nil
				local var1199, var1200 = protoModule.readBuffer(p38, var1171)
				var1171 = var1200
				var1170.applied_filters = buffer.tostring(var1199)
			else
				local _ = nil
				local var1201, var1202 = protoModule.readVarInt(p38, var1171)
				var1171 = var1202 + var1201
			end
		elseif var1172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1203, var1204 = protoModule.readFixed32(p38, var1171)
			local _ = var1203
			var1171 = var1204
		elseif var1172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed64(p38, var1171)
			local _ = var1205
			var1171 = var1206
		else
			error("Unsupported wire type: " .. var1875)
		end
	end
	return var1170
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
	local var1207 = t_38.new()
	
	if self.title ~= nil then
		var1207.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1207.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1207.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1207.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1207.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1207.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1207.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1207.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1207.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1207.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1207.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1207.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1207.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1207.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1207.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1207.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1207.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1207.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1207.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1207.applied_filters = self.appliedFilters
	end
	return var1207
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
	local var1208 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1209, var1210 = protoModule.writeTag(buff, var1208, 1, protoModule.wireTypes.lengthDelimited)
		var1209, var1918 = protoModule.writeString(var1209, var1210, self.song_id)
		buff = var1209
		var1208 = var1210
	end
	local buff_1 = buffer.create(var1208)
	buffer.copy(buff_1, 0, buff, 0, var1208)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref)
	local var1208 = t_39.new()
	local var1209 = 0
	while var1209 < buffer.len(p39) do
		local _ = nil
		local var1210 = nil
		local var1211, var1212, var1213 = protoModule.readTag(p39, var1209)
		local var1214 = var1211
		var1210 = var1212
		var1209 = var1213
		
		if var1210 == protoModule.wireTypes.varint then
			local _ = nil
			local var1215, var1216 = protoModule.readVarInt(p39, var1209)
			local _ = var1215
			var1209 = var1216
			continue
		end
		if var1210 == protoModule.wireTypes.lengthDelimited then
			if var1214 == 1 then
				local _ = nil
				local var1217, var1218 = protoModule.readBuffer(p39, var1209)
				var1209 = var1218
				var1208.song_id = buffer.tostring(var1217)
			else
				local _ = nil
				local var1219, var1220 = protoModule.readVarInt(p39, var1209)
				var1209 = var1220 + var1219
			end
		elseif var1210 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1221, var1222 = protoModule.readFixed32(p39, var1209)
			local _ = var1221
			var1209 = var1222
		elseif var1210 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1223, var1224 = protoModule.readFixed64(p39, var1209)
			local _ = var1223
			var1209 = var1224
		else
			error("Unsupported wire type: " .. var1922)
		end
	end
	return var1208
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
	local var1225 = t_39.new()
	
	if self.song_id ~= nil then
		var1225.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1225.song_id = self.songId
	end
	return var1225
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
	local var1225 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1226, var1227 = protoModule.writeTag(buff, var1225, 1, protoModule.wireTypes.lengthDelimited)
		var1226, var1942 = protoModule.writeString(var1226, var1227, self.title)
		buff = var1226
		var1225 = var1227
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1228 = v:encode()
			local var1229, var1230 = protoModule.writeTag(buff, var1225, 2, protoModule.wireTypes.lengthDelimited)
			var1229, var1945 = protoModule.writeBuffer(var1229, var1230, var1228, buffer.len(var1228))
			buff = var1229
			var1225 = var1230
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1231, var1232 = protoModule.writeTag(buff, var1225, 3, protoModule.wireTypes.lengthDelimited)
		var1231, var1947 = protoModule.writeString(var1231, var1232, self.universe_id)
		buff = var1231
		var1225 = var1232
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1233, var1234 = protoModule.writeTag(buff, var1225, 4, protoModule.wireTypes.lengthDelimited)
		var1233, var1949 = protoModule.writeString(var1233, var1234, self.sort_id)
		buff = var1233
		var1225 = var1234
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1235, var1236 = protoModule.writeTag(buff, var1225, 5, protoModule.wireTypes.lengthDelimited)
		var1235, var1951 = protoModule.writeString(var1235, var1236, self.subtitle)
		buff = var1235
		var1225 = var1236
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1237, var1238 = protoModule.writeTag(buff, var1225, 6, protoModule.wireTypes.lengthDelimited)
		var1237, var1953 = protoModule.writeString(var1237, var1238, self.info_text)
		buff = var1237
		var1225 = var1238
	end
	local buff_1 = buffer.create(var1225)
	buffer.copy(buff_1, 0, buff, 0, var1225)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1239 = t_40.new()
	local var1240 = 0
	while var1240 < buffer.len(p40) do
		local _ = nil
		local var1241 = nil
		local var1242, var1243, var1244 = protoModule.readTag(p40, var1240)
		local var1245 = var1242
		var1241 = var1243
		var1240 = var1244
		
		if var1241 == protoModule.wireTypes.varint then
			local _ = nil
			local var1246, var1247 = protoModule.readVarInt(p40, var1240)
			local _ = var1246
			var1240 = var1247
			continue
		end
		if var1241 == protoModule.wireTypes.lengthDelimited then
			if var1245 == 1 then
				local _ = nil
				local var1248, var1249 = protoModule.readBuffer(p40, var1240)
				var1240 = var1249
				var1239.title = buffer.tostring(var1248)
			elseif var1245 == 2 then
				local _ = nil
				local var1250, var1251 = protoModule.readBuffer(p40, var1240)
				var1240 = var1251
				table.insert(var1239.event_items, t.EventsCarouselInputData_EventItem.decode(var1250))
			elseif var1245 == 3 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p40, var1240)
				var1240 = var1253
				var1239.universe_id = buffer.tostring(var1252)
			elseif var1245 == 4 then
				local _ = nil
				local var1254, var1255 = protoModule.readBuffer(p40, var1240)
				var1240 = var1255
				var1239.sort_id = buffer.tostring(var1254)
			elseif var1245 == 5 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p40, var1240)
				var1240 = var1257
				var1239.subtitle = buffer.tostring(var1256)
			elseif var1245 == 6 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p40, var1240)
				var1240 = var1259
				var1239.info_text = buffer.tostring(var1258)
			else
				local _ = nil
				local var1260, var1261 = protoModule.readVarInt(p40, var1240)
				var1240 = var1261 + var1260
			end
		elseif var1241 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1262, var1263 = protoModule.readFixed32(p40, var1240)
			local _ = var1262
			var1240 = var1263
		elseif var1241 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed64(p40, var1240)
			local _ = var1264
			var1240 = var1265
		else
			error("Unsupported wire type: " .. var1957)
		end
	end
	return var1239
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
	local var1266 = t_40.new()
	
	if self.title ~= nil then
		var1266.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1266.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1266.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1266.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1266.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1266.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1266.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1266.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1266.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1266.info_text = self.infoText
	end
	return var1266
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
	local var1267 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1268, var1269 = protoModule.writeTag(buff, var1267, 1, protoModule.wireTypes.lengthDelimited)
		var1268, var1990 = protoModule.writeString(var1268, var1269, self.event_id)
		buff = var1268
		var1267 = var1269
	end
	local buff_1 = buffer.create(var1267)
	buffer.copy(buff_1, 0, buff, 0, var1267)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref)
	local var1267 = t_41.new()
	local var1268 = 0
	while var1268 < buffer.len(p41) do
		local _ = nil
		local var1269 = nil
		local var1270, var1271, var1272 = protoModule.readTag(p41, var1268)
		local var1273 = var1270
		var1269 = var1271
		var1268 = var1272
		
		if var1269 == protoModule.wireTypes.varint then
			local _ = nil
			local var1274, var1275 = protoModule.readVarInt(p41, var1268)
			local _ = var1274
			var1268 = var1275
			continue
		end
		if var1269 == protoModule.wireTypes.lengthDelimited then
			if var1273 == 1 then
				local _ = nil
				local var1276, var1277 = protoModule.readBuffer(p41, var1268)
				var1268 = var1277
				var1267.event_id = buffer.tostring(var1276)
			else
				local _ = nil
				local var1278, var1279 = protoModule.readVarInt(p41, var1268)
				var1268 = var1279 + var1278
			end
		elseif var1269 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1280, var1281 = protoModule.readFixed32(p41, var1268)
			local _ = var1280
			var1268 = var1281
		elseif var1269 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1282, var1283 = protoModule.readFixed64(p41, var1268)
			local _ = var1282
			var1268 = var1283
		else
			error("Unsupported wire type: " .. var1994)
		end
	end
	return var1267
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
	local var1284 = t_41.new()
	
	if self.event_id ~= nil then
		var1284.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1284.event_id = self.eventId
	end
	return var1284
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
	local var1284 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1285, var1286 = protoModule.writeTag(buff, var1284, 1, protoModule.wireTypes.lengthDelimited)
		var1285, var2014 = protoModule.writeString(var1285, var1286, self.universe_id)
		buff = var1285
		var1284 = var1286
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1287, var1288 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1287, var2016 = protoModule.writeString(var1287, var1288, i)
			local var1289 = v:encode()
			var1288, var2018 = protoModule.writeTag(var1287, var1288, 2, protoModule.wireTypes.lengthDelimited)
			var1288, var2018 = protoModule.writeBuffer(var1288, var2018, var1289, buffer.len(var1289))
			local var1290 = var1288
			local var1291 = var2018
			local var1292, var1293 = protoModule.writeTag(buff, var1284, 2, protoModule.wireTypes.lengthDelimited)
			var1292, var2022 = protoModule.writeBuffer(var1292, var1293, var1290, var1291)
			buff = var1292
			var1284 = var1293
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1294, var1295 = protoModule.writeTag(buff, var1284, 3, protoModule.wireTypes.lengthDelimited)
			var1294, var2024 = protoModule.writeString(var1294, var1295, v)
			buff = var1294
			var1284 = var1295
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1296, var1297 = protoModule.writeTag(buff, var1284, 4, protoModule.wireTypes.lengthDelimited)
		var1296, var2026 = protoModule.writeString(var1296, var1297, self.creator_key)
		buff = var1296
		var1284 = var1297
	end
	if self.pill_tabs ~= nil then
		local var1298 = self.pill_tabs:encode()
		local var1299, var1300 = protoModule.writeTag(buff, var1284, 5, protoModule.wireTypes.lengthDelimited)
		var1299, var2029 = protoModule.writeBuffer(var1299, var1300, var1298, buffer.len(var1298))
		buff = var1299
		var1284 = var1300
	end
	local buff_1 = buffer.create(var1284)
	buffer.copy(buff_1, 0, buff, 0, var1284)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1301 = t_42.new()
	local var1302 = 0
	while var1302 < buffer.len(p42) do
		local _ = nil
		local var1303 = nil
		local var1304, var1305, var1306 = protoModule.readTag(p42, var1302)
		local var1307 = var1304
		var1303 = var1305
		var1302 = var1306
		
		if var1303 == protoModule.wireTypes.varint then
			local _ = nil
			local var1308, var1309 = protoModule.readVarInt(p42, var1302)
			local _ = var1308
			var1302 = var1309
			continue
		end
		if var1303 == protoModule.wireTypes.lengthDelimited then
			if var1307 == 1 then
				local _ = nil
				local var1310, var1311 = protoModule.readBuffer(p42, var1302)
				var1302 = var1311
				var1301.universe_id = buffer.tostring(var1310)
			elseif var1307 == 2 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p42, var1302)
				var1302 = var1313
				var1312 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1312)
				var1301.entry_map[var1312.key or ""] = var1312.value or t.FeedEntry.new()
			elseif var1307 == 3 then
				local _ = nil
				local var1314, var1315 = protoModule.readBuffer(p42, var1302)
				var1302 = var1315
				table.insert(var1301.entry_order, buffer.tostring(var1314))
			elseif var1307 == 4 then
				local _ = nil
				local var1316, var1317 = protoModule.readBuffer(p42, var1302)
				var1302 = var1317
				var1301.creator_key = buffer.tostring(var1316)
			elseif var1307 == 5 then
				local _ = nil
				local var1318, var1319 = protoModule.readBuffer(p42, var1302)
				var1302 = var1319
				var1301.pill_tabs = t.PillTabsInputData.decode(var1318)
			else
				local _ = nil
				local var1320, var1321 = protoModule.readVarInt(p42, var1302)
				var1302 = var1321 + var1320
			end
		elseif var1303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1322, var1323 = protoModule.readFixed32(p42, var1302)
			local _ = var1322
			var1302 = var1323
		elseif var1303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1324, var1325 = protoModule.readFixed64(p42, var1302)
			local _ = var1324
			var1302 = var1325
		else
			error("Unsupported wire type: " .. var2033)
		end
	end
	return var1301
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
	local var1326 = t_42.new()
	
	if self.universe_id ~= nil then
		var1326.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1326.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1326.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1326.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1326.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1326.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1326.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1326.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1326.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1326.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1326
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
	local var1327 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1328, var1329 = protoModule.writeTag(buff, var1327, 1, protoModule.wireTypes.lengthDelimited)
		var1328, var2067 = protoModule.writeString(var1328, var1329, self.key)
		buff = var1328
		var1327 = var1329
	end
	if self.value ~= nil then
		local var1330 = self.value:encode()
		local var1331, var1332 = protoModule.writeTag(buff, var1327, 2, protoModule.wireTypes.lengthDelimited)
		var1331, var2070 = protoModule.writeBuffer(var1331, var1332, var1330, buffer.len(var1330))
		buff = var1331
		var1327 = var1332
	end
	local buff_1 = buffer.create(var1327)
	buffer.copy(buff_1, 0, buff, 0, var1327)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1327 = t_43.new()
	local var1328 = 0
	while var1328 < buffer.len(p43) do
		local _ = nil
		local var1329 = nil
		local var1330, var1331, var1332 = protoModule.readTag(p43, var1328)
		local var1333 = var1330
		var1329 = var1331
		var1328 = var1332
		
		if var1329 == protoModule.wireTypes.varint then
			local _ = nil
			local var1334, var1335 = protoModule.readVarInt(p43, var1328)
			local _ = var1334
			var1328 = var1335
			continue
		end
		if var1329 == protoModule.wireTypes.lengthDelimited then
			if var1333 == 1 then
				local _ = nil
				local var1336, var1337 = protoModule.readBuffer(p43, var1328)
				var1328 = var1337
				var1327.key = buffer.tostring(var1336)
			elseif var1333 == 2 then
				local _ = nil
				local var1338, var1339 = protoModule.readBuffer(p43, var1328)
				var1328 = var1339
				var1327.value = t.FeedEntry.decode(var1338)
			else
				local _ = nil
				local var1340, var1341 = protoModule.readVarInt(p43, var1328)
				var1328 = var1341 + var1340
			end
		elseif var1329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1342, var1343 = protoModule.readFixed32(p43, var1328)
			local _ = var1342
			var1328 = var1343
		elseif var1329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1344, var1345 = protoModule.readFixed64(p43, var1328)
			local _ = var1344
			var1328 = var1345
		else
			error("Unsupported wire type: " .. var2074)
		end
	end
	return var1327
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
	local var1346 = t_43.new()
	
	if self.key ~= nil then
		var1346.key = self.key
	end
	if self.value ~= nil then
		var1346.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1346
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
	local var1346 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1347 = v:encode()
			local var1348, var1349 = protoModule.writeTag(buff, var1346, 1, protoModule.wireTypes.lengthDelimited)
			var1348, var2097 = protoModule.writeBuffer(var1348, var1349, var1347, buffer.len(var1347))
			buff = var1348
			var1346 = var1349
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1350, var1351 = protoModule.writeTag(buff, var1346, 2, protoModule.wireTypes.lengthDelimited)
		var1350, var2099 = protoModule.writeString(var1350, var1351, self.default_option_id)
		buff = var1350
		var1346 = var1351
	end
	local buff_1 = buffer.create(var1346)
	buffer.copy(buff_1, 0, buff, 0, var1346)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1352 = t_44.new()
	local var1353 = 0
	while var1353 < buffer.len(p44) do
		local _ = nil
		local var1354 = nil
		local var1355, var1356, var1357 = protoModule.readTag(p44, var1353)
		local var1358 = var1355
		var1354 = var1356
		var1353 = var1357
		
		if var1354 == protoModule.wireTypes.varint then
			local _ = nil
			local var1359, var1360 = protoModule.readVarInt(p44, var1353)
			local _ = var1359
			var1353 = var1360
			continue
		end
		if var1354 == protoModule.wireTypes.lengthDelimited then
			if var1358 == 1 then
				local _ = nil
				local var1361, var1362 = protoModule.readBuffer(p44, var1353)
				var1353 = var1362
				table.insert(var1352.options, t.PillTabsInputData_PillTabOption.decode(var1361))
			elseif var1358 == 2 then
				local _ = nil
				local var1363, var1364 = protoModule.readBuffer(p44, var1353)
				var1353 = var1364
				var1352.default_option_id = buffer.tostring(var1363)
			else
				local _ = nil
				local var1365, var1366 = protoModule.readVarInt(p44, var1353)
				var1353 = var1366 + var1365
			end
		elseif var1354 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1367, var1368 = protoModule.readFixed32(p44, var1353)
			local _ = var1367
			var1353 = var1368
		elseif var1354 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1369, var1370 = protoModule.readFixed64(p44, var1353)
			local _ = var1369
			var1353 = var1370
		else
			error("Unsupported wire type: " .. var2103)
		end
	end
	return var1352
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
	local var1371 = t_44.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1371.options = t_1
	end
	if self.default_option_id ~= nil then
		var1371.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1371.default_option_id = self.defaultOptionId
	end
	return var1371
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
	local var1372 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1373, var1374 = protoModule.writeTag(buff, var1372, 1, protoModule.wireTypes.lengthDelimited)
		var1373, var2127 = protoModule.writeString(var1373, var1374, self.option_id)
		buff = var1373
		var1372 = var1374
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1375, var1376 = protoModule.writeTag(buff, var1372, 2, protoModule.wireTypes.lengthDelimited)
		var1375, var2129 = protoModule.writeString(var1375, var1376, self.display_name)
		buff = var1375
		var1372 = var1376
	end
	local buff_1 = buffer.create(var1372)
	buffer.copy(buff_1, 0, buff, 0, var1372)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref)
	local var1372 = t_45.new()
	local var1373 = 0
	while var1373 < buffer.len(p45) do
		local _ = nil
		local var1374 = nil
		local var1375, var1376, var1377 = protoModule.readTag(p45, var1373)
		local var1378 = var1375
		var1374 = var1376
		var1373 = var1377
		
		if var1374 == protoModule.wireTypes.varint then
			local _ = nil
			local var1379, var1380 = protoModule.readVarInt(p45, var1373)
			local _ = var1379
			var1373 = var1380
			continue
		end
		if var1374 == protoModule.wireTypes.lengthDelimited then
			if var1378 == 1 then
				local _ = nil
				local var1381, var1382 = protoModule.readBuffer(p45, var1373)
				var1373 = var1382
				var1372.option_id = buffer.tostring(var1381)
			elseif var1378 == 2 then
				local _ = nil
				local var1383, var1384 = protoModule.readBuffer(p45, var1373)
				var1373 = var1384
				var1372.display_name = buffer.tostring(var1383)
			else
				local _ = nil
				local var1385, var1386 = protoModule.readVarInt(p45, var1373)
				var1373 = var1386 + var1385
			end
		elseif var1374 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1387, var1388 = protoModule.readFixed32(p45, var1373)
			local _ = var1387
			var1373 = var1388
		elseif var1374 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1389, var1390 = protoModule.readFixed64(p45, var1373)
			local _ = var1389
			var1373 = var1390
		else
			error("Unsupported wire type: " .. var2133)
		end
	end
	return var1372
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
	local var1391 = t_45.new()
	
	if self.option_id ~= nil then
		var1391.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1391.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1391.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1391.display_name = self.displayName
	end
	return var1391
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
	local var1391 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1392 = v:encode()
			local var1393, var1394 = protoModule.writeTag(buff, var1391, 1, protoModule.wireTypes.lengthDelimited)
			var1393, var2156 = protoModule.writeBuffer(var1393, var1394, var1392, buffer.len(var1392))
			buff = var1393
			var1391 = var1394
		end
	end
	local buff_1 = buffer.create(var1391)
	buffer.copy(buff_1, 0, buff, 0, var1391)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1395 = t_46.new()
	local var1396 = 0
	while var1396 < buffer.len(p46) do
		local _ = nil
		local var1397 = nil
		local var1398, var1399, var1400 = protoModule.readTag(p46, var1396)
		local var1401 = var1398
		var1397 = var1399
		var1396 = var1400
		
		if var1397 == protoModule.wireTypes.varint then
			local _ = nil
			local var1402, var1403 = protoModule.readVarInt(p46, var1396)
			local _ = var1402
			var1396 = var1403
			continue
		end
		if var1397 == protoModule.wireTypes.lengthDelimited then
			if var1401 == 1 then
				local _ = nil
				local var1404, var1405 = protoModule.readBuffer(p46, var1396)
				var1396 = var1405
				table.insert(var1395.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1404))
			else
				local _ = nil
				local var1406, var1407 = protoModule.readVarInt(p46, var1396)
				var1396 = var1407 + var1406
			end
		elseif var1397 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1408, var1409 = protoModule.readFixed32(p46, var1396)
			local _ = var1408
			var1396 = var1409
		elseif var1397 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1410, var1411 = protoModule.readFixed64(p46, var1396)
			local _ = var1410
			var1396 = var1411
		else
			error("Unsupported wire type: " .. var2160)
		end
	end
	return var1395
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
	local var1412 = t_46.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1412.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1412.game_passes = t_1
	end
	return var1412
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
	local var1413 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1414, var1415 = protoModule.writeTag(buff, var1413, 1, protoModule.wireTypes.lengthDelimited)
		var1414, var2183 = protoModule.writeString(var1414, var1415, self.game_pass_id)
		buff = var1414
		var1413 = var1415
	end
	local buff_1 = buffer.create(var1413)
	buffer.copy(buff_1, 0, buff, 0, var1413)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref)
	local var1413 = t_47.new()
	local var1414 = 0
	while var1414 < buffer.len(p47) do
		local _ = nil
		local var1415 = nil
		local var1416, var1417, var1418 = protoModule.readTag(p47, var1414)
		local var1419 = var1416
		var1415 = var1417
		var1414 = var1418
		
		if var1415 == protoModule.wireTypes.varint then
			local _ = nil
			local var1420, var1421 = protoModule.readVarInt(p47, var1414)
			local _ = var1420
			var1414 = var1421
			continue
		end
		if var1415 == protoModule.wireTypes.lengthDelimited then
			if var1419 == 1 then
				local _ = nil
				local var1422, var1423 = protoModule.readBuffer(p47, var1414)
				var1414 = var1423
				var1413.game_pass_id = buffer.tostring(var1422)
			else
				local _ = nil
				local var1424, var1425 = protoModule.readVarInt(p47, var1414)
				var1414 = var1425 + var1424
			end
		elseif var1415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1426, var1427 = protoModule.readFixed32(p47, var1414)
			local _ = var1426
			var1414 = var1427
		elseif var1415 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1428, var1429 = protoModule.readFixed64(p47, var1414)
			local _ = var1428
			var1414 = var1429
		else
			error("Unsupported wire type: " .. var2187)
		end
	end
	return var1413
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
	local var1430 = t_47.new()
	
	if self.game_pass_id ~= nil then
		var1430.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1430.game_pass_id = self.gamePassId
	end
	return var1430
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
	local var1430 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1431 = v:encode()
			local var1432, var1433 = protoModule.writeTag(buff, var1430, 1, protoModule.wireTypes.lengthDelimited)
			var1432, var2208 = protoModule.writeBuffer(var1432, var1433, var1431, buffer.len(var1431))
			buff = var1432
			var1430 = var1433
		end
	end
	local buff_1 = buffer.create(var1430)
	buffer.copy(buff_1, 0, buff, 0, var1430)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1434 = t_48.new()
	local var1435 = 0
	while var1435 < buffer.len(p48) do
		local _ = nil
		local var1436 = nil
		local var1437, var1438, var1439 = protoModule.readTag(p48, var1435)
		local var1440 = var1437
		var1436 = var1438
		var1435 = var1439
		
		if var1436 == protoModule.wireTypes.varint then
			local _ = nil
			local var1441, var1442 = protoModule.readVarInt(p48, var1435)
			local _ = var1441
			var1435 = var1442
			continue
		end
		if var1436 == protoModule.wireTypes.lengthDelimited then
			if var1440 == 1 then
				local _ = nil
				local var1443, var1444 = protoModule.readBuffer(p48, var1435)
				var1435 = var1444
				table.insert(var1434.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1443))
			else
				local _ = nil
				local var1445, var1446 = protoModule.readVarInt(p48, var1435)
				var1435 = var1446 + var1445
			end
		elseif var1436 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1447, var1448 = protoModule.readFixed32(p48, var1435)
			local _ = var1447
			var1435 = var1448
		elseif var1436 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1449, var1450 = protoModule.readFixed64(p48, var1435)
			local _ = var1449
			var1435 = var1450
		else
			error("Unsupported wire type: " .. var2212)
		end
	end
	return var1434
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
	local var1451 = t_48.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1451.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1451.developer_products = t_1
	end
	return var1451
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
	local var1452 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1453, var1454 = protoModule.writeTag(buff, var1452, 1, protoModule.wireTypes.lengthDelimited)
		var1453, var2235 = protoModule.writeString(var1453, var1454, self.developer_product_id)
		buff = var1453
		var1452 = var1454
	end
	local buff_1 = buffer.create(var1452)
	buffer.copy(buff_1, 0, buff, 0, var1452)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref)
	local var1452 = t_49.new()
	local var1453 = 0
	while var1453 < buffer.len(p49) do
		local _ = nil
		local var1454 = nil
		local var1455, var1456, var1457 = protoModule.readTag(p49, var1453)
		local var1458 = var1455
		var1454 = var1456
		var1453 = var1457
		
		if var1454 == protoModule.wireTypes.varint then
			local _ = nil
			local var1459, var1460 = protoModule.readVarInt(p49, var1453)
			local _ = var1459
			var1453 = var1460
			continue
		end
		if var1454 == protoModule.wireTypes.lengthDelimited then
			if var1458 == 1 then
				local _ = nil
				local var1461, var1462 = protoModule.readBuffer(p49, var1453)
				var1453 = var1462
				var1452.developer_product_id = buffer.tostring(var1461)
			else
				local _ = nil
				local var1463, var1464 = protoModule.readVarInt(p49, var1453)
				var1453 = var1464 + var1463
			end
		elseif var1454 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1465, var1466 = protoModule.readFixed32(p49, var1453)
			local _ = var1465
			var1453 = var1466
		elseif var1454 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1467, var1468 = protoModule.readFixed64(p49, var1453)
			local _ = var1467
			var1453 = var1468
		else
			error("Unsupported wire type: " .. var2239)
		end
	end
	return var1452
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
	local var1469 = t_49.new()
	
	if self.developer_product_id ~= nil then
		var1469.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1469.developer_product_id = self.developerProductId
	end
	return var1469
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
	local var1469 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1470 = v:encode()
			local var1471, var1472 = protoModule.writeTag(buff, var1469, 1, protoModule.wireTypes.lengthDelimited)
			var1471, var2260 = protoModule.writeBuffer(var1471, var1472, var1470, buffer.len(var1470))
			buff = var1471
			var1469 = var1472
		end
	end
	local buff_1 = buffer.create(var1469)
	buffer.copy(buff_1, 0, buff, 0, var1469)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1473 = t_50.new()
	local var1474 = 0
	while var1474 < buffer.len(p50) do
		local _ = nil
		local var1475 = nil
		local var1476, var1477, var1478 = protoModule.readTag(p50, var1474)
		local var1479 = var1476
		var1475 = var1477
		var1474 = var1478
		
		if var1475 == protoModule.wireTypes.varint then
			local _ = nil
			local var1480, var1481 = protoModule.readVarInt(p50, var1474)
			local _ = var1480
			var1474 = var1481
			continue
		end
		if var1475 == protoModule.wireTypes.lengthDelimited then
			if var1479 == 1 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p50, var1474)
				var1474 = var1483
				table.insert(var1473.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1482))
			else
				local _ = nil
				local var1484, var1485 = protoModule.readVarInt(p50, var1474)
				var1474 = var1485 + var1484
			end
		elseif var1475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1486, var1487 = protoModule.readFixed32(p50, var1474)
			local _ = var1486
			var1474 = var1487
		elseif var1475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1488, var1489 = protoModule.readFixed64(p50, var1474)
			local _ = var1488
			var1474 = var1489
		else
			error("Unsupported wire type: " .. var2264)
		end
	end
	return var1473
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
	local var1490 = t_50.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1490.subscriptions = t_1
	end
	return var1490
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
	local var1491 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1492, var1493 = protoModule.writeTag(buff, var1491, 1, protoModule.wireTypes.lengthDelimited)
		var1492, var2286 = protoModule.writeString(var1492, var1493, self.subscription_id)
		buff = var1492
		var1491 = var1493
	end
	local buff_1 = buffer.create(var1491)
	buffer.copy(buff_1, 0, buff, 0, var1491)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1491 = t_51.new()
	local var1492 = 0
	while var1492 < buffer.len(p51) do
		local _ = nil
		local var1493 = nil
		local var1494, var1495, var1496 = protoModule.readTag(p51, var1492)
		local var1497 = var1494
		var1493 = var1495
		var1492 = var1496
		
		if var1493 == protoModule.wireTypes.varint then
			local _ = nil
			local var1498, var1499 = protoModule.readVarInt(p51, var1492)
			local _ = var1498
			var1492 = var1499
			continue
		end
		if var1493 == protoModule.wireTypes.lengthDelimited then
			if var1497 == 1 then
				local _ = nil
				local var1500, var1501 = protoModule.readBuffer(p51, var1492)
				var1492 = var1501
				var1491.subscription_id = buffer.tostring(var1500)
			else
				local _ = nil
				local var1502, var1503 = protoModule.readVarInt(p51, var1492)
				var1492 = var1503 + var1502
			end
		elseif var1493 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1504, var1505 = protoModule.readFixed32(p51, var1492)
			local _ = var1504
			var1492 = var1505
		elseif var1493 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1506, var1507 = protoModule.readFixed64(p51, var1492)
			local _ = var1506
			var1492 = var1507
		else
			error("Unsupported wire type: " .. var2290)
		end
	end
	return var1491
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
	local var1508 = t_51.new()
	
	if self.subscription_id ~= nil then
		var1508.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1508.subscription_id = self.subscriptionId
	end
	return var1508
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
	local var1508 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1509 = v:encode()
			local var1510, var1511 = protoModule.writeTag(buff, var1508, 1, protoModule.wireTypes.lengthDelimited)
			var1510, var2311 = protoModule.writeBuffer(var1510, var1511, var1509, buffer.len(var1509))
			buff = var1510
			var1508 = var1511
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1512, var1513 = protoModule.writeTag(buff, var1508, 2, protoModule.wireTypes.lengthDelimited)
		var1512, var2313 = protoModule.writeString(var1512, var1513, self.universe_id)
		buff = var1512
		var1508 = var1513
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1508, 3, protoModule.wireTypes.lengthDelimited)
		var1514, var2315 = protoModule.writeString(var1514, var1515, self.section_title)
		buff = var1514
		var1508 = var1515
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1508, 4, protoModule.wireTypes.lengthDelimited)
		var1516, var2317 = protoModule.writeString(var1516, var1517, self.creator_key)
		buff = var1516
		var1508 = var1517
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1508, 5, protoModule.wireTypes.lengthDelimited)
		var1518, var2319 = protoModule.writeString(var1518, var1519, self.collection_item_size)
		buff = var1518
		var1508 = var1519
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1508, 6, protoModule.wireTypes.lengthDelimited)
		var1520, var2321 = protoModule.writeString(var1520, var1521, self.item_height_mode)
		buff = var1520
		var1508 = var1521
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1522, var1523 = protoModule.writeTag(buff, var1508, 7, protoModule.wireTypes.lengthDelimited)
		var1522, var2323 = protoModule.writeString(var1522, var1523, self.experience_store_product_type)
		buff = var1522
		var1508 = var1523
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1524, var1525 = protoModule.writeTag(buff, var1508, 8, protoModule.wireTypes.lengthDelimited)
		var1524, var2325 = protoModule.writeString(var1524, var1525, self.content_type)
		buff = var1524
		var1508 = var1525
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1526, var1527 = protoModule.writeTag(buff, var1508, 9, protoModule.wireTypes.lengthDelimited)
		var1526, var2327 = protoModule.writeString(var1526, var1527, self.item_type)
		buff = var1526
		var1508 = var1527
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1528, var1529 = protoModule.writeTag(buff, var1508, 10, protoModule.wireTypes.lengthDelimited)
		var1528, var2329 = protoModule.writeString(var1528, var1529, self.filter_category_id)
		buff = var1528
		var1508 = var1529
	end
	local buff_1 = buffer.create(var1508)
	buffer.copy(buff_1, 0, buff, 0, var1508)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1530 = t_52.new()
	local var1531 = 0
	while var1531 < buffer.len(p52) do
		local _ = nil
		local var1532 = nil
		local var1533, var1534, var1535 = protoModule.readTag(p52, var1531)
		local var1536 = var1533
		var1532 = var1534
		var1531 = var1535
		
		if var1532 == protoModule.wireTypes.varint then
			local _ = nil
			local var1537, var1538 = protoModule.readVarInt(p52, var1531)
			local _ = var1537
			var1531 = var1538
			continue
		end
		if var1532 == protoModule.wireTypes.lengthDelimited then
			if var1536 == 1 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p52, var1531)
				var1531 = var1540
				table.insert(var1530.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1539))
			elseif var1536 == 2 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p52, var1531)
				var1531 = var1542
				var1530.universe_id = buffer.tostring(var1541)
			elseif var1536 == 3 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p52, var1531)
				var1531 = var1544
				var1530.section_title = buffer.tostring(var1543)
			elseif var1536 == 4 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p52, var1531)
				var1531 = var1546
				var1530.creator_key = buffer.tostring(var1545)
			elseif var1536 == 5 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p52, var1531)
				var1531 = var1548
				var1530.collection_item_size = buffer.tostring(var1547)
			elseif var1536 == 6 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p52, var1531)
				var1531 = var1550
				var1530.item_height_mode = buffer.tostring(var1549)
			elseif var1536 == 7 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p52, var1531)
				var1531 = var1552
				var1530.experience_store_product_type = buffer.tostring(var1551)
			elseif var1536 == 8 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p52, var1531)
				var1531 = var1554
				var1530.content_type = buffer.tostring(var1553)
			elseif var1536 == 9 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p52, var1531)
				var1531 = var1556
				var1530.item_type = buffer.tostring(var1555)
			elseif var1536 == 10 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p52, var1531)
				var1531 = var1558
				var1530.filter_category_id = buffer.tostring(var1557)
			else
				local _ = nil
				local var1559, var1560 = protoModule.readVarInt(p52, var1531)
				var1531 = var1560 + var1559
			end
		elseif var1532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed32(p52, var1531)
			local _ = var1561
			var1531 = var1562
		elseif var1532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed64(p52, var1531)
			local _ = var1563
			var1531 = var1564
		else
			error("Unsupported wire type: " .. var2333)
		end
	end
	return var1530
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
	local var1565 = t_52.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1565.items = t_1
	end
	if self.universe_id ~= nil then
		var1565.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1565.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1565.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1565.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1565.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1565.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1565.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1565.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1565.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1565.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1565.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1565.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1565.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1565.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1565.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1565.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1565.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1565.filter_category_id = self.filterCategoryId
	end
	return var1565
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
	local var1566 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1567, var1568 = protoModule.writeTag(buff, var1566, 1, protoModule.wireTypes.lengthDelimited)
		var1567, var2373 = protoModule.writeString(var1567, var1568, self.item_id)
		buff = var1567
		var1566 = var1568
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1569, var1570 = protoModule.writeTag(buff, var1566, 2, protoModule.wireTypes.varint)
		var1569, var2375 = protoModule.writeVarInt(var1569, var1570, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1569
		var1566 = var1570
	end
	local buff_1 = buffer.create(var1566)
	buffer.copy(buff_1, 0, buff, 0, var1566)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1566 = t_53.new()
	local var1567 = 0
	while var1567 < buffer.len(p53) do
		local _ = nil
		local var1568 = nil
		local var1569, var1570, var1571 = protoModule.readTag(p53, var1567)
		local var1572 = var1569
		var1568 = var1570
		var1567 = var1571
		
		if var1568 == protoModule.wireTypes.varint then
			if var1572 == 2 then
				local _ = nil
				local var1573, var1574 = protoModule.readVarIntI32(p53, var1567)
				local var1575 = var1573
				var1567 = var1574
				var1566.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1575) or var1575
			else
				local _ = nil
				local var1576, var1577 = protoModule.readVarInt(p53, var1567)
				local _ = var1576
				var1567 = var1577
			end
		end
		if var1568 == protoModule.wireTypes.lengthDelimited then
			if var1572 == 1 then
				local _ = nil
				local var1578, var1579 = protoModule.readBuffer(p53, var1567)
				var1567 = var1579
				var1566.item_id = buffer.tostring(var1578)
			else
				local _ = nil
				local var1580, var1581 = protoModule.readVarInt(p53, var1567)
				var1567 = var1581 + var1580
			end
		elseif var1568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1582, var1583 = protoModule.readFixed32(p53, var1567)
			local _ = var1582
			var1567 = var1583
		elseif var1568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1584, var1585 = protoModule.readFixed64(p53, var1567)
			local _ = var1584
			var1567 = var1585
		else
			error("Unsupported wire type: " .. var2379)
		end
	end
	return var1566
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
	local var1586 = t_53.new()
	
	if self.item_id ~= nil then
		var1586.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1586.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1586.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1586
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
	local var1586 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1587, var1588 = protoModule.writeTag(buff, var1586, 1, protoModule.wireTypes.lengthDelimited)
		var1587, var2402 = protoModule.writeString(var1587, var1588, self.roblox_component)
		buff = var1587
		var1586 = var1588
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1589, var1590 = protoModule.writeTag(buff, var1586, 2, protoModule.wireTypes.lengthDelimited)
		var1589, var2404 = protoModule.writeString(var1589, var1590, self.identifier)
		buff = var1589
		var1586 = var1590
	end
	if self.title ~= nil and self.title ~= "" then
		local var1591, var1592 = protoModule.writeTag(buff, var1586, 3, protoModule.wireTypes.lengthDelimited)
		var1591, var2406 = protoModule.writeString(var1591, var1592, self.title)
		buff = var1591
		var1586 = var1592
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1593, var1594 = protoModule.writeTag(buff, var1586, 4, protoModule.wireTypes.lengthDelimited)
		var1593, var2408 = protoModule.writeString(var1593, var1594, self.user_id)
		buff = var1593
		var1586 = var1594
	end
	if self.description ~= nil and self.description ~= "" then
		local var1595, var1596 = protoModule.writeTag(buff, var1586, 5, protoModule.wireTypes.lengthDelimited)
		var1595, var2410 = protoModule.writeString(var1595, var1596, self.description)
		buff = var1595
		var1586 = var1596
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1597, var1598 = protoModule.writeTag(buff, var1586, 6, protoModule.wireTypes.lengthDelimited)
		var1597, var2412 = protoModule.writeString(var1597, var1598, self.cta_text)
		buff = var1597
		var1586 = var1598
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1599, var1600 = protoModule.writeTag(buff, var1586, 7, protoModule.wireTypes.lengthDelimited)
		var1599, var2414 = protoModule.writeString(var1599, var1600, self.prompt_id)
		buff = var1599
		var1586 = var1600
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1601, var1602 = protoModule.writeTag(buff, var1586, 8, protoModule.wireTypes.lengthDelimited)
		var1601, var2416 = protoModule.writeString(var1601, var1602, self.prompt_type)
		buff = var1601
		var1586 = var1602
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1603, var1604 = protoModule.writeTag(buff, var1586, 9, protoModule.wireTypes.lengthDelimited)
		var1603, var2418 = protoModule.writeString(var1603, var1604, self.entity_id)
		buff = var1603
		var1586 = var1604
	end
	local buff_1 = buffer.create(var1586)
	buffer.copy(buff_1, 0, buff, 0, var1586)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1586 = t_54.new()
	local var1587 = 0
	while var1587 < buffer.len(p54) do
		local _ = nil
		local var1588 = nil
		local var1589, var1590, var1591 = protoModule.readTag(p54, var1587)
		local var1592 = var1589
		var1588 = var1590
		var1587 = var1591
		
		if var1588 == protoModule.wireTypes.varint then
			local _ = nil
			local var1593, var1594 = protoModule.readVarInt(p54, var1587)
			local _ = var1593
			var1587 = var1594
			continue
		end
		if var1588 == protoModule.wireTypes.lengthDelimited then
			if var1592 == 1 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p54, var1587)
				var1587 = var1596
				var1586.roblox_component = buffer.tostring(var1595)
			elseif var1592 == 2 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p54, var1587)
				var1587 = var1598
				var1586.identifier = buffer.tostring(var1597)
			elseif var1592 == 3 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p54, var1587)
				var1587 = var1600
				var1586.title = buffer.tostring(var1599)
			elseif var1592 == 4 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p54, var1587)
				var1587 = var1602
				var1586.user_id = buffer.tostring(var1601)
			elseif var1592 == 5 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p54, var1587)
				var1587 = var1604
				var1586.description = buffer.tostring(var1603)
			elseif var1592 == 6 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p54, var1587)
				var1587 = var1606
				var1586.cta_text = buffer.tostring(var1605)
			elseif var1592 == 7 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p54, var1587)
				var1587 = var1608
				var1586.prompt_id = buffer.tostring(var1607)
			elseif var1592 == 8 then
				local _ = nil
				local var1609, var1610 = protoModule.readBuffer(p54, var1587)
				var1587 = var1610
				var1586.prompt_type = buffer.tostring(var1609)
			elseif var1592 == 9 then
				local _ = nil
				local var1611, var1612 = protoModule.readBuffer(p54, var1587)
				var1587 = var1612
				var1586.entity_id = buffer.tostring(var1611)
			else
				local _ = nil
				local var1613, var1614 = protoModule.readVarInt(p54, var1587)
				var1587 = var1614 + var1613
			end
		elseif var1588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1615, var1616 = protoModule.readFixed32(p54, var1587)
			local _ = var1615
			var1587 = var1616
		elseif var1588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1617, var1618 = protoModule.readFixed64(p54, var1587)
			local _ = var1617
			var1587 = var1618
		else
			error("Unsupported wire type: " .. var2422)
		end
	end
	return var1586
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
	local var1619 = t_54.new()
	
	if self.roblox_component ~= nil then
		var1619.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1619.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1619.identifier = self.identifier
	end
	if self.title ~= nil then
		var1619.title = self.title
	end
	if self.user_id ~= nil then
		var1619.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1619.user_id = self.userId
	end
	if self.description ~= nil then
		var1619.description = self.description
	end
	if self.cta_text ~= nil then
		var1619.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1619.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1619.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1619.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1619.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1619.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1619.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1619.entity_id = self.entityId
	end
	return var1619
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
	local var1619 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1620, var1621 = protoModule.writeTag(buff, var1619, 1, protoModule.wireTypes.lengthDelimited)
		var1620, var2458 = protoModule.writeString(var1620, var1621, self.group_id)
		buff = var1620
		var1619 = var1621
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1622, var1623 = protoModule.writeTag(buff, var1619, 2, protoModule.wireTypes.lengthDelimited)
		var1622, var2460 = protoModule.writeString(var1622, var1623, self.experience_id)
		buff = var1622
		var1619 = var1623
	end
	local buff_1 = buffer.create(var1619)
	buffer.copy(buff_1, 0, buff, 0, var1619)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1619 = t_55.new()
	local var1620 = 0
	while var1620 < buffer.len(p55) do
		local _ = nil
		local var1621 = nil
		local var1622, var1623, var1624 = protoModule.readTag(p55, var1620)
		local var1625 = var1622
		var1621 = var1623
		var1620 = var1624
		
		if var1621 == protoModule.wireTypes.varint then
			local _ = nil
			local var1626, var1627 = protoModule.readVarInt(p55, var1620)
			local _ = var1626
			var1620 = var1627
			continue
		end
		if var1621 == protoModule.wireTypes.lengthDelimited then
			if var1625 == 1 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p55, var1620)
				var1620 = var1629
				var1619.group_id = buffer.tostring(var1628)
			elseif var1625 == 2 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p55, var1620)
				var1620 = var1631
				var1619.experience_id = buffer.tostring(var1630)
			else
				local _ = nil
				local var1632, var1633 = protoModule.readVarInt(p55, var1620)
				var1620 = var1633 + var1632
			end
		elseif var1621 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1634, var1635 = protoModule.readFixed32(p55, var1620)
			local _ = var1634
			var1620 = var1635
		elseif var1621 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1636, var1637 = protoModule.readFixed64(p55, var1620)
			local _ = var1636
			var1620 = var1637
		else
			error("Unsupported wire type: " .. var2464)
		end
	end
	return var1619
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
	local var1638 = t_55.new()
	
	if self.group_id ~= nil then
		var1638.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1638.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1638.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1638.experience_id = self.experienceId
	end
	return var1638
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
	local var1638 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1639, var1640 = protoModule.writeTag(buff, var1638, 1, protoModule.wireTypes.lengthDelimited)
		var1639, var2486 = protoModule.writeString(var1639, var1640, self.title)
		buff = var1639
		var1638 = var1640
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1641, var1642 = protoModule.writeTag(buff, var1638, 2, protoModule.wireTypes.lengthDelimited)
		var1641, var2488 = protoModule.writeString(var1641, var1642, self.dismiss_text)
		buff = var1641
		var1638 = var1642
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1643, var1644 = protoModule.writeTag(buff, var1638, 3, protoModule.wireTypes.lengthDelimited)
		var1643, var2490 = protoModule.writeString(var1643, var1644, self.user_id)
		buff = var1643
		var1638 = var1644
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1645 = v:encode()
			local var1646, var1647 = protoModule.writeTag(buff, var1638, 4, protoModule.wireTypes.lengthDelimited)
			var1646, var2493 = protoModule.writeBuffer(var1646, var1647, var1645, buffer.len(var1645))
			buff = var1646
			var1638 = var1647
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1648, var1649 = protoModule.writeTag(buff, var1638, 5, protoModule.wireTypes.lengthDelimited)
		var1648, var2495 = protoModule.writeString(var1648, var1649, self.prompt_id)
		buff = var1648
		var1638 = var1649
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1650, var1651 = protoModule.writeTag(buff, var1638, 6, protoModule.wireTypes.lengthDelimited)
		var1650, var2497 = protoModule.writeString(var1650, var1651, self.prompt_type)
		buff = var1650
		var1638 = var1651
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1638, 7, protoModule.wireTypes.lengthDelimited)
		var1652, var2499 = protoModule.writeString(var1652, var1653, self.sort_id)
		buff = var1652
		var1638 = var1653
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1638, 8, protoModule.wireTypes.lengthDelimited)
		var1654, var2501 = protoModule.writeString(var1654, var1655, self.feed_item_key)
		buff = var1654
		var1638 = var1655
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1656 = self.client_attributes.value:encode()
		local var1657, var1658 = protoModule.writeTag(buff, var1638, 9, protoModule.wireTypes.lengthDelimited)
		var1657, var2504 = protoModule.writeBuffer(var1657, var1658, var1656, buffer.len(var1656))
		buff = var1657
		var1638 = var1658
	end
	local buff_1 = buffer.create(var1638)
	buffer.copy(buff_1, 0, buff, 0, var1638)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1659 = t_56.new()
	local var1660 = 0
	while var1660 < buffer.len(p56) do
		local _ = nil
		local var1661 = nil
		local var1662, var1663, var1664 = protoModule.readTag(p56, var1660)
		local var1665 = var1662
		var1661 = var1663
		var1660 = var1664
		
		if var1661 == protoModule.wireTypes.varint then
			local _ = nil
			local var1666, var1667 = protoModule.readVarInt(p56, var1660)
			local _ = var1666
			var1660 = var1667
			continue
		end
		if var1661 == protoModule.wireTypes.lengthDelimited then
			if var1665 == 1 then
				local _ = nil
				local var1668, var1669 = protoModule.readBuffer(p56, var1660)
				var1660 = var1669
				var1659.title = buffer.tostring(var1668)
			elseif var1665 == 2 then
				local _ = nil
				local var1670, var1671 = protoModule.readBuffer(p56, var1660)
				var1660 = var1671
				var1659.dismiss_text = buffer.tostring(var1670)
			elseif var1665 == 3 then
				local _ = nil
				local var1672, var1673 = protoModule.readBuffer(p56, var1660)
				var1660 = var1673
				var1659.user_id = buffer.tostring(var1672)
			elseif var1665 == 4 then
				local _ = nil
				local var1674, var1675 = protoModule.readBuffer(p56, var1660)
				var1660 = var1675
				table.insert(var1659.cards, t.CardContainerCardInputData.decode(var1674))
			elseif var1665 == 5 then
				local _ = nil
				local var1676, var1677 = protoModule.readBuffer(p56, var1660)
				var1660 = var1677
				var1659.prompt_id = buffer.tostring(var1676)
			elseif var1665 == 6 then
				local _ = nil
				local var1678, var1679 = protoModule.readBuffer(p56, var1660)
				var1660 = var1679
				var1659.prompt_type = buffer.tostring(var1678)
			elseif var1665 == 7 then
				local _ = nil
				local var1680, var1681 = protoModule.readBuffer(p56, var1660)
				var1660 = var1681
				var1659.sort_id = buffer.tostring(var1680)
			elseif var1665 == 8 then
				local _ = nil
				local var1682, var1683 = protoModule.readBuffer(p56, var1660)
				var1660 = var1683
				var1659.feed_item_key = buffer.tostring(var1682)
			elseif var1665 == 9 then
				local _ = nil
				local var1684, var1685 = protoModule.readBuffer(p56, var1660)
				var1660 = var1685
				var1659.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1684)
				}
			else
				local _ = nil
				local var1686, var1687 = protoModule.readVarInt(p56, var1660)
				var1660 = var1687 + var1686
			end
		elseif var1661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1688, var1689 = protoModule.readFixed32(p56, var1660)
			local _ = var1688
			var1660 = var1689
		elseif var1661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1690, var1691 = protoModule.readFixed64(p56, var1660)
			local _ = var1690
			var1660 = var1691
		else
			error("Unsupported wire type: " .. var2508)
		end
	end
	return var1659
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
	local var1692 = t_56.new()
	
	if self.title ~= nil then
		var1692.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1692.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1692.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1692.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1692.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1692.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1692.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1692.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1692.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1692.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1692.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1692.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1692.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1692.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1692.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1692.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1692
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
	local var1693 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1693, 1, protoModule.wireTypes.lengthDelimited)
		var1694, var2546 = protoModule.writeString(var1694, var1695, self.title)
		buff = var1694
		var1693 = var1695
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1693, 2, protoModule.wireTypes.lengthDelimited)
		var1696, var2548 = protoModule.writeString(var1696, var1697, self.user_id)
		buff = var1696
		var1693 = var1697
	end
	if self.description ~= nil and self.description ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1693, 3, protoModule.wireTypes.lengthDelimited)
		var1698, var2550 = protoModule.writeString(var1698, var1699, self.description)
		buff = var1698
		var1693 = var1699
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1693, 4, protoModule.wireTypes.lengthDelimited)
		var1700, var2552 = protoModule.writeString(var1700, var1701, self.cta_text)
		buff = var1700
		var1693 = var1701
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1693, 5, protoModule.wireTypes.lengthDelimited)
		var1702, var2554 = protoModule.writeString(var1702, var1703, self.prompt_id)
		buff = var1702
		var1693 = var1703
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1704, var1705 = protoModule.writeTag(buff, var1693, 6, protoModule.wireTypes.lengthDelimited)
		var1704, var2556 = protoModule.writeString(var1704, var1705, self.prompt_type)
		buff = var1704
		var1693 = var1705
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1706, var1707 = protoModule.writeTag(buff, var1693, 7, protoModule.wireTypes.lengthDelimited)
		var1706, var2558 = protoModule.writeString(var1706, var1707, self.entity_id)
		buff = var1706
		var1693 = var1707
	end
	local buff_1 = buffer.create(var1693)
	buffer.copy(buff_1, 0, buff, 0, var1693)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1693 = t_57.new()
	local var1694 = 0
	while var1694 < buffer.len(p57) do
		local _ = nil
		local var1695 = nil
		local var1696, var1697, var1698 = protoModule.readTag(p57, var1694)
		local var1699 = var1696
		var1695 = var1697
		var1694 = var1698
		
		if var1695 == protoModule.wireTypes.varint then
			local _ = nil
			local var1700, var1701 = protoModule.readVarInt(p57, var1694)
			local _ = var1700
			var1694 = var1701
			continue
		end
		if var1695 == protoModule.wireTypes.lengthDelimited then
			if var1699 == 1 then
				local _ = nil
				local var1702, var1703 = protoModule.readBuffer(p57, var1694)
				var1694 = var1703
				var1693.title = buffer.tostring(var1702)
			elseif var1699 == 2 then
				local _ = nil
				local var1704, var1705 = protoModule.readBuffer(p57, var1694)
				var1694 = var1705
				var1693.user_id = buffer.tostring(var1704)
			elseif var1699 == 3 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p57, var1694)
				var1694 = var1707
				var1693.description = buffer.tostring(var1706)
			elseif var1699 == 4 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p57, var1694)
				var1694 = var1709
				var1693.cta_text = buffer.tostring(var1708)
			elseif var1699 == 5 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p57, var1694)
				var1694 = var1711
				var1693.prompt_id = buffer.tostring(var1710)
			elseif var1699 == 6 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p57, var1694)
				var1694 = var1713
				var1693.prompt_type = buffer.tostring(var1712)
			elseif var1699 == 7 then
				local _ = nil
				local var1714, var1715 = protoModule.readBuffer(p57, var1694)
				var1694 = var1715
				var1693.entity_id = buffer.tostring(var1714)
			else
				local _ = nil
				local var1716, var1717 = protoModule.readVarInt(p57, var1694)
				var1694 = var1717 + var1716
			end
		elseif var1695 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1718, var1719 = protoModule.readFixed32(p57, var1694)
			local _ = var1718
			var1694 = var1719
		elseif var1695 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1720, var1721 = protoModule.readFixed64(p57, var1694)
			local _ = var1720
			var1694 = var1721
		else
			error("Unsupported wire type: " .. var2562)
		end
	end
	return var1693
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
	local var1722 = t_57.new()
	
	if self.title ~= nil then
		var1722.title = self.title
	end
	if self.user_id ~= nil then
		var1722.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1722.user_id = self.userId
	end
	if self.description ~= nil then
		var1722.description = self.description
	end
	if self.cta_text ~= nil then
		var1722.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1722.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1722.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1722.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1722.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1722.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1722.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1722.entity_id = self.entityId
	end
	return var1722
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
	local var1722 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1723, var1724 = protoModule.writeTag(buff, var1722, 1, protoModule.wireTypes.lengthDelimited)
		var1723, var2594 = protoModule.writeString(var1723, var1724, self.prompt_id)
		buff = var1723
		var1722 = var1724
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1725, var1726 = protoModule.writeTag(buff, var1722, 2, protoModule.wireTypes.lengthDelimited)
		var1725, var2596 = protoModule.writeString(var1725, var1726, self.prompt_type)
		buff = var1725
		var1722 = var1726
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1727, var1728 = protoModule.writeTag(buff, var1722, 3, protoModule.wireTypes.lengthDelimited)
		var1727, var2598 = protoModule.writeString(var1727, var1728, self.user_id)
		buff = var1727
		var1722 = var1728
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1722, 4, protoModule.wireTypes.lengthDelimited)
		var1729, var2600 = protoModule.writeString(var1729, var1730, self.audit_data)
		buff = var1729
		var1722 = var1730
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
				var1722.prompt_id = buffer.tostring(var1731)
			elseif var1728 == 2 then
				local _ = nil
				local var1733, var1734 = protoModule.readBuffer(p58, var1723)
				var1723 = var1734
				var1722.prompt_type = buffer.tostring(var1733)
			elseif var1728 == 3 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p58, var1723)
				var1723 = var1736
				var1722.user_id = buffer.tostring(var1735)
			elseif var1728 == 4 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p58, var1723)
				var1723 = var1738
				var1722.audit_data = buffer.tostring(var1737)
			else
				local _ = nil
				local var1739, var1740 = protoModule.readVarInt(p58, var1723)
				var1723 = var1740 + var1739
			end
		elseif var1724 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1741, var1742 = protoModule.readFixed32(p58, var1723)
			local _ = var1741
			var1723 = var1742
		elseif var1724 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1743, var1744 = protoModule.readFixed64(p58, var1723)
			local _ = var1743
			var1723 = var1744
		else
			error("Unsupported wire type: " .. var2604)
		end
	end
	return var1722
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
	local var1745 = t_58.new()
	
	if self.prompt_id ~= nil then
		var1745.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1745.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1745.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1745.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1745.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1745.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1745.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1745.audit_data = self.auditData
	end
	return var1745
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
	local var1745 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1746, var1747 = protoModule.writeTag(buff, var1745, 1, protoModule.wireTypes.varint)
		var1746, var2630 = protoModule.writeVarInt(var1746, var1747, self.sender_count)
		buff = var1746
		var1745 = var1747
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1748, var1749 = protoModule.writeTag(buff, var1745, 2, protoModule.wireTypes.varint)
		var1748, var2632 = protoModule.writeVarInt(var1748, var1749, self.total_robux_amount)
		buff = var1748
		var1745 = var1749
	end
	local buff_1 = buffer.create(var1745)
	buffer.copy(buff_1, 0, buff, 0, var1745)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1745 = t_59.new()
	local var1746 = 0
	while var1746 < buffer.len(p59) do
		local _ = nil
		local _ = nil
		local var1747, var1748, var1749 = protoModule.readTag(p59, var1746)
		local var1750 = var1747
		local var1751 = var1748
		var1746 = var1749
		
		if var1751 == protoModule.wireTypes.varint then
			if var1750 == 1 then
				local _ = nil
				local var1752, var1753 = protoModule.readVarIntI32(p59, var1746)
				var1746 = var1753
				var1745.sender_count = var1752
			elseif var1750 == 2 then
				local _ = nil
				local var1754, var1755 = protoModule.readVarIntI64(p59, var1746)
				var1746 = var1755
				var1745.total_robux_amount = var1754
			else
				local _ = nil
				local var1756, var1757 = protoModule.readVarInt(p59, var1746)
				local _ = var1756
				var1746 = var1757
			end
		elseif var1751 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1758, var1759 = protoModule.readVarInt(p59, var1746)
			var1746 = var1759 + var1758
		elseif var1751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1760, var1761 = protoModule.readFixed32(p59, var1746)
			local _ = var1760
			var1746 = var1761
		elseif var1751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1762, var1763 = protoModule.readFixed64(p59, var1746)
			local _ = var1762
			var1746 = var1763
		else
			error("Unsupported wire type: " .. var2640)
		end
	end
	return var1745
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
	local var1764 = t_59.new()
	
	if self.sender_count ~= nil then
		var1764.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1764.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1764.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1764.total_robux_amount = self.totalRobuxAmount
	end
	return var1764
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
	local var1764 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1765, var1766 = protoModule.writeTag(buff, var1764, 1, protoModule.wireTypes.lengthDelimited)
		var1765, var2658 = protoModule.writeString(var1765, var1766, self.title)
		buff = var1765
		var1764 = var1766
	end
	if self.description ~= nil and self.description ~= "" then
		local var1767, var1768 = protoModule.writeTag(buff, var1764, 2, protoModule.wireTypes.lengthDelimited)
		var1767, var2660 = protoModule.writeString(var1767, var1768, self.description)
		buff = var1767
		var1764 = var1768
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1769, var1770 = protoModule.writeTag(buff, var1764, 3, protoModule.wireTypes.lengthDelimited)
		var1769, var2662 = protoModule.writeString(var1769, var1770, self.primary_text)
		buff = var1769
		var1764 = var1770
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1771, var1772 = protoModule.writeTag(buff, var1764, 4, protoModule.wireTypes.lengthDelimited)
		var1771, var2664 = protoModule.writeString(var1771, var1772, self.secondary_text)
		buff = var1771
		var1764 = var1772
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1773, var1774 = protoModule.writeTag(buff, var1764, 5, protoModule.wireTypes.lengthDelimited)
		var1773, var2666 = protoModule.writeString(var1773, var1774, self.prompt_id)
		buff = var1773
		var1764 = var1774
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1775, var1776 = protoModule.writeTag(buff, var1764, 6, protoModule.wireTypes.lengthDelimited)
		var1775, var2668 = protoModule.writeString(var1775, var1776, self.prompt_type)
		buff = var1775
		var1764 = var1776
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1777, var1778 = protoModule.writeTag(buff, var1764, 7, protoModule.wireTypes.varint)
		var1777, var2670 = protoModule.writeVarInt(var1777, var1778, self.times_seen)
		buff = var1777
		var1764 = var1778
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1779 = self.content.value:encode()
		local var1780, var1781 = protoModule.writeTag(buff, var1764, 8, protoModule.wireTypes.lengthDelimited)
		var1780, var2673 = protoModule.writeBuffer(var1780, var1781, var1779, buffer.len(var1779))
		buff = var1780
		var1764 = var1781
	end
	if self.sort_id ~= nil then
		local var1782, var1783 = protoModule.writeTag(buff, var1764, 9, protoModule.wireTypes.lengthDelimited)
		var1782, var2675 = protoModule.writeString(var1782, var1783, self.sort_id)
		buff = var1782
		var1764 = var1783
	end
	local buff_1 = buffer.create(var1764)
	buffer.copy(buff_1, 0, buff, 0, var1764)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1764 = t_60.new()
	local var1765 = 0
	while var1765 < buffer.len(p60) do
		local _ = nil
		local var1766 = nil
		local var1767, var1768, var1769 = protoModule.readTag(p60, var1765)
		local var1770 = var1767
		var1766 = var1768
		var1765 = var1769
		
		if var1766 == protoModule.wireTypes.varint then
			if var1770 == 7 then
				local _ = nil
				local var1771, var1772 = protoModule.readVarIntI32(p60, var1765)
				var1765 = var1772
				var1764.times_seen = var1771
			else
				local _ = nil
				local var1773, var1774 = protoModule.readVarInt(p60, var1765)
				local _ = var1773
				var1765 = var1774
			end
		end
		if var1766 == protoModule.wireTypes.lengthDelimited then
			if var1770 == 1 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p60, var1765)
				var1765 = var1776
				var1764.title = buffer.tostring(var1775)
			elseif var1770 == 2 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p60, var1765)
				var1765 = var1778
				var1764.description = buffer.tostring(var1777)
			elseif var1770 == 3 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p60, var1765)
				var1765 = var1780
				var1764.primary_text = buffer.tostring(var1779)
			elseif var1770 == 4 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p60, var1765)
				var1765 = var1782
				var1764.secondary_text = buffer.tostring(var1781)
			elseif var1770 == 5 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p60, var1765)
				var1765 = var1784
				var1764.prompt_id = buffer.tostring(var1783)
			elseif var1770 == 6 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p60, var1765)
				var1765 = var1786
				var1764.prompt_type = buffer.tostring(var1785)
			elseif var1770 == 8 then
				local _ = nil
				local var1787, var1788 = protoModule.readBuffer(p60, var1765)
				var1765 = var1788
				var1764.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1787)
				}
			elseif var1770 == 9 then
				local _ = nil
				local var1789, var1790 = protoModule.readBuffer(p60, var1765)
				var1765 = var1790
				var1764.sort_id = buffer.tostring(var1789)
			else
				local _ = nil
				local var1791, var1792 = protoModule.readVarInt(p60, var1765)
				var1765 = var1792 + var1791
			end
		elseif var1766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1793, var1794 = protoModule.readFixed32(p60, var1765)
			local _ = var1793
			var1765 = var1794
		elseif var1766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1795, var1796 = protoModule.readFixed64(p60, var1765)
			local _ = var1795
			var1765 = var1796
		else
			error("Unsupported wire type: " .. var2679)
		end
	end
	return var1764
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
	local var1797 = t_60.new()
	
	if self.title ~= nil then
		var1797.title = self.title
	end
	if self.description ~= nil then
		var1797.description = self.description
	end
	if self.primary_text ~= nil then
		var1797.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1797.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1797.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1797.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1797.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1797.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1797.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1797.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1797.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1797.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1797.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1797.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1797.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1797.sort_id = self.sortId
	end
	return var1797
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
	local var1797 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1798, var1799 = protoModule.writeTag(buff, var1797, 1, protoModule.wireTypes.lengthDelimited)
		var1798, var2715 = protoModule.writeString(var1798, var1799, self.tooltip_text)
		buff = var1798
		var1797 = var1799
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1800, var1801 = protoModule.writeTag(buff, var1797, 2, protoModule.wireTypes.lengthDelimited)
		var1800, var2717 = protoModule.writeString(var1800, var1801, self.prompt_id)
		buff = var1800
		var1797 = var1801
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1802, var1803 = protoModule.writeTag(buff, var1797, 3, protoModule.wireTypes.lengthDelimited)
		var1802, var2719 = protoModule.writeString(var1802, var1803, self.prompt_type)
		buff = var1802
		var1797 = var1803
	end
	local buff_1 = buffer.create(var1797)
	buffer.copy(buff_1, 0, buff, 0, var1797)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1797 = t_61.new()
	local var1798 = 0
	while var1798 < buffer.len(p61) do
		local _ = nil
		local var1799 = nil
		local var1800, var1801, var1802 = protoModule.readTag(p61, var1798)
		local var1803 = var1800
		var1799 = var1801
		var1798 = var1802
		
		if var1799 == protoModule.wireTypes.varint then
			local _ = nil
			local var1804, var1805 = protoModule.readVarInt(p61, var1798)
			local _ = var1804
			var1798 = var1805
			continue
		end
		if var1799 == protoModule.wireTypes.lengthDelimited then
			if var1803 == 1 then
				local _ = nil
				local var1806, var1807 = protoModule.readBuffer(p61, var1798)
				var1798 = var1807
				var1797.tooltip_text = buffer.tostring(var1806)
			elseif var1803 == 2 then
				local _ = nil
				local var1808, var1809 = protoModule.readBuffer(p61, var1798)
				var1798 = var1809
				var1797.prompt_id = buffer.tostring(var1808)
			elseif var1803 == 3 then
				local _ = nil
				local var1810, var1811 = protoModule.readBuffer(p61, var1798)
				var1798 = var1811
				var1797.prompt_type = buffer.tostring(var1810)
			else
				local _ = nil
				local var1812, var1813 = protoModule.readVarInt(p61, var1798)
				var1798 = var1813 + var1812
			end
		elseif var1799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1814, var1815 = protoModule.readFixed32(p61, var1798)
			local _ = var1814
			var1798 = var1815
		elseif var1799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1816, var1817 = protoModule.readFixed64(p61, var1798)
			local _ = var1816
			var1798 = var1817
		else
			error("Unsupported wire type: " .. var2723)
		end
	end
	return var1797
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
	local var1818 = t_61.new()
	
	if self.tooltip_text ~= nil then
		var1818.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1818.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1818.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1818.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1818.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1818.prompt_type = self.promptType
	end
	return var1818
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
	local var1818 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1819, var1820 = protoModule.writeTag(buff, var1818, 1, protoModule.wireTypes.lengthDelimited)
		var1819, var2747 = protoModule.writeString(var1819, var1820, self.media_id)
		buff = var1819
		var1818 = var1820
	end
	if self.title ~= nil and self.title ~= "" then
		local var1821, var1822 = protoModule.writeTag(buff, var1818, 2, protoModule.wireTypes.lengthDelimited)
		var1821, var2749 = protoModule.writeString(var1821, var1822, self.title)
		buff = var1821
		var1818 = var1822
	end
	if self.description ~= nil and self.description ~= "" then
		local var1823, var1824 = protoModule.writeTag(buff, var1818, 3, protoModule.wireTypes.lengthDelimited)
		var1823, var2751 = protoModule.writeString(var1823, var1824, self.description)
		buff = var1823
		var1818 = var1824
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1825, var1826 = protoModule.writeTag(buff, var1818, 4, protoModule.wireTypes.lengthDelimited)
		var1825, var2753 = protoModule.writeString(var1825, var1826, self.prompt_id)
		buff = var1825
		var1818 = var1826
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1827, var1828 = protoModule.writeTag(buff, var1818, 5, protoModule.wireTypes.lengthDelimited)
		var1827, var2755 = protoModule.writeString(var1827, var1828, self.prompt_type)
		buff = var1827
		var1818 = var1828
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1829, var1830 = protoModule.writeTag(buff, var1818, 6, protoModule.wireTypes.lengthDelimited)
		var1829, var2757 = protoModule.writeString(var1829, var1830, self.anchor_tag)
		buff = var1829
		var1818 = var1830
	end
	local buff_1 = buffer.create(var1818)
	buffer.copy(buff_1, 0, buff, 0, var1818)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1818 = t_62.new()
	local var1819 = 0
	while var1819 < buffer.len(p62) do
		local _ = nil
		local var1820 = nil
		local var1821, var1822, var1823 = protoModule.readTag(p62, var1819)
		local var1824 = var1821
		var1820 = var1822
		var1819 = var1823
		
		if var1820 == protoModule.wireTypes.varint then
			local _ = nil
			local var1825, var1826 = protoModule.readVarInt(p62, var1819)
			local _ = var1825
			var1819 = var1826
			continue
		end
		if var1820 == protoModule.wireTypes.lengthDelimited then
			if var1824 == 1 then
				local _ = nil
				local var1827, var1828 = protoModule.readBuffer(p62, var1819)
				var1819 = var1828
				var1818.media_id = buffer.tostring(var1827)
			elseif var1824 == 2 then
				local _ = nil
				local var1829, var1830 = protoModule.readBuffer(p62, var1819)
				var1819 = var1830
				var1818.title = buffer.tostring(var1829)
			elseif var1824 == 3 then
				local _ = nil
				local var1831, var1832 = protoModule.readBuffer(p62, var1819)
				var1819 = var1832
				var1818.description = buffer.tostring(var1831)
			elseif var1824 == 4 then
				local _ = nil
				local var1833, var1834 = protoModule.readBuffer(p62, var1819)
				var1819 = var1834
				var1818.prompt_id = buffer.tostring(var1833)
			elseif var1824 == 5 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p62, var1819)
				var1819 = var1836
				var1818.prompt_type = buffer.tostring(var1835)
			elseif var1824 == 6 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p62, var1819)
				var1819 = var1838
				var1818.anchor_tag = buffer.tostring(var1837)
			else
				local _ = nil
				local var1839, var1840 = protoModule.readVarInt(p62, var1819)
				var1819 = var1840 + var1839
			end
		elseif var1820 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1841, var1842 = protoModule.readFixed32(p62, var1819)
			local _ = var1841
			var1819 = var1842
		elseif var1820 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed64(p62, var1819)
			local _ = var1843
			var1819 = var1844
		else
			error("Unsupported wire type: " .. var2761)
		end
	end
	return var1818
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
	local var1845 = t_62.new()
	
	if self.media_id ~= nil then
		var1845.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1845.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1845.title = self.title
	end
	if self.description ~= nil then
		var1845.description = self.description
	end
	if self.prompt_id ~= nil then
		var1845.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1845.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1845.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1845.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1845.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1845.anchor_tag = self.anchorTag
	end
	return var1845
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
	local var1845 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1846, var1847 = protoModule.writeTag(buff, var1845, 1, protoModule.wireTypes.lengthDelimited)
		var1846, var2791 = protoModule.writeString(var1846, var1847, self.prompt_id)
		buff = var1846
		var1845 = var1847
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1848, var1849 = protoModule.writeTag(buff, var1845, 2, protoModule.wireTypes.lengthDelimited)
		var1848, var2793 = protoModule.writeString(var1848, var1849, self.prompt_type)
		buff = var1848
		var1845 = var1849
	end
	local buff_1 = buffer.create(var1845)
	buffer.copy(buff_1, 0, buff, 0, var1845)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1845 = t_63.new()
	local var1846 = 0
	while var1846 < buffer.len(p63) do
		local _ = nil
		local var1847 = nil
		local var1848, var1849, var1850 = protoModule.readTag(p63, var1846)
		local var1851 = var1848
		var1847 = var1849
		var1846 = var1850
		
		if var1847 == protoModule.wireTypes.varint then
			local _ = nil
			local var1852, var1853 = protoModule.readVarInt(p63, var1846)
			local _ = var1852
			var1846 = var1853
			continue
		end
		if var1847 == protoModule.wireTypes.lengthDelimited then
			if var1851 == 1 then
				local _ = nil
				local var1854, var1855 = protoModule.readBuffer(p63, var1846)
				var1846 = var1855
				var1845.prompt_id = buffer.tostring(var1854)
			elseif var1851 == 2 then
				local _ = nil
				local var1856, var1857 = protoModule.readBuffer(p63, var1846)
				var1846 = var1857
				var1845.prompt_type = buffer.tostring(var1856)
			else
				local _ = nil
				local var1858, var1859 = protoModule.readVarInt(p63, var1846)
				var1846 = var1859 + var1858
			end
		elseif var1847 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1860, var1861 = protoModule.readFixed32(p63, var1846)
			local _ = var1860
			var1846 = var1861
		elseif var1847 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1862, var1863 = protoModule.readFixed64(p63, var1846)
			local _ = var1862
			var1846 = var1863
		else
			error("Unsupported wire type: " .. var2797)
		end
	end
	return var1845
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
	local var1864 = t_63.new()
	
	if self.prompt_id ~= nil then
		var1864.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1864.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1864.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1864.prompt_type = self.promptType
	end
	return var1864
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
	local var1864 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1865, var1866 = protoModule.writeTag(buff, var1864, 1, protoModule.wireTypes.lengthDelimited)
		var1865, var2819 = protoModule.writeString(var1865, var1866, self.upsell_prompt)
		buff = var1865
		var1864 = var1866
	end
	local buff_1 = buffer.create(var1864)
	buffer.copy(buff_1, 0, buff, 0, var1864)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1864 = t_64.new()
	local var1865 = 0
	while var1865 < buffer.len(p64) do
		local _ = nil
		local var1866 = nil
		local var1867, var1868, var1869 = protoModule.readTag(p64, var1865)
		local var1870 = var1867
		var1866 = var1868
		var1865 = var1869
		
		if var1866 == protoModule.wireTypes.varint then
			local _ = nil
			local var1871, var1872 = protoModule.readVarInt(p64, var1865)
			local _ = var1871
			var1865 = var1872
			continue
		end
		if var1866 == protoModule.wireTypes.lengthDelimited then
			if var1870 == 1 then
				local _ = nil
				local var1873, var1874 = protoModule.readBuffer(p64, var1865)
				var1865 = var1874
				var1864.upsell_prompt = buffer.tostring(var1873)
			else
				local _ = nil
				local var1875, var1876 = protoModule.readVarInt(p64, var1865)
				var1865 = var1876 + var1875
			end
		elseif var1866 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1877, var1878 = protoModule.readFixed32(p64, var1865)
			local _ = var1877
			var1865 = var1878
		elseif var1866 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1879, var1880 = protoModule.readFixed64(p64, var1865)
			local _ = var1879
			var1865 = var1880
		else
			error("Unsupported wire type: " .. var2823)
		end
	end
	return var1864
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
	local var1881 = t_64.new()
	
	if self.upsell_prompt ~= nil then
		var1881.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1881.upsell_prompt = self.upsellPrompt
	end
	return var1881
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
	local var1881 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1882, var1883 = protoModule.writeTag(buff, var1881, 1, protoModule.wireTypes.lengthDelimited)
		var1882, var2843 = protoModule.writeString(var1882, var1883, self.modal_variant)
		buff = var1882
		var1881 = var1883
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1884, var1885 = protoModule.writeTag(buff, var1881, 2, protoModule.wireTypes.lengthDelimited)
		var1884, var2845 = protoModule.writeString(var1884, var1885, self.modal_sequence)
		buff = var1884
		var1881 = var1885
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1886, var1887 = protoModule.writeTag(buff, var1881, 3, protoModule.wireTypes.lengthDelimited)
		var1886, var2847 = protoModule.writeString(var1886, var1887, self.conversation_id)
		buff = var1886
		var1881 = var1887
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1888, var1889 = protoModule.writeTag(buff, var1881, 4, protoModule.wireTypes.lengthDelimited)
		var1888, var2849 = protoModule.writeString(var1888, var1889, self.friend_id)
		buff = var1888
		var1881 = var1889
	end
	local buff_1 = buffer.create(var1881)
	buffer.copy(buff_1, 0, buff, 0, var1881)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1881 = t_65.new()
	local var1882 = 0
	while var1882 < buffer.len(p65) do
		local _ = nil
		local var1883 = nil
		local var1884, var1885, var1886 = protoModule.readTag(p65, var1882)
		local var1887 = var1884
		var1883 = var1885
		var1882 = var1886
		
		if var1883 == protoModule.wireTypes.varint then
			local _ = nil
			local var1888, var1889 = protoModule.readVarInt(p65, var1882)
			local _ = var1888
			var1882 = var1889
			continue
		end
		if var1883 == protoModule.wireTypes.lengthDelimited then
			if var1887 == 1 then
				local _ = nil
				local var1890, var1891 = protoModule.readBuffer(p65, var1882)
				var1882 = var1891
				var1881.modal_variant = buffer.tostring(var1890)
			elseif var1887 == 2 then
				local _ = nil
				local var1892, var1893 = protoModule.readBuffer(p65, var1882)
				var1882 = var1893
				var1881.modal_sequence = buffer.tostring(var1892)
			elseif var1887 == 3 then
				local _ = nil
				local var1894, var1895 = protoModule.readBuffer(p65, var1882)
				var1882 = var1895
				var1881.conversation_id = buffer.tostring(var1894)
			elseif var1887 == 4 then
				local _ = nil
				local var1896, var1897 = protoModule.readBuffer(p65, var1882)
				var1882 = var1897
				var1881.friend_id = buffer.tostring(var1896)
			else
				local _ = nil
				local var1898, var1899 = protoModule.readVarInt(p65, var1882)
				var1882 = var1899 + var1898
			end
		elseif var1883 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1900, var1901 = protoModule.readFixed32(p65, var1882)
			local _ = var1900
			var1882 = var1901
		elseif var1883 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1902, var1903 = protoModule.readFixed64(p65, var1882)
			local _ = var1902
			var1882 = var1903
		else
			error("Unsupported wire type: " .. var2853)
		end
	end
	return var1881
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
	local var1904 = t_65.new()
	
	if self.modal_variant ~= nil then
		var1904.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1904.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1904.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1904.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1904.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1904.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1904.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1904.friend_id = self.friendId
	end
	return var1904
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
	local var1904 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1905, var1906 = protoModule.writeTag(buff, var1904, 1, protoModule.wireTypes.lengthDelimited)
		var1905, var2879 = protoModule.writeString(var1905, var1906, self.event_id)
		buff = var1905
		var1904 = var1906
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1907, var1908 = protoModule.writeTag(buff, var1904, 2, protoModule.wireTypes.lengthDelimited)
		var1907, var2881 = protoModule.writeString(var1907, var1908, self.universe_id)
		buff = var1907
		var1904 = var1908
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1909, var1910 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1909, var2883 = protoModule.writeString(var1909, var1910, i)
			local var1911 = v:encode()
			var1910, var2885 = protoModule.writeTag(var1909, var1910, 2, protoModule.wireTypes.lengthDelimited)
			var1910, var2885 = protoModule.writeBuffer(var1910, var2885, var1911, buffer.len(var1911))
			local var1912 = var1910
			local var1913 = var2885
			local var1914, var1915 = protoModule.writeTag(buff, var1904, 3, protoModule.wireTypes.lengthDelimited)
			var1914, var2889 = protoModule.writeBuffer(var1914, var1915, var1912, var1913)
			buff = var1914
			var1904 = var1915
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1916, var1917 = protoModule.writeTag(buff, var1904, 4, protoModule.wireTypes.lengthDelimited)
			var1916, var2891 = protoModule.writeString(var1916, var1917, v)
			buff = var1916
			var1904 = var1917
		end
	end
	local buff_1 = buffer.create(var1904)
	buffer.copy(buff_1, 0, buff, 0, var1904)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1918 = t_66.new()
	local var1919 = 0
	while var1919 < buffer.len(p66) do
		local _ = nil
		local var1920 = nil
		local var1921, var1922, var1923 = protoModule.readTag(p66, var1919)
		local var1924 = var1921
		var1920 = var1922
		var1919 = var1923
		
		if var1920 == protoModule.wireTypes.varint then
			local _ = nil
			local var1925, var1926 = protoModule.readVarInt(p66, var1919)
			local _ = var1925
			var1919 = var1926
			continue
		end
		if var1920 == protoModule.wireTypes.lengthDelimited then
			if var1924 == 1 then
				local _ = nil
				local var1927, var1928 = protoModule.readBuffer(p66, var1919)
				var1919 = var1928
				var1918.event_id = buffer.tostring(var1927)
			elseif var1924 == 2 then
				local _ = nil
				local var1929, var1930 = protoModule.readBuffer(p66, var1919)
				var1919 = var1930
				var1918.universe_id = buffer.tostring(var1929)
			elseif var1924 == 3 then
				local _ = nil
				local var1931, var1932 = protoModule.readBuffer(p66, var1919)
				var1919 = var1932
				var1931 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1931)
				var1918.entry_map[var1931.key or ""] = var1931.value or t.FeedEntry.new()
			elseif var1924 == 4 then
				local _ = nil
				local var1933, var1934 = protoModule.readBuffer(p66, var1919)
				var1919 = var1934
				table.insert(var1918.entry_order, buffer.tostring(var1933))
			else
				local _ = nil
				local var1935, var1936 = protoModule.readVarInt(p66, var1919)
				var1919 = var1936 + var1935
			end
		elseif var1920 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1937, var1938 = protoModule.readFixed32(p66, var1919)
			local _ = var1937
			var1919 = var1938
		elseif var1920 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1939, var1940 = protoModule.readFixed64(p66, var1919)
			local _ = var1939
			var1919 = var1940
		else
			error("Unsupported wire type: " .. var2895)
		end
	end
	return var1918
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
	local var1941 = t_66.new()
	
	if self.event_id ~= nil then
		var1941.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1941.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1941.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1941.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1941.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1941.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1941.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1941.entry_order = t_1
	end
	return var1941
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
	local var1942 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1943, var1944 = protoModule.writeTag(buff, var1942, 1, protoModule.wireTypes.lengthDelimited)
		var1943, var2927 = protoModule.writeString(var1943, var1944, self.key)
		buff = var1943
		var1942 = var1944
	end
	if self.value ~= nil then
		local var1945 = self.value:encode()
		local var1946, var1947 = protoModule.writeTag(buff, var1942, 2, protoModule.wireTypes.lengthDelimited)
		var1946, var2930 = protoModule.writeBuffer(var1946, var1947, var1945, buffer.len(var1945))
		buff = var1946
		var1942 = var1947
	end
	local buff_1 = buffer.create(var1942)
	buffer.copy(buff_1, 0, buff, 0, var1942)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1942 = t_67.new()
	local var1943 = 0
	while var1943 < buffer.len(p67) do
		local _ = nil
		local var1944 = nil
		local var1945, var1946, var1947 = protoModule.readTag(p67, var1943)
		local var1948 = var1945
		var1944 = var1946
		var1943 = var1947
		
		if var1944 == protoModule.wireTypes.varint then
			local _ = nil
			local var1949, var1950 = protoModule.readVarInt(p67, var1943)
			local _ = var1949
			var1943 = var1950
			continue
		end
		if var1944 == protoModule.wireTypes.lengthDelimited then
			if var1948 == 1 then
				local _ = nil
				local var1951, var1952 = protoModule.readBuffer(p67, var1943)
				var1943 = var1952
				var1942.key = buffer.tostring(var1951)
			elseif var1948 == 2 then
				local _ = nil
				local var1953, var1954 = protoModule.readBuffer(p67, var1943)
				var1943 = var1954
				var1942.value = t.FeedEntry.decode(var1953)
			else
				local _ = nil
				local var1955, var1956 = protoModule.readVarInt(p67, var1943)
				var1943 = var1956 + var1955
			end
		elseif var1944 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1957, var1958 = protoModule.readFixed32(p67, var1943)
			local _ = var1957
			var1943 = var1958
		elseif var1944 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1959, var1960 = protoModule.readFixed64(p67, var1943)
			local _ = var1959
			var1943 = var1960
		else
			error("Unsupported wire type: " .. var2934)
		end
	end
	return var1942
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
	local var1961 = t_67.new()
	
	if self.key ~= nil then
		var1961.key = self.key
	end
	if self.value ~= nil then
		var1961.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1961
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
	local var1961 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1962, var1963 = protoModule.writeTag(buff, var1961, 1, protoModule.wireTypes.lengthDelimited)
		var1962, var2956 = protoModule.writeString(var1962, var1963, self.event_id)
		buff = var1962
		var1961 = var1963
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1964, var1965 = protoModule.writeTag(buff, var1961, 2, protoModule.wireTypes.lengthDelimited)
		var1964, var2958 = protoModule.writeString(var1964, var1965, self.universe_id)
		buff = var1964
		var1961 = var1965
	end
	local buff_1 = buffer.create(var1961)
	buffer.copy(buff_1, 0, buff, 0, var1961)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1961 = t_68.new()
	local var1962 = 0
	while var1962 < buffer.len(p68) do
		local _ = nil
		local var1963 = nil
		local var1964, var1965, var1966 = protoModule.readTag(p68, var1962)
		local var1967 = var1964
		var1963 = var1965
		var1962 = var1966
		
		if var1963 == protoModule.wireTypes.varint then
			local _ = nil
			local var1968, var1969 = protoModule.readVarInt(p68, var1962)
			local _ = var1968
			var1962 = var1969
			continue
		end
		if var1963 == protoModule.wireTypes.lengthDelimited then
			if var1967 == 1 then
				local _ = nil
				local var1970, var1971 = protoModule.readBuffer(p68, var1962)
				var1962 = var1971
				var1961.event_id = buffer.tostring(var1970)
			elseif var1967 == 2 then
				local _ = nil
				local var1972, var1973 = protoModule.readBuffer(p68, var1962)
				var1962 = var1973
				var1961.universe_id = buffer.tostring(var1972)
			else
				local _ = nil
				local var1974, var1975 = protoModule.readVarInt(p68, var1962)
				var1962 = var1975 + var1974
			end
		elseif var1963 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1976, var1977 = protoModule.readFixed32(p68, var1962)
			local _ = var1976
			var1962 = var1977
		elseif var1963 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1978, var1979 = protoModule.readFixed64(p68, var1962)
			local _ = var1978
			var1962 = var1979
		else
			error("Unsupported wire type: " .. var2962)
		end
	end
	return var1961
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
	local var1980 = t_68.new()
	
	if self.event_id ~= nil then
		var1980.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1980.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1980.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1980.universe_id = self.universeId
	end
	return var1980
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
	local var1980 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1981, var1982 = protoModule.writeTag(buff, var1980, 1, protoModule.wireTypes.lengthDelimited)
		var1981, var2984 = protoModule.writeString(var1981, var1982, self.event_id)
		buff = var1981
		var1980 = var1982
	end
	local buff_1 = buffer.create(var1980)
	buffer.copy(buff_1, 0, buff, 0, var1980)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1980 = t_69.new()
	local var1981 = 0
	while var1981 < buffer.len(p69) do
		local _ = nil
		local var1982 = nil
		local var1983, var1984, var1985 = protoModule.readTag(p69, var1981)
		local var1986 = var1983
		var1982 = var1984
		var1981 = var1985
		
		if var1982 == protoModule.wireTypes.varint then
			local _ = nil
			local var1987, var1988 = protoModule.readVarInt(p69, var1981)
			local _ = var1987
			var1981 = var1988
			continue
		end
		if var1982 == protoModule.wireTypes.lengthDelimited then
			if var1986 == 1 then
				local _ = nil
				local var1989, var1990 = protoModule.readBuffer(p69, var1981)
				var1981 = var1990
				var1980.event_id = buffer.tostring(var1989)
			else
				local _ = nil
				local var1991, var1992 = protoModule.readVarInt(p69, var1981)
				var1981 = var1992 + var1991
			end
		elseif var1982 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1993, var1994 = protoModule.readFixed32(p69, var1981)
			local _ = var1993
			var1981 = var1994
		elseif var1982 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1995, var1996 = protoModule.readFixed64(p69, var1981)
			local _ = var1995
			var1981 = var1996
		else
			error("Unsupported wire type: " .. var2988)
		end
	end
	return var1980
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
	local var1997 = t_69.new()
	
	if self.event_id ~= nil then
		var1997.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1997.event_id = self.eventId
	end
	return var1997
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
	local var1997 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1998, var1999 = protoModule.writeTag(buff, var1997, 1, protoModule.wireTypes.lengthDelimited)
		var1998, var3008 = protoModule.writeString(var1998, var1999, self.event_id)
		buff = var1998
		var1997 = var1999
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2000, var2001 = protoModule.writeTag(buff, var1997, 2, protoModule.wireTypes.lengthDelimited)
		var2000, var3010 = protoModule.writeString(var2000, var2001, self.universe_id)
		buff = var2000
		var1997 = var2001
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2002 = v:encode()
			local var2003, var2004 = protoModule.writeTag(buff, var1997, 3, protoModule.wireTypes.lengthDelimited)
			var2003, var3013 = protoModule.writeBuffer(var2003, var2004, var2002, buffer.len(var2002))
			buff = var2003
			var1997 = var2004
		end
	end
	local buff_1 = buffer.create(var1997)
	buffer.copy(buff_1, 0, buff, 0, var1997)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var2005 = t_70.new()
	local var2006 = 0
	while var2006 < buffer.len(p70) do
		local _ = nil
		local var2007 = nil
		local var2008, var2009, var2010 = protoModule.readTag(p70, var2006)
		local var2011 = var2008
		var2007 = var2009
		var2006 = var2010
		
		if var2007 == protoModule.wireTypes.varint then
			local _ = nil
			local var2012, var2013 = protoModule.readVarInt(p70, var2006)
			local _ = var2012
			var2006 = var2013
			continue
		end
		if var2007 == protoModule.wireTypes.lengthDelimited then
			if var2011 == 1 then
				local _ = nil
				local var2014, var2015 = protoModule.readBuffer(p70, var2006)
				var2006 = var2015
				var2005.event_id = buffer.tostring(var2014)
			elseif var2011 == 2 then
				local _ = nil
				local var2016, var2017 = protoModule.readBuffer(p70, var2006)
				var2006 = var2017
				var2005.universe_id = buffer.tostring(var2016)
			elseif var2011 == 3 then
				local _ = nil
				local var2018, var2019 = protoModule.readBuffer(p70, var2006)
				var2006 = var2019
				table.insert(var2005.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2018))
			else
				local _ = nil
				local var2020, var2021 = protoModule.readVarInt(p70, var2006)
				var2006 = var2021 + var2020
			end
		elseif var2007 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed32(p70, var2006)
			local _ = var2022
			var2006 = var2023
		elseif var2007 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2024, var2025 = protoModule.readFixed64(p70, var2006)
			local _ = var2024
			var2006 = var2025
		else
			error("Unsupported wire type: " .. var3017)
		end
	end
	return var2005
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
	local var2026 = t_70.new()
	
	if self.event_id ~= nil then
		var2026.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2026.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2026.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2026.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2026.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2026.rsvp_users = t_1
	end
	return var2026
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
	local var2027 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2028, var2029 = protoModule.writeTag(buff, var2027, 1, protoModule.wireTypes.varint)
		var2028, var3044 = protoModule.writeVarInt(var2028, var2029, self.user_id)
		buff = var2028
		var2027 = var2029
	end
	local buff_1 = buffer.create(var2027)
	buffer.copy(buff_1, 0, buff, 0, var2027)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2027 = t_71.new()
	local var2028 = 0
	while var2028 < buffer.len(p71) do
		local _ = nil
		local _ = nil
		local var2029, var2030, var2031 = protoModule.readTag(p71, var2028)
		local var2032 = var2029
		local var2033 = var2030
		var2028 = var2031
		
		if var2033 == protoModule.wireTypes.varint then
			if var2032 == 1 then
				local _ = nil
				local var2034, var2035 = protoModule.readVarIntI64(p71, var2028)
				var2028 = var2035
				var2027.user_id = var2034
			else
				local _ = nil
				local var2036, var2037 = protoModule.readVarInt(p71, var2028)
				local _ = var2036
				var2028 = var2037
			end
		elseif var2033 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2038, var2039 = protoModule.readVarInt(p71, var2028)
			var2028 = var2039 + var2038
		elseif var2033 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2040, var2041 = protoModule.readFixed32(p71, var2028)
			local _ = var2040
			var2028 = var2041
		elseif var2033 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2042, var2043 = protoModule.readFixed64(p71, var2028)
			local _ = var2042
			var2028 = var2043
		else
			error("Unsupported wire type: " .. var3052)
		end
	end
	return var2027
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
	local var2044 = t_71.new()
	
	if self.user_id ~= nil then
		var2044.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2044.user_id = self.userId
	end
	return var2044
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
	local var2044 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2045, var2046 = protoModule.writeTag(buff, var2044, 1, protoModule.wireTypes.lengthDelimited)
		var2045, var3068 = protoModule.writeString(var2045, var2046, self.event_id)
		buff = var2045
		var2044 = var2046
	end
	local buff_1 = buffer.create(var2044)
	buffer.copy(buff_1, 0, buff, 0, var2044)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2044 = t_72.new()
	local var2045 = 0
	while var2045 < buffer.len(p72) do
		local _ = nil
		local var2046 = nil
		local var2047, var2048, var2049 = protoModule.readTag(p72, var2045)
		local var2050 = var2047
		var2046 = var2048
		var2045 = var2049
		
		if var2046 == protoModule.wireTypes.varint then
			local _ = nil
			local var2051, var2052 = protoModule.readVarInt(p72, var2045)
			local _ = var2051
			var2045 = var2052
			continue
		end
		if var2046 == protoModule.wireTypes.lengthDelimited then
			if var2050 == 1 then
				local _ = nil
				local var2053, var2054 = protoModule.readBuffer(p72, var2045)
				var2045 = var2054
				var2044.event_id = buffer.tostring(var2053)
			else
				local _ = nil
				local var2055, var2056 = protoModule.readVarInt(p72, var2045)
				var2045 = var2056 + var2055
			end
		elseif var2046 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2057, var2058 = protoModule.readFixed32(p72, var2045)
			local _ = var2057
			var2045 = var2058
		elseif var2046 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2059, var2060 = protoModule.readFixed64(p72, var2045)
			local _ = var2059
			var2045 = var2060
		else
			error("Unsupported wire type: " .. var3072)
		end
	end
	return var2044
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
	local var2061 = t_72.new()
	
	if self.event_id ~= nil then
		var2061.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2061.event_id = self.eventId
	end
	return var2061
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
	local var2061 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2062, var2063 = protoModule.writeTag(buff, var2061, 1, protoModule.wireTypes.lengthDelimited)
		var2062, var3092 = protoModule.writeString(var2062, var2063, self.event_id)
		buff = var2062
		var2061 = var2063
	end
	local buff_1 = buffer.create(var2061)
	buffer.copy(buff_1, 0, buff, 0, var2061)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2061 = t_73.new()
	local var2062 = 0
	while var2062 < buffer.len(p73) do
		local _ = nil
		local var2063 = nil
		local var2064, var2065, var2066 = protoModule.readTag(p73, var2062)
		local var2067 = var2064
		var2063 = var2065
		var2062 = var2066
		
		if var2063 == protoModule.wireTypes.varint then
			local _ = nil
			local var2068, var2069 = protoModule.readVarInt(p73, var2062)
			local _ = var2068
			var2062 = var2069
			continue
		end
		if var2063 == protoModule.wireTypes.lengthDelimited then
			if var2067 == 1 then
				local _ = nil
				local var2070, var2071 = protoModule.readBuffer(p73, var2062)
				var2062 = var2071
				var2061.event_id = buffer.tostring(var2070)
			else
				local _ = nil
				local var2072, var2073 = protoModule.readVarInt(p73, var2062)
				var2062 = var2073 + var2072
			end
		elseif var2063 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2074, var2075 = protoModule.readFixed32(p73, var2062)
			local _ = var2074
			var2062 = var2075
		elseif var2063 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2076, var2077 = protoModule.readFixed64(p73, var2062)
			local _ = var2076
			var2062 = var2077
		else
			error("Unsupported wire type: " .. var3096)
		end
	end
	return var2061
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
	local var2078 = t_73.new()
	
	if self.event_id ~= nil then
		var2078.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2078.event_id = self.eventId
	end
	return var2078
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
	local var2078 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2079, var2080 = protoModule.writeTag(buff, var2078, 1, protoModule.wireTypes.lengthDelimited)
		var2079, var3116 = protoModule.writeString(var2079, var2080, self.event_id)
		buff = var2079
		var2078 = var2080
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2081, var2082 = protoModule.writeTag(buff, var2078, 2, protoModule.wireTypes.lengthDelimited)
		var2081, var3118 = protoModule.writeString(var2081, var2082, self.universe_id)
		buff = var2081
		var2078 = var2082
	end
	local buff_1 = buffer.create(var2078)
	buffer.copy(buff_1, 0, buff, 0, var2078)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref)
	local var2078 = t_74.new()
	local var2079 = 0
	while var2079 < buffer.len(p74) do
		local _ = nil
		local var2080 = nil
		local var2081, var2082, var2083 = protoModule.readTag(p74, var2079)
		local var2084 = var2081
		var2080 = var2082
		var2079 = var2083
		
		if var2080 == protoModule.wireTypes.varint then
			local _ = nil
			local var2085, var2086 = protoModule.readVarInt(p74, var2079)
			local _ = var2085
			var2079 = var2086
			continue
		end
		if var2080 == protoModule.wireTypes.lengthDelimited then
			if var2084 == 1 then
				local _ = nil
				local var2087, var2088 = protoModule.readBuffer(p74, var2079)
				var2079 = var2088
				var2078.event_id = buffer.tostring(var2087)
			elseif var2084 == 2 then
				local _ = nil
				local var2089, var2090 = protoModule.readBuffer(p74, var2079)
				var2079 = var2090
				var2078.universe_id = buffer.tostring(var2089)
			else
				local _ = nil
				local var2091, var2092 = protoModule.readVarInt(p74, var2079)
				var2079 = var2092 + var2091
			end
		elseif var2080 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2093, var2094 = protoModule.readFixed32(p74, var2079)
			local _ = var2093
			var2079 = var2094
		elseif var2080 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2095, var2096 = protoModule.readFixed64(p74, var2079)
			local _ = var2095
			var2079 = var2096
		else
			error("Unsupported wire type: " .. var3122)
		end
	end
	return var2078
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
	local var2097 = t_74.new()
	
	if self.event_id ~= nil then
		var2097.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2097.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2097.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2097.universe_id = self.universeId
	end
	return var2097
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
	local var2097 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2098, var2099 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2098, var3144 = protoModule.writeString(var2098, var2099, i)
			local var2100 = v:encode()
			var2099, var3146 = protoModule.writeTag(var2098, var2099, 2, protoModule.wireTypes.lengthDelimited)
			var2099, var3146 = protoModule.writeBuffer(var2099, var3146, var2100, buffer.len(var2100))
			local var2101 = var2099
			local var2102 = var3146
			local var2103, var2104 = protoModule.writeTag(buff, var2097, 1, protoModule.wireTypes.lengthDelimited)
			var2103, var3150 = protoModule.writeBuffer(var2103, var2104, var2101, var2102)
			buff = var2103
			var2097 = var2104
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2105, var2106 = protoModule.writeTag(buff, var2097, 2, protoModule.wireTypes.lengthDelimited)
			var2105, var3152 = protoModule.writeString(var2105, var2106, v)
			buff = var2105
			var2097 = var2106
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2107, var2108 = protoModule.writeTag(buff, var2097, 3, protoModule.wireTypes.lengthDelimited)
		var2107, var3154 = protoModule.writeString(var2107, var2108, self.next_page_token)
		buff = var2107
		var2097 = var2108
	end
	if self.sticky_filter_pills ~= nil then
		local var2109 = self.sticky_filter_pills:encode()
		local var2110, var2111 = protoModule.writeTag(buff, var2097, 4, protoModule.wireTypes.lengthDelimited)
		var2110, var3157 = protoModule.writeBuffer(var2110, var2111, var2109, buffer.len(var2109))
		buff = var2110
		var2097 = var2111
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2112, var2113 = protoModule.writeTag(buff, var2097, 5, protoModule.wireTypes.lengthDelimited)
		var2112, var3159 = protoModule.writeString(var2112, var2113, self.applied_filters)
		buff = var2112
		var2097 = var2113
	end
	local buff_1 = buffer.create(var2097)
	buffer.copy(buff_1, 0, buff, 0, var2097)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2114 = t_75.new()
	local var2115 = 0
	while var2115 < buffer.len(p75) do
		local _ = nil
		local var2116 = nil
		local var2117, var2118, var2119 = protoModule.readTag(p75, var2115)
		local var2120 = var2117
		var2116 = var2118
		var2115 = var2119
		
		if var2116 == protoModule.wireTypes.varint then
			local _ = nil
			local var2121, var2122 = protoModule.readVarInt(p75, var2115)
			local _ = var2121
			var2115 = var2122
			continue
		end
		if var2116 == protoModule.wireTypes.lengthDelimited then
			if var2120 == 1 then
				local _ = nil
				local var2123, var2124 = protoModule.readBuffer(p75, var2115)
				var2115 = var2124
				var2123 = t.ChartsFeedInputData_EntryMapEntry.decode(var2123)
				var2114.entry_map[var2123.key or ""] = var2123.value or t.FeedEntry.new()
			elseif var2120 == 2 then
				local _ = nil
				local var2125, var2126 = protoModule.readBuffer(p75, var2115)
				var2115 = var2126
				table.insert(var2114.entry_order, buffer.tostring(var2125))
			elseif var2120 == 3 then
				local _ = nil
				local var2127, var2128 = protoModule.readBuffer(p75, var2115)
				var2115 = var2128
				var2114.next_page_token = buffer.tostring(var2127)
			elseif var2120 == 4 then
				local _ = nil
				local var2129, var2130 = protoModule.readBuffer(p75, var2115)
				var2115 = var2130
				var2114.sticky_filter_pills = t.FilterPillsInputData.decode(var2129)
			elseif var2120 == 5 then
				local _ = nil
				local var2131, var2132 = protoModule.readBuffer(p75, var2115)
				var2115 = var2132
				var2114.applied_filters = buffer.tostring(var2131)
			else
				local _ = nil
				local var2133, var2134 = protoModule.readVarInt(p75, var2115)
				var2115 = var2134 + var2133
			end
		elseif var2116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2135, var2136 = protoModule.readFixed32(p75, var2115)
			local _ = var2135
			var2115 = var2136
		elseif var2116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2137, var2138 = protoModule.readFixed64(p75, var2115)
			local _ = var2137
			var2115 = var2138
		else
			error("Unsupported wire type: " .. var3163)
		end
	end
	return var2114
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
	local var2139 = t_75.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2139.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2139.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2139.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2139.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2139.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2139.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2139.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2139.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2139.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2139.applied_filters = self.appliedFilters
	end
	return var2139
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
	local var2140 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2141, var2142 = protoModule.writeTag(buff, var2140, 1, protoModule.wireTypes.lengthDelimited)
		var2141, var3197 = protoModule.writeString(var2141, var2142, self.key)
		buff = var2141
		var2140 = var2142
	end
	if self.value ~= nil then
		local var2143 = self.value:encode()
		local var2144, var2145 = protoModule.writeTag(buff, var2140, 2, protoModule.wireTypes.lengthDelimited)
		var2144, var3200 = protoModule.writeBuffer(var2144, var2145, var2143, buffer.len(var2143))
		buff = var2144
		var2140 = var2145
	end
	local buff_1 = buffer.create(var2140)
	buffer.copy(buff_1, 0, buff, 0, var2140)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2140 = t_76.new()
	local var2141 = 0
	while var2141 < buffer.len(p76) do
		local _ = nil
		local var2142 = nil
		local var2143, var2144, var2145 = protoModule.readTag(p76, var2141)
		local var2146 = var2143
		var2142 = var2144
		var2141 = var2145
		
		if var2142 == protoModule.wireTypes.varint then
			local _ = nil
			local var2147, var2148 = protoModule.readVarInt(p76, var2141)
			local _ = var2147
			var2141 = var2148
			continue
		end
		if var2142 == protoModule.wireTypes.lengthDelimited then
			if var2146 == 1 then
				local _ = nil
				local var2149, var2150 = protoModule.readBuffer(p76, var2141)
				var2141 = var2150
				var2140.key = buffer.tostring(var2149)
			elseif var2146 == 2 then
				local _ = nil
				local var2151, var2152 = protoModule.readBuffer(p76, var2141)
				var2141 = var2152
				var2140.value = t.FeedEntry.decode(var2151)
			else
				local _ = nil
				local var2153, var2154 = protoModule.readVarInt(p76, var2141)
				var2141 = var2154 + var2153
			end
		elseif var2142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2155, var2156 = protoModule.readFixed32(p76, var2141)
			local _ = var2155
			var2141 = var2156
		elseif var2142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2157, var2158 = protoModule.readFixed64(p76, var2141)
			local _ = var2157
			var2141 = var2158
		else
			error("Unsupported wire type: " .. var3204)
		end
	end
	return var2140
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
	local var2159 = t_76.new()
	
	if self.key ~= nil then
		var2159.key = self.key
	end
	if self.value ~= nil then
		var2159.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2159
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
	local var2159 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2160 = v:encode()
			local var2161, var2162 = protoModule.writeTag(buff, var2159, 1, protoModule.wireTypes.lengthDelimited)
			var2161, var3227 = protoModule.writeBuffer(var2161, var2162, var2160, buffer.len(var2160))
			buff = var2161
			var2159 = var2162
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2163, var2164 = protoModule.writeTag(buff, var2159, 2, protoModule.wireTypes.lengthDelimited)
		var2163, var3229 = protoModule.writeString(var2163, var2164, self.sort_id)
		buff = var2163
		var2159 = var2164
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2165, var2166 = protoModule.writeTag(buff, var2159, 3, protoModule.wireTypes.varint)
		var2165, var3231 = protoModule.writeVarInt(var2165, var2166, self.secondary_sort_id)
		buff = var2165
		var2159 = var2166
	end
	if self.title ~= nil and self.title ~= "" then
		local var2167, var2168 = protoModule.writeTag(buff, var2159, 4, protoModule.wireTypes.lengthDelimited)
		var2167, var3233 = protoModule.writeString(var2167, var2168, self.title)
		buff = var2167
		var2159 = var2168
	end
	if self.primary_sort_id ~= nil then
		local var2169, var2170 = protoModule.writeTag(buff, var2159, 5, protoModule.wireTypes.varint)
		var2169, var3235 = protoModule.writeVarInt(var2169, var2170, self.primary_sort_id)
		buff = var2169
		var2159 = var2170
	end
	if self.applied_filters ~= nil then
		local var2171, var2172 = protoModule.writeTag(buff, var2159, 6, protoModule.wireTypes.lengthDelimited)
		var2171, var3237 = protoModule.writeString(var2171, var2172, self.applied_filters)
		buff = var2171
		var2159 = var2172
	end
	local buff_1 = buffer.create(var2159)
	buffer.copy(buff_1, 0, buff, 0, var2159)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2173 = t_77.new()
	local var2174 = 0
	while var2174 < buffer.len(p77) do
		local _ = nil
		local var2175 = nil
		local var2176, var2177, var2178 = protoModule.readTag(p77, var2174)
		local var2179 = var2176
		var2175 = var2177
		var2174 = var2178
		
		if var2175 == protoModule.wireTypes.varint then
			if var2179 == 3 then
				local _ = nil
				local var2180, var2181 = protoModule.readVarIntI32(p77, var2174)
				var2174 = var2181
				var2173.secondary_sort_id = var2180
			elseif var2179 == 5 then
				local _ = nil
				local var2182, var2183 = protoModule.readVarIntI32(p77, var2174)
				var2174 = var2183
				var2173.primary_sort_id = var2182
			else
				local _ = nil
				local var2184, var2185 = protoModule.readVarInt(p77, var2174)
				local _ = var2184
				var2174 = var2185
			end
		end
		if var2175 == protoModule.wireTypes.lengthDelimited then
			if var2179 == 1 then
				local _ = nil
				local var2186, var2187 = protoModule.readBuffer(p77, var2174)
				var2174 = var2187
				table.insert(var2173.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2186))
			elseif var2179 == 2 then
				local _ = nil
				local var2188, var2189 = protoModule.readBuffer(p77, var2174)
				var2174 = var2189
				var2173.sort_id = buffer.tostring(var2188)
			elseif var2179 == 4 then
				local _ = nil
				local var2190, var2191 = protoModule.readBuffer(p77, var2174)
				var2174 = var2191
				var2173.title = buffer.tostring(var2190)
			elseif var2179 == 6 then
				local _ = nil
				local var2192, var2193 = protoModule.readBuffer(p77, var2174)
				var2174 = var2193
				var2173.applied_filters = buffer.tostring(var2192)
			else
				local _ = nil
				local var2194, var2195 = protoModule.readVarInt(p77, var2174)
				var2174 = var2195 + var2194
			end
		elseif var2175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2196, var2197 = protoModule.readFixed32(p77, var2174)
			local _ = var2196
			var2174 = var2197
		elseif var2175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2198, var2199 = protoModule.readFixed64(p77, var2174)
			local _ = var2198
			var2174 = var2199
		else
			error("Unsupported wire type: " .. var3241)
		end
	end
	return var2173
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
	local var2200 = t_77.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2200.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2200.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2200.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2200.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2200.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2200.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2200.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2200.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2200.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2200.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2200.applied_filters = self.appliedFilters
	end
	return var2200
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
	local var2201 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2202, var2203 = protoModule.writeTag(buff, var2201, 1, protoModule.wireTypes.lengthDelimited)
		var2202, var3274 = protoModule.writeString(var2202, var2203, self.filter_id)
		buff = var2202
		var2201 = var2203
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2204, var2205 = protoModule.writeTag(buff, var2201, 2, protoModule.wireTypes.lengthDelimited)
		var2204, var3276 = protoModule.writeString(var2204, var2205, self.display_name)
		buff = var2204
		var2201 = var2205
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2206 = v:encode()
			local var2207, var2208 = protoModule.writeTag(buff, var2201, 3, protoModule.wireTypes.lengthDelimited)
			var2207, var3279 = protoModule.writeBuffer(var2207, var2208, var2206, buffer.len(var2206))
			buff = var2207
			var2201 = var2208
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2209, var2210 = protoModule.writeTag(buff, var2201, 4, protoModule.wireTypes.lengthDelimited)
		var2209, var3281 = protoModule.writeString(var2209, var2210, self.default_option_id)
		buff = var2209
		var2201 = var2210
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2211, var2212 = protoModule.writeTag(buff, var2201, 5, protoModule.wireTypes.lengthDelimited)
		var2211, var3283 = protoModule.writeString(var2211, var2212, self.selected_option_id)
		buff = var2211
		var2201 = var2212
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2213, var2214 = protoModule.writeTag(buff, var2201, 6, protoModule.wireTypes.lengthDelimited)
		var2213, var3285 = protoModule.writeString(var2213, var2214, self.filter_type)
		buff = var2213
		var2201 = var2214
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2215, var2216 = protoModule.writeTag(buff, var2201, 7, protoModule.wireTypes.lengthDelimited)
			var2215, var3287 = protoModule.writeString(var2215, var2216, v)
			buff = var2215
			var2201 = var2216
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2217, var2218 = protoModule.writeTag(buff, var2201, 8, protoModule.wireTypes.lengthDelimited)
		var2217, var3289 = protoModule.writeString(var2217, var2218, self.info_text)
		buff = var2217
		var2201 = var2218
	end
	local buff_1 = buffer.create(var2201)
	buffer.copy(buff_1, 0, buff, 0, var2201)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2219 = t_78.new()
	local var2220 = 0
	while var2220 < buffer.len(p78) do
		local _ = nil
		local var2221 = nil
		local var2222, var2223, var2224 = protoModule.readTag(p78, var2220)
		local var2225 = var2222
		var2221 = var2223
		var2220 = var2224
		
		if var2221 == protoModule.wireTypes.varint then
			local _ = nil
			local var2226, var2227 = protoModule.readVarInt(p78, var2220)
			local _ = var2226
			var2220 = var2227
			continue
		end
		if var2221 == protoModule.wireTypes.lengthDelimited then
			if var2225 == 1 then
				local _ = nil
				local var2228, var2229 = protoModule.readBuffer(p78, var2220)
				var2220 = var2229
				var2219.filter_id = buffer.tostring(var2228)
			elseif var2225 == 2 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p78, var2220)
				var2220 = var2231
				var2219.display_name = buffer.tostring(var2230)
			elseif var2225 == 3 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p78, var2220)
				var2220 = var2233
				table.insert(var2219.options, t.FilterPillsInputData_FilterOption.decode(var2232))
			elseif var2225 == 4 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p78, var2220)
				var2220 = var2235
				var2219.default_option_id = buffer.tostring(var2234)
			elseif var2225 == 5 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p78, var2220)
				var2220 = var2237
				var2219.selected_option_id = buffer.tostring(var2236)
			elseif var2225 == 6 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p78, var2220)
				var2220 = var2239
				var2219.filter_type = buffer.tostring(var2238)
			elseif var2225 == 7 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p78, var2220)
				var2220 = var2241
				table.insert(var2219.inactive_option_ids, buffer.tostring(var2240))
			elseif var2225 == 8 then
				local _ = nil
				local var2242, var2243 = protoModule.readBuffer(p78, var2220)
				var2220 = var2243
				var2219.info_text = buffer.tostring(var2242)
			else
				local _ = nil
				local var2244, var2245 = protoModule.readVarInt(p78, var2220)
				var2220 = var2245 + var2244
			end
		elseif var2221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2246, var2247 = protoModule.readFixed32(p78, var2220)
			local _ = var2246
			var2220 = var2247
		elseif var2221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2248, var2249 = protoModule.readFixed64(p78, var2220)
			local _ = var2248
			var2220 = var2249
		else
			error("Unsupported wire type: " .. var3293)
		end
	end
	return var2219
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
	local var2250 = t_78.new()
	
	if self.filter_id ~= nil then
		var2250.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2250.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2250.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2250.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2250.options = t_1
	end
	if self.default_option_id ~= nil then
		var2250.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2250.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2250.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2250.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2250.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2250.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2250.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2250.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2250.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2250.info_text = self.infoText
	end
	return var2250
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
	local var2251 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2252, var2253 = protoModule.writeTag(buff, var2251, 1, protoModule.wireTypes.lengthDelimited)
		var2252, var3332 = protoModule.writeString(var2252, var2253, self.option_id)
		buff = var2252
		var2251 = var2253
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2254, var2255 = protoModule.writeTag(buff, var2251, 2, protoModule.wireTypes.lengthDelimited)
		var2254, var3334 = protoModule.writeString(var2254, var2255, self.display_name)
		buff = var2254
		var2251 = var2255
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2256, var2257 = protoModule.writeTag(buff, var2251, 3, protoModule.wireTypes.lengthDelimited)
		var2256, var3336 = protoModule.writeString(var2256, var2257, self.option_context_tag)
		buff = var2256
		var2251 = var2257
	end
	local buff_1 = buffer.create(var2251)
	buffer.copy(buff_1, 0, buff, 0, var2251)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref)
	local var2251 = t_79.new()
	local var2252 = 0
	while var2252 < buffer.len(p79) do
		local _ = nil
		local var2253 = nil
		local var2254, var2255, var2256 = protoModule.readTag(p79, var2252)
		local var2257 = var2254
		var2253 = var2255
		var2252 = var2256
		
		if var2253 == protoModule.wireTypes.varint then
			local _ = nil
			local var2258, var2259 = protoModule.readVarInt(p79, var2252)
			local _ = var2258
			var2252 = var2259
			continue
		end
		if var2253 == protoModule.wireTypes.lengthDelimited then
			if var2257 == 1 then
				local _ = nil
				local var2260, var2261 = protoModule.readBuffer(p79, var2252)
				var2252 = var2261
				var2251.option_id = buffer.tostring(var2260)
			elseif var2257 == 2 then
				local _ = nil
				local var2262, var2263 = protoModule.readBuffer(p79, var2252)
				var2252 = var2263
				var2251.display_name = buffer.tostring(var2262)
			elseif var2257 == 3 then
				local _ = nil
				local var2264, var2265 = protoModule.readBuffer(p79, var2252)
				var2252 = var2265
				var2251.option_context_tag = buffer.tostring(var2264)
			else
				local _ = nil
				local var2266, var2267 = protoModule.readVarInt(p79, var2252)
				var2252 = var2267 + var2266
			end
		elseif var2253 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2268, var2269 = protoModule.readFixed32(p79, var2252)
			local _ = var2268
			var2252 = var2269
		elseif var2253 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2270, var2271 = protoModule.readFixed64(p79, var2252)
			local _ = var2270
			var2252 = var2271
		else
			error("Unsupported wire type: " .. var3340)
		end
	end
	return var2251
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
	local var2272 = t_79.new()
	
	if self.option_id ~= nil then
		var2272.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2272.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2272.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2272.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2272.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2272.option_context_tag = self.optionContextTag
	end
	return var2272
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
	local var2272 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2273 = v:encode()
			local var2274, var2275 = protoModule.writeTag(buff, var2272, 1, protoModule.wireTypes.lengthDelimited)
			var2274, var3365 = protoModule.writeBuffer(var2274, var2275, var2273, buffer.len(var2273))
			buff = var2274
			var2272 = var2275
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2276, var2277 = protoModule.writeTag(buff, var2272, 2, protoModule.wireTypes.lengthDelimited)
		var2276, var3367 = protoModule.writeString(var2276, var2277, self.selected_sort_id)
		buff = var2276
		var2272 = var2277
	end
	local buff_1 = buffer.create(var2272)
	buffer.copy(buff_1, 0, buff, 0, var2272)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2278 = t_80.new()
	local var2279 = 0
	while var2279 < buffer.len(p80) do
		local _ = nil
		local var2280 = nil
		local var2281, var2282, var2283 = protoModule.readTag(p80, var2279)
		local var2284 = var2281
		var2280 = var2282
		var2279 = var2283
		
		if var2280 == protoModule.wireTypes.varint then
			local _ = nil
			local var2285, var2286 = protoModule.readVarInt(p80, var2279)
			local _ = var2285
			var2279 = var2286
			continue
		end
		if var2280 == protoModule.wireTypes.lengthDelimited then
			if var2284 == 1 then
				local _ = nil
				local var2287, var2288 = protoModule.readBuffer(p80, var2279)
				var2279 = var2288
				table.insert(var2278.sort_options, t.SortSelectorInputData_SortOption.decode(var2287))
			elseif var2284 == 2 then
				local _ = nil
				local var2289, var2290 = protoModule.readBuffer(p80, var2279)
				var2279 = var2290
				var2278.selected_sort_id = buffer.tostring(var2289)
			else
				local _ = nil
				local var2291, var2292 = protoModule.readVarInt(p80, var2279)
				var2279 = var2292 + var2291
			end
		elseif var2280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2293, var2294 = protoModule.readFixed32(p80, var2279)
			local _ = var2293
			var2279 = var2294
		elseif var2280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2295, var2296 = protoModule.readFixed64(p80, var2279)
			local _ = var2295
			var2279 = var2296
		else
			error("Unsupported wire type: " .. var3371)
		end
	end
	return var2278
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
	local var2297 = t_80.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2297.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2297.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2297.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2297.selected_sort_id = self.selectedSortId
	end
	return var2297
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
	local var2298 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2299, var2300 = protoModule.writeTag(buff, var2298, 1, protoModule.wireTypes.lengthDelimited)
		var2299, var3396 = protoModule.writeString(var2299, var2300, self.sort_id)
		buff = var2299
		var2298 = var2300
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2301, var2302 = protoModule.writeTag(buff, var2298, 2, protoModule.wireTypes.lengthDelimited)
		var2301, var3398 = protoModule.writeString(var2301, var2302, self.display_name)
		buff = var2301
		var2298 = var2302
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2303, var2304 = protoModule.writeTag(buff, var2298, 3, protoModule.wireTypes.lengthDelimited)
		var2303, var3400 = protoModule.writeString(var2303, var2304, self.content_type)
		buff = var2303
		var2298 = var2304
	end
	local buff_1 = buffer.create(var2298)
	buffer.copy(buff_1, 0, buff, 0, var2298)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref)
	local var2298 = t_81.new()
	local var2299 = 0
	while var2299 < buffer.len(p81) do
		local _ = nil
		local var2300 = nil
		local var2301, var2302, var2303 = protoModule.readTag(p81, var2299)
		local var2304 = var2301
		var2300 = var2302
		var2299 = var2303
		
		if var2300 == protoModule.wireTypes.varint then
			local _ = nil
			local var2305, var2306 = protoModule.readVarInt(p81, var2299)
			local _ = var2305
			var2299 = var2306
			continue
		end
		if var2300 == protoModule.wireTypes.lengthDelimited then
			if var2304 == 1 then
				local _ = nil
				local var2307, var2308 = protoModule.readBuffer(p81, var2299)
				var2299 = var2308
				var2298.sort_id = buffer.tostring(var2307)
			elseif var2304 == 2 then
				local _ = nil
				local var2309, var2310 = protoModule.readBuffer(p81, var2299)
				var2299 = var2310
				var2298.display_name = buffer.tostring(var2309)
			elseif var2304 == 3 then
				local _ = nil
				local var2311, var2312 = protoModule.readBuffer(p81, var2299)
				var2299 = var2312
				var2298.content_type = buffer.tostring(var2311)
			else
				local _ = nil
				local var2313, var2314 = protoModule.readVarInt(p81, var2299)
				var2299 = var2314 + var2313
			end
		elseif var2300 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2315, var2316 = protoModule.readFixed32(p81, var2299)
			local _ = var2315
			var2299 = var2316
		elseif var2300 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2317, var2318 = protoModule.readFixed64(p81, var2299)
			local _ = var2317
			var2299 = var2318
		else
			error("Unsupported wire type: " .. var3404)
		end
	end
	return var2298
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
	local var2319 = t_81.new()
	
	if self.sort_id ~= nil then
		var2319.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2319.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2319.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2319.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2319.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2319.content_type = self.contentType
	end
	return var2319
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
	local var2319 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2320, var2321 = protoModule.writeTag(buff, var2319, 1, protoModule.wireTypes.lengthDelimited)
		var2320, var3428 = protoModule.writeString(var2320, var2321, self.selected_option)
		buff = var2320
		var2319 = var2321
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2322 = v:encode()
			local var2323, var2324 = protoModule.writeTag(buff, var2319, 2, protoModule.wireTypes.lengthDelimited)
			var2323, var3431 = protoModule.writeBuffer(var2323, var2324, var2322, buffer.len(var2322))
			buff = var2323
			var2319 = var2324
		end
	end
	if self.experience_carousel ~= nil then
		local var2325 = self.experience_carousel:encode()
		local var2326, var2327 = protoModule.writeTag(buff, var2319, 3, protoModule.wireTypes.lengthDelimited)
		var2326, var3434 = protoModule.writeBuffer(var2326, var2327, var2325, buffer.len(var2325))
		buff = var2326
		var2319 = var2327
	end
	local buff_1 = buffer.create(var2319)
	buffer.copy(buff_1, 0, buff, 0, var2319)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2328 = t_82.new()
	local var2329 = 0
	while var2329 < buffer.len(p82) do
		local _ = nil
		local var2330 = nil
		local var2331, var2332, var2333 = protoModule.readTag(p82, var2329)
		local var2334 = var2331
		var2330 = var2332
		var2329 = var2333
		
		if var2330 == protoModule.wireTypes.varint then
			local _ = nil
			local var2335, var2336 = protoModule.readVarInt(p82, var2329)
			local _ = var2335
			var2329 = var2336
			continue
		end
		if var2330 == protoModule.wireTypes.lengthDelimited then
			if var2334 == 1 then
				local _ = nil
				local var2337, var2338 = protoModule.readBuffer(p82, var2329)
				var2329 = var2338
				var2328.selected_option = buffer.tostring(var2337)
			elseif var2334 == 2 then
				local _ = nil
				local var2339, var2340 = protoModule.readBuffer(p82, var2329)
				var2329 = var2340
				table.insert(var2328.options, t.SelectorOption.decode(var2339))
			elseif var2334 == 3 then
				local _ = nil
				local var2341, var2342 = protoModule.readBuffer(p82, var2329)
				var2329 = var2342
				var2328.experience_carousel = t.ExperienceCarouselInputData.decode(var2341)
			else
				local _ = nil
				local var2343, var2344 = protoModule.readVarInt(p82, var2329)
				var2329 = var2344 + var2343
			end
		elseif var2330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2345, var2346 = protoModule.readFixed32(p82, var2329)
			local _ = var2345
			var2329 = var2346
		elseif var2330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2347, var2348 = protoModule.readFixed64(p82, var2329)
			local _ = var2347
			var2329 = var2348
		else
			error("Unsupported wire type: " .. var3438)
		end
	end
	return var2328
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
	local var2349 = t_82.new()
	
	if self.selected_option ~= nil then
		var2349.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2349.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2349.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2349.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2349.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2349
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
	local var2350 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2351, var2352 = protoModule.writeTag(buff, var2350, 1, protoModule.wireTypes.lengthDelimited)
		var2351, var3464 = protoModule.writeString(var2351, var2352, self.id)
		buff = var2351
		var2350 = var2352
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2353, var2354 = protoModule.writeTag(buff, var2350, 4, protoModule.wireTypes.varint)
		var2353, var3466 = protoModule.writeVarInt(var2353, var2354, self.preview_rows)
		buff = var2353
		var2350 = var2354
	end
	if self.widget_style ~= nil then
		local var2355 = self.widget_style:encode()
		local var2356, var2357 = protoModule.writeTag(buff, var2350, 3, protoModule.wireTypes.lengthDelimited)
		var2356, var3469 = protoModule.writeBuffer(var2356, var2357, var2355, buffer.len(var2355))
		buff = var2356
		var2350 = var2357
	end
	if self.see_all_button then
		local var2358, var2359 = protoModule.writeTag(buff, var2350, 5, protoModule.wireTypes.varint)
		var2358, var3471 = protoModule.writeVarInt(var2358, var2359, if self.see_all_button then 1 else 0)
		buff = var2358
		var2350 = var2359
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2360, var2361 = protoModule.writeTag(buff, var2350, 6, protoModule.wireTypes.lengthDelimited)
		var2360, var3473 = protoModule.writeString(var2360, var2361, self.information_popover_text)
		buff = var2360
		var2350 = var2361
	end
	local buff_1 = buffer.create(var2350)
	buffer.copy(buff_1, 0, buff, 0, var2350)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2350 = t_83.new()
	local var2351 = 0
	while var2351 < buffer.len(p83) do
		local _ = nil
		local var2352 = nil
		local var2353, var2354, var2355 = protoModule.readTag(p83, var2351)
		local var2356 = var2353
		var2352 = var2354
		var2351 = var2355
		
		if var2352 == protoModule.wireTypes.varint then
			if var2356 == 4 then
				local _ = nil
				local var2357, var2358 = protoModule.readVarIntI64(p83, var2351)
				var2351 = var2358
				var2350.preview_rows = var2357
			elseif var2356 == 5 then
				local _ = nil
				local var2359, var2360 = protoModule.readVarInt(p83, var2351)
				var2351 = var2360
				var2350.see_all_button = var2359 ~= 0
			else
				local _ = nil
				local var2361, var2362 = protoModule.readVarInt(p83, var2351)
				local _ = var2361
				var2351 = var2362
			end
		end
		if var2352 == protoModule.wireTypes.lengthDelimited then
			if var2356 == 1 then
				local _ = nil
				local var2363, var2364 = protoModule.readBuffer(p83, var2351)
				var2351 = var2364
				var2350.id = buffer.tostring(var2363)
			elseif var2356 == 3 then
				local _ = nil
				local var2365, var2366 = protoModule.readBuffer(p83, var2351)
				var2351 = var2366
				var2350.widget_style = t.WidgetStyleData.decode(var2365)
			elseif var2356 == 6 then
				local _ = nil
				local var2367, var2368 = protoModule.readBuffer(p83, var2351)
				var2351 = var2368
				var2350.information_popover_text = buffer.tostring(var2367)
			else
				local _ = nil
				local var2369, var2370 = protoModule.readVarInt(p83, var2351)
				var2351 = var2370 + var2369
			end
		elseif var2352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2371, var2372 = protoModule.readFixed32(p83, var2351)
			local _ = var2371
			var2351 = var2372
		elseif var2352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2373, var2374 = protoModule.readFixed64(p83, var2351)
			local _ = var2373
			var2351 = var2374
		else
			error("Unsupported wire type: " .. var3477)
		end
	end
	return var2350
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
	local var2375 = t_83.new()
	
	if self.id ~= nil then
		var2375.id = self.id
	end
	if self.preview_rows ~= nil then
		var2375.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2375.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2375.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2375.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2375.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2375.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2375.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2375.information_popover_text = self.informationPopoverText
	end
	return var2375
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
	local var2375 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2376, var2377 = protoModule.writeTag(buff, var2375, 1, protoModule.wireTypes.lengthDelimited)
		var2376, var3505 = protoModule.writeString(var2376, var2377, self.id)
		buff = var2376
		var2375 = var2377
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2378, var2379 = protoModule.writeTag(buff, var2375, 5, protoModule.wireTypes.varint)
		var2378, var3507 = protoModule.writeVarInt(var2378, var2379, self.num_items_to_show)
		buff = var2378
		var2375 = var2379
	end
	if self.widget_style ~= nil then
		local var2380 = self.widget_style:encode()
		local var2381, var2382 = protoModule.writeTag(buff, var2375, 3, protoModule.wireTypes.lengthDelimited)
		var2381, var3510 = protoModule.writeBuffer(var2381, var2382, var2380, buffer.len(var2380))
		buff = var2381
		var2375 = var2382
	end
	if self.see_all_button then
		local var2383, var2384 = protoModule.writeTag(buff, var2375, 6, protoModule.wireTypes.varint)
		var2383, var3512 = protoModule.writeVarInt(var2383, var2384, if self.see_all_button then 1 else 0)
		buff = var2383
		var2375 = var2384
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2385, var2386 = protoModule.writeTag(buff, var2375, 7, protoModule.wireTypes.lengthDelimited)
		var2385, var3514 = protoModule.writeString(var2385, var2386, self.information_popover_text)
		buff = var2385
		var2375 = var2386
	end
	local buff_1 = buffer.create(var2375)
	buffer.copy(buff_1, 0, buff, 0, var2375)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2375 = t_84.new()
	local var2376 = 0
	while var2376 < buffer.len(p84) do
		local _ = nil
		local var2377 = nil
		local var2378, var2379, var2380 = protoModule.readTag(p84, var2376)
		local var2381 = var2378
		var2377 = var2379
		var2376 = var2380
		
		if var2377 == protoModule.wireTypes.varint then
			if var2381 == 5 then
				local _ = nil
				local var2382, var2383 = protoModule.readVarIntI64(p84, var2376)
				var2376 = var2383
				var2375.num_items_to_show = var2382
			elseif var2381 == 6 then
				local _ = nil
				local var2384, var2385 = protoModule.readVarInt(p84, var2376)
				var2376 = var2385
				var2375.see_all_button = var2384 ~= 0
			else
				local _ = nil
				local var2386, var2387 = protoModule.readVarInt(p84, var2376)
				local _ = var2386
				var2376 = var2387
			end
		end
		if var2377 == protoModule.wireTypes.lengthDelimited then
			if var2381 == 1 then
				local _ = nil
				local var2388, var2389 = protoModule.readBuffer(p84, var2376)
				var2376 = var2389
				var2375.id = buffer.tostring(var2388)
			elseif var2381 == 3 then
				local _ = nil
				local var2390, var2391 = protoModule.readBuffer(p84, var2376)
				var2376 = var2391
				var2375.widget_style = t.WidgetStyleData.decode(var2390)
			elseif var2381 == 7 then
				local _ = nil
				local var2392, var2393 = protoModule.readBuffer(p84, var2376)
				var2376 = var2393
				var2375.information_popover_text = buffer.tostring(var2392)
			else
				local _ = nil
				local var2394, var2395 = protoModule.readVarInt(p84, var2376)
				var2376 = var2395 + var2394
			end
		elseif var2377 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2396, var2397 = protoModule.readFixed32(p84, var2376)
			local _ = var2396
			var2376 = var2397
		elseif var2377 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2398, var2399 = protoModule.readFixed64(p84, var2376)
			local _ = var2398
			var2376 = var2399
		else
			error("Unsupported wire type: " .. var3518)
		end
	end
	return var2375
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
	local var2400 = t_84.new()
	
	if self.id ~= nil then
		var2400.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2400.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2400.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2400.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2400.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2400.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2400.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2400.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2400.information_popover_text = self.informationPopoverText
	end
	return var2400
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
	local var2400 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2401 = v:encode()
			local var2402, var2403 = protoModule.writeTag(buff, var2400, 1, protoModule.wireTypes.lengthDelimited)
			var2402, var3547 = protoModule.writeBuffer(var2402, var2403, var2401, buffer.len(var2401))
			buff = var2402
			var2400 = var2403
		end
	end
	local buff_1 = buffer.create(var2400)
	buffer.copy(buff_1, 0, buff, 0, var2400)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), backgroundLayerModule (ref)
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
			local _ = nil
			local var2411, var2412 = protoModule.readVarInt(p85, var2405)
			local _ = var2411
			var2405 = var2412
			continue
		end
		if var2406 == protoModule.wireTypes.lengthDelimited then
			if var2410 == 1 then
				local _ = nil
				local var2413, var2414 = protoModule.readBuffer(p85, var2405)
				var2405 = var2414
				table.insert(var2404.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2413))
			else
				local _ = nil
				local var2415, var2416 = protoModule.readVarInt(p85, var2405)
				var2405 = var2416 + var2415
			end
		elseif var2406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2417, var2418 = protoModule.readFixed32(p85, var2405)
			local _ = var2417
			var2405 = var2418
		elseif var2406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2419, var2420 = protoModule.readFixed64(p85, var2405)
			local _ = var2419
			var2405 = var2420
		else
			error("Unsupported wire type: " .. var3551)
		end
	end
	return var2404
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
	local var2421 = t_85.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2421.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2421.background_layers = t
	end
	return var2421
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
	local var2422 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2423, var2424 = protoModule.writeTag(buff, var2422, 1, protoModule.wireTypes.lengthDelimited)
		var2423, var3574 = protoModule.writeString(var2423, var2424, self.id)
		buff = var2423
		var2422 = var2424
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2425, var2426 = protoModule.writeTag(buff, var2422, 2, protoModule.wireTypes.lengthDelimited)
		var2425, var3576 = protoModule.writeString(var2425, var2426, self.available_until)
		buff = var2425
		var2422 = var2426
	end
	if self.widget_style ~= nil then
		local var2427 = self.widget_style:encode()
		local var2428, var2429 = protoModule.writeTag(buff, var2422, 3, protoModule.wireTypes.lengthDelimited)
		var2428, var3579 = protoModule.writeBuffer(var2428, var2429, var2427, buffer.len(var2427))
		buff = var2428
		var2422 = var2429
	end
	local buff_1 = buffer.create(var2422)
	buffer.copy(buff_1, 0, buff, 0, var2422)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2422 = t_86.new()
	local var2423 = 0
	while var2423 < buffer.len(p86) do
		local _ = nil
		local var2424 = nil
		local var2425, var2426, var2427 = protoModule.readTag(p86, var2423)
		local var2428 = var2425
		var2424 = var2426
		var2423 = var2427
		
		if var2424 == protoModule.wireTypes.varint then
			local _ = nil
			local var2429, var2430 = protoModule.readVarInt(p86, var2423)
			local _ = var2429
			var2423 = var2430
			continue
		end
		if var2424 == protoModule.wireTypes.lengthDelimited then
			if var2428 == 1 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p86, var2423)
				var2423 = var2432
				var2422.id = buffer.tostring(var2431)
			elseif var2428 == 2 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p86, var2423)
				var2423 = var2434
				var2422.available_until = buffer.tostring(var2433)
			elseif var2428 == 3 then
				local _ = nil
				local var2435, var2436 = protoModule.readBuffer(p86, var2423)
				var2423 = var2436
				var2422.widget_style = t.WidgetStyleData.decode(var2435)
			else
				local _ = nil
				local var2437, var2438 = protoModule.readVarInt(p86, var2423)
				var2423 = var2438 + var2437
			end
		elseif var2424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2439, var2440 = protoModule.readFixed32(p86, var2423)
			local _ = var2439
			var2423 = var2440
		elseif var2424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2441, var2442 = protoModule.readFixed64(p86, var2423)
			local _ = var2441
			var2423 = var2442
		else
			error("Unsupported wire type: " .. var3583)
		end
	end
	return var2422
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
	local var2443 = t_86.new()
	
	if self.id ~= nil then
		var2443.id = self.id
	end
	if self.available_until ~= nil then
		var2443.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2443.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2443.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2443.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2443
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
	local var2443 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2444, var2445 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2444, var3607 = protoModule.writeString(var2444, var2445, i)
			local var2446 = v:encode()
			var2445, var3609 = protoModule.writeTag(var2444, var2445, 2, protoModule.wireTypes.lengthDelimited)
			var2445, var3609 = protoModule.writeBuffer(var2445, var3609, var2446, buffer.len(var2446))
			local var2447 = var2445
			local var2448 = var3609
			local var2449, var2450 = protoModule.writeTag(buff, var2443, 1, protoModule.wireTypes.lengthDelimited)
			var2449, var3613 = protoModule.writeBuffer(var2449, var2450, var2447, var2448)
			buff = var2449
			var2443 = var2450
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2451, var2452 = protoModule.writeTag(buff, var2443, 2, protoModule.wireTypes.lengthDelimited)
			var2451, var3615 = protoModule.writeString(var2451, var2452, v)
			buff = var2451
			var2443 = var2452
		end
	end
	local buff_1 = buffer.create(var2443)
	buffer.copy(buff_1, 0, buff, 0, var2443)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2453 = t_87.new()
	local var2454 = 0
	while var2454 < buffer.len(p87) do
		local _ = nil
		local var2455 = nil
		local var2456, var2457, var2458 = protoModule.readTag(p87, var2454)
		local var2459 = var2456
		var2455 = var2457
		var2454 = var2458
		
		if var2455 == protoModule.wireTypes.varint then
			local _ = nil
			local var2460, var2461 = protoModule.readVarInt(p87, var2454)
			local _ = var2460
			var2454 = var2461
			continue
		end
		if var2455 == protoModule.wireTypes.lengthDelimited then
			if var2459 == 1 then
				local _ = nil
				local var2462, var2463 = protoModule.readBuffer(p87, var2454)
				var2454 = var2463
				var2462 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2462)
				var2453.entry_map[var2462.key or ""] = var2462.value or t.FeedEntry.new()
			elseif var2459 == 2 then
				local _ = nil
				local var2464, var2465 = protoModule.readBuffer(p87, var2454)
				var2454 = var2465
				table.insert(var2453.entry_order, buffer.tostring(var2464))
			else
				local _ = nil
				local var2466, var2467 = protoModule.readVarInt(p87, var2454)
				var2454 = var2467 + var2466
			end
		elseif var2455 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2468, var2469 = protoModule.readFixed32(p87, var2454)
			local _ = var2468
			var2454 = var2469
		elseif var2455 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2470, var2471 = protoModule.readFixed64(p87, var2454)
			local _ = var2470
			var2454 = var2471
		else
			error("Unsupported wire type: " .. var3619)
		end
	end
	return var2453
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
	local var2472 = t_87.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2472.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2472.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2472.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2472.entry_order = t_1
	end
	return var2472
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
	local var2473 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2474, var2475 = protoModule.writeTag(buff, var2473, 1, protoModule.wireTypes.lengthDelimited)
		var2474, var3647 = protoModule.writeString(var2474, var2475, self.key)
		buff = var2474
		var2473 = var2475
	end
	if self.value ~= nil then
		local var2476 = self.value:encode()
		local var2477, var2478 = protoModule.writeTag(buff, var2473, 2, protoModule.wireTypes.lengthDelimited)
		var2477, var3650 = protoModule.writeBuffer(var2477, var2478, var2476, buffer.len(var2476))
		buff = var2477
		var2473 = var2478
	end
	local buff_1 = buffer.create(var2473)
	buffer.copy(buff_1, 0, buff, 0, var2473)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2473 = t_88.new()
	local var2474 = 0
	while var2474 < buffer.len(p88) do
		local _ = nil
		local var2475 = nil
		local var2476, var2477, var2478 = protoModule.readTag(p88, var2474)
		local var2479 = var2476
		var2475 = var2477
		var2474 = var2478
		
		if var2475 == protoModule.wireTypes.varint then
			local _ = nil
			local var2480, var2481 = protoModule.readVarInt(p88, var2474)
			local _ = var2480
			var2474 = var2481
			continue
		end
		if var2475 == protoModule.wireTypes.lengthDelimited then
			if var2479 == 1 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p88, var2474)
				var2474 = var2483
				var2473.key = buffer.tostring(var2482)
			elseif var2479 == 2 then
				local _ = nil
				local var2484, var2485 = protoModule.readBuffer(p88, var2474)
				var2474 = var2485
				var2473.value = t.FeedEntry.decode(var2484)
			else
				local _ = nil
				local var2486, var2487 = protoModule.readVarInt(p88, var2474)
				var2474 = var2487 + var2486
			end
		elseif var2475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2488, var2489 = protoModule.readFixed32(p88, var2474)
			local _ = var2488
			var2474 = var2489
		elseif var2475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2490, var2491 = protoModule.readFixed64(p88, var2474)
			local _ = var2490
			var2474 = var2491
		else
			error("Unsupported wire type: " .. var3654)
		end
	end
	return var2473
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
	local var2492 = t_88.new()
	
	if self.key ~= nil then
		var2492.key = self.key
	end
	if self.value ~= nil then
		var2492.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2492
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
	local var2492 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2493 = v:encode()
			local var2494, var2495 = protoModule.writeTag(buff, var2492, 1, protoModule.wireTypes.lengthDelimited)
			var2494, var3677 = protoModule.writeBuffer(var2494, var2495, var2493, buffer.len(var2493))
			buff = var2494
			var2492 = var2495
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2496, var2497 = protoModule.writeTag(buff, var2492, 2, protoModule.wireTypes.lengthDelimited)
		var2496, var3679 = protoModule.writeString(var2496, var2497, self.active_category_id)
		buff = var2496
		var2492 = var2497
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2498, var2499 = protoModule.writeTag(buff, var2492, 3, protoModule.wireTypes.varint)
		var2498, var3681 = protoModule.writeVarInt(var2498, var2499, self.active_tooltip_idx)
		buff = var2498
		var2492 = var2499
	end
	local buff_1 = buffer.create(var2492)
	buffer.copy(buff_1, 0, buff, 0, var2492)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2500 = t_89.new()
	local var2501 = 0
	while var2501 < buffer.len(p89) do
		local _ = nil
		local var2502 = nil
		local var2503, var2504, var2505 = protoModule.readTag(p89, var2501)
		local var2506 = var2503
		var2502 = var2504
		var2501 = var2505
		
		if var2502 == protoModule.wireTypes.varint then
			if var2506 == 3 then
				local _ = nil
				local var2507, var2508 = protoModule.readVarIntI64(p89, var2501)
				var2501 = var2508
				var2500.active_tooltip_idx = var2507
			else
				local _ = nil
				local var2509, var2510 = protoModule.readVarInt(p89, var2501)
				local _ = var2509
				var2501 = var2510
			end
		end
		if var2502 == protoModule.wireTypes.lengthDelimited then
			if var2506 == 1 then
				local _ = nil
				local var2511, var2512 = protoModule.readBuffer(p89, var2501)
				var2501 = var2512
				table.insert(var2500.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2511))
			elseif var2506 == 2 then
				local _ = nil
				local var2513, var2514 = protoModule.readBuffer(p89, var2501)
				var2501 = var2514
				var2500.active_category_id = buffer.tostring(var2513)
			else
				local _ = nil
				local var2515, var2516 = protoModule.readVarInt(p89, var2501)
				var2501 = var2516 + var2515
			end
		elseif var2502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2517, var2518 = protoModule.readFixed32(p89, var2501)
			local _ = var2517
			var2501 = var2518
		elseif var2502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2519, var2520 = protoModule.readFixed64(p89, var2501)
			local _ = var2519
			var2501 = var2520
		else
			error("Unsupported wire type: " .. var3685)
		end
	end
	return var2500
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
	local var2521 = t_89.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2521.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2521.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2521.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2521.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2521.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2521.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2521
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
	local var2522 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2523, var2524 = protoModule.writeTag(buff, var2522, 1, protoModule.wireTypes.lengthDelimited)
		var2523, var3712 = protoModule.writeString(var2523, var2524, self.marketplace_catalog_category_item_id)
		buff = var2523
		var2522 = var2524
	end
	local buff_1 = buffer.create(var2522)
	buffer.copy(buff_1, 0, buff, 0, var2522)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2522 = t_90.new()
	local var2523 = 0
	while var2523 < buffer.len(p90) do
		local _ = nil
		local var2524 = nil
		local var2525, var2526, var2527 = protoModule.readTag(p90, var2523)
		local var2528 = var2525
		var2524 = var2526
		var2523 = var2527
		
		if var2524 == protoModule.wireTypes.varint then
			local _ = nil
			local var2529, var2530 = protoModule.readVarInt(p90, var2523)
			local _ = var2529
			var2523 = var2530
			continue
		end
		if var2524 == protoModule.wireTypes.lengthDelimited then
			if var2528 == 1 then
				local _ = nil
				local var2531, var2532 = protoModule.readBuffer(p90, var2523)
				var2523 = var2532
				var2522.marketplace_catalog_category_item_id = buffer.tostring(var2531)
			else
				local _ = nil
				local var2533, var2534 = protoModule.readVarInt(p90, var2523)
				var2523 = var2534 + var2533
			end
		elseif var2524 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2535, var2536 = protoModule.readFixed32(p90, var2523)
			local _ = var2535
			var2523 = var2536
		elseif var2524 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2537, var2538 = protoModule.readFixed64(p90, var2523)
			local _ = var2537
			var2523 = var2538
		else
			error("Unsupported wire type: " .. var3716)
		end
	end
	return var2522
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
	local var2539 = t_90.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2539.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2539.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2539
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
	local var2539 = 0
	
	if self.hero_icon ~= nil then
		local var2540, var2541 = protoModule.writeTag(buff, var2539, 1, protoModule.wireTypes.lengthDelimited)
		var2540, var3736 = protoModule.writeString(var2540, var2541, self.hero_icon)
		buff = var2540
		var2539 = var2541
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2542, var2543 = protoModule.writeTag(buff, var2539, 2, protoModule.wireTypes.lengthDelimited)
		var2542, var3738 = protoModule.writeString(var2542, var2543, self.body_dismiss_button_text)
		buff = var2542
		var2539 = var2543
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2544, var2545 = protoModule.writeTag(buff, var2539, 3, protoModule.wireTypes.lengthDelimited)
		var2544, var3740 = protoModule.writeString(var2544, var2545, self.body_title)
		buff = var2544
		var2539 = var2545
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2546, var2547 = protoModule.writeTag(buff, var2539, 4, protoModule.wireTypes.lengthDelimited)
		var2546, var3742 = protoModule.writeString(var2546, var2547, self.body_rich_text)
		buff = var2546
		var2539 = var2547
	end
	if self.terms_link_text ~= nil then
		local var2548, var2549 = protoModule.writeTag(buff, var2539, 5, protoModule.wireTypes.lengthDelimited)
		var2548, var3744 = protoModule.writeString(var2548, var2549, self.terms_link_text)
		buff = var2548
		var2539 = var2549
	end
	if self.terms_title ~= nil then
		local var2550, var2551 = protoModule.writeTag(buff, var2539, 6, protoModule.wireTypes.lengthDelimited)
		var2550, var3746 = protoModule.writeString(var2550, var2551, self.terms_title)
		buff = var2550
		var2539 = var2551
	end
	if self.terms_body_rich_text ~= nil then
		local var2552, var2553 = protoModule.writeTag(buff, var2539, 7, protoModule.wireTypes.lengthDelimited)
		var2552, var3748 = protoModule.writeString(var2552, var2553, self.terms_body_rich_text)
		buff = var2552
		var2539 = var2553
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2554, var2555 = protoModule.writeTag(buff, var2539, 8, protoModule.wireTypes.lengthDelimited)
		var2554, var3750 = protoModule.writeString(var2554, var2555, self.terms_dismiss_button_text)
		buff = var2554
		var2539 = var2555
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2556, var2557 = protoModule.writeTag(buff, var2539, 9, protoModule.wireTypes.lengthDelimited)
		var2556, var3752 = protoModule.writeString(var2556, var2557, self.offer_id)
		buff = var2556
		var2539 = var2557
	end
	local buff_1 = buffer.create(var2539)
	buffer.copy(buff_1, 0, buff, 0, var2539)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref)
	local var2539 = t_91.new()
	local var2540 = 0
	while var2540 < buffer.len(p91) do
		local _ = nil
		local var2541 = nil
		local var2542, var2543, var2544 = protoModule.readTag(p91, var2540)
		local var2545 = var2542
		var2541 = var2543
		var2540 = var2544
		
		if var2541 == protoModule.wireTypes.varint then
			local _ = nil
			local var2546, var2547 = protoModule.readVarInt(p91, var2540)
			local _ = var2546
			var2540 = var2547
			continue
		end
		if var2541 == protoModule.wireTypes.lengthDelimited then
			if var2545 == 1 then
				local _ = nil
				local var2548, var2549 = protoModule.readBuffer(p91, var2540)
				var2540 = var2549
				var2539.hero_icon = buffer.tostring(var2548)
			elseif var2545 == 2 then
				local _ = nil
				local var2550, var2551 = protoModule.readBuffer(p91, var2540)
				var2540 = var2551
				var2539.body_dismiss_button_text = buffer.tostring(var2550)
			elseif var2545 == 3 then
				local _ = nil
				local var2552, var2553 = protoModule.readBuffer(p91, var2540)
				var2540 = var2553
				var2539.body_title = buffer.tostring(var2552)
			elseif var2545 == 4 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p91, var2540)
				var2540 = var2555
				var2539.body_rich_text = buffer.tostring(var2554)
			elseif var2545 == 5 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p91, var2540)
				var2540 = var2557
				var2539.terms_link_text = buffer.tostring(var2556)
			elseif var2545 == 6 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p91, var2540)
				var2540 = var2559
				var2539.terms_title = buffer.tostring(var2558)
			elseif var2545 == 7 then
				local _ = nil
				local var2560, var2561 = protoModule.readBuffer(p91, var2540)
				var2540 = var2561
				var2539.terms_body_rich_text = buffer.tostring(var2560)
			elseif var2545 == 8 then
				local _ = nil
				local var2562, var2563 = protoModule.readBuffer(p91, var2540)
				var2540 = var2563
				var2539.terms_dismiss_button_text = buffer.tostring(var2562)
			elseif var2545 == 9 then
				local _ = nil
				local var2564, var2565 = protoModule.readBuffer(p91, var2540)
				var2540 = var2565
				var2539.offer_id = buffer.tostring(var2564)
			else
				local _ = nil
				local var2566, var2567 = protoModule.readVarInt(p91, var2540)
				var2540 = var2567 + var2566
			end
		elseif var2541 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2568, var2569 = protoModule.readFixed32(p91, var2540)
			local _ = var2568
			var2540 = var2569
		elseif var2541 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2570, var2571 = protoModule.readFixed64(p91, var2540)
			local _ = var2570
			var2540 = var2571
		else
			error("Unsupported wire type: " .. var3756)
		end
	end
	return var2539
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
	local var2572 = t_91.new()
	
	if self.hero_icon ~= nil then
		var2572.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2572.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2572.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2572.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2572.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2572.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2572.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2572.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2572.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2572.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2572.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2572.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2572.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2572.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2572.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2572.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2572.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2572.offer_id = self.offerId
	end
	return var2572
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
	local var2572 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2573, var2574 = protoModule.writeTag(buff, var2572, 1, protoModule.wireTypes.lengthDelimited)
		var2573, var3792 = protoModule.writeString(var2573, var2574, self.item_id)
		buff = var2573
		var2572 = var2574
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2575, var2576 = protoModule.writeTag(buff, var2572, 2, protoModule.wireTypes.lengthDelimited)
		var2575, var3794 = protoModule.writeString(var2575, var2576, self.item_type)
		buff = var2575
		var2572 = var2576
	end
	if self.prefer_three_dimensional then
		local var2577, var2578 = protoModule.writeTag(buff, var2572, 3, protoModule.wireTypes.varint)
		var2577, var3796 = protoModule.writeVarInt(var2577, var2578, if self.prefer_three_dimensional then 1 else 0)
		buff = var2577
		var2572 = var2578
	end
	if self.bundle_type ~= nil then
		local var2579, var2580 = protoModule.writeTag(buff, var2572, 4, protoModule.wireTypes.lengthDelimited)
		var2579, var3798 = protoModule.writeString(var2579, var2580, self.bundle_type)
		buff = var2579
		var2572 = var2580
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2581 = v:encode()
			local var2582, var2583 = protoModule.writeTag(buff, var2572, 5, protoModule.wireTypes.lengthDelimited)
			var2582, var3801 = protoModule.writeBuffer(var2582, var2583, var2581, buffer.len(var2581))
			buff = var2582
			var2572 = var2583
		end
	end
	local buff_1 = buffer.create(var2572)
	buffer.copy(buff_1, 0, buff, 0, var2572)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2584 = t_92.new()
	local var2585 = 0
	while var2585 < buffer.len(p92) do
		local _ = nil
		local var2586 = nil
		local var2587, var2588, var2589 = protoModule.readTag(p92, var2585)
		local var2590 = var2587
		var2586 = var2588
		var2585 = var2589
		
		if var2586 == protoModule.wireTypes.varint then
			if var2590 == 3 then
				local _ = nil
				local var2591, var2592 = protoModule.readVarInt(p92, var2585)
				var2585 = var2592
				var2584.prefer_three_dimensional = var2591 ~= 0
			else
				local _ = nil
				local var2593, var2594 = protoModule.readVarInt(p92, var2585)
				local _ = var2593
				var2585 = var2594
			end
		end
		if var2586 == protoModule.wireTypes.lengthDelimited then
			if var2590 == 1 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p92, var2585)
				var2585 = var2596
				var2584.item_id = buffer.tostring(var2595)
			elseif var2590 == 2 then
				local _ = nil
				local var2597, var2598 = protoModule.readBuffer(p92, var2585)
				var2585 = var2598
				var2584.item_type = buffer.tostring(var2597)
			elseif var2590 == 4 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p92, var2585)
				var2585 = var2600
				var2584.bundle_type = buffer.tostring(var2599)
			elseif var2590 == 5 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p92, var2585)
				var2585 = var2602
				table.insert(var2584.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2601))
			else
				local _ = nil
				local var2603, var2604 = protoModule.readVarInt(p92, var2585)
				var2585 = var2604 + var2603
			end
		elseif var2586 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2605, var2606 = protoModule.readFixed32(p92, var2585)
			local _ = var2605
			var2585 = var2606
		elseif var2586 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2607, var2608 = protoModule.readFixed64(p92, var2585)
			local _ = var2607
			var2585 = var2608
		else
			error("Unsupported wire type: " .. var3805)
		end
	end
	return var2584
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
	local var2609 = t_92.new()
	
	if self.item_id ~= nil then
		var2609.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2609.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2609.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2609.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2609.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2609.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2609.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2609.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2609.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2609.bundle_items = t_1
	end
	return var2609
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
	local var2610 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2611, var2612 = protoModule.writeTag(buff, var2610, 1, protoModule.wireTypes.lengthDelimited)
		var2611, var3836 = protoModule.writeString(var2611, var2612, self.id)
		buff = var2611
		var2610 = var2612
	end
	if self.type ~= nil and self.type ~= "" then
		local var2613, var2614 = protoModule.writeTag(buff, var2610, 2, protoModule.wireTypes.lengthDelimited)
		var2613, var3838 = protoModule.writeString(var2613, var2614, self.type)
		buff = var2613
		var2610 = var2614
	end
	local buff_1 = buffer.create(var2610)
	buffer.copy(buff_1, 0, buff, 0, var2610)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref)
	local var2610 = t_93.new()
	local var2611 = 0
	while var2611 < buffer.len(p93) do
		local _ = nil
		local var2612 = nil
		local var2613, var2614, var2615 = protoModule.readTag(p93, var2611)
		local var2616 = var2613
		var2612 = var2614
		var2611 = var2615
		
		if var2612 == protoModule.wireTypes.varint then
			local _ = nil
			local var2617, var2618 = protoModule.readVarInt(p93, var2611)
			local _ = var2617
			var2611 = var2618
			continue
		end
		if var2612 == protoModule.wireTypes.lengthDelimited then
			if var2616 == 1 then
				local _ = nil
				local var2619, var2620 = protoModule.readBuffer(p93, var2611)
				var2611 = var2620
				var2610.id = buffer.tostring(var2619)
			elseif var2616 == 2 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p93, var2611)
				var2611 = var2622
				var2610.type = buffer.tostring(var2621)
			else
				local _ = nil
				local var2623, var2624 = protoModule.readVarInt(p93, var2611)
				var2611 = var2624 + var2623
			end
		elseif var2612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2625, var2626 = protoModule.readFixed32(p93, var2611)
			local _ = var2625
			var2611 = var2626
		elseif var2612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2627, var2628 = protoModule.readFixed64(p93, var2611)
			local _ = var2627
			var2611 = var2628
		else
			error("Unsupported wire type: " .. var3842)
		end
	end
	return var2610
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
	local var2629 = t_93.new()
	
	if self.id ~= nil then
		var2629.id = self.id
	end
	if self.type ~= nil then
		var2629.type = self.type
	end
	return var2629
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
	local var2629 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2630 = v:encode()
			local var2631, var2632 = protoModule.writeTag(buff, var2629, 1, protoModule.wireTypes.lengthDelimited)
			var2631, var3865 = protoModule.writeBuffer(var2631, var2632, var2630, buffer.len(var2630))
			buff = var2631
			var2629 = var2632
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2633, var2634 = protoModule.writeTag(buff, var2629, 2, protoModule.wireTypes.varint)
		var2633, var3867 = protoModule.writeVarInt(var2633, var2634, self.preview_columns)
		buff = var2633
		var2629 = var2634
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2635, var2636 = protoModule.writeTag(buff, var2629, 3, protoModule.wireTypes.lengthDelimited)
		var2635, var3869 = protoModule.writeString(var2635, var2636, self.impression_id)
		buff = var2635
		var2629 = var2636
	end
	local buff_1 = buffer.create(var2629)
	buffer.copy(buff_1, 0, buff, 0, var2629)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2637 = t_94.new()
	local var2638 = 0
	while var2638 < buffer.len(p94) do
		local _ = nil
		local var2639 = nil
		local var2640, var2641, var2642 = protoModule.readTag(p94, var2638)
		local var2643 = var2640
		var2639 = var2641
		var2638 = var2642
		
		if var2639 == protoModule.wireTypes.varint then
			if var2643 == 2 then
				local _ = nil
				local var2644, var2645 = protoModule.readVarIntI32(p94, var2638)
				var2638 = var2645
				var2637.preview_columns = var2644
			else
				local _ = nil
				local var2646, var2647 = protoModule.readVarInt(p94, var2638)
				local _ = var2646
				var2638 = var2647
			end
		end
		if var2639 == protoModule.wireTypes.lengthDelimited then
			if var2643 == 1 then
				local _ = nil
				local var2648, var2649 = protoModule.readBuffer(p94, var2638)
				var2638 = var2649
				table.insert(var2637.items, t.CatalogItemGridInputData_CatalogItem.decode(var2648))
			elseif var2643 == 3 then
				local _ = nil
				local var2650, var2651 = protoModule.readBuffer(p94, var2638)
				var2638 = var2651
				var2637.impression_id = buffer.tostring(var2650)
			else
				local _ = nil
				local var2652, var2653 = protoModule.readVarInt(p94, var2638)
				var2638 = var2653 + var2652
			end
		elseif var2639 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2654, var2655 = protoModule.readFixed32(p94, var2638)
			local _ = var2654
			var2638 = var2655
		elseif var2639 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2656, var2657 = protoModule.readFixed64(p94, var2638)
			local _ = var2656
			var2638 = var2657
		else
			error("Unsupported wire type: " .. var3873)
		end
	end
	return var2637
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
	local var2658 = t_94.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2658.items = t_1
	end
	if self.preview_columns ~= nil then
		var2658.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2658.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2658.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2658.impression_id = self.impressionId
	end
	return var2658
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
	local var2659 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2660, var2661 = protoModule.writeTag(buff, var2659, 1, protoModule.wireTypes.lengthDelimited)
		var2660, var3899 = protoModule.writeString(var2660, var2661, self.id)
		buff = var2660
		var2659 = var2661
	end
	if self.type ~= nil and self.type ~= "" then
		local var2662, var2663 = protoModule.writeTag(buff, var2659, 2, protoModule.wireTypes.lengthDelimited)
		var2662, var3901 = protoModule.writeString(var2662, var2663, self.type)
		buff = var2662
		var2659 = var2663
	end
	local buff_1 = buffer.create(var2659)
	buffer.copy(buff_1, 0, buff, 0, var2659)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref)
	local var2659 = t_95.new()
	local var2660 = 0
	while var2660 < buffer.len(p95) do
		local _ = nil
		local var2661 = nil
		local var2662, var2663, var2664 = protoModule.readTag(p95, var2660)
		local var2665 = var2662
		var2661 = var2663
		var2660 = var2664
		
		if var2661 == protoModule.wireTypes.varint then
			local _ = nil
			local var2666, var2667 = protoModule.readVarInt(p95, var2660)
			local _ = var2666
			var2660 = var2667
			continue
		end
		if var2661 == protoModule.wireTypes.lengthDelimited then
			if var2665 == 1 then
				local _ = nil
				local var2668, var2669 = protoModule.readBuffer(p95, var2660)
				var2660 = var2669
				var2659.id = buffer.tostring(var2668)
			elseif var2665 == 2 then
				local _ = nil
				local var2670, var2671 = protoModule.readBuffer(p95, var2660)
				var2660 = var2671
				var2659.type = buffer.tostring(var2670)
			else
				local _ = nil
				local var2672, var2673 = protoModule.readVarInt(p95, var2660)
				var2660 = var2673 + var2672
			end
		elseif var2661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2674, var2675 = protoModule.readFixed32(p95, var2660)
			local _ = var2674
			var2660 = var2675
		elseif var2661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2676, var2677 = protoModule.readFixed64(p95, var2660)
			local _ = var2676
			var2660 = var2677
		else
			error("Unsupported wire type: " .. var3905)
		end
	end
	return var2659
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
	local var2678 = t_95.new()
	
	if self.id ~= nil then
		var2678.id = self.id
	end
	if self.type ~= nil then
		var2678.type = self.type
	end
	return var2678
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
	local var2678 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2679, var2680 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2679, var3927 = protoModule.writeString(var2679, var2680, i)
			local var2681 = v:encode()
			var2680, var3929 = protoModule.writeTag(var2679, var2680, 2, protoModule.wireTypes.lengthDelimited)
			var2680, var3929 = protoModule.writeBuffer(var2680, var3929, var2681, buffer.len(var2681))
			local var2682 = var2680
			local var2683 = var3929
			local var2684, var2685 = protoModule.writeTag(buff, var2678, 1, protoModule.wireTypes.lengthDelimited)
			var2684, var3933 = protoModule.writeBuffer(var2684, var2685, var2682, var2683)
			buff = var2684
			var2678 = var2685
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2686, var2687 = protoModule.writeTag(buff, var2678, 2, protoModule.wireTypes.lengthDelimited)
			var2686, var3935 = protoModule.writeString(var2686, var2687, v)
			buff = var2686
			var2678 = var2687
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2688, var2689 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2688, var3937 = protoModule.writeString(var2688, var2689, i)
			local var2690 = v:encode()
			var2689, var3939 = protoModule.writeTag(var2688, var2689, 2, protoModule.wireTypes.lengthDelimited)
			var2689, var3939 = protoModule.writeBuffer(var2689, var3939, var2690, buffer.len(var2690))
			local var2691 = var2689
			local var2692 = var3939
			local var2693, var2694 = protoModule.writeTag(buff, var2678, 3, protoModule.wireTypes.lengthDelimited)
			var2693, var3943 = protoModule.writeBuffer(var2693, var2694, var2691, var2692)
			buff = var2693
			var2678 = var2694
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2695, var2696 = protoModule.writeTag(buff, var2678, 4, protoModule.wireTypes.lengthDelimited)
		var2695, var3945 = protoModule.writeString(var2695, var2696, self.search_session_id)
		buff = var2695
		var2678 = var2696
	end
	local buff_1 = buffer.create(var2678)
	buffer.copy(buff_1, 0, buff, 0, var2678)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2697 = t_96.new()
	local var2698 = 0
	while var2698 < buffer.len(p96) do
		local _ = nil
		local var2699 = nil
		local var2700, var2701, var2702 = protoModule.readTag(p96, var2698)
		local var2703 = var2700
		var2699 = var2701
		var2698 = var2702
		
		if var2699 == protoModule.wireTypes.varint then
			local _ = nil
			local var2704, var2705 = protoModule.readVarInt(p96, var2698)
			local _ = var2704
			var2698 = var2705
			continue
		end
		if var2699 == protoModule.wireTypes.lengthDelimited then
			if var2703 == 1 then
				local _ = nil
				local var2706, var2707 = protoModule.readBuffer(p96, var2698)
				var2698 = var2707
				var2706 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2706)
				var2697.entry_map[var2706.key or ""] = var2706.value or t.FeedEntry.new()
			elseif var2703 == 2 then
				local _ = nil
				local var2708, var2709 = protoModule.readBuffer(p96, var2698)
				var2698 = var2709
				table.insert(var2697.entry_order, buffer.tostring(var2708))
			elseif var2703 == 3 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p96, var2698)
				var2698 = var2711
				var2710 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2710)
				var2697.content_pools[var2710.key or ""] = var2710.value or t.ContentPool.new()
			elseif var2703 == 4 then
				local _ = nil
				local var2712, var2713 = protoModule.readBuffer(p96, var2698)
				var2698 = var2713
				var2697.search_session_id = buffer.tostring(var2712)
			else
				local _ = nil
				local var2714, var2715 = protoModule.readVarInt(p96, var2698)
				var2698 = var2715 + var2714
			end
		elseif var2699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2716, var2717 = protoModule.readFixed32(p96, var2698)
			local _ = var2716
			var2698 = var2717
		elseif var2699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2718, var2719 = protoModule.readFixed64(p96, var2698)
			local _ = var2718
			var2698 = var2719
		else
			error("Unsupported wire type: " .. var3949)
		end
	end
	return var2697
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
	local var2720 = t_96.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2720.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2720.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2720.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2720.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2720.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2720.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2720.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2720.search_session_id = self.searchSessionId
	end
	return var2720
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
	local var2721 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2722, var2723 = protoModule.writeTag(buff, var2721, 1, protoModule.wireTypes.lengthDelimited)
		var2722, var3984 = protoModule.writeString(var2722, var2723, self.key)
		buff = var2722
		var2721 = var2723
	end
	if self.value ~= nil then
		local var2724 = self.value:encode()
		local var2725, var2726 = protoModule.writeTag(buff, var2721, 2, protoModule.wireTypes.lengthDelimited)
		var2725, var3987 = protoModule.writeBuffer(var2725, var2726, var2724, buffer.len(var2724))
		buff = var2725
		var2721 = var2726
	end
	local buff_1 = buffer.create(var2721)
	buffer.copy(buff_1, 0, buff, 0, var2721)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2721 = t_97.new()
	local var2722 = 0
	while var2722 < buffer.len(p97) do
		local _ = nil
		local var2723 = nil
		local var2724, var2725, var2726 = protoModule.readTag(p97, var2722)
		local var2727 = var2724
		var2723 = var2725
		var2722 = var2726
		
		if var2723 == protoModule.wireTypes.varint then
			local _ = nil
			local var2728, var2729 = protoModule.readVarInt(p97, var2722)
			local _ = var2728
			var2722 = var2729
			continue
		end
		if var2723 == protoModule.wireTypes.lengthDelimited then
			if var2727 == 1 then
				local _ = nil
				local var2730, var2731 = protoModule.readBuffer(p97, var2722)
				var2722 = var2731
				var2721.key = buffer.tostring(var2730)
			elseif var2727 == 2 then
				local _ = nil
				local var2732, var2733 = protoModule.readBuffer(p97, var2722)
				var2722 = var2733
				var2721.value = t.FeedEntry.decode(var2732)
			else
				local _ = nil
				local var2734, var2735 = protoModule.readVarInt(p97, var2722)
				var2722 = var2735 + var2734
			end
		elseif var2723 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2736, var2737 = protoModule.readFixed32(p97, var2722)
			local _ = var2736
			var2722 = var2737
		elseif var2723 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2738, var2739 = protoModule.readFixed64(p97, var2722)
			local _ = var2738
			var2722 = var2739
		else
			error("Unsupported wire type: " .. var3991)
		end
	end
	return var2721
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
	local var2740 = t_97.new()
	
	if self.key ~= nil then
		var2740.key = self.key
	end
	if self.value ~= nil then
		var2740.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2740
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
	local var2740 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2741, var2742 = protoModule.writeTag(buff, var2740, 1, protoModule.wireTypes.lengthDelimited)
		var2741, var4013 = protoModule.writeString(var2741, var2742, self.key)
		buff = var2741
		var2740 = var2742
	end
	if self.value ~= nil then
		local var2743 = self.value:encode()
		local var2744, var2745 = protoModule.writeTag(buff, var2740, 2, protoModule.wireTypes.lengthDelimited)
		var2744, var4016 = protoModule.writeBuffer(var2744, var2745, var2743, buffer.len(var2743))
		buff = var2744
		var2740 = var2745
	end
	local buff_1 = buffer.create(var2740)
	buffer.copy(buff_1, 0, buff, 0, var2740)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2740 = t_98.new()
	local var2741 = 0
	while var2741 < buffer.len(p98) do
		local _ = nil
		local var2742 = nil
		local var2743, var2744, var2745 = protoModule.readTag(p98, var2741)
		local var2746 = var2743
		var2742 = var2744
		var2741 = var2745
		
		if var2742 == protoModule.wireTypes.varint then
			local _ = nil
			local var2747, var2748 = protoModule.readVarInt(p98, var2741)
			local _ = var2747
			var2741 = var2748
			continue
		end
		if var2742 == protoModule.wireTypes.lengthDelimited then
			if var2746 == 1 then
				local _ = nil
				local var2749, var2750 = protoModule.readBuffer(p98, var2741)
				var2741 = var2750
				var2740.key = buffer.tostring(var2749)
			elseif var2746 == 2 then
				local _ = nil
				local var2751, var2752 = protoModule.readBuffer(p98, var2741)
				var2741 = var2752
				var2740.value = t.ContentPool.decode(var2751)
			else
				local _ = nil
				local var2753, var2754 = protoModule.readVarInt(p98, var2741)
				var2741 = var2754 + var2753
			end
		elseif var2742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2755, var2756 = protoModule.readFixed32(p98, var2741)
			local _ = var2755
			var2741 = var2756
		elseif var2742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2757, var2758 = protoModule.readFixed64(p98, var2741)
			local _ = var2757
			var2741 = var2758
		else
			error("Unsupported wire type: " .. var4020)
		end
	end
	return var2740
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
	local var2759 = t_98.new()
	
	if self.key ~= nil then
		var2759.key = self.key
	end
	if self.value ~= nil then
		var2759.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2759
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
	local var2759 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2760, var2761 = protoModule.writeTag(buff, var2759, 1, protoModule.wireTypes.lengthDelimited)
		var2760, var4042 = protoModule.writeString(var2760, var2761, self.universe_id)
		buff = var2760
		var2759 = var2761
	end
	if self.is_content_locked then
		local var2762, var2763 = protoModule.writeTag(buff, var2759, 2, protoModule.wireTypes.varint)
		var2762, var4044 = protoModule.writeVarInt(var2762, var2763, if self.is_content_locked then 1 else 0)
		buff = var2762
		var2759 = var2763
	end
	local buff_1 = buffer.create(var2759)
	buffer.copy(buff_1, 0, buff, 0, var2759)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2759 = t_99.new()
	local var2760 = 0
	while var2760 < buffer.len(p99) do
		local _ = nil
		local var2761 = nil
		local var2762, var2763, var2764 = protoModule.readTag(p99, var2760)
		local var2765 = var2762
		var2761 = var2763
		var2760 = var2764
		
		if var2761 == protoModule.wireTypes.varint then
			if var2765 == 2 then
				local _ = nil
				local var2766, var2767 = protoModule.readVarInt(p99, var2760)
				var2760 = var2767
				var2759.is_content_locked = var2766 ~= 0
			else
				local _ = nil
				local var2768, var2769 = protoModule.readVarInt(p99, var2760)
				local _ = var2768
				var2760 = var2769
			end
		end
		if var2761 == protoModule.wireTypes.lengthDelimited then
			if var2765 == 1 then
				local _ = nil
				local var2770, var2771 = protoModule.readBuffer(p99, var2760)
				var2760 = var2771
				var2759.universe_id = buffer.tostring(var2770)
			else
				local _ = nil
				local var2772, var2773 = protoModule.readVarInt(p99, var2760)
				var2760 = var2773 + var2772
			end
		elseif var2761 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2774, var2775 = protoModule.readFixed32(p99, var2760)
			local _ = var2774
			var2760 = var2775
		elseif var2761 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2776, var2777 = protoModule.readFixed64(p99, var2760)
			local _ = var2776
			var2760 = var2777
		else
			error("Unsupported wire type: " .. var4048)
		end
	end
	return var2759
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
	local var2778 = t_99.new()
	
	if self.universe_id ~= nil then
		var2778.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2778.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2778.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2778.is_content_locked = self.isContentLocked
	end
	return var2778
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
	local var2778 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2779, var2780 = protoModule.writeTag(buff, var2778, 1, protoModule.wireTypes.lengthDelimited)
		var2779, var4070 = protoModule.writeString(var2779, var2780, self.overview_rich_text)
		buff = var2779
		var2778 = var2780
	end
	if self.result_entry ~= nil then
		local var2781 = self.result_entry:encode()
		local var2782, var2783 = protoModule.writeTag(buff, var2778, 2, protoModule.wireTypes.lengthDelimited)
		var2782, var4073 = protoModule.writeBuffer(var2782, var2783, var2781, buffer.len(var2781))
		buff = var2782
		var2778 = var2783
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2784, var2785 = protoModule.writeTag(buff, var2778, 3, protoModule.wireTypes.lengthDelimited)
			var2784, var4075 = protoModule.writeString(var2784, var2785, v)
			buff = var2784
			var2778 = var2785
		end
	end
	if self.show_loading then
		local var2786, var2787 = protoModule.writeTag(buff, var2778, 4, protoModule.wireTypes.varint)
		var2786, var4077 = protoModule.writeVarInt(var2786, var2787, if self.show_loading then 1 else 0)
		buff = var2786
		var2778 = var2787
	end
	if self.title ~= nil and self.title ~= "" then
		local var2788, var2789 = protoModule.writeTag(buff, var2778, 5, protoModule.wireTypes.lengthDelimited)
		var2788, var4079 = protoModule.writeString(var2788, var2789, self.title)
		buff = var2788
		var2778 = var2789
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2790, var2791 = protoModule.writeTag(buff, var2778, 6, protoModule.wireTypes.lengthDelimited)
		var2790, var4081 = protoModule.writeString(var2790, var2791, self.search_query)
		buff = var2790
		var2778 = var2791
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2792, var2793 = protoModule.writeTag(buff, var2778, 8, protoModule.wireTypes.lengthDelimited)
		var2792, var4083 = protoModule.writeString(var2792, var2793, self.universe_ids)
		buff = var2792
		var2778 = var2793
	end
	local buff_1 = buffer.create(var2778)
	buffer.copy(buff_1, 0, buff, 0, var2778)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2794 = t_100.new()
	local var2795 = 0
	while var2795 < buffer.len(p100) do
		local _ = nil
		local var2796 = nil
		local var2797, var2798, var2799 = protoModule.readTag(p100, var2795)
		local var2800 = var2797
		var2796 = var2798
		var2795 = var2799
		
		if var2796 == protoModule.wireTypes.varint then
			if var2800 == 4 then
				local _ = nil
				local var2801, var2802 = protoModule.readVarInt(p100, var2795)
				var2795 = var2802
				var2794.show_loading = var2801 ~= 0
			else
				local _ = nil
				local var2803, var2804 = protoModule.readVarInt(p100, var2795)
				local _ = var2803
				var2795 = var2804
			end
		end
		if var2796 == protoModule.wireTypes.lengthDelimited then
			if var2800 == 1 then
				local _ = nil
				local var2805, var2806 = protoModule.readBuffer(p100, var2795)
				var2795 = var2806
				var2794.overview_rich_text = buffer.tostring(var2805)
			elseif var2800 == 2 then
				local _ = nil
				local var2807, var2808 = protoModule.readBuffer(p100, var2795)
				var2795 = var2808
				var2794.result_entry = t.FeedEntry.decode(var2807)
			elseif var2800 == 3 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p100, var2795)
				var2795 = var2810
				table.insert(var2794.follow_up_queries, buffer.tostring(var2809))
			elseif var2800 == 5 then
				local _ = nil
				local var2811, var2812 = protoModule.readBuffer(p100, var2795)
				var2795 = var2812
				var2794.title = buffer.tostring(var2811)
			elseif var2800 == 6 then
				local _ = nil
				local var2813, var2814 = protoModule.readBuffer(p100, var2795)
				var2795 = var2814
				var2794.search_query = buffer.tostring(var2813)
			elseif var2800 == 8 then
				local _ = nil
				local var2815, var2816 = protoModule.readBuffer(p100, var2795)
				var2795 = var2816
				var2794.universe_ids = buffer.tostring(var2815)
			else
				local _ = nil
				local var2817, var2818 = protoModule.readVarInt(p100, var2795)
				var2795 = var2818 + var2817
			end
		elseif var2796 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2819, var2820 = protoModule.readFixed32(p100, var2795)
			local _ = var2819
			var2795 = var2820
		elseif var2796 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2821, var2822 = protoModule.readFixed64(p100, var2795)
			local _ = var2821
			var2795 = var2822
		else
			error("Unsupported wire type: " .. var4087)
		end
	end
	return var2794
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
	local var2823 = t_100.new()
	
	if self.overview_rich_text ~= nil then
		var2823.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2823.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2823.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2823.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2823.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2823.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2823.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2823.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2823.title = self.title
	end
	if self.search_query ~= nil then
		var2823.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2823.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2823.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2823.universe_ids = self.universeIds
	end
	return var2823
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
	local var2824 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2825, var2826 = protoModule.writeTag(buff, var2824, 1, protoModule.wireTypes.lengthDelimited)
		var2825, var4122 = protoModule.writeString(var2825, var2826, self.title)
		buff = var2825
		var2824 = var2826
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2827 = v:encode()
			local var2828, var2829 = protoModule.writeTag(buff, var2824, 2, protoModule.wireTypes.lengthDelimited)
			var2828, var4125 = protoModule.writeBuffer(var2828, var2829, var2827, buffer.len(var2827))
			buff = var2828
			var2824 = var2829
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2830, var2831 = protoModule.writeTag(buff, var2824, 3, protoModule.wireTypes.varint)
		var2830, var4127 = protoModule.writeVarInt(var2830, var2831, self.max_visible_rows)
		buff = var2830
		var2824 = var2831
	end
	if self.sort_id ~= nil then
		local var2832, var2833 = protoModule.writeTag(buff, var2824, 4, protoModule.wireTypes.lengthDelimited)
		var2832, var4129 = protoModule.writeString(var2832, var2833, self.sort_id)
		buff = var2832
		var2824 = var2833
	end
	local buff_1 = buffer.create(var2824)
	buffer.copy(buff_1, 0, buff, 0, var2824)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2834 = t_101.new()
	local var2835 = 0
	while var2835 < buffer.len(p101) do
		local _ = nil
		local var2836 = nil
		local var2837, var2838, var2839 = protoModule.readTag(p101, var2835)
		local var2840 = var2837
		var2836 = var2838
		var2835 = var2839
		
		if var2836 == protoModule.wireTypes.varint then
			if var2840 == 3 then
				local _ = nil
				local var2841, var2842 = protoModule.readVarIntI32(p101, var2835)
				var2835 = var2842
				var2834.max_visible_rows = var2841
			else
				local _ = nil
				local var2843, var2844 = protoModule.readVarInt(p101, var2835)
				local _ = var2843
				var2835 = var2844
			end
		end
		if var2836 == protoModule.wireTypes.lengthDelimited then
			if var2840 == 1 then
				local _ = nil
				local var2845, var2846 = protoModule.readBuffer(p101, var2835)
				var2835 = var2846
				var2834.title = buffer.tostring(var2845)
			elseif var2840 == 2 then
				local _ = nil
				local var2847, var2848 = protoModule.readBuffer(p101, var2835)
				var2835 = var2848
				table.insert(var2834.user_items, t.UserListInputData_UserItem.decode(var2847))
			elseif var2840 == 4 then
				local _ = nil
				local var2849, var2850 = protoModule.readBuffer(p101, var2835)
				var2835 = var2850
				var2834.sort_id = buffer.tostring(var2849)
			else
				local _ = nil
				local var2851, var2852 = protoModule.readVarInt(p101, var2835)
				var2835 = var2852 + var2851
			end
		elseif var2836 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2853, var2854 = protoModule.readFixed32(p101, var2835)
			local _ = var2853
			var2835 = var2854
		elseif var2836 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2855, var2856 = protoModule.readFixed64(p101, var2835)
			local _ = var2855
			var2835 = var2856
		else
			error("Unsupported wire type: " .. var4133)
		end
	end
	return var2834
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
	local var2857 = t_101.new()
	
	if self.title ~= nil then
		var2857.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2857.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2857.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2857.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2857.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2857.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2857.sort_id = self.sortId
	end
	return var2857
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
	local var2858 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2859, var2860 = protoModule.writeTag(buff, var2858, 1, protoModule.wireTypes.lengthDelimited)
		var2859, var4162 = protoModule.writeString(var2859, var2860, self.user_id)
		buff = var2859
		var2858 = var2860
	end
	local buff_1 = buffer.create(var2858)
	buffer.copy(buff_1, 0, buff, 0, var2858)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2858 = t_102.new()
	local var2859 = 0
	while var2859 < buffer.len(p102) do
		local _ = nil
		local var2860 = nil
		local var2861, var2862, var2863 = protoModule.readTag(p102, var2859)
		local var2864 = var2861
		var2860 = var2862
		var2859 = var2863
		
		if var2860 == protoModule.wireTypes.varint then
			local _ = nil
			local var2865, var2866 = protoModule.readVarInt(p102, var2859)
			local _ = var2865
			var2859 = var2866
			continue
		end
		if var2860 == protoModule.wireTypes.lengthDelimited then
			if var2864 == 1 then
				local _ = nil
				local var2867, var2868 = protoModule.readBuffer(p102, var2859)
				var2859 = var2868
				var2858.user_id = buffer.tostring(var2867)
			else
				local _ = nil
				local var2869, var2870 = protoModule.readVarInt(p102, var2859)
				var2859 = var2870 + var2869
			end
		elseif var2860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2871, var2872 = protoModule.readFixed32(p102, var2859)
			local _ = var2871
			var2859 = var2872
		elseif var2860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2873, var2874 = protoModule.readFixed64(p102, var2859)
			local _ = var2873
			var2859 = var2874
		else
			error("Unsupported wire type: " .. var4166)
		end
	end
	return var2858
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
	local var2875 = t_102.new()
	
	if self.user_id ~= nil then
		var2875.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2875.user_id = self.userId
	end
	return var2875
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
	local var2875 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2876, var2877 = protoModule.writeTag(buff, var2875, 1, protoModule.wireTypes.lengthDelimited)
		var2876, var4186 = protoModule.writeString(var2876, var2877, self.title)
		buff = var2876
		var2875 = var2877
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2878 = v:encode()
			local var2879, var2880 = protoModule.writeTag(buff, var2875, 2, protoModule.wireTypes.lengthDelimited)
			var2879, var4189 = protoModule.writeBuffer(var2879, var2880, var2878, buffer.len(var2878))
			buff = var2879
			var2875 = var2880
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2881, var2882 = protoModule.writeTag(buff, var2875, 3, protoModule.wireTypes.varint)
		var2881, var4191 = protoModule.writeVarInt(var2881, var2882, self.max_visible_rows)
		buff = var2881
		var2875 = var2882
	end
	if self.sort_id ~= nil then
		local var2883, var2884 = protoModule.writeTag(buff, var2875, 4, protoModule.wireTypes.lengthDelimited)
		var2883, var4193 = protoModule.writeString(var2883, var2884, self.sort_id)
		buff = var2883
		var2875 = var2884
	end
	local buff_1 = buffer.create(var2875)
	buffer.copy(buff_1, 0, buff, 0, var2875)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2885 = t_103.new()
	local var2886 = 0
	while var2886 < buffer.len(p103) do
		local _ = nil
		local var2887 = nil
		local var2888, var2889, var2890 = protoModule.readTag(p103, var2886)
		local var2891 = var2888
		var2887 = var2889
		var2886 = var2890
		
		if var2887 == protoModule.wireTypes.varint then
			if var2891 == 3 then
				local _ = nil
				local var2892, var2893 = protoModule.readVarIntI32(p103, var2886)
				var2886 = var2893
				var2885.max_visible_rows = var2892
			else
				local _ = nil
				local var2894, var2895 = protoModule.readVarInt(p103, var2886)
				local _ = var2894
				var2886 = var2895
			end
		end
		if var2887 == protoModule.wireTypes.lengthDelimited then
			if var2891 == 1 then
				local _ = nil
				local var2896, var2897 = protoModule.readBuffer(p103, var2886)
				var2886 = var2897
				var2885.title = buffer.tostring(var2896)
			elseif var2891 == 2 then
				local _ = nil
				local var2898, var2899 = protoModule.readBuffer(p103, var2886)
				var2886 = var2899
				table.insert(var2885.items, t.CatalogItemListInputData_CatalogItem.decode(var2898))
			elseif var2891 == 4 then
				local _ = nil
				local var2900, var2901 = protoModule.readBuffer(p103, var2886)
				var2886 = var2901
				var2885.sort_id = buffer.tostring(var2900)
			else
				local _ = nil
				local var2902, var2903 = protoModule.readVarInt(p103, var2886)
				var2886 = var2903 + var2902
			end
		elseif var2887 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2904, var2905 = protoModule.readFixed32(p103, var2886)
			local _ = var2904
			var2886 = var2905
		elseif var2887 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2906, var2907 = protoModule.readFixed64(p103, var2886)
			local _ = var2906
			var2886 = var2907
		else
			error("Unsupported wire type: " .. var4197)
		end
	end
	return var2885
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
	local var2908 = t_103.new()
	
	if self.title ~= nil then
		var2908.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2908.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2908.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2908.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2908.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2908.sort_id = self.sortId
	end
	return var2908
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
	local var2909 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2910, var2911 = protoModule.writeTag(buff, var2909, 1, protoModule.wireTypes.lengthDelimited)
		var2910, var4225 = protoModule.writeString(var2910, var2911, self.item_id)
		buff = var2910
		var2909 = var2911
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2912, var2913 = protoModule.writeTag(buff, var2909, 2, protoModule.wireTypes.lengthDelimited)
		var2912, var4227 = protoModule.writeString(var2912, var2913, self.item_type)
		buff = var2912
		var2909 = var2913
	end
	local buff_1 = buffer.create(var2909)
	buffer.copy(buff_1, 0, buff, 0, var2909)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2909 = t_104.new()
	local var2910 = 0
	while var2910 < buffer.len(p104) do
		local _ = nil
		local var2911 = nil
		local var2912, var2913, var2914 = protoModule.readTag(p104, var2910)
		local var2915 = var2912
		var2911 = var2913
		var2910 = var2914
		
		if var2911 == protoModule.wireTypes.varint then
			local _ = nil
			local var2916, var2917 = protoModule.readVarInt(p104, var2910)
			local _ = var2916
			var2910 = var2917
			continue
		end
		if var2911 == protoModule.wireTypes.lengthDelimited then
			if var2915 == 1 then
				local _ = nil
				local var2918, var2919 = protoModule.readBuffer(p104, var2910)
				var2910 = var2919
				var2909.item_id = buffer.tostring(var2918)
			elseif var2915 == 2 then
				local _ = nil
				local var2920, var2921 = protoModule.readBuffer(p104, var2910)
				var2910 = var2921
				var2909.item_type = buffer.tostring(var2920)
			else
				local _ = nil
				local var2922, var2923 = protoModule.readVarInt(p104, var2910)
				var2910 = var2923 + var2922
			end
		elseif var2911 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2924, var2925 = protoModule.readFixed32(p104, var2910)
			local _ = var2924
			var2910 = var2925
		elseif var2911 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2926, var2927 = protoModule.readFixed64(p104, var2910)
			local _ = var2926
			var2910 = var2927
		else
			error("Unsupported wire type: " .. var4231)
		end
	end
	return var2909
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
	local var2928 = t_104.new()
	
	if self.item_id ~= nil then
		var2928.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2928.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2928.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2928.item_type = self.itemType
	end
	return var2928
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
	local var2928 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2929, var2930 = protoModule.writeTag(buff, var2928, 1, protoModule.wireTypes.lengthDelimited)
		var2929, var4253 = protoModule.writeString(var2929, var2930, self.universe_id)
		buff = var2929
		var2928 = var2930
	end
	local buff_1 = buffer.create(var2928)
	buffer.copy(buff_1, 0, buff, 0, var2928)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2928 = t_105.new()
	local var2929 = 0
	while var2929 < buffer.len(p105) do
		local _ = nil
		local var2930 = nil
		local var2931, var2932, var2933 = protoModule.readTag(p105, var2929)
		local var2934 = var2931
		var2930 = var2932
		var2929 = var2933
		
		if var2930 == protoModule.wireTypes.varint then
			local _ = nil
			local var2935, var2936 = protoModule.readVarInt(p105, var2929)
			local _ = var2935
			var2929 = var2936
			continue
		end
		if var2930 == protoModule.wireTypes.lengthDelimited then
			if var2934 == 1 then
				local _ = nil
				local var2937, var2938 = protoModule.readBuffer(p105, var2929)
				var2929 = var2938
				var2928.universe_id = buffer.tostring(var2937)
			else
				local _ = nil
				local var2939, var2940 = protoModule.readVarInt(p105, var2929)
				var2929 = var2940 + var2939
			end
		elseif var2930 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2941, var2942 = protoModule.readFixed32(p105, var2929)
			local _ = var2941
			var2929 = var2942
		elseif var2930 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2943, var2944 = protoModule.readFixed64(p105, var2929)
			local _ = var2943
			var2929 = var2944
		else
			error("Unsupported wire type: " .. var4257)
		end
	end
	return var2928
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
	local var2945 = t_105.new()
	
	if self.universe_id ~= nil then
		var2945.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2945.universe_id = self.universeId
	end
	return var2945
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
	local var2945 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2946, var2947 = protoModule.writeTag(buff, var2945, 1, protoModule.wireTypes.lengthDelimited)
		var2946, var4277 = protoModule.writeString(var2946, var2947, self.title)
		buff = var2946
		var2945 = var2947
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2948, var2949 = protoModule.writeTag(buff, var2945, 2, protoModule.wireTypes.lengthDelimited)
		var2948, var4279 = protoModule.writeString(var2948, var2949, self.subtitle)
		buff = var2948
		var2945 = var2949
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2950 = v:encode()
			local var2951, var2952 = protoModule.writeTag(buff, var2945, 3, protoModule.wireTypes.lengthDelimited)
			var2951, var4282 = protoModule.writeBuffer(var2951, var2952, var2950, buffer.len(var2950))
			buff = var2951
			var2945 = var2952
		end
	end
	local buff_1 = buffer.create(var2945)
	buffer.copy(buff_1, 0, buff, 0, var2945)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2953 = t_106.new()
	local var2954 = 0
	while var2954 < buffer.len(p106) do
		local _ = nil
		local var2955 = nil
		local var2956, var2957, var2958 = protoModule.readTag(p106, var2954)
		local var2959 = var2956
		var2955 = var2957
		var2954 = var2958
		
		if var2955 == protoModule.wireTypes.varint then
			local _ = nil
			local var2960, var2961 = protoModule.readVarInt(p106, var2954)
			local _ = var2960
			var2954 = var2961
			continue
		end
		if var2955 == protoModule.wireTypes.lengthDelimited then
			if var2959 == 1 then
				local _ = nil
				local var2962, var2963 = protoModule.readBuffer(p106, var2954)
				var2954 = var2963
				var2953.title = buffer.tostring(var2962)
			elseif var2959 == 2 then
				local _ = nil
				local var2964, var2965 = protoModule.readBuffer(p106, var2954)
				var2954 = var2965
				var2953.subtitle = buffer.tostring(var2964)
			elseif var2959 == 3 then
				local _ = nil
				local var2966, var2967 = protoModule.readBuffer(p106, var2954)
				var2954 = var2967
				table.insert(var2953.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2966))
			else
				local _ = nil
				local var2968, var2969 = protoModule.readVarInt(p106, var2954)
				var2954 = var2969 + var2968
			end
		elseif var2955 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2970, var2971 = protoModule.readFixed32(p106, var2954)
			local _ = var2970
			var2954 = var2971
		elseif var2955 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2972, var2973 = protoModule.readFixed64(p106, var2954)
			local _ = var2972
			var2954 = var2973
		else
			error("Unsupported wire type: " .. var4286)
		end
	end
	return var2953
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
	local var2974 = t_106.new()
	
	if self.title ~= nil then
		var2974.title = self.title
	end
	if self.subtitle ~= nil then
		var2974.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2974.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2974.moment_items = t_1
	end
	return var2974
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
	local var2975 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2976, var2977 = protoModule.writeTag(buff, var2975, 1, protoModule.wireTypes.lengthDelimited)
		var2976, var4313 = protoModule.writeString(var2976, var2977, self.moment_id)
		buff = var2976
		var2975 = var2977
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2978, var2979 = protoModule.writeTag(buff, var2975, 2, protoModule.wireTypes.lengthDelimited)
		var2978, var4315 = protoModule.writeString(var2978, var2979, self.video_asset_id)
		buff = var2978
		var2975 = var2979
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2980, var2981 = protoModule.writeTag(buff, var2975, 3, protoModule.wireTypes.lengthDelimited)
		var2980, var4317 = protoModule.writeString(var2980, var2981, self.target_universe_id)
		buff = var2980
		var2975 = var2981
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2982, var2983 = protoModule.writeTag(buff, var2975, 4, protoModule.wireTypes.lengthDelimited)
		var2982, var4319 = protoModule.writeString(var2982, var2983, self.target_place_id)
		buff = var2982
		var2975 = var2983
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2984, var2985 = protoModule.writeTag(buff, var2975, 5, protoModule.wireTypes.lengthDelimited)
		var2984, var4321 = protoModule.writeString(var2984, var2985, self.feed_item_id)
		buff = var2984
		var2975 = var2985
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2986, var2987 = protoModule.writeTag(buff, var2975, 6, protoModule.wireTypes.lengthDelimited)
		var2986, var4323 = protoModule.writeString(var2986, var2987, self.capture_universe_id)
		buff = var2986
		var2975 = var2987
	end
	local buff_1 = buffer.create(var2975)
	buffer.copy(buff_1, 0, buff, 0, var2975)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2975 = t_107.new()
	local var2976 = 0
	while var2976 < buffer.len(p107) do
		local _ = nil
		local var2977 = nil
		local var2978, var2979, var2980 = protoModule.readTag(p107, var2976)
		local var2981 = var2978
		var2977 = var2979
		var2976 = var2980
		
		if var2977 == protoModule.wireTypes.varint then
			local _ = nil
			local var2982, var2983 = protoModule.readVarInt(p107, var2976)
			local _ = var2982
			var2976 = var2983
			continue
		end
		if var2977 == protoModule.wireTypes.lengthDelimited then
			if var2981 == 1 then
				local _ = nil
				local var2984, var2985 = protoModule.readBuffer(p107, var2976)
				var2976 = var2985
				var2975.moment_id = buffer.tostring(var2984)
			elseif var2981 == 2 then
				local _ = nil
				local var2986, var2987 = protoModule.readBuffer(p107, var2976)
				var2976 = var2987
				var2975.video_asset_id = buffer.tostring(var2986)
			elseif var2981 == 3 then
				local _ = nil
				local var2988, var2989 = protoModule.readBuffer(p107, var2976)
				var2976 = var2989
				var2975.target_universe_id = buffer.tostring(var2988)
			elseif var2981 == 4 then
				local _ = nil
				local var2990, var2991 = protoModule.readBuffer(p107, var2976)
				var2976 = var2991
				var2975.target_place_id = buffer.tostring(var2990)
			elseif var2981 == 5 then
				local _ = nil
				local var2992, var2993 = protoModule.readBuffer(p107, var2976)
				var2976 = var2993
				var2975.feed_item_id = buffer.tostring(var2992)
			elseif var2981 == 6 then
				local _ = nil
				local var2994, var2995 = protoModule.readBuffer(p107, var2976)
				var2976 = var2995
				var2975.capture_universe_id = buffer.tostring(var2994)
			else
				local _ = nil
				local var2996, var2997 = protoModule.readVarInt(p107, var2976)
				var2976 = var2997 + var2996
			end
		elseif var2977 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2998, var2999 = protoModule.readFixed32(p107, var2976)
			local _ = var2998
			var2976 = var2999
		elseif var2977 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3000, var3001 = protoModule.readFixed64(p107, var2976)
			local _ = var3000
			var2976 = var3001
		else
			error("Unsupported wire type: " .. var4327)
		end
	end
	return var2975
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
	local var3002 = t_107.new()
	
	if self.moment_id ~= nil then
		var3002.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3002.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3002.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3002.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3002.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3002.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3002.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3002.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3002.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3002.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3002.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3002.capture_universe_id = self.captureUniverseId
	end
	return var3002
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
	local var3002 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3003, var3004 = protoModule.writeTag(buff, var3002, 1, protoModule.wireTypes.lengthDelimited)
		var3003, var4357 = protoModule.writeString(var3003, var3004, self.title)
		buff = var3003
		var3002 = var3004
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3005, var3006 = protoModule.writeTag(buff, var3002, 2, protoModule.wireTypes.lengthDelimited)
		var3005, var4359 = protoModule.writeString(var3005, var3006, self.subtitle)
		buff = var3005
		var3002 = var3006
	end
	local buff_1 = buffer.create(var3002)
	buffer.copy(buff_1, 0, buff, 0, var3002)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var3002 = t_108.new()
	local var3003 = 0
	while var3003 < buffer.len(p108) do
		local _ = nil
		local var3004 = nil
		local var3005, var3006, var3007 = protoModule.readTag(p108, var3003)
		local var3008 = var3005
		var3004 = var3006
		var3003 = var3007
		
		if var3004 == protoModule.wireTypes.varint then
			local _ = nil
			local var3009, var3010 = protoModule.readVarInt(p108, var3003)
			local _ = var3009
			var3003 = var3010
			continue
		end
		if var3004 == protoModule.wireTypes.lengthDelimited then
			if var3008 == 1 then
				local _ = nil
				local var3011, var3012 = protoModule.readBuffer(p108, var3003)
				var3003 = var3012
				var3002.title = buffer.tostring(var3011)
			elseif var3008 == 2 then
				local _ = nil
				local var3013, var3014 = protoModule.readBuffer(p108, var3003)
				var3003 = var3014
				var3002.subtitle = buffer.tostring(var3013)
			else
				local _ = nil
				local var3015, var3016 = protoModule.readVarInt(p108, var3003)
				var3003 = var3016 + var3015
			end
		elseif var3004 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3017, var3018 = protoModule.readFixed32(p108, var3003)
			local _ = var3017
			var3003 = var3018
		elseif var3004 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3019, var3020 = protoModule.readFixed64(p108, var3003)
			local _ = var3019
			var3003 = var3020
		else
			error("Unsupported wire type: " .. var4363)
		end
	end
	return var3002
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
	local var3021 = t_108.new()
	
	if self.title ~= nil then
		var3021.title = self.title
	end
	if self.subtitle ~= nil then
		var3021.subtitle = self.subtitle
	end
	return var3021
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
	local var3021 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3022, var3023 = protoModule.writeTag(buff, var3021, 1, protoModule.wireTypes.lengthDelimited)
		var3022, var4385 = protoModule.writeString(var3022, var3023, self.primary_cta_button_text)
		buff = var3022
		var3021 = var3023
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3024, var3025 = protoModule.writeTag(buff, var3021, 2, protoModule.wireTypes.lengthDelimited)
		var3024, var4387 = protoModule.writeString(var3024, var3025, self.secondary_cta_button_text)
		buff = var3024
		var3021 = var3025
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3026, var3027 = protoModule.writeTag(buff, var3021, 3, protoModule.wireTypes.lengthDelimited)
		var3026, var4389 = protoModule.writeString(var3026, var3027, self.primary_cta_type)
		buff = var3026
		var3021 = var3027
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3028, var3029 = protoModule.writeTag(buff, var3021, 4, protoModule.wireTypes.lengthDelimited)
		var3028, var4391 = protoModule.writeString(var3028, var3029, self.secondary_cta_type)
		buff = var3028
		var3021 = var3029
	end
	local buff_1 = buffer.create(var3021)
	buffer.copy(buff_1, 0, buff, 0, var3021)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var3021 = t_109.new()
	local var3022 = 0
	while var3022 < buffer.len(p109) do
		local _ = nil
		local var3023 = nil
		local var3024, var3025, var3026 = protoModule.readTag(p109, var3022)
		local var3027 = var3024
		var3023 = var3025
		var3022 = var3026
		
		if var3023 == protoModule.wireTypes.varint then
			local _ = nil
			local var3028, var3029 = protoModule.readVarInt(p109, var3022)
			local _ = var3028
			var3022 = var3029
			continue
		end
		if var3023 == protoModule.wireTypes.lengthDelimited then
			if var3027 == 1 then
				local _ = nil
				local var3030, var3031 = protoModule.readBuffer(p109, var3022)
				var3022 = var3031
				var3021.primary_cta_button_text = buffer.tostring(var3030)
			elseif var3027 == 2 then
				local _ = nil
				local var3032, var3033 = protoModule.readBuffer(p109, var3022)
				var3022 = var3033
				var3021.secondary_cta_button_text = buffer.tostring(var3032)
			elseif var3027 == 3 then
				local _ = nil
				local var3034, var3035 = protoModule.readBuffer(p109, var3022)
				var3022 = var3035
				var3021.primary_cta_type = buffer.tostring(var3034)
			elseif var3027 == 4 then
				local _ = nil
				local var3036, var3037 = protoModule.readBuffer(p109, var3022)
				var3022 = var3037
				var3021.secondary_cta_type = buffer.tostring(var3036)
			else
				local _ = nil
				local var3038, var3039 = protoModule.readVarInt(p109, var3022)
				var3022 = var3039 + var3038
			end
		elseif var3023 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3040, var3041 = protoModule.readFixed32(p109, var3022)
			local _ = var3040
			var3022 = var3041
		elseif var3023 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3042, var3043 = protoModule.readFixed64(p109, var3022)
			local _ = var3042
			var3022 = var3043
		else
			error("Unsupported wire type: " .. var4395)
		end
	end
	return var3021
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
	local var3044 = t_109.new()
	
	if self.primary_cta_button_text ~= nil then
		var3044.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3044.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3044.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3044.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3044.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3044.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3044.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3044.secondary_cta_type = self.secondaryCtaType
	end
	return var3044
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
	local var3044 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3045, var3046 = protoModule.writeTag(buff, var3044, 1, protoModule.wireTypes.lengthDelimited)
		var3045, var4421 = protoModule.writeString(var3045, var3046, self.image_asset_id)
		buff = var3045
		var3044 = var3046
	end
	local buff_1 = buffer.create(var3044)
	buffer.copy(buff_1, 0, buff, 0, var3044)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3044 = t_110.new()
	local var3045 = 0
	while var3045 < buffer.len(p110) do
		local _ = nil
		local var3046 = nil
		local var3047, var3048, var3049 = protoModule.readTag(p110, var3045)
		local var3050 = var3047
		var3046 = var3048
		var3045 = var3049
		
		if var3046 == protoModule.wireTypes.varint then
			local _ = nil
			local var3051, var3052 = protoModule.readVarInt(p110, var3045)
			local _ = var3051
			var3045 = var3052
			continue
		end
		if var3046 == protoModule.wireTypes.lengthDelimited then
			if var3050 == 1 then
				local _ = nil
				local var3053, var3054 = protoModule.readBuffer(p110, var3045)
				var3045 = var3054
				var3044.image_asset_id = buffer.tostring(var3053)
			else
				local _ = nil
				local var3055, var3056 = protoModule.readVarInt(p110, var3045)
				var3045 = var3056 + var3055
			end
		elseif var3046 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3057, var3058 = protoModule.readFixed32(p110, var3045)
			local _ = var3057
			var3045 = var3058
		elseif var3046 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3059, var3060 = protoModule.readFixed64(p110, var3045)
			local _ = var3059
			var3045 = var3060
		else
			error("Unsupported wire type: " .. var4425)
		end
	end
	return var3044
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
	local var3061 = t_110.new()
	
	if self.image_asset_id ~= nil then
		var3061.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3061.image_asset_id = self.imageAssetId
	end
	return var3061
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
	local var3061 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3062, var3063 = protoModule.writeTag(buff, var3061, 1, protoModule.wireTypes.lengthDelimited)
		var3062, var4445 = protoModule.writeString(var3062, var3063, self.video_asset_id)
		buff = var3062
		var3061 = var3063
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3064, var3065 = protoModule.writeTag(buff, var3061, 2, protoModule.wireTypes.lengthDelimited)
		var3064, var4447 = protoModule.writeString(var3064, var3065, self.loading_image_asset_id)
		buff = var3064
		var3061 = var3065
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local var3066, var3067 = protoModule.writeTag(buff, var3061, 3, protoModule.wireTypes.lengthDelimited)
		var3066, var4449 = protoModule.writeString(var3066, var3067, self.max_quality)
		buff = var3066
		var3061 = var3067
	end
	if self.adaptive_resolution then
		local var3068, var3069 = protoModule.writeTag(buff, var3061, 4, protoModule.wireTypes.varint)
		var3068, var4451 = protoModule.writeVarInt(var3068, var3069, if self.adaptive_resolution then 1 else 0)
		buff = var3068
		var3061 = var3069
	end
	local buff_1 = buffer.create(var3061)
	buffer.copy(buff_1, 0, buff, 0, var3061)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3061 = t_111.new()
	local var3062 = 0
	while var3062 < buffer.len(p111) do
		local _ = nil
		local var3063 = nil
		local var3064, var3065, var3066 = protoModule.readTag(p111, var3062)
		local var3067 = var3064
		var3063 = var3065
		var3062 = var3066
		
		if var3063 == protoModule.wireTypes.varint then
			if var3067 == 4 then
				local _ = nil
				local var3068, var3069 = protoModule.readVarInt(p111, var3062)
				var3062 = var3069
				var3061.adaptive_resolution = var3068 ~= 0
			else
				local _ = nil
				local var3070, var3071 = protoModule.readVarInt(p111, var3062)
				local _ = var3070
				var3062 = var3071
			end
		end
		if var3063 == protoModule.wireTypes.lengthDelimited then
			if var3067 == 1 then
				local _ = nil
				local var3072, var3073 = protoModule.readBuffer(p111, var3062)
				var3062 = var3073
				var3061.video_asset_id = buffer.tostring(var3072)
			elseif var3067 == 2 then
				local _ = nil
				local var3074, var3075 = protoModule.readBuffer(p111, var3062)
				var3062 = var3075
				var3061.loading_image_asset_id = buffer.tostring(var3074)
			elseif var3067 == 3 then
				local _ = nil
				local var3076, var3077 = protoModule.readBuffer(p111, var3062)
				var3062 = var3077
				var3061.max_quality = buffer.tostring(var3076)
			else
				local _ = nil
				local var3078, var3079 = protoModule.readVarInt(p111, var3062)
				var3062 = var3079 + var3078
			end
		elseif var3063 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3080, var3081 = protoModule.readFixed32(p111, var3062)
			local _ = var3080
			var3062 = var3081
		elseif var3063 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3082, var3083 = protoModule.readFixed64(p111, var3062)
			local _ = var3082
			var3062 = var3083
		else
			error("Unsupported wire type: " .. var4455)
		end
	end
	return var3061
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
	local var3084 = t_111.new()
	
	if self.video_asset_id ~= nil then
		var3084.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3084.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3084.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3084.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		var3084.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		var3084.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		var3084.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		var3084.adaptive_resolution = self.adaptiveResolution
	end
	return var3084
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
	local var3084 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3085, var3086 = protoModule.writeTag(buff, var3084, 1, protoModule.wireTypes.lengthDelimited)
		var3085, var4481 = protoModule.writeString(var3085, var3086, self.text)
		buff = var3085
		var3084 = var3086
	end
	if self.is_rendered_text then
		local var3087, var3088 = protoModule.writeTag(buff, var3084, 2, protoModule.wireTypes.varint)
		var3087, var4483 = protoModule.writeVarInt(var3087, var3088, if self.is_rendered_text then 1 else 0)
		buff = var3087
		var3084 = var3088
	end
	if self.url ~= nil and self.url ~= "" then
		local var3089, var3090 = protoModule.writeTag(buff, var3084, 3, protoModule.wireTypes.lengthDelimited)
		var3089, var4485 = protoModule.writeString(var3089, var3090, self.url)
		buff = var3089
		var3084 = var3090
	end
	local buff_1 = buffer.create(var3084)
	buffer.copy(buff_1, 0, buff, 0, var3084)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref)
	local var3084 = t_112.new()
	local var3085 = 0
	while var3085 < buffer.len(p112) do
		local _ = nil
		local var3086 = nil
		local var3087, var3088, var3089 = protoModule.readTag(p112, var3085)
		local var3090 = var3087
		var3086 = var3088
		var3085 = var3089
		
		if var3086 == protoModule.wireTypes.varint then
			if var3090 == 2 then
				local _ = nil
				local var3091, var3092 = protoModule.readVarInt(p112, var3085)
				var3085 = var3092
				var3084.is_rendered_text = var3091 ~= 0
			else
				local _ = nil
				local var3093, var3094 = protoModule.readVarInt(p112, var3085)
				local _ = var3093
				var3085 = var3094
			end
		end
		if var3086 == protoModule.wireTypes.lengthDelimited then
			if var3090 == 1 then
				local _ = nil
				local var3095, var3096 = protoModule.readBuffer(p112, var3085)
				var3085 = var3096
				var3084.text = buffer.tostring(var3095)
			elseif var3090 == 3 then
				local _ = nil
				local var3097, var3098 = protoModule.readBuffer(p112, var3085)
				var3085 = var3098
				var3084.url = buffer.tostring(var3097)
			else
				local _ = nil
				local var3099, var3100 = protoModule.readVarInt(p112, var3085)
				var3085 = var3100 + var3099
			end
		elseif var3086 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3101, var3102 = protoModule.readFixed32(p112, var3085)
			local _ = var3101
			var3085 = var3102
		elseif var3086 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3103, var3104 = protoModule.readFixed64(p112, var3085)
			local _ = var3103
			var3085 = var3104
		else
			error("Unsupported wire type: " .. var4489)
		end
	end
	return var3084
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
	local var3105 = t_112.new()
	
	if self.text ~= nil then
		var3105.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3105.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3105.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		var3105.url = self.url
	end
	return var3105
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
	local var3105 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3106, var3107 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3106, var4513 = protoModule.writeString(var3106, var3107, i)
			local var3108 = v:encode()
			var3107, var4515 = protoModule.writeTag(var3106, var3107, 2, protoModule.wireTypes.lengthDelimited)
			var3107, var4515 = protoModule.writeBuffer(var3107, var4515, var3108, buffer.len(var3108))
			local var3109 = var3107
			local var3110 = var4515
			local var3111, var3112 = protoModule.writeTag(buff, var3105, 1, protoModule.wireTypes.lengthDelimited)
			var3111, var4519 = protoModule.writeBuffer(var3111, var3112, var3109, var3110)
			buff = var3111
			var3105 = var3112
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3113, var3114 = protoModule.writeTag(buff, var3105, 2, protoModule.wireTypes.lengthDelimited)
			var3113, var4521 = protoModule.writeString(var3113, var3114, v)
			buff = var3113
			var3105 = var3114
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3115, var3116 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3115, var4523 = protoModule.writeString(var3115, var3116, i)
			local var3117 = v:encode()
			var3116, var4525 = protoModule.writeTag(var3115, var3116, 2, protoModule.wireTypes.lengthDelimited)
			var3116, var4525 = protoModule.writeBuffer(var3116, var4525, var3117, buffer.len(var3117))
			local var3118 = var3116
			local var3119 = var4525
			local var3120, var3121 = protoModule.writeTag(buff, var3105, 3, protoModule.wireTypes.lengthDelimited)
			var3120, var4529 = protoModule.writeBuffer(var3120, var3121, var3118, var3119)
			buff = var3120
			var3105 = var3121
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3122, var3123 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3122, var4531 = protoModule.writeString(var3122, var3123, i)
			local var3124 = v:encode()
			var3123, var4533 = protoModule.writeTag(var3122, var3123, 2, protoModule.wireTypes.lengthDelimited)
			var3123, var4533 = protoModule.writeBuffer(var3123, var4533, var3124, buffer.len(var3124))
			local var3125 = var3123
			local var3126 = var4533
			local var3127, var3128 = protoModule.writeTag(buff, var3105, 4, protoModule.wireTypes.lengthDelimited)
			var3127, var4537 = protoModule.writeBuffer(var3127, var3128, var3125, var3126)
			buff = var3127
			var3105 = var3128
		end
	end
	local buff_1 = buffer.create(var3105)
	buffer.copy(buff_1, 0, buff, 0, var3105)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3129 = t_113.new()
	local var3130 = 0
	while var3130 < buffer.len(p113) do
		local _ = nil
		local var3131 = nil
		local var3132, var3133, var3134 = protoModule.readTag(p113, var3130)
		local var3135 = var3132
		var3131 = var3133
		var3130 = var3134
		
		if var3131 == protoModule.wireTypes.varint then
			local _ = nil
			local var3136, var3137 = protoModule.readVarInt(p113, var3130)
			local _ = var3136
			var3130 = var3137
			continue
		end
		if var3131 == protoModule.wireTypes.lengthDelimited then
			if var3135 == 1 then
				local _ = nil
				local var3138, var3139 = protoModule.readBuffer(p113, var3130)
				var3130 = var3139
				var3138 = t.VerticalFeedInputData_EntryMapEntry.decode(var3138)
				var3129.entry_map[var3138.key or ""] = var3138.value or t.FeedEntry.new()
			elseif var3135 == 2 then
				local _ = nil
				local var3140, var3141 = protoModule.readBuffer(p113, var3130)
				var3130 = var3141
				table.insert(var3129.entry_order, buffer.tostring(var3140))
			elseif var3135 == 3 then
				local _ = nil
				local var3142, var3143 = protoModule.readBuffer(p113, var3130)
				var3130 = var3143
				var3142 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3142)
				var3129.entry_order_map[var3142.key or ""] = var3142.value or t.EntryOrder.new()
			elseif var3135 == 4 then
				local _ = nil
				local var3144, var3145 = protoModule.readBuffer(p113, var3130)
				var3130 = var3145
				var3144 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3144)
				var3129.content_pools[var3144.key or ""] = var3144.value or t.ContentPool.new()
			else
				local _ = nil
				local var3146, var3147 = protoModule.readVarInt(p113, var3130)
				var3130 = var3147 + var3146
			end
		elseif var3131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3148, var3149 = protoModule.readFixed32(p113, var3130)
			local _ = var3148
			var3130 = var3149
		elseif var3131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3150, var3151 = protoModule.readFixed64(p113, var3130)
			local _ = var3150
			var3130 = var3151
		else
			error("Unsupported wire type: " .. var4541)
		end
	end
	return var3129
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
	local var3152 = t_113.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3152.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3152.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3152.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3152.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3152.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3152.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3152.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3152.content_pools = t_1
	end
	return var3152
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
	local var3153 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3154, var3155 = protoModule.writeTag(buff, var3153, 1, protoModule.wireTypes.lengthDelimited)
		var3154, var4579 = protoModule.writeString(var3154, var3155, self.key)
		buff = var3154
		var3153 = var3155
	end
	if self.value ~= nil then
		local var3156 = self.value:encode()
		local var3157, var3158 = protoModule.writeTag(buff, var3153, 2, protoModule.wireTypes.lengthDelimited)
		var3157, var4582 = protoModule.writeBuffer(var3157, var3158, var3156, buffer.len(var3156))
		buff = var3157
		var3153 = var3158
	end
	local buff_1 = buffer.create(var3153)
	buffer.copy(buff_1, 0, buff, 0, var3153)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3153 = t_114.new()
	local var3154 = 0
	while var3154 < buffer.len(p114) do
		local _ = nil
		local var3155 = nil
		local var3156, var3157, var3158 = protoModule.readTag(p114, var3154)
		local var3159 = var3156
		var3155 = var3157
		var3154 = var3158
		
		if var3155 == protoModule.wireTypes.varint then
			local _ = nil
			local var3160, var3161 = protoModule.readVarInt(p114, var3154)
			local _ = var3160
			var3154 = var3161
			continue
		end
		if var3155 == protoModule.wireTypes.lengthDelimited then
			if var3159 == 1 then
				local _ = nil
				local var3162, var3163 = protoModule.readBuffer(p114, var3154)
				var3154 = var3163
				var3153.key = buffer.tostring(var3162)
			elseif var3159 == 2 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p114, var3154)
				var3154 = var3165
				var3153.value = t.FeedEntry.decode(var3164)
			else
				local _ = nil
				local var3166, var3167 = protoModule.readVarInt(p114, var3154)
				var3154 = var3167 + var3166
			end
		elseif var3155 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3168, var3169 = protoModule.readFixed32(p114, var3154)
			local _ = var3168
			var3154 = var3169
		elseif var3155 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3170, var3171 = protoModule.readFixed64(p114, var3154)
			local _ = var3170
			var3154 = var3171
		else
			error("Unsupported wire type: " .. var4586)
		end
	end
	return var3153
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
	local var3172 = t_114.new()
	
	if self.key ~= nil then
		var3172.key = self.key
	end
	if self.value ~= nil then
		var3172.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3172
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
	local var3172 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3173, var3174 = protoModule.writeTag(buff, var3172, 1, protoModule.wireTypes.lengthDelimited)
		var3173, var4608 = protoModule.writeString(var3173, var3174, self.key)
		buff = var3173
		var3172 = var3174
	end
	if self.value ~= nil then
		local var3175 = self.value:encode()
		local var3176, var3177 = protoModule.writeTag(buff, var3172, 2, protoModule.wireTypes.lengthDelimited)
		var3176, var4611 = protoModule.writeBuffer(var3176, var3177, var3175, buffer.len(var3175))
		buff = var3176
		var3172 = var3177
	end
	local buff_1 = buffer.create(var3172)
	buffer.copy(buff_1, 0, buff, 0, var3172)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3172 = t_115.new()
	local var3173 = 0
	while var3173 < buffer.len(p115) do
		local _ = nil
		local var3174 = nil
		local var3175, var3176, var3177 = protoModule.readTag(p115, var3173)
		local var3178 = var3175
		var3174 = var3176
		var3173 = var3177
		
		if var3174 == protoModule.wireTypes.varint then
			local _ = nil
			local var3179, var3180 = protoModule.readVarInt(p115, var3173)
			local _ = var3179
			var3173 = var3180
			continue
		end
		if var3174 == protoModule.wireTypes.lengthDelimited then
			if var3178 == 1 then
				local _ = nil
				local var3181, var3182 = protoModule.readBuffer(p115, var3173)
				var3173 = var3182
				var3172.key = buffer.tostring(var3181)
			elseif var3178 == 2 then
				local _ = nil
				local var3183, var3184 = protoModule.readBuffer(p115, var3173)
				var3173 = var3184
				var3172.value = t.EntryOrder.decode(var3183)
			else
				local _ = nil
				local var3185, var3186 = protoModule.readVarInt(p115, var3173)
				var3173 = var3186 + var3185
			end
		elseif var3174 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3187, var3188 = protoModule.readFixed32(p115, var3173)
			local _ = var3187
			var3173 = var3188
		elseif var3174 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3189, var3190 = protoModule.readFixed64(p115, var3173)
			local _ = var3189
			var3173 = var3190
		else
			error("Unsupported wire type: " .. var4615)
		end
	end
	return var3172
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
	local var3191 = t_115.new()
	
	if self.key ~= nil then
		var3191.key = self.key
	end
	if self.value ~= nil then
		var3191.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3191
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
	local var3191 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3192, var3193 = protoModule.writeTag(buff, var3191, 1, protoModule.wireTypes.lengthDelimited)
		var3192, var4637 = protoModule.writeString(var3192, var3193, self.key)
		buff = var3192
		var3191 = var3193
	end
	if self.value ~= nil then
		local var3194 = self.value:encode()
		local var3195, var3196 = protoModule.writeTag(buff, var3191, 2, protoModule.wireTypes.lengthDelimited)
		var3195, var4640 = protoModule.writeBuffer(var3195, var3196, var3194, buffer.len(var3194))
		buff = var3195
		var3191 = var3196
	end
	local buff_1 = buffer.create(var3191)
	buffer.copy(buff_1, 0, buff, 0, var3191)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3191 = t_116.new()
	local var3192 = 0
	while var3192 < buffer.len(p116) do
		local _ = nil
		local var3193 = nil
		local var3194, var3195, var3196 = protoModule.readTag(p116, var3192)
		local var3197 = var3194
		var3193 = var3195
		var3192 = var3196
		
		if var3193 == protoModule.wireTypes.varint then
			local _ = nil
			local var3198, var3199 = protoModule.readVarInt(p116, var3192)
			local _ = var3198
			var3192 = var3199
			continue
		end
		if var3193 == protoModule.wireTypes.lengthDelimited then
			if var3197 == 1 then
				local _ = nil
				local var3200, var3201 = protoModule.readBuffer(p116, var3192)
				var3192 = var3201
				var3191.key = buffer.tostring(var3200)
			elseif var3197 == 2 then
				local _ = nil
				local var3202, var3203 = protoModule.readBuffer(p116, var3192)
				var3192 = var3203
				var3191.value = t.ContentPool.decode(var3202)
			else
				local _ = nil
				local var3204, var3205 = protoModule.readVarInt(p116, var3192)
				var3192 = var3205 + var3204
			end
		elseif var3193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3206, var3207 = protoModule.readFixed32(p116, var3192)
			local _ = var3206
			var3192 = var3207
		elseif var3193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3208, var3209 = protoModule.readFixed64(p116, var3192)
			local _ = var3208
			var3192 = var3209
		else
			error("Unsupported wire type: " .. var4644)
		end
	end
	return var3191
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
	local var3210 = t_116.new()
	
	if self.key ~= nil then
		var3210.key = self.key
	end
	if self.value ~= nil then
		var3210.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3210
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
	local var3210 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3211 = self.foreground_header_entry:encode()
		local var3212, var3213 = protoModule.writeTag(buff, var3210, 1, protoModule.wireTypes.lengthDelimited)
		var3212, var4667 = protoModule.writeBuffer(var3212, var3213, var3211, buffer.len(var3211))
		buff = var3212
		var3210 = var3213
	end
	if self.background_header_entry ~= nil then
		local var3214 = self.background_header_entry:encode()
		local var3215, var3216 = protoModule.writeTag(buff, var3210, 2, protoModule.wireTypes.lengthDelimited)
		var3215, var4670 = protoModule.writeBuffer(var3215, var3216, var3214, buffer.len(var3214))
		buff = var3215
		var3210 = var3216
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3217, var3218 = protoModule.writeTag(buff, var3210, 3, protoModule.wireTypes.lengthDelimited)
		var3217, var4672 = protoModule.writeString(var3217, var3218, self.layout_variant)
		buff = var3217
		var3210 = var3218
	end
	local buff_1 = buffer.create(var3210)
	buffer.copy(buff_1, 0, buff, 0, var3210)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3210 = t_117.new()
	local var3211 = 0
	while var3211 < buffer.len(p117) do
		local _ = nil
		local var3212 = nil
		local var3213, var3214, var3215 = protoModule.readTag(p117, var3211)
		local var3216 = var3213
		var3212 = var3214
		var3211 = var3215
		
		if var3212 == protoModule.wireTypes.varint then
			local _ = nil
			local var3217, var3218 = protoModule.readVarInt(p117, var3211)
			local _ = var3217
			var3211 = var3218
			continue
		end
		if var3212 == protoModule.wireTypes.lengthDelimited then
			if var3216 == 1 then
				local _ = nil
				local var3219, var3220 = protoModule.readBuffer(p117, var3211)
				var3211 = var3220
				var3210.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3219)
			elseif var3216 == 2 then
				local _ = nil
				local var3221, var3222 = protoModule.readBuffer(p117, var3211)
				var3211 = var3222
				var3210.background_header_entry = t.BackgroundHeaderEntry.decode(var3221)
			elseif var3216 == 3 then
				local _ = nil
				local var3223, var3224 = protoModule.readBuffer(p117, var3211)
				var3211 = var3224
				var3210.layout_variant = buffer.tostring(var3223)
			else
				local _ = nil
				local var3225, var3226 = protoModule.readVarInt(p117, var3211)
				var3211 = var3226 + var3225
			end
		elseif var3212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3227, var3228 = protoModule.readFixed32(p117, var3211)
			local _ = var3227
			var3211 = var3228
		elseif var3212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3229, var3230 = protoModule.readFixed64(p117, var3211)
			local _ = var3229
			var3211 = var3230
		else
			error("Unsupported wire type: " .. var4676)
		end
	end
	return var3210
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
	local var3231 = t_117.new()
	
	if self.foreground_header_entry ~= nil then
		var3231.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3231.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3231.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3231.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3231.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3231.layout_variant = self.layoutVariant
	end
	return var3231
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
	local var3231 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3232, var3233 = protoModule.writeTag(buff, var3231, 1, protoModule.wireTypes.lengthDelimited)
		var3232, var4700 = protoModule.writeString(var3232, var3233, self.cta_button_text)
		buff = var3232
		var3231 = var3233
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3234, var3235 = protoModule.writeTag(buff, var3231, 2, protoModule.wireTypes.lengthDelimited)
		var3234, var4702 = protoModule.writeString(var3234, var3235, self.cta_type)
		buff = var3234
		var3231 = var3235
	end
	local buff_1 = buffer.create(var3231)
	buffer.copy(buff_1, 0, buff, 0, var3231)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3231 = t_118.new()
	local var3232 = 0
	while var3232 < buffer.len(p118) do
		local _ = nil
		local var3233 = nil
		local var3234, var3235, var3236 = protoModule.readTag(p118, var3232)
		local var3237 = var3234
		var3233 = var3235
		var3232 = var3236
		
		if var3233 == protoModule.wireTypes.varint then
			local _ = nil
			local var3238, var3239 = protoModule.readVarInt(p118, var3232)
			local _ = var3238
			var3232 = var3239
			continue
		end
		if var3233 == protoModule.wireTypes.lengthDelimited then
			if var3237 == 1 then
				local _ = nil
				local var3240, var3241 = protoModule.readBuffer(p118, var3232)
				var3232 = var3241
				var3231.cta_button_text = buffer.tostring(var3240)
			elseif var3237 == 2 then
				local _ = nil
				local var3242, var3243 = protoModule.readBuffer(p118, var3232)
				var3232 = var3243
				var3231.cta_type = buffer.tostring(var3242)
			else
				local _ = nil
				local var3244, var3245 = protoModule.readVarInt(p118, var3232)
				var3232 = var3245 + var3244
			end
		elseif var3233 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3246, var3247 = protoModule.readFixed32(p118, var3232)
			local _ = var3246
			var3232 = var3247
		elseif var3233 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3248, var3249 = protoModule.readFixed64(p118, var3232)
			local _ = var3248
			var3232 = var3249
		else
			error("Unsupported wire type: " .. var4706)
		end
	end
	return var3231
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
	local var3250 = t_118.new()
	
	if self.cta_button_text ~= nil then
		var3250.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3250.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3250.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3250.cta_type = self.ctaType
	end
	return var3250
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
	local var3250 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3251, var3252 = protoModule.writeTag(buff, var3250, 1, protoModule.wireTypes.lengthDelimited)
		var3251, var4728 = protoModule.writeString(var3251, var3252, self.title)
		buff = var3251
		var3250 = var3252
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3253, var3254 = protoModule.writeTag(buff, var3250, 2, protoModule.wireTypes.lengthDelimited)
		var3253, var4730 = protoModule.writeString(var3253, var3254, self.cta_button_text)
		buff = var3253
		var3250 = var3254
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3255, var3256 = protoModule.writeTag(buff, var3250, 3, protoModule.wireTypes.lengthDelimited)
		var3255, var4732 = protoModule.writeString(var3255, var3256, self.image_asset_id)
		buff = var3255
		var3250 = var3256
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3257, var3258 = protoModule.writeTag(buff, var3250, 4, protoModule.wireTypes.lengthDelimited)
		var3257, var4734 = protoModule.writeString(var3257, var3258, self.cta_type)
		buff = var3257
		var3250 = var3258
	end
	local buff_1 = buffer.create(var3250)
	buffer.copy(buff_1, 0, buff, 0, var3250)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3250 = t_119.new()
	local var3251 = 0
	while var3251 < buffer.len(p119) do
		local _ = nil
		local var3252 = nil
		local var3253, var3254, var3255 = protoModule.readTag(p119, var3251)
		local var3256 = var3253
		var3252 = var3254
		var3251 = var3255
		
		if var3252 == protoModule.wireTypes.varint then
			local _ = nil
			local var3257, var3258 = protoModule.readVarInt(p119, var3251)
			local _ = var3257
			var3251 = var3258
			continue
		end
		if var3252 == protoModule.wireTypes.lengthDelimited then
			if var3256 == 1 then
				local _ = nil
				local var3259, var3260 = protoModule.readBuffer(p119, var3251)
				var3251 = var3260
				var3250.title = buffer.tostring(var3259)
			elseif var3256 == 2 then
				local _ = nil
				local var3261, var3262 = protoModule.readBuffer(p119, var3251)
				var3251 = var3262
				var3250.cta_button_text = buffer.tostring(var3261)
			elseif var3256 == 3 then
				local _ = nil
				local var3263, var3264 = protoModule.readBuffer(p119, var3251)
				var3251 = var3264
				var3250.image_asset_id = buffer.tostring(var3263)
			elseif var3256 == 4 then
				local _ = nil
				local var3265, var3266 = protoModule.readBuffer(p119, var3251)
				var3251 = var3266
				var3250.cta_type = buffer.tostring(var3265)
			else
				local _ = nil
				local var3267, var3268 = protoModule.readVarInt(p119, var3251)
				var3251 = var3268 + var3267
			end
		elseif var3252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3269, var3270 = protoModule.readFixed32(p119, var3251)
			local _ = var3269
			var3251 = var3270
		elseif var3252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3271, var3272 = protoModule.readFixed64(p119, var3251)
			local _ = var3271
			var3251 = var3272
		else
			error("Unsupported wire type: " .. var4738)
		end
	end
	return var3250
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
	local var3273 = t_119.new()
	
	if self.title ~= nil then
		var3273.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3273.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3273.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3273.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3273.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3273.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3273.cta_type = self.ctaType
	end
	return var3273
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
	local var3273 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3274, var3275 = protoModule.writeTag(buff, var3273, 1, protoModule.wireTypes.lengthDelimited)
		var3274, var4764 = protoModule.writeString(var3274, var3275, self.title)
		buff = var3274
		var3273 = var3275
	end
	if self.url ~= nil then
		local var3276, var3277 = protoModule.writeTag(buff, var3273, 2, protoModule.wireTypes.lengthDelimited)
		var3276, var4766 = protoModule.writeString(var3276, var3277, self.url)
		buff = var3276
		var3273 = var3277
	end
	if self.destination ~= nil then
		local var3278, var3279 = protoModule.writeTag(buff, var3273, 3, protoModule.wireTypes.lengthDelimited)
		var3278, var4768 = protoModule.writeString(var3278, var3279, self.destination)
		buff = var3278
		var3273 = var3279
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3280, var3281 = protoModule.writeTag(buff, var3273, 4, protoModule.wireTypes.lengthDelimited)
		var3280, var4770 = protoModule.writeString(var3280, var3281, self.row_id)
		buff = var3280
		var3273 = var3281
	end
	local buff_1 = buffer.create(var3273)
	buffer.copy(buff_1, 0, buff, 0, var3273)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3273 = t_120.new()
	local var3274 = 0
	while var3274 < buffer.len(p120) do
		local _ = nil
		local var3275 = nil
		local var3276, var3277, var3278 = protoModule.readTag(p120, var3274)
		local var3279 = var3276
		var3275 = var3277
		var3274 = var3278
		
		if var3275 == protoModule.wireTypes.varint then
			local _ = nil
			local var3280, var3281 = protoModule.readVarInt(p120, var3274)
			local _ = var3280
			var3274 = var3281
			continue
		end
		if var3275 == protoModule.wireTypes.lengthDelimited then
			if var3279 == 1 then
				local _ = nil
				local var3282, var3283 = protoModule.readBuffer(p120, var3274)
				var3274 = var3283
				var3273.title = buffer.tostring(var3282)
			elseif var3279 == 2 then
				local _ = nil
				local var3284, var3285 = protoModule.readBuffer(p120, var3274)
				var3274 = var3285
				var3273.url = buffer.tostring(var3284)
			elseif var3279 == 3 then
				local _ = nil
				local var3286, var3287 = protoModule.readBuffer(p120, var3274)
				var3274 = var3287
				var3273.destination = buffer.tostring(var3286)
			elseif var3279 == 4 then
				local _ = nil
				local var3288, var3289 = protoModule.readBuffer(p120, var3274)
				var3274 = var3289
				var3273.row_id = buffer.tostring(var3288)
			else
				local _ = nil
				local var3290, var3291 = protoModule.readVarInt(p120, var3274)
				var3274 = var3291 + var3290
			end
		elseif var3275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3292, var3293 = protoModule.readFixed32(p120, var3274)
			local _ = var3292
			var3274 = var3293
		elseif var3275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3294, var3295 = protoModule.readFixed64(p120, var3274)
			local _ = var3294
			var3274 = var3295
		else
			error("Unsupported wire type: " .. var4774)
		end
	end
	return var3273
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
	local var3296 = t_120.new()
	
	if self.title ~= nil then
		var3296.title = self.title
	end
	if self.url ~= nil then
		var3296.url = self.url
	end
	if self.destination ~= nil then
		var3296.destination = self.destination
	end
	if self.row_id ~= nil then
		var3296.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3296.row_id = self.rowId
	end
	return var3296
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
	local var3296 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3297, var3298 = protoModule.writeTag(buff, var3296, 1, protoModule.wireTypes.lengthDelimited)
		var3297, var4800 = protoModule.writeString(var3297, var3298, self.setting_key)
		buff = var3297
		var3296 = var3298
	end
	if self.label ~= nil and self.label ~= "" then
		local var3299, var3300 = protoModule.writeTag(buff, var3296, 2, protoModule.wireTypes.lengthDelimited)
		var3299, var4802 = protoModule.writeString(var3299, var3300, self.label)
		buff = var3299
		var3296 = var3300
	end
	if self.description ~= nil and self.description ~= "" then
		local var3301, var3302 = protoModule.writeTag(buff, var3296, 3, protoModule.wireTypes.lengthDelimited)
		var3301, var4804 = protoModule.writeString(var3301, var3302, self.description)
		buff = var3301
		var3296 = var3302
	end
	if self.is_checked then
		local var3303, var3304 = protoModule.writeTag(buff, var3296, 4, protoModule.wireTypes.varint)
		var3303, var4806 = protoModule.writeVarInt(var3303, var3304, if self.is_checked then 1 else 0)
		buff = var3303
		var3296 = var3304
	end
	if self.is_disabled then
		local var3305, var3306 = protoModule.writeTag(buff, var3296, 5, protoModule.wireTypes.varint)
		var3305, var4808 = protoModule.writeVarInt(var3305, var3306, if self.is_disabled then 1 else 0)
		buff = var3305
		var3296 = var3306
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3307, var3308 = protoModule.writeTag(buff, var3296, 6, protoModule.wireTypes.lengthDelimited)
		var3307, var4810 = protoModule.writeString(var3307, var3308, self.audit_data)
		buff = var3307
		var3296 = var3308
	end
	local buff_1 = buffer.create(var3296)
	buffer.copy(buff_1, 0, buff, 0, var3296)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3296 = t_121.new()
	local var3297 = 0
	while var3297 < buffer.len(p121) do
		local _ = nil
		local var3298 = nil
		local var3299, var3300, var3301 = protoModule.readTag(p121, var3297)
		local var3302 = var3299
		var3298 = var3300
		var3297 = var3301
		
		if var3298 == protoModule.wireTypes.varint then
			if var3302 == 4 then
				local _ = nil
				local var3303, var3304 = protoModule.readVarInt(p121, var3297)
				var3297 = var3304
				var3296.is_checked = var3303 ~= 0
			elseif var3302 == 5 then
				local _ = nil
				local var3305, var3306 = protoModule.readVarInt(p121, var3297)
				var3297 = var3306
				var3296.is_disabled = var3305 ~= 0
			else
				local _ = nil
				local var3307, var3308 = protoModule.readVarInt(p121, var3297)
				local _ = var3307
				var3297 = var3308
			end
		end
		if var3298 == protoModule.wireTypes.lengthDelimited then
			if var3302 == 1 then
				local _ = nil
				local var3309, var3310 = protoModule.readBuffer(p121, var3297)
				var3297 = var3310
				var3296.setting_key = buffer.tostring(var3309)
			elseif var3302 == 2 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p121, var3297)
				var3297 = var3312
				var3296.label = buffer.tostring(var3311)
			elseif var3302 == 3 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p121, var3297)
				var3297 = var3314
				var3296.description = buffer.tostring(var3313)
			elseif var3302 == 6 then
				local _ = nil
				local var3315, var3316 = protoModule.readBuffer(p121, var3297)
				var3297 = var3316
				var3296.audit_data = buffer.tostring(var3315)
			else
				local _ = nil
				local var3317, var3318 = protoModule.readVarInt(p121, var3297)
				var3297 = var3318 + var3317
			end
		elseif var3298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3319, var3320 = protoModule.readFixed32(p121, var3297)
			local _ = var3319
			var3297 = var3320
		elseif var3298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3321, var3322 = protoModule.readFixed64(p121, var3297)
			local _ = var3321
			var3297 = var3322
		else
			error("Unsupported wire type: " .. var4814)
		end
	end
	return var3296
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
	local var3323 = t_121.new()
	
	if self.setting_key ~= nil then
		var3323.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3323.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3323.label = self.label
	end
	if self.description ~= nil then
		var3323.description = self.description
	end
	if self.is_checked ~= nil then
		var3323.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3323.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3323.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3323.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3323.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3323.audit_data = self.auditData
	end
	return var3323
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
	local var3323 = 0
	
	if self.universe_id ~= nil then
		local var3324, var3325 = protoModule.writeTag(buff, var3323, 1, protoModule.wireTypes.lengthDelimited)
		var3324, var4844 = protoModule.writeString(var3324, var3325, self.universe_id)
		buff = var3324
		var3323 = var3325
	end
	if self.title ~= nil then
		local var3326, var3327 = protoModule.writeTag(buff, var3323, 2, protoModule.wireTypes.lengthDelimited)
		var3326, var4846 = protoModule.writeString(var3326, var3327, self.title)
		buff = var3326
		var3323 = var3327
	end
	if self.subtitle ~= nil then
		local var3328, var3329 = protoModule.writeTag(buff, var3323, 3, protoModule.wireTypes.lengthDelimited)
		var3328, var4848 = protoModule.writeString(var3328, var3329, self.subtitle)
		buff = var3328
		var3323 = var3329
	end
	if self.badge_text ~= nil then
		local var3330, var3331 = protoModule.writeTag(buff, var3323, 4, protoModule.wireTypes.lengthDelimited)
		var3330, var4850 = protoModule.writeString(var3330, var3331, self.badge_text)
		buff = var3330
		var3323 = var3331
	end
	if self.foreground ~= nil then
		local var3332 = self.foreground:encode()
		local var3333, var3334 = protoModule.writeTag(buff, var3323, 5, protoModule.wireTypes.lengthDelimited)
		var3333, var4853 = protoModule.writeBuffer(var3333, var3334, var3332, buffer.len(var3332))
		buff = var3333
		var3323 = var3334
	end
	if self.background ~= nil then
		local var3335 = self.background:encode()
		local var3336, var3337 = protoModule.writeTag(buff, var3323, 6, protoModule.wireTypes.lengthDelimited)
		var3336, var4856 = protoModule.writeBuffer(var3336, var3337, var3335, buffer.len(var3335))
		buff = var3336
		var3323 = var3337
	end
	if self.title_image ~= nil then
		local var3338 = self.title_image:encode()
		local var3339, var3340 = protoModule.writeTag(buff, var3323, 7, protoModule.wireTypes.lengthDelimited)
		var3339, var4859 = protoModule.writeBuffer(var3339, var3340, var3338, buffer.len(var3338))
		buff = var3339
		var3323 = var3340
	end
	if self.asset_title ~= nil then
		local var3341, var3342 = protoModule.writeTag(buff, var3323, 8, protoModule.wireTypes.lengthDelimited)
		var3341, var4861 = protoModule.writeString(var3341, var3342, self.asset_title)
		buff = var3341
		var3323 = var3342
	end
	if self.asset_subtitle ~= nil then
		local var3343, var3344 = protoModule.writeTag(buff, var3323, 9, protoModule.wireTypes.lengthDelimited)
		var3343, var4863 = protoModule.writeString(var3343, var3344, self.asset_subtitle)
		buff = var3343
		var3323 = var3344
	end
	if self.gradient ~= nil then
		local var3345 = self.gradient:encode()
		local var3346, var3347 = protoModule.writeTag(buff, var3323, 10, protoModule.wireTypes.lengthDelimited)
		var3346, var4866 = protoModule.writeBuffer(var3346, var3347, var3345, buffer.len(var3345))
		buff = var3346
		var3323 = var3347
	end
	if self.playable_text ~= nil then
		local var3348, var3349 = protoModule.writeTag(buff, var3323, 11, protoModule.wireTypes.lengthDelimited)
		var3348, var4868 = protoModule.writeString(var3348, var3349, self.playable_text)
		buff = var3348
		var3323 = var3349
	end
	if self.collection_id ~= nil then
		local var3350, var3351 = protoModule.writeTag(buff, var3323, 12, protoModule.wireTypes.lengthDelimited)
		var3350, var4870 = protoModule.writeString(var3350, var3351, self.collection_id)
		buff = var3350
		var3323 = var3351
	end
	if self.campaign_id ~= nil then
		local var3352, var3353 = protoModule.writeTag(buff, var3323, 13, protoModule.wireTypes.lengthDelimited)
		var3352, var4872 = protoModule.writeString(var3352, var3353, self.campaign_id)
		buff = var3352
		var3323 = var3353
	end
	if self.cohort_id ~= nil then
		local var3354, var3355 = protoModule.writeTag(buff, var3323, 14, protoModule.wireTypes.lengthDelimited)
		var3354, var4874 = protoModule.writeString(var3354, var3355, self.cohort_id)
		buff = var3354
		var3323 = var3355
	end
	if self.sort_id ~= nil then
		local var3356, var3357 = protoModule.writeTag(buff, var3323, 15, protoModule.wireTypes.lengthDelimited)
		var3356, var4876 = protoModule.writeString(var3356, var3357, self.sort_id)
		buff = var3356
		var3323 = var3357
	end
	if self.hero_unit_id ~= nil then
		local var3358, var3359 = protoModule.writeTag(buff, var3323, 16, protoModule.wireTypes.lengthDelimited)
		var3358, var4878 = protoModule.writeString(var3358, var3359, self.hero_unit_id)
		buff = var3358
		var3323 = var3359
	end
	if self.analytics_id ~= nil then
		local var3360, var3361 = protoModule.writeTag(buff, var3323, 17, protoModule.wireTypes.lengthDelimited)
		var3360, var4880 = protoModule.writeString(var3360, var3361, self.analytics_id)
		buff = var3360
		var3323 = var3361
	end
	if self.is_sponsored ~= nil then
		local var3362, var3363 = protoModule.writeTag(buff, var3323, 18, protoModule.wireTypes.varint)
		var3362, var4882 = protoModule.writeVarInt(var3362, var3363, if self.is_sponsored then 1 else 0)
		buff = var3362
		var3323 = var3363
	end
	local buff_1 = buffer.create(var3323)
	buffer.copy(buff_1, 0, buff, 0, var3323)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3323 = t_122.new()
	local var3324 = 0
	while var3324 < buffer.len(p122) do
		local _ = nil
		local var3325 = nil
		local var3326, var3327, var3328 = protoModule.readTag(p122, var3324)
		local var3329 = var3326
		var3325 = var3327
		var3324 = var3328
		
		if var3325 == protoModule.wireTypes.varint then
			if var3329 == 18 then
				local _ = nil
				local var3330, var3331 = protoModule.readVarInt(p122, var3324)
				var3324 = var3331
				var3323.is_sponsored = var3330 ~= 0
			else
				local _ = nil
				local var3332, var3333 = protoModule.readVarInt(p122, var3324)
				local _ = var3332
				var3324 = var3333
			end
		end
		if var3325 == protoModule.wireTypes.lengthDelimited then
			if var3329 == 1 then
				local _ = nil
				local var3334, var3335 = protoModule.readBuffer(p122, var3324)
				var3324 = var3335
				var3323.universe_id = buffer.tostring(var3334)
			elseif var3329 == 2 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p122, var3324)
				var3324 = var3337
				var3323.title = buffer.tostring(var3336)
			elseif var3329 == 3 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p122, var3324)
				var3324 = var3339
				var3323.subtitle = buffer.tostring(var3338)
			elseif var3329 == 4 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p122, var3324)
				var3324 = var3341
				var3323.badge_text = buffer.tostring(var3340)
			elseif var3329 == 5 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p122, var3324)
				var3324 = var3343
				var3323.foreground = t.HeroUnitInputData_VisualAsset.decode(var3342)
			elseif var3329 == 6 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p122, var3324)
				var3324 = var3345
				var3323.background = t.HeroUnitInputData_VisualAsset.decode(var3344)
			elseif var3329 == 7 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p122, var3324)
				var3324 = var3347
				var3323.title_image = t.HeroUnitInputData_VisualAsset.decode(var3346)
			elseif var3329 == 8 then
				local _ = nil
				local var3348, var3349 = protoModule.readBuffer(p122, var3324)
				var3324 = var3349
				var3323.asset_title = buffer.tostring(var3348)
			elseif var3329 == 9 then
				local _ = nil
				local var3350, var3351 = protoModule.readBuffer(p122, var3324)
				var3324 = var3351
				var3323.asset_subtitle = buffer.tostring(var3350)
			elseif var3329 == 10 then
				local _ = nil
				local var3352, var3353 = protoModule.readBuffer(p122, var3324)
				var3324 = var3353
				var3323.gradient = t.HeroUnitInputData_Gradient.decode(var3352)
			elseif var3329 == 11 then
				local _ = nil
				local var3354, var3355 = protoModule.readBuffer(p122, var3324)
				var3324 = var3355
				var3323.playable_text = buffer.tostring(var3354)
			elseif var3329 == 12 then
				local _ = nil
				local var3356, var3357 = protoModule.readBuffer(p122, var3324)
				var3324 = var3357
				var3323.collection_id = buffer.tostring(var3356)
			elseif var3329 == 13 then
				local _ = nil
				local var3358, var3359 = protoModule.readBuffer(p122, var3324)
				var3324 = var3359
				var3323.campaign_id = buffer.tostring(var3358)
			elseif var3329 == 14 then
				local _ = nil
				local var3360, var3361 = protoModule.readBuffer(p122, var3324)
				var3324 = var3361
				var3323.cohort_id = buffer.tostring(var3360)
			elseif var3329 == 15 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p122, var3324)
				var3324 = var3363
				var3323.sort_id = buffer.tostring(var3362)
			elseif var3329 == 16 then
				local _ = nil
				local var3364, var3365 = protoModule.readBuffer(p122, var3324)
				var3324 = var3365
				var3323.hero_unit_id = buffer.tostring(var3364)
			elseif var3329 == 17 then
				local _ = nil
				local var3366, var3367 = protoModule.readBuffer(p122, var3324)
				var3324 = var3367
				var3323.analytics_id = buffer.tostring(var3366)
			else
				local _ = nil
				local var3368, var3369 = protoModule.readVarInt(p122, var3324)
				var3324 = var3369 + var3368
			end
		elseif var3325 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3370, var3371 = protoModule.readFixed32(p122, var3324)
			local _ = var3370
			var3324 = var3371
		elseif var3325 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3372, var3373 = protoModule.readFixed64(p122, var3324)
			local _ = var3372
			var3324 = var3373
		else
			error("Unsupported wire type: " .. var4886)
		end
	end
	return var3323
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
	local var3374 = t_122.new()
	
	if self.universe_id ~= nil then
		var3374.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3374.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3374.title = self.title
	end
	if self.subtitle ~= nil then
		var3374.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3374.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3374.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3374.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3374.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3374.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3374.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3374.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3374.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3374.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3374.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3374.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3374.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3374.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3374.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3374.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3374.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3374.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3374.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3374.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3374.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3374.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3374.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3374.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3374.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3374.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3374.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3374.is_sponsored = self.isSponsored
	end
	return var3374
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
	local var3374 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3375, var3376 = protoModule.writeTag(buff, var3374, 1, protoModule.wireTypes.lengthDelimited)
		var3375, var4940 = protoModule.writeString(var3375, var3376, self.asset_id)
		buff = var3375
		var3374 = var3376
	end
	if self.aspect_ratio ~= nil then
		local var3377, var3378 = protoModule.writeTag(buff, var3374, 2, protoModule.wireTypes.i64)
		var3377, var4942 = protoModule.writeDouble(var3377, var3378, self.aspect_ratio)
		buff = var3377
		var3374 = var3378
	end
	if self.enable_animation ~= nil then
		local var3379, var3380 = protoModule.writeTag(buff, var3374, 3, protoModule.wireTypes.varint)
		var3379, var4944 = protoModule.writeVarInt(var3379, var3380, if self.enable_animation then 1 else 0)
		buff = var3379
		var3374 = var3380
	end
	local buff_1 = buffer.create(var3374)
	buffer.copy(buff_1, 0, buff, 0, var3374)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3374 = t_123.new()
	local var3375 = 0
	while var3375 < buffer.len(p123) do
		local _ = nil
		local var3376 = nil
		local var3377, var3378, var3379 = protoModule.readTag(p123, var3375)
		local var3380 = var3377
		var3376 = var3378
		var3375 = var3379
		
		if var3376 == protoModule.wireTypes.varint then
			if var3380 == 3 then
				local _ = nil
				local var3381, var3382 = protoModule.readVarInt(p123, var3375)
				var3375 = var3382
				var3374.enable_animation = var3381 ~= 0
			else
				local _ = nil
				local var3383, var3384 = protoModule.readVarInt(p123, var3375)
				local _ = var3383
				var3375 = var3384
			end
		end
		if var3376 == protoModule.wireTypes.lengthDelimited then
			if var3380 == 1 then
				local _ = nil
				local var3385, var3386 = protoModule.readBuffer(p123, var3375)
				var3375 = var3386
				var3374.asset_id = buffer.tostring(var3385)
			else
				local _ = nil
				local var3387, var3388 = protoModule.readVarInt(p123, var3375)
				var3375 = var3388 + var3387
			end
		elseif var3376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3389, var3390 = protoModule.readFixed32(p123, var3375)
			local _ = var3389
			var3375 = var3390
		elseif var3376 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4948)
		elseif var3380 == 2 then
			local _ = nil
			local var3391, var3392 = protoModule.readDouble(p123, var3375)
			var3375 = var3392
			var3374.aspect_ratio = var3391
		else
			local _ = nil
			local var3393, var3394 = protoModule.readFixed64(p123, var3375)
			local _ = var3393
			var3375 = var3394
		end
	end
	return var3374
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
	local var3395 = t_123.new()
	
	if self.asset_id ~= nil then
		var3395.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3395.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3395.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3395.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3395.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3395.enable_animation = self.enableAnimation
	end
	return var3395
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
	local var3395 = 0
	
	if self.start_color ~= nil then
		local var3396, var3397 = protoModule.writeTag(buff, var3395, 1, protoModule.wireTypes.lengthDelimited)
		var3396, var4972 = protoModule.writeString(var3396, var3397, self.start_color)
		buff = var3396
		var3395 = var3397
	end
	if self.end_color ~= nil then
		local var3398, var3399 = protoModule.writeTag(buff, var3395, 2, protoModule.wireTypes.lengthDelimited)
		var3398, var4974 = protoModule.writeString(var3398, var3399, self.end_color)
		buff = var3398
		var3395 = var3399
	end
	if self.start_opacity ~= nil then
		local var3400, var3401 = protoModule.writeTag(buff, var3395, 3, protoModule.wireTypes.i64)
		var3400, var4976 = protoModule.writeDouble(var3400, var3401, self.start_opacity)
		buff = var3400
		var3395 = var3401
	end
	if self.end_opacity ~= nil then
		local var3402, var3403 = protoModule.writeTag(buff, var3395, 4, protoModule.wireTypes.i64)
		var3402, var4978 = protoModule.writeDouble(var3402, var3403, self.end_opacity)
		buff = var3402
		var3395 = var3403
	end
	if self.degree ~= nil then
		local var3404, var3405 = protoModule.writeTag(buff, var3395, 5, protoModule.wireTypes.i64)
		var3404, var4980 = protoModule.writeDouble(var3404, var3405, self.degree)
		buff = var3404
		var3395 = var3405
	end
	local buff_1 = buffer.create(var3395)
	buffer.copy(buff_1, 0, buff, 0, var3395)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3395 = t_124.new()
	local var3396 = 0
	while var3396 < buffer.len(p124) do
		local _ = nil
		local var3397 = nil
		local var3398, var3399, var3400 = protoModule.readTag(p124, var3396)
		local var3401 = var3398
		var3397 = var3399
		var3396 = var3400
		
		if var3397 == protoModule.wireTypes.varint then
			local _ = nil
			local var3402, var3403 = protoModule.readVarInt(p124, var3396)
			local _ = var3402
			var3396 = var3403
			continue
		end
		if var3397 == protoModule.wireTypes.lengthDelimited then
			if var3401 == 1 then
				local _ = nil
				local var3404, var3405 = protoModule.readBuffer(p124, var3396)
				var3396 = var3405
				var3395.start_color = buffer.tostring(var3404)
			elseif var3401 == 2 then
				local _ = nil
				local var3406, var3407 = protoModule.readBuffer(p124, var3396)
				var3396 = var3407
				var3395.end_color = buffer.tostring(var3406)
			else
				local _ = nil
				local var3408, var3409 = protoModule.readVarInt(p124, var3396)
				var3396 = var3409 + var3408
			end
		elseif var3397 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3410, var3411 = protoModule.readFixed32(p124, var3396)
			local _ = var3410
			var3396 = var3411
		elseif var3397 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4984)
		elseif var3401 == 3 then
			local _ = nil
			local var3412, var3413 = protoModule.readDouble(p124, var3396)
			var3396 = var3413
			var3395.start_opacity = var3412
		elseif var3401 == 4 then
			local _ = nil
			local var3414, var3415 = protoModule.readDouble(p124, var3396)
			var3396 = var3415
			var3395.end_opacity = var3414
		elseif var3401 == 5 then
			local _ = nil
			local var3416, var3417 = protoModule.readDouble(p124, var3396)
			var3396 = var3417
			var3395.degree = var3416
		else
			local _ = nil
			local var3418, var3419 = protoModule.readFixed64(p124, var3396)
			local _ = var3418
			var3396 = var3419
		end
	end
	return var3395
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
	local var3420 = t_124.new()
	
	if self.start_color ~= nil then
		var3420.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3420.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3420.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3420.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3420.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3420.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3420.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3420.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3420.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3420
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
	local var3420 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3421 = v:encode()
			local var3422, var3423 = protoModule.writeTag(buff, var3420, 1, protoModule.wireTypes.lengthDelimited)
			var3422, var5013 = protoModule.writeBuffer(var3422, var3423, var3421, buffer.len(var3421))
			buff = var3422
			var3420 = var3423
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3424, var3425 = protoModule.writeTag(buff, var3420, 2, protoModule.wireTypes.lengthDelimited)
		var3424, var5015 = protoModule.writeString(var3424, var3425, self.sort_id)
		buff = var3424
		var3420 = var3425
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3426, var3427 = protoModule.writeTag(buff, var3420, 3, protoModule.wireTypes.lengthDelimited)
		var3426, var5017 = protoModule.writeString(var3426, var3427, self.recommendation_request_id)
		buff = var3426
		var3420 = var3427
	end
	local buff_1 = buffer.create(var3420)
	buffer.copy(buff_1, 0, buff, 0, var3420)
	
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
			local _ = nil
			local var3435, var3436 = protoModule.readVarInt(p125, var3429)
			local _ = var3435
			var3429 = var3436
			continue
		end
		if var3430 == protoModule.wireTypes.lengthDelimited then
			if var3434 == 1 then
				local _ = nil
				local var3437, var3438 = protoModule.readBuffer(p125, var3429)
				var3429 = var3438
				table.insert(var3428.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3437))
			elseif var3434 == 2 then
				local _ = nil
				local var3439, var3440 = protoModule.readBuffer(p125, var3429)
				var3429 = var3440
				var3428.sort_id = buffer.tostring(var3439)
			elseif var3434 == 3 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p125, var3429)
				var3429 = var3442
				var3428.recommendation_request_id = buffer.tostring(var3441)
			else
				local _ = nil
				local var3443, var3444 = protoModule.readVarInt(p125, var3429)
				var3429 = var3444 + var3443
			end
		elseif var3430 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3445, var3446 = protoModule.readFixed32(p125, var3429)
			local _ = var3445
			var3429 = var3446
		elseif var3430 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3447, var3448 = protoModule.readFixed64(p125, var3429)
			local _ = var3447
			var3429 = var3448
		else
			error("Unsupported wire type: " .. var5021)
		end
	end
	return var3428
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
	local var3449 = t_125.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3449.items = t_1
	end
	if self.sort_id ~= nil then
		var3449.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3449.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3449.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3449.recommendation_request_id = self.recommendationRequestId
	end
	return var3449
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
	local var3450 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3451, var3452 = protoModule.writeTag(buff, var3450, 1, protoModule.wireTypes.lengthDelimited)
		var3451, var5047 = protoModule.writeString(var3451, var3452, self.item_id)
		buff = var3451
		var3450 = var3452
	end
	if self.has_pending_friend_request then
		local var3453, var3454 = protoModule.writeTag(buff, var3450, 2, protoModule.wireTypes.varint)
		var3453, var5049 = protoModule.writeVarInt(var3453, var3454, if self.has_pending_friend_request then 1 else 0)
		buff = var3453
		var3450 = var3454
	end
	local buff_1 = buffer.create(var3450)
	buffer.copy(buff_1, 0, buff, 0, var3450)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3450 = t_126.new()
	local var3451 = 0
	while var3451 < buffer.len(p126) do
		local _ = nil
		local var3452 = nil
		local var3453, var3454, var3455 = protoModule.readTag(p126, var3451)
		local var3456 = var3453
		var3452 = var3454
		var3451 = var3455
		
		if var3452 == protoModule.wireTypes.varint then
			if var3456 == 2 then
				local _ = nil
				local var3457, var3458 = protoModule.readVarInt(p126, var3451)
				var3451 = var3458
				var3450.has_pending_friend_request = var3457 ~= 0
			else
				local _ = nil
				local var3459, var3460 = protoModule.readVarInt(p126, var3451)
				local _ = var3459
				var3451 = var3460
			end
		end
		if var3452 == protoModule.wireTypes.lengthDelimited then
			if var3456 == 1 then
				local _ = nil
				local var3461, var3462 = protoModule.readBuffer(p126, var3451)
				var3451 = var3462
				var3450.item_id = buffer.tostring(var3461)
			else
				local _ = nil
				local var3463, var3464 = protoModule.readVarInt(p126, var3451)
				var3451 = var3464 + var3463
			end
		elseif var3452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3465, var3466 = protoModule.readFixed32(p126, var3451)
			local _ = var3465
			var3451 = var3466
		elseif var3452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3467, var3468 = protoModule.readFixed64(p126, var3451)
			local _ = var3467
			var3451 = var3468
		else
			error("Unsupported wire type: " .. var5053)
		end
	end
	return var3450
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
	local var3469 = t_126.new()
	
	if self.item_id ~= nil then
		var3469.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3469.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3469.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3469.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3469
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
	local var3469 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3470, var3471 = protoModule.writeTag(buff, var3469, 1, protoModule.wireTypes.lengthDelimited)
		var3470, var5075 = protoModule.writeString(var3470, var3471, self.selected_option)
		buff = var3470
		var3469 = var3471
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3472, var3473 = protoModule.writeTag(buff, var3469, 2, protoModule.wireTypes.lengthDelimited)
		var3472, var5077 = protoModule.writeString(var3472, var3473, self.sort_id)
		buff = var3472
		var3469 = var3473
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3474 = v:encode()
			local var3475, var3476 = protoModule.writeTag(buff, var3469, 3, protoModule.wireTypes.lengthDelimited)
			var3475, var5080 = protoModule.writeBuffer(var3475, var3476, var3474, buffer.len(var3474))
			buff = var3475
			var3469 = var3476
		end
	end
	if self.experience_carousel ~= nil then
		local var3477 = self.experience_carousel:encode()
		local var3478, var3479 = protoModule.writeTag(buff, var3469, 4, protoModule.wireTypes.lengthDelimited)
		var3478, var5083 = protoModule.writeBuffer(var3478, var3479, var3477, buffer.len(var3477))
		buff = var3478
		var3469 = var3479
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3480, var3481 = protoModule.writeTag(buff, var3469, 5, protoModule.wireTypes.lengthDelimited)
		var3480, var5085 = protoModule.writeString(var3480, var3481, self.feed_item_key)
		buff = var3480
		var3469 = var3481
	end
	local buff_1 = buffer.create(var3469)
	buffer.copy(buff_1, 0, buff, 0, var3469)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref)
	local var3482 = t_127.new()
	local var3483 = 0
	while var3483 < buffer.len(p127) do
		local _ = nil
		local var3484 = nil
		local var3485, var3486, var3487 = protoModule.readTag(p127, var3483)
		local var3488 = var3485
		var3484 = var3486
		var3483 = var3487
		
		if var3484 == protoModule.wireTypes.varint then
			local _ = nil
			local var3489, var3490 = protoModule.readVarInt(p127, var3483)
			local _ = var3489
			var3483 = var3490
			continue
		end
		if var3484 == protoModule.wireTypes.lengthDelimited then
			if var3488 == 1 then
				local _ = nil
				local var3491, var3492 = protoModule.readBuffer(p127, var3483)
				var3483 = var3492
				var3482.selected_option = buffer.tostring(var3491)
			elseif var3488 == 2 then
				local _ = nil
				local var3493, var3494 = protoModule.readBuffer(p127, var3483)
				var3483 = var3494
				var3482.sort_id = buffer.tostring(var3493)
			elseif var3488 == 3 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p127, var3483)
				var3483 = var3496
				table.insert(var3482.options, t.SelectorOption.decode(var3495))
			elseif var3488 == 4 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p127, var3483)
				var3483 = var3498
				var3482.experience_carousel = t.ExperienceCarouselInputData.decode(var3497)
			elseif var3488 == 5 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p127, var3483)
				var3483 = var3500
				var3482.feed_item_key = buffer.tostring(var3499)
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p127, var3483)
				var3483 = var3502 + var3501
			end
		elseif var3484 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3503, var3504 = protoModule.readFixed32(p127, var3483)
			local _ = var3503
			var3483 = var3504
		elseif var3484 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3505, var3506 = protoModule.readFixed64(p127, var3483)
			local _ = var3505
			var3483 = var3506
		else
			error("Unsupported wire type: " .. var5089)
		end
	end
	return var3482
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
	local var3507 = t_127.new()
	
	if self.selected_option ~= nil then
		var3507.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3507.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3507.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3507.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3507.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3507.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3507.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3507.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3507.feed_item_key = self.feedItemKey
	end
	return var3507
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
	local var3508 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3509, var3510 = protoModule.writeTag(buff, var3508, 1, protoModule.wireTypes.lengthDelimited)
		var3509, var5119 = protoModule.writeString(var3509, var3510, self.id)
		buff = var3509
		var3508 = var3510
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3511, var3512 = protoModule.writeTag(buff, var3508, 2, protoModule.wireTypes.lengthDelimited)
		var3511, var5121 = protoModule.writeString(var3511, var3512, self.display_name)
		buff = var3511
		var3508 = var3512
	end
	if self.is_selected then
		local var3513, var3514 = protoModule.writeTag(buff, var3508, 3, protoModule.wireTypes.varint)
		var3513, var5123 = protoModule.writeVarInt(var3513, var3514, if self.is_selected then 1 else 0)
		buff = var3513
		var3508 = var3514
	end
	local buff_1 = buffer.create(var3508)
	buffer.copy(buff_1, 0, buff, 0, var3508)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3508 = t_128.new()
	local var3509 = 0
	while var3509 < buffer.len(p128) do
		local _ = nil
		local var3510 = nil
		local var3511, var3512, var3513 = protoModule.readTag(p128, var3509)
		local var3514 = var3511
		var3510 = var3512
		var3509 = var3513
		
		if var3510 == protoModule.wireTypes.varint then
			if var3514 == 3 then
				local _ = nil
				local var3515, var3516 = protoModule.readVarInt(p128, var3509)
				var3509 = var3516
				var3508.is_selected = var3515 ~= 0
			else
				local _ = nil
				local var3517, var3518 = protoModule.readVarInt(p128, var3509)
				local _ = var3517
				var3509 = var3518
			end
		end
		if var3510 == protoModule.wireTypes.lengthDelimited then
			if var3514 == 1 then
				local _ = nil
				local var3519, var3520 = protoModule.readBuffer(p128, var3509)
				var3509 = var3520
				var3508.id = buffer.tostring(var3519)
			elseif var3514 == 2 then
				local _ = nil
				local var3521, var3522 = protoModule.readBuffer(p128, var3509)
				var3509 = var3522
				var3508.display_name = buffer.tostring(var3521)
			else
				local _ = nil
				local var3523, var3524 = protoModule.readVarInt(p128, var3509)
				var3509 = var3524 + var3523
			end
		elseif var3510 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3525, var3526 = protoModule.readFixed32(p128, var3509)
			local _ = var3525
			var3509 = var3526
		elseif var3510 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3527, var3528 = protoModule.readFixed64(p128, var3509)
			local _ = var3527
			var3509 = var3528
		else
			error("Unsupported wire type: " .. var5127)
		end
	end
	return var3508
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
	local var3529 = t_128.new()
	
	if self.id ~= nil then
		var3529.id = self.id
	end
	if self.display_name ~= nil then
		var3529.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3529.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3529.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3529.is_selected = self.isSelected
	end
	return var3529
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
	local var3529 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3530 = v:encode()
			local var3531, var3532 = protoModule.writeTag(buff, var3529, 1, protoModule.wireTypes.lengthDelimited)
			var3531, var5152 = protoModule.writeBuffer(var3531, var3532, var3530, buffer.len(var3530))
			buff = var3531
			var3529 = var3532
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3533, var3534 = protoModule.writeTag(buff, var3529, 2, protoModule.wireTypes.lengthDelimited)
		var3533, var5154 = protoModule.writeString(var3533, var3534, self.title)
		buff = var3533
		var3529 = var3534
	end
	if self.sort_id ~= nil then
		local var3535, var3536 = protoModule.writeTag(buff, var3529, 3, protoModule.wireTypes.lengthDelimited)
		var3535, var5156 = protoModule.writeString(var3535, var3536, self.sort_id)
		buff = var3535
		var3529 = var3536
	end
	local buff_1 = buffer.create(var3529)
	buffer.copy(buff_1, 0, buff, 0, var3529)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3537 = t_129.new()
	local var3538 = 0
	while var3538 < buffer.len(p129) do
		local _ = nil
		local var3539 = nil
		local var3540, var3541, var3542 = protoModule.readTag(p129, var3538)
		local var3543 = var3540
		var3539 = var3541
		var3538 = var3542
		
		if var3539 == protoModule.wireTypes.varint then
			local _ = nil
			local var3544, var3545 = protoModule.readVarInt(p129, var3538)
			local _ = var3544
			var3538 = var3545
			continue
		end
		if var3539 == protoModule.wireTypes.lengthDelimited then
			if var3543 == 1 then
				local _ = nil
				local var3546, var3547 = protoModule.readBuffer(p129, var3538)
				var3538 = var3547
				table.insert(var3537.cards, t.GameItemsCardInputData.decode(var3546))
			elseif var3543 == 2 then
				local _ = nil
				local var3548, var3549 = protoModule.readBuffer(p129, var3538)
				var3538 = var3549
				var3537.title = buffer.tostring(var3548)
			elseif var3543 == 3 then
				local _ = nil
				local var3550, var3551 = protoModule.readBuffer(p129, var3538)
				var3538 = var3551
				var3537.sort_id = buffer.tostring(var3550)
			else
				local _ = nil
				local var3552, var3553 = protoModule.readVarInt(p129, var3538)
				var3538 = var3553 + var3552
			end
		elseif var3539 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3554, var3555 = protoModule.readFixed32(p129, var3538)
			local _ = var3554
			var3538 = var3555
		elseif var3539 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3556, var3557 = protoModule.readFixed64(p129, var3538)
			local _ = var3556
			var3538 = var3557
		else
			error("Unsupported wire type: " .. var5160)
		end
	end
	return var3537
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
	local var3558 = t_129.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3558.cards = t_1
	end
	if self.title ~= nil then
		var3558.title = self.title
	end
	if self.sort_id ~= nil then
		var3558.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3558.sort_id = self.sortId
	end
	return var3558
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
	local var3559 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3560, var3561 = protoModule.writeTag(buff, var3559, 1, protoModule.wireTypes.lengthDelimited)
		var3560, var5186 = protoModule.writeString(var3560, var3561, self.universe_id)
		buff = var3560
		var3559 = var3561
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3562 = v:encode()
			local var3563, var3564 = protoModule.writeTag(buff, var3559, 2, protoModule.wireTypes.lengthDelimited)
			var3563, var5189 = protoModule.writeBuffer(var3563, var3564, var3562, buffer.len(var3562))
			buff = var3563
			var3559 = var3564
		end
	end
	local buff_1 = buffer.create(var3559)
	buffer.copy(buff_1, 0, buff, 0, var3559)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3565 = t_130.new()
	local var3566 = 0
	while var3566 < buffer.len(p130) do
		local _ = nil
		local var3567 = nil
		local var3568, var3569, var3570 = protoModule.readTag(p130, var3566)
		local var3571 = var3568
		var3567 = var3569
		var3566 = var3570
		
		if var3567 == protoModule.wireTypes.varint then
			local _ = nil
			local var3572, var3573 = protoModule.readVarInt(p130, var3566)
			local _ = var3572
			var3566 = var3573
			continue
		end
		if var3567 == protoModule.wireTypes.lengthDelimited then
			if var3571 == 1 then
				local _ = nil
				local var3574, var3575 = protoModule.readBuffer(p130, var3566)
				var3566 = var3575
				var3565.universe_id = buffer.tostring(var3574)
			elseif var3571 == 2 then
				local _ = nil
				local var3576, var3577 = protoModule.readBuffer(p130, var3566)
				var3566 = var3577
				table.insert(var3565.items, t.GameItemInputData.decode(var3576))
			else
				local _ = nil
				local var3578, var3579 = protoModule.readVarInt(p130, var3566)
				var3566 = var3579 + var3578
			end
		elseif var3567 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3580, var3581 = protoModule.readFixed32(p130, var3566)
			local _ = var3580
			var3566 = var3581
		elseif var3567 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3582, var3583 = protoModule.readFixed64(p130, var3566)
			local _ = var3582
			var3566 = var3583
		else
			error("Unsupported wire type: " .. var5193)
		end
	end
	return var3565
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
	local var3584 = t_130.new()
	
	if self.universe_id ~= nil then
		var3584.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3584.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3584.items = t_1
	end
	return var3584
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
	local var3585 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3586, var3587 = protoModule.writeTag(buff, var3585, 1, protoModule.wireTypes.lengthDelimited)
		var3586, var5217 = protoModule.writeString(var3586, var3587, self.item_id)
		buff = var3586
		var3585 = var3587
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3588, var3589 = protoModule.writeTag(buff, var3585, 2, protoModule.wireTypes.lengthDelimited)
		var3588, var5219 = protoModule.writeString(var3588, var3589, self.item_type)
		buff = var3588
		var3585 = var3589
	end
	local buff_1 = buffer.create(var3585)
	buffer.copy(buff_1, 0, buff, 0, var3585)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3585 = t_131.new()
	local var3586 = 0
	while var3586 < buffer.len(p131) do
		local _ = nil
		local var3587 = nil
		local var3588, var3589, var3590 = protoModule.readTag(p131, var3586)
		local var3591 = var3588
		var3587 = var3589
		var3586 = var3590
		
		if var3587 == protoModule.wireTypes.varint then
			local _ = nil
			local var3592, var3593 = protoModule.readVarInt(p131, var3586)
			local _ = var3592
			var3586 = var3593
			continue
		end
		if var3587 == protoModule.wireTypes.lengthDelimited then
			if var3591 == 1 then
				local _ = nil
				local var3594, var3595 = protoModule.readBuffer(p131, var3586)
				var3586 = var3595
				var3585.item_id = buffer.tostring(var3594)
			elseif var3591 == 2 then
				local _ = nil
				local var3596, var3597 = protoModule.readBuffer(p131, var3586)
				var3586 = var3597
				var3585.item_type = buffer.tostring(var3596)
			else
				local _ = nil
				local var3598, var3599 = protoModule.readVarInt(p131, var3586)
				var3586 = var3599 + var3598
			end
		elseif var3587 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3600, var3601 = protoModule.readFixed32(p131, var3586)
			local _ = var3600
			var3586 = var3601
		elseif var3587 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3602, var3603 = protoModule.readFixed64(p131, var3586)
			local _ = var3602
			var3586 = var3603
		else
			error("Unsupported wire type: " .. var5223)
		end
	end
	return var3585
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
	local var3604 = t_131.new()
	
	if self.item_id ~= nil then
		var3604.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3604.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3604.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3604.item_type = self.itemType
	end
	return var3604
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
	local var3604 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3605, var3606 = protoModule.writeTag(buff, var3604, 1, protoModule.wireTypes.lengthDelimited)
		var3605, var5245 = protoModule.writeString(var3605, var3606, self.clickout_url)
		buff = var3605
		var3604 = var3606
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3607, var3608 = protoModule.writeTag(buff, var3604, 2, protoModule.wireTypes.lengthDelimited)
		var3607, var5247 = protoModule.writeString(var3607, var3608, self.native_ad_data)
		buff = var3607
		var3604 = var3608
	end
	if self.payer_name ~= nil then
		local var3609, var3610 = protoModule.writeTag(buff, var3604, 3, protoModule.wireTypes.lengthDelimited)
		var3609, var5249 = protoModule.writeString(var3609, var3610, self.payer_name)
		buff = var3609
		var3604 = var3610
	end
	if self.logo_asset_id ~= nil then
		local var3611, var3612 = protoModule.writeTag(buff, var3604, 4, protoModule.wireTypes.lengthDelimited)
		var3611, var5251 = protoModule.writeString(var3611, var3612, self.logo_asset_id)
		buff = var3611
		var3604 = var3612
	end
	if self.logo_aspect_ratio ~= nil then
		local var3613, var3614 = protoModule.writeTag(buff, var3604, 5, protoModule.wireTypes.i64)
		var3613, var5253 = protoModule.writeDouble(var3613, var3614, self.logo_aspect_ratio)
		buff = var3613
		var3604 = var3614
	end
	if self.cta_text ~= nil then
		local var3615, var3616 = protoModule.writeTag(buff, var3604, 6, protoModule.wireTypes.lengthDelimited)
		var3615, var5255 = protoModule.writeString(var3615, var3616, self.cta_text)
		buff = var3615
		var3604 = var3616
	end
	if self.title ~= nil then
		local var3617, var3618 = protoModule.writeTag(buff, var3604, 7, protoModule.wireTypes.lengthDelimited)
		var3617, var5257 = protoModule.writeString(var3617, var3618, self.title)
		buff = var3617
		var3604 = var3618
	end
	if self.subtitle ~= nil then
		local var3619, var3620 = protoModule.writeTag(buff, var3604, 8, protoModule.wireTypes.lengthDelimited)
		var3619, var5259 = protoModule.writeString(var3619, var3620, self.subtitle)
		buff = var3619
		var3604 = var3620
	end
	if self.image_asset_id ~= nil then
		local var3621, var3622 = protoModule.writeTag(buff, var3604, 9, protoModule.wireTypes.lengthDelimited)
		var3621, var5261 = protoModule.writeString(var3621, var3622, self.image_asset_id)
		buff = var3621
		var3604 = var3622
	end
	if self.video_asset_id ~= nil then
		local var3623, var3624 = protoModule.writeTag(buff, var3604, 10, protoModule.wireTypes.lengthDelimited)
		var3623, var5263 = protoModule.writeString(var3623, var3624, self.video_asset_id)
		buff = var3623
		var3604 = var3624
	end
	if self.badge_text ~= nil then
		local var3625, var3626 = protoModule.writeTag(buff, var3604, 11, protoModule.wireTypes.lengthDelimited)
		var3625, var5265 = protoModule.writeString(var3625, var3626, self.badge_text)
		buff = var3625
		var3604 = var3626
	end
	if self.badge_analytics_id ~= nil then
		local var3627, var3628 = protoModule.writeTag(buff, var3604, 12, protoModule.wireTypes.lengthDelimited)
		var3627, var5267 = protoModule.writeString(var3627, var3628, self.badge_analytics_id)
		buff = var3627
		var3604 = var3628
	end
	if self.roblox_component ~= nil then
		local var3629, var3630 = protoModule.writeTag(buff, var3604, 13, protoModule.wireTypes.lengthDelimited)
		var3629, var5269 = protoModule.writeString(var3629, var3630, self.roblox_component)
		buff = var3629
		var3604 = var3630
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3631, var3632 = protoModule.writeTag(buff, var3604, 14, protoModule.wireTypes.lengthDelimited)
		var3631, var5271 = protoModule.writeString(var3631, var3632, self.attribution_thumbnail_asset_id)
		buff = var3631
		var3604 = var3632
	end
	local buff_1 = buffer.create(var3604)
	buffer.copy(buff_1, 0, buff, 0, var3604)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3604 = t_132.new()
	local var3605 = 0
	while var3605 < buffer.len(p132) do
		local _ = nil
		local var3606 = nil
		local var3607, var3608, var3609 = protoModule.readTag(p132, var3605)
		local var3610 = var3607
		var3606 = var3608
		var3605 = var3609
		
		if var3606 == protoModule.wireTypes.varint then
			local _ = nil
			local var3611, var3612 = protoModule.readVarInt(p132, var3605)
			local _ = var3611
			var3605 = var3612
			continue
		end
		if var3606 == protoModule.wireTypes.lengthDelimited then
			if var3610 == 1 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p132, var3605)
				var3605 = var3614
				var3604.clickout_url = buffer.tostring(var3613)
			elseif var3610 == 2 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p132, var3605)
				var3605 = var3616
				var3604.native_ad_data = buffer.tostring(var3615)
			elseif var3610 == 3 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p132, var3605)
				var3605 = var3618
				var3604.payer_name = buffer.tostring(var3617)
			elseif var3610 == 4 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p132, var3605)
				var3605 = var3620
				var3604.logo_asset_id = buffer.tostring(var3619)
			elseif var3610 == 6 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p132, var3605)
				var3605 = var3622
				var3604.cta_text = buffer.tostring(var3621)
			elseif var3610 == 7 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p132, var3605)
				var3605 = var3624
				var3604.title = buffer.tostring(var3623)
			elseif var3610 == 8 then
				local _ = nil
				local var3625, var3626 = protoModule.readBuffer(p132, var3605)
				var3605 = var3626
				var3604.subtitle = buffer.tostring(var3625)
			elseif var3610 == 9 then
				local _ = nil
				local var3627, var3628 = protoModule.readBuffer(p132, var3605)
				var3605 = var3628
				var3604.image_asset_id = buffer.tostring(var3627)
			elseif var3610 == 10 then
				local _ = nil
				local var3629, var3630 = protoModule.readBuffer(p132, var3605)
				var3605 = var3630
				var3604.video_asset_id = buffer.tostring(var3629)
			elseif var3610 == 11 then
				local _ = nil
				local var3631, var3632 = protoModule.readBuffer(p132, var3605)
				var3605 = var3632
				var3604.badge_text = buffer.tostring(var3631)
			elseif var3610 == 12 then
				local _ = nil
				local var3633, var3634 = protoModule.readBuffer(p132, var3605)
				var3605 = var3634
				var3604.badge_analytics_id = buffer.tostring(var3633)
			elseif var3610 == 13 then
				local _ = nil
				local var3635, var3636 = protoModule.readBuffer(p132, var3605)
				var3605 = var3636
				var3604.roblox_component = buffer.tostring(var3635)
			elseif var3610 == 14 then
				local _ = nil
				local var3637, var3638 = protoModule.readBuffer(p132, var3605)
				var3605 = var3638
				var3604.attribution_thumbnail_asset_id = buffer.tostring(var3637)
			else
				local _ = nil
				local var3639, var3640 = protoModule.readVarInt(p132, var3605)
				var3605 = var3640 + var3639
			end
		elseif var3606 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3641, var3642 = protoModule.readFixed32(p132, var3605)
			local _ = var3641
			var3605 = var3642
		elseif var3606 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5275)
		elseif var3610 == 5 then
			local _ = nil
			local var3643, var3644 = protoModule.readDouble(p132, var3605)
			var3605 = var3644
			var3604.logo_aspect_ratio = var3643
		else
			local _ = nil
			local var3645, var3646 = protoModule.readFixed64(p132, var3605)
			local _ = var3645
			var3605 = var3646
		end
	end
	return var3604
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
	local var3647 = t_132.new()
	
	if self.clickout_url ~= nil then
		var3647.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3647.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3647.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3647.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3647.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3647.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3647.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3647.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3647.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3647.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3647.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3647.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3647.title = self.title
	end
	if self.subtitle ~= nil then
		var3647.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3647.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3647.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3647.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3647.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3647.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3647.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3647.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3647.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3647.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3647.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3647.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3647.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3647
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
	local var3647 = 0
	
	if self.layout ~= nil then
		local var3648 = self.layout:encode()
		local var3649, var3650 = protoModule.writeTag(buff, var3647, 1, protoModule.wireTypes.lengthDelimited)
		var3649, var5322 = protoModule.writeBuffer(var3649, var3650, var3648, buffer.len(var3648))
		buff = var3649
		var3647 = var3650
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3651 = self.kind.value:encode()
			local var3652, var3653 = protoModule.writeTag(buff, var3647, 2, protoModule.wireTypes.lengthDelimited)
			var3652, var5325 = protoModule.writeBuffer(var3652, var3653, var3651, buffer.len(var3651))
			buff = var3652
			var3647 = var3653
		elseif self.kind.type == "ad_link" then
			local var3654 = self.kind.value:encode()
			local var3655, var3656 = protoModule.writeTag(buff, var3647, 3, protoModule.wireTypes.lengthDelimited)
			var3655, var5328 = protoModule.writeBuffer(var3655, var3656, var3654, buffer.len(var3654))
			buff = var3655
			var3647 = var3656
		end
	end
	local buff_1 = buffer.create(var3647)
	buffer.copy(buff_1, 0, buff, 0, var3647)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), t (ref)
	local var3647 = t_133.new()
	local var3648 = 0
	while var3648 < buffer.len(p133) do
		local _ = nil
		local var3649 = nil
		local var3650, var3651, var3652 = protoModule.readTag(p133, var3648)
		local var3653 = var3650
		var3649 = var3651
		var3648 = var3652
		
		if var3649 == protoModule.wireTypes.varint then
			local _ = nil
			local var3654, var3655 = protoModule.readVarInt(p133, var3648)
			local _ = var3654
			var3648 = var3655
			continue
		end
		if var3649 == protoModule.wireTypes.lengthDelimited then
			if var3653 == 1 then
				local _ = nil
				local var3656, var3657 = protoModule.readBuffer(p133, var3648)
				var3648 = var3657
				var3647.layout = t.ItemLayout.decode(var3656)
			elseif var3653 == 2 then
				local _ = nil
				local var3658, var3659 = protoModule.readBuffer(p133, var3648)
				var3648 = var3659
				var3647.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3658)
				}
			elseif var3653 == 3 then
				local _ = nil
				local var3660, var3661 = protoModule.readBuffer(p133, var3648)
				var3648 = var3661
				var3647.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3660) }
			else
				local _ = nil
				local var3662, var3663 = protoModule.readVarInt(p133, var3648)
				var3648 = var3663 + var3662
			end
		elseif var3649 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3664, var3665 = protoModule.readFixed32(p133, var3648)
			local _ = var3664
			var3648 = var3665
		elseif var3649 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3666, var3667 = protoModule.readFixed64(p133, var3648)
			local _ = var3666
			var3648 = var3667
		else
			error("Unsupported wire type: " .. var5332)
		end
	end
	return var3647
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
	local var3668 = t_133.new()
	
	if self.layout ~= nil then
		var3668.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3668.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3668.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3668.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3668
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
	local var3668 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3669 = v:encode()
			local var3670, var3671 = protoModule.writeTag(buff, var3668, 1, protoModule.wireTypes.lengthDelimited)
			var3670, var5357 = protoModule.writeBuffer(var3670, var3671, var3669, buffer.len(var3669))
			buff = var3670
			var3668 = var3671
		end
	end
	if self.collection_item_size ~= nil then
		local var3672, var3673 = protoModule.writeTag(buff, var3668, 2, protoModule.wireTypes.lengthDelimited)
		var3672, var5359 = protoModule.writeString(var3672, var3673, self.collection_item_size)
		buff = var3672
		var3668 = var3673
	end
	local buff_1 = buffer.create(var3668)
	buffer.copy(buff_1, 0, buff, 0, var3668)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var3674 = t_134.new()
	local var3675 = 0
	while var3675 < buffer.len(p134) do
		local _ = nil
		local var3676 = nil
		local var3677, var3678, var3679 = protoModule.readTag(p134, var3675)
		local var3680 = var3677
		var3676 = var3678
		var3675 = var3679
		
		if var3676 == protoModule.wireTypes.varint then
			local _ = nil
			local var3681, var3682 = protoModule.readVarInt(p134, var3675)
			local _ = var3681
			var3675 = var3682
			continue
		end
		if var3676 == protoModule.wireTypes.lengthDelimited then
			if var3680 == 1 then
				local _ = nil
				local var3683, var3684 = protoModule.readBuffer(p134, var3675)
				var3675 = var3684
				table.insert(var3674.items, t.ItemWithLayout.decode(var3683))
			elseif var3680 == 2 then
				local _ = nil
				local var3685, var3686 = protoModule.readBuffer(p134, var3675)
				var3675 = var3686
				var3674.collection_item_size = buffer.tostring(var3685)
			else
				local _ = nil
				local var3687, var3688 = protoModule.readVarInt(p134, var3675)
				var3675 = var3688 + var3687
			end
		elseif var3676 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3689, var3690 = protoModule.readFixed32(p134, var3675)
			local _ = var3689
			var3675 = var3690
		elseif var3676 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3691, var3692 = protoModule.readFixed64(p134, var3675)
			local _ = var3691
			var3675 = var3692
		else
			error("Unsupported wire type: " .. var5363)
		end
	end
	return var3674
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
	local var3693 = t_134.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3693.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3693.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3693.collection_item_size = self.collectionItemSize
	end
	return var3693
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
	local var3694 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3695, var3696 = protoModule.writeTag(buff, var3694, 1, protoModule.wireTypes.varint)
		var3695, var5387 = protoModule.writeVarInt(var3695, var3696, self.col_span)
		buff = var3695
		var3694 = var3696
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3697, var3698 = protoModule.writeTag(buff, var3694, 2, protoModule.wireTypes.varint)
		var3697, var5389 = protoModule.writeVarInt(var3697, var3698, self.row_span)
		buff = var3697
		var3694 = var3698
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3699, var3700 = protoModule.writeTag(buff, var3694, 3, protoModule.wireTypes.lengthDelimited)
		var3699, var5391 = protoModule.writeString(var3699, var3700, self.alignment_type)
		buff = var3699
		var3694 = var3700
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3701, var3702 = protoModule.writeTag(buff, var3694, 4, protoModule.wireTypes.varint)
		var3701, var5393 = protoModule.writeVarInt(var3701, var3702, self.min_row_padding)
		buff = var3701
		var3694 = var3702
	end
	local buff_1 = buffer.create(var3694)
	buffer.copy(buff_1, 0, buff, 0, var3694)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref)
	local var3694 = t_135.new()
	local var3695 = 0
	while var3695 < buffer.len(p135) do
		local _ = nil
		local var3696 = nil
		local var3697, var3698, var3699 = protoModule.readTag(p135, var3695)
		local var3700 = var3697
		var3696 = var3698
		var3695 = var3699
		
		if var3696 == protoModule.wireTypes.varint then
			if var3700 == 1 then
				local _ = nil
				local var3701, var3702 = protoModule.readVarIntI32(p135, var3695)
				var3695 = var3702
				var3694.col_span = var3701
			elseif var3700 == 2 then
				local _ = nil
				local var3703, var3704 = protoModule.readVarIntI32(p135, var3695)
				var3695 = var3704
				var3694.row_span = var3703
			elseif var3700 == 4 then
				local _ = nil
				local var3705, var3706 = protoModule.readVarIntI32(p135, var3695)
				var3695 = var3706
				var3694.min_row_padding = var3705
			else
				local _ = nil
				local var3707, var3708 = protoModule.readVarInt(p135, var3695)
				local _ = var3707
				var3695 = var3708
			end
		end
		if var3696 == protoModule.wireTypes.lengthDelimited then
			if var3700 == 3 then
				local _ = nil
				local var3709, var3710 = protoModule.readBuffer(p135, var3695)
				var3695 = var3710
				var3694.alignment_type = buffer.tostring(var3709)
			else
				local _ = nil
				local var3711, var3712 = protoModule.readVarInt(p135, var3695)
				var3695 = var3712 + var3711
			end
		elseif var3696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3713, var3714 = protoModule.readFixed32(p135, var3695)
			local _ = var3713
			var3695 = var3714
		elseif var3696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3715, var3716 = protoModule.readFixed64(p135, var3695)
			local _ = var3715
			var3695 = var3716
		else
			error("Unsupported wire type: " .. var5397)
		end
	end
	return var3694
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
	local var3717 = t_135.new()
	
	if self.col_span ~= nil then
		var3717.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3717.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3717.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3717.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3717.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3717.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3717.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3717.min_row_padding = self.minRowPadding
	end
	return var3717
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
	local var3717 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3718, var3719 = protoModule.writeTag(buff, var3717, 1, protoModule.wireTypes.lengthDelimited)
		var3718, var5423 = protoModule.writeString(var3718, var3719, self.community_id)
		buff = var3718
		var3717 = var3719
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3720, var3721 = protoModule.writeTag(buff, var3717, 2, protoModule.wireTypes.lengthDelimited)
		var3720, var5425 = protoModule.writeString(var3720, var3721, self.announcement_id)
		buff = var3720
		var3717 = var3721
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3722, var3723 = protoModule.writeTag(buff, var3717, 3, protoModule.wireTypes.lengthDelimited)
		var3722, var5427 = protoModule.writeString(var3722, var3723, self.message_id)
		buff = var3722
		var3717 = var3723
	end
	if self.title ~= nil and self.title ~= "" then
		local var3724, var3725 = protoModule.writeTag(buff, var3717, 4, protoModule.wireTypes.lengthDelimited)
		var3724, var5429 = protoModule.writeString(var3724, var3725, self.title)
		buff = var3724
		var3717 = var3725
	end
	if self.body ~= nil and self.body ~= "" then
		local var3726, var3727 = protoModule.writeTag(buff, var3717, 5, protoModule.wireTypes.lengthDelimited)
		var3726, var5431 = protoModule.writeString(var3726, var3727, self.body)
		buff = var3726
		var3717 = var3727
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3728, var3729 = protoModule.writeTag(buff, var3717, 6, protoModule.wireTypes.lengthDelimited)
		var3728, var5433 = protoModule.writeString(var3728, var3729, self.creator_key)
		buff = var3728
		var3717 = var3729
	end
	if self.creator_role_name ~= nil then
		local var3730, var3731 = protoModule.writeTag(buff, var3717, 7, protoModule.wireTypes.lengthDelimited)
		var3730, var5435 = protoModule.writeString(var3730, var3731, self.creator_role_name)
		buff = var3730
		var3717 = var3731
	end
	if self.media_asset_id ~= nil then
		local var3732, var3733 = protoModule.writeTag(buff, var3717, 8, protoModule.wireTypes.lengthDelimited)
		var3732, var5437 = protoModule.writeString(var3732, var3733, self.media_asset_id)
		buff = var3732
		var3717 = var3733
	end
	if self.created_time ~= nil then
		local var3734 = self.created_time:encode()
		local var3735, var3736 = protoModule.writeTag(buff, var3717, 9, protoModule.wireTypes.lengthDelimited)
		var3735, var5440 = protoModule.writeBuffer(var3735, var3736, var3734, buffer.len(var3734))
		buff = var3735
		var3717 = var3736
	end
	local buff_1 = buffer.create(var3717)
	buffer.copy(buff_1, 0, buff, 0, var3717)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), timestampModule (ref)
	local var3717 = t_136.new()
	local var3718 = 0
	while var3718 < buffer.len(p136) do
		local _ = nil
		local var3719 = nil
		local var3720, var3721, var3722 = protoModule.readTag(p136, var3718)
		local var3723 = var3720
		var3719 = var3721
		var3718 = var3722
		
		if var3719 == protoModule.wireTypes.varint then
			local _ = nil
			local var3724, var3725 = protoModule.readVarInt(p136, var3718)
			local _ = var3724
			var3718 = var3725
			continue
		end
		if var3719 == protoModule.wireTypes.lengthDelimited then
			if var3723 == 1 then
				local _ = nil
				local var3726, var3727 = protoModule.readBuffer(p136, var3718)
				var3718 = var3727
				var3717.community_id = buffer.tostring(var3726)
			elseif var3723 == 2 then
				local _ = nil
				local var3728, var3729 = protoModule.readBuffer(p136, var3718)
				var3718 = var3729
				var3717.announcement_id = buffer.tostring(var3728)
			elseif var3723 == 3 then
				local _ = nil
				local var3730, var3731 = protoModule.readBuffer(p136, var3718)
				var3718 = var3731
				var3717.message_id = buffer.tostring(var3730)
			elseif var3723 == 4 then
				local _ = nil
				local var3732, var3733 = protoModule.readBuffer(p136, var3718)
				var3718 = var3733
				var3717.title = buffer.tostring(var3732)
			elseif var3723 == 5 then
				local _ = nil
				local var3734, var3735 = protoModule.readBuffer(p136, var3718)
				var3718 = var3735
				var3717.body = buffer.tostring(var3734)
			elseif var3723 == 6 then
				local _ = nil
				local var3736, var3737 = protoModule.readBuffer(p136, var3718)
				var3718 = var3737
				var3717.creator_key = buffer.tostring(var3736)
			elseif var3723 == 7 then
				local _ = nil
				local var3738, var3739 = protoModule.readBuffer(p136, var3718)
				var3718 = var3739
				var3717.creator_role_name = buffer.tostring(var3738)
			elseif var3723 == 8 then
				local _ = nil
				local var3740, var3741 = protoModule.readBuffer(p136, var3718)
				var3718 = var3741
				var3717.media_asset_id = buffer.tostring(var3740)
			elseif var3723 == 9 then
				local _ = nil
				local var3742, var3743 = protoModule.readBuffer(p136, var3718)
				var3718 = var3743
				var3717.created_time = timestampModule.Timestamp.decode(var3742)
			else
				local _ = nil
				local var3744, var3745 = protoModule.readVarInt(p136, var3718)
				var3718 = var3745 + var3744
			end
		elseif var3719 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3746, var3747 = protoModule.readFixed32(p136, var3718)
			local _ = var3746
			var3718 = var3747
		elseif var3719 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3748, var3749 = protoModule.readFixed64(p136, var3718)
			local _ = var3748
			var3718 = var3749
		else
			error("Unsupported wire type: " .. var5444)
		end
	end
	return var3717
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
	local var3750 = t_136.new()
	
	if self.community_id ~= nil then
		var3750.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3750.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3750.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3750.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3750.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3750.message_id = self.messageId
	end
	if self.title ~= nil then
		var3750.title = self.title
	end
	if self.body ~= nil then
		var3750.body = self.body
	end
	if self.creator_key ~= nil then
		var3750.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3750.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3750.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3750.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3750.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3750.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3750.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3750.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3750
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
	local var3750 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var3751, var3752 = protoModule.writeTag(buff, var3750, 1, protoModule.wireTypes.lengthDelimited)
		var3751, var5480 = protoModule.writeString(var3751, var3752, self.group_id)
		buff = var3751
		var3750 = var3752
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3753, var3754 = protoModule.writeTag(buff, var3750, 2, protoModule.wireTypes.lengthDelimited)
		var3753, var5482 = protoModule.writeString(var3753, var3754, self.announcement_id)
		buff = var3753
		var3750 = var3754
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3755, var3756 = protoModule.writeTag(buff, var3750, 3, protoModule.wireTypes.lengthDelimited)
		var3755, var5484 = protoModule.writeString(var3755, var3756, self.message_id)
		buff = var3755
		var3750 = var3756
	end
	if self.title ~= nil and self.title ~= "" then
		local var3757, var3758 = protoModule.writeTag(buff, var3750, 4, protoModule.wireTypes.lengthDelimited)
		var3757, var5486 = protoModule.writeString(var3757, var3758, self.title)
		buff = var3757
		var3750 = var3758
	end
	if self.body ~= nil and self.body ~= "" then
		local var3759, var3760 = protoModule.writeTag(buff, var3750, 5, protoModule.wireTypes.lengthDelimited)
		var3759, var5488 = protoModule.writeString(var3759, var3760, self.body)
		buff = var3759
		var3750 = var3760
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3761, var3762 = protoModule.writeTag(buff, var3750, 6, protoModule.wireTypes.lengthDelimited)
		var3761, var5490 = protoModule.writeString(var3761, var3762, self.creator_key)
		buff = var3761
		var3750 = var3762
	end
	if self.creator_role_name ~= nil then
		local var3763, var3764 = protoModule.writeTag(buff, var3750, 7, protoModule.wireTypes.lengthDelimited)
		var3763, var5492 = protoModule.writeString(var3763, var3764, self.creator_role_name)
		buff = var3763
		var3750 = var3764
	end
	if self.media_asset_id ~= nil then
		local var3765, var3766 = protoModule.writeTag(buff, var3750, 8, protoModule.wireTypes.lengthDelimited)
		var3765, var5494 = protoModule.writeString(var3765, var3766, self.media_asset_id)
		buff = var3765
		var3750 = var3766
	end
	if self.created_time ~= nil then
		local var3767 = self.created_time:encode()
		local var3768, var3769 = protoModule.writeTag(buff, var3750, 9, protoModule.wireTypes.lengthDelimited)
		var3768, var5497 = protoModule.writeBuffer(var3768, var3769, var3767, buffer.len(var3767))
		buff = var3768
		var3750 = var3769
	end
	local buff_1 = buffer.create(var3750)
	buffer.copy(buff_1, 0, buff, 0, var3750)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), timestampModule (ref)
	local var3750 = t_137.new()
	local var3751 = 0
	while var3751 < buffer.len(p137) do
		local _ = nil
		local var3752 = nil
		local var3753, var3754, var3755 = protoModule.readTag(p137, var3751)
		local var3756 = var3753
		var3752 = var3754
		var3751 = var3755
		
		if var3752 == protoModule.wireTypes.varint then
			local _ = nil
			local var3757, var3758 = protoModule.readVarInt(p137, var3751)
			local _ = var3757
			var3751 = var3758
			continue
		end
		if var3752 == protoModule.wireTypes.lengthDelimited then
			if var3756 == 1 then
				local _ = nil
				local var3759, var3760 = protoModule.readBuffer(p137, var3751)
				var3751 = var3760
				var3750.group_id = buffer.tostring(var3759)
			elseif var3756 == 2 then
				local _ = nil
				local var3761, var3762 = protoModule.readBuffer(p137, var3751)
				var3751 = var3762
				var3750.announcement_id = buffer.tostring(var3761)
			elseif var3756 == 3 then
				local _ = nil
				local var3763, var3764 = protoModule.readBuffer(p137, var3751)
				var3751 = var3764
				var3750.message_id = buffer.tostring(var3763)
			elseif var3756 == 4 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p137, var3751)
				var3751 = var3766
				var3750.title = buffer.tostring(var3765)
			elseif var3756 == 5 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p137, var3751)
				var3751 = var3768
				var3750.body = buffer.tostring(var3767)
			elseif var3756 == 6 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p137, var3751)
				var3751 = var3770
				var3750.creator_key = buffer.tostring(var3769)
			elseif var3756 == 7 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p137, var3751)
				var3751 = var3772
				var3750.creator_role_name = buffer.tostring(var3771)
			elseif var3756 == 8 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p137, var3751)
				var3751 = var3774
				var3750.media_asset_id = buffer.tostring(var3773)
			elseif var3756 == 9 then
				local _ = nil
				local var3775, var3776 = protoModule.readBuffer(p137, var3751)
				var3751 = var3776
				var3750.created_time = timestampModule.Timestamp.decode(var3775)
			else
				local _ = nil
				local var3777, var3778 = protoModule.readVarInt(p137, var3751)
				var3751 = var3778 + var3777
			end
		elseif var3752 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3779, var3780 = protoModule.readFixed32(p137, var3751)
			local _ = var3779
			var3751 = var3780
		elseif var3752 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3781, var3782 = protoModule.readFixed64(p137, var3751)
			local _ = var3781
			var3751 = var3782
		else
			error("Unsupported wire type: " .. var5501)
		end
	end
	return var3750
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
	local var3783 = t_137.new()
	
	if self.group_id ~= nil then
		var3783.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var3783.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		var3783.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3783.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3783.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3783.message_id = self.messageId
	end
	if self.title ~= nil then
		var3783.title = self.title
	end
	if self.body ~= nil then
		var3783.body = self.body
	end
	if self.creator_key ~= nil then
		var3783.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3783.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3783.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3783.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3783.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3783.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3783.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3783.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3783
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