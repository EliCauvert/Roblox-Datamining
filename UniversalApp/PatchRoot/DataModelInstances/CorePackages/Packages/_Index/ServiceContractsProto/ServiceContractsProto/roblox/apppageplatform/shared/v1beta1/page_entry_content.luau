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
		var3, var147 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var150 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var154)
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
		var22, var177 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var179 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var183)
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
		var40, var205 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var208 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var211 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var215)
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
		var61, var239 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var242 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var245 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var249)
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
			var83, var274 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var277 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var280 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var283 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var286 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var289 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var292 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var295 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var298 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var301 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var304 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var307 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var310 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var313 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var316 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var319 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var322 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var325 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var328 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var331 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var334 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var337 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var340 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var343 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var346 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var349 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var352 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var355 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var358 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var361 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var364 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var367 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var370 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var373 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var376 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var379 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var382 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "sandbox_content" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 50, protoModule.wireTypes.lengthDelimited)
			var194, var385 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_feed" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var197, var388 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_action_bar" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var200, var391 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_banner_image" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var203, var394 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "experience_details_sticky_header" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var206, var397 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_feed" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var209, var400 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_details_action_bar" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var212, var403 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_attribution_row" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var215, var406 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_description" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var218, var409 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_info_table" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var221, var412 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var224, var415 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "event_notifications_modal" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var227, var418 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "dev_store_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var230, var421 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "charts_feed" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var233, var424 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "filter_pills" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var236, var427 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "sort_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var239, var430 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "genre_selector" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var242, var433 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var245, var436 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var248, var439 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var251, var442 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var254, var445 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var257, var448 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "catalog_item_grid" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var260, var451 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "marketplace_offer_modal" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var263, var454 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "marketplace_item_media_header" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 907, protoModule.wireTypes.lengthDelimited)
			var266, var457 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "search_results_feed" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var269, var460 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "power_search_ai_overview" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var272, var463 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "experience_emphasis_tile" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var275, var466 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "option_selector_carousel" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var278, var469 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "game_items_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var281, var472 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "hero_unit" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var284, var475 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var287, var478 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var290, var481 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var293, var484 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "community_announcement" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var296, var487 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
		elseif self.kind.type == "settings_row" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var299, var490 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var81 = var300
		elseif self.kind.type == "settings_toggle" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var302, var493 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var81 = var303
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
			elseif var87 == 1500 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p5, var82)
				var82 = var235
				var81.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(var234)
				}
			elseif var87 == 1501 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p5, var82)
				var82 = var237
				var81.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(var236)
				}
			else
				local _ = nil
				local var238, var239 = protoModule.readVarInt(p5, var82)
				var82 = var239 + var238
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var240, var241 = protoModule.readFixed32(p5, var82)
			local _ = var240
			var82 = var241
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var242, var243 = protoModule.readFixed64(p5, var82)
			local _ = var242
			var82 = var243
		else
			error("Unsupported wire type: " .. var497)
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
	local var244 = t_5.new()
	
	if self.badges_grid ~= nil then
		var244.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var244.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var244.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var244.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var244.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var244.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var244.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var244.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var244.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var244.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var244.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var244.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var244.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var244.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var244.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var244.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var244.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var244.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var244.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var244.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var244.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var244.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var244.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var244.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var244.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var244.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var244.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var244.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var244.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var244.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var244.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var244.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var244.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var244.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var244.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var244.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var244.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var244.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var244.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var244.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var244.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var244.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var244.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var244.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var244.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var244.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var244.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var244.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var244.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var244.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var244.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var244.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var244.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var244.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var244.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var244.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var244.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var244.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var244.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var244.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var244.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var244.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var244.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var244.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var244.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var244.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var244.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var244.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.sandbox_content ~= nil then
		var244.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandbox_content)
		}
	end
	if self.sandboxContent ~= nil then
		var244.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandboxContent)
		}
	end
	if self.experience_details_feed ~= nil then
		var244.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var244.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var244.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var244.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var244.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var244.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var244.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var244.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var244.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var244.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var244.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var244.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var244.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var244.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var244.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var244.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var244.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var244.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var244.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var244.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var244.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var244.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var244.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var244.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var244.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var244.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var244.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var244.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var244.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var244.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var244.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var244.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var244.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var244.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var244.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var244.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var244.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var244.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var244.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var244.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var244.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var244.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var244.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var244.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var244.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var244.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.marketplace_item_media_header ~= nil then
		var244.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplace_item_media_header)
		}
	end
	if self.marketplaceItemMediaHeader ~= nil then
		var244.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplaceItemMediaHeader)
		}
	end
	if self.search_results_feed ~= nil then
		var244.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var244.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var244.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var244.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var244.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var244.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var244.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var244.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var244.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var244.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var244.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var244.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var244.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var244.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var244.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var244.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var244.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var244.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var244.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var244.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var244.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var244.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		var244.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		var244.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
		}
	end
	return var244
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
	local var244 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var245, var246 = protoModule.writeTag(buff, var244, 1, protoModule.wireTypes.lengthDelimited)
		var245, var663 = protoModule.writeString(var245, var246, self.section_title)
		buff = var245
		var244 = var246
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var247 = v:encode()
			local var248, var249 = protoModule.writeTag(buff, var244, 2, protoModule.wireTypes.lengthDelimited)
			var248, var666 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var244 = var249
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var250, var251 = protoModule.writeTag(buff, var244, 3, protoModule.wireTypes.lengthDelimited)
		var250, var668 = protoModule.writeString(var250, var251, self.collection_id)
		buff = var250
		var244 = var251
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var252, var253 = protoModule.writeTag(buff, var244, 4, protoModule.wireTypes.lengthDelimited)
		var252, var670 = protoModule.writeString(var252, var253, self.collection_position)
		buff = var252
		var244 = var253
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var254, var255 = protoModule.writeTag(buff, var244, 5, protoModule.wireTypes.lengthDelimited)
		var254, var672 = protoModule.writeString(var254, var255, self.universe_id)
		buff = var254
		var244 = var255
	end
	local buff_1 = buffer.create(var244)
	buffer.copy(buff_1, 0, buff, 0, var244)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var256 = t_6.new()
	local var257 = 0
	while var257 < buffer.len(p6) do
		local _ = nil
		local var258 = nil
		local var259, var260, var261 = protoModule.readTag(p6, var257)
		local var262 = var259
		var258 = var260
		var257 = var261
		
		if var258 == protoModule.wireTypes.varint then
			local _ = nil
			local var263, var264 = protoModule.readVarInt(p6, var257)
			local _ = var263
			var257 = var264
			continue
		end
		if var258 == protoModule.wireTypes.lengthDelimited then
			if var262 == 1 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p6, var257)
				var257 = var266
				var256.section_title = buffer.tostring(var265)
			elseif var262 == 2 then
				local _ = nil
				local var267, var268 = protoModule.readBuffer(p6, var257)
				var257 = var268
				table.insert(var256.badges, t.BadgesGridInputData_BadgeInputData.decode(var267))
			elseif var262 == 3 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p6, var257)
				var257 = var270
				var256.collection_id = buffer.tostring(var269)
			elseif var262 == 4 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p6, var257)
				var257 = var272
				var256.collection_position = buffer.tostring(var271)
			elseif var262 == 5 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p6, var257)
				var257 = var274
				var256.universe_id = buffer.tostring(var273)
			else
				local _ = nil
				local var275, var276 = protoModule.readVarInt(p6, var257)
				var257 = var276 + var275
			end
		elseif var258 == protoModule.wireTypes.i32 then
			local _ = nil
			local var277, var278 = protoModule.readFixed32(p6, var257)
			local _ = var277
			var257 = var278
		elseif var258 == protoModule.wireTypes.i64 then
			local _ = nil
			local var279, var280 = protoModule.readFixed64(p6, var257)
			local _ = var279
			var257 = var280
		else
			error("Unsupported wire type: " .. var676)
		end
	end
	return var256
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
	local var281 = t_6.new()
	
	if self.section_title ~= nil then
		var281.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var281.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var281.badges = t_1
	end
	if self.collection_id ~= nil then
		var281.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var281.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var281.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var281.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var281.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var281.universe_id = self.universeId
	end
	return var281
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
	local var282 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var283, var284 = protoModule.writeTag(buff, var282, 1, protoModule.wireTypes.lengthDelimited)
		var283, var706 = protoModule.writeString(var283, var284, self.badge_id)
		buff = var283
		var282 = var284
	end
	local buff_1 = buffer.create(var282)
	buffer.copy(buff_1, 0, buff, 0, var282)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var282 = t_7.new()
	local var283 = 0
	while var283 < buffer.len(p7) do
		local _ = nil
		local var284 = nil
		local var285, var286, var287 = protoModule.readTag(p7, var283)
		local var288 = var285
		var284 = var286
		var283 = var287
		
		if var284 == protoModule.wireTypes.varint then
			local _ = nil
			local var289, var290 = protoModule.readVarInt(p7, var283)
			local _ = var289
			var283 = var290
			continue
		end
		if var284 == protoModule.wireTypes.lengthDelimited then
			if var288 == 1 then
				local _ = nil
				local var291, var292 = protoModule.readBuffer(p7, var283)
				var283 = var292
				var282.badge_id = buffer.tostring(var291)
			else
				local _ = nil
				local var293, var294 = protoModule.readVarInt(p7, var283)
				var283 = var294 + var293
			end
		elseif var284 == protoModule.wireTypes.i32 then
			local _ = nil
			local var295, var296 = protoModule.readFixed32(p7, var283)
			local _ = var295
			var283 = var296
		elseif var284 == protoModule.wireTypes.i64 then
			local _ = nil
			local var297, var298 = protoModule.readFixed64(p7, var283)
			local _ = var297
			var283 = var298
		else
			error("Unsupported wire type: " .. var710)
		end
	end
	return var282
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
	local var299 = t_7.new()
	
	if self.badge_id ~= nil then
		var299.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var299.badge_id = self.badgeId
	end
	return var299
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
	local var299 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var300, var301 = protoModule.writeTag(buff, var299, 1, protoModule.wireTypes.lengthDelimited)
		var300, var730 = protoModule.writeString(var300, var301, self.badge_id)
		buff = var300
		var299 = var301
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var302, var303 = protoModule.writeTag(buff, var299, 2, protoModule.wireTypes.lengthDelimited)
		var302, var732 = protoModule.writeString(var302, var303, self.universe_id)
		buff = var302
		var299 = var303
	end
	if self.localized_literals ~= nil then
		local var304 = self.localized_literals:encode()
		local var305, var306 = protoModule.writeTag(buff, var299, 3, protoModule.wireTypes.lengthDelimited)
		var305, var735 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
		buff = var305
		var299 = var306
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var307, var308 = protoModule.writeTag(buff, var299, 4, protoModule.wireTypes.lengthDelimited)
		var307, var737 = protoModule.writeString(var307, var308, self.creator_key)
		buff = var307
		var299 = var308
	end
	local buff_1 = buffer.create(var299)
	buffer.copy(buff_1, 0, buff, 0, var299)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var299 = t_8.new()
	local var300 = 0
	while var300 < buffer.len(p8) do
		local _ = nil
		local var301 = nil
		local var302, var303, var304 = protoModule.readTag(p8, var300)
		local var305 = var302
		var301 = var303
		var300 = var304
		
		if var301 == protoModule.wireTypes.varint then
			local _ = nil
			local var306, var307 = protoModule.readVarInt(p8, var300)
			local _ = var306
			var300 = var307
			continue
		end
		if var301 == protoModule.wireTypes.lengthDelimited then
			if var305 == 1 then
				local _ = nil
				local var308, var309 = protoModule.readBuffer(p8, var300)
				var300 = var309
				var299.badge_id = buffer.tostring(var308)
			elseif var305 == 2 then
				local _ = nil
				local var310, var311 = protoModule.readBuffer(p8, var300)
				var300 = var311
				var299.universe_id = buffer.tostring(var310)
			elseif var305 == 3 then
				local _ = nil
				local var312, var313 = protoModule.readBuffer(p8, var300)
				var300 = var313
				var299.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var312)
			elseif var305 == 4 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p8, var300)
				var300 = var315
				var299.creator_key = buffer.tostring(var314)
			else
				local _ = nil
				local var316, var317 = protoModule.readVarInt(p8, var300)
				var300 = var317 + var316
			end
		elseif var301 == protoModule.wireTypes.i32 then
			local _ = nil
			local var318, var319 = protoModule.readFixed32(p8, var300)
			local _ = var318
			var300 = var319
		elseif var301 == protoModule.wireTypes.i64 then
			local _ = nil
			local var320, var321 = protoModule.readFixed64(p8, var300)
			local _ = var320
			var300 = var321
		else
			error("Unsupported wire type: " .. var741)
		end
	end
	return var299
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
	local var322 = t_8.new()
	
	if self.badge_id ~= nil then
		var322.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var322.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var322.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var322.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var322.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var322.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var322.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var322.creator_key = self.creatorKey
	end
	return var322
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
	local var322 = 0
	
	if self.info_table ~= nil then
		local var323 = self.info_table:encode()
		local var324, var325 = protoModule.writeTag(buff, var322, 1, protoModule.wireTypes.lengthDelimited)
		var324, var768 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
		buff = var324
		var322 = var325
	end
	if self.action_module ~= nil then
		local var326 = self.action_module:encode()
		local var327, var328 = protoModule.writeTag(buff, var322, 2, protoModule.wireTypes.lengthDelimited)
		var327, var771 = protoModule.writeBuffer(var327, var328, var326, buffer.len(var326))
		buff = var327
		var322 = var328
	end
	if self.overflow_menu ~= nil then
		local var329 = self.overflow_menu:encode()
		local var330, var331 = protoModule.writeTag(buff, var322, 3, protoModule.wireTypes.lengthDelimited)
		var330, var774 = protoModule.writeBuffer(var330, var331, var329, buffer.len(var329))
		buff = var330
		var322 = var331
	end
	local buff_1 = buffer.create(var322)
	buffer.copy(buff_1, 0, buff, 0, var322)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var322 = t_9.new()
	local var323 = 0
	while var323 < buffer.len(p9) do
		local _ = nil
		local var324 = nil
		local var325, var326, var327 = protoModule.readTag(p9, var323)
		local var328 = var325
		var324 = var326
		var323 = var327
		
		if var324 == protoModule.wireTypes.varint then
			local _ = nil
			local var329, var330 = protoModule.readVarInt(p9, var323)
			local _ = var329
			var323 = var330
			continue
		end
		if var324 == protoModule.wireTypes.lengthDelimited then
			if var328 == 1 then
				local _ = nil
				local var331, var332 = protoModule.readBuffer(p9, var323)
				var323 = var332
				var322.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var331)
			elseif var328 == 2 then
				local _ = nil
				local var333, var334 = protoModule.readBuffer(p9, var323)
				var323 = var334
				var322.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var333)
			elseif var328 == 3 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p9, var323)
				var323 = var336
				var322.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var335)
			else
				local _ = nil
				local var337, var338 = protoModule.readVarInt(p9, var323)
				var323 = var338 + var337
			end
		elseif var324 == protoModule.wireTypes.i32 then
			local _ = nil
			local var339, var340 = protoModule.readFixed32(p9, var323)
			local _ = var339
			var323 = var340
		elseif var324 == protoModule.wireTypes.i64 then
			local _ = nil
			local var341, var342 = protoModule.readFixed64(p9, var323)
			local _ = var341
			var323 = var342
		else
			error("Unsupported wire type: " .. var778)
		end
	end
	return var322
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
	local var343 = t_9.new()
	
	if self.info_table ~= nil then
		var343.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var343.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var343.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var343.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var343.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var343.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var343
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
	local var343 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var344, var345 = protoModule.writeTag(buff, var343, 1, protoModule.wireTypes.lengthDelimited)
		var344, var802 = protoModule.writeString(var344, var345, self.type_label)
		buff = var344
		var343 = var345
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var343, 2, protoModule.wireTypes.lengthDelimited)
		var346, var804 = protoModule.writeString(var346, var347, self.earned_label)
		buff = var346
		var343 = var347
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var343, 3, protoModule.wireTypes.lengthDelimited)
		var348, var806 = protoModule.writeString(var348, var349, self.updated_label)
		buff = var348
		var343 = var349
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var343, 4, protoModule.wireTypes.lengthDelimited)
		var350, var808 = protoModule.writeString(var350, var351, self.experience_label)
		buff = var350
		var343 = var351
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var343, 5, protoModule.wireTypes.lengthDelimited)
		var352, var810 = protoModule.writeString(var352, var353, self.rarity_label)
		buff = var352
		var343 = var353
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var354, var355 = protoModule.writeTag(buff, var343, 6, protoModule.wireTypes.lengthDelimited)
		var354, var812 = protoModule.writeString(var354, var355, self.won_yesterday_label)
		buff = var354
		var343 = var355
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var343, 7, protoModule.wireTypes.lengthDelimited)
		var356, var814 = protoModule.writeString(var356, var357, self.won_ever_label)
		buff = var356
		var343 = var357
	end
	local buff_1 = buffer.create(var343)
	buffer.copy(buff_1, 0, buff, 0, var343)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var343 = t_10.new()
	local var344 = 0
	while var344 < buffer.len(p10) do
		local _ = nil
		local var345 = nil
		local var346, var347, var348 = protoModule.readTag(p10, var344)
		local var349 = var346
		var345 = var347
		var344 = var348
		
		if var345 == protoModule.wireTypes.varint then
			local _ = nil
			local var350, var351 = protoModule.readVarInt(p10, var344)
			local _ = var350
			var344 = var351
			continue
		end
		if var345 == protoModule.wireTypes.lengthDelimited then
			if var349 == 1 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var344)
				var344 = var353
				var343.type_label = buffer.tostring(var352)
			elseif var349 == 2 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var344)
				var344 = var355
				var343.earned_label = buffer.tostring(var354)
			elseif var349 == 3 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var344)
				var344 = var357
				var343.updated_label = buffer.tostring(var356)
			elseif var349 == 4 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var344)
				var344 = var359
				var343.experience_label = buffer.tostring(var358)
			elseif var349 == 5 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var344)
				var344 = var361
				var343.rarity_label = buffer.tostring(var360)
			elseif var349 == 6 then
				local _ = nil
				local var362, var363 = protoModule.readBuffer(p10, var344)
				var344 = var363
				var343.won_yesterday_label = buffer.tostring(var362)
			elseif var349 == 7 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p10, var344)
				var344 = var365
				var343.won_ever_label = buffer.tostring(var364)
			else
				local _ = nil
				local var366, var367 = protoModule.readVarInt(p10, var344)
				var344 = var367 + var366
			end
		elseif var345 == protoModule.wireTypes.i32 then
			local _ = nil
			local var368, var369 = protoModule.readFixed32(p10, var344)
			local _ = var368
			var344 = var369
		elseif var345 == protoModule.wireTypes.i64 then
			local _ = nil
			local var370, var371 = protoModule.readFixed64(p10, var344)
			local _ = var370
			var344 = var371
		else
			error("Unsupported wire type: " .. var818)
		end
	end
	return var343
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
	local var372 = t_10.new()
	
	if self.type_label ~= nil then
		var372.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var372.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var372.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var372.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var372.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var372.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var372.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var372.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var372.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var372.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var372.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var372.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var372.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var372.won_ever_label = self.wonEverLabel
	end
	return var372
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
	local var372 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var373, var374 = protoModule.writeTag(buff, var372, 1, protoModule.wireTypes.lengthDelimited)
		var373, var850 = protoModule.writeString(var373, var374, self.share)
		buff = var373
		var372 = var374
	end
	if self.report ~= nil and self.report ~= "" then
		local var375, var376 = protoModule.writeTag(buff, var372, 2, protoModule.wireTypes.lengthDelimited)
		var375, var852 = protoModule.writeString(var375, var376, self.report)
		buff = var375
		var372 = var376
	end
	local buff_1 = buffer.create(var372)
	buffer.copy(buff_1, 0, buff, 0, var372)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var372 = t_11.new()
	local var373 = 0
	while var373 < buffer.len(p11) do
		local _ = nil
		local var374 = nil
		local var375, var376, var377 = protoModule.readTag(p11, var373)
		local var378 = var375
		var374 = var376
		var373 = var377
		
		if var374 == protoModule.wireTypes.varint then
			local _ = nil
			local var379, var380 = protoModule.readVarInt(p11, var373)
			local _ = var379
			var373 = var380
			continue
		end
		if var374 == protoModule.wireTypes.lengthDelimited then
			if var378 == 1 then
				local _ = nil
				local var381, var382 = protoModule.readBuffer(p11, var373)
				var373 = var382
				var372.share = buffer.tostring(var381)
			elseif var378 == 2 then
				local _ = nil
				local var383, var384 = protoModule.readBuffer(p11, var373)
				var373 = var384
				var372.report = buffer.tostring(var383)
			else
				local _ = nil
				local var385, var386 = protoModule.readVarInt(p11, var373)
				var373 = var386 + var385
			end
		elseif var374 == protoModule.wireTypes.i32 then
			local _ = nil
			local var387, var388 = protoModule.readFixed32(p11, var373)
			local _ = var387
			var373 = var388
		elseif var374 == protoModule.wireTypes.i64 then
			local _ = nil
			local var389, var390 = protoModule.readFixed64(p11, var373)
			local _ = var389
			var373 = var390
		else
			error("Unsupported wire type: " .. var856)
		end
	end
	return var372
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
	local var391 = t_11.new()
	
	if self.share ~= nil then
		var391.share = self.share
	end
	if self.report ~= nil then
		var391.report = self.report
	end
	return var391
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
	local var391 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var392, var393 = protoModule.writeTag(buff, var391, 1, protoModule.wireTypes.lengthDelimited)
		var392, var878 = protoModule.writeString(var392, var393, self.report)
		buff = var392
		var391 = var393
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var394, var395 = protoModule.writeTag(buff, var391, 2, protoModule.wireTypes.lengthDelimited)
		var394, var880 = protoModule.writeString(var394, var395, self.remove)
		buff = var394
		var391 = var395
	end
	local buff_1 = buffer.create(var391)
	buffer.copy(buff_1, 0, buff, 0, var391)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var391 = t_12.new()
	local var392 = 0
	while var392 < buffer.len(p12) do
		local _ = nil
		local var393 = nil
		local var394, var395, var396 = protoModule.readTag(p12, var392)
		local var397 = var394
		var393 = var395
		var392 = var396
		
		if var393 == protoModule.wireTypes.varint then
			local _ = nil
			local var398, var399 = protoModule.readVarInt(p12, var392)
			local _ = var398
			var392 = var399
			continue
		end
		if var393 == protoModule.wireTypes.lengthDelimited then
			if var397 == 1 then
				local _ = nil
				local var400, var401 = protoModule.readBuffer(p12, var392)
				var392 = var401
				var391.report = buffer.tostring(var400)
			elseif var397 == 2 then
				local _ = nil
				local var402, var403 = protoModule.readBuffer(p12, var392)
				var392 = var403
				var391.remove = buffer.tostring(var402)
			else
				local _ = nil
				local var404, var405 = protoModule.readVarInt(p12, var392)
				var392 = var405 + var404
			end
		elseif var393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var406, var407 = protoModule.readFixed32(p12, var392)
			local _ = var406
			var392 = var407
		elseif var393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var408, var409 = protoModule.readFixed64(p12, var392)
			local _ = var408
			var392 = var409
		else
			error("Unsupported wire type: " .. var884)
		end
	end
	return var391
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
	local var410 = t_12.new()
	
	if self.report ~= nil then
		var410.report = self.report
	end
	if self.remove ~= nil then
		var410.remove = self.remove
	end
	return var410
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
	local var410 = t_13.new()
	local var411 = 0
	while var411 < buffer.len(p13) do
		local var412 = nil
		local _ = nil
		local var413, var414, var415 = protoModule.readTag(p13, var411)
		var412 = var413
		local var416 = var414
		var411 = var415
		
		if var416 == protoModule.wireTypes.varint then
			local _ = nil
			local var417, var418 = protoModule.readVarInt(p13, var411)
			local _ = var417
			var411 = var418
		elseif var416 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var419, var420 = protoModule.readVarInt(p13, var411)
			var411 = var420 + var419
		elseif var416 == protoModule.wireTypes.i32 then
			local _ = nil
			local var421, var422 = protoModule.readFixed32(p13, var411)
			local _ = var421
			var411 = var422
		elseif var416 == protoModule.wireTypes.i64 then
			local _ = nil
			local var423, var424 = protoModule.readFixed64(p13, var411)
			local _ = var423
			var411 = var424
		else
			error("Unsupported wire type: " .. var910)
		end
	end
	return var410
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
	local var425 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var426, var427 = protoModule.writeTag(buff, var425, 1, protoModule.wireTypes.lengthDelimited)
		var426, var922 = protoModule.writeString(var426, var427, self.universe_id)
		buff = var426
		var425 = var427
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var428, var429 = protoModule.writeTag(buff, var425, 2, protoModule.wireTypes.lengthDelimited)
		var428, var924 = protoModule.writeString(var428, var429, self.creator_key)
		buff = var428
		var425 = var429
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var430, var431 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var430, var926 = protoModule.writeString(var430, var431, i)
			local var432 = v:encode()
			var431, var928 = protoModule.writeTag(var430, var431, 2, protoModule.wireTypes.lengthDelimited)
			var431, var928 = protoModule.writeBuffer(var431, var928, var432, buffer.len(var432))
			local var433 = var431
			local var434 = var928
			local var435, var436 = protoModule.writeTag(buff, var425, 3, protoModule.wireTypes.lengthDelimited)
			var435, var932 = protoModule.writeBuffer(var435, var436, var433, var434)
			buff = var435
			var425 = var436
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var437, var438 = protoModule.writeTag(buff, var425, 4, protoModule.wireTypes.lengthDelimited)
			var437, var934 = protoModule.writeString(var437, var438, v)
			buff = var437
			var425 = var438
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var439, var440 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var439, var936 = protoModule.writeString(var439, var440, i)
			local var441 = v:encode()
			var440, var938 = protoModule.writeTag(var439, var440, 2, protoModule.wireTypes.lengthDelimited)
			var440, var938 = protoModule.writeBuffer(var440, var938, var441, buffer.len(var441))
			local var442 = var440
			local var443 = var938
			local var444, var445 = protoModule.writeTag(buff, var425, 5, protoModule.wireTypes.lengthDelimited)
			var444, var942 = protoModule.writeBuffer(var444, var445, var442, var443)
			buff = var444
			var425 = var445
		end
	end
	local buff_1 = buffer.create(var425)
	buffer.copy(buff_1, 0, buff, 0, var425)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var446 = t_14.new()
	local var447 = 0
	while var447 < buffer.len(p14) do
		local _ = nil
		local var448 = nil
		local var449, var450, var451 = protoModule.readTag(p14, var447)
		local var452 = var449
		var448 = var450
		var447 = var451
		
		if var448 == protoModule.wireTypes.varint then
			local _ = nil
			local var453, var454 = protoModule.readVarInt(p14, var447)
			local _ = var453
			var447 = var454
			continue
		end
		if var448 == protoModule.wireTypes.lengthDelimited then
			if var452 == 1 then
				local _ = nil
				local var455, var456 = protoModule.readBuffer(p14, var447)
				var447 = var456
				var446.universe_id = buffer.tostring(var455)
			elseif var452 == 2 then
				local _ = nil
				local var457, var458 = protoModule.readBuffer(p14, var447)
				var447 = var458
				var446.creator_key = buffer.tostring(var457)
			elseif var452 == 3 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p14, var447)
				var447 = var460
				var459 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var459)
				var446.entry_map[var459.key or ""] = var459.value or t.FeedEntry.new()
			elseif var452 == 4 then
				local _ = nil
				local var461, var462 = protoModule.readBuffer(p14, var447)
				var447 = var462
				table.insert(var446.entry_order, buffer.tostring(var461))
			elseif var452 == 5 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p14, var447)
				var447 = var464
				var463 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var463)
				var446.entry_order_map[var463.key or ""] = var463.value or t.EntryOrder.new()
			else
				local _ = nil
				local var465, var466 = protoModule.readVarInt(p14, var447)
				var447 = var466 + var465
			end
		elseif var448 == protoModule.wireTypes.i32 then
			local _ = nil
			local var467, var468 = protoModule.readFixed32(p14, var447)
			local _ = var467
			var447 = var468
		elseif var448 == protoModule.wireTypes.i64 then
			local _ = nil
			local var469, var470 = protoModule.readFixed64(p14, var447)
			local _ = var469
			var447 = var470
		else
			error("Unsupported wire type: " .. var946)
		end
	end
	return var446
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
	local var471 = t_14.new()
	
	if self.universe_id ~= nil then
		var471.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var471.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var471.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var471.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var471.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var471.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var471.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var471.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var471.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var471.entry_order_map = t_1
	end
	return var471
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
	local var472 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var473, var474 = protoModule.writeTag(buff, var472, 1, protoModule.wireTypes.lengthDelimited)
		var473, var983 = protoModule.writeString(var473, var474, self.key)
		buff = var473
		var472 = var474
	end
	if self.value ~= nil then
		local var475 = self.value:encode()
		local var476, var477 = protoModule.writeTag(buff, var472, 2, protoModule.wireTypes.lengthDelimited)
		var476, var986 = protoModule.writeBuffer(var476, var477, var475, buffer.len(var475))
		buff = var476
		var472 = var477
	end
	local buff_1 = buffer.create(var472)
	buffer.copy(buff_1, 0, buff, 0, var472)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var472 = t_15.new()
	local var473 = 0
	while var473 < buffer.len(p15) do
		local _ = nil
		local var474 = nil
		local var475, var476, var477 = protoModule.readTag(p15, var473)
		local var478 = var475
		var474 = var476
		var473 = var477
		
		if var474 == protoModule.wireTypes.varint then
			local _ = nil
			local var479, var480 = protoModule.readVarInt(p15, var473)
			local _ = var479
			var473 = var480
			continue
		end
		if var474 == protoModule.wireTypes.lengthDelimited then
			if var478 == 1 then
				local _ = nil
				local var481, var482 = protoModule.readBuffer(p15, var473)
				var473 = var482
				var472.key = buffer.tostring(var481)
			elseif var478 == 2 then
				local _ = nil
				local var483, var484 = protoModule.readBuffer(p15, var473)
				var473 = var484
				var472.value = t.FeedEntry.decode(var483)
			else
				local _ = nil
				local var485, var486 = protoModule.readVarInt(p15, var473)
				var473 = var486 + var485
			end
		elseif var474 == protoModule.wireTypes.i32 then
			local _ = nil
			local var487, var488 = protoModule.readFixed32(p15, var473)
			local _ = var487
			var473 = var488
		elseif var474 == protoModule.wireTypes.i64 then
			local _ = nil
			local var489, var490 = protoModule.readFixed64(p15, var473)
			local _ = var489
			var473 = var490
		else
			error("Unsupported wire type: " .. var990)
		end
	end
	return var472
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
	local var491 = t_15.new()
	
	if self.key ~= nil then
		var491.key = self.key
	end
	if self.value ~= nil then
		var491.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var491
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
	local var491 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var492, var493 = protoModule.writeTag(buff, var491, 1, protoModule.wireTypes.lengthDelimited)
		var492, var1012 = protoModule.writeString(var492, var493, self.key)
		buff = var492
		var491 = var493
	end
	if self.value ~= nil then
		local var494 = self.value:encode()
		local var495, var496 = protoModule.writeTag(buff, var491, 2, protoModule.wireTypes.lengthDelimited)
		var495, var1015 = protoModule.writeBuffer(var495, var496, var494, buffer.len(var494))
		buff = var495
		var491 = var496
	end
	local buff_1 = buffer.create(var491)
	buffer.copy(buff_1, 0, buff, 0, var491)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var491 = t_16.new()
	local var492 = 0
	while var492 < buffer.len(p16) do
		local _ = nil
		local var493 = nil
		local var494, var495, var496 = protoModule.readTag(p16, var492)
		local var497 = var494
		var493 = var495
		var492 = var496
		
		if var493 == protoModule.wireTypes.varint then
			local _ = nil
			local var498, var499 = protoModule.readVarInt(p16, var492)
			local _ = var498
			var492 = var499
			continue
		end
		if var493 == protoModule.wireTypes.lengthDelimited then
			if var497 == 1 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p16, var492)
				var492 = var501
				var491.key = buffer.tostring(var500)
			elseif var497 == 2 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p16, var492)
				var492 = var503
				var491.value = t.EntryOrder.decode(var502)
			else
				local _ = nil
				local var504, var505 = protoModule.readVarInt(p16, var492)
				var492 = var505 + var504
			end
		elseif var493 == protoModule.wireTypes.i32 then
			local _ = nil
			local var506, var507 = protoModule.readFixed32(p16, var492)
			local _ = var506
			var492 = var507
		elseif var493 == protoModule.wireTypes.i64 then
			local _ = nil
			local var508, var509 = protoModule.readFixed64(p16, var492)
			local _ = var508
			var492 = var509
		else
			error("Unsupported wire type: " .. var1019)
		end
	end
	return var491
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
	local var510 = t_16.new()
	
	if self.key ~= nil then
		var510.key = self.key
	end
	if self.value ~= nil then
		var510.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var510
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
	local var510 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var511, var512 = protoModule.writeTag(buff, var510, 1, protoModule.wireTypes.lengthDelimited)
			var511, var1041 = protoModule.writeString(var511, var512, v)
			buff = var511
			var510 = var512
		end
	end
	local buff_1 = buffer.create(var510)
	buffer.copy(buff_1, 0, buff, 0, var510)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var513 = t_17.new()
	local var514 = 0
	while var514 < buffer.len(p17) do
		local _ = nil
		local var515 = nil
		local var516, var517, var518 = protoModule.readTag(p17, var514)
		local var519 = var516
		var515 = var517
		var514 = var518
		
		if var515 == protoModule.wireTypes.varint then
			local _ = nil
			local var520, var521 = protoModule.readVarInt(p17, var514)
			local _ = var520
			var514 = var521
			continue
		end
		if var515 == protoModule.wireTypes.lengthDelimited then
			if var519 == 1 then
				local _ = nil
				local var522, var523 = protoModule.readBuffer(p17, var514)
				var514 = var523
				table.insert(var513.items, buffer.tostring(var522))
			else
				local _ = nil
				local var524, var525 = protoModule.readVarInt(p17, var514)
				var514 = var525 + var524
			end
		elseif var515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var526, var527 = protoModule.readFixed32(p17, var514)
			local _ = var526
			var514 = var527
		elseif var515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var528, var529 = protoModule.readFixed64(p17, var514)
			local _ = var528
			var514 = var529
		else
			error("Unsupported wire type: " .. var1045)
		end
	end
	return var513
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
	local var530 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var530.items = t
	end
	return var530
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
	local var531 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var532, var533 = protoModule.writeTag(buff, var531, 1, protoModule.wireTypes.lengthDelimited)
		var532, var1067 = protoModule.writeString(var532, var533, self.universe_id)
		buff = var532
		var531 = var533
	end
	if self.user_owns_experience then
		local var534, var535 = protoModule.writeTag(buff, var531, 2, protoModule.wireTypes.varint)
		var534, var1069 = protoModule.writeVarInt(var534, var535, if self.user_owns_experience then 1 else 0)
		buff = var534
		var531 = var535
	end
	local buff_1 = buffer.create(var531)
	buffer.copy(buff_1, 0, buff, 0, var531)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var531 = t_18.new()
	local var532 = 0
	while var532 < buffer.len(p18) do
		local _ = nil
		local var533 = nil
		local var534, var535, var536 = protoModule.readTag(p18, var532)
		local var537 = var534
		var533 = var535
		var532 = var536
		
		if var533 == protoModule.wireTypes.varint then
			if var537 == 2 then
				local _ = nil
				local var538, var539 = protoModule.readVarInt(p18, var532)
				var532 = var539
				var531.user_owns_experience = var538 ~= 0
			else
				local _ = nil
				local var540, var541 = protoModule.readVarInt(p18, var532)
				local _ = var540
				var532 = var541
			end
		end
		if var533 == protoModule.wireTypes.lengthDelimited then
			if var537 == 1 then
				local _ = nil
				local var542, var543 = protoModule.readBuffer(p18, var532)
				var532 = var543
				var531.universe_id = buffer.tostring(var542)
			else
				local _ = nil
				local var544, var545 = protoModule.readVarInt(p18, var532)
				var532 = var545 + var544
			end
		elseif var533 == protoModule.wireTypes.i32 then
			local _ = nil
			local var546, var547 = protoModule.readFixed32(p18, var532)
			local _ = var546
			var532 = var547
		elseif var533 == protoModule.wireTypes.i64 then
			local _ = nil
			local var548, var549 = protoModule.readFixed64(p18, var532)
			local _ = var548
			var532 = var549
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var531
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
	local var550 = t_18.new()
	
	if self.universe_id ~= nil then
		var550.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var550.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var550.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var550.user_owns_experience = self.userOwnsExperience
	end
	return var550
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
	local var550 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var551, var552 = protoModule.writeTag(buff, var550, 1, protoModule.wireTypes.lengthDelimited)
		var551, var1095 = protoModule.writeString(var551, var552, self.media_asset_id)
		buff = var551
		var550 = var552
	end
	local buff_1 = buffer.create(var550)
	buffer.copy(buff_1, 0, buff, 0, var550)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var550 = t_19.new()
	local var551 = 0
	while var551 < buffer.len(p19) do
		local _ = nil
		local var552 = nil
		local var553, var554, var555 = protoModule.readTag(p19, var551)
		local var556 = var553
		var552 = var554
		var551 = var555
		
		if var552 == protoModule.wireTypes.varint then
			local _ = nil
			local var557, var558 = protoModule.readVarInt(p19, var551)
			local _ = var557
			var551 = var558
			continue
		end
		if var552 == protoModule.wireTypes.lengthDelimited then
			if var556 == 1 then
				local _ = nil
				local var559, var560 = protoModule.readBuffer(p19, var551)
				var551 = var560
				var550.media_asset_id = buffer.tostring(var559)
			else
				local _ = nil
				local var561, var562 = protoModule.readVarInt(p19, var551)
				var551 = var562 + var561
			end
		elseif var552 == protoModule.wireTypes.i32 then
			local _ = nil
			local var563, var564 = protoModule.readFixed32(p19, var551)
			local _ = var563
			var551 = var564
		elseif var552 == protoModule.wireTypes.i64 then
			local _ = nil
			local var565, var566 = protoModule.readFixed64(p19, var551)
			local _ = var565
			var551 = var566
		else
			error("Unsupported wire type: " .. var1099)
		end
	end
	return var550
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
	local var567 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var567.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var567.media_asset_id = self.mediaAssetId
	end
	return var567
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
	local var567 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var568, var569 = protoModule.writeTag(buff, var567, 1, protoModule.wireTypes.lengthDelimited)
		var568, var1119 = protoModule.writeString(var568, var569, self.universe_id)
		buff = var568
		var567 = var569
	end
	local buff_1 = buffer.create(var567)
	buffer.copy(buff_1, 0, buff, 0, var567)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var567 = t_20.new()
	local var568 = 0
	while var568 < buffer.len(p20) do
		local _ = nil
		local var569 = nil
		local var570, var571, var572 = protoModule.readTag(p20, var568)
		local var573 = var570
		var569 = var571
		var568 = var572
		
		if var569 == protoModule.wireTypes.varint then
			local _ = nil
			local var574, var575 = protoModule.readVarInt(p20, var568)
			local _ = var574
			var568 = var575
			continue
		end
		if var569 == protoModule.wireTypes.lengthDelimited then
			if var573 == 1 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p20, var568)
				var568 = var577
				var567.universe_id = buffer.tostring(var576)
			else
				local _ = nil
				local var578, var579 = protoModule.readVarInt(p20, var568)
				var568 = var579 + var578
			end
		elseif var569 == protoModule.wireTypes.i32 then
			local _ = nil
			local var580, var581 = protoModule.readFixed32(p20, var568)
			local _ = var580
			var568 = var581
		elseif var569 == protoModule.wireTypes.i64 then
			local _ = nil
			local var582, var583 = protoModule.readFixed64(p20, var568)
			local _ = var582
			var568 = var583
		else
			error("Unsupported wire type: " .. var1123)
		end
	end
	return var567
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
	local var584 = t_20.new()
	
	if self.universe_id ~= nil then
		var584.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var584.universe_id = self.universeId
	end
	return var584
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
	local var584 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var585, var586 = protoModule.writeTag(buff, var584, 1, protoModule.wireTypes.lengthDelimited)
		var585, var1143 = protoModule.writeString(var585, var586, self.universe_id)
		buff = var585
		var584 = var586
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var587, var588 = protoModule.writeTag(buff, var584, 2, protoModule.wireTypes.lengthDelimited)
		var587, var1145 = protoModule.writeString(var587, var588, self.creator_key)
		buff = var587
		var584 = var588
	end
	local buff_1 = buffer.create(var584)
	buffer.copy(buff_1, 0, buff, 0, var584)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var584 = t_21.new()
	local var585 = 0
	while var585 < buffer.len(p21) do
		local _ = nil
		local var586 = nil
		local var587, var588, var589 = protoModule.readTag(p21, var585)
		local var590 = var587
		var586 = var588
		var585 = var589
		
		if var586 == protoModule.wireTypes.varint then
			local _ = nil
			local var591, var592 = protoModule.readVarInt(p21, var585)
			local _ = var591
			var585 = var592
			continue
		end
		if var586 == protoModule.wireTypes.lengthDelimited then
			if var590 == 1 then
				local _ = nil
				local var593, var594 = protoModule.readBuffer(p21, var585)
				var585 = var594
				var584.universe_id = buffer.tostring(var593)
			elseif var590 == 2 then
				local _ = nil
				local var595, var596 = protoModule.readBuffer(p21, var585)
				var585 = var596
				var584.creator_key = buffer.tostring(var595)
			else
				local _ = nil
				local var597, var598 = protoModule.readVarInt(p21, var585)
				var585 = var598 + var597
			end
		elseif var586 == protoModule.wireTypes.i32 then
			local _ = nil
			local var599, var600 = protoModule.readFixed32(p21, var585)
			local _ = var599
			var585 = var600
		elseif var586 == protoModule.wireTypes.i64 then
			local _ = nil
			local var601, var602 = protoModule.readFixed64(p21, var585)
			local _ = var601
			var585 = var602
		else
			error("Unsupported wire type: " .. var1149)
		end
	end
	return var584
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
	local var603 = t_21.new()
	
	if self.universe_id ~= nil then
		var603.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var603.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var603.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var603.creator_key = self.creatorKey
	end
	return var603
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
	local var603 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var604, var605 = protoModule.writeTag(buff, var603, 1, protoModule.wireTypes.lengthDelimited)
		var604, var1171 = protoModule.writeString(var604, var605, self.universe_id)
		buff = var604
		var603 = var605
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var606, var607 = protoModule.writeTag(buff, var603, 2, protoModule.wireTypes.lengthDelimited)
		var606, var1173 = protoModule.writeString(var606, var607, self.root_place_id)
		buff = var606
		var603 = var607
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var608, var609 = protoModule.writeTag(buff, var603, 3, protoModule.wireTypes.lengthDelimited)
		var608, var1175 = protoModule.writeString(var608, var609, self.connection_played_display_name)
		buff = var608
		var603 = var609
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var610, var611 = protoModule.writeTag(buff, var603, 4, protoModule.wireTypes.lengthDelimited)
		var610, var1177 = protoModule.writeString(var610, var611, self.upsell_prompt)
		buff = var610
		var603 = var611
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var612 = v:encode()
			local var613, var614 = protoModule.writeTag(buff, var603, 5, protoModule.wireTypes.lengthDelimited)
			var613, var1180 = protoModule.writeBuffer(var613, var614, var612, buffer.len(var612))
			buff = var613
			var603 = var614
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var615, var616 = protoModule.writeTag(buff, var603, 6, protoModule.wireTypes.varint)
		var615, var1182 = protoModule.writeVarInt(var615, var616, self.connection_played_num_others)
		buff = var615
		var603 = var616
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var617, var618 = protoModule.writeTag(buff, var603, 7, protoModule.wireTypes.varint)
		var617, var1184 = protoModule.writeVarInt(var617, var618, self.connection_played_total_count)
		buff = var617
		var603 = var618
	end
	local buff_1 = buffer.create(var603)
	buffer.copy(buff_1, 0, buff, 0, var603)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var619 = t_22.new()
	local var620 = 0
	while var620 < buffer.len(p22) do
		local _ = nil
		local var621 = nil
		local var622, var623, var624 = protoModule.readTag(p22, var620)
		local var625 = var622
		var621 = var623
		var620 = var624
		
		if var621 == protoModule.wireTypes.varint then
			if var625 == 6 then
				local _ = nil
				local var626, var627 = protoModule.readVarIntI32(p22, var620)
				var620 = var627
				var619.connection_played_num_others = var626
			elseif var625 == 7 then
				local _ = nil
				local var628, var629 = protoModule.readVarIntI32(p22, var620)
				var620 = var629
				var619.connection_played_total_count = var628
			else
				local _ = nil
				local var630, var631 = protoModule.readVarInt(p22, var620)
				local _ = var630
				var620 = var631
			end
		end
		if var621 == protoModule.wireTypes.lengthDelimited then
			if var625 == 1 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p22, var620)
				var620 = var633
				var619.universe_id = buffer.tostring(var632)
			elseif var625 == 2 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p22, var620)
				var620 = var635
				var619.root_place_id = buffer.tostring(var634)
			elseif var625 == 3 then
				local _ = nil
				local var636, var637 = protoModule.readBuffer(p22, var620)
				var620 = var637
				var619.connection_played_display_name = buffer.tostring(var636)
			elseif var625 == 4 then
				local _ = nil
				local var638, var639 = protoModule.readBuffer(p22, var620)
				var620 = var639
				var619.upsell_prompt = buffer.tostring(var638)
			elseif var625 == 5 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p22, var620)
				var620 = var641
				table.insert(var619.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var640))
			else
				local _ = nil
				local var642, var643 = protoModule.readVarInt(p22, var620)
				var620 = var643 + var642
			end
		elseif var621 == protoModule.wireTypes.i32 then
			local _ = nil
			local var644, var645 = protoModule.readFixed32(p22, var620)
			local _ = var644
			var620 = var645
		elseif var621 == protoModule.wireTypes.i64 then
			local _ = nil
			local var646, var647 = protoModule.readFixed64(p22, var620)
			local _ = var646
			var620 = var647
		else
			error("Unsupported wire type: " .. var1188)
		end
	end
	return var619
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
	local var648 = t_22.new()
	
	if self.universe_id ~= nil then
		var648.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var648.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var648.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var648.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var648.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var648.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var648.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var648.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var648.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var648.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var648.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var648.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var648.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var648.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var648
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
	local var649 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var650, var651 = protoModule.writeTag(buff, var649, 1, protoModule.wireTypes.lengthDelimited)
		var650, var1223 = protoModule.writeString(var650, var651, self.user_id)
		buff = var650
		var649 = var651
	end
	local buff_1 = buffer.create(var649)
	buffer.copy(buff_1, 0, buff, 0, var649)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var649 = t_23.new()
	local var650 = 0
	while var650 < buffer.len(p23) do
		local _ = nil
		local var651 = nil
		local var652, var653, var654 = protoModule.readTag(p23, var650)
		local var655 = var652
		var651 = var653
		var650 = var654
		
		if var651 == protoModule.wireTypes.varint then
			local _ = nil
			local var656, var657 = protoModule.readVarInt(p23, var650)
			local _ = var656
			var650 = var657
			continue
		end
		if var651 == protoModule.wireTypes.lengthDelimited then
			if var655 == 1 then
				local _ = nil
				local var658, var659 = protoModule.readBuffer(p23, var650)
				var650 = var659
				var649.user_id = buffer.tostring(var658)
			else
				local _ = nil
				local var660, var661 = protoModule.readVarInt(p23, var650)
				var650 = var661 + var660
			end
		elseif var651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var662, var663 = protoModule.readFixed32(p23, var650)
			local _ = var662
			var650 = var663
		elseif var651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var664, var665 = protoModule.readFixed64(p23, var650)
			local _ = var664
			var650 = var665
		else
			error("Unsupported wire type: " .. var1227)
		end
	end
	return var649
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
	local var666 = t_23.new()
	
	if self.user_id ~= nil then
		var666.user_id = self.user_id
	end
	if self.userId ~= nil then
		var666.user_id = self.userId
	end
	return var666
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
	local var666 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var667 = v:encode()
			local var668, var669 = protoModule.writeTag(buff, var666, 1, protoModule.wireTypes.lengthDelimited)
			var668, var1248 = protoModule.writeBuffer(var668, var669, var667, buffer.len(var667))
			buff = var668
			var666 = var669
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var670, var671 = protoModule.writeTag(buff, var666, 2, protoModule.wireTypes.lengthDelimited)
		var670, var1250 = protoModule.writeString(var670, var671, self.universe_id)
		buff = var670
		var666 = var671
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var672, var673 = protoModule.writeTag(buff, var666, 3, protoModule.wireTypes.lengthDelimited)
		var672, var1252 = protoModule.writeString(var672, var673, self.place_id)
		buff = var672
		var666 = var673
	end
	local buff_1 = buffer.create(var666)
	buffer.copy(buff_1, 0, buff, 0, var666)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var674 = t_24.new()
	local var675 = 0
	while var675 < buffer.len(p24) do
		local _ = nil
		local var676 = nil
		local var677, var678, var679 = protoModule.readTag(p24, var675)
		local var680 = var677
		var676 = var678
		var675 = var679
		
		if var676 == protoModule.wireTypes.varint then
			local _ = nil
			local var681, var682 = protoModule.readVarInt(p24, var675)
			local _ = var681
			var675 = var682
			continue
		end
		if var676 == protoModule.wireTypes.lengthDelimited then
			if var680 == 1 then
				local _ = nil
				local var683, var684 = protoModule.readBuffer(p24, var675)
				var675 = var684
				table.insert(var674.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var683))
			elseif var680 == 2 then
				local _ = nil
				local var685, var686 = protoModule.readBuffer(p24, var675)
				var675 = var686
				var674.universe_id = buffer.tostring(var685)
			elseif var680 == 3 then
				local _ = nil
				local var687, var688 = protoModule.readBuffer(p24, var675)
				var675 = var688
				var674.place_id = buffer.tostring(var687)
			else
				local _ = nil
				local var689, var690 = protoModule.readVarInt(p24, var675)
				var675 = var690 + var689
			end
		elseif var676 == protoModule.wireTypes.i32 then
			local _ = nil
			local var691, var692 = protoModule.readFixed32(p24, var675)
			local _ = var691
			var675 = var692
		elseif var676 == protoModule.wireTypes.i64 then
			local _ = nil
			local var693, var694 = protoModule.readFixed64(p24, var675)
			local _ = var693
			var675 = var694
		else
			error("Unsupported wire type: " .. var1256)
		end
	end
	return var674
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
	local var695 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var695.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var695.media_items = t_1
	end
	if self.universe_id ~= nil then
		var695.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var695.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var695.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var695.place_id = self.placeId
	end
	return var695
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
	local var696 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var697, var698 = protoModule.writeTag(buff, var696, 1, protoModule.wireTypes.lengthDelimited)
		var697, var1283 = protoModule.writeString(var697, var698, self.media_asset_id)
		buff = var697
		var696 = var698
	end
	local buff_1 = buffer.create(var696)
	buffer.copy(buff_1, 0, buff, 0, var696)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var696 = t_25.new()
	local var697 = 0
	while var697 < buffer.len(p25) do
		local _ = nil
		local var698 = nil
		local var699, var700, var701 = protoModule.readTag(p25, var697)
		local var702 = var699
		var698 = var700
		var697 = var701
		
		if var698 == protoModule.wireTypes.varint then
			local _ = nil
			local var703, var704 = protoModule.readVarInt(p25, var697)
			local _ = var703
			var697 = var704
			continue
		end
		if var698 == protoModule.wireTypes.lengthDelimited then
			if var702 == 1 then
				local _ = nil
				local var705, var706 = protoModule.readBuffer(p25, var697)
				var697 = var706
				var696.media_asset_id = buffer.tostring(var705)
			else
				local _ = nil
				local var707, var708 = protoModule.readVarInt(p25, var697)
				var697 = var708 + var707
			end
		elseif var698 == protoModule.wireTypes.i32 then
			local _ = nil
			local var709, var710 = protoModule.readFixed32(p25, var697)
			local _ = var709
			var697 = var710
		elseif var698 == protoModule.wireTypes.i64 then
			local _ = nil
			local var711, var712 = protoModule.readFixed64(p25, var697)
			local _ = var711
			var697 = var712
		else
			error("Unsupported wire type: " .. var1287)
		end
	end
	return var696
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
	local var713 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var713.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var713.media_asset_id = self.mediaAssetId
	end
	return var713
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
	local var713 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var714, var715 = protoModule.writeTag(buff, var713, 1, protoModule.wireTypes.lengthDelimited)
		var714, var1307 = protoModule.writeString(var714, var715, self.universe_id)
		buff = var714
		var713 = var715
	end
	local buff_1 = buffer.create(var713)
	buffer.copy(buff_1, 0, buff, 0, var713)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var713 = t_26.new()
	local var714 = 0
	while var714 < buffer.len(p26) do
		local _ = nil
		local var715 = nil
		local var716, var717, var718 = protoModule.readTag(p26, var714)
		local var719 = var716
		var715 = var717
		var714 = var718
		
		if var715 == protoModule.wireTypes.varint then
			local _ = nil
			local var720, var721 = protoModule.readVarInt(p26, var714)
			local _ = var720
			var714 = var721
			continue
		end
		if var715 == protoModule.wireTypes.lengthDelimited then
			if var719 == 1 then
				local _ = nil
				local var722, var723 = protoModule.readBuffer(p26, var714)
				var714 = var723
				var713.universe_id = buffer.tostring(var722)
			else
				local _ = nil
				local var724, var725 = protoModule.readVarInt(p26, var714)
				var714 = var725 + var724
			end
		elseif var715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var726, var727 = protoModule.readFixed32(p26, var714)
			local _ = var726
			var714 = var727
		elseif var715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var728, var729 = protoModule.readFixed64(p26, var714)
			local _ = var728
			var714 = var729
		else
			error("Unsupported wire type: " .. var1311)
		end
	end
	return var713
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
	local var730 = t_26.new()
	
	if self.universe_id ~= nil then
		var730.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var730.universe_id = self.universeId
	end
	return var730
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
	local var730 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var731, var732 = protoModule.writeTag(buff, var730, 1, protoModule.wireTypes.lengthDelimited)
		var731, var1331 = protoModule.writeString(var731, var732, self.universe_id)
		buff = var731
		var730 = var732
	end
	local buff_1 = buffer.create(var730)
	buffer.copy(buff_1, 0, buff, 0, var730)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var730 = t_27.new()
	local var731 = 0
	while var731 < buffer.len(p27) do
		local _ = nil
		local var732 = nil
		local var733, var734, var735 = protoModule.readTag(p27, var731)
		local var736 = var733
		var732 = var734
		var731 = var735
		
		if var732 == protoModule.wireTypes.varint then
			local _ = nil
			local var737, var738 = protoModule.readVarInt(p27, var731)
			local _ = var737
			var731 = var738
			continue
		end
		if var732 == protoModule.wireTypes.lengthDelimited then
			if var736 == 1 then
				local _ = nil
				local var739, var740 = protoModule.readBuffer(p27, var731)
				var731 = var740
				var730.universe_id = buffer.tostring(var739)
			else
				local _ = nil
				local var741, var742 = protoModule.readVarInt(p27, var731)
				var731 = var742 + var741
			end
		elseif var732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var743, var744 = protoModule.readFixed32(p27, var731)
			local _ = var743
			var731 = var744
		elseif var732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var745, var746 = protoModule.readFixed64(p27, var731)
			local _ = var745
			var731 = var746
		else
			error("Unsupported wire type: " .. var1335)
		end
	end
	return var730
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
	local var747 = t_27.new()
	
	if self.universe_id ~= nil then
		var747.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var747.universe_id = self.universeId
	end
	return var747
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
	local var747 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var748, var749 = protoModule.writeTag(buff, var747, 1, protoModule.wireTypes.lengthDelimited)
		var748, var1355 = protoModule.writeString(var748, var749, self.universe_id)
		buff = var748
		var747 = var749
	end
	if self.has_store_items then
		local var750, var751 = protoModule.writeTag(buff, var747, 2, protoModule.wireTypes.varint)
		var750, var1357 = protoModule.writeVarInt(var750, var751, if self.has_store_items then 1 else 0)
		buff = var750
		var747 = var751
	end
	if self.has_badges then
		local var752, var753 = protoModule.writeTag(buff, var747, 3, protoModule.wireTypes.varint)
		var752, var1359 = protoModule.writeVarInt(var752, var753, if self.has_badges then 1 else 0)
		buff = var752
		var747 = var753
	end
	if self.has_game_passes then
		local var754, var755 = protoModule.writeTag(buff, var747, 4, protoModule.wireTypes.varint)
		var754, var1361 = protoModule.writeVarInt(var754, var755, if self.has_game_passes then 1 else 0)
		buff = var754
		var747 = var755
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var756, var757 = protoModule.writeTag(buff, var747, 5, protoModule.wireTypes.lengthDelimited)
		var756, var1363 = protoModule.writeString(var756, var757, self.community_id)
		buff = var756
		var747 = var757
	end
	local buff_1 = buffer.create(var747)
	buffer.copy(buff_1, 0, buff, 0, var747)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var747 = t_28.new()
	local var748 = 0
	while var748 < buffer.len(p28) do
		local _ = nil
		local var749 = nil
		local var750, var751, var752 = protoModule.readTag(p28, var748)
		local var753 = var750
		var749 = var751
		var748 = var752
		
		if var749 == protoModule.wireTypes.varint then
			if var753 == 2 then
				local _ = nil
				local var754, var755 = protoModule.readVarInt(p28, var748)
				var748 = var755
				var747.has_store_items = var754 ~= 0
			elseif var753 == 3 then
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p28, var748)
				var748 = var757
				var747.has_badges = var756 ~= 0
			elseif var753 == 4 then
				local _ = nil
				local var758, var759 = protoModule.readVarInt(p28, var748)
				var748 = var759
				var747.has_game_passes = var758 ~= 0
			else
				local _ = nil
				local var760, var761 = protoModule.readVarInt(p28, var748)
				local _ = var760
				var748 = var761
			end
		end
		if var749 == protoModule.wireTypes.lengthDelimited then
			if var753 == 1 then
				local _ = nil
				local var762, var763 = protoModule.readBuffer(p28, var748)
				var748 = var763
				var747.universe_id = buffer.tostring(var762)
			elseif var753 == 5 then
				local _ = nil
				local var764, var765 = protoModule.readBuffer(p28, var748)
				var748 = var765
				var747.community_id = buffer.tostring(var764)
			else
				local _ = nil
				local var766, var767 = protoModule.readVarInt(p28, var748)
				var748 = var767 + var766
			end
		elseif var749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var768, var769 = protoModule.readFixed32(p28, var748)
			local _ = var768
			var748 = var769
		elseif var749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var770, var771 = protoModule.readFixed64(p28, var748)
			local _ = var770
			var748 = var771
		else
			error("Unsupported wire type: " .. var1367)
		end
	end
	return var747
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
	local var772 = t_28.new()
	
	if self.universe_id ~= nil then
		var772.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var772.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var772.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var772.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var772.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var772.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var772.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var772.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var772.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var772.community_id = self.communityId
	end
	return var772
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
	local var772 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var773, var774 = protoModule.writeTag(buff, var772, 1, protoModule.wireTypes.lengthDelimited)
		var773, var1395 = protoModule.writeString(var773, var774, self.universe_id)
		buff = var773
		var772 = var774
	end
	local buff_1 = buffer.create(var772)
	buffer.copy(buff_1, 0, buff, 0, var772)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var772 = t_29.new()
	local var773 = 0
	while var773 < buffer.len(p29) do
		local _ = nil
		local var774 = nil
		local var775, var776, var777 = protoModule.readTag(p29, var773)
		local var778 = var775
		var774 = var776
		var773 = var777
		
		if var774 == protoModule.wireTypes.varint then
			local _ = nil
			local var779, var780 = protoModule.readVarInt(p29, var773)
			local _ = var779
			var773 = var780
			continue
		end
		if var774 == protoModule.wireTypes.lengthDelimited then
			if var778 == 1 then
				local _ = nil
				local var781, var782 = protoModule.readBuffer(p29, var773)
				var773 = var782
				var772.universe_id = buffer.tostring(var781)
			else
				local _ = nil
				local var783, var784 = protoModule.readVarInt(p29, var773)
				var773 = var784 + var783
			end
		elseif var774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var785, var786 = protoModule.readFixed32(p29, var773)
			local _ = var785
			var773 = var786
		elseif var774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var787, var788 = protoModule.readFixed64(p29, var773)
			local _ = var787
			var773 = var788
		else
			error("Unsupported wire type: " .. var1399)
		end
	end
	return var772
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
	local var789 = t_29.new()
	
	if self.universe_id ~= nil then
		var789.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var789.universe_id = self.universeId
	end
	return var789
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
	local var789 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var790, var791 = protoModule.writeTag(buff, var789, 1, protoModule.wireTypes.lengthDelimited)
		var790, var1419 = protoModule.writeString(var790, var791, self.universe_id)
		buff = var790
		var789 = var791
	end
	if self.user_owns_experience then
		local var792, var793 = protoModule.writeTag(buff, var789, 2, protoModule.wireTypes.varint)
		var792, var1421 = protoModule.writeVarInt(var792, var793, if self.user_owns_experience then 1 else 0)
		buff = var792
		var789 = var793
	end
	local buff_1 = buffer.create(var789)
	buffer.copy(buff_1, 0, buff, 0, var789)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var789 = t_30.new()
	local var790 = 0
	while var790 < buffer.len(p30) do
		local _ = nil
		local var791 = nil
		local var792, var793, var794 = protoModule.readTag(p30, var790)
		local var795 = var792
		var791 = var793
		var790 = var794
		
		if var791 == protoModule.wireTypes.varint then
			if var795 == 2 then
				local _ = nil
				local var796, var797 = protoModule.readVarInt(p30, var790)
				var790 = var797
				var789.user_owns_experience = var796 ~= 0
			else
				local _ = nil
				local var798, var799 = protoModule.readVarInt(p30, var790)
				local _ = var798
				var790 = var799
			end
		end
		if var791 == protoModule.wireTypes.lengthDelimited then
			if var795 == 1 then
				local _ = nil
				local var800, var801 = protoModule.readBuffer(p30, var790)
				var790 = var801
				var789.universe_id = buffer.tostring(var800)
			else
				local _ = nil
				local var802, var803 = protoModule.readVarInt(p30, var790)
				var790 = var803 + var802
			end
		elseif var791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var804, var805 = protoModule.readFixed32(p30, var790)
			local _ = var804
			var790 = var805
		elseif var791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var806, var807 = protoModule.readFixed64(p30, var790)
			local _ = var806
			var790 = var807
		else
			error("Unsupported wire type: " .. var1425)
		end
	end
	return var789
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
	local var808 = t_30.new()
	
	if self.universe_id ~= nil then
		var808.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var808.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var808.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var808.user_owns_experience = self.userOwnsExperience
	end
	return var808
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
		place_id = if p31 == nil or p31.place_id == nil then "" else p31.place_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var808 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var809, var810 = protoModule.writeTag(buff, var808, 1, protoModule.wireTypes.lengthDelimited)
		var809, var1447 = protoModule.writeString(var809, var810, self.universe_id)
		buff = var809
		var808 = var810
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var811, var812 = protoModule.writeTag(buff, var808, 2, protoModule.wireTypes.lengthDelimited)
		var811, var1449 = protoModule.writeString(var811, var812, self.place_id)
		buff = var811
		var808 = var812
	end
	local buff_1 = buffer.create(var808)
	buffer.copy(buff_1, 0, buff, 0, var808)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var808 = t_31.new()
	local var809 = 0
	while var809 < buffer.len(p31) do
		local _ = nil
		local var810 = nil
		local var811, var812, var813 = protoModule.readTag(p31, var809)
		local var814 = var811
		var810 = var812
		var809 = var813
		
		if var810 == protoModule.wireTypes.varint then
			local _ = nil
			local var815, var816 = protoModule.readVarInt(p31, var809)
			local _ = var815
			var809 = var816
			continue
		end
		if var810 == protoModule.wireTypes.lengthDelimited then
			if var814 == 1 then
				local _ = nil
				local var817, var818 = protoModule.readBuffer(p31, var809)
				var809 = var818
				var808.universe_id = buffer.tostring(var817)
			elseif var814 == 2 then
				local _ = nil
				local var819, var820 = protoModule.readBuffer(p31, var809)
				var809 = var820
				var808.place_id = buffer.tostring(var819)
			else
				local _ = nil
				local var821, var822 = protoModule.readVarInt(p31, var809)
				var809 = var822 + var821
			end
		elseif var810 == protoModule.wireTypes.i32 then
			local _ = nil
			local var823, var824 = protoModule.readFixed32(p31, var809)
			local _ = var823
			var809 = var824
		elseif var810 == protoModule.wireTypes.i64 then
			local _ = nil
			local var825, var826 = protoModule.readFixed64(p31, var809)
			local _ = var825
			var809 = var826
		else
			error("Unsupported wire type: " .. var1453)
		end
	end
	return var808
end

function t_31:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref)
	local var827 = t_31.new()
	
	if self.universe_id ~= nil then
		var827.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var827.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var827.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var827.place_id = self.placeId
	end
	return var827
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
	local var827 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var828, var829 = protoModule.writeTag(buff, var827, 1, protoModule.wireTypes.lengthDelimited)
		var828, var1475 = protoModule.writeString(var828, var829, self.community_id)
		buff = var828
		var827 = var829
	end
	local buff_1 = buffer.create(var827)
	buffer.copy(buff_1, 0, buff, 0, var827)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var827 = t_32.new()
	local var828 = 0
	while var828 < buffer.len(p32) do
		local _ = nil
		local var829 = nil
		local var830, var831, var832 = protoModule.readTag(p32, var828)
		local var833 = var830
		var829 = var831
		var828 = var832
		
		if var829 == protoModule.wireTypes.varint then
			local _ = nil
			local var834, var835 = protoModule.readVarInt(p32, var828)
			local _ = var834
			var828 = var835
			continue
		end
		if var829 == protoModule.wireTypes.lengthDelimited then
			if var833 == 1 then
				local _ = nil
				local var836, var837 = protoModule.readBuffer(p32, var828)
				var828 = var837
				var827.community_id = buffer.tostring(var836)
			else
				local _ = nil
				local var838, var839 = protoModule.readVarInt(p32, var828)
				var828 = var839 + var838
			end
		elseif var829 == protoModule.wireTypes.i32 then
			local _ = nil
			local var840, var841 = protoModule.readFixed32(p32, var828)
			local _ = var840
			var828 = var841
		elseif var829 == protoModule.wireTypes.i64 then
			local _ = nil
			local var842, var843 = protoModule.readFixed64(p32, var828)
			local _ = var842
			var828 = var843
		else
			error("Unsupported wire type: " .. var1479)
		end
	end
	return var827
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
	local var844 = t_32.new()
	
	if self.community_id ~= nil then
		var844.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var844.community_id = self.communityId
	end
	return var844
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
	local var844 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var845 = v:encode()
			local var846, var847 = protoModule.writeTag(buff, var844, 1, protoModule.wireTypes.lengthDelimited)
			var846, var1500 = protoModule.writeBuffer(var846, var847, var845, buffer.len(var845))
			buff = var846
			var844 = var847
		end
	end
	local buff_1 = buffer.create(var844)
	buffer.copy(buff_1, 0, buff, 0, var844)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var848 = t_33.new()
	local var849 = 0
	while var849 < buffer.len(p33) do
		local _ = nil
		local var850 = nil
		local var851, var852, var853 = protoModule.readTag(p33, var849)
		local var854 = var851
		var850 = var852
		var849 = var853
		
		if var850 == protoModule.wireTypes.varint then
			local _ = nil
			local var855, var856 = protoModule.readVarInt(p33, var849)
			local _ = var855
			var849 = var856
			continue
		end
		if var850 == protoModule.wireTypes.lengthDelimited then
			if var854 == 1 then
				local _ = nil
				local var857, var858 = protoModule.readBuffer(p33, var849)
				var849 = var858
				table.insert(var848.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var857))
			else
				local _ = nil
				local var859, var860 = protoModule.readVarInt(p33, var849)
				var849 = var860 + var859
			end
		elseif var850 == protoModule.wireTypes.i32 then
			local _ = nil
			local var861, var862 = protoModule.readFixed32(p33, var849)
			local _ = var861
			var849 = var862
		elseif var850 == protoModule.wireTypes.i64 then
			local _ = nil
			local var863, var864 = protoModule.readFixed64(p33, var849)
			local _ = var863
			var849 = var864
		else
			error("Unsupported wire type: " .. var1504)
		end
	end
	return var848
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
	local var865 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var865.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var865.social_link_items = t_1
	end
	return var865
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
	local var866 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var867, var868 = protoModule.writeTag(buff, var866, 1, protoModule.wireTypes.lengthDelimited)
		var867, var1527 = protoModule.writeString(var867, var868, self.social_link_id)
		buff = var867
		var866 = var868
	end
	local buff_1 = buffer.create(var866)
	buffer.copy(buff_1, 0, buff, 0, var866)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var866 = t_34.new()
	local var867 = 0
	while var867 < buffer.len(p34) do
		local _ = nil
		local var868 = nil
		local var869, var870, var871 = protoModule.readTag(p34, var867)
		local var872 = var869
		var868 = var870
		var867 = var871
		
		if var868 == protoModule.wireTypes.varint then
			local _ = nil
			local var873, var874 = protoModule.readVarInt(p34, var867)
			local _ = var873
			var867 = var874
			continue
		end
		if var868 == protoModule.wireTypes.lengthDelimited then
			if var872 == 1 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p34, var867)
				var867 = var876
				var866.social_link_id = buffer.tostring(var875)
			else
				local _ = nil
				local var877, var878 = protoModule.readVarInt(p34, var867)
				var867 = var878 + var877
			end
		elseif var868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var879, var880 = protoModule.readFixed32(p34, var867)
			local _ = var879
			var867 = var880
		elseif var868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var881, var882 = protoModule.readFixed64(p34, var867)
			local _ = var881
			var867 = var882
		else
			error("Unsupported wire type: " .. var1531)
		end
	end
	return var866
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
	local var883 = t_34.new()
	
	if self.social_link_id ~= nil then
		var883.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var883.social_link_id = self.socialLinkId
	end
	return var883
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
	local var883 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var884, var885 = protoModule.writeTag(buff, var883, 1, protoModule.wireTypes.lengthDelimited)
		var884, var1551 = protoModule.writeString(var884, var885, self.title)
		buff = var884
		var883 = var885
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var886 = v:encode()
			local var887, var888 = protoModule.writeTag(buff, var883, 2, protoModule.wireTypes.lengthDelimited)
			var887, var1554 = protoModule.writeBuffer(var887, var888, var886, buffer.len(var886))
			buff = var887
			var883 = var888
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var889, var890 = protoModule.writeTag(buff, var883, 3, protoModule.wireTypes.lengthDelimited)
		var889, var1556 = protoModule.writeString(var889, var890, self.next_page_token)
		buff = var889
		var883 = var890
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var891, var892 = protoModule.writeTag(buff, var883, 4, protoModule.wireTypes.lengthDelimited)
		var891, var1558 = protoModule.writeString(var891, var892, self.sort_id)
		buff = var891
		var883 = var892
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var893, var894 = protoModule.writeTag(buff, var883, 5, protoModule.wireTypes.varint)
		var893, var1560 = protoModule.writeVarInt(var893, var894, self.secondary_sort_id)
		buff = var893
		var883 = var894
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var895, var896 = protoModule.writeTag(buff, var883, 6, protoModule.wireTypes.varint)
		var895, var1562 = protoModule.writeVarInt(var895, var896, self.max_visible_rows)
		buff = var895
		var883 = var896
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var897, var898 = protoModule.writeTag(buff, var883, 7, protoModule.wireTypes.lengthDelimited)
		var897, var1564 = protoModule.writeString(var897, var898, self.subtitle)
		buff = var897
		var883 = var898
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var899, var900 = protoModule.writeTag(buff, var883, 8, protoModule.wireTypes.lengthDelimited)
		var899, var1566 = protoModule.writeString(var899, var900, self.info_text)
		buff = var899
		var883 = var900
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var901, var902 = protoModule.writeTag(buff, var883, 9, protoModule.wireTypes.lengthDelimited)
		var901, var1568 = protoModule.writeString(var901, var902, self.subtitle_link_path)
		buff = var901
		var883 = var902
	end
	if self.is_placeholder ~= nil then
		local var903, var904 = protoModule.writeTag(buff, var883, 10, protoModule.wireTypes.varint)
		var903, var1570 = protoModule.writeVarInt(var903, var904, if self.is_placeholder then 1 else 0)
		buff = var903
		var883 = var904
	end
	if self.primary_sort_id ~= nil then
		local var905, var906 = protoModule.writeTag(buff, var883, 11, protoModule.wireTypes.varint)
		var905, var1572 = protoModule.writeVarInt(var905, var906, self.primary_sort_id)
		buff = var905
		var883 = var906
	end
	if self.applied_filters ~= nil then
		local var907, var908 = protoModule.writeTag(buff, var883, 12, protoModule.wireTypes.lengthDelimited)
		var907, var1574 = protoModule.writeString(var907, var908, self.applied_filters)
		buff = var907
		var883 = var908
	end
	if self.pool_id ~= nil then
		local var909, var910 = protoModule.writeTag(buff, var883, 13, protoModule.wireTypes.lengthDelimited)
		var909, var1576 = protoModule.writeString(var909, var910, self.pool_id)
		buff = var909
		var883 = var910
	end
	if self.has_emphasized_tile then
		local var911, var912 = protoModule.writeTag(buff, var883, 14, protoModule.wireTypes.varint)
		var911, var1578 = protoModule.writeVarInt(var911, var912, if self.has_emphasized_tile then 1 else 0)
		buff = var911
		var883 = var912
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var913, var914 = protoModule.writeTag(buff, var883, 15, protoModule.wireTypes.lengthDelimited)
		var913, var1580 = protoModule.writeString(var913, var914, self.tile_activation_mode)
		buff = var913
		var883 = var914
	end
	if self.initial_feed_visible_rows ~= nil then
		local var915, var916 = protoModule.writeTag(buff, var883, 16, protoModule.wireTypes.varint)
		var915, var1582 = protoModule.writeVarInt(var915, var916, self.initial_feed_visible_rows)
		buff = var915
		var883 = var916
	end
	if self.visible_rows_per_reveal ~= nil then
		local var917, var918 = protoModule.writeTag(buff, var883, 17, protoModule.wireTypes.varint)
		var917, var1584 = protoModule.writeVarInt(var917, var918, self.visible_rows_per_reveal)
		buff = var917
		var883 = var918
	end
	if self.sponsored_user_cohort ~= nil then
		local var919, var920 = protoModule.writeTag(buff, var883, 18, protoModule.wireTypes.lengthDelimited)
		var919, var1586 = protoModule.writeString(var919, var920, self.sponsored_user_cohort)
		buff = var919
		var883 = var920
	end
	if self.anchor_tag ~= nil then
		local var921, var922 = protoModule.writeTag(buff, var883, 19, protoModule.wireTypes.lengthDelimited)
		var921, var1588 = protoModule.writeString(var921, var922, self.anchor_tag)
		buff = var921
		var883 = var922
	end
	if self.collection_item_size ~= nil then
		local var923, var924 = protoModule.writeTag(buff, var883, 20, protoModule.wireTypes.lengthDelimited)
		var923, var1590 = protoModule.writeString(var923, var924, self.collection_item_size)
		buff = var923
		var883 = var924
	end
	if self.sort_sub_id ~= nil then
		local var925, var926 = protoModule.writeTag(buff, var883, 21, protoModule.wireTypes.lengthDelimited)
		var925, var1592 = protoModule.writeString(var925, var926, self.sort_sub_id)
		buff = var925
		var883 = var926
	end
	if self.enable_game_tile_videos then
		local var927, var928 = protoModule.writeTag(buff, var883, 22, protoModule.wireTypes.varint)
		var927, var1594 = protoModule.writeVarInt(var927, var928, if self.enable_game_tile_videos then 1 else 0)
		buff = var927
		var883 = var928
	end
	local buff_1 = buffer.create(var883)
	buffer.copy(buff_1, 0, buff, 0, var883)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var929 = t_35.new()
	local var930 = 0
	while var930 < buffer.len(p35) do
		local _ = nil
		local var931 = nil
		local var932, var933, var934 = protoModule.readTag(p35, var930)
		local var935 = var932
		var931 = var933
		var930 = var934
		
		if var931 == protoModule.wireTypes.varint then
			if var935 == 5 then
				local _ = nil
				local var936, var937 = protoModule.readVarIntI32(p35, var930)
				var930 = var937
				var929.secondary_sort_id = var936
			elseif var935 == 6 then
				local _ = nil
				local var938, var939 = protoModule.readVarIntI32(p35, var930)
				var930 = var939
				var929.max_visible_rows = var938
			elseif var935 == 10 then
				local _ = nil
				local var940, var941 = protoModule.readVarInt(p35, var930)
				var930 = var941
				var929.is_placeholder = var940 ~= 0
			elseif var935 == 11 then
				local _ = nil
				local var942, var943 = protoModule.readVarIntI32(p35, var930)
				var930 = var943
				var929.primary_sort_id = var942
			elseif var935 == 14 then
				local _ = nil
				local var944, var945 = protoModule.readVarInt(p35, var930)
				var930 = var945
				var929.has_emphasized_tile = var944 ~= 0
			elseif var935 == 16 then
				local _ = nil
				local var946, var947 = protoModule.readVarIntI32(p35, var930)
				var930 = var947
				var929.initial_feed_visible_rows = var946
			elseif var935 == 17 then
				local _ = nil
				local var948, var949 = protoModule.readVarIntI32(p35, var930)
				var930 = var949
				var929.visible_rows_per_reveal = var948
			elseif var935 == 22 then
				local _ = nil
				local var950, var951 = protoModule.readVarInt(p35, var930)
				var930 = var951
				var929.enable_game_tile_videos = var950 ~= 0
			else
				local _ = nil
				local var952, var953 = protoModule.readVarInt(p35, var930)
				local _ = var952
				var930 = var953
			end
		end
		if var931 == protoModule.wireTypes.lengthDelimited then
			if var935 == 1 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var930)
				var930 = var955
				var929.title = buffer.tostring(var954)
			elseif var935 == 2 then
				local _ = nil
				local var956, var957 = protoModule.readBuffer(p35, var930)
				var930 = var957
				table.insert(var929.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var956))
			elseif var935 == 3 then
				local _ = nil
				local var958, var959 = protoModule.readBuffer(p35, var930)
				var930 = var959
				var929.next_page_token = buffer.tostring(var958)
			elseif var935 == 4 then
				local _ = nil
				local var960, var961 = protoModule.readBuffer(p35, var930)
				var930 = var961
				var929.sort_id = buffer.tostring(var960)
			elseif var935 == 7 then
				local _ = nil
				local var962, var963 = protoModule.readBuffer(p35, var930)
				var930 = var963
				var929.subtitle = buffer.tostring(var962)
			elseif var935 == 8 then
				local _ = nil
				local var964, var965 = protoModule.readBuffer(p35, var930)
				var930 = var965
				var929.info_text = buffer.tostring(var964)
			elseif var935 == 9 then
				local _ = nil
				local var966, var967 = protoModule.readBuffer(p35, var930)
				var930 = var967
				var929.subtitle_link_path = buffer.tostring(var966)
			elseif var935 == 12 then
				local _ = nil
				local var968, var969 = protoModule.readBuffer(p35, var930)
				var930 = var969
				var929.applied_filters = buffer.tostring(var968)
			elseif var935 == 13 then
				local _ = nil
				local var970, var971 = protoModule.readBuffer(p35, var930)
				var930 = var971
				var929.pool_id = buffer.tostring(var970)
			elseif var935 == 15 then
				local _ = nil
				local var972, var973 = protoModule.readBuffer(p35, var930)
				var930 = var973
				var929.tile_activation_mode = buffer.tostring(var972)
			elseif var935 == 18 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p35, var930)
				var930 = var975
				var929.sponsored_user_cohort = buffer.tostring(var974)
			elseif var935 == 19 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p35, var930)
				var930 = var977
				var929.anchor_tag = buffer.tostring(var976)
			elseif var935 == 20 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p35, var930)
				var930 = var979
				var929.collection_item_size = buffer.tostring(var978)
			elseif var935 == 21 then
				local _ = nil
				local var980, var981 = protoModule.readBuffer(p35, var930)
				var930 = var981
				var929.sort_sub_id = buffer.tostring(var980)
			else
				local _ = nil
				local var982, var983 = protoModule.readVarInt(p35, var930)
				var930 = var983 + var982
			end
		elseif var931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var984, var985 = protoModule.readFixed32(p35, var930)
			local _ = var984
			var930 = var985
		elseif var931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var986, var987 = protoModule.readFixed64(p35, var930)
			local _ = var986
			var930 = var987
		else
			error("Unsupported wire type: " .. var1598)
		end
	end
	return var929
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
	local var988 = t_35.new()
	
	if self.title ~= nil then
		var988.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var988.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var988.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var988.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var988.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var988.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var988.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var988.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var988.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var988.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var988.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var988.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var988.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var988.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var988.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var988.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var988.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var988.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var988.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var988.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var988.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var988.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var988.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var988.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var988.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var988.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var988.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var988.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var988.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var988.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var988.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var988.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var988.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var988.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var988.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var988.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var988.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var988.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var988.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var988.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var988.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var988.enable_game_tile_videos = self.enableGameTileVideos
	end
	return var988
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
	local var989 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var990, var991 = protoModule.writeTag(buff, var989, 1, protoModule.wireTypes.lengthDelimited)
		var990, var1663 = protoModule.writeString(var990, var991, self.universe_id)
		buff = var990
		var989 = var991
	end
	if self.is_sponsored then
		local var992, var993 = protoModule.writeTag(buff, var989, 2, protoModule.wireTypes.varint)
		var992, var1665 = protoModule.writeVarInt(var992, var993, if self.is_sponsored then 1 else 0)
		buff = var992
		var989 = var993
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var994, var995 = protoModule.writeTag(buff, var989, 3, protoModule.wireTypes.lengthDelimited)
		var994, var1667 = protoModule.writeString(var994, var995, self.roblox_component)
		buff = var994
		var989 = var995
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var996, var997 = protoModule.writeTag(buff, var989, 4, protoModule.wireTypes.lengthDelimited)
		var996, var1669 = protoModule.writeString(var996, var997, self.native_ad_data)
		buff = var996
		var989 = var997
	end
	if self.is_content_locked then
		local var998, var999 = protoModule.writeTag(buff, var989, 5, protoModule.wireTypes.varint)
		var998, var1671 = protoModule.writeVarInt(var998, var999, if self.is_content_locked then 1 else 0)
		buff = var998
		var989 = var999
	end
	if self.title ~= nil and self.title ~= "" then
		local var1000, var1001 = protoModule.writeTag(buff, var989, 6, protoModule.wireTypes.lengthDelimited)
		var1000, var1673 = protoModule.writeString(var1000, var1001, self.title)
		buff = var1000
		var989 = var1001
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1002, var1003 = protoModule.writeTag(buff, var989, 7, protoModule.wireTypes.lengthDelimited)
		var1002, var1675 = protoModule.writeString(var1002, var1003, self.subtitle)
		buff = var1002
		var989 = var1003
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1004, var1005 = protoModule.writeTag(buff, var989, 8, protoModule.wireTypes.lengthDelimited)
		var1004, var1677 = protoModule.writeString(var1004, var1005, self.image_asset_id)
		buff = var1004
		var989 = var1005
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1006, var1007 = protoModule.writeTag(buff, var989, 9, protoModule.wireTypes.lengthDelimited)
		var1006, var1679 = protoModule.writeString(var1006, var1007, self.video_asset_id)
		buff = var1006
		var989 = var1007
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1008, var1009 = protoModule.writeTag(buff, var989, 10, protoModule.wireTypes.lengthDelimited)
		var1008, var1681 = protoModule.writeString(var1008, var1009, self.badge_text)
		buff = var1008
		var989 = var1009
	end
	if self.player_count ~= nil then
		local var1010, var1011 = protoModule.writeTag(buff, var989, 11, protoModule.wireTypes.varint)
		var1010, var1683 = protoModule.writeVarInt(var1010, var1011, self.player_count)
		buff = var1010
		var989 = var1011
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1012, var1013 = protoModule.writeTag(buff, var989, 12, protoModule.wireTypes.lengthDelimited)
		var1012, var1685 = protoModule.writeString(var1012, var1013, self.creator_key)
		buff = var1012
		var989 = var1013
	end
	if self.rank ~= nil then
		local var1014, var1015 = protoModule.writeTag(buff, var989, 13, protoModule.wireTypes.varint)
		var1014, var1687 = protoModule.writeVarInt(var1014, var1015, self.rank)
		buff = var1014
		var989 = var1015
	end
	if self.payer_name ~= nil then
		local var1016, var1017 = protoModule.writeTag(buff, var989, 14, protoModule.wireTypes.lengthDelimited)
		var1016, var1689 = protoModule.writeString(var1016, var1017, self.payer_name)
		buff = var1016
		var989 = var1017
	end
	if self.logo_asset_id ~= nil then
		local var1018, var1019 = protoModule.writeTag(buff, var989, 15, protoModule.wireTypes.lengthDelimited)
		var1018, var1691 = protoModule.writeString(var1018, var1019, self.logo_asset_id)
		buff = var1018
		var989 = var1019
	end
	if self.logo_aspect_ratio ~= nil then
		local var1020, var1021 = protoModule.writeTag(buff, var989, 16, protoModule.wireTypes.i64)
		var1020, var1693 = protoModule.writeDouble(var1020, var1021, self.logo_aspect_ratio)
		buff = var1020
		var989 = var1021
	end
	if self.place_id ~= nil then
		local var1022, var1023 = protoModule.writeTag(buff, var989, 17, protoModule.wireTypes.lengthDelimited)
		var1022, var1695 = protoModule.writeString(var1022, var1023, self.place_id)
		buff = var1022
		var989 = var1023
	end
	if self.launch_data ~= nil then
		local var1024, var1025 = protoModule.writeTag(buff, var989, 18, protoModule.wireTypes.lengthDelimited)
		var1024, var1697 = protoModule.writeString(var1024, var1025, self.launch_data)
		buff = var1024
		var989 = var1025
	end
	if self.tile_variant ~= nil then
		local var1026, var1027 = protoModule.writeTag(buff, var989, 19, protoModule.wireTypes.lengthDelimited)
		var1026, var1699 = protoModule.writeString(var1026, var1027, self.tile_variant)
		buff = var1026
		var989 = var1027
	end
	if self.cta_text ~= nil then
		local var1028, var1029 = protoModule.writeTag(buff, var989, 20, protoModule.wireTypes.lengthDelimited)
		var1028, var1701 = protoModule.writeString(var1028, var1029, self.cta_text)
		buff = var1028
		var989 = var1029
	end
	if self.badge_analytics_id ~= nil then
		local var1030, var1031 = protoModule.writeTag(buff, var989, 21, protoModule.wireTypes.lengthDelimited)
		var1030, var1703 = protoModule.writeString(var1030, var1031, self.badge_analytics_id)
		buff = var1030
		var989 = var1031
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1032 = v:encode()
			local var1033, var1034 = protoModule.writeTag(buff, var989, 22, protoModule.wireTypes.lengthDelimited)
			var1033, var1706 = protoModule.writeBuffer(var1033, var1034, var1032, buffer.len(var1032))
			buff = var1033
			var989 = var1034
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1035, var1036 = protoModule.writeTag(buff, var989, 23, protoModule.wireTypes.lengthDelimited)
		var1035, var1708 = protoModule.writeString(var1035, var1036, self.attribution_thumbnail_asset_id)
		buff = var1035
		var989 = var1036
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1037 = v:encode()
			local var1038, var1039 = protoModule.writeTag(buff, var989, 24, protoModule.wireTypes.lengthDelimited)
			var1038, var1711 = protoModule.writeBuffer(var1038, var1039, var1037, buffer.len(var1037))
			buff = var1038
			var989 = var1039
		end
	end
	if self.source_sort_id ~= nil then
		local var1040, var1041 = protoModule.writeTag(buff, var989, 25, protoModule.wireTypes.lengthDelimited)
		var1040, var1713 = protoModule.writeString(var1040, var1041, self.source_sort_id)
		buff = var1040
		var989 = var1041
	end
	if self.new_game_enum ~= nil then
		local var1042, var1043 = protoModule.writeTag(buff, var989, 26, protoModule.wireTypes.varint)
		var1042, var1715 = protoModule.writeVarInt(var1042, var1043, self.new_game_enum)
		buff = var1042
		var989 = var1043
	end
	if self.moment_video_playback ~= nil then
		local var1044 = self.moment_video_playback:encode()
		local var1045, var1046 = protoModule.writeTag(buff, var989, 27, protoModule.wireTypes.lengthDelimited)
		var1045, var1718 = protoModule.writeBuffer(var1045, var1046, var1044, buffer.len(var1044))
		buff = var1045
		var989 = var1046
	end
	local buff_1 = buffer.create(var989)
	buffer.copy(buff_1, 0, buff, 0, var989)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1047 = t_36.new()
	local var1048 = 0
	while var1048 < buffer.len(p36) do
		local _ = nil
		local var1049 = nil
		local var1050, var1051, var1052 = protoModule.readTag(p36, var1048)
		local var1053 = var1050
		var1049 = var1051
		var1048 = var1052
		
		if var1049 == protoModule.wireTypes.varint then
			if var1053 == 2 then
				local _ = nil
				local var1054, var1055 = protoModule.readVarInt(p36, var1048)
				var1048 = var1055
				var1047.is_sponsored = var1054 ~= 0
			elseif var1053 == 5 then
				local _ = nil
				local var1056, var1057 = protoModule.readVarInt(p36, var1048)
				var1048 = var1057
				var1047.is_content_locked = var1056 ~= 0
			elseif var1053 == 11 then
				local _ = nil
				local var1058, var1059 = protoModule.readVarIntI64(p36, var1048)
				var1048 = var1059
				var1047.player_count = var1058
			elseif var1053 == 13 then
				local _ = nil
				local var1060, var1061 = protoModule.readVarIntI32(p36, var1048)
				var1048 = var1061
				var1047.rank = var1060
			elseif var1053 == 26 then
				local _ = nil
				local var1062, var1063 = protoModule.readVarIntI32(p36, var1048)
				var1048 = var1063
				var1047.new_game_enum = var1062
			else
				local _ = nil
				local var1064, var1065 = protoModule.readVarInt(p36, var1048)
				local _ = var1064
				var1048 = var1065
			end
		end
		if var1049 == protoModule.wireTypes.lengthDelimited then
			if var1053 == 1 then
				local _ = nil
				local var1066, var1067 = protoModule.readBuffer(p36, var1048)
				var1048 = var1067
				var1047.universe_id = buffer.tostring(var1066)
			elseif var1053 == 3 then
				local _ = nil
				local var1068, var1069 = protoModule.readBuffer(p36, var1048)
				var1048 = var1069
				var1047.roblox_component = buffer.tostring(var1068)
			elseif var1053 == 4 then
				local _ = nil
				local var1070, var1071 = protoModule.readBuffer(p36, var1048)
				var1048 = var1071
				var1047.native_ad_data = buffer.tostring(var1070)
			elseif var1053 == 6 then
				local _ = nil
				local var1072, var1073 = protoModule.readBuffer(p36, var1048)
				var1048 = var1073
				var1047.title = buffer.tostring(var1072)
			elseif var1053 == 7 then
				local _ = nil
				local var1074, var1075 = protoModule.readBuffer(p36, var1048)
				var1048 = var1075
				var1047.subtitle = buffer.tostring(var1074)
			elseif var1053 == 8 then
				local _ = nil
				local var1076, var1077 = protoModule.readBuffer(p36, var1048)
				var1048 = var1077
				var1047.image_asset_id = buffer.tostring(var1076)
			elseif var1053 == 9 then
				local _ = nil
				local var1078, var1079 = protoModule.readBuffer(p36, var1048)
				var1048 = var1079
				var1047.video_asset_id = buffer.tostring(var1078)
			elseif var1053 == 10 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p36, var1048)
				var1048 = var1081
				var1047.badge_text = buffer.tostring(var1080)
			elseif var1053 == 12 then
				local _ = nil
				local var1082, var1083 = protoModule.readBuffer(p36, var1048)
				var1048 = var1083
				var1047.creator_key = buffer.tostring(var1082)
			elseif var1053 == 14 then
				local _ = nil
				local var1084, var1085 = protoModule.readBuffer(p36, var1048)
				var1048 = var1085
				var1047.payer_name = buffer.tostring(var1084)
			elseif var1053 == 15 then
				local _ = nil
				local var1086, var1087 = protoModule.readBuffer(p36, var1048)
				var1048 = var1087
				var1047.logo_asset_id = buffer.tostring(var1086)
			elseif var1053 == 17 then
				local _ = nil
				local var1088, var1089 = protoModule.readBuffer(p36, var1048)
				var1048 = var1089
				var1047.place_id = buffer.tostring(var1088)
			elseif var1053 == 18 then
				local _ = nil
				local var1090, var1091 = protoModule.readBuffer(p36, var1048)
				var1048 = var1091
				var1047.launch_data = buffer.tostring(var1090)
			elseif var1053 == 19 then
				local _ = nil
				local var1092, var1093 = protoModule.readBuffer(p36, var1048)
				var1048 = var1093
				var1047.tile_variant = buffer.tostring(var1092)
			elseif var1053 == 20 then
				local _ = nil
				local var1094, var1095 = protoModule.readBuffer(p36, var1048)
				var1048 = var1095
				var1047.cta_text = buffer.tostring(var1094)
			elseif var1053 == 21 then
				local _ = nil
				local var1096, var1097 = protoModule.readBuffer(p36, var1048)
				var1048 = var1097
				var1047.badge_analytics_id = buffer.tostring(var1096)
			elseif var1053 == 22 then
				local _ = nil
				local var1098, var1099 = protoModule.readBuffer(p36, var1048)
				var1048 = var1099
				table.insert(var1047.game_items, t.GameItemInputData.decode(var1098))
			elseif var1053 == 23 then
				local _ = nil
				local var1100, var1101 = protoModule.readBuffer(p36, var1048)
				var1048 = var1101
				var1047.attribution_thumbnail_asset_id = buffer.tostring(var1100)
			elseif var1053 == 24 then
				local _ = nil
				local var1102, var1103 = protoModule.readBuffer(p36, var1048)
				var1048 = var1103
				table.insert(var1047.game_items_compact, t.GameItemInputData.decode(var1102))
			elseif var1053 == 25 then
				local _ = nil
				local var1104, var1105 = protoModule.readBuffer(p36, var1048)
				var1048 = var1105
				var1047.source_sort_id = buffer.tostring(var1104)
			elseif var1053 == 27 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p36, var1048)
				var1048 = var1107
				var1047.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1106)
			else
				local _ = nil
				local var1108, var1109 = protoModule.readVarInt(p36, var1048)
				var1048 = var1109 + var1108
			end
		elseif var1049 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1110, var1111 = protoModule.readFixed32(p36, var1048)
			local _ = var1110
			var1048 = var1111
		elseif var1049 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1722)
		elseif var1053 == 16 then
			local _ = nil
			local var1112, var1113 = protoModule.readDouble(p36, var1048)
			var1048 = var1113
			var1047.logo_aspect_ratio = var1112
		else
			local _ = nil
			local var1114, var1115 = protoModule.readFixed64(p36, var1048)
			local _ = var1114
			var1048 = var1115
		end
	end
	return var1047
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
	local var1116 = t_36.new()
	
	if self.universe_id ~= nil then
		var1116.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1116.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1116.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1116.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1116.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1116.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1116.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1116.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1116.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1116.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1116.title = self.title
	end
	if self.subtitle ~= nil then
		var1116.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1116.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1116.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1116.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1116.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1116.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1116.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1116.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1116.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1116.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1116.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1116.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1116.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1116.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1116.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1116.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1116.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1116.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1116.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1116.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1116.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1116.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1116.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1116.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1116.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1116.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1116.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1116.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1116.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1116.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1116.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1116.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1116.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1116.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1116.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1116.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1116.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1116.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1116.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1116.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	return var1116
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
	local var1117 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1118, var1119 = protoModule.writeTag(buff, var1117, 1, protoModule.wireTypes.lengthDelimited)
		var1118, var1800 = protoModule.writeString(var1118, var1119, self.asset_id)
		buff = var1118
		var1117 = var1119
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1120, var1121 = protoModule.writeTag(buff, var1117, 2, protoModule.wireTypes.lengthDelimited)
		var1120, var1802 = protoModule.writeString(var1120, var1121, self.asset_access_context)
		buff = var1120
		var1117 = var1121
	end
	local buff_1 = buffer.create(var1117)
	buffer.copy(buff_1, 0, buff, 0, var1117)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref)
	local var1117 = t_37.new()
	local var1118 = 0
	while var1118 < buffer.len(p37) do
		local _ = nil
		local var1119 = nil
		local var1120, var1121, var1122 = protoModule.readTag(p37, var1118)
		local var1123 = var1120
		var1119 = var1121
		var1118 = var1122
		
		if var1119 == protoModule.wireTypes.varint then
			local _ = nil
			local var1124, var1125 = protoModule.readVarInt(p37, var1118)
			local _ = var1124
			var1118 = var1125
			continue
		end
		if var1119 == protoModule.wireTypes.lengthDelimited then
			if var1123 == 1 then
				local _ = nil
				local var1126, var1127 = protoModule.readBuffer(p37, var1118)
				var1118 = var1127
				var1117.asset_id = buffer.tostring(var1126)
			elseif var1123 == 2 then
				local _ = nil
				local var1128, var1129 = protoModule.readBuffer(p37, var1118)
				var1118 = var1129
				var1117.asset_access_context = buffer.tostring(var1128)
			else
				local _ = nil
				local var1130, var1131 = protoModule.readVarInt(p37, var1118)
				var1118 = var1131 + var1130
			end
		elseif var1119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1132, var1133 = protoModule.readFixed32(p37, var1118)
			local _ = var1132
			var1118 = var1133
		elseif var1119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1134, var1135 = protoModule.readFixed64(p37, var1118)
			local _ = var1134
			var1118 = var1135
		else
			error("Unsupported wire type: " .. var1806)
		end
	end
	return var1117
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
	local var1136 = t_37.new()
	
	if self.asset_id ~= nil then
		var1136.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1136.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1136.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1136.asset_access_context = self.assetAccessContext
	end
	return var1136
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
	local var1136 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1137, var1138 = protoModule.writeTag(buff, var1136, 1, protoModule.wireTypes.lengthDelimited)
		var1137, var1828 = protoModule.writeString(var1137, var1138, self.title)
		buff = var1137
		var1136 = var1138
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1139 = v:encode()
			local var1140, var1141 = protoModule.writeTag(buff, var1136, 2, protoModule.wireTypes.lengthDelimited)
			var1140, var1831 = protoModule.writeBuffer(var1140, var1141, var1139, buffer.len(var1139))
			buff = var1140
			var1136 = var1141
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1142, var1143 = protoModule.writeTag(buff, var1136, 3, protoModule.wireTypes.lengthDelimited)
		var1142, var1833 = protoModule.writeString(var1142, var1143, self.next_page_token)
		buff = var1142
		var1136 = var1143
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1144, var1145 = protoModule.writeTag(buff, var1136, 4, protoModule.wireTypes.lengthDelimited)
		var1144, var1835 = protoModule.writeString(var1144, var1145, self.sort_id)
		buff = var1144
		var1136 = var1145
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1146, var1147 = protoModule.writeTag(buff, var1136, 5, protoModule.wireTypes.varint)
		var1146, var1837 = protoModule.writeVarInt(var1146, var1147, self.secondary_sort_id)
		buff = var1146
		var1136 = var1147
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1148, var1149 = protoModule.writeTag(buff, var1136, 6, protoModule.wireTypes.lengthDelimited)
		var1148, var1839 = protoModule.writeString(var1148, var1149, self.subtitle)
		buff = var1148
		var1136 = var1149
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1150, var1151 = protoModule.writeTag(buff, var1136, 7, protoModule.wireTypes.lengthDelimited)
		var1150, var1841 = protoModule.writeString(var1150, var1151, self.info_text)
		buff = var1150
		var1136 = var1151
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1152, var1153 = protoModule.writeTag(buff, var1136, 8, protoModule.wireTypes.lengthDelimited)
		var1152, var1843 = protoModule.writeString(var1152, var1153, self.subtitle_link_path)
		buff = var1152
		var1136 = var1153
	end
	if self.is_placeholder ~= nil then
		local var1154, var1155 = protoModule.writeTag(buff, var1136, 9, protoModule.wireTypes.varint)
		var1154, var1845 = protoModule.writeVarInt(var1154, var1155, if self.is_placeholder then 1 else 0)
		buff = var1154
		var1136 = var1155
	end
	if self.primary_sort_id ~= nil then
		local var1156, var1157 = protoModule.writeTag(buff, var1136, 10, protoModule.wireTypes.varint)
		var1156, var1847 = protoModule.writeVarInt(var1156, var1157, self.primary_sort_id)
		buff = var1156
		var1136 = var1157
	end
	if self.applied_filters ~= nil then
		local var1158, var1159 = protoModule.writeTag(buff, var1136, 11, protoModule.wireTypes.lengthDelimited)
		var1158, var1849 = protoModule.writeString(var1158, var1159, self.applied_filters)
		buff = var1158
		var1136 = var1159
	end
	local buff_1 = buffer.create(var1136)
	buffer.copy(buff_1, 0, buff, 0, var1136)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var1160 = t_38.new()
	local var1161 = 0
	while var1161 < buffer.len(p38) do
		local _ = nil
		local var1162 = nil
		local var1163, var1164, var1165 = protoModule.readTag(p38, var1161)
		local var1166 = var1163
		var1162 = var1164
		var1161 = var1165
		
		if var1162 == protoModule.wireTypes.varint then
			if var1166 == 5 then
				local _ = nil
				local var1167, var1168 = protoModule.readVarIntI32(p38, var1161)
				var1161 = var1168
				var1160.secondary_sort_id = var1167
			elseif var1166 == 9 then
				local _ = nil
				local var1169, var1170 = protoModule.readVarInt(p38, var1161)
				var1161 = var1170
				var1160.is_placeholder = var1169 ~= 0
			elseif var1166 == 10 then
				local _ = nil
				local var1171, var1172 = protoModule.readVarIntI32(p38, var1161)
				var1161 = var1172
				var1160.primary_sort_id = var1171
			else
				local _ = nil
				local var1173, var1174 = protoModule.readVarInt(p38, var1161)
				local _ = var1173
				var1161 = var1174
			end
		end
		if var1162 == protoModule.wireTypes.lengthDelimited then
			if var1166 == 1 then
				local _ = nil
				local var1175, var1176 = protoModule.readBuffer(p38, var1161)
				var1161 = var1176
				var1160.title = buffer.tostring(var1175)
			elseif var1166 == 2 then
				local _ = nil
				local var1177, var1178 = protoModule.readBuffer(p38, var1161)
				var1161 = var1178
				table.insert(var1160.song_items, t.SongCarouselInputData_SongItem.decode(var1177))
			elseif var1166 == 3 then
				local _ = nil
				local var1179, var1180 = protoModule.readBuffer(p38, var1161)
				var1161 = var1180
				var1160.next_page_token = buffer.tostring(var1179)
			elseif var1166 == 4 then
				local _ = nil
				local var1181, var1182 = protoModule.readBuffer(p38, var1161)
				var1161 = var1182
				var1160.sort_id = buffer.tostring(var1181)
			elseif var1166 == 6 then
				local _ = nil
				local var1183, var1184 = protoModule.readBuffer(p38, var1161)
				var1161 = var1184
				var1160.subtitle = buffer.tostring(var1183)
			elseif var1166 == 7 then
				local _ = nil
				local var1185, var1186 = protoModule.readBuffer(p38, var1161)
				var1161 = var1186
				var1160.info_text = buffer.tostring(var1185)
			elseif var1166 == 8 then
				local _ = nil
				local var1187, var1188 = protoModule.readBuffer(p38, var1161)
				var1161 = var1188
				var1160.subtitle_link_path = buffer.tostring(var1187)
			elseif var1166 == 11 then
				local _ = nil
				local var1189, var1190 = protoModule.readBuffer(p38, var1161)
				var1161 = var1190
				var1160.applied_filters = buffer.tostring(var1189)
			else
				local _ = nil
				local var1191, var1192 = protoModule.readVarInt(p38, var1161)
				var1161 = var1192 + var1191
			end
		elseif var1162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1193, var1194 = protoModule.readFixed32(p38, var1161)
			local _ = var1193
			var1161 = var1194
		elseif var1162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1195, var1196 = protoModule.readFixed64(p38, var1161)
			local _ = var1195
			var1161 = var1196
		else
			error("Unsupported wire type: " .. var1853)
		end
	end
	return var1160
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
	local var1197 = t_38.new()
	
	if self.title ~= nil then
		var1197.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1197.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1197.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1197.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1197.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1197.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1197.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1197.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1197.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1197.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1197.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1197.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1197.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1197.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1197.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1197.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1197.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1197.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1197.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1197.applied_filters = self.appliedFilters
	end
	return var1197
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
	local var1198 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1199, var1200 = protoModule.writeTag(buff, var1198, 1, protoModule.wireTypes.lengthDelimited)
		var1199, var1896 = protoModule.writeString(var1199, var1200, self.song_id)
		buff = var1199
		var1198 = var1200
	end
	local buff_1 = buffer.create(var1198)
	buffer.copy(buff_1, 0, buff, 0, var1198)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref)
	local var1198 = t_39.new()
	local var1199 = 0
	while var1199 < buffer.len(p39) do
		local _ = nil
		local var1200 = nil
		local var1201, var1202, var1203 = protoModule.readTag(p39, var1199)
		local var1204 = var1201
		var1200 = var1202
		var1199 = var1203
		
		if var1200 == protoModule.wireTypes.varint then
			local _ = nil
			local var1205, var1206 = protoModule.readVarInt(p39, var1199)
			local _ = var1205
			var1199 = var1206
			continue
		end
		if var1200 == protoModule.wireTypes.lengthDelimited then
			if var1204 == 1 then
				local _ = nil
				local var1207, var1208 = protoModule.readBuffer(p39, var1199)
				var1199 = var1208
				var1198.song_id = buffer.tostring(var1207)
			else
				local _ = nil
				local var1209, var1210 = protoModule.readVarInt(p39, var1199)
				var1199 = var1210 + var1209
			end
		elseif var1200 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1211, var1212 = protoModule.readFixed32(p39, var1199)
			local _ = var1211
			var1199 = var1212
		elseif var1200 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1213, var1214 = protoModule.readFixed64(p39, var1199)
			local _ = var1213
			var1199 = var1214
		else
			error("Unsupported wire type: " .. var1900)
		end
	end
	return var1198
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
	local var1215 = t_39.new()
	
	if self.song_id ~= nil then
		var1215.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1215.song_id = self.songId
	end
	return var1215
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
	local var1215 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1216, var1217 = protoModule.writeTag(buff, var1215, 1, protoModule.wireTypes.lengthDelimited)
		var1216, var1920 = protoModule.writeString(var1216, var1217, self.title)
		buff = var1216
		var1215 = var1217
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1218 = v:encode()
			local var1219, var1220 = protoModule.writeTag(buff, var1215, 2, protoModule.wireTypes.lengthDelimited)
			var1219, var1923 = protoModule.writeBuffer(var1219, var1220, var1218, buffer.len(var1218))
			buff = var1219
			var1215 = var1220
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1221, var1222 = protoModule.writeTag(buff, var1215, 3, protoModule.wireTypes.lengthDelimited)
		var1221, var1925 = protoModule.writeString(var1221, var1222, self.universe_id)
		buff = var1221
		var1215 = var1222
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1223, var1224 = protoModule.writeTag(buff, var1215, 4, protoModule.wireTypes.lengthDelimited)
		var1223, var1927 = protoModule.writeString(var1223, var1224, self.sort_id)
		buff = var1223
		var1215 = var1224
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1225, var1226 = protoModule.writeTag(buff, var1215, 5, protoModule.wireTypes.lengthDelimited)
		var1225, var1929 = protoModule.writeString(var1225, var1226, self.subtitle)
		buff = var1225
		var1215 = var1226
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1227, var1228 = protoModule.writeTag(buff, var1215, 6, protoModule.wireTypes.lengthDelimited)
		var1227, var1931 = protoModule.writeString(var1227, var1228, self.info_text)
		buff = var1227
		var1215 = var1228
	end
	local buff_1 = buffer.create(var1215)
	buffer.copy(buff_1, 0, buff, 0, var1215)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1229 = t_40.new()
	local var1230 = 0
	while var1230 < buffer.len(p40) do
		local _ = nil
		local var1231 = nil
		local var1232, var1233, var1234 = protoModule.readTag(p40, var1230)
		local var1235 = var1232
		var1231 = var1233
		var1230 = var1234
		
		if var1231 == protoModule.wireTypes.varint then
			local _ = nil
			local var1236, var1237 = protoModule.readVarInt(p40, var1230)
			local _ = var1236
			var1230 = var1237
			continue
		end
		if var1231 == protoModule.wireTypes.lengthDelimited then
			if var1235 == 1 then
				local _ = nil
				local var1238, var1239 = protoModule.readBuffer(p40, var1230)
				var1230 = var1239
				var1229.title = buffer.tostring(var1238)
			elseif var1235 == 2 then
				local _ = nil
				local var1240, var1241 = protoModule.readBuffer(p40, var1230)
				var1230 = var1241
				table.insert(var1229.event_items, t.EventsCarouselInputData_EventItem.decode(var1240))
			elseif var1235 == 3 then
				local _ = nil
				local var1242, var1243 = protoModule.readBuffer(p40, var1230)
				var1230 = var1243
				var1229.universe_id = buffer.tostring(var1242)
			elseif var1235 == 4 then
				local _ = nil
				local var1244, var1245 = protoModule.readBuffer(p40, var1230)
				var1230 = var1245
				var1229.sort_id = buffer.tostring(var1244)
			elseif var1235 == 5 then
				local _ = nil
				local var1246, var1247 = protoModule.readBuffer(p40, var1230)
				var1230 = var1247
				var1229.subtitle = buffer.tostring(var1246)
			elseif var1235 == 6 then
				local _ = nil
				local var1248, var1249 = protoModule.readBuffer(p40, var1230)
				var1230 = var1249
				var1229.info_text = buffer.tostring(var1248)
			else
				local _ = nil
				local var1250, var1251 = protoModule.readVarInt(p40, var1230)
				var1230 = var1251 + var1250
			end
		elseif var1231 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1252, var1253 = protoModule.readFixed32(p40, var1230)
			local _ = var1252
			var1230 = var1253
		elseif var1231 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1254, var1255 = protoModule.readFixed64(p40, var1230)
			local _ = var1254
			var1230 = var1255
		else
			error("Unsupported wire type: " .. var1935)
		end
	end
	return var1229
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
	local var1256 = t_40.new()
	
	if self.title ~= nil then
		var1256.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1256.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1256.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1256.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1256.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1256.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1256.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1256.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1256.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1256.info_text = self.infoText
	end
	return var1256
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
	local var1257 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1258, var1259 = protoModule.writeTag(buff, var1257, 1, protoModule.wireTypes.lengthDelimited)
		var1258, var1968 = protoModule.writeString(var1258, var1259, self.event_id)
		buff = var1258
		var1257 = var1259
	end
	local buff_1 = buffer.create(var1257)
	buffer.copy(buff_1, 0, buff, 0, var1257)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref)
	local var1257 = t_41.new()
	local var1258 = 0
	while var1258 < buffer.len(p41) do
		local _ = nil
		local var1259 = nil
		local var1260, var1261, var1262 = protoModule.readTag(p41, var1258)
		local var1263 = var1260
		var1259 = var1261
		var1258 = var1262
		
		if var1259 == protoModule.wireTypes.varint then
			local _ = nil
			local var1264, var1265 = protoModule.readVarInt(p41, var1258)
			local _ = var1264
			var1258 = var1265
			continue
		end
		if var1259 == protoModule.wireTypes.lengthDelimited then
			if var1263 == 1 then
				local _ = nil
				local var1266, var1267 = protoModule.readBuffer(p41, var1258)
				var1258 = var1267
				var1257.event_id = buffer.tostring(var1266)
			else
				local _ = nil
				local var1268, var1269 = protoModule.readVarInt(p41, var1258)
				var1258 = var1269 + var1268
			end
		elseif var1259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1270, var1271 = protoModule.readFixed32(p41, var1258)
			local _ = var1270
			var1258 = var1271
		elseif var1259 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1272, var1273 = protoModule.readFixed64(p41, var1258)
			local _ = var1272
			var1258 = var1273
		else
			error("Unsupported wire type: " .. var1972)
		end
	end
	return var1257
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
	local var1274 = t_41.new()
	
	if self.event_id ~= nil then
		var1274.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1274.event_id = self.eventId
	end
	return var1274
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
	local var1274 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1275, var1276 = protoModule.writeTag(buff, var1274, 1, protoModule.wireTypes.lengthDelimited)
		var1275, var1992 = protoModule.writeString(var1275, var1276, self.universe_id)
		buff = var1275
		var1274 = var1276
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1277, var1278 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1277, var1994 = protoModule.writeString(var1277, var1278, i)
			local var1279 = v:encode()
			var1278, var1996 = protoModule.writeTag(var1277, var1278, 2, protoModule.wireTypes.lengthDelimited)
			var1278, var1996 = protoModule.writeBuffer(var1278, var1996, var1279, buffer.len(var1279))
			local var1280 = var1278
			local var1281 = var1996
			local var1282, var1283 = protoModule.writeTag(buff, var1274, 2, protoModule.wireTypes.lengthDelimited)
			var1282, var2000 = protoModule.writeBuffer(var1282, var1283, var1280, var1281)
			buff = var1282
			var1274 = var1283
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1284, var1285 = protoModule.writeTag(buff, var1274, 3, protoModule.wireTypes.lengthDelimited)
			var1284, var2002 = protoModule.writeString(var1284, var1285, v)
			buff = var1284
			var1274 = var1285
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1286, var1287 = protoModule.writeTag(buff, var1274, 4, protoModule.wireTypes.lengthDelimited)
		var1286, var2004 = protoModule.writeString(var1286, var1287, self.creator_key)
		buff = var1286
		var1274 = var1287
	end
	if self.pill_tabs ~= nil then
		local var1288 = self.pill_tabs:encode()
		local var1289, var1290 = protoModule.writeTag(buff, var1274, 5, protoModule.wireTypes.lengthDelimited)
		var1289, var2007 = protoModule.writeBuffer(var1289, var1290, var1288, buffer.len(var1288))
		buff = var1289
		var1274 = var1290
	end
	local buff_1 = buffer.create(var1274)
	buffer.copy(buff_1, 0, buff, 0, var1274)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1291 = t_42.new()
	local var1292 = 0
	while var1292 < buffer.len(p42) do
		local _ = nil
		local var1293 = nil
		local var1294, var1295, var1296 = protoModule.readTag(p42, var1292)
		local var1297 = var1294
		var1293 = var1295
		var1292 = var1296
		
		if var1293 == protoModule.wireTypes.varint then
			local _ = nil
			local var1298, var1299 = protoModule.readVarInt(p42, var1292)
			local _ = var1298
			var1292 = var1299
			continue
		end
		if var1293 == protoModule.wireTypes.lengthDelimited then
			if var1297 == 1 then
				local _ = nil
				local var1300, var1301 = protoModule.readBuffer(p42, var1292)
				var1292 = var1301
				var1291.universe_id = buffer.tostring(var1300)
			elseif var1297 == 2 then
				local _ = nil
				local var1302, var1303 = protoModule.readBuffer(p42, var1292)
				var1292 = var1303
				var1302 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1302)
				var1291.entry_map[var1302.key or ""] = var1302.value or t.FeedEntry.new()
			elseif var1297 == 3 then
				local _ = nil
				local var1304, var1305 = protoModule.readBuffer(p42, var1292)
				var1292 = var1305
				table.insert(var1291.entry_order, buffer.tostring(var1304))
			elseif var1297 == 4 then
				local _ = nil
				local var1306, var1307 = protoModule.readBuffer(p42, var1292)
				var1292 = var1307
				var1291.creator_key = buffer.tostring(var1306)
			elseif var1297 == 5 then
				local _ = nil
				local var1308, var1309 = protoModule.readBuffer(p42, var1292)
				var1292 = var1309
				var1291.pill_tabs = t.PillTabsInputData.decode(var1308)
			else
				local _ = nil
				local var1310, var1311 = protoModule.readVarInt(p42, var1292)
				var1292 = var1311 + var1310
			end
		elseif var1293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1312, var1313 = protoModule.readFixed32(p42, var1292)
			local _ = var1312
			var1292 = var1313
		elseif var1293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1314, var1315 = protoModule.readFixed64(p42, var1292)
			local _ = var1314
			var1292 = var1315
		else
			error("Unsupported wire type: " .. var2011)
		end
	end
	return var1291
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
	local var1316 = t_42.new()
	
	if self.universe_id ~= nil then
		var1316.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1316.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1316.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1316.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1316.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1316.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1316.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1316.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1316.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1316.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1316
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
	local var1317 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1318, var1319 = protoModule.writeTag(buff, var1317, 1, protoModule.wireTypes.lengthDelimited)
		var1318, var2045 = protoModule.writeString(var1318, var1319, self.key)
		buff = var1318
		var1317 = var1319
	end
	if self.value ~= nil then
		local var1320 = self.value:encode()
		local var1321, var1322 = protoModule.writeTag(buff, var1317, 2, protoModule.wireTypes.lengthDelimited)
		var1321, var2048 = protoModule.writeBuffer(var1321, var1322, var1320, buffer.len(var1320))
		buff = var1321
		var1317 = var1322
	end
	local buff_1 = buffer.create(var1317)
	buffer.copy(buff_1, 0, buff, 0, var1317)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1317 = t_43.new()
	local var1318 = 0
	while var1318 < buffer.len(p43) do
		local _ = nil
		local var1319 = nil
		local var1320, var1321, var1322 = protoModule.readTag(p43, var1318)
		local var1323 = var1320
		var1319 = var1321
		var1318 = var1322
		
		if var1319 == protoModule.wireTypes.varint then
			local _ = nil
			local var1324, var1325 = protoModule.readVarInt(p43, var1318)
			local _ = var1324
			var1318 = var1325
			continue
		end
		if var1319 == protoModule.wireTypes.lengthDelimited then
			if var1323 == 1 then
				local _ = nil
				local var1326, var1327 = protoModule.readBuffer(p43, var1318)
				var1318 = var1327
				var1317.key = buffer.tostring(var1326)
			elseif var1323 == 2 then
				local _ = nil
				local var1328, var1329 = protoModule.readBuffer(p43, var1318)
				var1318 = var1329
				var1317.value = t.FeedEntry.decode(var1328)
			else
				local _ = nil
				local var1330, var1331 = protoModule.readVarInt(p43, var1318)
				var1318 = var1331 + var1330
			end
		elseif var1319 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1332, var1333 = protoModule.readFixed32(p43, var1318)
			local _ = var1332
			var1318 = var1333
		elseif var1319 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1334, var1335 = protoModule.readFixed64(p43, var1318)
			local _ = var1334
			var1318 = var1335
		else
			error("Unsupported wire type: " .. var2052)
		end
	end
	return var1317
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
	local var1336 = t_43.new()
	
	if self.key ~= nil then
		var1336.key = self.key
	end
	if self.value ~= nil then
		var1336.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1336
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
	local var1336 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1337 = v:encode()
			local var1338, var1339 = protoModule.writeTag(buff, var1336, 1, protoModule.wireTypes.lengthDelimited)
			var1338, var2075 = protoModule.writeBuffer(var1338, var1339, var1337, buffer.len(var1337))
			buff = var1338
			var1336 = var1339
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1340, var1341 = protoModule.writeTag(buff, var1336, 2, protoModule.wireTypes.lengthDelimited)
		var1340, var2077 = protoModule.writeString(var1340, var1341, self.default_option_id)
		buff = var1340
		var1336 = var1341
	end
	local buff_1 = buffer.create(var1336)
	buffer.copy(buff_1, 0, buff, 0, var1336)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1342 = t_44.new()
	local var1343 = 0
	while var1343 < buffer.len(p44) do
		local _ = nil
		local var1344 = nil
		local var1345, var1346, var1347 = protoModule.readTag(p44, var1343)
		local var1348 = var1345
		var1344 = var1346
		var1343 = var1347
		
		if var1344 == protoModule.wireTypes.varint then
			local _ = nil
			local var1349, var1350 = protoModule.readVarInt(p44, var1343)
			local _ = var1349
			var1343 = var1350
			continue
		end
		if var1344 == protoModule.wireTypes.lengthDelimited then
			if var1348 == 1 then
				local _ = nil
				local var1351, var1352 = protoModule.readBuffer(p44, var1343)
				var1343 = var1352
				table.insert(var1342.options, t.PillTabsInputData_PillTabOption.decode(var1351))
			elseif var1348 == 2 then
				local _ = nil
				local var1353, var1354 = protoModule.readBuffer(p44, var1343)
				var1343 = var1354
				var1342.default_option_id = buffer.tostring(var1353)
			else
				local _ = nil
				local var1355, var1356 = protoModule.readVarInt(p44, var1343)
				var1343 = var1356 + var1355
			end
		elseif var1344 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1357, var1358 = protoModule.readFixed32(p44, var1343)
			local _ = var1357
			var1343 = var1358
		elseif var1344 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1359, var1360 = protoModule.readFixed64(p44, var1343)
			local _ = var1359
			var1343 = var1360
		else
			error("Unsupported wire type: " .. var2081)
		end
	end
	return var1342
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
	local var1361 = t_44.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1361.options = t_1
	end
	if self.default_option_id ~= nil then
		var1361.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1361.default_option_id = self.defaultOptionId
	end
	return var1361
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
	local var1362 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1363, var1364 = protoModule.writeTag(buff, var1362, 1, protoModule.wireTypes.lengthDelimited)
		var1363, var2105 = protoModule.writeString(var1363, var1364, self.option_id)
		buff = var1363
		var1362 = var1364
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1365, var1366 = protoModule.writeTag(buff, var1362, 2, protoModule.wireTypes.lengthDelimited)
		var1365, var2107 = protoModule.writeString(var1365, var1366, self.display_name)
		buff = var1365
		var1362 = var1366
	end
	local buff_1 = buffer.create(var1362)
	buffer.copy(buff_1, 0, buff, 0, var1362)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref)
	local var1362 = t_45.new()
	local var1363 = 0
	while var1363 < buffer.len(p45) do
		local _ = nil
		local var1364 = nil
		local var1365, var1366, var1367 = protoModule.readTag(p45, var1363)
		local var1368 = var1365
		var1364 = var1366
		var1363 = var1367
		
		if var1364 == protoModule.wireTypes.varint then
			local _ = nil
			local var1369, var1370 = protoModule.readVarInt(p45, var1363)
			local _ = var1369
			var1363 = var1370
			continue
		end
		if var1364 == protoModule.wireTypes.lengthDelimited then
			if var1368 == 1 then
				local _ = nil
				local var1371, var1372 = protoModule.readBuffer(p45, var1363)
				var1363 = var1372
				var1362.option_id = buffer.tostring(var1371)
			elseif var1368 == 2 then
				local _ = nil
				local var1373, var1374 = protoModule.readBuffer(p45, var1363)
				var1363 = var1374
				var1362.display_name = buffer.tostring(var1373)
			else
				local _ = nil
				local var1375, var1376 = protoModule.readVarInt(p45, var1363)
				var1363 = var1376 + var1375
			end
		elseif var1364 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1377, var1378 = protoModule.readFixed32(p45, var1363)
			local _ = var1377
			var1363 = var1378
		elseif var1364 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1379, var1380 = protoModule.readFixed64(p45, var1363)
			local _ = var1379
			var1363 = var1380
		else
			error("Unsupported wire type: " .. var2111)
		end
	end
	return var1362
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
	local var1381 = t_45.new()
	
	if self.option_id ~= nil then
		var1381.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1381.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1381.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1381.display_name = self.displayName
	end
	return var1381
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
	local var1381 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1382 = v:encode()
			local var1383, var1384 = protoModule.writeTag(buff, var1381, 1, protoModule.wireTypes.lengthDelimited)
			var1383, var2134 = protoModule.writeBuffer(var1383, var1384, var1382, buffer.len(var1382))
			buff = var1383
			var1381 = var1384
		end
	end
	local buff_1 = buffer.create(var1381)
	buffer.copy(buff_1, 0, buff, 0, var1381)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1385 = t_46.new()
	local var1386 = 0
	while var1386 < buffer.len(p46) do
		local _ = nil
		local var1387 = nil
		local var1388, var1389, var1390 = protoModule.readTag(p46, var1386)
		local var1391 = var1388
		var1387 = var1389
		var1386 = var1390
		
		if var1387 == protoModule.wireTypes.varint then
			local _ = nil
			local var1392, var1393 = protoModule.readVarInt(p46, var1386)
			local _ = var1392
			var1386 = var1393
			continue
		end
		if var1387 == protoModule.wireTypes.lengthDelimited then
			if var1391 == 1 then
				local _ = nil
				local var1394, var1395 = protoModule.readBuffer(p46, var1386)
				var1386 = var1395
				table.insert(var1385.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1394))
			else
				local _ = nil
				local var1396, var1397 = protoModule.readVarInt(p46, var1386)
				var1386 = var1397 + var1396
			end
		elseif var1387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed32(p46, var1386)
			local _ = var1398
			var1386 = var1399
		elseif var1387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1400, var1401 = protoModule.readFixed64(p46, var1386)
			local _ = var1400
			var1386 = var1401
		else
			error("Unsupported wire type: " .. var2138)
		end
	end
	return var1385
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
	local var1402 = t_46.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1402.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1402.game_passes = t_1
	end
	return var1402
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
	local var1403 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1404, var1405 = protoModule.writeTag(buff, var1403, 1, protoModule.wireTypes.lengthDelimited)
		var1404, var2161 = protoModule.writeString(var1404, var1405, self.game_pass_id)
		buff = var1404
		var1403 = var1405
	end
	local buff_1 = buffer.create(var1403)
	buffer.copy(buff_1, 0, buff, 0, var1403)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref)
	local var1403 = t_47.new()
	local var1404 = 0
	while var1404 < buffer.len(p47) do
		local _ = nil
		local var1405 = nil
		local var1406, var1407, var1408 = protoModule.readTag(p47, var1404)
		local var1409 = var1406
		var1405 = var1407
		var1404 = var1408
		
		if var1405 == protoModule.wireTypes.varint then
			local _ = nil
			local var1410, var1411 = protoModule.readVarInt(p47, var1404)
			local _ = var1410
			var1404 = var1411
			continue
		end
		if var1405 == protoModule.wireTypes.lengthDelimited then
			if var1409 == 1 then
				local _ = nil
				local var1412, var1413 = protoModule.readBuffer(p47, var1404)
				var1404 = var1413
				var1403.game_pass_id = buffer.tostring(var1412)
			else
				local _ = nil
				local var1414, var1415 = protoModule.readVarInt(p47, var1404)
				var1404 = var1415 + var1414
			end
		elseif var1405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1416, var1417 = protoModule.readFixed32(p47, var1404)
			local _ = var1416
			var1404 = var1417
		elseif var1405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1418, var1419 = protoModule.readFixed64(p47, var1404)
			local _ = var1418
			var1404 = var1419
		else
			error("Unsupported wire type: " .. var2165)
		end
	end
	return var1403
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
	local var1420 = t_47.new()
	
	if self.game_pass_id ~= nil then
		var1420.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1420.game_pass_id = self.gamePassId
	end
	return var1420
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
	local var1420 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1421 = v:encode()
			local var1422, var1423 = protoModule.writeTag(buff, var1420, 1, protoModule.wireTypes.lengthDelimited)
			var1422, var2186 = protoModule.writeBuffer(var1422, var1423, var1421, buffer.len(var1421))
			buff = var1422
			var1420 = var1423
		end
	end
	local buff_1 = buffer.create(var1420)
	buffer.copy(buff_1, 0, buff, 0, var1420)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1424 = t_48.new()
	local var1425 = 0
	while var1425 < buffer.len(p48) do
		local _ = nil
		local var1426 = nil
		local var1427, var1428, var1429 = protoModule.readTag(p48, var1425)
		local var1430 = var1427
		var1426 = var1428
		var1425 = var1429
		
		if var1426 == protoModule.wireTypes.varint then
			local _ = nil
			local var1431, var1432 = protoModule.readVarInt(p48, var1425)
			local _ = var1431
			var1425 = var1432
			continue
		end
		if var1426 == protoModule.wireTypes.lengthDelimited then
			if var1430 == 1 then
				local _ = nil
				local var1433, var1434 = protoModule.readBuffer(p48, var1425)
				var1425 = var1434
				table.insert(var1424.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1433))
			else
				local _ = nil
				local var1435, var1436 = protoModule.readVarInt(p48, var1425)
				var1425 = var1436 + var1435
			end
		elseif var1426 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed32(p48, var1425)
			local _ = var1437
			var1425 = var1438
		elseif var1426 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1439, var1440 = protoModule.readFixed64(p48, var1425)
			local _ = var1439
			var1425 = var1440
		else
			error("Unsupported wire type: " .. var2190)
		end
	end
	return var1424
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
	local var1441 = t_48.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1441.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1441.developer_products = t_1
	end
	return var1441
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
	local var1442 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1443, var1444 = protoModule.writeTag(buff, var1442, 1, protoModule.wireTypes.lengthDelimited)
		var1443, var2213 = protoModule.writeString(var1443, var1444, self.developer_product_id)
		buff = var1443
		var1442 = var1444
	end
	local buff_1 = buffer.create(var1442)
	buffer.copy(buff_1, 0, buff, 0, var1442)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref)
	local var1442 = t_49.new()
	local var1443 = 0
	while var1443 < buffer.len(p49) do
		local _ = nil
		local var1444 = nil
		local var1445, var1446, var1447 = protoModule.readTag(p49, var1443)
		local var1448 = var1445
		var1444 = var1446
		var1443 = var1447
		
		if var1444 == protoModule.wireTypes.varint then
			local _ = nil
			local var1449, var1450 = protoModule.readVarInt(p49, var1443)
			local _ = var1449
			var1443 = var1450
			continue
		end
		if var1444 == protoModule.wireTypes.lengthDelimited then
			if var1448 == 1 then
				local _ = nil
				local var1451, var1452 = protoModule.readBuffer(p49, var1443)
				var1443 = var1452
				var1442.developer_product_id = buffer.tostring(var1451)
			else
				local _ = nil
				local var1453, var1454 = protoModule.readVarInt(p49, var1443)
				var1443 = var1454 + var1453
			end
		elseif var1444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed32(p49, var1443)
			local _ = var1455
			var1443 = var1456
		elseif var1444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1457, var1458 = protoModule.readFixed64(p49, var1443)
			local _ = var1457
			var1443 = var1458
		else
			error("Unsupported wire type: " .. var2217)
		end
	end
	return var1442
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
	local var1459 = t_49.new()
	
	if self.developer_product_id ~= nil then
		var1459.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1459.developer_product_id = self.developerProductId
	end
	return var1459
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
	local var1459 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1460 = v:encode()
			local var1461, var1462 = protoModule.writeTag(buff, var1459, 1, protoModule.wireTypes.lengthDelimited)
			var1461, var2238 = protoModule.writeBuffer(var1461, var1462, var1460, buffer.len(var1460))
			buff = var1461
			var1459 = var1462
		end
	end
	local buff_1 = buffer.create(var1459)
	buffer.copy(buff_1, 0, buff, 0, var1459)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1463 = t_50.new()
	local var1464 = 0
	while var1464 < buffer.len(p50) do
		local _ = nil
		local var1465 = nil
		local var1466, var1467, var1468 = protoModule.readTag(p50, var1464)
		local var1469 = var1466
		var1465 = var1467
		var1464 = var1468
		
		if var1465 == protoModule.wireTypes.varint then
			local _ = nil
			local var1470, var1471 = protoModule.readVarInt(p50, var1464)
			local _ = var1470
			var1464 = var1471
			continue
		end
		if var1465 == protoModule.wireTypes.lengthDelimited then
			if var1469 == 1 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p50, var1464)
				var1464 = var1473
				table.insert(var1463.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1472))
			else
				local _ = nil
				local var1474, var1475 = protoModule.readVarInt(p50, var1464)
				var1464 = var1475 + var1474
			end
		elseif var1465 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1476, var1477 = protoModule.readFixed32(p50, var1464)
			local _ = var1476
			var1464 = var1477
		elseif var1465 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1478, var1479 = protoModule.readFixed64(p50, var1464)
			local _ = var1478
			var1464 = var1479
		else
			error("Unsupported wire type: " .. var2242)
		end
	end
	return var1463
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
	local var1480 = t_50.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1480.subscriptions = t_1
	end
	return var1480
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
	local var1481 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1482, var1483 = protoModule.writeTag(buff, var1481, 1, protoModule.wireTypes.lengthDelimited)
		var1482, var2264 = protoModule.writeString(var1482, var1483, self.subscription_id)
		buff = var1482
		var1481 = var1483
	end
	local buff_1 = buffer.create(var1481)
	buffer.copy(buff_1, 0, buff, 0, var1481)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1481 = t_51.new()
	local var1482 = 0
	while var1482 < buffer.len(p51) do
		local _ = nil
		local var1483 = nil
		local var1484, var1485, var1486 = protoModule.readTag(p51, var1482)
		local var1487 = var1484
		var1483 = var1485
		var1482 = var1486
		
		if var1483 == protoModule.wireTypes.varint then
			local _ = nil
			local var1488, var1489 = protoModule.readVarInt(p51, var1482)
			local _ = var1488
			var1482 = var1489
			continue
		end
		if var1483 == protoModule.wireTypes.lengthDelimited then
			if var1487 == 1 then
				local _ = nil
				local var1490, var1491 = protoModule.readBuffer(p51, var1482)
				var1482 = var1491
				var1481.subscription_id = buffer.tostring(var1490)
			else
				local _ = nil
				local var1492, var1493 = protoModule.readVarInt(p51, var1482)
				var1482 = var1493 + var1492
			end
		elseif var1483 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed32(p51, var1482)
			local _ = var1494
			var1482 = var1495
		elseif var1483 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed64(p51, var1482)
			local _ = var1496
			var1482 = var1497
		else
			error("Unsupported wire type: " .. var2268)
		end
	end
	return var1481
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
	local var1498 = t_51.new()
	
	if self.subscription_id ~= nil then
		var1498.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1498.subscription_id = self.subscriptionId
	end
	return var1498
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
	local var1498 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1499 = v:encode()
			local var1500, var1501 = protoModule.writeTag(buff, var1498, 1, protoModule.wireTypes.lengthDelimited)
			var1500, var2289 = protoModule.writeBuffer(var1500, var1501, var1499, buffer.len(var1499))
			buff = var1500
			var1498 = var1501
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1502, var1503 = protoModule.writeTag(buff, var1498, 2, protoModule.wireTypes.lengthDelimited)
		var1502, var2291 = protoModule.writeString(var1502, var1503, self.universe_id)
		buff = var1502
		var1498 = var1503
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1504, var1505 = protoModule.writeTag(buff, var1498, 3, protoModule.wireTypes.lengthDelimited)
		var1504, var2293 = protoModule.writeString(var1504, var1505, self.section_title)
		buff = var1504
		var1498 = var1505
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1506, var1507 = protoModule.writeTag(buff, var1498, 4, protoModule.wireTypes.lengthDelimited)
		var1506, var2295 = protoModule.writeString(var1506, var1507, self.creator_key)
		buff = var1506
		var1498 = var1507
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1508, var1509 = protoModule.writeTag(buff, var1498, 5, protoModule.wireTypes.lengthDelimited)
		var1508, var2297 = protoModule.writeString(var1508, var1509, self.collection_item_size)
		buff = var1508
		var1498 = var1509
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1510, var1511 = protoModule.writeTag(buff, var1498, 6, protoModule.wireTypes.lengthDelimited)
		var1510, var2299 = protoModule.writeString(var1510, var1511, self.item_height_mode)
		buff = var1510
		var1498 = var1511
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1512, var1513 = protoModule.writeTag(buff, var1498, 7, protoModule.wireTypes.lengthDelimited)
		var1512, var2301 = protoModule.writeString(var1512, var1513, self.experience_store_product_type)
		buff = var1512
		var1498 = var1513
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1498, 8, protoModule.wireTypes.lengthDelimited)
		var1514, var2303 = protoModule.writeString(var1514, var1515, self.content_type)
		buff = var1514
		var1498 = var1515
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1498, 9, protoModule.wireTypes.lengthDelimited)
		var1516, var2305 = protoModule.writeString(var1516, var1517, self.item_type)
		buff = var1516
		var1498 = var1517
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1498, 10, protoModule.wireTypes.lengthDelimited)
		var1518, var2307 = protoModule.writeString(var1518, var1519, self.filter_category_id)
		buff = var1518
		var1498 = var1519
	end
	local buff_1 = buffer.create(var1498)
	buffer.copy(buff_1, 0, buff, 0, var1498)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
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
				table.insert(var1520.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1529))
			elseif var1526 == 2 then
				local _ = nil
				local var1531, var1532 = protoModule.readBuffer(p52, var1521)
				var1521 = var1532
				var1520.universe_id = buffer.tostring(var1531)
			elseif var1526 == 3 then
				local _ = nil
				local var1533, var1534 = protoModule.readBuffer(p52, var1521)
				var1521 = var1534
				var1520.section_title = buffer.tostring(var1533)
			elseif var1526 == 4 then
				local _ = nil
				local var1535, var1536 = protoModule.readBuffer(p52, var1521)
				var1521 = var1536
				var1520.creator_key = buffer.tostring(var1535)
			elseif var1526 == 5 then
				local _ = nil
				local var1537, var1538 = protoModule.readBuffer(p52, var1521)
				var1521 = var1538
				var1520.collection_item_size = buffer.tostring(var1537)
			elseif var1526 == 6 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p52, var1521)
				var1521 = var1540
				var1520.item_height_mode = buffer.tostring(var1539)
			elseif var1526 == 7 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p52, var1521)
				var1521 = var1542
				var1520.experience_store_product_type = buffer.tostring(var1541)
			elseif var1526 == 8 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p52, var1521)
				var1521 = var1544
				var1520.content_type = buffer.tostring(var1543)
			elseif var1526 == 9 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p52, var1521)
				var1521 = var1546
				var1520.item_type = buffer.tostring(var1545)
			elseif var1526 == 10 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p52, var1521)
				var1521 = var1548
				var1520.filter_category_id = buffer.tostring(var1547)
			else
				local _ = nil
				local var1549, var1550 = protoModule.readVarInt(p52, var1521)
				var1521 = var1550 + var1549
			end
		elseif var1522 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1551, var1552 = protoModule.readFixed32(p52, var1521)
			local _ = var1551
			var1521 = var1552
		elseif var1522 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1553, var1554 = protoModule.readFixed64(p52, var1521)
			local _ = var1553
			var1521 = var1554
		else
			error("Unsupported wire type: " .. var2311)
		end
	end
	return var1520
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
	local var1555 = t_52.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1555.items = t_1
	end
	if self.universe_id ~= nil then
		var1555.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1555.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1555.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1555.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1555.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1555.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1555.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1555.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1555.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1555.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1555.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1555.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1555.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1555.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1555.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1555.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1555.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1555.filter_category_id = self.filterCategoryId
	end
	return var1555
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
	local var1556 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1557, var1558 = protoModule.writeTag(buff, var1556, 1, protoModule.wireTypes.lengthDelimited)
		var1557, var2351 = protoModule.writeString(var1557, var1558, self.item_id)
		buff = var1557
		var1556 = var1558
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1559, var1560 = protoModule.writeTag(buff, var1556, 2, protoModule.wireTypes.varint)
		var1559, var2353 = protoModule.writeVarInt(var1559, var1560, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1559
		var1556 = var1560
	end
	local buff_1 = buffer.create(var1556)
	buffer.copy(buff_1, 0, buff, 0, var1556)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1556 = t_53.new()
	local var1557 = 0
	while var1557 < buffer.len(p53) do
		local _ = nil
		local var1558 = nil
		local var1559, var1560, var1561 = protoModule.readTag(p53, var1557)
		local var1562 = var1559
		var1558 = var1560
		var1557 = var1561
		
		if var1558 == protoModule.wireTypes.varint then
			if var1562 == 2 then
				local _ = nil
				local var1563, var1564 = protoModule.readVarIntI32(p53, var1557)
				local var1565 = var1563
				var1557 = var1564
				var1556.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1565) or var1565
			else
				local _ = nil
				local var1566, var1567 = protoModule.readVarInt(p53, var1557)
				local _ = var1566
				var1557 = var1567
			end
		end
		if var1558 == protoModule.wireTypes.lengthDelimited then
			if var1562 == 1 then
				local _ = nil
				local var1568, var1569 = protoModule.readBuffer(p53, var1557)
				var1557 = var1569
				var1556.item_id = buffer.tostring(var1568)
			else
				local _ = nil
				local var1570, var1571 = protoModule.readVarInt(p53, var1557)
				var1557 = var1571 + var1570
			end
		elseif var1558 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1572, var1573 = protoModule.readFixed32(p53, var1557)
			local _ = var1572
			var1557 = var1573
		elseif var1558 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1574, var1575 = protoModule.readFixed64(p53, var1557)
			local _ = var1574
			var1557 = var1575
		else
			error("Unsupported wire type: " .. var2357)
		end
	end
	return var1556
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
	local var1576 = t_53.new()
	
	if self.item_id ~= nil then
		var1576.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1576.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1576.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1576
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
	local var1576 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1577, var1578 = protoModule.writeTag(buff, var1576, 1, protoModule.wireTypes.lengthDelimited)
		var1577, var2380 = protoModule.writeString(var1577, var1578, self.roblox_component)
		buff = var1577
		var1576 = var1578
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1576, 2, protoModule.wireTypes.lengthDelimited)
		var1579, var2382 = protoModule.writeString(var1579, var1580, self.identifier)
		buff = var1579
		var1576 = var1580
	end
	if self.title ~= nil and self.title ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1576, 3, protoModule.wireTypes.lengthDelimited)
		var1581, var2384 = protoModule.writeString(var1581, var1582, self.title)
		buff = var1581
		var1576 = var1582
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1576, 4, protoModule.wireTypes.lengthDelimited)
		var1583, var2386 = protoModule.writeString(var1583, var1584, self.user_id)
		buff = var1583
		var1576 = var1584
	end
	if self.description ~= nil and self.description ~= "" then
		local var1585, var1586 = protoModule.writeTag(buff, var1576, 5, protoModule.wireTypes.lengthDelimited)
		var1585, var2388 = protoModule.writeString(var1585, var1586, self.description)
		buff = var1585
		var1576 = var1586
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1587, var1588 = protoModule.writeTag(buff, var1576, 6, protoModule.wireTypes.lengthDelimited)
		var1587, var2390 = protoModule.writeString(var1587, var1588, self.cta_text)
		buff = var1587
		var1576 = var1588
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1589, var1590 = protoModule.writeTag(buff, var1576, 7, protoModule.wireTypes.lengthDelimited)
		var1589, var2392 = protoModule.writeString(var1589, var1590, self.prompt_id)
		buff = var1589
		var1576 = var1590
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1591, var1592 = protoModule.writeTag(buff, var1576, 8, protoModule.wireTypes.lengthDelimited)
		var1591, var2394 = protoModule.writeString(var1591, var1592, self.prompt_type)
		buff = var1591
		var1576 = var1592
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1593, var1594 = protoModule.writeTag(buff, var1576, 9, protoModule.wireTypes.lengthDelimited)
		var1593, var2396 = protoModule.writeString(var1593, var1594, self.entity_id)
		buff = var1593
		var1576 = var1594
	end
	local buff_1 = buffer.create(var1576)
	buffer.copy(buff_1, 0, buff, 0, var1576)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1576 = t_54.new()
	local var1577 = 0
	while var1577 < buffer.len(p54) do
		local _ = nil
		local var1578 = nil
		local var1579, var1580, var1581 = protoModule.readTag(p54, var1577)
		local var1582 = var1579
		var1578 = var1580
		var1577 = var1581
		
		if var1578 == protoModule.wireTypes.varint then
			local _ = nil
			local var1583, var1584 = protoModule.readVarInt(p54, var1577)
			local _ = var1583
			var1577 = var1584
			continue
		end
		if var1578 == protoModule.wireTypes.lengthDelimited then
			if var1582 == 1 then
				local _ = nil
				local var1585, var1586 = protoModule.readBuffer(p54, var1577)
				var1577 = var1586
				var1576.roblox_component = buffer.tostring(var1585)
			elseif var1582 == 2 then
				local _ = nil
				local var1587, var1588 = protoModule.readBuffer(p54, var1577)
				var1577 = var1588
				var1576.identifier = buffer.tostring(var1587)
			elseif var1582 == 3 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p54, var1577)
				var1577 = var1590
				var1576.title = buffer.tostring(var1589)
			elseif var1582 == 4 then
				local _ = nil
				local var1591, var1592 = protoModule.readBuffer(p54, var1577)
				var1577 = var1592
				var1576.user_id = buffer.tostring(var1591)
			elseif var1582 == 5 then
				local _ = nil
				local var1593, var1594 = protoModule.readBuffer(p54, var1577)
				var1577 = var1594
				var1576.description = buffer.tostring(var1593)
			elseif var1582 == 6 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p54, var1577)
				var1577 = var1596
				var1576.cta_text = buffer.tostring(var1595)
			elseif var1582 == 7 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p54, var1577)
				var1577 = var1598
				var1576.prompt_id = buffer.tostring(var1597)
			elseif var1582 == 8 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p54, var1577)
				var1577 = var1600
				var1576.prompt_type = buffer.tostring(var1599)
			elseif var1582 == 9 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p54, var1577)
				var1577 = var1602
				var1576.entity_id = buffer.tostring(var1601)
			else
				local _ = nil
				local var1603, var1604 = protoModule.readVarInt(p54, var1577)
				var1577 = var1604 + var1603
			end
		elseif var1578 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1605, var1606 = protoModule.readFixed32(p54, var1577)
			local _ = var1605
			var1577 = var1606
		elseif var1578 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1607, var1608 = protoModule.readFixed64(p54, var1577)
			local _ = var1607
			var1577 = var1608
		else
			error("Unsupported wire type: " .. var2400)
		end
	end
	return var1576
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
	local var1609 = t_54.new()
	
	if self.roblox_component ~= nil then
		var1609.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1609.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1609.identifier = self.identifier
	end
	if self.title ~= nil then
		var1609.title = self.title
	end
	if self.user_id ~= nil then
		var1609.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1609.user_id = self.userId
	end
	if self.description ~= nil then
		var1609.description = self.description
	end
	if self.cta_text ~= nil then
		var1609.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1609.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1609.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1609.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1609.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1609.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1609.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1609.entity_id = self.entityId
	end
	return var1609
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
	local var1609 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1610, var1611 = protoModule.writeTag(buff, var1609, 1, protoModule.wireTypes.lengthDelimited)
		var1610, var2436 = protoModule.writeString(var1610, var1611, self.group_id)
		buff = var1610
		var1609 = var1611
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1612, var1613 = protoModule.writeTag(buff, var1609, 2, protoModule.wireTypes.lengthDelimited)
		var1612, var2438 = protoModule.writeString(var1612, var1613, self.experience_id)
		buff = var1612
		var1609 = var1613
	end
	local buff_1 = buffer.create(var1609)
	buffer.copy(buff_1, 0, buff, 0, var1609)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1609 = t_55.new()
	local var1610 = 0
	while var1610 < buffer.len(p55) do
		local _ = nil
		local var1611 = nil
		local var1612, var1613, var1614 = protoModule.readTag(p55, var1610)
		local var1615 = var1612
		var1611 = var1613
		var1610 = var1614
		
		if var1611 == protoModule.wireTypes.varint then
			local _ = nil
			local var1616, var1617 = protoModule.readVarInt(p55, var1610)
			local _ = var1616
			var1610 = var1617
			continue
		end
		if var1611 == protoModule.wireTypes.lengthDelimited then
			if var1615 == 1 then
				local _ = nil
				local var1618, var1619 = protoModule.readBuffer(p55, var1610)
				var1610 = var1619
				var1609.group_id = buffer.tostring(var1618)
			elseif var1615 == 2 then
				local _ = nil
				local var1620, var1621 = protoModule.readBuffer(p55, var1610)
				var1610 = var1621
				var1609.experience_id = buffer.tostring(var1620)
			else
				local _ = nil
				local var1622, var1623 = protoModule.readVarInt(p55, var1610)
				var1610 = var1623 + var1622
			end
		elseif var1611 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1624, var1625 = protoModule.readFixed32(p55, var1610)
			local _ = var1624
			var1610 = var1625
		elseif var1611 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1626, var1627 = protoModule.readFixed64(p55, var1610)
			local _ = var1626
			var1610 = var1627
		else
			error("Unsupported wire type: " .. var2442)
		end
	end
	return var1609
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
	local var1628 = t_55.new()
	
	if self.group_id ~= nil then
		var1628.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1628.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1628.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1628.experience_id = self.experienceId
	end
	return var1628
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
	local var1628 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1629, var1630 = protoModule.writeTag(buff, var1628, 1, protoModule.wireTypes.lengthDelimited)
		var1629, var2464 = protoModule.writeString(var1629, var1630, self.title)
		buff = var1629
		var1628 = var1630
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1631, var1632 = protoModule.writeTag(buff, var1628, 2, protoModule.wireTypes.lengthDelimited)
		var1631, var2466 = protoModule.writeString(var1631, var1632, self.dismiss_text)
		buff = var1631
		var1628 = var1632
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1633, var1634 = protoModule.writeTag(buff, var1628, 3, protoModule.wireTypes.lengthDelimited)
		var1633, var2468 = protoModule.writeString(var1633, var1634, self.user_id)
		buff = var1633
		var1628 = var1634
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1635 = v:encode()
			local var1636, var1637 = protoModule.writeTag(buff, var1628, 4, protoModule.wireTypes.lengthDelimited)
			var1636, var2471 = protoModule.writeBuffer(var1636, var1637, var1635, buffer.len(var1635))
			buff = var1636
			var1628 = var1637
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1638, var1639 = protoModule.writeTag(buff, var1628, 5, protoModule.wireTypes.lengthDelimited)
		var1638, var2473 = protoModule.writeString(var1638, var1639, self.prompt_id)
		buff = var1638
		var1628 = var1639
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1628, 6, protoModule.wireTypes.lengthDelimited)
		var1640, var2475 = protoModule.writeString(var1640, var1641, self.prompt_type)
		buff = var1640
		var1628 = var1641
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1642, var1643 = protoModule.writeTag(buff, var1628, 7, protoModule.wireTypes.lengthDelimited)
		var1642, var2477 = protoModule.writeString(var1642, var1643, self.sort_id)
		buff = var1642
		var1628 = var1643
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1644, var1645 = protoModule.writeTag(buff, var1628, 8, protoModule.wireTypes.lengthDelimited)
		var1644, var2479 = protoModule.writeString(var1644, var1645, self.feed_item_key)
		buff = var1644
		var1628 = var1645
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1646 = self.client_attributes.value:encode()
		local var1647, var1648 = protoModule.writeTag(buff, var1628, 9, protoModule.wireTypes.lengthDelimited)
		var1647, var2482 = protoModule.writeBuffer(var1647, var1648, var1646, buffer.len(var1646))
		buff = var1647
		var1628 = var1648
	end
	local buff_1 = buffer.create(var1628)
	buffer.copy(buff_1, 0, buff, 0, var1628)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1649 = t_56.new()
	local var1650 = 0
	while var1650 < buffer.len(p56) do
		local _ = nil
		local var1651 = nil
		local var1652, var1653, var1654 = protoModule.readTag(p56, var1650)
		local var1655 = var1652
		var1651 = var1653
		var1650 = var1654
		
		if var1651 == protoModule.wireTypes.varint then
			local _ = nil
			local var1656, var1657 = protoModule.readVarInt(p56, var1650)
			local _ = var1656
			var1650 = var1657
			continue
		end
		if var1651 == protoModule.wireTypes.lengthDelimited then
			if var1655 == 1 then
				local _ = nil
				local var1658, var1659 = protoModule.readBuffer(p56, var1650)
				var1650 = var1659
				var1649.title = buffer.tostring(var1658)
			elseif var1655 == 2 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p56, var1650)
				var1650 = var1661
				var1649.dismiss_text = buffer.tostring(var1660)
			elseif var1655 == 3 then
				local _ = nil
				local var1662, var1663 = protoModule.readBuffer(p56, var1650)
				var1650 = var1663
				var1649.user_id = buffer.tostring(var1662)
			elseif var1655 == 4 then
				local _ = nil
				local var1664, var1665 = protoModule.readBuffer(p56, var1650)
				var1650 = var1665
				table.insert(var1649.cards, t.CardContainerCardInputData.decode(var1664))
			elseif var1655 == 5 then
				local _ = nil
				local var1666, var1667 = protoModule.readBuffer(p56, var1650)
				var1650 = var1667
				var1649.prompt_id = buffer.tostring(var1666)
			elseif var1655 == 6 then
				local _ = nil
				local var1668, var1669 = protoModule.readBuffer(p56, var1650)
				var1650 = var1669
				var1649.prompt_type = buffer.tostring(var1668)
			elseif var1655 == 7 then
				local _ = nil
				local var1670, var1671 = protoModule.readBuffer(p56, var1650)
				var1650 = var1671
				var1649.sort_id = buffer.tostring(var1670)
			elseif var1655 == 8 then
				local _ = nil
				local var1672, var1673 = protoModule.readBuffer(p56, var1650)
				var1650 = var1673
				var1649.feed_item_key = buffer.tostring(var1672)
			elseif var1655 == 9 then
				local _ = nil
				local var1674, var1675 = protoModule.readBuffer(p56, var1650)
				var1650 = var1675
				var1649.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1674)
				}
			else
				local _ = nil
				local var1676, var1677 = protoModule.readVarInt(p56, var1650)
				var1650 = var1677 + var1676
			end
		elseif var1651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1678, var1679 = protoModule.readFixed32(p56, var1650)
			local _ = var1678
			var1650 = var1679
		elseif var1651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1680, var1681 = protoModule.readFixed64(p56, var1650)
			local _ = var1680
			var1650 = var1681
		else
			error("Unsupported wire type: " .. var2486)
		end
	end
	return var1649
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
	local var1682 = t_56.new()
	
	if self.title ~= nil then
		var1682.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1682.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1682.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1682.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1682.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1682.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1682.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1682.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1682.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1682.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1682.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1682.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1682.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1682.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1682.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1682.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1682
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
	local var1683 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1684, var1685 = protoModule.writeTag(buff, var1683, 1, protoModule.wireTypes.lengthDelimited)
		var1684, var2524 = protoModule.writeString(var1684, var1685, self.title)
		buff = var1684
		var1683 = var1685
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1686, var1687 = protoModule.writeTag(buff, var1683, 2, protoModule.wireTypes.lengthDelimited)
		var1686, var2526 = protoModule.writeString(var1686, var1687, self.user_id)
		buff = var1686
		var1683 = var1687
	end
	if self.description ~= nil and self.description ~= "" then
		local var1688, var1689 = protoModule.writeTag(buff, var1683, 3, protoModule.wireTypes.lengthDelimited)
		var1688, var2528 = protoModule.writeString(var1688, var1689, self.description)
		buff = var1688
		var1683 = var1689
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1690, var1691 = protoModule.writeTag(buff, var1683, 4, protoModule.wireTypes.lengthDelimited)
		var1690, var2530 = protoModule.writeString(var1690, var1691, self.cta_text)
		buff = var1690
		var1683 = var1691
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1692, var1693 = protoModule.writeTag(buff, var1683, 5, protoModule.wireTypes.lengthDelimited)
		var1692, var2532 = protoModule.writeString(var1692, var1693, self.prompt_id)
		buff = var1692
		var1683 = var1693
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1683, 6, protoModule.wireTypes.lengthDelimited)
		var1694, var2534 = protoModule.writeString(var1694, var1695, self.prompt_type)
		buff = var1694
		var1683 = var1695
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1683, 7, protoModule.wireTypes.lengthDelimited)
		var1696, var2536 = protoModule.writeString(var1696, var1697, self.entity_id)
		buff = var1696
		var1683 = var1697
	end
	local buff_1 = buffer.create(var1683)
	buffer.copy(buff_1, 0, buff, 0, var1683)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1683 = t_57.new()
	local var1684 = 0
	while var1684 < buffer.len(p57) do
		local _ = nil
		local var1685 = nil
		local var1686, var1687, var1688 = protoModule.readTag(p57, var1684)
		local var1689 = var1686
		var1685 = var1687
		var1684 = var1688
		
		if var1685 == protoModule.wireTypes.varint then
			local _ = nil
			local var1690, var1691 = protoModule.readVarInt(p57, var1684)
			local _ = var1690
			var1684 = var1691
			continue
		end
		if var1685 == protoModule.wireTypes.lengthDelimited then
			if var1689 == 1 then
				local _ = nil
				local var1692, var1693 = protoModule.readBuffer(p57, var1684)
				var1684 = var1693
				var1683.title = buffer.tostring(var1692)
			elseif var1689 == 2 then
				local _ = nil
				local var1694, var1695 = protoModule.readBuffer(p57, var1684)
				var1684 = var1695
				var1683.user_id = buffer.tostring(var1694)
			elseif var1689 == 3 then
				local _ = nil
				local var1696, var1697 = protoModule.readBuffer(p57, var1684)
				var1684 = var1697
				var1683.description = buffer.tostring(var1696)
			elseif var1689 == 4 then
				local _ = nil
				local var1698, var1699 = protoModule.readBuffer(p57, var1684)
				var1684 = var1699
				var1683.cta_text = buffer.tostring(var1698)
			elseif var1689 == 5 then
				local _ = nil
				local var1700, var1701 = protoModule.readBuffer(p57, var1684)
				var1684 = var1701
				var1683.prompt_id = buffer.tostring(var1700)
			elseif var1689 == 6 then
				local _ = nil
				local var1702, var1703 = protoModule.readBuffer(p57, var1684)
				var1684 = var1703
				var1683.prompt_type = buffer.tostring(var1702)
			elseif var1689 == 7 then
				local _ = nil
				local var1704, var1705 = protoModule.readBuffer(p57, var1684)
				var1684 = var1705
				var1683.entity_id = buffer.tostring(var1704)
			else
				local _ = nil
				local var1706, var1707 = protoModule.readVarInt(p57, var1684)
				var1684 = var1707 + var1706
			end
		elseif var1685 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1708, var1709 = protoModule.readFixed32(p57, var1684)
			local _ = var1708
			var1684 = var1709
		elseif var1685 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1710, var1711 = protoModule.readFixed64(p57, var1684)
			local _ = var1710
			var1684 = var1711
		else
			error("Unsupported wire type: " .. var2540)
		end
	end
	return var1683
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
	local var1712 = t_57.new()
	
	if self.title ~= nil then
		var1712.title = self.title
	end
	if self.user_id ~= nil then
		var1712.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1712.user_id = self.userId
	end
	if self.description ~= nil then
		var1712.description = self.description
	end
	if self.cta_text ~= nil then
		var1712.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1712.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1712.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1712.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1712.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1712.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1712.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1712.entity_id = self.entityId
	end
	return var1712
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
	local var1712 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1713, var1714 = protoModule.writeTag(buff, var1712, 1, protoModule.wireTypes.lengthDelimited)
		var1713, var2572 = protoModule.writeString(var1713, var1714, self.prompt_id)
		buff = var1713
		var1712 = var1714
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1715, var1716 = protoModule.writeTag(buff, var1712, 2, protoModule.wireTypes.lengthDelimited)
		var1715, var2574 = protoModule.writeString(var1715, var1716, self.prompt_type)
		buff = var1715
		var1712 = var1716
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1717, var1718 = protoModule.writeTag(buff, var1712, 3, protoModule.wireTypes.lengthDelimited)
		var1717, var2576 = protoModule.writeString(var1717, var1718, self.user_id)
		buff = var1717
		var1712 = var1718
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1719, var1720 = protoModule.writeTag(buff, var1712, 4, protoModule.wireTypes.lengthDelimited)
		var1719, var2578 = protoModule.writeString(var1719, var1720, self.audit_data)
		buff = var1719
		var1712 = var1720
	end
	local buff_1 = buffer.create(var1712)
	buffer.copy(buff_1, 0, buff, 0, var1712)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1712 = t_58.new()
	local var1713 = 0
	while var1713 < buffer.len(p58) do
		local _ = nil
		local var1714 = nil
		local var1715, var1716, var1717 = protoModule.readTag(p58, var1713)
		local var1718 = var1715
		var1714 = var1716
		var1713 = var1717
		
		if var1714 == protoModule.wireTypes.varint then
			local _ = nil
			local var1719, var1720 = protoModule.readVarInt(p58, var1713)
			local _ = var1719
			var1713 = var1720
			continue
		end
		if var1714 == protoModule.wireTypes.lengthDelimited then
			if var1718 == 1 then
				local _ = nil
				local var1721, var1722 = protoModule.readBuffer(p58, var1713)
				var1713 = var1722
				var1712.prompt_id = buffer.tostring(var1721)
			elseif var1718 == 2 then
				local _ = nil
				local var1723, var1724 = protoModule.readBuffer(p58, var1713)
				var1713 = var1724
				var1712.prompt_type = buffer.tostring(var1723)
			elseif var1718 == 3 then
				local _ = nil
				local var1725, var1726 = protoModule.readBuffer(p58, var1713)
				var1713 = var1726
				var1712.user_id = buffer.tostring(var1725)
			elseif var1718 == 4 then
				local _ = nil
				local var1727, var1728 = protoModule.readBuffer(p58, var1713)
				var1713 = var1728
				var1712.audit_data = buffer.tostring(var1727)
			else
				local _ = nil
				local var1729, var1730 = protoModule.readVarInt(p58, var1713)
				var1713 = var1730 + var1729
			end
		elseif var1714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1731, var1732 = protoModule.readFixed32(p58, var1713)
			local _ = var1731
			var1713 = var1732
		elseif var1714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1733, var1734 = protoModule.readFixed64(p58, var1713)
			local _ = var1733
			var1713 = var1734
		else
			error("Unsupported wire type: " .. var2582)
		end
	end
	return var1712
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
	local var1735 = t_58.new()
	
	if self.prompt_id ~= nil then
		var1735.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1735.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1735.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1735.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1735.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1735.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1735.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1735.audit_data = self.auditData
	end
	return var1735
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
	local var1735 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1736, var1737 = protoModule.writeTag(buff, var1735, 1, protoModule.wireTypes.varint)
		var1736, var2608 = protoModule.writeVarInt(var1736, var1737, self.sender_count)
		buff = var1736
		var1735 = var1737
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1738, var1739 = protoModule.writeTag(buff, var1735, 2, protoModule.wireTypes.varint)
		var1738, var2610 = protoModule.writeVarInt(var1738, var1739, self.total_robux_amount)
		buff = var1738
		var1735 = var1739
	end
	local buff_1 = buffer.create(var1735)
	buffer.copy(buff_1, 0, buff, 0, var1735)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1735 = t_59.new()
	local var1736 = 0
	while var1736 < buffer.len(p59) do
		local _ = nil
		local _ = nil
		local var1737, var1738, var1739 = protoModule.readTag(p59, var1736)
		local var1740 = var1737
		local var1741 = var1738
		var1736 = var1739
		
		if var1741 == protoModule.wireTypes.varint then
			if var1740 == 1 then
				local _ = nil
				local var1742, var1743 = protoModule.readVarIntI32(p59, var1736)
				var1736 = var1743
				var1735.sender_count = var1742
			elseif var1740 == 2 then
				local _ = nil
				local var1744, var1745 = protoModule.readVarIntI64(p59, var1736)
				var1736 = var1745
				var1735.total_robux_amount = var1744
			else
				local _ = nil
				local var1746, var1747 = protoModule.readVarInt(p59, var1736)
				local _ = var1746
				var1736 = var1747
			end
		elseif var1741 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1748, var1749 = protoModule.readVarInt(p59, var1736)
			var1736 = var1749 + var1748
		elseif var1741 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1750, var1751 = protoModule.readFixed32(p59, var1736)
			local _ = var1750
			var1736 = var1751
		elseif var1741 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1752, var1753 = protoModule.readFixed64(p59, var1736)
			local _ = var1752
			var1736 = var1753
		else
			error("Unsupported wire type: " .. var2618)
		end
	end
	return var1735
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
	local var1754 = t_59.new()
	
	if self.sender_count ~= nil then
		var1754.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1754.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1754.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1754.total_robux_amount = self.totalRobuxAmount
	end
	return var1754
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
	local var1754 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1755, var1756 = protoModule.writeTag(buff, var1754, 1, protoModule.wireTypes.lengthDelimited)
		var1755, var2636 = protoModule.writeString(var1755, var1756, self.title)
		buff = var1755
		var1754 = var1756
	end
	if self.description ~= nil and self.description ~= "" then
		local var1757, var1758 = protoModule.writeTag(buff, var1754, 2, protoModule.wireTypes.lengthDelimited)
		var1757, var2638 = protoModule.writeString(var1757, var1758, self.description)
		buff = var1757
		var1754 = var1758
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1759, var1760 = protoModule.writeTag(buff, var1754, 3, protoModule.wireTypes.lengthDelimited)
		var1759, var2640 = protoModule.writeString(var1759, var1760, self.primary_text)
		buff = var1759
		var1754 = var1760
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1761, var1762 = protoModule.writeTag(buff, var1754, 4, protoModule.wireTypes.lengthDelimited)
		var1761, var2642 = protoModule.writeString(var1761, var1762, self.secondary_text)
		buff = var1761
		var1754 = var1762
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1763, var1764 = protoModule.writeTag(buff, var1754, 5, protoModule.wireTypes.lengthDelimited)
		var1763, var2644 = protoModule.writeString(var1763, var1764, self.prompt_id)
		buff = var1763
		var1754 = var1764
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1765, var1766 = protoModule.writeTag(buff, var1754, 6, protoModule.wireTypes.lengthDelimited)
		var1765, var2646 = protoModule.writeString(var1765, var1766, self.prompt_type)
		buff = var1765
		var1754 = var1766
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1767, var1768 = protoModule.writeTag(buff, var1754, 7, protoModule.wireTypes.varint)
		var1767, var2648 = protoModule.writeVarInt(var1767, var1768, self.times_seen)
		buff = var1767
		var1754 = var1768
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1769 = self.content.value:encode()
		local var1770, var1771 = protoModule.writeTag(buff, var1754, 8, protoModule.wireTypes.lengthDelimited)
		var1770, var2651 = protoModule.writeBuffer(var1770, var1771, var1769, buffer.len(var1769))
		buff = var1770
		var1754 = var1771
	end
	if self.sort_id ~= nil then
		local var1772, var1773 = protoModule.writeTag(buff, var1754, 9, protoModule.wireTypes.lengthDelimited)
		var1772, var2653 = protoModule.writeString(var1772, var1773, self.sort_id)
		buff = var1772
		var1754 = var1773
	end
	local buff_1 = buffer.create(var1754)
	buffer.copy(buff_1, 0, buff, 0, var1754)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1754 = t_60.new()
	local var1755 = 0
	while var1755 < buffer.len(p60) do
		local _ = nil
		local var1756 = nil
		local var1757, var1758, var1759 = protoModule.readTag(p60, var1755)
		local var1760 = var1757
		var1756 = var1758
		var1755 = var1759
		
		if var1756 == protoModule.wireTypes.varint then
			if var1760 == 7 then
				local _ = nil
				local var1761, var1762 = protoModule.readVarIntI32(p60, var1755)
				var1755 = var1762
				var1754.times_seen = var1761
			else
				local _ = nil
				local var1763, var1764 = protoModule.readVarInt(p60, var1755)
				local _ = var1763
				var1755 = var1764
			end
		end
		if var1756 == protoModule.wireTypes.lengthDelimited then
			if var1760 == 1 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p60, var1755)
				var1755 = var1766
				var1754.title = buffer.tostring(var1765)
			elseif var1760 == 2 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p60, var1755)
				var1755 = var1768
				var1754.description = buffer.tostring(var1767)
			elseif var1760 == 3 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p60, var1755)
				var1755 = var1770
				var1754.primary_text = buffer.tostring(var1769)
			elseif var1760 == 4 then
				local _ = nil
				local var1771, var1772 = protoModule.readBuffer(p60, var1755)
				var1755 = var1772
				var1754.secondary_text = buffer.tostring(var1771)
			elseif var1760 == 5 then
				local _ = nil
				local var1773, var1774 = protoModule.readBuffer(p60, var1755)
				var1755 = var1774
				var1754.prompt_id = buffer.tostring(var1773)
			elseif var1760 == 6 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p60, var1755)
				var1755 = var1776
				var1754.prompt_type = buffer.tostring(var1775)
			elseif var1760 == 8 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p60, var1755)
				var1755 = var1778
				var1754.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1777)
				}
			elseif var1760 == 9 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p60, var1755)
				var1755 = var1780
				var1754.sort_id = buffer.tostring(var1779)
			else
				local _ = nil
				local var1781, var1782 = protoModule.readVarInt(p60, var1755)
				var1755 = var1782 + var1781
			end
		elseif var1756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed32(p60, var1755)
			local _ = var1783
			var1755 = var1784
		elseif var1756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1785, var1786 = protoModule.readFixed64(p60, var1755)
			local _ = var1785
			var1755 = var1786
		else
			error("Unsupported wire type: " .. var2657)
		end
	end
	return var1754
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
	local var1787 = t_60.new()
	
	if self.title ~= nil then
		var1787.title = self.title
	end
	if self.description ~= nil then
		var1787.description = self.description
	end
	if self.primary_text ~= nil then
		var1787.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1787.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1787.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1787.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1787.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1787.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1787.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1787.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1787.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1787.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1787.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1787.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1787.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1787.sort_id = self.sortId
	end
	return var1787
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
	local var1787 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1788, var1789 = protoModule.writeTag(buff, var1787, 1, protoModule.wireTypes.lengthDelimited)
		var1788, var2693 = protoModule.writeString(var1788, var1789, self.tooltip_text)
		buff = var1788
		var1787 = var1789
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1790, var1791 = protoModule.writeTag(buff, var1787, 2, protoModule.wireTypes.lengthDelimited)
		var1790, var2695 = protoModule.writeString(var1790, var1791, self.prompt_id)
		buff = var1790
		var1787 = var1791
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1792, var1793 = protoModule.writeTag(buff, var1787, 3, protoModule.wireTypes.lengthDelimited)
		var1792, var2697 = protoModule.writeString(var1792, var1793, self.prompt_type)
		buff = var1792
		var1787 = var1793
	end
	local buff_1 = buffer.create(var1787)
	buffer.copy(buff_1, 0, buff, 0, var1787)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1787 = t_61.new()
	local var1788 = 0
	while var1788 < buffer.len(p61) do
		local _ = nil
		local var1789 = nil
		local var1790, var1791, var1792 = protoModule.readTag(p61, var1788)
		local var1793 = var1790
		var1789 = var1791
		var1788 = var1792
		
		if var1789 == protoModule.wireTypes.varint then
			local _ = nil
			local var1794, var1795 = protoModule.readVarInt(p61, var1788)
			local _ = var1794
			var1788 = var1795
			continue
		end
		if var1789 == protoModule.wireTypes.lengthDelimited then
			if var1793 == 1 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p61, var1788)
				var1788 = var1797
				var1787.tooltip_text = buffer.tostring(var1796)
			elseif var1793 == 2 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p61, var1788)
				var1788 = var1799
				var1787.prompt_id = buffer.tostring(var1798)
			elseif var1793 == 3 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p61, var1788)
				var1788 = var1801
				var1787.prompt_type = buffer.tostring(var1800)
			else
				local _ = nil
				local var1802, var1803 = protoModule.readVarInt(p61, var1788)
				var1788 = var1803 + var1802
			end
		elseif var1789 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1804, var1805 = protoModule.readFixed32(p61, var1788)
			local _ = var1804
			var1788 = var1805
		elseif var1789 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed64(p61, var1788)
			local _ = var1806
			var1788 = var1807
		else
			error("Unsupported wire type: " .. var2701)
		end
	end
	return var1787
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
	local var1808 = t_61.new()
	
	if self.tooltip_text ~= nil then
		var1808.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1808.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1808.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1808.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1808.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1808.prompt_type = self.promptType
	end
	return var1808
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
	local var1808 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1809, var1810 = protoModule.writeTag(buff, var1808, 1, protoModule.wireTypes.lengthDelimited)
		var1809, var2725 = protoModule.writeString(var1809, var1810, self.media_id)
		buff = var1809
		var1808 = var1810
	end
	if self.title ~= nil and self.title ~= "" then
		local var1811, var1812 = protoModule.writeTag(buff, var1808, 2, protoModule.wireTypes.lengthDelimited)
		var1811, var2727 = protoModule.writeString(var1811, var1812, self.title)
		buff = var1811
		var1808 = var1812
	end
	if self.description ~= nil and self.description ~= "" then
		local var1813, var1814 = protoModule.writeTag(buff, var1808, 3, protoModule.wireTypes.lengthDelimited)
		var1813, var2729 = protoModule.writeString(var1813, var1814, self.description)
		buff = var1813
		var1808 = var1814
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1815, var1816 = protoModule.writeTag(buff, var1808, 4, protoModule.wireTypes.lengthDelimited)
		var1815, var2731 = protoModule.writeString(var1815, var1816, self.prompt_id)
		buff = var1815
		var1808 = var1816
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1817, var1818 = protoModule.writeTag(buff, var1808, 5, protoModule.wireTypes.lengthDelimited)
		var1817, var2733 = protoModule.writeString(var1817, var1818, self.prompt_type)
		buff = var1817
		var1808 = var1818
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1819, var1820 = protoModule.writeTag(buff, var1808, 6, protoModule.wireTypes.lengthDelimited)
		var1819, var2735 = protoModule.writeString(var1819, var1820, self.anchor_tag)
		buff = var1819
		var1808 = var1820
	end
	local buff_1 = buffer.create(var1808)
	buffer.copy(buff_1, 0, buff, 0, var1808)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1808 = t_62.new()
	local var1809 = 0
	while var1809 < buffer.len(p62) do
		local _ = nil
		local var1810 = nil
		local var1811, var1812, var1813 = protoModule.readTag(p62, var1809)
		local var1814 = var1811
		var1810 = var1812
		var1809 = var1813
		
		if var1810 == protoModule.wireTypes.varint then
			local _ = nil
			local var1815, var1816 = protoModule.readVarInt(p62, var1809)
			local _ = var1815
			var1809 = var1816
			continue
		end
		if var1810 == protoModule.wireTypes.lengthDelimited then
			if var1814 == 1 then
				local _ = nil
				local var1817, var1818 = protoModule.readBuffer(p62, var1809)
				var1809 = var1818
				var1808.media_id = buffer.tostring(var1817)
			elseif var1814 == 2 then
				local _ = nil
				local var1819, var1820 = protoModule.readBuffer(p62, var1809)
				var1809 = var1820
				var1808.title = buffer.tostring(var1819)
			elseif var1814 == 3 then
				local _ = nil
				local var1821, var1822 = protoModule.readBuffer(p62, var1809)
				var1809 = var1822
				var1808.description = buffer.tostring(var1821)
			elseif var1814 == 4 then
				local _ = nil
				local var1823, var1824 = protoModule.readBuffer(p62, var1809)
				var1809 = var1824
				var1808.prompt_id = buffer.tostring(var1823)
			elseif var1814 == 5 then
				local _ = nil
				local var1825, var1826 = protoModule.readBuffer(p62, var1809)
				var1809 = var1826
				var1808.prompt_type = buffer.tostring(var1825)
			elseif var1814 == 6 then
				local _ = nil
				local var1827, var1828 = protoModule.readBuffer(p62, var1809)
				var1809 = var1828
				var1808.anchor_tag = buffer.tostring(var1827)
			else
				local _ = nil
				local var1829, var1830 = protoModule.readVarInt(p62, var1809)
				var1809 = var1830 + var1829
			end
		elseif var1810 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1831, var1832 = protoModule.readFixed32(p62, var1809)
			local _ = var1831
			var1809 = var1832
		elseif var1810 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1833, var1834 = protoModule.readFixed64(p62, var1809)
			local _ = var1833
			var1809 = var1834
		else
			error("Unsupported wire type: " .. var2739)
		end
	end
	return var1808
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
	local var1835 = t_62.new()
	
	if self.media_id ~= nil then
		var1835.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1835.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1835.title = self.title
	end
	if self.description ~= nil then
		var1835.description = self.description
	end
	if self.prompt_id ~= nil then
		var1835.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1835.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1835.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1835.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1835.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1835.anchor_tag = self.anchorTag
	end
	return var1835
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
	local var1835 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1836, var1837 = protoModule.writeTag(buff, var1835, 1, protoModule.wireTypes.lengthDelimited)
		var1836, var2769 = protoModule.writeString(var1836, var1837, self.prompt_id)
		buff = var1836
		var1835 = var1837
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1838, var1839 = protoModule.writeTag(buff, var1835, 2, protoModule.wireTypes.lengthDelimited)
		var1838, var2771 = protoModule.writeString(var1838, var1839, self.prompt_type)
		buff = var1838
		var1835 = var1839
	end
	local buff_1 = buffer.create(var1835)
	buffer.copy(buff_1, 0, buff, 0, var1835)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1835 = t_63.new()
	local var1836 = 0
	while var1836 < buffer.len(p63) do
		local _ = nil
		local var1837 = nil
		local var1838, var1839, var1840 = protoModule.readTag(p63, var1836)
		local var1841 = var1838
		var1837 = var1839
		var1836 = var1840
		
		if var1837 == protoModule.wireTypes.varint then
			local _ = nil
			local var1842, var1843 = protoModule.readVarInt(p63, var1836)
			local _ = var1842
			var1836 = var1843
			continue
		end
		if var1837 == protoModule.wireTypes.lengthDelimited then
			if var1841 == 1 then
				local _ = nil
				local var1844, var1845 = protoModule.readBuffer(p63, var1836)
				var1836 = var1845
				var1835.prompt_id = buffer.tostring(var1844)
			elseif var1841 == 2 then
				local _ = nil
				local var1846, var1847 = protoModule.readBuffer(p63, var1836)
				var1836 = var1847
				var1835.prompt_type = buffer.tostring(var1846)
			else
				local _ = nil
				local var1848, var1849 = protoModule.readVarInt(p63, var1836)
				var1836 = var1849 + var1848
			end
		elseif var1837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1850, var1851 = protoModule.readFixed32(p63, var1836)
			local _ = var1850
			var1836 = var1851
		elseif var1837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1852, var1853 = protoModule.readFixed64(p63, var1836)
			local _ = var1852
			var1836 = var1853
		else
			error("Unsupported wire type: " .. var2775)
		end
	end
	return var1835
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
	local var1854 = t_63.new()
	
	if self.prompt_id ~= nil then
		var1854.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1854.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1854.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1854.prompt_type = self.promptType
	end
	return var1854
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
	local var1854 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1855, var1856 = protoModule.writeTag(buff, var1854, 1, protoModule.wireTypes.lengthDelimited)
		var1855, var2797 = protoModule.writeString(var1855, var1856, self.upsell_prompt)
		buff = var1855
		var1854 = var1856
	end
	local buff_1 = buffer.create(var1854)
	buffer.copy(buff_1, 0, buff, 0, var1854)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1854 = t_64.new()
	local var1855 = 0
	while var1855 < buffer.len(p64) do
		local _ = nil
		local var1856 = nil
		local var1857, var1858, var1859 = protoModule.readTag(p64, var1855)
		local var1860 = var1857
		var1856 = var1858
		var1855 = var1859
		
		if var1856 == protoModule.wireTypes.varint then
			local _ = nil
			local var1861, var1862 = protoModule.readVarInt(p64, var1855)
			local _ = var1861
			var1855 = var1862
			continue
		end
		if var1856 == protoModule.wireTypes.lengthDelimited then
			if var1860 == 1 then
				local _ = nil
				local var1863, var1864 = protoModule.readBuffer(p64, var1855)
				var1855 = var1864
				var1854.upsell_prompt = buffer.tostring(var1863)
			else
				local _ = nil
				local var1865, var1866 = protoModule.readVarInt(p64, var1855)
				var1855 = var1866 + var1865
			end
		elseif var1856 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1867, var1868 = protoModule.readFixed32(p64, var1855)
			local _ = var1867
			var1855 = var1868
		elseif var1856 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1869, var1870 = protoModule.readFixed64(p64, var1855)
			local _ = var1869
			var1855 = var1870
		else
			error("Unsupported wire type: " .. var2801)
		end
	end
	return var1854
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
	local var1871 = t_64.new()
	
	if self.upsell_prompt ~= nil then
		var1871.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1871.upsell_prompt = self.upsellPrompt
	end
	return var1871
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
	local var1871 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1872, var1873 = protoModule.writeTag(buff, var1871, 1, protoModule.wireTypes.lengthDelimited)
		var1872, var2821 = protoModule.writeString(var1872, var1873, self.modal_variant)
		buff = var1872
		var1871 = var1873
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1874, var1875 = protoModule.writeTag(buff, var1871, 2, protoModule.wireTypes.lengthDelimited)
		var1874, var2823 = protoModule.writeString(var1874, var1875, self.modal_sequence)
		buff = var1874
		var1871 = var1875
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1876, var1877 = protoModule.writeTag(buff, var1871, 3, protoModule.wireTypes.lengthDelimited)
		var1876, var2825 = protoModule.writeString(var1876, var1877, self.conversation_id)
		buff = var1876
		var1871 = var1877
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1878, var1879 = protoModule.writeTag(buff, var1871, 4, protoModule.wireTypes.lengthDelimited)
		var1878, var2827 = protoModule.writeString(var1878, var1879, self.friend_id)
		buff = var1878
		var1871 = var1879
	end
	local buff_1 = buffer.create(var1871)
	buffer.copy(buff_1, 0, buff, 0, var1871)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1871 = t_65.new()
	local var1872 = 0
	while var1872 < buffer.len(p65) do
		local _ = nil
		local var1873 = nil
		local var1874, var1875, var1876 = protoModule.readTag(p65, var1872)
		local var1877 = var1874
		var1873 = var1875
		var1872 = var1876
		
		if var1873 == protoModule.wireTypes.varint then
			local _ = nil
			local var1878, var1879 = protoModule.readVarInt(p65, var1872)
			local _ = var1878
			var1872 = var1879
			continue
		end
		if var1873 == protoModule.wireTypes.lengthDelimited then
			if var1877 == 1 then
				local _ = nil
				local var1880, var1881 = protoModule.readBuffer(p65, var1872)
				var1872 = var1881
				var1871.modal_variant = buffer.tostring(var1880)
			elseif var1877 == 2 then
				local _ = nil
				local var1882, var1883 = protoModule.readBuffer(p65, var1872)
				var1872 = var1883
				var1871.modal_sequence = buffer.tostring(var1882)
			elseif var1877 == 3 then
				local _ = nil
				local var1884, var1885 = protoModule.readBuffer(p65, var1872)
				var1872 = var1885
				var1871.conversation_id = buffer.tostring(var1884)
			elseif var1877 == 4 then
				local _ = nil
				local var1886, var1887 = protoModule.readBuffer(p65, var1872)
				var1872 = var1887
				var1871.friend_id = buffer.tostring(var1886)
			else
				local _ = nil
				local var1888, var1889 = protoModule.readVarInt(p65, var1872)
				var1872 = var1889 + var1888
			end
		elseif var1873 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1890, var1891 = protoModule.readFixed32(p65, var1872)
			local _ = var1890
			var1872 = var1891
		elseif var1873 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1892, var1893 = protoModule.readFixed64(p65, var1872)
			local _ = var1892
			var1872 = var1893
		else
			error("Unsupported wire type: " .. var2831)
		end
	end
	return var1871
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
	local var1894 = t_65.new()
	
	if self.modal_variant ~= nil then
		var1894.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1894.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1894.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1894.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1894.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1894.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1894.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1894.friend_id = self.friendId
	end
	return var1894
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
	local var1894 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1895, var1896 = protoModule.writeTag(buff, var1894, 1, protoModule.wireTypes.lengthDelimited)
		var1895, var2857 = protoModule.writeString(var1895, var1896, self.event_id)
		buff = var1895
		var1894 = var1896
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1897, var1898 = protoModule.writeTag(buff, var1894, 2, protoModule.wireTypes.lengthDelimited)
		var1897, var2859 = protoModule.writeString(var1897, var1898, self.universe_id)
		buff = var1897
		var1894 = var1898
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1899, var1900 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1899, var2861 = protoModule.writeString(var1899, var1900, i)
			local var1901 = v:encode()
			var1900, var2863 = protoModule.writeTag(var1899, var1900, 2, protoModule.wireTypes.lengthDelimited)
			var1900, var2863 = protoModule.writeBuffer(var1900, var2863, var1901, buffer.len(var1901))
			local var1902 = var1900
			local var1903 = var2863
			local var1904, var1905 = protoModule.writeTag(buff, var1894, 3, protoModule.wireTypes.lengthDelimited)
			var1904, var2867 = protoModule.writeBuffer(var1904, var1905, var1902, var1903)
			buff = var1904
			var1894 = var1905
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1906, var1907 = protoModule.writeTag(buff, var1894, 4, protoModule.wireTypes.lengthDelimited)
			var1906, var2869 = protoModule.writeString(var1906, var1907, v)
			buff = var1906
			var1894 = var1907
		end
	end
	local buff_1 = buffer.create(var1894)
	buffer.copy(buff_1, 0, buff, 0, var1894)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1908 = t_66.new()
	local var1909 = 0
	while var1909 < buffer.len(p66) do
		local _ = nil
		local var1910 = nil
		local var1911, var1912, var1913 = protoModule.readTag(p66, var1909)
		local var1914 = var1911
		var1910 = var1912
		var1909 = var1913
		
		if var1910 == protoModule.wireTypes.varint then
			local _ = nil
			local var1915, var1916 = protoModule.readVarInt(p66, var1909)
			local _ = var1915
			var1909 = var1916
			continue
		end
		if var1910 == protoModule.wireTypes.lengthDelimited then
			if var1914 == 1 then
				local _ = nil
				local var1917, var1918 = protoModule.readBuffer(p66, var1909)
				var1909 = var1918
				var1908.event_id = buffer.tostring(var1917)
			elseif var1914 == 2 then
				local _ = nil
				local var1919, var1920 = protoModule.readBuffer(p66, var1909)
				var1909 = var1920
				var1908.universe_id = buffer.tostring(var1919)
			elseif var1914 == 3 then
				local _ = nil
				local var1921, var1922 = protoModule.readBuffer(p66, var1909)
				var1909 = var1922
				var1921 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1921)
				var1908.entry_map[var1921.key or ""] = var1921.value or t.FeedEntry.new()
			elseif var1914 == 4 then
				local _ = nil
				local var1923, var1924 = protoModule.readBuffer(p66, var1909)
				var1909 = var1924
				table.insert(var1908.entry_order, buffer.tostring(var1923))
			else
				local _ = nil
				local var1925, var1926 = protoModule.readVarInt(p66, var1909)
				var1909 = var1926 + var1925
			end
		elseif var1910 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1927, var1928 = protoModule.readFixed32(p66, var1909)
			local _ = var1927
			var1909 = var1928
		elseif var1910 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1929, var1930 = protoModule.readFixed64(p66, var1909)
			local _ = var1929
			var1909 = var1930
		else
			error("Unsupported wire type: " .. var2873)
		end
	end
	return var1908
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
	local var1931 = t_66.new()
	
	if self.event_id ~= nil then
		var1931.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1931.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1931.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1931.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1931.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1931.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1931.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1931.entry_order = t_1
	end
	return var1931
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
	local var1932 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1933, var1934 = protoModule.writeTag(buff, var1932, 1, protoModule.wireTypes.lengthDelimited)
		var1933, var2905 = protoModule.writeString(var1933, var1934, self.key)
		buff = var1933
		var1932 = var1934
	end
	if self.value ~= nil then
		local var1935 = self.value:encode()
		local var1936, var1937 = protoModule.writeTag(buff, var1932, 2, protoModule.wireTypes.lengthDelimited)
		var1936, var2908 = protoModule.writeBuffer(var1936, var1937, var1935, buffer.len(var1935))
		buff = var1936
		var1932 = var1937
	end
	local buff_1 = buffer.create(var1932)
	buffer.copy(buff_1, 0, buff, 0, var1932)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1932 = t_67.new()
	local var1933 = 0
	while var1933 < buffer.len(p67) do
		local _ = nil
		local var1934 = nil
		local var1935, var1936, var1937 = protoModule.readTag(p67, var1933)
		local var1938 = var1935
		var1934 = var1936
		var1933 = var1937
		
		if var1934 == protoModule.wireTypes.varint then
			local _ = nil
			local var1939, var1940 = protoModule.readVarInt(p67, var1933)
			local _ = var1939
			var1933 = var1940
			continue
		end
		if var1934 == protoModule.wireTypes.lengthDelimited then
			if var1938 == 1 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p67, var1933)
				var1933 = var1942
				var1932.key = buffer.tostring(var1941)
			elseif var1938 == 2 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p67, var1933)
				var1933 = var1944
				var1932.value = t.FeedEntry.decode(var1943)
			else
				local _ = nil
				local var1945, var1946 = protoModule.readVarInt(p67, var1933)
				var1933 = var1946 + var1945
			end
		elseif var1934 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1947, var1948 = protoModule.readFixed32(p67, var1933)
			local _ = var1947
			var1933 = var1948
		elseif var1934 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1949, var1950 = protoModule.readFixed64(p67, var1933)
			local _ = var1949
			var1933 = var1950
		else
			error("Unsupported wire type: " .. var2912)
		end
	end
	return var1932
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
	local var1951 = t_67.new()
	
	if self.key ~= nil then
		var1951.key = self.key
	end
	if self.value ~= nil then
		var1951.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1951
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
	local var1951 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1952, var1953 = protoModule.writeTag(buff, var1951, 1, protoModule.wireTypes.lengthDelimited)
		var1952, var2934 = protoModule.writeString(var1952, var1953, self.event_id)
		buff = var1952
		var1951 = var1953
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1954, var1955 = protoModule.writeTag(buff, var1951, 2, protoModule.wireTypes.lengthDelimited)
		var1954, var2936 = protoModule.writeString(var1954, var1955, self.universe_id)
		buff = var1954
		var1951 = var1955
	end
	local buff_1 = buffer.create(var1951)
	buffer.copy(buff_1, 0, buff, 0, var1951)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1951 = t_68.new()
	local var1952 = 0
	while var1952 < buffer.len(p68) do
		local _ = nil
		local var1953 = nil
		local var1954, var1955, var1956 = protoModule.readTag(p68, var1952)
		local var1957 = var1954
		var1953 = var1955
		var1952 = var1956
		
		if var1953 == protoModule.wireTypes.varint then
			local _ = nil
			local var1958, var1959 = protoModule.readVarInt(p68, var1952)
			local _ = var1958
			var1952 = var1959
			continue
		end
		if var1953 == protoModule.wireTypes.lengthDelimited then
			if var1957 == 1 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p68, var1952)
				var1952 = var1961
				var1951.event_id = buffer.tostring(var1960)
			elseif var1957 == 2 then
				local _ = nil
				local var1962, var1963 = protoModule.readBuffer(p68, var1952)
				var1952 = var1963
				var1951.universe_id = buffer.tostring(var1962)
			else
				local _ = nil
				local var1964, var1965 = protoModule.readVarInt(p68, var1952)
				var1952 = var1965 + var1964
			end
		elseif var1953 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1966, var1967 = protoModule.readFixed32(p68, var1952)
			local _ = var1966
			var1952 = var1967
		elseif var1953 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1968, var1969 = protoModule.readFixed64(p68, var1952)
			local _ = var1968
			var1952 = var1969
		else
			error("Unsupported wire type: " .. var2940)
		end
	end
	return var1951
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
	local var1970 = t_68.new()
	
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
	return var1970
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
	local var1970 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1971, var1972 = protoModule.writeTag(buff, var1970, 1, protoModule.wireTypes.lengthDelimited)
		var1971, var2962 = protoModule.writeString(var1971, var1972, self.event_id)
		buff = var1971
		var1970 = var1972
	end
	local buff_1 = buffer.create(var1970)
	buffer.copy(buff_1, 0, buff, 0, var1970)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1970 = t_69.new()
	local var1971 = 0
	while var1971 < buffer.len(p69) do
		local _ = nil
		local var1972 = nil
		local var1973, var1974, var1975 = protoModule.readTag(p69, var1971)
		local var1976 = var1973
		var1972 = var1974
		var1971 = var1975
		
		if var1972 == protoModule.wireTypes.varint then
			local _ = nil
			local var1977, var1978 = protoModule.readVarInt(p69, var1971)
			local _ = var1977
			var1971 = var1978
			continue
		end
		if var1972 == protoModule.wireTypes.lengthDelimited then
			if var1976 == 1 then
				local _ = nil
				local var1979, var1980 = protoModule.readBuffer(p69, var1971)
				var1971 = var1980
				var1970.event_id = buffer.tostring(var1979)
			else
				local _ = nil
				local var1981, var1982 = protoModule.readVarInt(p69, var1971)
				var1971 = var1982 + var1981
			end
		elseif var1972 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1983, var1984 = protoModule.readFixed32(p69, var1971)
			local _ = var1983
			var1971 = var1984
		elseif var1972 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1985, var1986 = protoModule.readFixed64(p69, var1971)
			local _ = var1985
			var1971 = var1986
		else
			error("Unsupported wire type: " .. var2966)
		end
	end
	return var1970
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
	local var1987 = t_69.new()
	
	if self.event_id ~= nil then
		var1987.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1987.event_id = self.eventId
	end
	return var1987
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
	local var1987 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1988, var1989 = protoModule.writeTag(buff, var1987, 1, protoModule.wireTypes.lengthDelimited)
		var1988, var2986 = protoModule.writeString(var1988, var1989, self.event_id)
		buff = var1988
		var1987 = var1989
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1990, var1991 = protoModule.writeTag(buff, var1987, 2, protoModule.wireTypes.lengthDelimited)
		var1990, var2988 = protoModule.writeString(var1990, var1991, self.universe_id)
		buff = var1990
		var1987 = var1991
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1992 = v:encode()
			local var1993, var1994 = protoModule.writeTag(buff, var1987, 3, protoModule.wireTypes.lengthDelimited)
			var1993, var2991 = protoModule.writeBuffer(var1993, var1994, var1992, buffer.len(var1992))
			buff = var1993
			var1987 = var1994
		end
	end
	local buff_1 = buffer.create(var1987)
	buffer.copy(buff_1, 0, buff, 0, var1987)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var1995 = t_70.new()
	local var1996 = 0
	while var1996 < buffer.len(p70) do
		local _ = nil
		local var1997 = nil
		local var1998, var1999, var2000 = protoModule.readTag(p70, var1996)
		local var2001 = var1998
		var1997 = var1999
		var1996 = var2000
		
		if var1997 == protoModule.wireTypes.varint then
			local _ = nil
			local var2002, var2003 = protoModule.readVarInt(p70, var1996)
			local _ = var2002
			var1996 = var2003
			continue
		end
		if var1997 == protoModule.wireTypes.lengthDelimited then
			if var2001 == 1 then
				local _ = nil
				local var2004, var2005 = protoModule.readBuffer(p70, var1996)
				var1996 = var2005
				var1995.event_id = buffer.tostring(var2004)
			elseif var2001 == 2 then
				local _ = nil
				local var2006, var2007 = protoModule.readBuffer(p70, var1996)
				var1996 = var2007
				var1995.universe_id = buffer.tostring(var2006)
			elseif var2001 == 3 then
				local _ = nil
				local var2008, var2009 = protoModule.readBuffer(p70, var1996)
				var1996 = var2009
				table.insert(var1995.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2008))
			else
				local _ = nil
				local var2010, var2011 = protoModule.readVarInt(p70, var1996)
				var1996 = var2011 + var2010
			end
		elseif var1997 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2012, var2013 = protoModule.readFixed32(p70, var1996)
			local _ = var2012
			var1996 = var2013
		elseif var1997 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2014, var2015 = protoModule.readFixed64(p70, var1996)
			local _ = var2014
			var1996 = var2015
		else
			error("Unsupported wire type: " .. var2995)
		end
	end
	return var1995
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
	local var2016 = t_70.new()
	
	if self.event_id ~= nil then
		var2016.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2016.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2016.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2016.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2016.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2016.rsvp_users = t_1
	end
	return var2016
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
	local var2017 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2018, var2019 = protoModule.writeTag(buff, var2017, 1, protoModule.wireTypes.varint)
		var2018, var3022 = protoModule.writeVarInt(var2018, var2019, self.user_id)
		buff = var2018
		var2017 = var2019
	end
	local buff_1 = buffer.create(var2017)
	buffer.copy(buff_1, 0, buff, 0, var2017)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2017 = t_71.new()
	local var2018 = 0
	while var2018 < buffer.len(p71) do
		local _ = nil
		local _ = nil
		local var2019, var2020, var2021 = protoModule.readTag(p71, var2018)
		local var2022 = var2019
		local var2023 = var2020
		var2018 = var2021
		
		if var2023 == protoModule.wireTypes.varint then
			if var2022 == 1 then
				local _ = nil
				local var2024, var2025 = protoModule.readVarIntI64(p71, var2018)
				var2018 = var2025
				var2017.user_id = var2024
			else
				local _ = nil
				local var2026, var2027 = protoModule.readVarInt(p71, var2018)
				local _ = var2026
				var2018 = var2027
			end
		elseif var2023 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2028, var2029 = protoModule.readVarInt(p71, var2018)
			var2018 = var2029 + var2028
		elseif var2023 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2030, var2031 = protoModule.readFixed32(p71, var2018)
			local _ = var2030
			var2018 = var2031
		elseif var2023 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2032, var2033 = protoModule.readFixed64(p71, var2018)
			local _ = var2032
			var2018 = var2033
		else
			error("Unsupported wire type: " .. var3030)
		end
	end
	return var2017
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
	local var2034 = t_71.new()
	
	if self.user_id ~= nil then
		var2034.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2034.user_id = self.userId
	end
	return var2034
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
	local var2034 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2035, var2036 = protoModule.writeTag(buff, var2034, 1, protoModule.wireTypes.lengthDelimited)
		var2035, var3046 = protoModule.writeString(var2035, var2036, self.event_id)
		buff = var2035
		var2034 = var2036
	end
	local buff_1 = buffer.create(var2034)
	buffer.copy(buff_1, 0, buff, 0, var2034)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2034 = t_72.new()
	local var2035 = 0
	while var2035 < buffer.len(p72) do
		local _ = nil
		local var2036 = nil
		local var2037, var2038, var2039 = protoModule.readTag(p72, var2035)
		local var2040 = var2037
		var2036 = var2038
		var2035 = var2039
		
		if var2036 == protoModule.wireTypes.varint then
			local _ = nil
			local var2041, var2042 = protoModule.readVarInt(p72, var2035)
			local _ = var2041
			var2035 = var2042
			continue
		end
		if var2036 == protoModule.wireTypes.lengthDelimited then
			if var2040 == 1 then
				local _ = nil
				local var2043, var2044 = protoModule.readBuffer(p72, var2035)
				var2035 = var2044
				var2034.event_id = buffer.tostring(var2043)
			else
				local _ = nil
				local var2045, var2046 = protoModule.readVarInt(p72, var2035)
				var2035 = var2046 + var2045
			end
		elseif var2036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2047, var2048 = protoModule.readFixed32(p72, var2035)
			local _ = var2047
			var2035 = var2048
		elseif var2036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2049, var2050 = protoModule.readFixed64(p72, var2035)
			local _ = var2049
			var2035 = var2050
		else
			error("Unsupported wire type: " .. var3050)
		end
	end
	return var2034
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
	local var2051 = t_72.new()
	
	if self.event_id ~= nil then
		var2051.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2051.event_id = self.eventId
	end
	return var2051
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
	local var2051 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2052, var2053 = protoModule.writeTag(buff, var2051, 1, protoModule.wireTypes.lengthDelimited)
		var2052, var3070 = protoModule.writeString(var2052, var2053, self.event_id)
		buff = var2052
		var2051 = var2053
	end
	local buff_1 = buffer.create(var2051)
	buffer.copy(buff_1, 0, buff, 0, var2051)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2051 = t_73.new()
	local var2052 = 0
	while var2052 < buffer.len(p73) do
		local _ = nil
		local var2053 = nil
		local var2054, var2055, var2056 = protoModule.readTag(p73, var2052)
		local var2057 = var2054
		var2053 = var2055
		var2052 = var2056
		
		if var2053 == protoModule.wireTypes.varint then
			local _ = nil
			local var2058, var2059 = protoModule.readVarInt(p73, var2052)
			local _ = var2058
			var2052 = var2059
			continue
		end
		if var2053 == protoModule.wireTypes.lengthDelimited then
			if var2057 == 1 then
				local _ = nil
				local var2060, var2061 = protoModule.readBuffer(p73, var2052)
				var2052 = var2061
				var2051.event_id = buffer.tostring(var2060)
			else
				local _ = nil
				local var2062, var2063 = protoModule.readVarInt(p73, var2052)
				var2052 = var2063 + var2062
			end
		elseif var2053 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2064, var2065 = protoModule.readFixed32(p73, var2052)
			local _ = var2064
			var2052 = var2065
		elseif var2053 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2066, var2067 = protoModule.readFixed64(p73, var2052)
			local _ = var2066
			var2052 = var2067
		else
			error("Unsupported wire type: " .. var3074)
		end
	end
	return var2051
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
	local var2068 = t_73.new()
	
	if self.event_id ~= nil then
		var2068.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2068.event_id = self.eventId
	end
	return var2068
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
	local var2068 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2069, var2070 = protoModule.writeTag(buff, var2068, 1, protoModule.wireTypes.lengthDelimited)
		var2069, var3094 = protoModule.writeString(var2069, var2070, self.event_id)
		buff = var2069
		var2068 = var2070
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2071, var2072 = protoModule.writeTag(buff, var2068, 2, protoModule.wireTypes.lengthDelimited)
		var2071, var3096 = protoModule.writeString(var2071, var2072, self.universe_id)
		buff = var2071
		var2068 = var2072
	end
	local buff_1 = buffer.create(var2068)
	buffer.copy(buff_1, 0, buff, 0, var2068)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref)
	local var2068 = t_74.new()
	local var2069 = 0
	while var2069 < buffer.len(p74) do
		local _ = nil
		local var2070 = nil
		local var2071, var2072, var2073 = protoModule.readTag(p74, var2069)
		local var2074 = var2071
		var2070 = var2072
		var2069 = var2073
		
		if var2070 == protoModule.wireTypes.varint then
			local _ = nil
			local var2075, var2076 = protoModule.readVarInt(p74, var2069)
			local _ = var2075
			var2069 = var2076
			continue
		end
		if var2070 == protoModule.wireTypes.lengthDelimited then
			if var2074 == 1 then
				local _ = nil
				local var2077, var2078 = protoModule.readBuffer(p74, var2069)
				var2069 = var2078
				var2068.event_id = buffer.tostring(var2077)
			elseif var2074 == 2 then
				local _ = nil
				local var2079, var2080 = protoModule.readBuffer(p74, var2069)
				var2069 = var2080
				var2068.universe_id = buffer.tostring(var2079)
			else
				local _ = nil
				local var2081, var2082 = protoModule.readVarInt(p74, var2069)
				var2069 = var2082 + var2081
			end
		elseif var2070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2083, var2084 = protoModule.readFixed32(p74, var2069)
			local _ = var2083
			var2069 = var2084
		elseif var2070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2085, var2086 = protoModule.readFixed64(p74, var2069)
			local _ = var2085
			var2069 = var2086
		else
			error("Unsupported wire type: " .. var3100)
		end
	end
	return var2068
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
	local var2087 = t_74.new()
	
	if self.event_id ~= nil then
		var2087.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2087.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2087.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2087.universe_id = self.universeId
	end
	return var2087
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
	local var2087 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2088, var2089 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2088, var3122 = protoModule.writeString(var2088, var2089, i)
			local var2090 = v:encode()
			var2089, var3124 = protoModule.writeTag(var2088, var2089, 2, protoModule.wireTypes.lengthDelimited)
			var2089, var3124 = protoModule.writeBuffer(var2089, var3124, var2090, buffer.len(var2090))
			local var2091 = var2089
			local var2092 = var3124
			local var2093, var2094 = protoModule.writeTag(buff, var2087, 1, protoModule.wireTypes.lengthDelimited)
			var2093, var3128 = protoModule.writeBuffer(var2093, var2094, var2091, var2092)
			buff = var2093
			var2087 = var2094
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2095, var2096 = protoModule.writeTag(buff, var2087, 2, protoModule.wireTypes.lengthDelimited)
			var2095, var3130 = protoModule.writeString(var2095, var2096, v)
			buff = var2095
			var2087 = var2096
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2097, var2098 = protoModule.writeTag(buff, var2087, 3, protoModule.wireTypes.lengthDelimited)
		var2097, var3132 = protoModule.writeString(var2097, var2098, self.next_page_token)
		buff = var2097
		var2087 = var2098
	end
	if self.sticky_filter_pills ~= nil then
		local var2099 = self.sticky_filter_pills:encode()
		local var2100, var2101 = protoModule.writeTag(buff, var2087, 4, protoModule.wireTypes.lengthDelimited)
		var2100, var3135 = protoModule.writeBuffer(var2100, var2101, var2099, buffer.len(var2099))
		buff = var2100
		var2087 = var2101
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2102, var2103 = protoModule.writeTag(buff, var2087, 5, protoModule.wireTypes.lengthDelimited)
		var2102, var3137 = protoModule.writeString(var2102, var2103, self.applied_filters)
		buff = var2102
		var2087 = var2103
	end
	local buff_1 = buffer.create(var2087)
	buffer.copy(buff_1, 0, buff, 0, var2087)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2104 = t_75.new()
	local var2105 = 0
	while var2105 < buffer.len(p75) do
		local _ = nil
		local var2106 = nil
		local var2107, var2108, var2109 = protoModule.readTag(p75, var2105)
		local var2110 = var2107
		var2106 = var2108
		var2105 = var2109
		
		if var2106 == protoModule.wireTypes.varint then
			local _ = nil
			local var2111, var2112 = protoModule.readVarInt(p75, var2105)
			local _ = var2111
			var2105 = var2112
			continue
		end
		if var2106 == protoModule.wireTypes.lengthDelimited then
			if var2110 == 1 then
				local _ = nil
				local var2113, var2114 = protoModule.readBuffer(p75, var2105)
				var2105 = var2114
				var2113 = t.ChartsFeedInputData_EntryMapEntry.decode(var2113)
				var2104.entry_map[var2113.key or ""] = var2113.value or t.FeedEntry.new()
			elseif var2110 == 2 then
				local _ = nil
				local var2115, var2116 = protoModule.readBuffer(p75, var2105)
				var2105 = var2116
				table.insert(var2104.entry_order, buffer.tostring(var2115))
			elseif var2110 == 3 then
				local _ = nil
				local var2117, var2118 = protoModule.readBuffer(p75, var2105)
				var2105 = var2118
				var2104.next_page_token = buffer.tostring(var2117)
			elseif var2110 == 4 then
				local _ = nil
				local var2119, var2120 = protoModule.readBuffer(p75, var2105)
				var2105 = var2120
				var2104.sticky_filter_pills = t.FilterPillsInputData.decode(var2119)
			elseif var2110 == 5 then
				local _ = nil
				local var2121, var2122 = protoModule.readBuffer(p75, var2105)
				var2105 = var2122
				var2104.applied_filters = buffer.tostring(var2121)
			else
				local _ = nil
				local var2123, var2124 = protoModule.readVarInt(p75, var2105)
				var2105 = var2124 + var2123
			end
		elseif var2106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2125, var2126 = protoModule.readFixed32(p75, var2105)
			local _ = var2125
			var2105 = var2126
		elseif var2106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2127, var2128 = protoModule.readFixed64(p75, var2105)
			local _ = var2127
			var2105 = var2128
		else
			error("Unsupported wire type: " .. var3141)
		end
	end
	return var2104
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
	local var2129 = t_75.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2129.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2129.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2129.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2129.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2129.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2129.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2129.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2129.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2129.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2129.applied_filters = self.appliedFilters
	end
	return var2129
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
	local var2130 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2131, var2132 = protoModule.writeTag(buff, var2130, 1, protoModule.wireTypes.lengthDelimited)
		var2131, var3175 = protoModule.writeString(var2131, var2132, self.key)
		buff = var2131
		var2130 = var2132
	end
	if self.value ~= nil then
		local var2133 = self.value:encode()
		local var2134, var2135 = protoModule.writeTag(buff, var2130, 2, protoModule.wireTypes.lengthDelimited)
		var2134, var3178 = protoModule.writeBuffer(var2134, var2135, var2133, buffer.len(var2133))
		buff = var2134
		var2130 = var2135
	end
	local buff_1 = buffer.create(var2130)
	buffer.copy(buff_1, 0, buff, 0, var2130)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2130 = t_76.new()
	local var2131 = 0
	while var2131 < buffer.len(p76) do
		local _ = nil
		local var2132 = nil
		local var2133, var2134, var2135 = protoModule.readTag(p76, var2131)
		local var2136 = var2133
		var2132 = var2134
		var2131 = var2135
		
		if var2132 == protoModule.wireTypes.varint then
			local _ = nil
			local var2137, var2138 = protoModule.readVarInt(p76, var2131)
			local _ = var2137
			var2131 = var2138
			continue
		end
		if var2132 == protoModule.wireTypes.lengthDelimited then
			if var2136 == 1 then
				local _ = nil
				local var2139, var2140 = protoModule.readBuffer(p76, var2131)
				var2131 = var2140
				var2130.key = buffer.tostring(var2139)
			elseif var2136 == 2 then
				local _ = nil
				local var2141, var2142 = protoModule.readBuffer(p76, var2131)
				var2131 = var2142
				var2130.value = t.FeedEntry.decode(var2141)
			else
				local _ = nil
				local var2143, var2144 = protoModule.readVarInt(p76, var2131)
				var2131 = var2144 + var2143
			end
		elseif var2132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2145, var2146 = protoModule.readFixed32(p76, var2131)
			local _ = var2145
			var2131 = var2146
		elseif var2132 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2147, var2148 = protoModule.readFixed64(p76, var2131)
			local _ = var2147
			var2131 = var2148
		else
			error("Unsupported wire type: " .. var3182)
		end
	end
	return var2130
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
	local var2149 = t_76.new()
	
	if self.key ~= nil then
		var2149.key = self.key
	end
	if self.value ~= nil then
		var2149.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2149
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
	local var2149 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2150 = v:encode()
			local var2151, var2152 = protoModule.writeTag(buff, var2149, 1, protoModule.wireTypes.lengthDelimited)
			var2151, var3205 = protoModule.writeBuffer(var2151, var2152, var2150, buffer.len(var2150))
			buff = var2151
			var2149 = var2152
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2153, var2154 = protoModule.writeTag(buff, var2149, 2, protoModule.wireTypes.lengthDelimited)
		var2153, var3207 = protoModule.writeString(var2153, var2154, self.sort_id)
		buff = var2153
		var2149 = var2154
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2155, var2156 = protoModule.writeTag(buff, var2149, 3, protoModule.wireTypes.varint)
		var2155, var3209 = protoModule.writeVarInt(var2155, var2156, self.secondary_sort_id)
		buff = var2155
		var2149 = var2156
	end
	if self.title ~= nil and self.title ~= "" then
		local var2157, var2158 = protoModule.writeTag(buff, var2149, 4, protoModule.wireTypes.lengthDelimited)
		var2157, var3211 = protoModule.writeString(var2157, var2158, self.title)
		buff = var2157
		var2149 = var2158
	end
	if self.primary_sort_id ~= nil then
		local var2159, var2160 = protoModule.writeTag(buff, var2149, 5, protoModule.wireTypes.varint)
		var2159, var3213 = protoModule.writeVarInt(var2159, var2160, self.primary_sort_id)
		buff = var2159
		var2149 = var2160
	end
	if self.applied_filters ~= nil then
		local var2161, var2162 = protoModule.writeTag(buff, var2149, 6, protoModule.wireTypes.lengthDelimited)
		var2161, var3215 = protoModule.writeString(var2161, var2162, self.applied_filters)
		buff = var2161
		var2149 = var2162
	end
	local buff_1 = buffer.create(var2149)
	buffer.copy(buff_1, 0, buff, 0, var2149)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2163 = t_77.new()
	local var2164 = 0
	while var2164 < buffer.len(p77) do
		local _ = nil
		local var2165 = nil
		local var2166, var2167, var2168 = protoModule.readTag(p77, var2164)
		local var2169 = var2166
		var2165 = var2167
		var2164 = var2168
		
		if var2165 == protoModule.wireTypes.varint then
			if var2169 == 3 then
				local _ = nil
				local var2170, var2171 = protoModule.readVarIntI32(p77, var2164)
				var2164 = var2171
				var2163.secondary_sort_id = var2170
			elseif var2169 == 5 then
				local _ = nil
				local var2172, var2173 = protoModule.readVarIntI32(p77, var2164)
				var2164 = var2173
				var2163.primary_sort_id = var2172
			else
				local _ = nil
				local var2174, var2175 = protoModule.readVarInt(p77, var2164)
				local _ = var2174
				var2164 = var2175
			end
		end
		if var2165 == protoModule.wireTypes.lengthDelimited then
			if var2169 == 1 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p77, var2164)
				var2164 = var2177
				table.insert(var2163.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2176))
			elseif var2169 == 2 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p77, var2164)
				var2164 = var2179
				var2163.sort_id = buffer.tostring(var2178)
			elseif var2169 == 4 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p77, var2164)
				var2164 = var2181
				var2163.title = buffer.tostring(var2180)
			elseif var2169 == 6 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p77, var2164)
				var2164 = var2183
				var2163.applied_filters = buffer.tostring(var2182)
			else
				local _ = nil
				local var2184, var2185 = protoModule.readVarInt(p77, var2164)
				var2164 = var2185 + var2184
			end
		elseif var2165 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2186, var2187 = protoModule.readFixed32(p77, var2164)
			local _ = var2186
			var2164 = var2187
		elseif var2165 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2188, var2189 = protoModule.readFixed64(p77, var2164)
			local _ = var2188
			var2164 = var2189
		else
			error("Unsupported wire type: " .. var3219)
		end
	end
	return var2163
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
	local var2190 = t_77.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2190.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2190.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2190.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2190.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2190.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2190.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2190.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2190.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2190.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2190.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2190.applied_filters = self.appliedFilters
	end
	return var2190
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
	local var2191 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2192, var2193 = protoModule.writeTag(buff, var2191, 1, protoModule.wireTypes.lengthDelimited)
		var2192, var3252 = protoModule.writeString(var2192, var2193, self.filter_id)
		buff = var2192
		var2191 = var2193
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2194, var2195 = protoModule.writeTag(buff, var2191, 2, protoModule.wireTypes.lengthDelimited)
		var2194, var3254 = protoModule.writeString(var2194, var2195, self.display_name)
		buff = var2194
		var2191 = var2195
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2196 = v:encode()
			local var2197, var2198 = protoModule.writeTag(buff, var2191, 3, protoModule.wireTypes.lengthDelimited)
			var2197, var3257 = protoModule.writeBuffer(var2197, var2198, var2196, buffer.len(var2196))
			buff = var2197
			var2191 = var2198
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2199, var2200 = protoModule.writeTag(buff, var2191, 4, protoModule.wireTypes.lengthDelimited)
		var2199, var3259 = protoModule.writeString(var2199, var2200, self.default_option_id)
		buff = var2199
		var2191 = var2200
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2201, var2202 = protoModule.writeTag(buff, var2191, 5, protoModule.wireTypes.lengthDelimited)
		var2201, var3261 = protoModule.writeString(var2201, var2202, self.selected_option_id)
		buff = var2201
		var2191 = var2202
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2203, var2204 = protoModule.writeTag(buff, var2191, 6, protoModule.wireTypes.lengthDelimited)
		var2203, var3263 = protoModule.writeString(var2203, var2204, self.filter_type)
		buff = var2203
		var2191 = var2204
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2205, var2206 = protoModule.writeTag(buff, var2191, 7, protoModule.wireTypes.lengthDelimited)
			var2205, var3265 = protoModule.writeString(var2205, var2206, v)
			buff = var2205
			var2191 = var2206
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2207, var2208 = protoModule.writeTag(buff, var2191, 8, protoModule.wireTypes.lengthDelimited)
		var2207, var3267 = protoModule.writeString(var2207, var2208, self.info_text)
		buff = var2207
		var2191 = var2208
	end
	local buff_1 = buffer.create(var2191)
	buffer.copy(buff_1, 0, buff, 0, var2191)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2209 = t_78.new()
	local var2210 = 0
	while var2210 < buffer.len(p78) do
		local _ = nil
		local var2211 = nil
		local var2212, var2213, var2214 = protoModule.readTag(p78, var2210)
		local var2215 = var2212
		var2211 = var2213
		var2210 = var2214
		
		if var2211 == protoModule.wireTypes.varint then
			local _ = nil
			local var2216, var2217 = protoModule.readVarInt(p78, var2210)
			local _ = var2216
			var2210 = var2217
			continue
		end
		if var2211 == protoModule.wireTypes.lengthDelimited then
			if var2215 == 1 then
				local _ = nil
				local var2218, var2219 = protoModule.readBuffer(p78, var2210)
				var2210 = var2219
				var2209.filter_id = buffer.tostring(var2218)
			elseif var2215 == 2 then
				local _ = nil
				local var2220, var2221 = protoModule.readBuffer(p78, var2210)
				var2210 = var2221
				var2209.display_name = buffer.tostring(var2220)
			elseif var2215 == 3 then
				local _ = nil
				local var2222, var2223 = protoModule.readBuffer(p78, var2210)
				var2210 = var2223
				table.insert(var2209.options, t.FilterPillsInputData_FilterOption.decode(var2222))
			elseif var2215 == 4 then
				local _ = nil
				local var2224, var2225 = protoModule.readBuffer(p78, var2210)
				var2210 = var2225
				var2209.default_option_id = buffer.tostring(var2224)
			elseif var2215 == 5 then
				local _ = nil
				local var2226, var2227 = protoModule.readBuffer(p78, var2210)
				var2210 = var2227
				var2209.selected_option_id = buffer.tostring(var2226)
			elseif var2215 == 6 then
				local _ = nil
				local var2228, var2229 = protoModule.readBuffer(p78, var2210)
				var2210 = var2229
				var2209.filter_type = buffer.tostring(var2228)
			elseif var2215 == 7 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p78, var2210)
				var2210 = var2231
				table.insert(var2209.inactive_option_ids, buffer.tostring(var2230))
			elseif var2215 == 8 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p78, var2210)
				var2210 = var2233
				var2209.info_text = buffer.tostring(var2232)
			else
				local _ = nil
				local var2234, var2235 = protoModule.readVarInt(p78, var2210)
				var2210 = var2235 + var2234
			end
		elseif var2211 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2236, var2237 = protoModule.readFixed32(p78, var2210)
			local _ = var2236
			var2210 = var2237
		elseif var2211 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2238, var2239 = protoModule.readFixed64(p78, var2210)
			local _ = var2238
			var2210 = var2239
		else
			error("Unsupported wire type: " .. var3271)
		end
	end
	return var2209
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
	local var2240 = t_78.new()
	
	if self.filter_id ~= nil then
		var2240.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2240.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2240.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2240.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2240.options = t_1
	end
	if self.default_option_id ~= nil then
		var2240.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2240.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2240.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2240.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2240.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2240.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2240.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2240.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2240.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2240.info_text = self.infoText
	end
	return var2240
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
	local var2241 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2242, var2243 = protoModule.writeTag(buff, var2241, 1, protoModule.wireTypes.lengthDelimited)
		var2242, var3310 = protoModule.writeString(var2242, var2243, self.option_id)
		buff = var2242
		var2241 = var2243
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2244, var2245 = protoModule.writeTag(buff, var2241, 2, protoModule.wireTypes.lengthDelimited)
		var2244, var3312 = protoModule.writeString(var2244, var2245, self.display_name)
		buff = var2244
		var2241 = var2245
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2246, var2247 = protoModule.writeTag(buff, var2241, 3, protoModule.wireTypes.lengthDelimited)
		var2246, var3314 = protoModule.writeString(var2246, var2247, self.option_context_tag)
		buff = var2246
		var2241 = var2247
	end
	local buff_1 = buffer.create(var2241)
	buffer.copy(buff_1, 0, buff, 0, var2241)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref)
	local var2241 = t_79.new()
	local var2242 = 0
	while var2242 < buffer.len(p79) do
		local _ = nil
		local var2243 = nil
		local var2244, var2245, var2246 = protoModule.readTag(p79, var2242)
		local var2247 = var2244
		var2243 = var2245
		var2242 = var2246
		
		if var2243 == protoModule.wireTypes.varint then
			local _ = nil
			local var2248, var2249 = protoModule.readVarInt(p79, var2242)
			local _ = var2248
			var2242 = var2249
			continue
		end
		if var2243 == protoModule.wireTypes.lengthDelimited then
			if var2247 == 1 then
				local _ = nil
				local var2250, var2251 = protoModule.readBuffer(p79, var2242)
				var2242 = var2251
				var2241.option_id = buffer.tostring(var2250)
			elseif var2247 == 2 then
				local _ = nil
				local var2252, var2253 = protoModule.readBuffer(p79, var2242)
				var2242 = var2253
				var2241.display_name = buffer.tostring(var2252)
			elseif var2247 == 3 then
				local _ = nil
				local var2254, var2255 = protoModule.readBuffer(p79, var2242)
				var2242 = var2255
				var2241.option_context_tag = buffer.tostring(var2254)
			else
				local _ = nil
				local var2256, var2257 = protoModule.readVarInt(p79, var2242)
				var2242 = var2257 + var2256
			end
		elseif var2243 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2258, var2259 = protoModule.readFixed32(p79, var2242)
			local _ = var2258
			var2242 = var2259
		elseif var2243 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2260, var2261 = protoModule.readFixed64(p79, var2242)
			local _ = var2260
			var2242 = var2261
		else
			error("Unsupported wire type: " .. var3318)
		end
	end
	return var2241
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
	local var2262 = t_79.new()
	
	if self.option_id ~= nil then
		var2262.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2262.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2262.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2262.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2262.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2262.option_context_tag = self.optionContextTag
	end
	return var2262
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
	local var2262 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2263 = v:encode()
			local var2264, var2265 = protoModule.writeTag(buff, var2262, 1, protoModule.wireTypes.lengthDelimited)
			var2264, var3343 = protoModule.writeBuffer(var2264, var2265, var2263, buffer.len(var2263))
			buff = var2264
			var2262 = var2265
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2266, var2267 = protoModule.writeTag(buff, var2262, 2, protoModule.wireTypes.lengthDelimited)
		var2266, var3345 = protoModule.writeString(var2266, var2267, self.selected_sort_id)
		buff = var2266
		var2262 = var2267
	end
	local buff_1 = buffer.create(var2262)
	buffer.copy(buff_1, 0, buff, 0, var2262)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2268 = t_80.new()
	local var2269 = 0
	while var2269 < buffer.len(p80) do
		local _ = nil
		local var2270 = nil
		local var2271, var2272, var2273 = protoModule.readTag(p80, var2269)
		local var2274 = var2271
		var2270 = var2272
		var2269 = var2273
		
		if var2270 == protoModule.wireTypes.varint then
			local _ = nil
			local var2275, var2276 = protoModule.readVarInt(p80, var2269)
			local _ = var2275
			var2269 = var2276
			continue
		end
		if var2270 == protoModule.wireTypes.lengthDelimited then
			if var2274 == 1 then
				local _ = nil
				local var2277, var2278 = protoModule.readBuffer(p80, var2269)
				var2269 = var2278
				table.insert(var2268.sort_options, t.SortSelectorInputData_SortOption.decode(var2277))
			elseif var2274 == 2 then
				local _ = nil
				local var2279, var2280 = protoModule.readBuffer(p80, var2269)
				var2269 = var2280
				var2268.selected_sort_id = buffer.tostring(var2279)
			else
				local _ = nil
				local var2281, var2282 = protoModule.readVarInt(p80, var2269)
				var2269 = var2282 + var2281
			end
		elseif var2270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2283, var2284 = protoModule.readFixed32(p80, var2269)
			local _ = var2283
			var2269 = var2284
		elseif var2270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2285, var2286 = protoModule.readFixed64(p80, var2269)
			local _ = var2285
			var2269 = var2286
		else
			error("Unsupported wire type: " .. var3349)
		end
	end
	return var2268
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
	local var2287 = t_80.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2287.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2287.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2287.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2287.selected_sort_id = self.selectedSortId
	end
	return var2287
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
	local var2288 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2289, var2290 = protoModule.writeTag(buff, var2288, 1, protoModule.wireTypes.lengthDelimited)
		var2289, var3374 = protoModule.writeString(var2289, var2290, self.sort_id)
		buff = var2289
		var2288 = var2290
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2291, var2292 = protoModule.writeTag(buff, var2288, 2, protoModule.wireTypes.lengthDelimited)
		var2291, var3376 = protoModule.writeString(var2291, var2292, self.display_name)
		buff = var2291
		var2288 = var2292
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2293, var2294 = protoModule.writeTag(buff, var2288, 3, protoModule.wireTypes.lengthDelimited)
		var2293, var3378 = protoModule.writeString(var2293, var2294, self.content_type)
		buff = var2293
		var2288 = var2294
	end
	local buff_1 = buffer.create(var2288)
	buffer.copy(buff_1, 0, buff, 0, var2288)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref)
	local var2288 = t_81.new()
	local var2289 = 0
	while var2289 < buffer.len(p81) do
		local _ = nil
		local var2290 = nil
		local var2291, var2292, var2293 = protoModule.readTag(p81, var2289)
		local var2294 = var2291
		var2290 = var2292
		var2289 = var2293
		
		if var2290 == protoModule.wireTypes.varint then
			local _ = nil
			local var2295, var2296 = protoModule.readVarInt(p81, var2289)
			local _ = var2295
			var2289 = var2296
			continue
		end
		if var2290 == protoModule.wireTypes.lengthDelimited then
			if var2294 == 1 then
				local _ = nil
				local var2297, var2298 = protoModule.readBuffer(p81, var2289)
				var2289 = var2298
				var2288.sort_id = buffer.tostring(var2297)
			elseif var2294 == 2 then
				local _ = nil
				local var2299, var2300 = protoModule.readBuffer(p81, var2289)
				var2289 = var2300
				var2288.display_name = buffer.tostring(var2299)
			elseif var2294 == 3 then
				local _ = nil
				local var2301, var2302 = protoModule.readBuffer(p81, var2289)
				var2289 = var2302
				var2288.content_type = buffer.tostring(var2301)
			else
				local _ = nil
				local var2303, var2304 = protoModule.readVarInt(p81, var2289)
				var2289 = var2304 + var2303
			end
		elseif var2290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2305, var2306 = protoModule.readFixed32(p81, var2289)
			local _ = var2305
			var2289 = var2306
		elseif var2290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2307, var2308 = protoModule.readFixed64(p81, var2289)
			local _ = var2307
			var2289 = var2308
		else
			error("Unsupported wire type: " .. var3382)
		end
	end
	return var2288
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
	local var2309 = t_81.new()
	
	if self.sort_id ~= nil then
		var2309.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2309.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2309.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2309.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2309.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2309.content_type = self.contentType
	end
	return var2309
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
	local var2309 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2310, var2311 = protoModule.writeTag(buff, var2309, 1, protoModule.wireTypes.lengthDelimited)
		var2310, var3406 = protoModule.writeString(var2310, var2311, self.selected_option)
		buff = var2310
		var2309 = var2311
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2312 = v:encode()
			local var2313, var2314 = protoModule.writeTag(buff, var2309, 2, protoModule.wireTypes.lengthDelimited)
			var2313, var3409 = protoModule.writeBuffer(var2313, var2314, var2312, buffer.len(var2312))
			buff = var2313
			var2309 = var2314
		end
	end
	if self.experience_carousel ~= nil then
		local var2315 = self.experience_carousel:encode()
		local var2316, var2317 = protoModule.writeTag(buff, var2309, 3, protoModule.wireTypes.lengthDelimited)
		var2316, var3412 = protoModule.writeBuffer(var2316, var2317, var2315, buffer.len(var2315))
		buff = var2316
		var2309 = var2317
	end
	local buff_1 = buffer.create(var2309)
	buffer.copy(buff_1, 0, buff, 0, var2309)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2318 = t_82.new()
	local var2319 = 0
	while var2319 < buffer.len(p82) do
		local _ = nil
		local var2320 = nil
		local var2321, var2322, var2323 = protoModule.readTag(p82, var2319)
		local var2324 = var2321
		var2320 = var2322
		var2319 = var2323
		
		if var2320 == protoModule.wireTypes.varint then
			local _ = nil
			local var2325, var2326 = protoModule.readVarInt(p82, var2319)
			local _ = var2325
			var2319 = var2326
			continue
		end
		if var2320 == protoModule.wireTypes.lengthDelimited then
			if var2324 == 1 then
				local _ = nil
				local var2327, var2328 = protoModule.readBuffer(p82, var2319)
				var2319 = var2328
				var2318.selected_option = buffer.tostring(var2327)
			elseif var2324 == 2 then
				local _ = nil
				local var2329, var2330 = protoModule.readBuffer(p82, var2319)
				var2319 = var2330
				table.insert(var2318.options, t.SelectorOption.decode(var2329))
			elseif var2324 == 3 then
				local _ = nil
				local var2331, var2332 = protoModule.readBuffer(p82, var2319)
				var2319 = var2332
				var2318.experience_carousel = t.ExperienceCarouselInputData.decode(var2331)
			else
				local _ = nil
				local var2333, var2334 = protoModule.readVarInt(p82, var2319)
				var2319 = var2334 + var2333
			end
		elseif var2320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2335, var2336 = protoModule.readFixed32(p82, var2319)
			local _ = var2335
			var2319 = var2336
		elseif var2320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2337, var2338 = protoModule.readFixed64(p82, var2319)
			local _ = var2337
			var2319 = var2338
		else
			error("Unsupported wire type: " .. var3416)
		end
	end
	return var2318
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
	local var2339 = t_82.new()
	
	if self.selected_option ~= nil then
		var2339.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2339.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2339.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2339.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2339.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2339
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
	local var2340 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2341, var2342 = protoModule.writeTag(buff, var2340, 1, protoModule.wireTypes.lengthDelimited)
		var2341, var3442 = protoModule.writeString(var2341, var2342, self.id)
		buff = var2341
		var2340 = var2342
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2343, var2344 = protoModule.writeTag(buff, var2340, 4, protoModule.wireTypes.varint)
		var2343, var3444 = protoModule.writeVarInt(var2343, var2344, self.preview_rows)
		buff = var2343
		var2340 = var2344
	end
	if self.widget_style ~= nil then
		local var2345 = self.widget_style:encode()
		local var2346, var2347 = protoModule.writeTag(buff, var2340, 3, protoModule.wireTypes.lengthDelimited)
		var2346, var3447 = protoModule.writeBuffer(var2346, var2347, var2345, buffer.len(var2345))
		buff = var2346
		var2340 = var2347
	end
	if self.see_all_button then
		local var2348, var2349 = protoModule.writeTag(buff, var2340, 5, protoModule.wireTypes.varint)
		var2348, var3449 = protoModule.writeVarInt(var2348, var2349, if self.see_all_button then 1 else 0)
		buff = var2348
		var2340 = var2349
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2350, var2351 = protoModule.writeTag(buff, var2340, 6, protoModule.wireTypes.lengthDelimited)
		var2350, var3451 = protoModule.writeString(var2350, var2351, self.information_popover_text)
		buff = var2350
		var2340 = var2351
	end
	local buff_1 = buffer.create(var2340)
	buffer.copy(buff_1, 0, buff, 0, var2340)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2340 = t_83.new()
	local var2341 = 0
	while var2341 < buffer.len(p83) do
		local _ = nil
		local var2342 = nil
		local var2343, var2344, var2345 = protoModule.readTag(p83, var2341)
		local var2346 = var2343
		var2342 = var2344
		var2341 = var2345
		
		if var2342 == protoModule.wireTypes.varint then
			if var2346 == 4 then
				local _ = nil
				local var2347, var2348 = protoModule.readVarIntI64(p83, var2341)
				var2341 = var2348
				var2340.preview_rows = var2347
			elseif var2346 == 5 then
				local _ = nil
				local var2349, var2350 = protoModule.readVarInt(p83, var2341)
				var2341 = var2350
				var2340.see_all_button = var2349 ~= 0
			else
				local _ = nil
				local var2351, var2352 = protoModule.readVarInt(p83, var2341)
				local _ = var2351
				var2341 = var2352
			end
		end
		if var2342 == protoModule.wireTypes.lengthDelimited then
			if var2346 == 1 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p83, var2341)
				var2341 = var2354
				var2340.id = buffer.tostring(var2353)
			elseif var2346 == 3 then
				local _ = nil
				local var2355, var2356 = protoModule.readBuffer(p83, var2341)
				var2341 = var2356
				var2340.widget_style = t.WidgetStyleData.decode(var2355)
			elseif var2346 == 6 then
				local _ = nil
				local var2357, var2358 = protoModule.readBuffer(p83, var2341)
				var2341 = var2358
				var2340.information_popover_text = buffer.tostring(var2357)
			else
				local _ = nil
				local var2359, var2360 = protoModule.readVarInt(p83, var2341)
				var2341 = var2360 + var2359
			end
		elseif var2342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2361, var2362 = protoModule.readFixed32(p83, var2341)
			local _ = var2361
			var2341 = var2362
		elseif var2342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed64(p83, var2341)
			local _ = var2363
			var2341 = var2364
		else
			error("Unsupported wire type: " .. var3455)
		end
	end
	return var2340
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
	local var2365 = t_83.new()
	
	if self.id ~= nil then
		var2365.id = self.id
	end
	if self.preview_rows ~= nil then
		var2365.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2365.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2365.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2365.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2365.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2365.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2365.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2365.information_popover_text = self.informationPopoverText
	end
	return var2365
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
	local var2365 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2366, var2367 = protoModule.writeTag(buff, var2365, 1, protoModule.wireTypes.lengthDelimited)
		var2366, var3483 = protoModule.writeString(var2366, var2367, self.id)
		buff = var2366
		var2365 = var2367
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2368, var2369 = protoModule.writeTag(buff, var2365, 5, protoModule.wireTypes.varint)
		var2368, var3485 = protoModule.writeVarInt(var2368, var2369, self.num_items_to_show)
		buff = var2368
		var2365 = var2369
	end
	if self.widget_style ~= nil then
		local var2370 = self.widget_style:encode()
		local var2371, var2372 = protoModule.writeTag(buff, var2365, 3, protoModule.wireTypes.lengthDelimited)
		var2371, var3488 = protoModule.writeBuffer(var2371, var2372, var2370, buffer.len(var2370))
		buff = var2371
		var2365 = var2372
	end
	if self.see_all_button then
		local var2373, var2374 = protoModule.writeTag(buff, var2365, 6, protoModule.wireTypes.varint)
		var2373, var3490 = protoModule.writeVarInt(var2373, var2374, if self.see_all_button then 1 else 0)
		buff = var2373
		var2365 = var2374
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2375, var2376 = protoModule.writeTag(buff, var2365, 7, protoModule.wireTypes.lengthDelimited)
		var2375, var3492 = protoModule.writeString(var2375, var2376, self.information_popover_text)
		buff = var2375
		var2365 = var2376
	end
	local buff_1 = buffer.create(var2365)
	buffer.copy(buff_1, 0, buff, 0, var2365)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2365 = t_84.new()
	local var2366 = 0
	while var2366 < buffer.len(p84) do
		local _ = nil
		local var2367 = nil
		local var2368, var2369, var2370 = protoModule.readTag(p84, var2366)
		local var2371 = var2368
		var2367 = var2369
		var2366 = var2370
		
		if var2367 == protoModule.wireTypes.varint then
			if var2371 == 5 then
				local _ = nil
				local var2372, var2373 = protoModule.readVarIntI64(p84, var2366)
				var2366 = var2373
				var2365.num_items_to_show = var2372
			elseif var2371 == 6 then
				local _ = nil
				local var2374, var2375 = protoModule.readVarInt(p84, var2366)
				var2366 = var2375
				var2365.see_all_button = var2374 ~= 0
			else
				local _ = nil
				local var2376, var2377 = protoModule.readVarInt(p84, var2366)
				local _ = var2376
				var2366 = var2377
			end
		end
		if var2367 == protoModule.wireTypes.lengthDelimited then
			if var2371 == 1 then
				local _ = nil
				local var2378, var2379 = protoModule.readBuffer(p84, var2366)
				var2366 = var2379
				var2365.id = buffer.tostring(var2378)
			elseif var2371 == 3 then
				local _ = nil
				local var2380, var2381 = protoModule.readBuffer(p84, var2366)
				var2366 = var2381
				var2365.widget_style = t.WidgetStyleData.decode(var2380)
			elseif var2371 == 7 then
				local _ = nil
				local var2382, var2383 = protoModule.readBuffer(p84, var2366)
				var2366 = var2383
				var2365.information_popover_text = buffer.tostring(var2382)
			else
				local _ = nil
				local var2384, var2385 = protoModule.readVarInt(p84, var2366)
				var2366 = var2385 + var2384
			end
		elseif var2367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2386, var2387 = protoModule.readFixed32(p84, var2366)
			local _ = var2386
			var2366 = var2387
		elseif var2367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2388, var2389 = protoModule.readFixed64(p84, var2366)
			local _ = var2388
			var2366 = var2389
		else
			error("Unsupported wire type: " .. var3496)
		end
	end
	return var2365
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
	local var2390 = t_84.new()
	
	if self.id ~= nil then
		var2390.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2390.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2390.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2390.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2390.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2390.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2390.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2390.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2390.information_popover_text = self.informationPopoverText
	end
	return var2390
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
	local var2390 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2391 = v:encode()
			local var2392, var2393 = protoModule.writeTag(buff, var2390, 1, protoModule.wireTypes.lengthDelimited)
			var2392, var3525 = protoModule.writeBuffer(var2392, var2393, var2391, buffer.len(var2391))
			buff = var2392
			var2390 = var2393
		end
	end
	local buff_1 = buffer.create(var2390)
	buffer.copy(buff_1, 0, buff, 0, var2390)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2394 = t_85.new()
	local var2395 = 0
	while var2395 < buffer.len(p85) do
		local _ = nil
		local var2396 = nil
		local var2397, var2398, var2399 = protoModule.readTag(p85, var2395)
		local var2400 = var2397
		var2396 = var2398
		var2395 = var2399
		
		if var2396 == protoModule.wireTypes.varint then
			local _ = nil
			local var2401, var2402 = protoModule.readVarInt(p85, var2395)
			local _ = var2401
			var2395 = var2402
			continue
		end
		if var2396 == protoModule.wireTypes.lengthDelimited then
			if var2400 == 1 then
				local _ = nil
				local var2403, var2404 = protoModule.readBuffer(p85, var2395)
				var2395 = var2404
				table.insert(var2394.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2403))
			else
				local _ = nil
				local var2405, var2406 = protoModule.readVarInt(p85, var2395)
				var2395 = var2406 + var2405
			end
		elseif var2396 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2407, var2408 = protoModule.readFixed32(p85, var2395)
			local _ = var2407
			var2395 = var2408
		elseif var2396 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2409, var2410 = protoModule.readFixed64(p85, var2395)
			local _ = var2409
			var2395 = var2410
		else
			error("Unsupported wire type: " .. var3529)
		end
	end
	return var2394
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
	local var2411 = t_85.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2411.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2411.background_layers = t
	end
	return var2411
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
	local var2412 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2413, var2414 = protoModule.writeTag(buff, var2412, 1, protoModule.wireTypes.lengthDelimited)
		var2413, var3552 = protoModule.writeString(var2413, var2414, self.id)
		buff = var2413
		var2412 = var2414
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2415, var2416 = protoModule.writeTag(buff, var2412, 2, protoModule.wireTypes.lengthDelimited)
		var2415, var3554 = protoModule.writeString(var2415, var2416, self.available_until)
		buff = var2415
		var2412 = var2416
	end
	if self.widget_style ~= nil then
		local var2417 = self.widget_style:encode()
		local var2418, var2419 = protoModule.writeTag(buff, var2412, 3, protoModule.wireTypes.lengthDelimited)
		var2418, var3557 = protoModule.writeBuffer(var2418, var2419, var2417, buffer.len(var2417))
		buff = var2418
		var2412 = var2419
	end
	local buff_1 = buffer.create(var2412)
	buffer.copy(buff_1, 0, buff, 0, var2412)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2412 = t_86.new()
	local var2413 = 0
	while var2413 < buffer.len(p86) do
		local _ = nil
		local var2414 = nil
		local var2415, var2416, var2417 = protoModule.readTag(p86, var2413)
		local var2418 = var2415
		var2414 = var2416
		var2413 = var2417
		
		if var2414 == protoModule.wireTypes.varint then
			local _ = nil
			local var2419, var2420 = protoModule.readVarInt(p86, var2413)
			local _ = var2419
			var2413 = var2420
			continue
		end
		if var2414 == protoModule.wireTypes.lengthDelimited then
			if var2418 == 1 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p86, var2413)
				var2413 = var2422
				var2412.id = buffer.tostring(var2421)
			elseif var2418 == 2 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p86, var2413)
				var2413 = var2424
				var2412.available_until = buffer.tostring(var2423)
			elseif var2418 == 3 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p86, var2413)
				var2413 = var2426
				var2412.widget_style = t.WidgetStyleData.decode(var2425)
			else
				local _ = nil
				local var2427, var2428 = protoModule.readVarInt(p86, var2413)
				var2413 = var2428 + var2427
			end
		elseif var2414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2429, var2430 = protoModule.readFixed32(p86, var2413)
			local _ = var2429
			var2413 = var2430
		elseif var2414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2431, var2432 = protoModule.readFixed64(p86, var2413)
			local _ = var2431
			var2413 = var2432
		else
			error("Unsupported wire type: " .. var3561)
		end
	end
	return var2412
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
	local var2433 = t_86.new()
	
	if self.id ~= nil then
		var2433.id = self.id
	end
	if self.available_until ~= nil then
		var2433.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2433.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2433.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2433.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2433
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
	local var2433 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2434, var2435 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2434, var3585 = protoModule.writeString(var2434, var2435, i)
			local var2436 = v:encode()
			var2435, var3587 = protoModule.writeTag(var2434, var2435, 2, protoModule.wireTypes.lengthDelimited)
			var2435, var3587 = protoModule.writeBuffer(var2435, var3587, var2436, buffer.len(var2436))
			local var2437 = var2435
			local var2438 = var3587
			local var2439, var2440 = protoModule.writeTag(buff, var2433, 1, protoModule.wireTypes.lengthDelimited)
			var2439, var3591 = protoModule.writeBuffer(var2439, var2440, var2437, var2438)
			buff = var2439
			var2433 = var2440
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2441, var2442 = protoModule.writeTag(buff, var2433, 2, protoModule.wireTypes.lengthDelimited)
			var2441, var3593 = protoModule.writeString(var2441, var2442, v)
			buff = var2441
			var2433 = var2442
		end
	end
	local buff_1 = buffer.create(var2433)
	buffer.copy(buff_1, 0, buff, 0, var2433)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2443 = t_87.new()
	local var2444 = 0
	while var2444 < buffer.len(p87) do
		local _ = nil
		local var2445 = nil
		local var2446, var2447, var2448 = protoModule.readTag(p87, var2444)
		local var2449 = var2446
		var2445 = var2447
		var2444 = var2448
		
		if var2445 == protoModule.wireTypes.varint then
			local _ = nil
			local var2450, var2451 = protoModule.readVarInt(p87, var2444)
			local _ = var2450
			var2444 = var2451
			continue
		end
		if var2445 == protoModule.wireTypes.lengthDelimited then
			if var2449 == 1 then
				local _ = nil
				local var2452, var2453 = protoModule.readBuffer(p87, var2444)
				var2444 = var2453
				var2452 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2452)
				var2443.entry_map[var2452.key or ""] = var2452.value or t.FeedEntry.new()
			elseif var2449 == 2 then
				local _ = nil
				local var2454, var2455 = protoModule.readBuffer(p87, var2444)
				var2444 = var2455
				table.insert(var2443.entry_order, buffer.tostring(var2454))
			else
				local _ = nil
				local var2456, var2457 = protoModule.readVarInt(p87, var2444)
				var2444 = var2457 + var2456
			end
		elseif var2445 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2458, var2459 = protoModule.readFixed32(p87, var2444)
			local _ = var2458
			var2444 = var2459
		elseif var2445 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2460, var2461 = protoModule.readFixed64(p87, var2444)
			local _ = var2460
			var2444 = var2461
		else
			error("Unsupported wire type: " .. var3597)
		end
	end
	return var2443
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
	local var2462 = t_87.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2462.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2462.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2462.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2462.entry_order = t_1
	end
	return var2462
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
	local var2463 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2464, var2465 = protoModule.writeTag(buff, var2463, 1, protoModule.wireTypes.lengthDelimited)
		var2464, var3625 = protoModule.writeString(var2464, var2465, self.key)
		buff = var2464
		var2463 = var2465
	end
	if self.value ~= nil then
		local var2466 = self.value:encode()
		local var2467, var2468 = protoModule.writeTag(buff, var2463, 2, protoModule.wireTypes.lengthDelimited)
		var2467, var3628 = protoModule.writeBuffer(var2467, var2468, var2466, buffer.len(var2466))
		buff = var2467
		var2463 = var2468
	end
	local buff_1 = buffer.create(var2463)
	buffer.copy(buff_1, 0, buff, 0, var2463)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2463 = t_88.new()
	local var2464 = 0
	while var2464 < buffer.len(p88) do
		local _ = nil
		local var2465 = nil
		local var2466, var2467, var2468 = protoModule.readTag(p88, var2464)
		local var2469 = var2466
		var2465 = var2467
		var2464 = var2468
		
		if var2465 == protoModule.wireTypes.varint then
			local _ = nil
			local var2470, var2471 = protoModule.readVarInt(p88, var2464)
			local _ = var2470
			var2464 = var2471
			continue
		end
		if var2465 == protoModule.wireTypes.lengthDelimited then
			if var2469 == 1 then
				local _ = nil
				local var2472, var2473 = protoModule.readBuffer(p88, var2464)
				var2464 = var2473
				var2463.key = buffer.tostring(var2472)
			elseif var2469 == 2 then
				local _ = nil
				local var2474, var2475 = protoModule.readBuffer(p88, var2464)
				var2464 = var2475
				var2463.value = t.FeedEntry.decode(var2474)
			else
				local _ = nil
				local var2476, var2477 = protoModule.readVarInt(p88, var2464)
				var2464 = var2477 + var2476
			end
		elseif var2465 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2478, var2479 = protoModule.readFixed32(p88, var2464)
			local _ = var2478
			var2464 = var2479
		elseif var2465 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2480, var2481 = protoModule.readFixed64(p88, var2464)
			local _ = var2480
			var2464 = var2481
		else
			error("Unsupported wire type: " .. var3632)
		end
	end
	return var2463
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
	local var2482 = t_88.new()
	
	if self.key ~= nil then
		var2482.key = self.key
	end
	if self.value ~= nil then
		var2482.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2482
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
	local var2482 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2483 = v:encode()
			local var2484, var2485 = protoModule.writeTag(buff, var2482, 1, protoModule.wireTypes.lengthDelimited)
			var2484, var3655 = protoModule.writeBuffer(var2484, var2485, var2483, buffer.len(var2483))
			buff = var2484
			var2482 = var2485
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2486, var2487 = protoModule.writeTag(buff, var2482, 2, protoModule.wireTypes.lengthDelimited)
		var2486, var3657 = protoModule.writeString(var2486, var2487, self.active_category_id)
		buff = var2486
		var2482 = var2487
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2488, var2489 = protoModule.writeTag(buff, var2482, 3, protoModule.wireTypes.varint)
		var2488, var3659 = protoModule.writeVarInt(var2488, var2489, self.active_tooltip_idx)
		buff = var2488
		var2482 = var2489
	end
	local buff_1 = buffer.create(var2482)
	buffer.copy(buff_1, 0, buff, 0, var2482)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2490 = t_89.new()
	local var2491 = 0
	while var2491 < buffer.len(p89) do
		local _ = nil
		local var2492 = nil
		local var2493, var2494, var2495 = protoModule.readTag(p89, var2491)
		local var2496 = var2493
		var2492 = var2494
		var2491 = var2495
		
		if var2492 == protoModule.wireTypes.varint then
			if var2496 == 3 then
				local _ = nil
				local var2497, var2498 = protoModule.readVarIntI64(p89, var2491)
				var2491 = var2498
				var2490.active_tooltip_idx = var2497
			else
				local _ = nil
				local var2499, var2500 = protoModule.readVarInt(p89, var2491)
				local _ = var2499
				var2491 = var2500
			end
		end
		if var2492 == protoModule.wireTypes.lengthDelimited then
			if var2496 == 1 then
				local _ = nil
				local var2501, var2502 = protoModule.readBuffer(p89, var2491)
				var2491 = var2502
				table.insert(var2490.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2501))
			elseif var2496 == 2 then
				local _ = nil
				local var2503, var2504 = protoModule.readBuffer(p89, var2491)
				var2491 = var2504
				var2490.active_category_id = buffer.tostring(var2503)
			else
				local _ = nil
				local var2505, var2506 = protoModule.readVarInt(p89, var2491)
				var2491 = var2506 + var2505
			end
		elseif var2492 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2507, var2508 = protoModule.readFixed32(p89, var2491)
			local _ = var2507
			var2491 = var2508
		elseif var2492 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2509, var2510 = protoModule.readFixed64(p89, var2491)
			local _ = var2509
			var2491 = var2510
		else
			error("Unsupported wire type: " .. var3663)
		end
	end
	return var2490
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
	local var2511 = t_89.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2511.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2511.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2511.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2511.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2511.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2511.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2511
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
	local var2512 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2513, var2514 = protoModule.writeTag(buff, var2512, 1, protoModule.wireTypes.lengthDelimited)
		var2513, var3690 = protoModule.writeString(var2513, var2514, self.marketplace_catalog_category_item_id)
		buff = var2513
		var2512 = var2514
	end
	local buff_1 = buffer.create(var2512)
	buffer.copy(buff_1, 0, buff, 0, var2512)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2512 = t_90.new()
	local var2513 = 0
	while var2513 < buffer.len(p90) do
		local _ = nil
		local var2514 = nil
		local var2515, var2516, var2517 = protoModule.readTag(p90, var2513)
		local var2518 = var2515
		var2514 = var2516
		var2513 = var2517
		
		if var2514 == protoModule.wireTypes.varint then
			local _ = nil
			local var2519, var2520 = protoModule.readVarInt(p90, var2513)
			local _ = var2519
			var2513 = var2520
			continue
		end
		if var2514 == protoModule.wireTypes.lengthDelimited then
			if var2518 == 1 then
				local _ = nil
				local var2521, var2522 = protoModule.readBuffer(p90, var2513)
				var2513 = var2522
				var2512.marketplace_catalog_category_item_id = buffer.tostring(var2521)
			else
				local _ = nil
				local var2523, var2524 = protoModule.readVarInt(p90, var2513)
				var2513 = var2524 + var2523
			end
		elseif var2514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2525, var2526 = protoModule.readFixed32(p90, var2513)
			local _ = var2525
			var2513 = var2526
		elseif var2514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2527, var2528 = protoModule.readFixed64(p90, var2513)
			local _ = var2527
			var2513 = var2528
		else
			error("Unsupported wire type: " .. var3694)
		end
	end
	return var2512
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
	local var2529 = t_90.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2529.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2529.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2529
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
	local var2529 = 0
	
	if self.hero_icon ~= nil then
		local var2530, var2531 = protoModule.writeTag(buff, var2529, 1, protoModule.wireTypes.lengthDelimited)
		var2530, var3714 = protoModule.writeString(var2530, var2531, self.hero_icon)
		buff = var2530
		var2529 = var2531
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2532, var2533 = protoModule.writeTag(buff, var2529, 2, protoModule.wireTypes.lengthDelimited)
		var2532, var3716 = protoModule.writeString(var2532, var2533, self.body_dismiss_button_text)
		buff = var2532
		var2529 = var2533
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2534, var2535 = protoModule.writeTag(buff, var2529, 3, protoModule.wireTypes.lengthDelimited)
		var2534, var3718 = protoModule.writeString(var2534, var2535, self.body_title)
		buff = var2534
		var2529 = var2535
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2536, var2537 = protoModule.writeTag(buff, var2529, 4, protoModule.wireTypes.lengthDelimited)
		var2536, var3720 = protoModule.writeString(var2536, var2537, self.body_rich_text)
		buff = var2536
		var2529 = var2537
	end
	if self.terms_link_text ~= nil then
		local var2538, var2539 = protoModule.writeTag(buff, var2529, 5, protoModule.wireTypes.lengthDelimited)
		var2538, var3722 = protoModule.writeString(var2538, var2539, self.terms_link_text)
		buff = var2538
		var2529 = var2539
	end
	if self.terms_title ~= nil then
		local var2540, var2541 = protoModule.writeTag(buff, var2529, 6, protoModule.wireTypes.lengthDelimited)
		var2540, var3724 = protoModule.writeString(var2540, var2541, self.terms_title)
		buff = var2540
		var2529 = var2541
	end
	if self.terms_body_rich_text ~= nil then
		local var2542, var2543 = protoModule.writeTag(buff, var2529, 7, protoModule.wireTypes.lengthDelimited)
		var2542, var3726 = protoModule.writeString(var2542, var2543, self.terms_body_rich_text)
		buff = var2542
		var2529 = var2543
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2544, var2545 = protoModule.writeTag(buff, var2529, 8, protoModule.wireTypes.lengthDelimited)
		var2544, var3728 = protoModule.writeString(var2544, var2545, self.terms_dismiss_button_text)
		buff = var2544
		var2529 = var2545
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2546, var2547 = protoModule.writeTag(buff, var2529, 9, protoModule.wireTypes.lengthDelimited)
		var2546, var3730 = protoModule.writeString(var2546, var2547, self.offer_id)
		buff = var2546
		var2529 = var2547
	end
	local buff_1 = buffer.create(var2529)
	buffer.copy(buff_1, 0, buff, 0, var2529)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref)
	local var2529 = t_91.new()
	local var2530 = 0
	while var2530 < buffer.len(p91) do
		local _ = nil
		local var2531 = nil
		local var2532, var2533, var2534 = protoModule.readTag(p91, var2530)
		local var2535 = var2532
		var2531 = var2533
		var2530 = var2534
		
		if var2531 == protoModule.wireTypes.varint then
			local _ = nil
			local var2536, var2537 = protoModule.readVarInt(p91, var2530)
			local _ = var2536
			var2530 = var2537
			continue
		end
		if var2531 == protoModule.wireTypes.lengthDelimited then
			if var2535 == 1 then
				local _ = nil
				local var2538, var2539 = protoModule.readBuffer(p91, var2530)
				var2530 = var2539
				var2529.hero_icon = buffer.tostring(var2538)
			elseif var2535 == 2 then
				local _ = nil
				local var2540, var2541 = protoModule.readBuffer(p91, var2530)
				var2530 = var2541
				var2529.body_dismiss_button_text = buffer.tostring(var2540)
			elseif var2535 == 3 then
				local _ = nil
				local var2542, var2543 = protoModule.readBuffer(p91, var2530)
				var2530 = var2543
				var2529.body_title = buffer.tostring(var2542)
			elseif var2535 == 4 then
				local _ = nil
				local var2544, var2545 = protoModule.readBuffer(p91, var2530)
				var2530 = var2545
				var2529.body_rich_text = buffer.tostring(var2544)
			elseif var2535 == 5 then
				local _ = nil
				local var2546, var2547 = protoModule.readBuffer(p91, var2530)
				var2530 = var2547
				var2529.terms_link_text = buffer.tostring(var2546)
			elseif var2535 == 6 then
				local _ = nil
				local var2548, var2549 = protoModule.readBuffer(p91, var2530)
				var2530 = var2549
				var2529.terms_title = buffer.tostring(var2548)
			elseif var2535 == 7 then
				local _ = nil
				local var2550, var2551 = protoModule.readBuffer(p91, var2530)
				var2530 = var2551
				var2529.terms_body_rich_text = buffer.tostring(var2550)
			elseif var2535 == 8 then
				local _ = nil
				local var2552, var2553 = protoModule.readBuffer(p91, var2530)
				var2530 = var2553
				var2529.terms_dismiss_button_text = buffer.tostring(var2552)
			elseif var2535 == 9 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p91, var2530)
				var2530 = var2555
				var2529.offer_id = buffer.tostring(var2554)
			else
				local _ = nil
				local var2556, var2557 = protoModule.readVarInt(p91, var2530)
				var2530 = var2557 + var2556
			end
		elseif var2531 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2558, var2559 = protoModule.readFixed32(p91, var2530)
			local _ = var2558
			var2530 = var2559
		elseif var2531 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2560, var2561 = protoModule.readFixed64(p91, var2530)
			local _ = var2560
			var2530 = var2561
		else
			error("Unsupported wire type: " .. var3734)
		end
	end
	return var2529
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
	local var2562 = t_91.new()
	
	if self.hero_icon ~= nil then
		var2562.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2562.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2562.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2562.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2562.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2562.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2562.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2562.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2562.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2562.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2562.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2562.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2562.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2562.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2562.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2562.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2562.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2562.offer_id = self.offerId
	end
	return var2562
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
	local var2562 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2563, var2564 = protoModule.writeTag(buff, var2562, 1, protoModule.wireTypes.lengthDelimited)
		var2563, var3770 = protoModule.writeString(var2563, var2564, self.item_id)
		buff = var2563
		var2562 = var2564
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2565, var2566 = protoModule.writeTag(buff, var2562, 2, protoModule.wireTypes.lengthDelimited)
		var2565, var3772 = protoModule.writeString(var2565, var2566, self.item_type)
		buff = var2565
		var2562 = var2566
	end
	if self.prefer_three_dimensional then
		local var2567, var2568 = protoModule.writeTag(buff, var2562, 3, protoModule.wireTypes.varint)
		var2567, var3774 = protoModule.writeVarInt(var2567, var2568, if self.prefer_three_dimensional then 1 else 0)
		buff = var2567
		var2562 = var2568
	end
	if self.bundle_type ~= nil then
		local var2569, var2570 = protoModule.writeTag(buff, var2562, 4, protoModule.wireTypes.lengthDelimited)
		var2569, var3776 = protoModule.writeString(var2569, var2570, self.bundle_type)
		buff = var2569
		var2562 = var2570
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2571 = v:encode()
			local var2572, var2573 = protoModule.writeTag(buff, var2562, 5, protoModule.wireTypes.lengthDelimited)
			var2572, var3779 = protoModule.writeBuffer(var2572, var2573, var2571, buffer.len(var2571))
			buff = var2572
			var2562 = var2573
		end
	end
	local buff_1 = buffer.create(var2562)
	buffer.copy(buff_1, 0, buff, 0, var2562)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2574 = t_92.new()
	local var2575 = 0
	while var2575 < buffer.len(p92) do
		local _ = nil
		local var2576 = nil
		local var2577, var2578, var2579 = protoModule.readTag(p92, var2575)
		local var2580 = var2577
		var2576 = var2578
		var2575 = var2579
		
		if var2576 == protoModule.wireTypes.varint then
			if var2580 == 3 then
				local _ = nil
				local var2581, var2582 = protoModule.readVarInt(p92, var2575)
				var2575 = var2582
				var2574.prefer_three_dimensional = var2581 ~= 0
			else
				local _ = nil
				local var2583, var2584 = protoModule.readVarInt(p92, var2575)
				local _ = var2583
				var2575 = var2584
			end
		end
		if var2576 == protoModule.wireTypes.lengthDelimited then
			if var2580 == 1 then
				local _ = nil
				local var2585, var2586 = protoModule.readBuffer(p92, var2575)
				var2575 = var2586
				var2574.item_id = buffer.tostring(var2585)
			elseif var2580 == 2 then
				local _ = nil
				local var2587, var2588 = protoModule.readBuffer(p92, var2575)
				var2575 = var2588
				var2574.item_type = buffer.tostring(var2587)
			elseif var2580 == 4 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p92, var2575)
				var2575 = var2590
				var2574.bundle_type = buffer.tostring(var2589)
			elseif var2580 == 5 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p92, var2575)
				var2575 = var2592
				table.insert(var2574.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2591))
			else
				local _ = nil
				local var2593, var2594 = protoModule.readVarInt(p92, var2575)
				var2575 = var2594 + var2593
			end
		elseif var2576 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2595, var2596 = protoModule.readFixed32(p92, var2575)
			local _ = var2595
			var2575 = var2596
		elseif var2576 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2597, var2598 = protoModule.readFixed64(p92, var2575)
			local _ = var2597
			var2575 = var2598
		else
			error("Unsupported wire type: " .. var3783)
		end
	end
	return var2574
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
	local var2599 = t_92.new()
	
	if self.item_id ~= nil then
		var2599.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2599.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2599.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2599.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2599.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2599.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2599.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2599.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2599.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2599.bundle_items = t_1
	end
	return var2599
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
	local var2600 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2601, var2602 = protoModule.writeTag(buff, var2600, 1, protoModule.wireTypes.lengthDelimited)
		var2601, var3814 = protoModule.writeString(var2601, var2602, self.id)
		buff = var2601
		var2600 = var2602
	end
	if self.type ~= nil and self.type ~= "" then
		local var2603, var2604 = protoModule.writeTag(buff, var2600, 2, protoModule.wireTypes.lengthDelimited)
		var2603, var3816 = protoModule.writeString(var2603, var2604, self.type)
		buff = var2603
		var2600 = var2604
	end
	local buff_1 = buffer.create(var2600)
	buffer.copy(buff_1, 0, buff, 0, var2600)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref)
	local var2600 = t_93.new()
	local var2601 = 0
	while var2601 < buffer.len(p93) do
		local _ = nil
		local var2602 = nil
		local var2603, var2604, var2605 = protoModule.readTag(p93, var2601)
		local var2606 = var2603
		var2602 = var2604
		var2601 = var2605
		
		if var2602 == protoModule.wireTypes.varint then
			local _ = nil
			local var2607, var2608 = protoModule.readVarInt(p93, var2601)
			local _ = var2607
			var2601 = var2608
			continue
		end
		if var2602 == protoModule.wireTypes.lengthDelimited then
			if var2606 == 1 then
				local _ = nil
				local var2609, var2610 = protoModule.readBuffer(p93, var2601)
				var2601 = var2610
				var2600.id = buffer.tostring(var2609)
			elseif var2606 == 2 then
				local _ = nil
				local var2611, var2612 = protoModule.readBuffer(p93, var2601)
				var2601 = var2612
				var2600.type = buffer.tostring(var2611)
			else
				local _ = nil
				local var2613, var2614 = protoModule.readVarInt(p93, var2601)
				var2601 = var2614 + var2613
			end
		elseif var2602 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2615, var2616 = protoModule.readFixed32(p93, var2601)
			local _ = var2615
			var2601 = var2616
		elseif var2602 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2617, var2618 = protoModule.readFixed64(p93, var2601)
			local _ = var2617
			var2601 = var2618
		else
			error("Unsupported wire type: " .. var3820)
		end
	end
	return var2600
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
	local var2619 = t_93.new()
	
	if self.id ~= nil then
		var2619.id = self.id
	end
	if self.type ~= nil then
		var2619.type = self.type
	end
	return var2619
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
	local var2619 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2620 = v:encode()
			local var2621, var2622 = protoModule.writeTag(buff, var2619, 1, protoModule.wireTypes.lengthDelimited)
			var2621, var3843 = protoModule.writeBuffer(var2621, var2622, var2620, buffer.len(var2620))
			buff = var2621
			var2619 = var2622
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2623, var2624 = protoModule.writeTag(buff, var2619, 2, protoModule.wireTypes.varint)
		var2623, var3845 = protoModule.writeVarInt(var2623, var2624, self.preview_columns)
		buff = var2623
		var2619 = var2624
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2625, var2626 = protoModule.writeTag(buff, var2619, 3, protoModule.wireTypes.lengthDelimited)
		var2625, var3847 = protoModule.writeString(var2625, var2626, self.impression_id)
		buff = var2625
		var2619 = var2626
	end
	local buff_1 = buffer.create(var2619)
	buffer.copy(buff_1, 0, buff, 0, var2619)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2627 = t_94.new()
	local var2628 = 0
	while var2628 < buffer.len(p94) do
		local _ = nil
		local var2629 = nil
		local var2630, var2631, var2632 = protoModule.readTag(p94, var2628)
		local var2633 = var2630
		var2629 = var2631
		var2628 = var2632
		
		if var2629 == protoModule.wireTypes.varint then
			if var2633 == 2 then
				local _ = nil
				local var2634, var2635 = protoModule.readVarIntI32(p94, var2628)
				var2628 = var2635
				var2627.preview_columns = var2634
			else
				local _ = nil
				local var2636, var2637 = protoModule.readVarInt(p94, var2628)
				local _ = var2636
				var2628 = var2637
			end
		end
		if var2629 == protoModule.wireTypes.lengthDelimited then
			if var2633 == 1 then
				local _ = nil
				local var2638, var2639 = protoModule.readBuffer(p94, var2628)
				var2628 = var2639
				table.insert(var2627.items, t.CatalogItemGridInputData_CatalogItem.decode(var2638))
			elseif var2633 == 3 then
				local _ = nil
				local var2640, var2641 = protoModule.readBuffer(p94, var2628)
				var2628 = var2641
				var2627.impression_id = buffer.tostring(var2640)
			else
				local _ = nil
				local var2642, var2643 = protoModule.readVarInt(p94, var2628)
				var2628 = var2643 + var2642
			end
		elseif var2629 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2644, var2645 = protoModule.readFixed32(p94, var2628)
			local _ = var2644
			var2628 = var2645
		elseif var2629 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2646, var2647 = protoModule.readFixed64(p94, var2628)
			local _ = var2646
			var2628 = var2647
		else
			error("Unsupported wire type: " .. var3851)
		end
	end
	return var2627
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
	local var2648 = t_94.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2648.items = t_1
	end
	if self.preview_columns ~= nil then
		var2648.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2648.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2648.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2648.impression_id = self.impressionId
	end
	return var2648
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
	local var2649 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2650, var2651 = protoModule.writeTag(buff, var2649, 1, protoModule.wireTypes.lengthDelimited)
		var2650, var3877 = protoModule.writeString(var2650, var2651, self.id)
		buff = var2650
		var2649 = var2651
	end
	if self.type ~= nil and self.type ~= "" then
		local var2652, var2653 = protoModule.writeTag(buff, var2649, 2, protoModule.wireTypes.lengthDelimited)
		var2652, var3879 = protoModule.writeString(var2652, var2653, self.type)
		buff = var2652
		var2649 = var2653
	end
	local buff_1 = buffer.create(var2649)
	buffer.copy(buff_1, 0, buff, 0, var2649)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref)
	local var2649 = t_95.new()
	local var2650 = 0
	while var2650 < buffer.len(p95) do
		local _ = nil
		local var2651 = nil
		local var2652, var2653, var2654 = protoModule.readTag(p95, var2650)
		local var2655 = var2652
		var2651 = var2653
		var2650 = var2654
		
		if var2651 == protoModule.wireTypes.varint then
			local _ = nil
			local var2656, var2657 = protoModule.readVarInt(p95, var2650)
			local _ = var2656
			var2650 = var2657
			continue
		end
		if var2651 == protoModule.wireTypes.lengthDelimited then
			if var2655 == 1 then
				local _ = nil
				local var2658, var2659 = protoModule.readBuffer(p95, var2650)
				var2650 = var2659
				var2649.id = buffer.tostring(var2658)
			elseif var2655 == 2 then
				local _ = nil
				local var2660, var2661 = protoModule.readBuffer(p95, var2650)
				var2650 = var2661
				var2649.type = buffer.tostring(var2660)
			else
				local _ = nil
				local var2662, var2663 = protoModule.readVarInt(p95, var2650)
				var2650 = var2663 + var2662
			end
		elseif var2651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2664, var2665 = protoModule.readFixed32(p95, var2650)
			local _ = var2664
			var2650 = var2665
		elseif var2651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2666, var2667 = protoModule.readFixed64(p95, var2650)
			local _ = var2666
			var2650 = var2667
		else
			error("Unsupported wire type: " .. var3883)
		end
	end
	return var2649
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
	local var2668 = t_95.new()
	
	if self.id ~= nil then
		var2668.id = self.id
	end
	if self.type ~= nil then
		var2668.type = self.type
	end
	return var2668
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
	local var2668 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2669, var2670 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2669, var3905 = protoModule.writeString(var2669, var2670, i)
			local var2671 = v:encode()
			var2670, var3907 = protoModule.writeTag(var2669, var2670, 2, protoModule.wireTypes.lengthDelimited)
			var2670, var3907 = protoModule.writeBuffer(var2670, var3907, var2671, buffer.len(var2671))
			local var2672 = var2670
			local var2673 = var3907
			local var2674, var2675 = protoModule.writeTag(buff, var2668, 1, protoModule.wireTypes.lengthDelimited)
			var2674, var3911 = protoModule.writeBuffer(var2674, var2675, var2672, var2673)
			buff = var2674
			var2668 = var2675
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2676, var2677 = protoModule.writeTag(buff, var2668, 2, protoModule.wireTypes.lengthDelimited)
			var2676, var3913 = protoModule.writeString(var2676, var2677, v)
			buff = var2676
			var2668 = var2677
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2678, var2679 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2678, var3915 = protoModule.writeString(var2678, var2679, i)
			local var2680 = v:encode()
			var2679, var3917 = protoModule.writeTag(var2678, var2679, 2, protoModule.wireTypes.lengthDelimited)
			var2679, var3917 = protoModule.writeBuffer(var2679, var3917, var2680, buffer.len(var2680))
			local var2681 = var2679
			local var2682 = var3917
			local var2683, var2684 = protoModule.writeTag(buff, var2668, 3, protoModule.wireTypes.lengthDelimited)
			var2683, var3921 = protoModule.writeBuffer(var2683, var2684, var2681, var2682)
			buff = var2683
			var2668 = var2684
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2685, var2686 = protoModule.writeTag(buff, var2668, 4, protoModule.wireTypes.lengthDelimited)
		var2685, var3923 = protoModule.writeString(var2685, var2686, self.search_session_id)
		buff = var2685
		var2668 = var2686
	end
	local buff_1 = buffer.create(var2668)
	buffer.copy(buff_1, 0, buff, 0, var2668)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2687 = t_96.new()
	local var2688 = 0
	while var2688 < buffer.len(p96) do
		local _ = nil
		local var2689 = nil
		local var2690, var2691, var2692 = protoModule.readTag(p96, var2688)
		local var2693 = var2690
		var2689 = var2691
		var2688 = var2692
		
		if var2689 == protoModule.wireTypes.varint then
			local _ = nil
			local var2694, var2695 = protoModule.readVarInt(p96, var2688)
			local _ = var2694
			var2688 = var2695
			continue
		end
		if var2689 == protoModule.wireTypes.lengthDelimited then
			if var2693 == 1 then
				local _ = nil
				local var2696, var2697 = protoModule.readBuffer(p96, var2688)
				var2688 = var2697
				var2696 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2696)
				var2687.entry_map[var2696.key or ""] = var2696.value or t.FeedEntry.new()
			elseif var2693 == 2 then
				local _ = nil
				local var2698, var2699 = protoModule.readBuffer(p96, var2688)
				var2688 = var2699
				table.insert(var2687.entry_order, buffer.tostring(var2698))
			elseif var2693 == 3 then
				local _ = nil
				local var2700, var2701 = protoModule.readBuffer(p96, var2688)
				var2688 = var2701
				var2700 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2700)
				var2687.content_pools[var2700.key or ""] = var2700.value or t.ContentPool.new()
			elseif var2693 == 4 then
				local _ = nil
				local var2702, var2703 = protoModule.readBuffer(p96, var2688)
				var2688 = var2703
				var2687.search_session_id = buffer.tostring(var2702)
			else
				local _ = nil
				local var2704, var2705 = protoModule.readVarInt(p96, var2688)
				var2688 = var2705 + var2704
			end
		elseif var2689 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2706, var2707 = protoModule.readFixed32(p96, var2688)
			local _ = var2706
			var2688 = var2707
		elseif var2689 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2708, var2709 = protoModule.readFixed64(p96, var2688)
			local _ = var2708
			var2688 = var2709
		else
			error("Unsupported wire type: " .. var3927)
		end
	end
	return var2687
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
	local var2710 = t_96.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2710.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2710.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2710.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2710.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2710.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2710.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2710.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2710.search_session_id = self.searchSessionId
	end
	return var2710
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
	local var2711 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2712, var2713 = protoModule.writeTag(buff, var2711, 1, protoModule.wireTypes.lengthDelimited)
		var2712, var3962 = protoModule.writeString(var2712, var2713, self.key)
		buff = var2712
		var2711 = var2713
	end
	if self.value ~= nil then
		local var2714 = self.value:encode()
		local var2715, var2716 = protoModule.writeTag(buff, var2711, 2, protoModule.wireTypes.lengthDelimited)
		var2715, var3965 = protoModule.writeBuffer(var2715, var2716, var2714, buffer.len(var2714))
		buff = var2715
		var2711 = var2716
	end
	local buff_1 = buffer.create(var2711)
	buffer.copy(buff_1, 0, buff, 0, var2711)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2711 = t_97.new()
	local var2712 = 0
	while var2712 < buffer.len(p97) do
		local _ = nil
		local var2713 = nil
		local var2714, var2715, var2716 = protoModule.readTag(p97, var2712)
		local var2717 = var2714
		var2713 = var2715
		var2712 = var2716
		
		if var2713 == protoModule.wireTypes.varint then
			local _ = nil
			local var2718, var2719 = protoModule.readVarInt(p97, var2712)
			local _ = var2718
			var2712 = var2719
			continue
		end
		if var2713 == protoModule.wireTypes.lengthDelimited then
			if var2717 == 1 then
				local _ = nil
				local var2720, var2721 = protoModule.readBuffer(p97, var2712)
				var2712 = var2721
				var2711.key = buffer.tostring(var2720)
			elseif var2717 == 2 then
				local _ = nil
				local var2722, var2723 = protoModule.readBuffer(p97, var2712)
				var2712 = var2723
				var2711.value = t.FeedEntry.decode(var2722)
			else
				local _ = nil
				local var2724, var2725 = protoModule.readVarInt(p97, var2712)
				var2712 = var2725 + var2724
			end
		elseif var2713 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2726, var2727 = protoModule.readFixed32(p97, var2712)
			local _ = var2726
			var2712 = var2727
		elseif var2713 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2728, var2729 = protoModule.readFixed64(p97, var2712)
			local _ = var2728
			var2712 = var2729
		else
			error("Unsupported wire type: " .. var3969)
		end
	end
	return var2711
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
	local var2730 = t_97.new()
	
	if self.key ~= nil then
		var2730.key = self.key
	end
	if self.value ~= nil then
		var2730.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2730
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
	local var2730 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2731, var2732 = protoModule.writeTag(buff, var2730, 1, protoModule.wireTypes.lengthDelimited)
		var2731, var3991 = protoModule.writeString(var2731, var2732, self.key)
		buff = var2731
		var2730 = var2732
	end
	if self.value ~= nil then
		local var2733 = self.value:encode()
		local var2734, var2735 = protoModule.writeTag(buff, var2730, 2, protoModule.wireTypes.lengthDelimited)
		var2734, var3994 = protoModule.writeBuffer(var2734, var2735, var2733, buffer.len(var2733))
		buff = var2734
		var2730 = var2735
	end
	local buff_1 = buffer.create(var2730)
	buffer.copy(buff_1, 0, buff, 0, var2730)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2730 = t_98.new()
	local var2731 = 0
	while var2731 < buffer.len(p98) do
		local _ = nil
		local var2732 = nil
		local var2733, var2734, var2735 = protoModule.readTag(p98, var2731)
		local var2736 = var2733
		var2732 = var2734
		var2731 = var2735
		
		if var2732 == protoModule.wireTypes.varint then
			local _ = nil
			local var2737, var2738 = protoModule.readVarInt(p98, var2731)
			local _ = var2737
			var2731 = var2738
			continue
		end
		if var2732 == protoModule.wireTypes.lengthDelimited then
			if var2736 == 1 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p98, var2731)
				var2731 = var2740
				var2730.key = buffer.tostring(var2739)
			elseif var2736 == 2 then
				local _ = nil
				local var2741, var2742 = protoModule.readBuffer(p98, var2731)
				var2731 = var2742
				var2730.value = t.ContentPool.decode(var2741)
			else
				local _ = nil
				local var2743, var2744 = protoModule.readVarInt(p98, var2731)
				var2731 = var2744 + var2743
			end
		elseif var2732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2745, var2746 = protoModule.readFixed32(p98, var2731)
			local _ = var2745
			var2731 = var2746
		elseif var2732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed64(p98, var2731)
			local _ = var2747
			var2731 = var2748
		else
			error("Unsupported wire type: " .. var3998)
		end
	end
	return var2730
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
	local var2749 = t_98.new()
	
	if self.key ~= nil then
		var2749.key = self.key
	end
	if self.value ~= nil then
		var2749.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2749
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
	local var2749 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2750, var2751 = protoModule.writeTag(buff, var2749, 1, protoModule.wireTypes.lengthDelimited)
		var2750, var4020 = protoModule.writeString(var2750, var2751, self.universe_id)
		buff = var2750
		var2749 = var2751
	end
	if self.is_content_locked then
		local var2752, var2753 = protoModule.writeTag(buff, var2749, 2, protoModule.wireTypes.varint)
		var2752, var4022 = protoModule.writeVarInt(var2752, var2753, if self.is_content_locked then 1 else 0)
		buff = var2752
		var2749 = var2753
	end
	local buff_1 = buffer.create(var2749)
	buffer.copy(buff_1, 0, buff, 0, var2749)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2749 = t_99.new()
	local var2750 = 0
	while var2750 < buffer.len(p99) do
		local _ = nil
		local var2751 = nil
		local var2752, var2753, var2754 = protoModule.readTag(p99, var2750)
		local var2755 = var2752
		var2751 = var2753
		var2750 = var2754
		
		if var2751 == protoModule.wireTypes.varint then
			if var2755 == 2 then
				local _ = nil
				local var2756, var2757 = protoModule.readVarInt(p99, var2750)
				var2750 = var2757
				var2749.is_content_locked = var2756 ~= 0
			else
				local _ = nil
				local var2758, var2759 = protoModule.readVarInt(p99, var2750)
				local _ = var2758
				var2750 = var2759
			end
		end
		if var2751 == protoModule.wireTypes.lengthDelimited then
			if var2755 == 1 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p99, var2750)
				var2750 = var2761
				var2749.universe_id = buffer.tostring(var2760)
			else
				local _ = nil
				local var2762, var2763 = protoModule.readVarInt(p99, var2750)
				var2750 = var2763 + var2762
			end
		elseif var2751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2764, var2765 = protoModule.readFixed32(p99, var2750)
			local _ = var2764
			var2750 = var2765
		elseif var2751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed64(p99, var2750)
			local _ = var2766
			var2750 = var2767
		else
			error("Unsupported wire type: " .. var4026)
		end
	end
	return var2749
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
	local var2768 = t_99.new()
	
	if self.universe_id ~= nil then
		var2768.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2768.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2768.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2768.is_content_locked = self.isContentLocked
	end
	return var2768
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
	local var2768 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2769, var2770 = protoModule.writeTag(buff, var2768, 1, protoModule.wireTypes.lengthDelimited)
		var2769, var4048 = protoModule.writeString(var2769, var2770, self.overview_rich_text)
		buff = var2769
		var2768 = var2770
	end
	if self.result_entry ~= nil then
		local var2771 = self.result_entry:encode()
		local var2772, var2773 = protoModule.writeTag(buff, var2768, 2, protoModule.wireTypes.lengthDelimited)
		var2772, var4051 = protoModule.writeBuffer(var2772, var2773, var2771, buffer.len(var2771))
		buff = var2772
		var2768 = var2773
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2774, var2775 = protoModule.writeTag(buff, var2768, 3, protoModule.wireTypes.lengthDelimited)
			var2774, var4053 = protoModule.writeString(var2774, var2775, v)
			buff = var2774
			var2768 = var2775
		end
	end
	if self.show_loading then
		local var2776, var2777 = protoModule.writeTag(buff, var2768, 4, protoModule.wireTypes.varint)
		var2776, var4055 = protoModule.writeVarInt(var2776, var2777, if self.show_loading then 1 else 0)
		buff = var2776
		var2768 = var2777
	end
	if self.title ~= nil and self.title ~= "" then
		local var2778, var2779 = protoModule.writeTag(buff, var2768, 5, protoModule.wireTypes.lengthDelimited)
		var2778, var4057 = protoModule.writeString(var2778, var2779, self.title)
		buff = var2778
		var2768 = var2779
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2780, var2781 = protoModule.writeTag(buff, var2768, 6, protoModule.wireTypes.lengthDelimited)
		var2780, var4059 = protoModule.writeString(var2780, var2781, self.search_query)
		buff = var2780
		var2768 = var2781
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2782, var2783 = protoModule.writeTag(buff, var2768, 8, protoModule.wireTypes.lengthDelimited)
		var2782, var4061 = protoModule.writeString(var2782, var2783, self.universe_ids)
		buff = var2782
		var2768 = var2783
	end
	local buff_1 = buffer.create(var2768)
	buffer.copy(buff_1, 0, buff, 0, var2768)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2784 = t_100.new()
	local var2785 = 0
	while var2785 < buffer.len(p100) do
		local _ = nil
		local var2786 = nil
		local var2787, var2788, var2789 = protoModule.readTag(p100, var2785)
		local var2790 = var2787
		var2786 = var2788
		var2785 = var2789
		
		if var2786 == protoModule.wireTypes.varint then
			if var2790 == 4 then
				local _ = nil
				local var2791, var2792 = protoModule.readVarInt(p100, var2785)
				var2785 = var2792
				var2784.show_loading = var2791 ~= 0
			else
				local _ = nil
				local var2793, var2794 = protoModule.readVarInt(p100, var2785)
				local _ = var2793
				var2785 = var2794
			end
		end
		if var2786 == protoModule.wireTypes.lengthDelimited then
			if var2790 == 1 then
				local _ = nil
				local var2795, var2796 = protoModule.readBuffer(p100, var2785)
				var2785 = var2796
				var2784.overview_rich_text = buffer.tostring(var2795)
			elseif var2790 == 2 then
				local _ = nil
				local var2797, var2798 = protoModule.readBuffer(p100, var2785)
				var2785 = var2798
				var2784.result_entry = t.FeedEntry.decode(var2797)
			elseif var2790 == 3 then
				local _ = nil
				local var2799, var2800 = protoModule.readBuffer(p100, var2785)
				var2785 = var2800
				table.insert(var2784.follow_up_queries, buffer.tostring(var2799))
			elseif var2790 == 5 then
				local _ = nil
				local var2801, var2802 = protoModule.readBuffer(p100, var2785)
				var2785 = var2802
				var2784.title = buffer.tostring(var2801)
			elseif var2790 == 6 then
				local _ = nil
				local var2803, var2804 = protoModule.readBuffer(p100, var2785)
				var2785 = var2804
				var2784.search_query = buffer.tostring(var2803)
			elseif var2790 == 8 then
				local _ = nil
				local var2805, var2806 = protoModule.readBuffer(p100, var2785)
				var2785 = var2806
				var2784.universe_ids = buffer.tostring(var2805)
			else
				local _ = nil
				local var2807, var2808 = protoModule.readVarInt(p100, var2785)
				var2785 = var2808 + var2807
			end
		elseif var2786 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2809, var2810 = protoModule.readFixed32(p100, var2785)
			local _ = var2809
			var2785 = var2810
		elseif var2786 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2811, var2812 = protoModule.readFixed64(p100, var2785)
			local _ = var2811
			var2785 = var2812
		else
			error("Unsupported wire type: " .. var4065)
		end
	end
	return var2784
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
	local var2813 = t_100.new()
	
	if self.overview_rich_text ~= nil then
		var2813.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2813.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2813.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2813.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2813.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2813.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2813.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2813.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2813.title = self.title
	end
	if self.search_query ~= nil then
		var2813.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2813.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2813.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2813.universe_ids = self.universeIds
	end
	return var2813
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
	local var2814 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2815, var2816 = protoModule.writeTag(buff, var2814, 1, protoModule.wireTypes.lengthDelimited)
		var2815, var4100 = protoModule.writeString(var2815, var2816, self.title)
		buff = var2815
		var2814 = var2816
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2817 = v:encode()
			local var2818, var2819 = protoModule.writeTag(buff, var2814, 2, protoModule.wireTypes.lengthDelimited)
			var2818, var4103 = protoModule.writeBuffer(var2818, var2819, var2817, buffer.len(var2817))
			buff = var2818
			var2814 = var2819
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2820, var2821 = protoModule.writeTag(buff, var2814, 3, protoModule.wireTypes.varint)
		var2820, var4105 = protoModule.writeVarInt(var2820, var2821, self.max_visible_rows)
		buff = var2820
		var2814 = var2821
	end
	if self.sort_id ~= nil then
		local var2822, var2823 = protoModule.writeTag(buff, var2814, 4, protoModule.wireTypes.lengthDelimited)
		var2822, var4107 = protoModule.writeString(var2822, var2823, self.sort_id)
		buff = var2822
		var2814 = var2823
	end
	local buff_1 = buffer.create(var2814)
	buffer.copy(buff_1, 0, buff, 0, var2814)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2824 = t_101.new()
	local var2825 = 0
	while var2825 < buffer.len(p101) do
		local _ = nil
		local var2826 = nil
		local var2827, var2828, var2829 = protoModule.readTag(p101, var2825)
		local var2830 = var2827
		var2826 = var2828
		var2825 = var2829
		
		if var2826 == protoModule.wireTypes.varint then
			if var2830 == 3 then
				local _ = nil
				local var2831, var2832 = protoModule.readVarIntI32(p101, var2825)
				var2825 = var2832
				var2824.max_visible_rows = var2831
			else
				local _ = nil
				local var2833, var2834 = protoModule.readVarInt(p101, var2825)
				local _ = var2833
				var2825 = var2834
			end
		end
		if var2826 == protoModule.wireTypes.lengthDelimited then
			if var2830 == 1 then
				local _ = nil
				local var2835, var2836 = protoModule.readBuffer(p101, var2825)
				var2825 = var2836
				var2824.title = buffer.tostring(var2835)
			elseif var2830 == 2 then
				local _ = nil
				local var2837, var2838 = protoModule.readBuffer(p101, var2825)
				var2825 = var2838
				table.insert(var2824.user_items, t.UserListInputData_UserItem.decode(var2837))
			elseif var2830 == 4 then
				local _ = nil
				local var2839, var2840 = protoModule.readBuffer(p101, var2825)
				var2825 = var2840
				var2824.sort_id = buffer.tostring(var2839)
			else
				local _ = nil
				local var2841, var2842 = protoModule.readVarInt(p101, var2825)
				var2825 = var2842 + var2841
			end
		elseif var2826 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2843, var2844 = protoModule.readFixed32(p101, var2825)
			local _ = var2843
			var2825 = var2844
		elseif var2826 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2845, var2846 = protoModule.readFixed64(p101, var2825)
			local _ = var2845
			var2825 = var2846
		else
			error("Unsupported wire type: " .. var4111)
		end
	end
	return var2824
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
	local var2847 = t_101.new()
	
	if self.title ~= nil then
		var2847.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2847.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2847.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2847.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2847.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2847.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2847.sort_id = self.sortId
	end
	return var2847
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
	local var2848 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2849, var2850 = protoModule.writeTag(buff, var2848, 1, protoModule.wireTypes.lengthDelimited)
		var2849, var4140 = protoModule.writeString(var2849, var2850, self.user_id)
		buff = var2849
		var2848 = var2850
	end
	local buff_1 = buffer.create(var2848)
	buffer.copy(buff_1, 0, buff, 0, var2848)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2848 = t_102.new()
	local var2849 = 0
	while var2849 < buffer.len(p102) do
		local _ = nil
		local var2850 = nil
		local var2851, var2852, var2853 = protoModule.readTag(p102, var2849)
		local var2854 = var2851
		var2850 = var2852
		var2849 = var2853
		
		if var2850 == protoModule.wireTypes.varint then
			local _ = nil
			local var2855, var2856 = protoModule.readVarInt(p102, var2849)
			local _ = var2855
			var2849 = var2856
			continue
		end
		if var2850 == protoModule.wireTypes.lengthDelimited then
			if var2854 == 1 then
				local _ = nil
				local var2857, var2858 = protoModule.readBuffer(p102, var2849)
				var2849 = var2858
				var2848.user_id = buffer.tostring(var2857)
			else
				local _ = nil
				local var2859, var2860 = protoModule.readVarInt(p102, var2849)
				var2849 = var2860 + var2859
			end
		elseif var2850 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2861, var2862 = protoModule.readFixed32(p102, var2849)
			local _ = var2861
			var2849 = var2862
		elseif var2850 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2863, var2864 = protoModule.readFixed64(p102, var2849)
			local _ = var2863
			var2849 = var2864
		else
			error("Unsupported wire type: " .. var4144)
		end
	end
	return var2848
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
	local var2865 = t_102.new()
	
	if self.user_id ~= nil then
		var2865.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2865.user_id = self.userId
	end
	return var2865
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
	local var2865 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2866, var2867 = protoModule.writeTag(buff, var2865, 1, protoModule.wireTypes.lengthDelimited)
		var2866, var4164 = protoModule.writeString(var2866, var2867, self.title)
		buff = var2866
		var2865 = var2867
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2868 = v:encode()
			local var2869, var2870 = protoModule.writeTag(buff, var2865, 2, protoModule.wireTypes.lengthDelimited)
			var2869, var4167 = protoModule.writeBuffer(var2869, var2870, var2868, buffer.len(var2868))
			buff = var2869
			var2865 = var2870
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2871, var2872 = protoModule.writeTag(buff, var2865, 3, protoModule.wireTypes.varint)
		var2871, var4169 = protoModule.writeVarInt(var2871, var2872, self.max_visible_rows)
		buff = var2871
		var2865 = var2872
	end
	if self.sort_id ~= nil then
		local var2873, var2874 = protoModule.writeTag(buff, var2865, 4, protoModule.wireTypes.lengthDelimited)
		var2873, var4171 = protoModule.writeString(var2873, var2874, self.sort_id)
		buff = var2873
		var2865 = var2874
	end
	local buff_1 = buffer.create(var2865)
	buffer.copy(buff_1, 0, buff, 0, var2865)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2875 = t_103.new()
	local var2876 = 0
	while var2876 < buffer.len(p103) do
		local _ = nil
		local var2877 = nil
		local var2878, var2879, var2880 = protoModule.readTag(p103, var2876)
		local var2881 = var2878
		var2877 = var2879
		var2876 = var2880
		
		if var2877 == protoModule.wireTypes.varint then
			if var2881 == 3 then
				local _ = nil
				local var2882, var2883 = protoModule.readVarIntI32(p103, var2876)
				var2876 = var2883
				var2875.max_visible_rows = var2882
			else
				local _ = nil
				local var2884, var2885 = protoModule.readVarInt(p103, var2876)
				local _ = var2884
				var2876 = var2885
			end
		end
		if var2877 == protoModule.wireTypes.lengthDelimited then
			if var2881 == 1 then
				local _ = nil
				local var2886, var2887 = protoModule.readBuffer(p103, var2876)
				var2876 = var2887
				var2875.title = buffer.tostring(var2886)
			elseif var2881 == 2 then
				local _ = nil
				local var2888, var2889 = protoModule.readBuffer(p103, var2876)
				var2876 = var2889
				table.insert(var2875.items, t.CatalogItemListInputData_CatalogItem.decode(var2888))
			elseif var2881 == 4 then
				local _ = nil
				local var2890, var2891 = protoModule.readBuffer(p103, var2876)
				var2876 = var2891
				var2875.sort_id = buffer.tostring(var2890)
			else
				local _ = nil
				local var2892, var2893 = protoModule.readVarInt(p103, var2876)
				var2876 = var2893 + var2892
			end
		elseif var2877 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2894, var2895 = protoModule.readFixed32(p103, var2876)
			local _ = var2894
			var2876 = var2895
		elseif var2877 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2896, var2897 = protoModule.readFixed64(p103, var2876)
			local _ = var2896
			var2876 = var2897
		else
			error("Unsupported wire type: " .. var4175)
		end
	end
	return var2875
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
	local var2898 = t_103.new()
	
	if self.title ~= nil then
		var2898.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2898.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2898.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2898.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2898.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2898.sort_id = self.sortId
	end
	return var2898
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
	local var2899 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2900, var2901 = protoModule.writeTag(buff, var2899, 1, protoModule.wireTypes.lengthDelimited)
		var2900, var4203 = protoModule.writeString(var2900, var2901, self.item_id)
		buff = var2900
		var2899 = var2901
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2902, var2903 = protoModule.writeTag(buff, var2899, 2, protoModule.wireTypes.lengthDelimited)
		var2902, var4205 = protoModule.writeString(var2902, var2903, self.item_type)
		buff = var2902
		var2899 = var2903
	end
	local buff_1 = buffer.create(var2899)
	buffer.copy(buff_1, 0, buff, 0, var2899)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2899 = t_104.new()
	local var2900 = 0
	while var2900 < buffer.len(p104) do
		local _ = nil
		local var2901 = nil
		local var2902, var2903, var2904 = protoModule.readTag(p104, var2900)
		local var2905 = var2902
		var2901 = var2903
		var2900 = var2904
		
		if var2901 == protoModule.wireTypes.varint then
			local _ = nil
			local var2906, var2907 = protoModule.readVarInt(p104, var2900)
			local _ = var2906
			var2900 = var2907
			continue
		end
		if var2901 == protoModule.wireTypes.lengthDelimited then
			if var2905 == 1 then
				local _ = nil
				local var2908, var2909 = protoModule.readBuffer(p104, var2900)
				var2900 = var2909
				var2899.item_id = buffer.tostring(var2908)
			elseif var2905 == 2 then
				local _ = nil
				local var2910, var2911 = protoModule.readBuffer(p104, var2900)
				var2900 = var2911
				var2899.item_type = buffer.tostring(var2910)
			else
				local _ = nil
				local var2912, var2913 = protoModule.readVarInt(p104, var2900)
				var2900 = var2913 + var2912
			end
		elseif var2901 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2914, var2915 = protoModule.readFixed32(p104, var2900)
			local _ = var2914
			var2900 = var2915
		elseif var2901 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2916, var2917 = protoModule.readFixed64(p104, var2900)
			local _ = var2916
			var2900 = var2917
		else
			error("Unsupported wire type: " .. var4209)
		end
	end
	return var2899
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
	local var2918 = t_104.new()
	
	if self.item_id ~= nil then
		var2918.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2918.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2918.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2918.item_type = self.itemType
	end
	return var2918
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
	local var2918 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2919, var2920 = protoModule.writeTag(buff, var2918, 1, protoModule.wireTypes.lengthDelimited)
		var2919, var4231 = protoModule.writeString(var2919, var2920, self.universe_id)
		buff = var2919
		var2918 = var2920
	end
	local buff_1 = buffer.create(var2918)
	buffer.copy(buff_1, 0, buff, 0, var2918)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2918 = t_105.new()
	local var2919 = 0
	while var2919 < buffer.len(p105) do
		local _ = nil
		local var2920 = nil
		local var2921, var2922, var2923 = protoModule.readTag(p105, var2919)
		local var2924 = var2921
		var2920 = var2922
		var2919 = var2923
		
		if var2920 == protoModule.wireTypes.varint then
			local _ = nil
			local var2925, var2926 = protoModule.readVarInt(p105, var2919)
			local _ = var2925
			var2919 = var2926
			continue
		end
		if var2920 == protoModule.wireTypes.lengthDelimited then
			if var2924 == 1 then
				local _ = nil
				local var2927, var2928 = protoModule.readBuffer(p105, var2919)
				var2919 = var2928
				var2918.universe_id = buffer.tostring(var2927)
			else
				local _ = nil
				local var2929, var2930 = protoModule.readVarInt(p105, var2919)
				var2919 = var2930 + var2929
			end
		elseif var2920 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2931, var2932 = protoModule.readFixed32(p105, var2919)
			local _ = var2931
			var2919 = var2932
		elseif var2920 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2933, var2934 = protoModule.readFixed64(p105, var2919)
			local _ = var2933
			var2919 = var2934
		else
			error("Unsupported wire type: " .. var4235)
		end
	end
	return var2918
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
	local var2935 = t_105.new()
	
	if self.universe_id ~= nil then
		var2935.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2935.universe_id = self.universeId
	end
	return var2935
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
	local var2935 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2936, var2937 = protoModule.writeTag(buff, var2935, 1, protoModule.wireTypes.lengthDelimited)
		var2936, var4255 = protoModule.writeString(var2936, var2937, self.title)
		buff = var2936
		var2935 = var2937
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2938, var2939 = protoModule.writeTag(buff, var2935, 2, protoModule.wireTypes.lengthDelimited)
		var2938, var4257 = protoModule.writeString(var2938, var2939, self.subtitle)
		buff = var2938
		var2935 = var2939
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2940 = v:encode()
			local var2941, var2942 = protoModule.writeTag(buff, var2935, 3, protoModule.wireTypes.lengthDelimited)
			var2941, var4260 = protoModule.writeBuffer(var2941, var2942, var2940, buffer.len(var2940))
			buff = var2941
			var2935 = var2942
		end
	end
	local buff_1 = buffer.create(var2935)
	buffer.copy(buff_1, 0, buff, 0, var2935)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2943 = t_106.new()
	local var2944 = 0
	while var2944 < buffer.len(p106) do
		local _ = nil
		local var2945 = nil
		local var2946, var2947, var2948 = protoModule.readTag(p106, var2944)
		local var2949 = var2946
		var2945 = var2947
		var2944 = var2948
		
		if var2945 == protoModule.wireTypes.varint then
			local _ = nil
			local var2950, var2951 = protoModule.readVarInt(p106, var2944)
			local _ = var2950
			var2944 = var2951
			continue
		end
		if var2945 == protoModule.wireTypes.lengthDelimited then
			if var2949 == 1 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p106, var2944)
				var2944 = var2953
				var2943.title = buffer.tostring(var2952)
			elseif var2949 == 2 then
				local _ = nil
				local var2954, var2955 = protoModule.readBuffer(p106, var2944)
				var2944 = var2955
				var2943.subtitle = buffer.tostring(var2954)
			elseif var2949 == 3 then
				local _ = nil
				local var2956, var2957 = protoModule.readBuffer(p106, var2944)
				var2944 = var2957
				table.insert(var2943.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2956))
			else
				local _ = nil
				local var2958, var2959 = protoModule.readVarInt(p106, var2944)
				var2944 = var2959 + var2958
			end
		elseif var2945 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2960, var2961 = protoModule.readFixed32(p106, var2944)
			local _ = var2960
			var2944 = var2961
		elseif var2945 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2962, var2963 = protoModule.readFixed64(p106, var2944)
			local _ = var2962
			var2944 = var2963
		else
			error("Unsupported wire type: " .. var4264)
		end
	end
	return var2943
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
	local var2964 = t_106.new()
	
	if self.title ~= nil then
		var2964.title = self.title
	end
	if self.subtitle ~= nil then
		var2964.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2964.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2964.moment_items = t_1
	end
	return var2964
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
	local var2965 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2966, var2967 = protoModule.writeTag(buff, var2965, 1, protoModule.wireTypes.lengthDelimited)
		var2966, var4291 = protoModule.writeString(var2966, var2967, self.moment_id)
		buff = var2966
		var2965 = var2967
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2968, var2969 = protoModule.writeTag(buff, var2965, 2, protoModule.wireTypes.lengthDelimited)
		var2968, var4293 = protoModule.writeString(var2968, var2969, self.video_asset_id)
		buff = var2968
		var2965 = var2969
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2970, var2971 = protoModule.writeTag(buff, var2965, 3, protoModule.wireTypes.lengthDelimited)
		var2970, var4295 = protoModule.writeString(var2970, var2971, self.target_universe_id)
		buff = var2970
		var2965 = var2971
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2972, var2973 = protoModule.writeTag(buff, var2965, 4, protoModule.wireTypes.lengthDelimited)
		var2972, var4297 = protoModule.writeString(var2972, var2973, self.target_place_id)
		buff = var2972
		var2965 = var2973
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2974, var2975 = protoModule.writeTag(buff, var2965, 5, protoModule.wireTypes.lengthDelimited)
		var2974, var4299 = protoModule.writeString(var2974, var2975, self.feed_item_id)
		buff = var2974
		var2965 = var2975
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2976, var2977 = protoModule.writeTag(buff, var2965, 6, protoModule.wireTypes.lengthDelimited)
		var2976, var4301 = protoModule.writeString(var2976, var2977, self.capture_universe_id)
		buff = var2976
		var2965 = var2977
	end
	local buff_1 = buffer.create(var2965)
	buffer.copy(buff_1, 0, buff, 0, var2965)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2965 = t_107.new()
	local var2966 = 0
	while var2966 < buffer.len(p107) do
		local _ = nil
		local var2967 = nil
		local var2968, var2969, var2970 = protoModule.readTag(p107, var2966)
		local var2971 = var2968
		var2967 = var2969
		var2966 = var2970
		
		if var2967 == protoModule.wireTypes.varint then
			local _ = nil
			local var2972, var2973 = protoModule.readVarInt(p107, var2966)
			local _ = var2972
			var2966 = var2973
			continue
		end
		if var2967 == protoModule.wireTypes.lengthDelimited then
			if var2971 == 1 then
				local _ = nil
				local var2974, var2975 = protoModule.readBuffer(p107, var2966)
				var2966 = var2975
				var2965.moment_id = buffer.tostring(var2974)
			elseif var2971 == 2 then
				local _ = nil
				local var2976, var2977 = protoModule.readBuffer(p107, var2966)
				var2966 = var2977
				var2965.video_asset_id = buffer.tostring(var2976)
			elseif var2971 == 3 then
				local _ = nil
				local var2978, var2979 = protoModule.readBuffer(p107, var2966)
				var2966 = var2979
				var2965.target_universe_id = buffer.tostring(var2978)
			elseif var2971 == 4 then
				local _ = nil
				local var2980, var2981 = protoModule.readBuffer(p107, var2966)
				var2966 = var2981
				var2965.target_place_id = buffer.tostring(var2980)
			elseif var2971 == 5 then
				local _ = nil
				local var2982, var2983 = protoModule.readBuffer(p107, var2966)
				var2966 = var2983
				var2965.feed_item_id = buffer.tostring(var2982)
			elseif var2971 == 6 then
				local _ = nil
				local var2984, var2985 = protoModule.readBuffer(p107, var2966)
				var2966 = var2985
				var2965.capture_universe_id = buffer.tostring(var2984)
			else
				local _ = nil
				local var2986, var2987 = protoModule.readVarInt(p107, var2966)
				var2966 = var2987 + var2986
			end
		elseif var2967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2988, var2989 = protoModule.readFixed32(p107, var2966)
			local _ = var2988
			var2966 = var2989
		elseif var2967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2990, var2991 = protoModule.readFixed64(p107, var2966)
			local _ = var2990
			var2966 = var2991
		else
			error("Unsupported wire type: " .. var4305)
		end
	end
	return var2965
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
	local var2992 = t_107.new()
	
	if self.moment_id ~= nil then
		var2992.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2992.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2992.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2992.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2992.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2992.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2992.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2992.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2992.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2992.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2992.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2992.capture_universe_id = self.captureUniverseId
	end
	return var2992
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
	local var2992 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2993, var2994 = protoModule.writeTag(buff, var2992, 1, protoModule.wireTypes.lengthDelimited)
		var2993, var4335 = protoModule.writeString(var2993, var2994, self.title)
		buff = var2993
		var2992 = var2994
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2995, var2996 = protoModule.writeTag(buff, var2992, 2, protoModule.wireTypes.lengthDelimited)
		var2995, var4337 = protoModule.writeString(var2995, var2996, self.subtitle)
		buff = var2995
		var2992 = var2996
	end
	local buff_1 = buffer.create(var2992)
	buffer.copy(buff_1, 0, buff, 0, var2992)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var2992 = t_108.new()
	local var2993 = 0
	while var2993 < buffer.len(p108) do
		local _ = nil
		local var2994 = nil
		local var2995, var2996, var2997 = protoModule.readTag(p108, var2993)
		local var2998 = var2995
		var2994 = var2996
		var2993 = var2997
		
		if var2994 == protoModule.wireTypes.varint then
			local _ = nil
			local var2999, var3000 = protoModule.readVarInt(p108, var2993)
			local _ = var2999
			var2993 = var3000
			continue
		end
		if var2994 == protoModule.wireTypes.lengthDelimited then
			if var2998 == 1 then
				local _ = nil
				local var3001, var3002 = protoModule.readBuffer(p108, var2993)
				var2993 = var3002
				var2992.title = buffer.tostring(var3001)
			elseif var2998 == 2 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p108, var2993)
				var2993 = var3004
				var2992.subtitle = buffer.tostring(var3003)
			else
				local _ = nil
				local var3005, var3006 = protoModule.readVarInt(p108, var2993)
				var2993 = var3006 + var3005
			end
		elseif var2994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3007, var3008 = protoModule.readFixed32(p108, var2993)
			local _ = var3007
			var2993 = var3008
		elseif var2994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3009, var3010 = protoModule.readFixed64(p108, var2993)
			local _ = var3009
			var2993 = var3010
		else
			error("Unsupported wire type: " .. var4341)
		end
	end
	return var2992
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
	local var3011 = t_108.new()
	
	if self.title ~= nil then
		var3011.title = self.title
	end
	if self.subtitle ~= nil then
		var3011.subtitle = self.subtitle
	end
	return var3011
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
	local var3011 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3012, var3013 = protoModule.writeTag(buff, var3011, 1, protoModule.wireTypes.lengthDelimited)
		var3012, var4363 = protoModule.writeString(var3012, var3013, self.primary_cta_button_text)
		buff = var3012
		var3011 = var3013
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3014, var3015 = protoModule.writeTag(buff, var3011, 2, protoModule.wireTypes.lengthDelimited)
		var3014, var4365 = protoModule.writeString(var3014, var3015, self.secondary_cta_button_text)
		buff = var3014
		var3011 = var3015
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3016, var3017 = protoModule.writeTag(buff, var3011, 3, protoModule.wireTypes.lengthDelimited)
		var3016, var4367 = protoModule.writeString(var3016, var3017, self.primary_cta_type)
		buff = var3016
		var3011 = var3017
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3018, var3019 = protoModule.writeTag(buff, var3011, 4, protoModule.wireTypes.lengthDelimited)
		var3018, var4369 = protoModule.writeString(var3018, var3019, self.secondary_cta_type)
		buff = var3018
		var3011 = var3019
	end
	local buff_1 = buffer.create(var3011)
	buffer.copy(buff_1, 0, buff, 0, var3011)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var3011 = t_109.new()
	local var3012 = 0
	while var3012 < buffer.len(p109) do
		local _ = nil
		local var3013 = nil
		local var3014, var3015, var3016 = protoModule.readTag(p109, var3012)
		local var3017 = var3014
		var3013 = var3015
		var3012 = var3016
		
		if var3013 == protoModule.wireTypes.varint then
			local _ = nil
			local var3018, var3019 = protoModule.readVarInt(p109, var3012)
			local _ = var3018
			var3012 = var3019
			continue
		end
		if var3013 == protoModule.wireTypes.lengthDelimited then
			if var3017 == 1 then
				local _ = nil
				local var3020, var3021 = protoModule.readBuffer(p109, var3012)
				var3012 = var3021
				var3011.primary_cta_button_text = buffer.tostring(var3020)
			elseif var3017 == 2 then
				local _ = nil
				local var3022, var3023 = protoModule.readBuffer(p109, var3012)
				var3012 = var3023
				var3011.secondary_cta_button_text = buffer.tostring(var3022)
			elseif var3017 == 3 then
				local _ = nil
				local var3024, var3025 = protoModule.readBuffer(p109, var3012)
				var3012 = var3025
				var3011.primary_cta_type = buffer.tostring(var3024)
			elseif var3017 == 4 then
				local _ = nil
				local var3026, var3027 = protoModule.readBuffer(p109, var3012)
				var3012 = var3027
				var3011.secondary_cta_type = buffer.tostring(var3026)
			else
				local _ = nil
				local var3028, var3029 = protoModule.readVarInt(p109, var3012)
				var3012 = var3029 + var3028
			end
		elseif var3013 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3030, var3031 = protoModule.readFixed32(p109, var3012)
			local _ = var3030
			var3012 = var3031
		elseif var3013 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3032, var3033 = protoModule.readFixed64(p109, var3012)
			local _ = var3032
			var3012 = var3033
		else
			error("Unsupported wire type: " .. var4373)
		end
	end
	return var3011
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
	local var3034 = t_109.new()
	
	if self.primary_cta_button_text ~= nil then
		var3034.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3034.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3034.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3034.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3034.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3034.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3034.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3034.secondary_cta_type = self.secondaryCtaType
	end
	return var3034
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
	local var3034 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3035, var3036 = protoModule.writeTag(buff, var3034, 1, protoModule.wireTypes.lengthDelimited)
		var3035, var4399 = protoModule.writeString(var3035, var3036, self.image_asset_id)
		buff = var3035
		var3034 = var3036
	end
	local buff_1 = buffer.create(var3034)
	buffer.copy(buff_1, 0, buff, 0, var3034)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3034 = t_110.new()
	local var3035 = 0
	while var3035 < buffer.len(p110) do
		local _ = nil
		local var3036 = nil
		local var3037, var3038, var3039 = protoModule.readTag(p110, var3035)
		local var3040 = var3037
		var3036 = var3038
		var3035 = var3039
		
		if var3036 == protoModule.wireTypes.varint then
			local _ = nil
			local var3041, var3042 = protoModule.readVarInt(p110, var3035)
			local _ = var3041
			var3035 = var3042
			continue
		end
		if var3036 == protoModule.wireTypes.lengthDelimited then
			if var3040 == 1 then
				local _ = nil
				local var3043, var3044 = protoModule.readBuffer(p110, var3035)
				var3035 = var3044
				var3034.image_asset_id = buffer.tostring(var3043)
			else
				local _ = nil
				local var3045, var3046 = protoModule.readVarInt(p110, var3035)
				var3035 = var3046 + var3045
			end
		elseif var3036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3047, var3048 = protoModule.readFixed32(p110, var3035)
			local _ = var3047
			var3035 = var3048
		elseif var3036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3049, var3050 = protoModule.readFixed64(p110, var3035)
			local _ = var3049
			var3035 = var3050
		else
			error("Unsupported wire type: " .. var4403)
		end
	end
	return var3034
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
	local var3051 = t_110.new()
	
	if self.image_asset_id ~= nil then
		var3051.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3051.image_asset_id = self.imageAssetId
	end
	return var3051
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
		loading_image_asset_id = if p111 == nil or p111.loading_image_asset_id == nil then "" else p111.loading_image_asset_id
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3051 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3052, var3053 = protoModule.writeTag(buff, var3051, 1, protoModule.wireTypes.lengthDelimited)
		var3052, var4423 = protoModule.writeString(var3052, var3053, self.video_asset_id)
		buff = var3052
		var3051 = var3053
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3054, var3055 = protoModule.writeTag(buff, var3051, 2, protoModule.wireTypes.lengthDelimited)
		var3054, var4425 = protoModule.writeString(var3054, var3055, self.loading_image_asset_id)
		buff = var3054
		var3051 = var3055
	end
	local buff_1 = buffer.create(var3051)
	buffer.copy(buff_1, 0, buff, 0, var3051)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3051 = t_111.new()
	local var3052 = 0
	while var3052 < buffer.len(p111) do
		local _ = nil
		local var3053 = nil
		local var3054, var3055, var3056 = protoModule.readTag(p111, var3052)
		local var3057 = var3054
		var3053 = var3055
		var3052 = var3056
		
		if var3053 == protoModule.wireTypes.varint then
			local _ = nil
			local var3058, var3059 = protoModule.readVarInt(p111, var3052)
			local _ = var3058
			var3052 = var3059
			continue
		end
		if var3053 == protoModule.wireTypes.lengthDelimited then
			if var3057 == 1 then
				local _ = nil
				local var3060, var3061 = protoModule.readBuffer(p111, var3052)
				var3052 = var3061
				var3051.video_asset_id = buffer.tostring(var3060)
			elseif var3057 == 2 then
				local _ = nil
				local var3062, var3063 = protoModule.readBuffer(p111, var3052)
				var3052 = var3063
				var3051.loading_image_asset_id = buffer.tostring(var3062)
			else
				local _ = nil
				local var3064, var3065 = protoModule.readVarInt(p111, var3052)
				var3052 = var3065 + var3064
			end
		elseif var3053 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3066, var3067 = protoModule.readFixed32(p111, var3052)
			local _ = var3066
			var3052 = var3067
		elseif var3053 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3068, var3069 = protoModule.readFixed64(p111, var3052)
			local _ = var3068
			var3052 = var3069
		else
			error("Unsupported wire type: " .. var4429)
		end
	end
	return var3051
end

function t_111:jsonEncode()
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref)
	local var3070 = t_111.new()
	
	if self.video_asset_id ~= nil then
		var3070.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3070.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3070.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3070.loading_image_asset_id = self.loadingImageAssetId
	end
	return var3070
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
		is_rendered_text = if p112 == nil or p112.is_rendered_text == nil then false else p112.is_rendered_text
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3070 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3071, var3072 = protoModule.writeTag(buff, var3070, 1, protoModule.wireTypes.lengthDelimited)
		var3071, var4451 = protoModule.writeString(var3071, var3072, self.text)
		buff = var3071
		var3070 = var3072
	end
	if self.is_rendered_text then
		local var3073, var3074 = protoModule.writeTag(buff, var3070, 2, protoModule.wireTypes.varint)
		var3073, var4453 = protoModule.writeVarInt(var3073, var3074, if self.is_rendered_text then 1 else 0)
		buff = var3073
		var3070 = var3074
	end
	local buff_1 = buffer.create(var3070)
	buffer.copy(buff_1, 0, buff, 0, var3070)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref)
	local var3070 = t_112.new()
	local var3071 = 0
	while var3071 < buffer.len(p112) do
		local _ = nil
		local var3072 = nil
		local var3073, var3074, var3075 = protoModule.readTag(p112, var3071)
		local var3076 = var3073
		var3072 = var3074
		var3071 = var3075
		
		if var3072 == protoModule.wireTypes.varint then
			if var3076 == 2 then
				local _ = nil
				local var3077, var3078 = protoModule.readVarInt(p112, var3071)
				var3071 = var3078
				var3070.is_rendered_text = var3077 ~= 0
			else
				local _ = nil
				local var3079, var3080 = protoModule.readVarInt(p112, var3071)
				local _ = var3079
				var3071 = var3080
			end
		end
		if var3072 == protoModule.wireTypes.lengthDelimited then
			if var3076 == 1 then
				local _ = nil
				local var3081, var3082 = protoModule.readBuffer(p112, var3071)
				var3071 = var3082
				var3070.text = buffer.tostring(var3081)
			else
				local _ = nil
				local var3083, var3084 = protoModule.readVarInt(p112, var3071)
				var3071 = var3084 + var3083
			end
		elseif var3072 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3085, var3086 = protoModule.readFixed32(p112, var3071)
			local _ = var3085
			var3071 = var3086
		elseif var3072 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3087, var3088 = protoModule.readFixed64(p112, var3071)
			local _ = var3087
			var3071 = var3088
		else
			error("Unsupported wire type: " .. var4457)
		end
	end
	return var3070
end

function t_112:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_112:jsonDecode()
	-- upvalues: t_112 (ref)
	local var3089 = t_112.new()
	
	if self.text ~= nil then
		var3089.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3089.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3089.is_rendered_text = self.isRenderedText
	end
	return var3089
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
	local var3089 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3090, var3091 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3090, var4479 = protoModule.writeString(var3090, var3091, i)
			local var3092 = v:encode()
			var3091, var4481 = protoModule.writeTag(var3090, var3091, 2, protoModule.wireTypes.lengthDelimited)
			var3091, var4481 = protoModule.writeBuffer(var3091, var4481, var3092, buffer.len(var3092))
			local var3093 = var3091
			local var3094 = var4481
			local var3095, var3096 = protoModule.writeTag(buff, var3089, 1, protoModule.wireTypes.lengthDelimited)
			var3095, var4485 = protoModule.writeBuffer(var3095, var3096, var3093, var3094)
			buff = var3095
			var3089 = var3096
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3097, var3098 = protoModule.writeTag(buff, var3089, 2, protoModule.wireTypes.lengthDelimited)
			var3097, var4487 = protoModule.writeString(var3097, var3098, v)
			buff = var3097
			var3089 = var3098
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3099, var3100 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3099, var4489 = protoModule.writeString(var3099, var3100, i)
			local var3101 = v:encode()
			var3100, var4491 = protoModule.writeTag(var3099, var3100, 2, protoModule.wireTypes.lengthDelimited)
			var3100, var4491 = protoModule.writeBuffer(var3100, var4491, var3101, buffer.len(var3101))
			local var3102 = var3100
			local var3103 = var4491
			local var3104, var3105 = protoModule.writeTag(buff, var3089, 3, protoModule.wireTypes.lengthDelimited)
			var3104, var4495 = protoModule.writeBuffer(var3104, var3105, var3102, var3103)
			buff = var3104
			var3089 = var3105
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3106, var3107 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3106, var4497 = protoModule.writeString(var3106, var3107, i)
			local var3108 = v:encode()
			var3107, var4499 = protoModule.writeTag(var3106, var3107, 2, protoModule.wireTypes.lengthDelimited)
			var3107, var4499 = protoModule.writeBuffer(var3107, var4499, var3108, buffer.len(var3108))
			local var3109 = var3107
			local var3110 = var4499
			local var3111, var3112 = protoModule.writeTag(buff, var3089, 4, protoModule.wireTypes.lengthDelimited)
			var3111, var4503 = protoModule.writeBuffer(var3111, var3112, var3109, var3110)
			buff = var3111
			var3089 = var3112
		end
	end
	local buff_1 = buffer.create(var3089)
	buffer.copy(buff_1, 0, buff, 0, var3089)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3113 = t_113.new()
	local var3114 = 0
	while var3114 < buffer.len(p113) do
		local _ = nil
		local var3115 = nil
		local var3116, var3117, var3118 = protoModule.readTag(p113, var3114)
		local var3119 = var3116
		var3115 = var3117
		var3114 = var3118
		
		if var3115 == protoModule.wireTypes.varint then
			local _ = nil
			local var3120, var3121 = protoModule.readVarInt(p113, var3114)
			local _ = var3120
			var3114 = var3121
			continue
		end
		if var3115 == protoModule.wireTypes.lengthDelimited then
			if var3119 == 1 then
				local _ = nil
				local var3122, var3123 = protoModule.readBuffer(p113, var3114)
				var3114 = var3123
				var3122 = t.VerticalFeedInputData_EntryMapEntry.decode(var3122)
				var3113.entry_map[var3122.key or ""] = var3122.value or t.FeedEntry.new()
			elseif var3119 == 2 then
				local _ = nil
				local var3124, var3125 = protoModule.readBuffer(p113, var3114)
				var3114 = var3125
				table.insert(var3113.entry_order, buffer.tostring(var3124))
			elseif var3119 == 3 then
				local _ = nil
				local var3126, var3127 = protoModule.readBuffer(p113, var3114)
				var3114 = var3127
				var3126 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3126)
				var3113.entry_order_map[var3126.key or ""] = var3126.value or t.EntryOrder.new()
			elseif var3119 == 4 then
				local _ = nil
				local var3128, var3129 = protoModule.readBuffer(p113, var3114)
				var3114 = var3129
				var3128 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3128)
				var3113.content_pools[var3128.key or ""] = var3128.value or t.ContentPool.new()
			else
				local _ = nil
				local var3130, var3131 = protoModule.readVarInt(p113, var3114)
				var3114 = var3131 + var3130
			end
		elseif var3115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3132, var3133 = protoModule.readFixed32(p113, var3114)
			local _ = var3132
			var3114 = var3133
		elseif var3115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3134, var3135 = protoModule.readFixed64(p113, var3114)
			local _ = var3134
			var3114 = var3135
		else
			error("Unsupported wire type: " .. var4507)
		end
	end
	return var3113
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
	local var3136 = t_113.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3136.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3136.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3136.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3136.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3136.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3136.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3136.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3136.content_pools = t_1
	end
	return var3136
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
	local var3137 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3138, var3139 = protoModule.writeTag(buff, var3137, 1, protoModule.wireTypes.lengthDelimited)
		var3138, var4545 = protoModule.writeString(var3138, var3139, self.key)
		buff = var3138
		var3137 = var3139
	end
	if self.value ~= nil then
		local var3140 = self.value:encode()
		local var3141, var3142 = protoModule.writeTag(buff, var3137, 2, protoModule.wireTypes.lengthDelimited)
		var3141, var4548 = protoModule.writeBuffer(var3141, var3142, var3140, buffer.len(var3140))
		buff = var3141
		var3137 = var3142
	end
	local buff_1 = buffer.create(var3137)
	buffer.copy(buff_1, 0, buff, 0, var3137)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3137 = t_114.new()
	local var3138 = 0
	while var3138 < buffer.len(p114) do
		local _ = nil
		local var3139 = nil
		local var3140, var3141, var3142 = protoModule.readTag(p114, var3138)
		local var3143 = var3140
		var3139 = var3141
		var3138 = var3142
		
		if var3139 == protoModule.wireTypes.varint then
			local _ = nil
			local var3144, var3145 = protoModule.readVarInt(p114, var3138)
			local _ = var3144
			var3138 = var3145
			continue
		end
		if var3139 == protoModule.wireTypes.lengthDelimited then
			if var3143 == 1 then
				local _ = nil
				local var3146, var3147 = protoModule.readBuffer(p114, var3138)
				var3138 = var3147
				var3137.key = buffer.tostring(var3146)
			elseif var3143 == 2 then
				local _ = nil
				local var3148, var3149 = protoModule.readBuffer(p114, var3138)
				var3138 = var3149
				var3137.value = t.FeedEntry.decode(var3148)
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p114, var3138)
				var3138 = var3151 + var3150
			end
		elseif var3139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3152, var3153 = protoModule.readFixed32(p114, var3138)
			local _ = var3152
			var3138 = var3153
		elseif var3139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3154, var3155 = protoModule.readFixed64(p114, var3138)
			local _ = var3154
			var3138 = var3155
		else
			error("Unsupported wire type: " .. var4552)
		end
	end
	return var3137
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
	local var3156 = t_114.new()
	
	if self.key ~= nil then
		var3156.key = self.key
	end
	if self.value ~= nil then
		var3156.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3156
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
	local var3156 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3157, var3158 = protoModule.writeTag(buff, var3156, 1, protoModule.wireTypes.lengthDelimited)
		var3157, var4574 = protoModule.writeString(var3157, var3158, self.key)
		buff = var3157
		var3156 = var3158
	end
	if self.value ~= nil then
		local var3159 = self.value:encode()
		local var3160, var3161 = protoModule.writeTag(buff, var3156, 2, protoModule.wireTypes.lengthDelimited)
		var3160, var4577 = protoModule.writeBuffer(var3160, var3161, var3159, buffer.len(var3159))
		buff = var3160
		var3156 = var3161
	end
	local buff_1 = buffer.create(var3156)
	buffer.copy(buff_1, 0, buff, 0, var3156)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3156 = t_115.new()
	local var3157 = 0
	while var3157 < buffer.len(p115) do
		local _ = nil
		local var3158 = nil
		local var3159, var3160, var3161 = protoModule.readTag(p115, var3157)
		local var3162 = var3159
		var3158 = var3160
		var3157 = var3161
		
		if var3158 == protoModule.wireTypes.varint then
			local _ = nil
			local var3163, var3164 = protoModule.readVarInt(p115, var3157)
			local _ = var3163
			var3157 = var3164
			continue
		end
		if var3158 == protoModule.wireTypes.lengthDelimited then
			if var3162 == 1 then
				local _ = nil
				local var3165, var3166 = protoModule.readBuffer(p115, var3157)
				var3157 = var3166
				var3156.key = buffer.tostring(var3165)
			elseif var3162 == 2 then
				local _ = nil
				local var3167, var3168 = protoModule.readBuffer(p115, var3157)
				var3157 = var3168
				var3156.value = t.EntryOrder.decode(var3167)
			else
				local _ = nil
				local var3169, var3170 = protoModule.readVarInt(p115, var3157)
				var3157 = var3170 + var3169
			end
		elseif var3158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3171, var3172 = protoModule.readFixed32(p115, var3157)
			local _ = var3171
			var3157 = var3172
		elseif var3158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3173, var3174 = protoModule.readFixed64(p115, var3157)
			local _ = var3173
			var3157 = var3174
		else
			error("Unsupported wire type: " .. var4581)
		end
	end
	return var3156
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
	local var3175 = t_115.new()
	
	if self.key ~= nil then
		var3175.key = self.key
	end
	if self.value ~= nil then
		var3175.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3175
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
	local var3175 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3176, var3177 = protoModule.writeTag(buff, var3175, 1, protoModule.wireTypes.lengthDelimited)
		var3176, var4603 = protoModule.writeString(var3176, var3177, self.key)
		buff = var3176
		var3175 = var3177
	end
	if self.value ~= nil then
		local var3178 = self.value:encode()
		local var3179, var3180 = protoModule.writeTag(buff, var3175, 2, protoModule.wireTypes.lengthDelimited)
		var3179, var4606 = protoModule.writeBuffer(var3179, var3180, var3178, buffer.len(var3178))
		buff = var3179
		var3175 = var3180
	end
	local buff_1 = buffer.create(var3175)
	buffer.copy(buff_1, 0, buff, 0, var3175)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3175 = t_116.new()
	local var3176 = 0
	while var3176 < buffer.len(p116) do
		local _ = nil
		local var3177 = nil
		local var3178, var3179, var3180 = protoModule.readTag(p116, var3176)
		local var3181 = var3178
		var3177 = var3179
		var3176 = var3180
		
		if var3177 == protoModule.wireTypes.varint then
			local _ = nil
			local var3182, var3183 = protoModule.readVarInt(p116, var3176)
			local _ = var3182
			var3176 = var3183
			continue
		end
		if var3177 == protoModule.wireTypes.lengthDelimited then
			if var3181 == 1 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p116, var3176)
				var3176 = var3185
				var3175.key = buffer.tostring(var3184)
			elseif var3181 == 2 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p116, var3176)
				var3176 = var3187
				var3175.value = t.ContentPool.decode(var3186)
			else
				local _ = nil
				local var3188, var3189 = protoModule.readVarInt(p116, var3176)
				var3176 = var3189 + var3188
			end
		elseif var3177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3190, var3191 = protoModule.readFixed32(p116, var3176)
			local _ = var3190
			var3176 = var3191
		elseif var3177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed64(p116, var3176)
			local _ = var3192
			var3176 = var3193
		else
			error("Unsupported wire type: " .. var4610)
		end
	end
	return var3175
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
	local var3194 = t_116.new()
	
	if self.key ~= nil then
		var3194.key = self.key
	end
	if self.value ~= nil then
		var3194.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3194
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
	local var3194 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3195 = self.foreground_header_entry:encode()
		local var3196, var3197 = protoModule.writeTag(buff, var3194, 1, protoModule.wireTypes.lengthDelimited)
		var3196, var4633 = protoModule.writeBuffer(var3196, var3197, var3195, buffer.len(var3195))
		buff = var3196
		var3194 = var3197
	end
	if self.background_header_entry ~= nil then
		local var3198 = self.background_header_entry:encode()
		local var3199, var3200 = protoModule.writeTag(buff, var3194, 2, protoModule.wireTypes.lengthDelimited)
		var3199, var4636 = protoModule.writeBuffer(var3199, var3200, var3198, buffer.len(var3198))
		buff = var3199
		var3194 = var3200
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3201, var3202 = protoModule.writeTag(buff, var3194, 3, protoModule.wireTypes.lengthDelimited)
		var3201, var4638 = protoModule.writeString(var3201, var3202, self.layout_variant)
		buff = var3201
		var3194 = var3202
	end
	local buff_1 = buffer.create(var3194)
	buffer.copy(buff_1, 0, buff, 0, var3194)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3194 = t_117.new()
	local var3195 = 0
	while var3195 < buffer.len(p117) do
		local _ = nil
		local var3196 = nil
		local var3197, var3198, var3199 = protoModule.readTag(p117, var3195)
		local var3200 = var3197
		var3196 = var3198
		var3195 = var3199
		
		if var3196 == protoModule.wireTypes.varint then
			local _ = nil
			local var3201, var3202 = protoModule.readVarInt(p117, var3195)
			local _ = var3201
			var3195 = var3202
			continue
		end
		if var3196 == protoModule.wireTypes.lengthDelimited then
			if var3200 == 1 then
				local _ = nil
				local var3203, var3204 = protoModule.readBuffer(p117, var3195)
				var3195 = var3204
				var3194.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3203)
			elseif var3200 == 2 then
				local _ = nil
				local var3205, var3206 = protoModule.readBuffer(p117, var3195)
				var3195 = var3206
				var3194.background_header_entry = t.BackgroundHeaderEntry.decode(var3205)
			elseif var3200 == 3 then
				local _ = nil
				local var3207, var3208 = protoModule.readBuffer(p117, var3195)
				var3195 = var3208
				var3194.layout_variant = buffer.tostring(var3207)
			else
				local _ = nil
				local var3209, var3210 = protoModule.readVarInt(p117, var3195)
				var3195 = var3210 + var3209
			end
		elseif var3196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3211, var3212 = protoModule.readFixed32(p117, var3195)
			local _ = var3211
			var3195 = var3212
		elseif var3196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3213, var3214 = protoModule.readFixed64(p117, var3195)
			local _ = var3213
			var3195 = var3214
		else
			error("Unsupported wire type: " .. var4642)
		end
	end
	return var3194
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
	local var3215 = t_117.new()
	
	if self.foreground_header_entry ~= nil then
		var3215.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3215.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3215.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3215.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3215.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3215.layout_variant = self.layoutVariant
	end
	return var3215
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
	local var3215 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3216, var3217 = protoModule.writeTag(buff, var3215, 1, protoModule.wireTypes.lengthDelimited)
		var3216, var4666 = protoModule.writeString(var3216, var3217, self.cta_button_text)
		buff = var3216
		var3215 = var3217
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3218, var3219 = protoModule.writeTag(buff, var3215, 2, protoModule.wireTypes.lengthDelimited)
		var3218, var4668 = protoModule.writeString(var3218, var3219, self.cta_type)
		buff = var3218
		var3215 = var3219
	end
	local buff_1 = buffer.create(var3215)
	buffer.copy(buff_1, 0, buff, 0, var3215)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3215 = t_118.new()
	local var3216 = 0
	while var3216 < buffer.len(p118) do
		local _ = nil
		local var3217 = nil
		local var3218, var3219, var3220 = protoModule.readTag(p118, var3216)
		local var3221 = var3218
		var3217 = var3219
		var3216 = var3220
		
		if var3217 == protoModule.wireTypes.varint then
			local _ = nil
			local var3222, var3223 = protoModule.readVarInt(p118, var3216)
			local _ = var3222
			var3216 = var3223
			continue
		end
		if var3217 == protoModule.wireTypes.lengthDelimited then
			if var3221 == 1 then
				local _ = nil
				local var3224, var3225 = protoModule.readBuffer(p118, var3216)
				var3216 = var3225
				var3215.cta_button_text = buffer.tostring(var3224)
			elseif var3221 == 2 then
				local _ = nil
				local var3226, var3227 = protoModule.readBuffer(p118, var3216)
				var3216 = var3227
				var3215.cta_type = buffer.tostring(var3226)
			else
				local _ = nil
				local var3228, var3229 = protoModule.readVarInt(p118, var3216)
				var3216 = var3229 + var3228
			end
		elseif var3217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3230, var3231 = protoModule.readFixed32(p118, var3216)
			local _ = var3230
			var3216 = var3231
		elseif var3217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3232, var3233 = protoModule.readFixed64(p118, var3216)
			local _ = var3232
			var3216 = var3233
		else
			error("Unsupported wire type: " .. var4672)
		end
	end
	return var3215
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
	local var3234 = t_118.new()
	
	if self.cta_button_text ~= nil then
		var3234.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3234.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3234.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3234.cta_type = self.ctaType
	end
	return var3234
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
	local var3234 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3235, var3236 = protoModule.writeTag(buff, var3234, 1, protoModule.wireTypes.lengthDelimited)
		var3235, var4694 = protoModule.writeString(var3235, var3236, self.title)
		buff = var3235
		var3234 = var3236
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3237, var3238 = protoModule.writeTag(buff, var3234, 2, protoModule.wireTypes.lengthDelimited)
		var3237, var4696 = protoModule.writeString(var3237, var3238, self.cta_button_text)
		buff = var3237
		var3234 = var3238
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3239, var3240 = protoModule.writeTag(buff, var3234, 3, protoModule.wireTypes.lengthDelimited)
		var3239, var4698 = protoModule.writeString(var3239, var3240, self.image_asset_id)
		buff = var3239
		var3234 = var3240
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3241, var3242 = protoModule.writeTag(buff, var3234, 4, protoModule.wireTypes.lengthDelimited)
		var3241, var4700 = protoModule.writeString(var3241, var3242, self.cta_type)
		buff = var3241
		var3234 = var3242
	end
	local buff_1 = buffer.create(var3234)
	buffer.copy(buff_1, 0, buff, 0, var3234)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3234 = t_119.new()
	local var3235 = 0
	while var3235 < buffer.len(p119) do
		local _ = nil
		local var3236 = nil
		local var3237, var3238, var3239 = protoModule.readTag(p119, var3235)
		local var3240 = var3237
		var3236 = var3238
		var3235 = var3239
		
		if var3236 == protoModule.wireTypes.varint then
			local _ = nil
			local var3241, var3242 = protoModule.readVarInt(p119, var3235)
			local _ = var3241
			var3235 = var3242
			continue
		end
		if var3236 == protoModule.wireTypes.lengthDelimited then
			if var3240 == 1 then
				local _ = nil
				local var3243, var3244 = protoModule.readBuffer(p119, var3235)
				var3235 = var3244
				var3234.title = buffer.tostring(var3243)
			elseif var3240 == 2 then
				local _ = nil
				local var3245, var3246 = protoModule.readBuffer(p119, var3235)
				var3235 = var3246
				var3234.cta_button_text = buffer.tostring(var3245)
			elseif var3240 == 3 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p119, var3235)
				var3235 = var3248
				var3234.image_asset_id = buffer.tostring(var3247)
			elseif var3240 == 4 then
				local _ = nil
				local var3249, var3250 = protoModule.readBuffer(p119, var3235)
				var3235 = var3250
				var3234.cta_type = buffer.tostring(var3249)
			else
				local _ = nil
				local var3251, var3252 = protoModule.readVarInt(p119, var3235)
				var3235 = var3252 + var3251
			end
		elseif var3236 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3253, var3254 = protoModule.readFixed32(p119, var3235)
			local _ = var3253
			var3235 = var3254
		elseif var3236 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3255, var3256 = protoModule.readFixed64(p119, var3235)
			local _ = var3255
			var3235 = var3256
		else
			error("Unsupported wire type: " .. var4704)
		end
	end
	return var3234
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
	local var3257 = t_119.new()
	
	if self.title ~= nil then
		var3257.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3257.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3257.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3257.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3257.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3257.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3257.cta_type = self.ctaType
	end
	return var3257
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
	local var3257 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3258, var3259 = protoModule.writeTag(buff, var3257, 1, protoModule.wireTypes.lengthDelimited)
		var3258, var4730 = protoModule.writeString(var3258, var3259, self.title)
		buff = var3258
		var3257 = var3259
	end
	if self.url ~= nil then
		local var3260, var3261 = protoModule.writeTag(buff, var3257, 2, protoModule.wireTypes.lengthDelimited)
		var3260, var4732 = protoModule.writeString(var3260, var3261, self.url)
		buff = var3260
		var3257 = var3261
	end
	if self.destination ~= nil then
		local var3262, var3263 = protoModule.writeTag(buff, var3257, 3, protoModule.wireTypes.lengthDelimited)
		var3262, var4734 = protoModule.writeString(var3262, var3263, self.destination)
		buff = var3262
		var3257 = var3263
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3264, var3265 = protoModule.writeTag(buff, var3257, 4, protoModule.wireTypes.lengthDelimited)
		var3264, var4736 = protoModule.writeString(var3264, var3265, self.row_id)
		buff = var3264
		var3257 = var3265
	end
	local buff_1 = buffer.create(var3257)
	buffer.copy(buff_1, 0, buff, 0, var3257)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3257 = t_120.new()
	local var3258 = 0
	while var3258 < buffer.len(p120) do
		local _ = nil
		local var3259 = nil
		local var3260, var3261, var3262 = protoModule.readTag(p120, var3258)
		local var3263 = var3260
		var3259 = var3261
		var3258 = var3262
		
		if var3259 == protoModule.wireTypes.varint then
			local _ = nil
			local var3264, var3265 = protoModule.readVarInt(p120, var3258)
			local _ = var3264
			var3258 = var3265
			continue
		end
		if var3259 == protoModule.wireTypes.lengthDelimited then
			if var3263 == 1 then
				local _ = nil
				local var3266, var3267 = protoModule.readBuffer(p120, var3258)
				var3258 = var3267
				var3257.title = buffer.tostring(var3266)
			elseif var3263 == 2 then
				local _ = nil
				local var3268, var3269 = protoModule.readBuffer(p120, var3258)
				var3258 = var3269
				var3257.url = buffer.tostring(var3268)
			elseif var3263 == 3 then
				local _ = nil
				local var3270, var3271 = protoModule.readBuffer(p120, var3258)
				var3258 = var3271
				var3257.destination = buffer.tostring(var3270)
			elseif var3263 == 4 then
				local _ = nil
				local var3272, var3273 = protoModule.readBuffer(p120, var3258)
				var3258 = var3273
				var3257.row_id = buffer.tostring(var3272)
			else
				local _ = nil
				local var3274, var3275 = protoModule.readVarInt(p120, var3258)
				var3258 = var3275 + var3274
			end
		elseif var3259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3276, var3277 = protoModule.readFixed32(p120, var3258)
			local _ = var3276
			var3258 = var3277
		elseif var3259 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3278, var3279 = protoModule.readFixed64(p120, var3258)
			local _ = var3278
			var3258 = var3279
		else
			error("Unsupported wire type: " .. var4740)
		end
	end
	return var3257
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
	local var3280 = t_120.new()
	
	if self.title ~= nil then
		var3280.title = self.title
	end
	if self.url ~= nil then
		var3280.url = self.url
	end
	if self.destination ~= nil then
		var3280.destination = self.destination
	end
	if self.row_id ~= nil then
		var3280.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3280.row_id = self.rowId
	end
	return var3280
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
	local var3280 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3281, var3282 = protoModule.writeTag(buff, var3280, 1, protoModule.wireTypes.lengthDelimited)
		var3281, var4766 = protoModule.writeString(var3281, var3282, self.setting_key)
		buff = var3281
		var3280 = var3282
	end
	if self.label ~= nil and self.label ~= "" then
		local var3283, var3284 = protoModule.writeTag(buff, var3280, 2, protoModule.wireTypes.lengthDelimited)
		var3283, var4768 = protoModule.writeString(var3283, var3284, self.label)
		buff = var3283
		var3280 = var3284
	end
	if self.description ~= nil and self.description ~= "" then
		local var3285, var3286 = protoModule.writeTag(buff, var3280, 3, protoModule.wireTypes.lengthDelimited)
		var3285, var4770 = protoModule.writeString(var3285, var3286, self.description)
		buff = var3285
		var3280 = var3286
	end
	if self.is_checked then
		local var3287, var3288 = protoModule.writeTag(buff, var3280, 4, protoModule.wireTypes.varint)
		var3287, var4772 = protoModule.writeVarInt(var3287, var3288, if self.is_checked then 1 else 0)
		buff = var3287
		var3280 = var3288
	end
	if self.is_disabled then
		local var3289, var3290 = protoModule.writeTag(buff, var3280, 5, protoModule.wireTypes.varint)
		var3289, var4774 = protoModule.writeVarInt(var3289, var3290, if self.is_disabled then 1 else 0)
		buff = var3289
		var3280 = var3290
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3291, var3292 = protoModule.writeTag(buff, var3280, 6, protoModule.wireTypes.lengthDelimited)
		var3291, var4776 = protoModule.writeString(var3291, var3292, self.audit_data)
		buff = var3291
		var3280 = var3292
	end
	local buff_1 = buffer.create(var3280)
	buffer.copy(buff_1, 0, buff, 0, var3280)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3280 = t_121.new()
	local var3281 = 0
	while var3281 < buffer.len(p121) do
		local _ = nil
		local var3282 = nil
		local var3283, var3284, var3285 = protoModule.readTag(p121, var3281)
		local var3286 = var3283
		var3282 = var3284
		var3281 = var3285
		
		if var3282 == protoModule.wireTypes.varint then
			if var3286 == 4 then
				local _ = nil
				local var3287, var3288 = protoModule.readVarInt(p121, var3281)
				var3281 = var3288
				var3280.is_checked = var3287 ~= 0
			elseif var3286 == 5 then
				local _ = nil
				local var3289, var3290 = protoModule.readVarInt(p121, var3281)
				var3281 = var3290
				var3280.is_disabled = var3289 ~= 0
			else
				local _ = nil
				local var3291, var3292 = protoModule.readVarInt(p121, var3281)
				local _ = var3291
				var3281 = var3292
			end
		end
		if var3282 == protoModule.wireTypes.lengthDelimited then
			if var3286 == 1 then
				local _ = nil
				local var3293, var3294 = protoModule.readBuffer(p121, var3281)
				var3281 = var3294
				var3280.setting_key = buffer.tostring(var3293)
			elseif var3286 == 2 then
				local _ = nil
				local var3295, var3296 = protoModule.readBuffer(p121, var3281)
				var3281 = var3296
				var3280.label = buffer.tostring(var3295)
			elseif var3286 == 3 then
				local _ = nil
				local var3297, var3298 = protoModule.readBuffer(p121, var3281)
				var3281 = var3298
				var3280.description = buffer.tostring(var3297)
			elseif var3286 == 6 then
				local _ = nil
				local var3299, var3300 = protoModule.readBuffer(p121, var3281)
				var3281 = var3300
				var3280.audit_data = buffer.tostring(var3299)
			else
				local _ = nil
				local var3301, var3302 = protoModule.readVarInt(p121, var3281)
				var3281 = var3302 + var3301
			end
		elseif var3282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3303, var3304 = protoModule.readFixed32(p121, var3281)
			local _ = var3303
			var3281 = var3304
		elseif var3282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3305, var3306 = protoModule.readFixed64(p121, var3281)
			local _ = var3305
			var3281 = var3306
		else
			error("Unsupported wire type: " .. var4780)
		end
	end
	return var3280
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
	local var3307 = t_121.new()
	
	if self.setting_key ~= nil then
		var3307.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3307.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3307.label = self.label
	end
	if self.description ~= nil then
		var3307.description = self.description
	end
	if self.is_checked ~= nil then
		var3307.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3307.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3307.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3307.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3307.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3307.audit_data = self.auditData
	end
	return var3307
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
	local var3307 = 0
	
	if self.universe_id ~= nil then
		local var3308, var3309 = protoModule.writeTag(buff, var3307, 1, protoModule.wireTypes.lengthDelimited)
		var3308, var4810 = protoModule.writeString(var3308, var3309, self.universe_id)
		buff = var3308
		var3307 = var3309
	end
	if self.title ~= nil then
		local var3310, var3311 = protoModule.writeTag(buff, var3307, 2, protoModule.wireTypes.lengthDelimited)
		var3310, var4812 = protoModule.writeString(var3310, var3311, self.title)
		buff = var3310
		var3307 = var3311
	end
	if self.subtitle ~= nil then
		local var3312, var3313 = protoModule.writeTag(buff, var3307, 3, protoModule.wireTypes.lengthDelimited)
		var3312, var4814 = protoModule.writeString(var3312, var3313, self.subtitle)
		buff = var3312
		var3307 = var3313
	end
	if self.badge_text ~= nil then
		local var3314, var3315 = protoModule.writeTag(buff, var3307, 4, protoModule.wireTypes.lengthDelimited)
		var3314, var4816 = protoModule.writeString(var3314, var3315, self.badge_text)
		buff = var3314
		var3307 = var3315
	end
	if self.foreground ~= nil then
		local var3316 = self.foreground:encode()
		local var3317, var3318 = protoModule.writeTag(buff, var3307, 5, protoModule.wireTypes.lengthDelimited)
		var3317, var4819 = protoModule.writeBuffer(var3317, var3318, var3316, buffer.len(var3316))
		buff = var3317
		var3307 = var3318
	end
	if self.background ~= nil then
		local var3319 = self.background:encode()
		local var3320, var3321 = protoModule.writeTag(buff, var3307, 6, protoModule.wireTypes.lengthDelimited)
		var3320, var4822 = protoModule.writeBuffer(var3320, var3321, var3319, buffer.len(var3319))
		buff = var3320
		var3307 = var3321
	end
	if self.title_image ~= nil then
		local var3322 = self.title_image:encode()
		local var3323, var3324 = protoModule.writeTag(buff, var3307, 7, protoModule.wireTypes.lengthDelimited)
		var3323, var4825 = protoModule.writeBuffer(var3323, var3324, var3322, buffer.len(var3322))
		buff = var3323
		var3307 = var3324
	end
	if self.asset_title ~= nil then
		local var3325, var3326 = protoModule.writeTag(buff, var3307, 8, protoModule.wireTypes.lengthDelimited)
		var3325, var4827 = protoModule.writeString(var3325, var3326, self.asset_title)
		buff = var3325
		var3307 = var3326
	end
	if self.asset_subtitle ~= nil then
		local var3327, var3328 = protoModule.writeTag(buff, var3307, 9, protoModule.wireTypes.lengthDelimited)
		var3327, var4829 = protoModule.writeString(var3327, var3328, self.asset_subtitle)
		buff = var3327
		var3307 = var3328
	end
	if self.gradient ~= nil then
		local var3329 = self.gradient:encode()
		local var3330, var3331 = protoModule.writeTag(buff, var3307, 10, protoModule.wireTypes.lengthDelimited)
		var3330, var4832 = protoModule.writeBuffer(var3330, var3331, var3329, buffer.len(var3329))
		buff = var3330
		var3307 = var3331
	end
	if self.playable_text ~= nil then
		local var3332, var3333 = protoModule.writeTag(buff, var3307, 11, protoModule.wireTypes.lengthDelimited)
		var3332, var4834 = protoModule.writeString(var3332, var3333, self.playable_text)
		buff = var3332
		var3307 = var3333
	end
	if self.collection_id ~= nil then
		local var3334, var3335 = protoModule.writeTag(buff, var3307, 12, protoModule.wireTypes.lengthDelimited)
		var3334, var4836 = protoModule.writeString(var3334, var3335, self.collection_id)
		buff = var3334
		var3307 = var3335
	end
	if self.campaign_id ~= nil then
		local var3336, var3337 = protoModule.writeTag(buff, var3307, 13, protoModule.wireTypes.lengthDelimited)
		var3336, var4838 = protoModule.writeString(var3336, var3337, self.campaign_id)
		buff = var3336
		var3307 = var3337
	end
	if self.cohort_id ~= nil then
		local var3338, var3339 = protoModule.writeTag(buff, var3307, 14, protoModule.wireTypes.lengthDelimited)
		var3338, var4840 = protoModule.writeString(var3338, var3339, self.cohort_id)
		buff = var3338
		var3307 = var3339
	end
	if self.sort_id ~= nil then
		local var3340, var3341 = protoModule.writeTag(buff, var3307, 15, protoModule.wireTypes.lengthDelimited)
		var3340, var4842 = protoModule.writeString(var3340, var3341, self.sort_id)
		buff = var3340
		var3307 = var3341
	end
	if self.hero_unit_id ~= nil then
		local var3342, var3343 = protoModule.writeTag(buff, var3307, 16, protoModule.wireTypes.lengthDelimited)
		var3342, var4844 = protoModule.writeString(var3342, var3343, self.hero_unit_id)
		buff = var3342
		var3307 = var3343
	end
	if self.analytics_id ~= nil then
		local var3344, var3345 = protoModule.writeTag(buff, var3307, 17, protoModule.wireTypes.lengthDelimited)
		var3344, var4846 = protoModule.writeString(var3344, var3345, self.analytics_id)
		buff = var3344
		var3307 = var3345
	end
	if self.is_sponsored ~= nil then
		local var3346, var3347 = protoModule.writeTag(buff, var3307, 18, protoModule.wireTypes.varint)
		var3346, var4848 = protoModule.writeVarInt(var3346, var3347, if self.is_sponsored then 1 else 0)
		buff = var3346
		var3307 = var3347
	end
	local buff_1 = buffer.create(var3307)
	buffer.copy(buff_1, 0, buff, 0, var3307)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3307 = t_122.new()
	local var3308 = 0
	while var3308 < buffer.len(p122) do
		local _ = nil
		local var3309 = nil
		local var3310, var3311, var3312 = protoModule.readTag(p122, var3308)
		local var3313 = var3310
		var3309 = var3311
		var3308 = var3312
		
		if var3309 == protoModule.wireTypes.varint then
			if var3313 == 18 then
				local _ = nil
				local var3314, var3315 = protoModule.readVarInt(p122, var3308)
				var3308 = var3315
				var3307.is_sponsored = var3314 ~= 0
			else
				local _ = nil
				local var3316, var3317 = protoModule.readVarInt(p122, var3308)
				local _ = var3316
				var3308 = var3317
			end
		end
		if var3309 == protoModule.wireTypes.lengthDelimited then
			if var3313 == 1 then
				local _ = nil
				local var3318, var3319 = protoModule.readBuffer(p122, var3308)
				var3308 = var3319
				var3307.universe_id = buffer.tostring(var3318)
			elseif var3313 == 2 then
				local _ = nil
				local var3320, var3321 = protoModule.readBuffer(p122, var3308)
				var3308 = var3321
				var3307.title = buffer.tostring(var3320)
			elseif var3313 == 3 then
				local _ = nil
				local var3322, var3323 = protoModule.readBuffer(p122, var3308)
				var3308 = var3323
				var3307.subtitle = buffer.tostring(var3322)
			elseif var3313 == 4 then
				local _ = nil
				local var3324, var3325 = protoModule.readBuffer(p122, var3308)
				var3308 = var3325
				var3307.badge_text = buffer.tostring(var3324)
			elseif var3313 == 5 then
				local _ = nil
				local var3326, var3327 = protoModule.readBuffer(p122, var3308)
				var3308 = var3327
				var3307.foreground = t.HeroUnitInputData_VisualAsset.decode(var3326)
			elseif var3313 == 6 then
				local _ = nil
				local var3328, var3329 = protoModule.readBuffer(p122, var3308)
				var3308 = var3329
				var3307.background = t.HeroUnitInputData_VisualAsset.decode(var3328)
			elseif var3313 == 7 then
				local _ = nil
				local var3330, var3331 = protoModule.readBuffer(p122, var3308)
				var3308 = var3331
				var3307.title_image = t.HeroUnitInputData_VisualAsset.decode(var3330)
			elseif var3313 == 8 then
				local _ = nil
				local var3332, var3333 = protoModule.readBuffer(p122, var3308)
				var3308 = var3333
				var3307.asset_title = buffer.tostring(var3332)
			elseif var3313 == 9 then
				local _ = nil
				local var3334, var3335 = protoModule.readBuffer(p122, var3308)
				var3308 = var3335
				var3307.asset_subtitle = buffer.tostring(var3334)
			elseif var3313 == 10 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p122, var3308)
				var3308 = var3337
				var3307.gradient = t.HeroUnitInputData_Gradient.decode(var3336)
			elseif var3313 == 11 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p122, var3308)
				var3308 = var3339
				var3307.playable_text = buffer.tostring(var3338)
			elseif var3313 == 12 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p122, var3308)
				var3308 = var3341
				var3307.collection_id = buffer.tostring(var3340)
			elseif var3313 == 13 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p122, var3308)
				var3308 = var3343
				var3307.campaign_id = buffer.tostring(var3342)
			elseif var3313 == 14 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p122, var3308)
				var3308 = var3345
				var3307.cohort_id = buffer.tostring(var3344)
			elseif var3313 == 15 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p122, var3308)
				var3308 = var3347
				var3307.sort_id = buffer.tostring(var3346)
			elseif var3313 == 16 then
				local _ = nil
				local var3348, var3349 = protoModule.readBuffer(p122, var3308)
				var3308 = var3349
				var3307.hero_unit_id = buffer.tostring(var3348)
			elseif var3313 == 17 then
				local _ = nil
				local var3350, var3351 = protoModule.readBuffer(p122, var3308)
				var3308 = var3351
				var3307.analytics_id = buffer.tostring(var3350)
			else
				local _ = nil
				local var3352, var3353 = protoModule.readVarInt(p122, var3308)
				var3308 = var3353 + var3352
			end
		elseif var3309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3354, var3355 = protoModule.readFixed32(p122, var3308)
			local _ = var3354
			var3308 = var3355
		elseif var3309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3356, var3357 = protoModule.readFixed64(p122, var3308)
			local _ = var3356
			var3308 = var3357
		else
			error("Unsupported wire type: " .. var4852)
		end
	end
	return var3307
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
	local var3358 = t_122.new()
	
	if self.universe_id ~= nil then
		var3358.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3358.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3358.title = self.title
	end
	if self.subtitle ~= nil then
		var3358.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3358.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3358.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3358.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3358.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3358.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3358.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3358.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3358.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3358.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3358.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3358.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3358.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3358.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3358.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3358.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3358.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3358.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3358.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3358.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3358.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3358.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3358.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3358.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3358.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3358.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3358.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3358.is_sponsored = self.isSponsored
	end
	return var3358
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
	local var3358 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3359, var3360 = protoModule.writeTag(buff, var3358, 1, protoModule.wireTypes.lengthDelimited)
		var3359, var4906 = protoModule.writeString(var3359, var3360, self.asset_id)
		buff = var3359
		var3358 = var3360
	end
	if self.aspect_ratio ~= nil then
		local var3361, var3362 = protoModule.writeTag(buff, var3358, 2, protoModule.wireTypes.i64)
		var3361, var4908 = protoModule.writeDouble(var3361, var3362, self.aspect_ratio)
		buff = var3361
		var3358 = var3362
	end
	if self.enable_animation ~= nil then
		local var3363, var3364 = protoModule.writeTag(buff, var3358, 3, protoModule.wireTypes.varint)
		var3363, var4910 = protoModule.writeVarInt(var3363, var3364, if self.enable_animation then 1 else 0)
		buff = var3363
		var3358 = var3364
	end
	local buff_1 = buffer.create(var3358)
	buffer.copy(buff_1, 0, buff, 0, var3358)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3358 = t_123.new()
	local var3359 = 0
	while var3359 < buffer.len(p123) do
		local _ = nil
		local var3360 = nil
		local var3361, var3362, var3363 = protoModule.readTag(p123, var3359)
		local var3364 = var3361
		var3360 = var3362
		var3359 = var3363
		
		if var3360 == protoModule.wireTypes.varint then
			if var3364 == 3 then
				local _ = nil
				local var3365, var3366 = protoModule.readVarInt(p123, var3359)
				var3359 = var3366
				var3358.enable_animation = var3365 ~= 0
			else
				local _ = nil
				local var3367, var3368 = protoModule.readVarInt(p123, var3359)
				local _ = var3367
				var3359 = var3368
			end
		end
		if var3360 == protoModule.wireTypes.lengthDelimited then
			if var3364 == 1 then
				local _ = nil
				local var3369, var3370 = protoModule.readBuffer(p123, var3359)
				var3359 = var3370
				var3358.asset_id = buffer.tostring(var3369)
			else
				local _ = nil
				local var3371, var3372 = protoModule.readVarInt(p123, var3359)
				var3359 = var3372 + var3371
			end
		elseif var3360 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3373, var3374 = protoModule.readFixed32(p123, var3359)
			local _ = var3373
			var3359 = var3374
		elseif var3360 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4914)
		elseif var3364 == 2 then
			local _ = nil
			local var3375, var3376 = protoModule.readDouble(p123, var3359)
			var3359 = var3376
			var3358.aspect_ratio = var3375
		else
			local _ = nil
			local var3377, var3378 = protoModule.readFixed64(p123, var3359)
			local _ = var3377
			var3359 = var3378
		end
	end
	return var3358
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
	local var3379 = t_123.new()
	
	if self.asset_id ~= nil then
		var3379.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3379.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3379.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3379.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3379.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3379.enable_animation = self.enableAnimation
	end
	return var3379
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
	local var3379 = 0
	
	if self.start_color ~= nil then
		local var3380, var3381 = protoModule.writeTag(buff, var3379, 1, protoModule.wireTypes.lengthDelimited)
		var3380, var4938 = protoModule.writeString(var3380, var3381, self.start_color)
		buff = var3380
		var3379 = var3381
	end
	if self.end_color ~= nil then
		local var3382, var3383 = protoModule.writeTag(buff, var3379, 2, protoModule.wireTypes.lengthDelimited)
		var3382, var4940 = protoModule.writeString(var3382, var3383, self.end_color)
		buff = var3382
		var3379 = var3383
	end
	if self.start_opacity ~= nil then
		local var3384, var3385 = protoModule.writeTag(buff, var3379, 3, protoModule.wireTypes.i64)
		var3384, var4942 = protoModule.writeDouble(var3384, var3385, self.start_opacity)
		buff = var3384
		var3379 = var3385
	end
	if self.end_opacity ~= nil then
		local var3386, var3387 = protoModule.writeTag(buff, var3379, 4, protoModule.wireTypes.i64)
		var3386, var4944 = protoModule.writeDouble(var3386, var3387, self.end_opacity)
		buff = var3386
		var3379 = var3387
	end
	if self.degree ~= nil then
		local var3388, var3389 = protoModule.writeTag(buff, var3379, 5, protoModule.wireTypes.i64)
		var3388, var4946 = protoModule.writeDouble(var3388, var3389, self.degree)
		buff = var3388
		var3379 = var3389
	end
	local buff_1 = buffer.create(var3379)
	buffer.copy(buff_1, 0, buff, 0, var3379)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3379 = t_124.new()
	local var3380 = 0
	while var3380 < buffer.len(p124) do
		local _ = nil
		local var3381 = nil
		local var3382, var3383, var3384 = protoModule.readTag(p124, var3380)
		local var3385 = var3382
		var3381 = var3383
		var3380 = var3384
		
		if var3381 == protoModule.wireTypes.varint then
			local _ = nil
			local var3386, var3387 = protoModule.readVarInt(p124, var3380)
			local _ = var3386
			var3380 = var3387
			continue
		end
		if var3381 == protoModule.wireTypes.lengthDelimited then
			if var3385 == 1 then
				local _ = nil
				local var3388, var3389 = protoModule.readBuffer(p124, var3380)
				var3380 = var3389
				var3379.start_color = buffer.tostring(var3388)
			elseif var3385 == 2 then
				local _ = nil
				local var3390, var3391 = protoModule.readBuffer(p124, var3380)
				var3380 = var3391
				var3379.end_color = buffer.tostring(var3390)
			else
				local _ = nil
				local var3392, var3393 = protoModule.readVarInt(p124, var3380)
				var3380 = var3393 + var3392
			end
		elseif var3381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3394, var3395 = protoModule.readFixed32(p124, var3380)
			local _ = var3394
			var3380 = var3395
		elseif var3381 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4950)
		elseif var3385 == 3 then
			local _ = nil
			local var3396, var3397 = protoModule.readDouble(p124, var3380)
			var3380 = var3397
			var3379.start_opacity = var3396
		elseif var3385 == 4 then
			local _ = nil
			local var3398, var3399 = protoModule.readDouble(p124, var3380)
			var3380 = var3399
			var3379.end_opacity = var3398
		elseif var3385 == 5 then
			local _ = nil
			local var3400, var3401 = protoModule.readDouble(p124, var3380)
			var3380 = var3401
			var3379.degree = var3400
		else
			local _ = nil
			local var3402, var3403 = protoModule.readFixed64(p124, var3380)
			local _ = var3402
			var3380 = var3403
		end
	end
	return var3379
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
	local var3404 = t_124.new()
	
	if self.start_color ~= nil then
		var3404.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3404.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3404.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3404.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3404.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3404.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3404.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3404.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3404.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3404
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
	local var3404 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3405 = v:encode()
			local var3406, var3407 = protoModule.writeTag(buff, var3404, 1, protoModule.wireTypes.lengthDelimited)
			var3406, var4979 = protoModule.writeBuffer(var3406, var3407, var3405, buffer.len(var3405))
			buff = var3406
			var3404 = var3407
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3408, var3409 = protoModule.writeTag(buff, var3404, 2, protoModule.wireTypes.lengthDelimited)
		var3408, var4981 = protoModule.writeString(var3408, var3409, self.sort_id)
		buff = var3408
		var3404 = var3409
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3410, var3411 = protoModule.writeTag(buff, var3404, 3, protoModule.wireTypes.lengthDelimited)
		var3410, var4983 = protoModule.writeString(var3410, var3411, self.recommendation_request_id)
		buff = var3410
		var3404 = var3411
	end
	local buff_1 = buffer.create(var3404)
	buffer.copy(buff_1, 0, buff, 0, var3404)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3412 = t_125.new()
	local var3413 = 0
	while var3413 < buffer.len(p125) do
		local _ = nil
		local var3414 = nil
		local var3415, var3416, var3417 = protoModule.readTag(p125, var3413)
		local var3418 = var3415
		var3414 = var3416
		var3413 = var3417
		
		if var3414 == protoModule.wireTypes.varint then
			local _ = nil
			local var3419, var3420 = protoModule.readVarInt(p125, var3413)
			local _ = var3419
			var3413 = var3420
			continue
		end
		if var3414 == protoModule.wireTypes.lengthDelimited then
			if var3418 == 1 then
				local _ = nil
				local var3421, var3422 = protoModule.readBuffer(p125, var3413)
				var3413 = var3422
				table.insert(var3412.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3421))
			elseif var3418 == 2 then
				local _ = nil
				local var3423, var3424 = protoModule.readBuffer(p125, var3413)
				var3413 = var3424
				var3412.sort_id = buffer.tostring(var3423)
			elseif var3418 == 3 then
				local _ = nil
				local var3425, var3426 = protoModule.readBuffer(p125, var3413)
				var3413 = var3426
				var3412.recommendation_request_id = buffer.tostring(var3425)
			else
				local _ = nil
				local var3427, var3428 = protoModule.readVarInt(p125, var3413)
				var3413 = var3428 + var3427
			end
		elseif var3414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3429, var3430 = protoModule.readFixed32(p125, var3413)
			local _ = var3429
			var3413 = var3430
		elseif var3414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3431, var3432 = protoModule.readFixed64(p125, var3413)
			local _ = var3431
			var3413 = var3432
		else
			error("Unsupported wire type: " .. var4987)
		end
	end
	return var3412
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
	local var3433 = t_125.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3433.items = t_1
	end
	if self.sort_id ~= nil then
		var3433.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3433.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3433.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3433.recommendation_request_id = self.recommendationRequestId
	end
	return var3433
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
	local var3434 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3435, var3436 = protoModule.writeTag(buff, var3434, 1, protoModule.wireTypes.lengthDelimited)
		var3435, var5013 = protoModule.writeString(var3435, var3436, self.item_id)
		buff = var3435
		var3434 = var3436
	end
	if self.has_pending_friend_request then
		local var3437, var3438 = protoModule.writeTag(buff, var3434, 2, protoModule.wireTypes.varint)
		var3437, var5015 = protoModule.writeVarInt(var3437, var3438, if self.has_pending_friend_request then 1 else 0)
		buff = var3437
		var3434 = var3438
	end
	local buff_1 = buffer.create(var3434)
	buffer.copy(buff_1, 0, buff, 0, var3434)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3434 = t_126.new()
	local var3435 = 0
	while var3435 < buffer.len(p126) do
		local _ = nil
		local var3436 = nil
		local var3437, var3438, var3439 = protoModule.readTag(p126, var3435)
		local var3440 = var3437
		var3436 = var3438
		var3435 = var3439
		
		if var3436 == protoModule.wireTypes.varint then
			if var3440 == 2 then
				local _ = nil
				local var3441, var3442 = protoModule.readVarInt(p126, var3435)
				var3435 = var3442
				var3434.has_pending_friend_request = var3441 ~= 0
			else
				local _ = nil
				local var3443, var3444 = protoModule.readVarInt(p126, var3435)
				local _ = var3443
				var3435 = var3444
			end
		end
		if var3436 == protoModule.wireTypes.lengthDelimited then
			if var3440 == 1 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p126, var3435)
				var3435 = var3446
				var3434.item_id = buffer.tostring(var3445)
			else
				local _ = nil
				local var3447, var3448 = protoModule.readVarInt(p126, var3435)
				var3435 = var3448 + var3447
			end
		elseif var3436 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3449, var3450 = protoModule.readFixed32(p126, var3435)
			local _ = var3449
			var3435 = var3450
		elseif var3436 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3451, var3452 = protoModule.readFixed64(p126, var3435)
			local _ = var3451
			var3435 = var3452
		else
			error("Unsupported wire type: " .. var5019)
		end
	end
	return var3434
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
	local var3453 = t_126.new()
	
	if self.item_id ~= nil then
		var3453.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3453.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3453.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3453.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3453
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
	local var3453 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3454, var3455 = protoModule.writeTag(buff, var3453, 1, protoModule.wireTypes.lengthDelimited)
		var3454, var5041 = protoModule.writeString(var3454, var3455, self.selected_option)
		buff = var3454
		var3453 = var3455
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3456, var3457 = protoModule.writeTag(buff, var3453, 2, protoModule.wireTypes.lengthDelimited)
		var3456, var5043 = protoModule.writeString(var3456, var3457, self.sort_id)
		buff = var3456
		var3453 = var3457
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3458 = v:encode()
			local var3459, var3460 = protoModule.writeTag(buff, var3453, 3, protoModule.wireTypes.lengthDelimited)
			var3459, var5046 = protoModule.writeBuffer(var3459, var3460, var3458, buffer.len(var3458))
			buff = var3459
			var3453 = var3460
		end
	end
	if self.experience_carousel ~= nil then
		local var3461 = self.experience_carousel:encode()
		local var3462, var3463 = protoModule.writeTag(buff, var3453, 4, protoModule.wireTypes.lengthDelimited)
		var3462, var5049 = protoModule.writeBuffer(var3462, var3463, var3461, buffer.len(var3461))
		buff = var3462
		var3453 = var3463
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3464, var3465 = protoModule.writeTag(buff, var3453, 5, protoModule.wireTypes.lengthDelimited)
		var3464, var5051 = protoModule.writeString(var3464, var3465, self.feed_item_key)
		buff = var3464
		var3453 = var3465
	end
	local buff_1 = buffer.create(var3453)
	buffer.copy(buff_1, 0, buff, 0, var3453)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref)
	local var3466 = t_127.new()
	local var3467 = 0
	while var3467 < buffer.len(p127) do
		local _ = nil
		local var3468 = nil
		local var3469, var3470, var3471 = protoModule.readTag(p127, var3467)
		local var3472 = var3469
		var3468 = var3470
		var3467 = var3471
		
		if var3468 == protoModule.wireTypes.varint then
			local _ = nil
			local var3473, var3474 = protoModule.readVarInt(p127, var3467)
			local _ = var3473
			var3467 = var3474
			continue
		end
		if var3468 == protoModule.wireTypes.lengthDelimited then
			if var3472 == 1 then
				local _ = nil
				local var3475, var3476 = protoModule.readBuffer(p127, var3467)
				var3467 = var3476
				var3466.selected_option = buffer.tostring(var3475)
			elseif var3472 == 2 then
				local _ = nil
				local var3477, var3478 = protoModule.readBuffer(p127, var3467)
				var3467 = var3478
				var3466.sort_id = buffer.tostring(var3477)
			elseif var3472 == 3 then
				local _ = nil
				local var3479, var3480 = protoModule.readBuffer(p127, var3467)
				var3467 = var3480
				table.insert(var3466.options, t.SelectorOption.decode(var3479))
			elseif var3472 == 4 then
				local _ = nil
				local var3481, var3482 = protoModule.readBuffer(p127, var3467)
				var3467 = var3482
				var3466.experience_carousel = t.ExperienceCarouselInputData.decode(var3481)
			elseif var3472 == 5 then
				local _ = nil
				local var3483, var3484 = protoModule.readBuffer(p127, var3467)
				var3467 = var3484
				var3466.feed_item_key = buffer.tostring(var3483)
			else
				local _ = nil
				local var3485, var3486 = protoModule.readVarInt(p127, var3467)
				var3467 = var3486 + var3485
			end
		elseif var3468 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3487, var3488 = protoModule.readFixed32(p127, var3467)
			local _ = var3487
			var3467 = var3488
		elseif var3468 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3489, var3490 = protoModule.readFixed64(p127, var3467)
			local _ = var3489
			var3467 = var3490
		else
			error("Unsupported wire type: " .. var5055)
		end
	end
	return var3466
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
	local var3491 = t_127.new()
	
	if self.selected_option ~= nil then
		var3491.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3491.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3491.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3491.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3491.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3491.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3491.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3491.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3491.feed_item_key = self.feedItemKey
	end
	return var3491
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
	local var3492 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3493, var3494 = protoModule.writeTag(buff, var3492, 1, protoModule.wireTypes.lengthDelimited)
		var3493, var5085 = protoModule.writeString(var3493, var3494, self.id)
		buff = var3493
		var3492 = var3494
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3495, var3496 = protoModule.writeTag(buff, var3492, 2, protoModule.wireTypes.lengthDelimited)
		var3495, var5087 = protoModule.writeString(var3495, var3496, self.display_name)
		buff = var3495
		var3492 = var3496
	end
	if self.is_selected then
		local var3497, var3498 = protoModule.writeTag(buff, var3492, 3, protoModule.wireTypes.varint)
		var3497, var5089 = protoModule.writeVarInt(var3497, var3498, if self.is_selected then 1 else 0)
		buff = var3497
		var3492 = var3498
	end
	local buff_1 = buffer.create(var3492)
	buffer.copy(buff_1, 0, buff, 0, var3492)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3492 = t_128.new()
	local var3493 = 0
	while var3493 < buffer.len(p128) do
		local _ = nil
		local var3494 = nil
		local var3495, var3496, var3497 = protoModule.readTag(p128, var3493)
		local var3498 = var3495
		var3494 = var3496
		var3493 = var3497
		
		if var3494 == protoModule.wireTypes.varint then
			if var3498 == 3 then
				local _ = nil
				local var3499, var3500 = protoModule.readVarInt(p128, var3493)
				var3493 = var3500
				var3492.is_selected = var3499 ~= 0
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p128, var3493)
				local _ = var3501
				var3493 = var3502
			end
		end
		if var3494 == protoModule.wireTypes.lengthDelimited then
			if var3498 == 1 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p128, var3493)
				var3493 = var3504
				var3492.id = buffer.tostring(var3503)
			elseif var3498 == 2 then
				local _ = nil
				local var3505, var3506 = protoModule.readBuffer(p128, var3493)
				var3493 = var3506
				var3492.display_name = buffer.tostring(var3505)
			else
				local _ = nil
				local var3507, var3508 = protoModule.readVarInt(p128, var3493)
				var3493 = var3508 + var3507
			end
		elseif var3494 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3509, var3510 = protoModule.readFixed32(p128, var3493)
			local _ = var3509
			var3493 = var3510
		elseif var3494 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3511, var3512 = protoModule.readFixed64(p128, var3493)
			local _ = var3511
			var3493 = var3512
		else
			error("Unsupported wire type: " .. var5093)
		end
	end
	return var3492
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
	local var3513 = t_128.new()
	
	if self.id ~= nil then
		var3513.id = self.id
	end
	if self.display_name ~= nil then
		var3513.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3513.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3513.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3513.is_selected = self.isSelected
	end
	return var3513
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
	local var3513 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3514 = v:encode()
			local var3515, var3516 = protoModule.writeTag(buff, var3513, 1, protoModule.wireTypes.lengthDelimited)
			var3515, var5118 = protoModule.writeBuffer(var3515, var3516, var3514, buffer.len(var3514))
			buff = var3515
			var3513 = var3516
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3517, var3518 = protoModule.writeTag(buff, var3513, 2, protoModule.wireTypes.lengthDelimited)
		var3517, var5120 = protoModule.writeString(var3517, var3518, self.title)
		buff = var3517
		var3513 = var3518
	end
	if self.sort_id ~= nil then
		local var3519, var3520 = protoModule.writeTag(buff, var3513, 3, protoModule.wireTypes.lengthDelimited)
		var3519, var5122 = protoModule.writeString(var3519, var3520, self.sort_id)
		buff = var3519
		var3513 = var3520
	end
	local buff_1 = buffer.create(var3513)
	buffer.copy(buff_1, 0, buff, 0, var3513)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3521 = t_129.new()
	local var3522 = 0
	while var3522 < buffer.len(p129) do
		local _ = nil
		local var3523 = nil
		local var3524, var3525, var3526 = protoModule.readTag(p129, var3522)
		local var3527 = var3524
		var3523 = var3525
		var3522 = var3526
		
		if var3523 == protoModule.wireTypes.varint then
			local _ = nil
			local var3528, var3529 = protoModule.readVarInt(p129, var3522)
			local _ = var3528
			var3522 = var3529
			continue
		end
		if var3523 == protoModule.wireTypes.lengthDelimited then
			if var3527 == 1 then
				local _ = nil
				local var3530, var3531 = protoModule.readBuffer(p129, var3522)
				var3522 = var3531
				table.insert(var3521.cards, t.GameItemsCardInputData.decode(var3530))
			elseif var3527 == 2 then
				local _ = nil
				local var3532, var3533 = protoModule.readBuffer(p129, var3522)
				var3522 = var3533
				var3521.title = buffer.tostring(var3532)
			elseif var3527 == 3 then
				local _ = nil
				local var3534, var3535 = protoModule.readBuffer(p129, var3522)
				var3522 = var3535
				var3521.sort_id = buffer.tostring(var3534)
			else
				local _ = nil
				local var3536, var3537 = protoModule.readVarInt(p129, var3522)
				var3522 = var3537 + var3536
			end
		elseif var3523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3538, var3539 = protoModule.readFixed32(p129, var3522)
			local _ = var3538
			var3522 = var3539
		elseif var3523 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3540, var3541 = protoModule.readFixed64(p129, var3522)
			local _ = var3540
			var3522 = var3541
		else
			error("Unsupported wire type: " .. var5126)
		end
	end
	return var3521
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
	local var3542 = t_129.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3542.cards = t_1
	end
	if self.title ~= nil then
		var3542.title = self.title
	end
	if self.sort_id ~= nil then
		var3542.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3542.sort_id = self.sortId
	end
	return var3542
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
	local var3543 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3544, var3545 = protoModule.writeTag(buff, var3543, 1, protoModule.wireTypes.lengthDelimited)
		var3544, var5152 = protoModule.writeString(var3544, var3545, self.universe_id)
		buff = var3544
		var3543 = var3545
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3546 = v:encode()
			local var3547, var3548 = protoModule.writeTag(buff, var3543, 2, protoModule.wireTypes.lengthDelimited)
			var3547, var5155 = protoModule.writeBuffer(var3547, var3548, var3546, buffer.len(var3546))
			buff = var3547
			var3543 = var3548
		end
	end
	local buff_1 = buffer.create(var3543)
	buffer.copy(buff_1, 0, buff, 0, var3543)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3549 = t_130.new()
	local var3550 = 0
	while var3550 < buffer.len(p130) do
		local _ = nil
		local var3551 = nil
		local var3552, var3553, var3554 = protoModule.readTag(p130, var3550)
		local var3555 = var3552
		var3551 = var3553
		var3550 = var3554
		
		if var3551 == protoModule.wireTypes.varint then
			local _ = nil
			local var3556, var3557 = protoModule.readVarInt(p130, var3550)
			local _ = var3556
			var3550 = var3557
			continue
		end
		if var3551 == protoModule.wireTypes.lengthDelimited then
			if var3555 == 1 then
				local _ = nil
				local var3558, var3559 = protoModule.readBuffer(p130, var3550)
				var3550 = var3559
				var3549.universe_id = buffer.tostring(var3558)
			elseif var3555 == 2 then
				local _ = nil
				local var3560, var3561 = protoModule.readBuffer(p130, var3550)
				var3550 = var3561
				table.insert(var3549.items, t.GameItemInputData.decode(var3560))
			else
				local _ = nil
				local var3562, var3563 = protoModule.readVarInt(p130, var3550)
				var3550 = var3563 + var3562
			end
		elseif var3551 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3564, var3565 = protoModule.readFixed32(p130, var3550)
			local _ = var3564
			var3550 = var3565
		elseif var3551 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3566, var3567 = protoModule.readFixed64(p130, var3550)
			local _ = var3566
			var3550 = var3567
		else
			error("Unsupported wire type: " .. var5159)
		end
	end
	return var3549
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
	local var3568 = t_130.new()
	
	if self.universe_id ~= nil then
		var3568.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3568.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3568.items = t_1
	end
	return var3568
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
	local var3569 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3570, var3571 = protoModule.writeTag(buff, var3569, 1, protoModule.wireTypes.lengthDelimited)
		var3570, var5183 = protoModule.writeString(var3570, var3571, self.item_id)
		buff = var3570
		var3569 = var3571
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3572, var3573 = protoModule.writeTag(buff, var3569, 2, protoModule.wireTypes.lengthDelimited)
		var3572, var5185 = protoModule.writeString(var3572, var3573, self.item_type)
		buff = var3572
		var3569 = var3573
	end
	local buff_1 = buffer.create(var3569)
	buffer.copy(buff_1, 0, buff, 0, var3569)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3569 = t_131.new()
	local var3570 = 0
	while var3570 < buffer.len(p131) do
		local _ = nil
		local var3571 = nil
		local var3572, var3573, var3574 = protoModule.readTag(p131, var3570)
		local var3575 = var3572
		var3571 = var3573
		var3570 = var3574
		
		if var3571 == protoModule.wireTypes.varint then
			local _ = nil
			local var3576, var3577 = protoModule.readVarInt(p131, var3570)
			local _ = var3576
			var3570 = var3577
			continue
		end
		if var3571 == protoModule.wireTypes.lengthDelimited then
			if var3575 == 1 then
				local _ = nil
				local var3578, var3579 = protoModule.readBuffer(p131, var3570)
				var3570 = var3579
				var3569.item_id = buffer.tostring(var3578)
			elseif var3575 == 2 then
				local _ = nil
				local var3580, var3581 = protoModule.readBuffer(p131, var3570)
				var3570 = var3581
				var3569.item_type = buffer.tostring(var3580)
			else
				local _ = nil
				local var3582, var3583 = protoModule.readVarInt(p131, var3570)
				var3570 = var3583 + var3582
			end
		elseif var3571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3584, var3585 = protoModule.readFixed32(p131, var3570)
			local _ = var3584
			var3570 = var3585
		elseif var3571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3586, var3587 = protoModule.readFixed64(p131, var3570)
			local _ = var3586
			var3570 = var3587
		else
			error("Unsupported wire type: " .. var5189)
		end
	end
	return var3569
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
	local var3588 = t_131.new()
	
	if self.item_id ~= nil then
		var3588.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3588.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3588.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3588.item_type = self.itemType
	end
	return var3588
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
	local var3588 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3589, var3590 = protoModule.writeTag(buff, var3588, 1, protoModule.wireTypes.lengthDelimited)
		var3589, var5211 = protoModule.writeString(var3589, var3590, self.clickout_url)
		buff = var3589
		var3588 = var3590
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3591, var3592 = protoModule.writeTag(buff, var3588, 2, protoModule.wireTypes.lengthDelimited)
		var3591, var5213 = protoModule.writeString(var3591, var3592, self.native_ad_data)
		buff = var3591
		var3588 = var3592
	end
	if self.payer_name ~= nil then
		local var3593, var3594 = protoModule.writeTag(buff, var3588, 3, protoModule.wireTypes.lengthDelimited)
		var3593, var5215 = protoModule.writeString(var3593, var3594, self.payer_name)
		buff = var3593
		var3588 = var3594
	end
	if self.logo_asset_id ~= nil then
		local var3595, var3596 = protoModule.writeTag(buff, var3588, 4, protoModule.wireTypes.lengthDelimited)
		var3595, var5217 = protoModule.writeString(var3595, var3596, self.logo_asset_id)
		buff = var3595
		var3588 = var3596
	end
	if self.logo_aspect_ratio ~= nil then
		local var3597, var3598 = protoModule.writeTag(buff, var3588, 5, protoModule.wireTypes.i64)
		var3597, var5219 = protoModule.writeDouble(var3597, var3598, self.logo_aspect_ratio)
		buff = var3597
		var3588 = var3598
	end
	if self.cta_text ~= nil then
		local var3599, var3600 = protoModule.writeTag(buff, var3588, 6, protoModule.wireTypes.lengthDelimited)
		var3599, var5221 = protoModule.writeString(var3599, var3600, self.cta_text)
		buff = var3599
		var3588 = var3600
	end
	if self.title ~= nil then
		local var3601, var3602 = protoModule.writeTag(buff, var3588, 7, protoModule.wireTypes.lengthDelimited)
		var3601, var5223 = protoModule.writeString(var3601, var3602, self.title)
		buff = var3601
		var3588 = var3602
	end
	if self.subtitle ~= nil then
		local var3603, var3604 = protoModule.writeTag(buff, var3588, 8, protoModule.wireTypes.lengthDelimited)
		var3603, var5225 = protoModule.writeString(var3603, var3604, self.subtitle)
		buff = var3603
		var3588 = var3604
	end
	if self.image_asset_id ~= nil then
		local var3605, var3606 = protoModule.writeTag(buff, var3588, 9, protoModule.wireTypes.lengthDelimited)
		var3605, var5227 = protoModule.writeString(var3605, var3606, self.image_asset_id)
		buff = var3605
		var3588 = var3606
	end
	if self.video_asset_id ~= nil then
		local var3607, var3608 = protoModule.writeTag(buff, var3588, 10, protoModule.wireTypes.lengthDelimited)
		var3607, var5229 = protoModule.writeString(var3607, var3608, self.video_asset_id)
		buff = var3607
		var3588 = var3608
	end
	if self.badge_text ~= nil then
		local var3609, var3610 = protoModule.writeTag(buff, var3588, 11, protoModule.wireTypes.lengthDelimited)
		var3609, var5231 = protoModule.writeString(var3609, var3610, self.badge_text)
		buff = var3609
		var3588 = var3610
	end
	if self.badge_analytics_id ~= nil then
		local var3611, var3612 = protoModule.writeTag(buff, var3588, 12, protoModule.wireTypes.lengthDelimited)
		var3611, var5233 = protoModule.writeString(var3611, var3612, self.badge_analytics_id)
		buff = var3611
		var3588 = var3612
	end
	if self.roblox_component ~= nil then
		local var3613, var3614 = protoModule.writeTag(buff, var3588, 13, protoModule.wireTypes.lengthDelimited)
		var3613, var5235 = protoModule.writeString(var3613, var3614, self.roblox_component)
		buff = var3613
		var3588 = var3614
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3615, var3616 = protoModule.writeTag(buff, var3588, 14, protoModule.wireTypes.lengthDelimited)
		var3615, var5237 = protoModule.writeString(var3615, var3616, self.attribution_thumbnail_asset_id)
		buff = var3615
		var3588 = var3616
	end
	local buff_1 = buffer.create(var3588)
	buffer.copy(buff_1, 0, buff, 0, var3588)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3588 = t_132.new()
	local var3589 = 0
	while var3589 < buffer.len(p132) do
		local _ = nil
		local var3590 = nil
		local var3591, var3592, var3593 = protoModule.readTag(p132, var3589)
		local var3594 = var3591
		var3590 = var3592
		var3589 = var3593
		
		if var3590 == protoModule.wireTypes.varint then
			local _ = nil
			local var3595, var3596 = protoModule.readVarInt(p132, var3589)
			local _ = var3595
			var3589 = var3596
			continue
		end
		if var3590 == protoModule.wireTypes.lengthDelimited then
			if var3594 == 1 then
				local _ = nil
				local var3597, var3598 = protoModule.readBuffer(p132, var3589)
				var3589 = var3598
				var3588.clickout_url = buffer.tostring(var3597)
			elseif var3594 == 2 then
				local _ = nil
				local var3599, var3600 = protoModule.readBuffer(p132, var3589)
				var3589 = var3600
				var3588.native_ad_data = buffer.tostring(var3599)
			elseif var3594 == 3 then
				local _ = nil
				local var3601, var3602 = protoModule.readBuffer(p132, var3589)
				var3589 = var3602
				var3588.payer_name = buffer.tostring(var3601)
			elseif var3594 == 4 then
				local _ = nil
				local var3603, var3604 = protoModule.readBuffer(p132, var3589)
				var3589 = var3604
				var3588.logo_asset_id = buffer.tostring(var3603)
			elseif var3594 == 6 then
				local _ = nil
				local var3605, var3606 = protoModule.readBuffer(p132, var3589)
				var3589 = var3606
				var3588.cta_text = buffer.tostring(var3605)
			elseif var3594 == 7 then
				local _ = nil
				local var3607, var3608 = protoModule.readBuffer(p132, var3589)
				var3589 = var3608
				var3588.title = buffer.tostring(var3607)
			elseif var3594 == 8 then
				local _ = nil
				local var3609, var3610 = protoModule.readBuffer(p132, var3589)
				var3589 = var3610
				var3588.subtitle = buffer.tostring(var3609)
			elseif var3594 == 9 then
				local _ = nil
				local var3611, var3612 = protoModule.readBuffer(p132, var3589)
				var3589 = var3612
				var3588.image_asset_id = buffer.tostring(var3611)
			elseif var3594 == 10 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p132, var3589)
				var3589 = var3614
				var3588.video_asset_id = buffer.tostring(var3613)
			elseif var3594 == 11 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p132, var3589)
				var3589 = var3616
				var3588.badge_text = buffer.tostring(var3615)
			elseif var3594 == 12 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p132, var3589)
				var3589 = var3618
				var3588.badge_analytics_id = buffer.tostring(var3617)
			elseif var3594 == 13 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p132, var3589)
				var3589 = var3620
				var3588.roblox_component = buffer.tostring(var3619)
			elseif var3594 == 14 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p132, var3589)
				var3589 = var3622
				var3588.attribution_thumbnail_asset_id = buffer.tostring(var3621)
			else
				local _ = nil
				local var3623, var3624 = protoModule.readVarInt(p132, var3589)
				var3589 = var3624 + var3623
			end
		elseif var3590 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3625, var3626 = protoModule.readFixed32(p132, var3589)
			local _ = var3625
			var3589 = var3626
		elseif var3590 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5241)
		elseif var3594 == 5 then
			local _ = nil
			local var3627, var3628 = protoModule.readDouble(p132, var3589)
			var3589 = var3628
			var3588.logo_aspect_ratio = var3627
		else
			local _ = nil
			local var3629, var3630 = protoModule.readFixed64(p132, var3589)
			local _ = var3629
			var3589 = var3630
		end
	end
	return var3588
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
	local var3631 = t_132.new()
	
	if self.clickout_url ~= nil then
		var3631.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3631.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3631.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3631.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3631.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3631.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3631.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3631.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3631.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3631.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3631.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3631.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3631.title = self.title
	end
	if self.subtitle ~= nil then
		var3631.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3631.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3631.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3631.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3631.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3631.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3631.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3631.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3631.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3631.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3631.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3631.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3631.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3631
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
	local var3631 = 0
	
	if self.layout ~= nil then
		local var3632 = self.layout:encode()
		local var3633, var3634 = protoModule.writeTag(buff, var3631, 1, protoModule.wireTypes.lengthDelimited)
		var3633, var5288 = protoModule.writeBuffer(var3633, var3634, var3632, buffer.len(var3632))
		buff = var3633
		var3631 = var3634
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3635 = self.kind.value:encode()
			local var3636, var3637 = protoModule.writeTag(buff, var3631, 2, protoModule.wireTypes.lengthDelimited)
			var3636, var5291 = protoModule.writeBuffer(var3636, var3637, var3635, buffer.len(var3635))
			buff = var3636
			var3631 = var3637
		elseif self.kind.type == "ad_link" then
			local var3638 = self.kind.value:encode()
			local var3639, var3640 = protoModule.writeTag(buff, var3631, 3, protoModule.wireTypes.lengthDelimited)
			var3639, var5294 = protoModule.writeBuffer(var3639, var3640, var3638, buffer.len(var3638))
			buff = var3639
			var3631 = var3640
		end
	end
	local buff_1 = buffer.create(var3631)
	buffer.copy(buff_1, 0, buff, 0, var3631)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), t (ref)
	local var3631 = t_133.new()
	local var3632 = 0
	while var3632 < buffer.len(p133) do
		local _ = nil
		local var3633 = nil
		local var3634, var3635, var3636 = protoModule.readTag(p133, var3632)
		local var3637 = var3634
		var3633 = var3635
		var3632 = var3636
		
		if var3633 == protoModule.wireTypes.varint then
			local _ = nil
			local var3638, var3639 = protoModule.readVarInt(p133, var3632)
			local _ = var3638
			var3632 = var3639
			continue
		end
		if var3633 == protoModule.wireTypes.lengthDelimited then
			if var3637 == 1 then
				local _ = nil
				local var3640, var3641 = protoModule.readBuffer(p133, var3632)
				var3632 = var3641
				var3631.layout = t.ItemLayout.decode(var3640)
			elseif var3637 == 2 then
				local _ = nil
				local var3642, var3643 = protoModule.readBuffer(p133, var3632)
				var3632 = var3643
				var3631.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3642)
				}
			elseif var3637 == 3 then
				local _ = nil
				local var3644, var3645 = protoModule.readBuffer(p133, var3632)
				var3632 = var3645
				var3631.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3644) }
			else
				local _ = nil
				local var3646, var3647 = protoModule.readVarInt(p133, var3632)
				var3632 = var3647 + var3646
			end
		elseif var3633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3648, var3649 = protoModule.readFixed32(p133, var3632)
			local _ = var3648
			var3632 = var3649
		elseif var3633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3650, var3651 = protoModule.readFixed64(p133, var3632)
			local _ = var3650
			var3632 = var3651
		else
			error("Unsupported wire type: " .. var5298)
		end
	end
	return var3631
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
	local var3652 = t_133.new()
	
	if self.layout ~= nil then
		var3652.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3652.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3652.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3652.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3652
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
	local var3652 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3653 = v:encode()
			local var3654, var3655 = protoModule.writeTag(buff, var3652, 1, protoModule.wireTypes.lengthDelimited)
			var3654, var5323 = protoModule.writeBuffer(var3654, var3655, var3653, buffer.len(var3653))
			buff = var3654
			var3652 = var3655
		end
	end
	if self.collection_item_size ~= nil then
		local var3656, var3657 = protoModule.writeTag(buff, var3652, 2, protoModule.wireTypes.lengthDelimited)
		var3656, var5325 = protoModule.writeString(var3656, var3657, self.collection_item_size)
		buff = var3656
		var3652 = var3657
	end
	local buff_1 = buffer.create(var3652)
	buffer.copy(buff_1, 0, buff, 0, var3652)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var3658 = t_134.new()
	local var3659 = 0
	while var3659 < buffer.len(p134) do
		local _ = nil
		local var3660 = nil
		local var3661, var3662, var3663 = protoModule.readTag(p134, var3659)
		local var3664 = var3661
		var3660 = var3662
		var3659 = var3663
		
		if var3660 == protoModule.wireTypes.varint then
			local _ = nil
			local var3665, var3666 = protoModule.readVarInt(p134, var3659)
			local _ = var3665
			var3659 = var3666
			continue
		end
		if var3660 == protoModule.wireTypes.lengthDelimited then
			if var3664 == 1 then
				local _ = nil
				local var3667, var3668 = protoModule.readBuffer(p134, var3659)
				var3659 = var3668
				table.insert(var3658.items, t.ItemWithLayout.decode(var3667))
			elseif var3664 == 2 then
				local _ = nil
				local var3669, var3670 = protoModule.readBuffer(p134, var3659)
				var3659 = var3670
				var3658.collection_item_size = buffer.tostring(var3669)
			else
				local _ = nil
				local var3671, var3672 = protoModule.readVarInt(p134, var3659)
				var3659 = var3672 + var3671
			end
		elseif var3660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3673, var3674 = protoModule.readFixed32(p134, var3659)
			local _ = var3673
			var3659 = var3674
		elseif var3660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3675, var3676 = protoModule.readFixed64(p134, var3659)
			local _ = var3675
			var3659 = var3676
		else
			error("Unsupported wire type: " .. var5329)
		end
	end
	return var3658
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
	local var3677 = t_134.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3677.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3677.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3677.collection_item_size = self.collectionItemSize
	end
	return var3677
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
	local var3678 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3679, var3680 = protoModule.writeTag(buff, var3678, 1, protoModule.wireTypes.varint)
		var3679, var5353 = protoModule.writeVarInt(var3679, var3680, self.col_span)
		buff = var3679
		var3678 = var3680
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3681, var3682 = protoModule.writeTag(buff, var3678, 2, protoModule.wireTypes.varint)
		var3681, var5355 = protoModule.writeVarInt(var3681, var3682, self.row_span)
		buff = var3681
		var3678 = var3682
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3683, var3684 = protoModule.writeTag(buff, var3678, 3, protoModule.wireTypes.lengthDelimited)
		var3683, var5357 = protoModule.writeString(var3683, var3684, self.alignment_type)
		buff = var3683
		var3678 = var3684
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3685, var3686 = protoModule.writeTag(buff, var3678, 4, protoModule.wireTypes.varint)
		var3685, var5359 = protoModule.writeVarInt(var3685, var3686, self.min_row_padding)
		buff = var3685
		var3678 = var3686
	end
	local buff_1 = buffer.create(var3678)
	buffer.copy(buff_1, 0, buff, 0, var3678)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref)
	local var3678 = t_135.new()
	local var3679 = 0
	while var3679 < buffer.len(p135) do
		local _ = nil
		local var3680 = nil
		local var3681, var3682, var3683 = protoModule.readTag(p135, var3679)
		local var3684 = var3681
		var3680 = var3682
		var3679 = var3683
		
		if var3680 == protoModule.wireTypes.varint then
			if var3684 == 1 then
				local _ = nil
				local var3685, var3686 = protoModule.readVarIntI32(p135, var3679)
				var3679 = var3686
				var3678.col_span = var3685
			elseif var3684 == 2 then
				local _ = nil
				local var3687, var3688 = protoModule.readVarIntI32(p135, var3679)
				var3679 = var3688
				var3678.row_span = var3687
			elseif var3684 == 4 then
				local _ = nil
				local var3689, var3690 = protoModule.readVarIntI32(p135, var3679)
				var3679 = var3690
				var3678.min_row_padding = var3689
			else
				local _ = nil
				local var3691, var3692 = protoModule.readVarInt(p135, var3679)
				local _ = var3691
				var3679 = var3692
			end
		end
		if var3680 == protoModule.wireTypes.lengthDelimited then
			if var3684 == 3 then
				local _ = nil
				local var3693, var3694 = protoModule.readBuffer(p135, var3679)
				var3679 = var3694
				var3678.alignment_type = buffer.tostring(var3693)
			else
				local _ = nil
				local var3695, var3696 = protoModule.readVarInt(p135, var3679)
				var3679 = var3696 + var3695
			end
		elseif var3680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3697, var3698 = protoModule.readFixed32(p135, var3679)
			local _ = var3697
			var3679 = var3698
		elseif var3680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3699, var3700 = protoModule.readFixed64(p135, var3679)
			local _ = var3699
			var3679 = var3700
		else
			error("Unsupported wire type: " .. var5363)
		end
	end
	return var3678
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
	local var3701 = t_135.new()
	
	if self.col_span ~= nil then
		var3701.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3701.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3701.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3701.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3701.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3701.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3701.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3701.min_row_padding = self.minRowPadding
	end
	return var3701
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
	local var3701 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3702, var3703 = protoModule.writeTag(buff, var3701, 1, protoModule.wireTypes.lengthDelimited)
		var3702, var5389 = protoModule.writeString(var3702, var3703, self.community_id)
		buff = var3702
		var3701 = var3703
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3704, var3705 = protoModule.writeTag(buff, var3701, 2, protoModule.wireTypes.lengthDelimited)
		var3704, var5391 = protoModule.writeString(var3704, var3705, self.announcement_id)
		buff = var3704
		var3701 = var3705
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3706, var3707 = protoModule.writeTag(buff, var3701, 3, protoModule.wireTypes.lengthDelimited)
		var3706, var5393 = protoModule.writeString(var3706, var3707, self.message_id)
		buff = var3706
		var3701 = var3707
	end
	if self.title ~= nil and self.title ~= "" then
		local var3708, var3709 = protoModule.writeTag(buff, var3701, 4, protoModule.wireTypes.lengthDelimited)
		var3708, var5395 = protoModule.writeString(var3708, var3709, self.title)
		buff = var3708
		var3701 = var3709
	end
	if self.body ~= nil and self.body ~= "" then
		local var3710, var3711 = protoModule.writeTag(buff, var3701, 5, protoModule.wireTypes.lengthDelimited)
		var3710, var5397 = protoModule.writeString(var3710, var3711, self.body)
		buff = var3710
		var3701 = var3711
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3712, var3713 = protoModule.writeTag(buff, var3701, 6, protoModule.wireTypes.lengthDelimited)
		var3712, var5399 = protoModule.writeString(var3712, var3713, self.creator_key)
		buff = var3712
		var3701 = var3713
	end
	if self.creator_role_name ~= nil then
		local var3714, var3715 = protoModule.writeTag(buff, var3701, 7, protoModule.wireTypes.lengthDelimited)
		var3714, var5401 = protoModule.writeString(var3714, var3715, self.creator_role_name)
		buff = var3714
		var3701 = var3715
	end
	if self.media_asset_id ~= nil then
		local var3716, var3717 = protoModule.writeTag(buff, var3701, 8, protoModule.wireTypes.lengthDelimited)
		var3716, var5403 = protoModule.writeString(var3716, var3717, self.media_asset_id)
		buff = var3716
		var3701 = var3717
	end
	if self.created_time ~= nil then
		local var3718 = self.created_time:encode()
		local var3719, var3720 = protoModule.writeTag(buff, var3701, 9, protoModule.wireTypes.lengthDelimited)
		var3719, var5406 = protoModule.writeBuffer(var3719, var3720, var3718, buffer.len(var3718))
		buff = var3719
		var3701 = var3720
	end
	local buff_1 = buffer.create(var3701)
	buffer.copy(buff_1, 0, buff, 0, var3701)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), timestampModule (ref)
	local var3701 = t_136.new()
	local var3702 = 0
	while var3702 < buffer.len(p136) do
		local _ = nil
		local var3703 = nil
		local var3704, var3705, var3706 = protoModule.readTag(p136, var3702)
		local var3707 = var3704
		var3703 = var3705
		var3702 = var3706
		
		if var3703 == protoModule.wireTypes.varint then
			local _ = nil
			local var3708, var3709 = protoModule.readVarInt(p136, var3702)
			local _ = var3708
			var3702 = var3709
			continue
		end
		if var3703 == protoModule.wireTypes.lengthDelimited then
			if var3707 == 1 then
				local _ = nil
				local var3710, var3711 = protoModule.readBuffer(p136, var3702)
				var3702 = var3711
				var3701.community_id = buffer.tostring(var3710)
			elseif var3707 == 2 then
				local _ = nil
				local var3712, var3713 = protoModule.readBuffer(p136, var3702)
				var3702 = var3713
				var3701.announcement_id = buffer.tostring(var3712)
			elseif var3707 == 3 then
				local _ = nil
				local var3714, var3715 = protoModule.readBuffer(p136, var3702)
				var3702 = var3715
				var3701.message_id = buffer.tostring(var3714)
			elseif var3707 == 4 then
				local _ = nil
				local var3716, var3717 = protoModule.readBuffer(p136, var3702)
				var3702 = var3717
				var3701.title = buffer.tostring(var3716)
			elseif var3707 == 5 then
				local _ = nil
				local var3718, var3719 = protoModule.readBuffer(p136, var3702)
				var3702 = var3719
				var3701.body = buffer.tostring(var3718)
			elseif var3707 == 6 then
				local _ = nil
				local var3720, var3721 = protoModule.readBuffer(p136, var3702)
				var3702 = var3721
				var3701.creator_key = buffer.tostring(var3720)
			elseif var3707 == 7 then
				local _ = nil
				local var3722, var3723 = protoModule.readBuffer(p136, var3702)
				var3702 = var3723
				var3701.creator_role_name = buffer.tostring(var3722)
			elseif var3707 == 8 then
				local _ = nil
				local var3724, var3725 = protoModule.readBuffer(p136, var3702)
				var3702 = var3725
				var3701.media_asset_id = buffer.tostring(var3724)
			elseif var3707 == 9 then
				local _ = nil
				local var3726, var3727 = protoModule.readBuffer(p136, var3702)
				var3702 = var3727
				var3701.created_time = timestampModule.Timestamp.decode(var3726)
			else
				local _ = nil
				local var3728, var3729 = protoModule.readVarInt(p136, var3702)
				var3702 = var3729 + var3728
			end
		elseif var3703 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3730, var3731 = protoModule.readFixed32(p136, var3702)
			local _ = var3730
			var3702 = var3731
		elseif var3703 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3732, var3733 = protoModule.readFixed64(p136, var3702)
			local _ = var3732
			var3702 = var3733
		else
			error("Unsupported wire type: " .. var5410)
		end
	end
	return var3701
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
	local var3734 = t_136.new()
	
	if self.community_id ~= nil then
		var3734.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3734.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3734.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3734.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3734.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3734.message_id = self.messageId
	end
	if self.title ~= nil then
		var3734.title = self.title
	end
	if self.body ~= nil then
		var3734.body = self.body
	end
	if self.creator_key ~= nil then
		var3734.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3734.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3734.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3734.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3734.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3734.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3734.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3734.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3734
end

t_136.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_136
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p137)
		return if p137 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p137 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p137)
		return if p137 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p137 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p137
	end,
	fromName = function(p137)
		return if p137 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p137 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	PageEntryFormat = t.PageEntryFormat
}